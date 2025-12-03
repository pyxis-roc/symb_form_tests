import sys
import os
import tvm
import numpy as np
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../script-link')))

from compare import parse_instr, parse_symb, compare_results, print_compare_results, print_summary, parse_bv_value
import subprocess
import json
import tempfile
from benchmark_spec import BenchSpec

def get_exact_count(spec:BenchSpec):
    # prepare paths and inputs
    cwd = os.getcwd()
    bench_dir = spec.get_directory()
    input_shape = spec.get_input_shape()
    kernel_path = spec.get_kernel_llvm_path()
    tvm_runner = spec.get_tvm_runner()
    
    os.chdir(bench_dir)
    print(f"[benchmark][{spec.get_name()}] Generating symbolic counts...", flush=True)
    print(f"[benchmark][{spec.get_name()}] Generating instrumented module for exact count...", flush=True)
    # compile the kernel with instrumentation
    kernel_base = os.path.splitext(os.path.basename(kernel_path))[0]
    so_name = f"{kernel_base}-instr.so"
    subprocess.run(['instrGen', kernel_path, so_name], check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    module = tvm.runtime.load_module(os.path.join('./', so_name))
    print(f"[benchmark][{spec.get_name()}] Running instrumented module...", flush=True)

    # run the module with the input data
    tvm_runner.run(module, input_shape)
    del module

    # handle profiling results
    profraw_files = [f for f in os.listdir('.') if f.endswith('.profraw')]
    if profraw_files:
        profraw_file = profraw_files[0]
    else:
        raise RuntimeError("No profraw file found. Make sure the instrumented run was successful.")

    if profraw_file:
        with tempfile.NamedTemporaryFile(mode="w+", delete=False, suffix=".csv") as outfile: 
            instr_results_path = outfile.name

            subprocess.run(
                ["getBBCounts", kernel_path, profraw_file],
                stdout=outfile,
                stderr=subprocess.DEVNULL,
                check=True,
            )
        print(f"[benchmark][{spec.get_name()}] Parsing instrumentation results...", flush=True)
        instr_results = parse_instr(instr_results_path)
        os.remove(instr_results_path)
        os.remove(profraw_file)
        os.chdir(cwd)
        print(f"[benchmark][{spec.get_name()}] Exact count ready (basic blocks={len(instr_results)})", flush=True)
        return instr_results
    else:
        os.chdir(cwd)
        raise RuntimeError("No profraw file found. Make sure the instrumented run was successful.")


def get_symb_count(spec:BenchSpec):
    # setup
    cwd = os.getcwd()
    bench_dir = spec.get_directory()
    input_shape = spec.get_input_shape()
    kernel_path = spec.get_kernel_llvm_path()

    os.chdir(bench_dir)

    symb_output_file = tempfile.NamedTemporaryFile(mode="w+", delete=False, suffix=".json"); 
    symb_input_file = tempfile.NamedTemporaryFile(mode="w+", delete=False, suffix=".json")
    symb_output_path = symb_output_file.name
    symb_input_path = symb_input_file.name

    with open(symb_input_path, "w") as f:
        symb_subs = {**input_shape, **spec.get_symbolic_patches()}
        json.dump(symb_subs, f)

    kernel_base_name = os.path.splitext(os.path.basename(kernel_path))[0]
    func_name = kernel_base_name + "_compute_"
    subprocess.run(
        ['symb-viewer', 'formula', kernel_path, func_name, f'-subs={symb_input_path}', f'-json={symb_output_path}'],
        check=True,
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
    )

    print(f"[benchmark][{spec.get_name()}] Parsing symbolic output...", flush=True)
    result = parse_symb(symb_output_path)
    result = {k: parse_bv_value(v) for k, v in result.items()}
    os.remove(symb_output_path)
    os.chdir(cwd)
    print(f"[benchmark][{spec.get_name()}] Symbolic count ready (basic blocks={len(result)})", flush=True)
    return result


def get_instance_count(spec:BenchSpec):
    """Generate instance.ll, compile and run it, parse basic block counts from output."""
    # setup
    cwd = os.getcwd()
    bench_dir = spec.get_directory()
    input_shape = spec.get_input_shape()
    kernel_path = spec.get_kernel_llvm_path()

    os.chdir(bench_dir)

    try:
        # Generate instance.ll
        kernel_base_name = os.path.splitext(os.path.basename(kernel_path))[0]
        func_name = kernel_base_name + "_compute_"
        instance_path = "instance.ll"
        print(f"[benchmark][{spec.get_name()}] Generating instance.ll...", flush=True)
        with open(instance_path, "w") as f:
            subprocess.run(
                ['symb-viewer', 'instance', kernel_path, func_name],
                stdout=f,
                stderr=subprocess.DEVNULL,
                check=True,
            )

        print(f"[benchmark][{spec.get_name()}] Compiling instance.ll...", flush=True)
        # Compile instance.ll
        subprocess.run(['clang++', '-O0', '-w', instance_path], check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

        # Prepare input arguments (sorted by length then alphabet)
        input_args = {**input_shape, **spec.get_symbolic_patches()}
        sorted_keys = sorted(input_args.keys(), key=lambda x: (len(x), x))
        args = [str(input_args[k]) for k in sorted_keys]
        named_args = [f"{k}={input_args[k]}" for k in sorted_keys]
        print(f"[benchmark][{spec.get_name()}] Running instance with args: {' '.join(args)}", flush=True)
        print(f"[benchmark][{spec.get_name()}] Arg names: {' '.join(named_args)}", flush=True)

        # Run the compiled instance
        result = subprocess.run(
            ['./a.out'] + args,
            stdout=subprocess.PIPE,
            stderr=subprocess.DEVNULL,
            text=True,
            check=True
        )

        print(f"[benchmark][{spec.get_name()}] Parsing instance output...", flush=True)
        # Parse output - extract basic block counts
        instance_counts = {}
        for line in result.stdout.strip().split('\n'):
            line = line.strip()
            # Skip input lines and kernel execution time
            if line.startswith('Input ') or line.startswith('Kernel execution time:'):
                continue
            # Parse "block_name: count" format
            if ':' in line:
                parts = line.split(':', 1)
                if len(parts) == 2:
                    block_name = parts[0].strip()
                    try:
                        count = int(parts[1].strip())
                        instance_counts[block_name] = count
                    except ValueError:
                        continue

        print(f"[benchmark][{spec.get_name()}] Instance count ready (basic blocks={len(instance_counts)})", flush=True)
        return instance_counts

    finally:
        # Cleanup
        if os.path.exists('instance.ll'):
            os.remove('instance.ll')
        if os.path.exists('a.out'):
            os.remove('a.out')
        os.chdir(cwd)



def benchmark(spec: BenchSpec, debug=False):
    print(f"Running benchmark: {spec.get_name()}")

    if not os.path.exists(spec.get_kernel_llvm_path()):
        if not os.path.exists(spec.get_directory()):
            os.makedirs(spec.get_directory())
        spec.generate_kernel()

    instr_counts = get_exact_count(spec)
    symb_counts = get_symb_count(spec)

    # Compare results
    results, summary = compare_results(instr_counts, symb_counts)
    
    print(f"Benchmark: {spec.get_name()}")
    if (debug):
        print_compare_results(results, summary)
    else:
        print_summary(summary)

def benchmark_instance(spec: BenchSpec, debug=False):
    print(f"Running instance benchmark: {spec.get_name()}")

    if not os.path.exists(spec.get_kernel_llvm_path()):
        if not os.path.exists(spec.get_directory()):
            os.makedirs(spec.get_directory())
        spec.generate_kernel()

    instr_counts = get_exact_count(spec)
    instance_counts = get_instance_count(spec)

    # Compare results
    results, summary = compare_results(instr_counts, instance_counts)
    
    print(f"Instance Benchmark: {spec.get_name()}")
    if (debug):
        print_compare_results(results, summary)
    else:
        print_summary(summary)

def benchmark_all(spec: BenchSpec, debug=False):
    print(f"Running tri-compare benchmark: {spec.get_name()}")

    if not os.path.exists(spec.get_kernel_llvm_path()):
        if not os.path.exists(spec.get_directory()):
            os.makedirs(spec.get_directory())
        spec.generate_kernel()

    exact = get_exact_count(spec)
    symb = get_symb_count(spec)
    inst = get_instance_count(spec)

    # Only consider blocks that appear in all three methods
    keys = sorted(set(exact.keys()) & set(symb.keys()) & set(inst.keys()))
    mismatches = []
    matched = []
    for k in keys:
        ev = exact.get(k)
        sv = symb.get(k)
        iv = inst.get(k)
        if not (ev == sv == iv):
            mismatches.append(k)
        else:
            matched.append(k)

    if debug:
        if len(mismatches) == 0:
            print("  basic blocks: matched")
            for k in matched:
                print(f"    {k}: {exact.get(k)}")
        else:
            print("  matched_blocks:")
            for k in matched:
                print(f"    {k}: {exact.get(k)}")
            print("  mismatched_blocks:")
            for k in mismatches:
                print(f"    {k}: exact={exact.get(k)}, symb={symb.get(k)}, inst={inst.get(k)}")
    
    print("Comparison Results:")
    print(f"  matched: {len(matched)}/{len(keys)}")

def get_basic_block_numbers(spec: BenchSpec):
    if not os.path.exists(spec.get_kernel_llvm_path()):
        if not os.path.exists(spec.get_directory()):
            os.makedirs(spec.get_directory())
        spec.generate_kernel()
    
    import csv
    file_exists = os.path.isfile('spec_basic_block_numbers.csv')
    with open('spec_basic_block_numbers.csv', 'a') as f:
        writer = csv.writer(f)
        if not file_exists:
            writer.writerow(['name', 'count'])

        # Write the benchmark data

        instr_counts = get_exact_count(spec)
        symb_counts = get_symb_count(spec)

        # Compare results
        _, summary = compare_results(instr_counts, symb_counts)
        writer.writerow([spec.get_name(), summary['total']])

import argparse
if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Benchmark TVM operations.')
    parser.add_argument('--base_dir', type=str, default='./all_ops', help='Base directory for benchmarks')
    args = parser.parse_args()
    BASE_DIR = args.base_dir

    from benchmark_adhoc import *

    for bench_cls in [
        ConvBenchSpec,
        MatmulBenchSpec,
        ConcatBenchSpec,
        GatherBenchSpec,
        ReshapeBenchSpec,
        ShapeBenchSpec,
        SqueezeBenchSpec,
        UnsqueezeBenchSpec,
        AddBenchSpec,
        CastBenchSpec,
        MulBenchSpec,
        ReluBenchSpec,
        SubBenchSpec,
        TransposeBenchSpec,
        SliceBenchSpec,
        BatchNormalizationBenchSpec,
        DivBenchSpec,
        SumBenchSpec,
        NonZeroBenchSpec,
        PowBenchSpec,
        SqrtBenchSpec,
        ClipBenchSpec,
        LeakyReluBenchSpec,
        GemmBenchSpec,
        SoftmaxBenchSpec,
        TanhBenchSpec,
        MaxPoolBenchSpec,
        ExpBenchSpec,
        LogBenchSpec,
        PadBenchSpec,
        InstanceNormalizationBenchSpec
    ]:
        benchmark_all(bench_cls(base_dir=BASE_DIR), debug=False)
        # get_basic_block_numbers(bench_cls(base_dir=BASE_DIR))
    exit()

    from benchmark_simple import SpecCollection

    specs = SpecCollection(BASE_DIR).get_specs()
    for spec in specs:
        benchmark(spec, debug=False)
