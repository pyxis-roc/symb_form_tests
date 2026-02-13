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

def get_exact_count(spec:BenchSpec, debug=False):
    # prepare paths and inputs
    cwd = os.getcwd()
    bench_dir = spec.get_directory()
    input_shape = spec.get_input_shape()
    kernel_path = spec.get_kernel_llvm_path()
    tvm_runner = spec.get_tvm_runner()
    
    os.chdir(bench_dir)
    if debug:
        print(f"[benchmark][{spec.get_name()}] Generating instrumented module for exact count...", flush=True)
    # compile the kernel with instrumentation
    kernel_base = os.path.splitext(os.path.basename(kernel_path))[0]
    so_name = f"{kernel_base}-instr.so"
    try:
        stderr_redirect = subprocess.PIPE if debug else subprocess.DEVNULL
        stdout_redirect = subprocess.PIPE if debug else subprocess.DEVNULL
        result = subprocess.run(['instrGen', kernel_path, so_name], check=True, stdout=stdout_redirect, stderr=stderr_redirect, text=True)
        if debug and (result.stderr or result.stdout):
            if result.stdout:
                print(f"[benchmark][{spec.get_name()}] instrGen stdout: {result.stdout}", flush=True)
            if result.stderr:
                print(f"[benchmark][{spec.get_name()}] instrGen stderr: {result.stderr}", flush=True)
    except subprocess.CalledProcessError as e:
        os.chdir(cwd)
        raise RuntimeError(f"instrGen failed for {spec.get_name()}: {e}")
    module = tvm.runtime.load_module(os.path.join('./', so_name))
    if debug:
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

            try:
                stderr_redirect = subprocess.PIPE if debug else subprocess.DEVNULL
                result = subprocess.run(
                    ["getBBCounts", kernel_path, profraw_file],
                    stdout=outfile,
                    stderr=stderr_redirect,
                    check=True,
                    text=True,
                )
                if debug and result.stderr:
                    print(f"[benchmark][{spec.get_name()}] getBBCounts stderr: {result.stderr}", flush=True)
            except subprocess.CalledProcessError as e:
                os.chdir(cwd)
                raise RuntimeError(f"getBBCounts failed for {spec.get_name()}: {e}")
        if debug:
            print(f"[benchmark][{spec.get_name()}] Parsing instrumentation results...", flush=True)
        instr_results = parse_instr(instr_results_path)
        os.remove(instr_results_path)
        os.remove(profraw_file)
        os.chdir(cwd)
        if debug:
            print(f"[benchmark][{spec.get_name()}] Exact count ready (basic blocks={len(instr_results)})", flush=True)
        return instr_results
    else:
        os.chdir(cwd)
        raise RuntimeError("No profraw file found. Make sure the instrumented run was successful.")


def get_symb_count(spec:BenchSpec, debug=False):
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
    try:
        result = subprocess.run(
            ['symb-viewer', 'formula', kernel_path, func_name, f'-subs={symb_input_path}', f'-json={symb_output_path}'],
            check=True,
            capture_output=True,
            text=True,
        )
        if debug and (result.stderr or result.stdout):
            if result.stdout:
                print(f"[benchmark][{spec.get_name()}] symb-viewer stdout: {result.stdout}", flush=True)
            if result.stderr:
                print(f"[benchmark][{spec.get_name()}] symb-viewer stderr: {result.stderr}", flush=True)
    except subprocess.CalledProcessError as e:
        os.chdir(cwd)
        if debug:
            print(f"\n[benchmark][{spec.get_name()}] symb-viewer FAILED with exit code {e.returncode}", flush=True)
            print(f"[benchmark][{spec.get_name()}] stderr:\n{e.stderr if e.stderr else '(no stderr)'}", flush=True)
            print(f"[benchmark][{spec.get_name()}] stdout:\n{e.stdout if e.stdout else '(no stdout)'}", flush=True)
        raise 

    if debug:
        print(f"[benchmark][{spec.get_name()}] Parsing symbolic output...", flush=True)
    result = parse_symb(symb_output_path)
    result = {k: parse_bv_value(v) for k, v in result.items()}
    os.remove(symb_output_path)
    os.chdir(cwd)
    if debug:
        print(f"[benchmark][{spec.get_name()}] Symbolic count ready (basic blocks={len(result)})", flush=True)
    return result


def get_instance_count(spec:BenchSpec, debug=False):
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
        if debug:
            print(f"[benchmark][{spec.get_name()}] Generating instance.ll...", flush=True)
        with open(instance_path, "w") as f:
            stderr_redirect = subprocess.PIPE if debug else subprocess.DEVNULL
            result = subprocess.run(
                ['symb-viewer', 'instance', kernel_path, func_name],
                stdout=f,
                stderr=stderr_redirect,
                check=True,
                text=True,
            )
            if debug and result.stderr:
                print(f"[benchmark][{spec.get_name()}] symb-viewer instance stderr: {result.stderr}", flush=True)

        if debug:
            print(f"[benchmark][{spec.get_name()}] Compiling instance.ll...", flush=True)
        # Compile instance.ll
        stderr_redirect = subprocess.PIPE if debug else subprocess.DEVNULL
        stdout_redirect = subprocess.PIPE if debug else subprocess.DEVNULL
        result = subprocess.run(['clang++', '-O0', '-w', instance_path], check=True, stdout=stdout_redirect, stderr=stderr_redirect, text=True)
        if debug and (result.stderr or result.stdout):
            if result.stdout:
                print(f"[benchmark][{spec.get_name()}] clang++ stdout: {result.stdout}", flush=True)
            if result.stderr:
                print(f"[benchmark][{spec.get_name()}] clang++ stderr: {result.stderr}", flush=True)

        # Prepare input arguments (sorted by length then alphabet)
        input_args = {**input_shape, **spec.get_symbolic_patches()}
        sorted_keys = sorted(input_args.keys(), key=lambda x: (len(x), x))
        args = [str(input_args[k]) for k in sorted_keys]
        if debug:
            named_args = [f"{k}={input_args[k]}" for k in sorted_keys]
            print(f"[benchmark][{spec.get_name()}] Running instance with args: {' '.join(args)}", flush=True)
            print(f"[benchmark][{spec.get_name()}] Arg names: {' '.join(named_args)}", flush=True)

        # Run the compiled instance
        stderr_redirect = subprocess.PIPE if debug else subprocess.DEVNULL
        result = subprocess.run(
            ['./a.out'] + args,
            stdout=subprocess.PIPE,
            stderr=stderr_redirect,
            text=True,
            check=True
        )
        if debug and result.stderr:
            print(f"[benchmark][{spec.get_name()}] a.out stderr: {result.stderr}", flush=True)

        if debug:
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

        if debug:
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
    try:
        if debug:
            print(f"Running benchmark: {spec.get_name()}")

        if not os.path.exists(spec.get_directory()):
            os.makedirs(spec.get_directory())
        spec.generate_kernel()

        instr_counts = get_exact_count(spec, debug)
        symb_counts = get_symb_count(spec, debug)

        # Compare results
        results, summary = compare_results(instr_counts, symb_counts)
        
        if debug:
            print(f"Benchmark: {spec.get_name()}")
            print_compare_results(results, summary)
        else:
            matched = summary['matched']
            total = summary['total']
            print(f"[OK] {spec.get_name()}: {matched}/{total} matched")
    except Exception as e:
        print(f"[FAILED] {spec.get_name()}: {str(e)}", flush=True)
        if debug:
            import traceback
            traceback.print_exc()

def benchmark_instance(spec: BenchSpec, debug=False):
    try:
        if debug:
            print(f"Running instance benchmark: {spec.get_name()}")

        if not os.path.exists(spec.get_directory()):
            os.makedirs(spec.get_directory())
        spec.generate_kernel()

        instr_counts = get_exact_count(spec, debug)
        instance_counts = get_instance_count(spec, debug)

        # Compare results
        results, summary = compare_results(instr_counts, instance_counts)
        
        if debug:
            print(f"Instance Benchmark: {spec.get_name()}")
            print_compare_results(results, summary)
        else:
            matched = summary['matched']
            total = summary['total']
            print(f"[OK] {spec.get_name()}: {matched}/{total} matched")
    except Exception as e:
        print(f"[FAILED] {spec.get_name()}: {str(e)}", flush=True)
        if debug:
            import traceback
            traceback.print_exc()

def benchmark_all(spec: BenchSpec, debug=False):
    try:
        if debug:
            print(f"Running tri-compare benchmark: {spec.get_name()}")

        if not os.path.exists(spec.get_directory()):
            os.makedirs(spec.get_directory())
        spec.generate_kernel()

        exact = get_exact_count(spec, debug)
        symb = get_symb_count(spec, debug)
        inst = get_instance_count(spec, debug)

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
        else:
            if len(mismatches) == 0:
                print(f"[OK] {spec.get_name()}: {len(matched)}/{len(keys)} matched")
            else:
                print(f"[MISMATCH] {spec.get_name()}: {len(matched)}/{len(keys)} matched, {len(mismatches)} mismatched")
    except Exception as e:
        print(f"[ERROR] {spec.get_name()}: {str(e)}", flush=True)
        if debug:
            import traceback
            traceback.print_exc()

def get_basic_block_numbers(spec: BenchSpec, debug=False):
    try:
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

            instr_counts = get_exact_count(spec, debug)
            symb_counts = get_symb_count(spec, debug)

            # Compare results
            _, summary = compare_results(instr_counts, symb_counts)
            writer.writerow([spec.get_name(), summary['total']])
    except Exception as e:
        print(f"[FAILED] get_basic_block_numbers for {spec.get_name()} failed", flush=True)
        if debug:
            print(f"  Details: {str(e)}", flush=True)
            import traceback
            traceback.print_exc()

import argparse
if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Benchmark TVM operations.')
    parser.add_argument('--base_dir', type=str, default='./all_ops', help='Base directory for benchmarks')
    args = parser.parse_args()
    BASE_DIR = args.base_dir

    from benchmark_adhoc import *

    for bench_cls in [
        # ConvBenchSpec,
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
        # PadBenchSpec,
        # InstanceNormalizationBenchSpec,

        # ResizeBenchSpec,
        # UpsampleBenchSpec,
        # TopKBenchSpec,
        # NonMaxSuppressionBenchSpec,
        # RoiAlignBenchSpec,
        # ScatterBenchSpec,
        CompressBenchSpec,
        # CumSumBenchSpec,
        # HardmaxBenchSpec,
        # CategoryMapperBenchSpec,

        # LSTMBenchSpec,

    ]:
        try:
            benchmark_all(bench_cls(base_dir=BASE_DIR), debug=True)
            # get_basic_block_numbers(bench_cls(base_dir=BASE_DIR), debug=False)
        except Exception as e:
            print(f"[FAILED] {bench_cls.__name__} failed", flush=True)
    exit()

    from benchmark_simple import SpecCollection

    specs = SpecCollection(BASE_DIR).get_specs()
    for spec in specs:
        benchmark(spec, debug=False)
