from collections import namedtuple
import sys
import os
from sympy import re
import tvm
import numpy as np

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../script-link')))

from compare import parse_instr, parse_symb, compare_results, print_compare_results, print_summary
import subprocess
import json
import tempfile
from abc import ABC, abstractmethod
from time import sleep, perf_counter_ns
import csv
import numpy as np
import re
from statistics import stdev, mean
import gc

from benchmark import BenchSpec
from benchmark_adhoc import *


def get_symb_overhead(bench:BenchSpec):
    input = bench.get_input_shape()
    kernel_llvm_path = bench.get_kernel_llvm_path()
    if not os.path.exists(kernel_llvm_path):
        if not os.path.exists(bench.get_directory()):
            os.makedirs(bench.get_directory())
        bench.generate_kernel()

    symb_input_file = tempfile.NamedTemporaryFile(mode="w+", delete=False, suffix=".json")
    symb_input_path = symb_input_file.name

    with open(symb_input_path, "w") as f:
        json.dump(input, f)

    kernel_base_name = os.path.splitext(os.path.basename(kernel_llvm_path))[0]
    func_name = kernel_base_name + "_compute_"
    result = subprocess.run(
        ['symb-viewer', 'formula', kernel_llvm_path, func_name, f'-subs={symb_input_path}', '--quiet', '--time'],
        check=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.DEVNULL,
        text=True
    )
    # Updated parsing for ms-based symb-viewer timing output
    timing = {}
    for line in result.stdout.splitlines():
        m = re.match(r'\s*([A-Za-z ]+):\s*([0-9.eE+-]+)ms', line)
        if m:
            key = m.group(1).strip().lower().replace(' ', '_')
            val = float(m.group(2))
            timing[key] = val
    total_time = timing.get('total_time', 0.0)
    subst_time = timing.get('substitution_time', 0.0)
    if total_time == 0.0 or subst_time == 0.0:
        raise RuntimeError(f"Failed to parse timing output from symb-viewer. Parsed: {timing}")
    total_elapsed = int(total_time * 1e6)  # ms to ns
    exec_elapsed = int(subst_time * 1e6)  # ms to ns
    return total_elapsed - exec_elapsed, exec_elapsed


def get_dynm_overhead(bench:BenchSpec):
    input_data = bench.get_input_shape()
    kernel_path = bench.get_kernel_llvm_path()
    if not os.path.exists(kernel_path):
        if not os.path.exists(bench.get_directory()):
            os.makedirs(bench.get_directory())
        bench.generate_kernel()

    # Generate PGO LLVM object
    cwd = os.getcwd()
    bench_dir = bench.get_directory()
    kernel_path = bench.get_kernel_llvm_path()
    
    os.chdir(bench_dir)
    kernel_base = os.path.splitext(os.path.basename(kernel_path))[0]
    pgo_path = f"{kernel_base}-instr.so"
    subprocess.run(['instrGen', kernel_path, pgo_path], check=True)

    # Run the PGO instrumented module
    runner = bench.get_tvm_runner()

    # Measure baseline TVM module destruction time without running (no file writes expected)
    # baseline_mod = tvm.runtime.load_module(kernel_path)
    # gc.collect()
    # baseline_start = perf_counter_ns()
    # del baseline_mod
    # baseline_end = perf_counter_ns()
    # gc.collect()
    # baseline_del_ns = baseline_end - baseline_start

    module = tvm.runtime.load_module(pgo_path)
    exec_ns = runner.run(module, input_data)
    # gc.collect()
    # file_start = perf_counter_ns()
    # del module
    # file_end = perf_counter_ns()
    # gc.collect()
    # # Isolate file operation time by subtracting baseline deletion overhead
    # file_ops_ns = (file_end - file_start) - baseline_del_ns
    # if file_ops_ns < 0:
    #     file_ops_ns = 0
    # print(
    #     f"[overhead][{bench.get_name()}] delete_file_ops_ns={file_ops_ns} (raw_del={file_end - file_start}, baseline={baseline_del_ns})",
    #     flush=True,
    # )
    # exec_ns += file_ops_ns

    module = tvm.runtime.load_module(pgo_path)
    temp_file = tempfile.NamedTemporaryFile(mode="w+", delete=False, suffix=".ll")
    temp_file_path = temp_file.name

    init_start = perf_counter_ns()
    subprocess.run(
        ['clang++', '-O0', '-S', '-emit-llvm', '-fprofile-generate', '-o', temp_file_path, kernel_path],
        check=True,
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL
    )
    init_end = perf_counter_ns()

    init_ns = init_end - init_start
    del module

    # handle profiling results
    profraw_files = [f for f in os.listdir('.') if f.endswith('.profraw')]
    if profraw_files:
        profraw_file = profraw_files[0]
        os.remove(profraw_file)
    else:
        raise RuntimeError("No profraw file found. Make sure the instrumented run was successful.")
    os.chdir(cwd)

    return init_ns, exec_ns


def get_instance_timing(bench: BenchSpec):
    """Generate and run instance executable, return kernel execution time in ns.

    Steps:
    - Use symb-viewer to emit instance.ll for the compute function
    - Compile with clang++
    - Run ./a.out with args built from bench's input shape and symbolic patches
    - Parse stdout for the timing line: "Kernel execution time: ... (XX.XX ns @ ...)"
    """
    input_shape = bench.get_input_shape()
    kernel_path = bench.get_kernel_llvm_path()
    if not os.path.exists(kernel_path):
        if not os.path.exists(bench.get_directory()):
            os.makedirs(bench.get_directory())
        bench.generate_kernel()

    cwd = os.getcwd()
    bench_dir = bench.get_directory()
    os.chdir(bench_dir)

    try:
        kernel_base_name = os.path.splitext(os.path.basename(kernel_path))[0]
        func_name = kernel_base_name + "_compute_"
        instance_path = "instance.ll"

        with open(instance_path, "w") as f:
            subprocess.run(
                ['symb-viewer', 'instance', kernel_path, func_name],
                stdout=f,
                stderr=subprocess.DEVNULL,
                check=True,
            )

        subprocess.run(
            ['clang++', '-O0', '-w', instance_path],
            check=True,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        )

        # Prepare args: sort by key length then alphabet
        input_args = {**input_shape, **bench.get_symbolic_patches()}
        sorted_keys = sorted(input_args.keys(), key=lambda x: (len(x), x))
        args = [str(input_args[k]) for k in sorted_keys]

        result = subprocess.run(
            ['./a.out'] + args,
            stdout=subprocess.PIPE,
            stderr=subprocess.DEVNULL,
            text=True,
            check=True,
        )

        # Parse ns from: Kernel execution time: 51 cycles (40.28 ns @ 1.266 GHz)
        ns_val = None
        for line in result.stdout.splitlines():
            m = re.search(r"Kernel execution time:\s*.*\(([^)]+)\)", line)
            if m:
                inner = m.group(1)
                m2 = re.search(r"([0-9.]+)\s*ns", inner)
                if m2:
                    ns_val = float(m2.group(1))
                    break
        if ns_val is None:
            raise RuntimeError("Failed to parse instance timing from output.")
        return int(ns_val)  # ns_val is in ns; return as int nanoseconds
    finally:
        if os.path.exists('instance.ll'):
            os.remove('instance.ll')
        if os.path.exists('a.out'):
            os.remove('a.out')
        os.chdir(cwd)


def run_benchmark(bench: BenchSpec, size):
    # Adjust the input_shape based on the benchmark type
    label = bench.get_name()

    if label == "conv":
        bench.input_shape["H"] = size
        bench.input_shape["W"] = size
    elif label == "matmul":
        bench.input_shape["M"] = size
        bench.input_shape["N"] = size
        bench.input_shape["K"] = size
    elif label in ["add", "sub", "relu", "cast", "transpose", "div", "sum", "pow", "sqrt", "clip", "log", "exp", "tanh"]:
        bench.input_shape["M"] = size
        bench.input_shape["N"] = size
    elif label == "mul":
        bench.input_shape["M"] = size
        bench.input_shape["N"] = size
        bench.input_shape["K"] = size
    elif label == "concat":
        bench.input_shape["M"] = size
        bench.input_shape["N"] = size
    elif label == "gather":
        bench.input_shape["M"] = size
        bench.input_shape["N"] = size
        bench.input_shape["K"] = size
    elif label == "reshape":
        bench.input_shape["M"] = size
        bench.input_shape["N"] = size
    elif label == "shape":
        bench.input_shape["M"] = size
        bench.input_shape["N"] = size
    elif label == "squeeze":
        bench.input_shape["M"] = size
        bench.input_shape["N"] = 1
    elif label == "unsqueeze":
        bench.input_shape["M"] = size
        bench.input_shape["N"] = 1
    elif label == "slice":
        bench.input_shape["M"] = size
        bench.input_shape["N"] = size
        bench.input_shape["start"] = 0
        bench.input_shape["end"] = size
    elif label == "batch_norm":
        bench.input_shape["N"] = 16
        bench.input_shape["C"] = 3
        bench.input_shape["H"] = size
        bench.input_shape["W"] = size
    elif label == "leaky_relu":
        bench.input_shape["M"] = size
        bench.input_shape["N"] = size
    elif label == "gemm":
        bench.input_shape["M"] = size
        bench.input_shape["N"] = size
        bench.input_shape["K"] = size
    elif label == "softmax":
        bench.input_shape["M"] = size
        bench.input_shape["N"] = size
    elif label == "maxpool":
        bench.input_shape["H"] = size
        bench.input_shape["W"] = size
    elif label == "pad":
        bench.input_shape["M"] = size
        bench.input_shape["N"] = size
    elif label == "instance_norm":
        bench.input_shape["H"] = size
        bench.input_shape["W"] = size
    elif label == "nonzero":
        bench.input_shape["M"] = size
        bench.input_shape["N"] = size
    else:
        raise ValueError(f"Unsupported benchmark label: {label}")

    dynm_init_ns, dynm_exec_ns = get_dynm_overhead(bench)
    symb_init_ns, symb_exec_ns = get_symb_overhead(bench)
    inst_exec_ns = get_instance_timing(bench)

    return namedtuple("BenchmarkResult", ["dynm_init_ns", "dynm_exec_ns", "symb_init_ns", "symb_exec_ns", "inst_exec_ns"])(
        dynm_init_ns, dynm_exec_ns, symb_init_ns, symb_exec_ns, inst_exec_ns
    )

def run_benchmarks(bench: BenchSpec, sizes, repeat=3):

    results = []
    for size in sizes:
        dynm_init_times = []
        dynm_exec_times = []
        symb_init_times = []
        symb_exec_times = []
        inst_exec_times = []
        for _ in range(repeat):
            sleep(1)  # Sleep for 1 second between runs to avoid any potential interference
            result = run_benchmark(bench, size)
            dynm_init_times.append(result.dynm_init_ns)
            dynm_exec_times.append(result.dynm_exec_ns)
            symb_init_times.append(result.symb_init_ns)
            symb_exec_times.append(result.symb_exec_ns)
            inst_exec_times.append(result.inst_exec_ns)
            
        avg_dynm_init_ns = sum(dynm_init_times) // len(dynm_init_times)
        avg_dynm_exec_ns = sum(dynm_exec_times) // len(dynm_exec_times)
        avg_symb_init_ns = sum(symb_init_times) // len(symb_init_times)
        avg_symb_exec_ns = sum(symb_exec_times) // len(symb_exec_times)
        avg_inst_exec_ns = sum(inst_exec_times) // len(inst_exec_times)

        cv_dynm_init = (stdev(dynm_init_times) / mean(dynm_init_times)) if len(dynm_init_times) > 1 else 0
        cv_dynm_exec = (stdev(dynm_exec_times) / mean(dynm_exec_times)) if len(dynm_exec_times) > 1 else 0
        cv_symb_init = (stdev(symb_init_times) / mean(symb_init_times)) if len(symb_init_times) > 1 else 0
        cv_symb_exec = (stdev(symb_exec_times) / mean(symb_exec_times)) if len(symb_exec_times) > 1 else 0
        cv_inst_exec = (stdev(inst_exec_times) / mean(inst_exec_times)) if len(inst_exec_times) > 1 else 0

        results.append({
            "size": size, 
            "avg_dynm_init_ns": avg_dynm_init_ns, 
            "avg_dynm_exec_ns": avg_dynm_exec_ns, 
            "avg_symb_init_ns": avg_symb_init_ns, 
            "avg_symb_exec_ns": avg_symb_exec_ns,
            "avg_inst_exec_ns": avg_inst_exec_ns,
            "cv_dynm_init": cv_dynm_init,
            "cv_dynm_exec": cv_dynm_exec,
            "cv_symb_init": cv_symb_init,
            "cv_symb_exec": cv_symb_exec,
            "cv_inst_exec": cv_inst_exec
        })
        print(
            f"{bench.get_name()} size={size},\n"
            f"  avg_dynm_init_time={avg_dynm_init_ns} ns, cv={cv_dynm_init:.2%},\n"
            f"  avg_dynm_exec_time={avg_dynm_exec_ns} ns, cv={cv_dynm_exec:.2%},\n"
            f"  avg_symb_init_time={avg_symb_init_ns} ns, cv={cv_symb_init:.2%},\n"
            f"  avg_symb_exec_time={avg_symb_exec_ns} ns, cv={cv_symb_exec:.2%},\n"
            f"  avg_inst_exec_time={avg_inst_exec_ns} ns, cv={cv_inst_exec:.2%}"
        )
    return results


def save_results_to_csv(filename, labels, results_list: list[list]):
    file_exists = os.path.exists(filename)
    with open(filename, "a", newline="") as csvfile:  # Open in append mode
        fieldnames = [
            "label", "size", "avg_dynm_init_ns", "avg_dynm_exec_ns", 
            "avg_symb_init_ns", "avg_symb_exec_ns", "avg_inst_exec_ns",
            "cv_dynm_init", "cv_dynm_exec", "cv_symb_init", "cv_symb_exec", "cv_inst_exec"
        ]
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)

        if not file_exists:  # Write header only if the file is new
            writer.writeheader()
        for label, results in zip(labels, results_list):
            for result in results:
                row = {"label": label}
                row.update(result)
                writer.writerow(row)


def get_all_results():

    sizes = [64, 128, 256, 512, 1024, 2048, 4096, 8192]
    limited_sizes = [64, 128, 256, 512, 1024, 2048, 4096]
    
    regular_specs = [
        # ConcatBenchSpec,
        # GatherBenchSpec,
        # ReshapeBenchSpec,
        # ShapeBenchSpec,
        # SqueezeBenchSpec,
        # UnsqueezeBenchSpec,
        # AddBenchSpec,
        # CastBenchSpec,
        # MulBenchSpec,
        # ReluBenchSpec,
        # SubBenchSpec,
        # TransposeBenchSpec,
        # SliceBenchSpec,
        # DivBenchSpec,
        # SumBenchSpec,
        # NonZeroBenchSpec,
        # PowBenchSpec,
        # SqrtBenchSpec,
        # ClipBenchSpec,
        # LeakyReluBenchSpec,
        SoftmaxBenchSpec,
        TanhBenchSpec,
        MaxPoolBenchSpec,
        ExpBenchSpec,
        LogBenchSpec,
        PadBenchSpec,
        InstanceNormalizationBenchSpec,
    ]
    
    heavy_specs = [
        ConvBenchSpec,
        MatmulBenchSpec,
        GemmBenchSpec,
        BatchNormalizationBenchSpec,
    ]

    results = []
    
    # Run regular specs with full sizes
    for spec in regular_specs:
        bench = spec(base_dir='./optimized')
        result = run_benchmarks(bench, sizes)
        results.append(result)
        save_results_to_csv("overhead_results_with_instance.csv", [bench.get_name()], [result])
    
    # Run heavy specs with limited sizes
    for spec in heavy_specs:
        bench = spec(base_dir='./optimized')
        result = run_benchmarks(bench, limited_sizes)
        results.append(result)
        save_results_to_csv("overhead_results_with_instance.csv", [bench.get_name()], [result])

if __name__ == "__main__":
    get_all_results()
