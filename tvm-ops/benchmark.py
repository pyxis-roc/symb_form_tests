import sys
import os
import tvm
import numpy as np
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../script-link')))

from compare import parse_instr, parse_symb, compare_results, print_compare_results, print_summary
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
    # compile the kernel with instrumentation
    kernel_base = os.path.splitext(os.path.basename(kernel_path))[0]
    so_name = f"{kernel_base}-instr.so"
    subprocess.run(['instrGen', kernel_path, so_name], check=True)
    module = tvm.runtime.load_module(os.path.join('./', so_name))

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
                check=True,
            )
        instr_results = parse_instr(instr_results_path)
        os.remove(instr_results_path)
        os.remove(profraw_file)
        os.chdir(cwd)
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
        ['symb-viewer', kernel_path, func_name, f'-subs={symb_input_path}', f'-json={symb_output_path}'],
        check=True,
    )

    result = parse_symb(symb_output_path)
    os.remove(symb_output_path)
    os.chdir(cwd)

    return result


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
        # MatmulBenchSpec,
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
        # BatchNormalizationBenchSpec,
        # DivBenchSpec,
        # SumBenchSpec,
        # NonZeroBenchSpec,
        # PowBenchSpec,
        # SqrtBenchSpec,
        # ClipBenchSpec,
        # LeakyReluBenchSpec,
        # GemmBenchSpec,
        # SoftmaxBenchSpec,
        # TanhBenchSpec,
        # MaxPoolBenchSpec,
        # ExpBenchSpec,
        # LogBenchSpec,
        PadBenchSpec,
        # InstanceNormalizationBenchSpec
    ]:
        benchmark(bench_cls(base_dir=BASE_DIR), debug=True)
        # get_basic_block_numbers(bench_cls(base_dir=BASE_DIR))
    exit()

    from benchmark_simple import SpecCollection

    specs = SpecCollection(BASE_DIR).get_specs()
    for spec in specs:
        benchmark(spec, debug=False)
