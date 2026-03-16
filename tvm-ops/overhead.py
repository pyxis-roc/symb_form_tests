import argparse
import csv
import json
import os
import re
import subprocess
import sys
import tempfile
from dataclasses import dataclass
from statistics import mean, stdev
from time import perf_counter_ns, sleep
from typing import Sequence

import tvm

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "../script-link")))

from benchmark import BenchSpec
from benchmark_simple import SpecCollection


WIDE_SIZES = [64, 128, 256, 512, 1024, 2048, 4096, 8192]
LIMITED_SIZES = [64, 128, 256, 512, 1024, 2048, 4096]
SPATIAL_SIZES = [64, 128, 256, 512]
SMOKE_SIZE = 64

DEFAULT_RESULTS_DIR = os.path.join(os.path.dirname(__file__), "results")
DEFAULT_OUTPUT_FILES = {
    "smoke": os.path.join(DEFAULT_RESULTS_DIR, "overhead_smoke_with_instance.csv"),
    "full": os.path.join(DEFAULT_RESULTS_DIR, "overhead_full_with_instance.csv"),
    "custom": os.path.join(DEFAULT_RESULTS_DIR, "overhead_custom_with_instance.csv"),
}

FIXED_INPUT_BENCHMARKS = {"range", "scan", "scatter"}
LIMITED_BENCHMARKS = {"matmul"}
MIN_SIZE_BY_BENCHMARK = {
    "conv": 8,
    "roi_align": 56,
    "slice": 64,
    "topk": 10,
}

RESULT_FIELDNAMES = [
    "label",
    "size",
    "avg_dynm_init_ns",
    "avg_dynm_exec_ns",
    "avg_symb_init_ns",
    "avg_symb_exec_ns",
    "avg_inst_exec_ns",
    "cv_dynm_init",
    "cv_dynm_exec",
    "cv_symb_init",
    "cv_symb_exec",
    "cv_inst_exec",
]


@dataclass(frozen=True)
class BenchmarkResult:
    dynm_init_ns: int
    dynm_exec_ns: int
    symb_init_ns: int
    symb_exec_ns: int
    inst_exec_ns: int


@dataclass(frozen=True)
class BenchmarkCase:
    size: int
    input_shape: dict[str, int]
    symbolic_patches: dict[str, int]


def get_symb_overhead(bench: BenchSpec):
    input_shape = bench.get_input_shape()
    kernel_llvm_path = bench.get_kernel_llvm_path()
    if not os.path.exists(kernel_llvm_path):
        os.makedirs(bench.get_directory(), exist_ok=True)
        bench.generate_kernel()

    with tempfile.NamedTemporaryFile(mode="w+", delete=False, suffix=".json") as symb_input_file:
        symb_input_path = symb_input_file.name

    try:
        with open(symb_input_path, "w") as handle:
            json.dump(input_shape, handle)

        kernel_base_name = os.path.splitext(os.path.basename(kernel_llvm_path))[0]
        func_name = kernel_base_name + "_compute_"
        result = subprocess.run(
            [
                "symb-viewer",
                "formula",
                kernel_llvm_path,
                func_name,
                f"-subs={symb_input_path}",
                "--quiet",
                "--time",
            ],
            check=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.DEVNULL,
            text=True,
        )

        timing = {}
        for line in result.stdout.splitlines():
            match = re.match(r"\s*([A-Za-z ]+):\s*([0-9.eE+-]+)ms", line)
            if match:
                key = match.group(1).strip().lower().replace(" ", "_")
                timing[key] = float(match.group(2))

        total_time = timing.get("total_time", 0.0)
        substitution_time = timing.get("substitution_time", 0.0)
        if total_time == 0.0 or substitution_time == 0.0:
            raise RuntimeError(f"Failed to parse timing output from symb-viewer. Parsed: {timing}")

        total_elapsed = int(total_time * 1e6)
        exec_elapsed = int(substitution_time * 1e6)
        return total_elapsed - exec_elapsed, exec_elapsed
    finally:
        if os.path.exists(symb_input_path):
            os.remove(symb_input_path)


def get_dynm_overhead(bench: BenchSpec):
    input_shape = bench.get_input_shape()
    kernel_path = bench.get_kernel_llvm_path()
    if not os.path.exists(kernel_path):
        os.makedirs(bench.get_directory(), exist_ok=True)
        bench.generate_kernel()

    cwd = os.getcwd()
    bench_dir = bench.get_directory()
    os.chdir(bench_dir)
    try:
        kernel_base = os.path.splitext(os.path.basename(kernel_path))[0]
        pgo_path = f"{kernel_base}-instr.so"
        subprocess.run(["instrGen", kernel_path, pgo_path], check=True)

        runner = bench.get_tvm_runner()
        module = tvm.runtime.load_module(pgo_path)
        exec_ns = runner.run(module, input_shape)
        del module

        module = tvm.runtime.load_module(pgo_path)
        with tempfile.NamedTemporaryFile(mode="w+", delete=False, suffix=".ll") as temp_file:
            temp_file_path = temp_file.name

        try:
            init_start = perf_counter_ns()
            subprocess.run(
                ["clang++", "-O0", "-S", "-emit-llvm", "-fprofile-generate", "-o", temp_file_path, kernel_path],
                check=True,
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL,
            )
            init_end = perf_counter_ns()
        finally:
            if os.path.exists(temp_file_path):
                os.remove(temp_file_path)

        init_ns = init_end - init_start
        del module

        profraw_files = [name for name in os.listdir(".") if name.endswith(".profraw")]
        if not profraw_files:
            raise RuntimeError("No profraw file found. Make sure the instrumented run was successful.")
        os.remove(profraw_files[0])
        return init_ns, exec_ns
    finally:
        os.chdir(cwd)


def get_instance_timing(bench: BenchSpec):
    input_shape = bench.get_input_shape()
    kernel_path = bench.get_kernel_llvm_path()
    if not os.path.exists(kernel_path):
        os.makedirs(bench.get_directory(), exist_ok=True)
        bench.generate_kernel()

    cwd = os.getcwd()
    bench_dir = bench.get_directory()
    os.chdir(bench_dir)

    try:
        kernel_base_name = os.path.splitext(os.path.basename(kernel_path))[0]
        func_name = kernel_base_name + "_compute_"
        instance_path = "instance.ll"

        with open(instance_path, "w") as handle:
            subprocess.run(
                ["symb-viewer", "instance", kernel_path, func_name],
                stdout=handle,
                stderr=subprocess.DEVNULL,
                check=True,
            )

        subprocess.run(
            ["clang++", "-O0", "-w", instance_path],
            check=True,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        )

        input_args = {**input_shape, **bench.get_symbolic_patches()}
        sorted_keys = sorted(input_args.keys(), key=lambda key: (len(key), key))
        args = [str(input_args[key]) for key in sorted_keys]

        result = subprocess.run(
            ["./a.out"] + args,
            stdout=subprocess.PIPE,
            stderr=subprocess.DEVNULL,
            text=True,
            check=True,
        )

        for line in result.stdout.splitlines():
            match = re.search(r"Kernel execution time:\s*.*\(([^)]+)\)", line)
            if match is None:
                continue
            time_match = re.search(r"([0-9.]+)\s*ns", match.group(1))
            if time_match is not None:
                return int(float(time_match.group(1)))

        raise RuntimeError("Failed to parse instance timing from output.")
    finally:
        if os.path.exists("instance.ll"):
            os.remove("instance.ll")
        if os.path.exists("a.out"):
            os.remove("a.out")
        os.chdir(cwd)


def run_benchmark_case(bench: BenchSpec, case: BenchmarkCase) -> BenchmarkResult:
    bench.input_shape = dict(case.input_shape)
    bench.symbolic_patches = dict(case.symbolic_patches)
    dynm_init_ns, dynm_exec_ns = get_dynm_overhead(bench)
    symb_init_ns, symb_exec_ns = get_symb_overhead(bench)
    inst_exec_ns = get_instance_timing(bench)
    return BenchmarkResult(
        dynm_init_ns=dynm_init_ns,
        dynm_exec_ns=dynm_exec_ns,
        symb_init_ns=symb_init_ns,
        symb_exec_ns=symb_exec_ns,
        inst_exec_ns=inst_exec_ns,
    )


def summarize_times(times: list[int]) -> tuple[int, float]:
    average = sum(times) // len(times)
    variation = (stdev(times) / mean(times)) if len(times) > 1 else 0.0
    return average, variation


def case_identity(label: str, case: BenchmarkCase) -> tuple[str, str]:
    return (label, str(case.size))


def run_single_case(bench: BenchSpec, case: BenchmarkCase, repeat: int = 3) -> dict:
    dynm_init_times = []
    dynm_exec_times = []
    symb_init_times = []
    symb_exec_times = []
    inst_exec_times = []

    for i in range(repeat):
        sleep(1)
        try:
            result = run_benchmark_case(bench, case)
        except Exception as error:  # noqa: BLE001
            print(f"  [rep {i + 1}/{repeat} failed] {bench.get_name()} size={case.size}: {error}")
            continue
        dynm_init_times.append(result.dynm_init_ns)
        dynm_exec_times.append(result.dynm_exec_ns)
        symb_init_times.append(result.symb_init_ns)
        symb_exec_times.append(result.symb_exec_ns)
        inst_exec_times.append(result.inst_exec_ns)

    if not dynm_exec_times:
        raise RuntimeError(f"All {repeat} repetitions failed for {bench.get_name()} size={case.size}.")

    avg_dynm_init_ns, cv_dynm_init = summarize_times(dynm_init_times)
    avg_dynm_exec_ns, cv_dynm_exec = summarize_times(dynm_exec_times)
    avg_symb_init_ns, cv_symb_init = summarize_times(symb_init_times)
    avg_symb_exec_ns, cv_symb_exec = summarize_times(symb_exec_times)
    avg_inst_exec_ns, cv_inst_exec = summarize_times(inst_exec_times)

    print(
        f"{bench.get_name()} size={case.size}, input_shape={case.input_shape},\n"
        f"  avg_dynm_init_time={avg_dynm_init_ns} ns, cv={cv_dynm_init:.2%},\n"
        f"  avg_dynm_exec_time={avg_dynm_exec_ns} ns, cv={cv_dynm_exec:.2%},\n"
        f"  avg_symb_init_time={avg_symb_init_ns} ns, cv={cv_symb_init:.2%},\n"
        f"  avg_symb_exec_time={avg_symb_exec_ns} ns, cv={cv_symb_exec:.2%},\n"
        f"  avg_inst_exec_time={avg_inst_exec_ns} ns, cv={cv_inst_exec:.2%}"
    )

    return {
        "label": bench.get_name(),
        "size": case.size,
        "avg_dynm_init_ns": avg_dynm_init_ns,
        "avg_dynm_exec_ns": avg_dynm_exec_ns,
        "avg_symb_init_ns": avg_symb_init_ns,
        "avg_symb_exec_ns": avg_symb_exec_ns,
        "avg_inst_exec_ns": avg_inst_exec_ns,
        "cv_dynm_init": cv_dynm_init,
        "cv_dynm_exec": cv_dynm_exec,
        "cv_symb_init": cv_symb_init,
        "cv_symb_exec": cv_symb_exec,
        "cv_inst_exec": cv_inst_exec,
    }


def ensure_parent_dir(path: str):
    parent = os.path.dirname(path)
    if parent:
        os.makedirs(parent, exist_ok=True)


def save_results_to_csv(filename: str, rows: list[dict], append: bool):
    ensure_parent_dir(filename)
    file_exists = os.path.exists(filename)
    mode = "a" if append else "w"
    with open(filename, mode, newline="") as csvfile:
        writer = csv.DictWriter(csvfile, fieldnames=RESULT_FIELDNAMES)
        if not file_exists or not append:
            writer.writeheader()
        writer.writerows(rows)


def load_completed_case_keys(filename: str) -> set[tuple[str, str]]:
    if not os.path.exists(filename):
        return set()

    completed = set()
    with open(filename, "r", newline="") as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            label = row.get("label", "")
            size = row.get("size", "")
            if label and size:
                completed.add((label, size))
    return completed


def normalize_op_token(value: str) -> str:
    return value.lower().replace("benchspec", "").replace("_", "").replace("-", "")


def get_all_specs(base_dir: str) -> list[BenchSpec]:
    return SpecCollection(base_dir).get_specs()


def filter_specs(specs: list[BenchSpec], selected_ops: list[str] | None) -> list[BenchSpec]:
    if not selected_ops:
        return specs

    requested = {normalize_op_token(item) for item in selected_ops}
    filtered = []
    for spec in specs:
        tokens = {
            normalize_op_token(spec.get_name()),
            normalize_op_token(spec.__class__.__name__),
        }
        if requested & tokens:
            filtered.append(spec)

    matched = set()
    for spec in filtered:
        matched.add(normalize_op_token(spec.get_name()))
        matched.add(normalize_op_token(spec.__class__.__name__))
    missing = requested - matched
    if missing:
        available = ", ".join(sorted(spec.get_name() for spec in specs))
        raise ValueError(f"Unknown benchmark(s): {', '.join(sorted(missing))}. Available benchmarks: {available}")
    return filtered


def benchmark_has_fixed_inputs(bench: BenchSpec) -> bool:
    return bench.get_name() in FIXED_INPUT_BENCHMARKS


def choose_size_schedule(bench: BenchSpec, mode: str, custom_sizes: list[int] | None = None) -> Sequence[int | None]:
    if mode == "custom":
        if not custom_sizes:
            raise ValueError("Custom mode requires --sizes.")
        return list(custom_sizes)

    if benchmark_has_fixed_inputs(bench):
        return [None]

    if mode == "smoke":
        return [SMOKE_SIZE]

    name = bench.get_name()
    if name in LIMITED_BENCHMARKS:
        return LIMITED_SIZES
    return WIDE_SIZES


def infer_case_size(input_shape: dict[str, int]) -> int:
    for key in ("M", "H", "N", "batch_size", "in_dim", "K", "W"):
        if key in input_shape:
            return int(input_shape[key])
    return 1


def apply_size_to_input_shape(bench: BenchSpec, input_shape: dict[str, int], size: int | None):
    if size is None:
        return

    name = bench.get_name()
    minimum_size = MIN_SIZE_BY_BENCHMARK.get(name, 1)
    size = max(size, minimum_size)
    keys = set(input_shape.keys())

    if name == "topk":
        input_shape["M"] = size
        input_shape["N"] = size
        return

    if name == "lstm":
        input_shape["batch_size"] = size
        input_shape["in_dim"] = size
        return

    if name == "batch_norm":
        input_shape["H"] = size
        input_shape["W"] = size
        return

    if keys == {"N"}:
        input_shape["N"] = size
        return

    if {"batch_size", "in_dim"}.issubset(keys):
        input_shape["batch_size"] = size
        input_shape["in_dim"] = size
        return

    if {"M", "N", "K"}.issubset(keys):
        input_shape["M"] = size
        input_shape["N"] = size
        if name != "topk":
            input_shape["K"] = size
        return

    if {"M", "N"}.issubset(keys):
        input_shape["M"] = size
        input_shape["N"] = 1 if input_shape.get("N") == 1 else size
        return

    if {"H", "W"}.issubset(keys):
        input_shape["H"] = size
        input_shape["W"] = size
        if "inst_smax_1" in input_shape:
            input_shape["inst_smax_1"] = max(input_shape["W"] * input_shape.get("scale", 1), 1)
        return


def build_benchmark_cases(bench: BenchSpec, mode: str, custom_sizes: list[int] | None = None) -> list[BenchmarkCase]:
    default_input_shape = dict(bench.get_input_shape())
    default_symbolic_patches = dict(bench.get_symbolic_patches())
    sizes = choose_size_schedule(bench, mode, custom_sizes)
    cases = []
    for size in sizes:
        input_shape = dict(default_input_shape)
        symbolic_patches = dict(default_symbolic_patches)
        apply_size_to_input_shape(bench, input_shape, size)
        effective_size = infer_case_size(input_shape)
        cases.append(
            BenchmarkCase(
                size=effective_size,
                input_shape=input_shape,
                symbolic_patches=symbolic_patches,
            )
        )
    return cases


def list_benchmarks(specs: list[BenchSpec]):
    for spec in specs:
        print(f"{spec.get_name()} ({spec.__class__.__name__})")


def run_experiments(
    base_dir: str,
    mode: str,
    output_path: str,
    repeat: int,
    selected_ops: list[str] | None,
    append: bool,
    resume: bool,
    custom_sizes: list[int] | None = None,
):
    specs = filter_specs(get_all_specs(base_dir), selected_ops)
    if not specs:
        raise ValueError("No benchmarks selected.")

    if not append and not resume and os.path.exists(output_path):
        os.remove(output_path)

    completed_case_keys = load_completed_case_keys(output_path) if resume else set()
    total_specs = len(specs)
    output_exists = os.path.exists(output_path)
    for index, bench in enumerate(specs, start=1):
        try:
            cases = build_benchmark_cases(bench, mode, custom_sizes)
        except Exception as error:  # noqa: BLE001
            print(f"[{index}/{total_specs}] [failed] could not build cases for {bench.get_name()}: {error}")
            continue
        print(f"[{index}/{total_specs}] running {bench.get_name()} with {len(cases)} case(s)")
        for case in cases:
            key = case_identity(bench.get_name(), case)
            if key in completed_case_keys:
                print(f"  [skip] {bench.get_name()} size={case.size} already in {output_path}")
                continue

            try:
                row = run_single_case(bench, case, repeat=repeat)
                save_results_to_csv(output_path, [row], append=output_exists)
                output_exists = True
                completed_case_keys.add(key)
            except Exception as error:  # noqa: BLE001
                print(f"  [failed] {bench.get_name()} size={case.size}: {error}")
                continue


def add_common_run_arguments(parser: argparse.ArgumentParser, default_repeat: int, default_mode: str):
    parser.add_argument("--base-dir", type=str, default="./optimized", help="Directory for generated kernels")
    parser.add_argument("--repeat", type=int, default=default_repeat, help="Repeat count for each benchmark case")
    parser.add_argument("--ops", nargs="*", help="Optional benchmark filters by op name or class name")
    parser.add_argument(
        "--output",
        type=str,
        default=DEFAULT_OUTPUT_FILES[default_mode],
        help="CSV file for experiment results",
    )
    parser.add_argument("--append", action="store_true", help="Append to the output CSV instead of replacing it")
    parser.add_argument(
        "--resume",
        action=argparse.BooleanOptionalAction,
        default=True,
        help="Resume from existing CSV by skipping completed benchmark cases",
    )


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="Run overhead experiments for TVM symbolic-form benchmarks.")
    subparsers = parser.add_subparsers(dest="command", required=True)

    list_parser = subparsers.add_parser("list", help="List all available benchmarks")
    list_parser.add_argument("--base-dir", type=str, default="./optimized", help="Directory used to instantiate benchmarks")

    smoke_parser = subparsers.add_parser("smoke", help="Run one small validation case per benchmark")
    add_common_run_arguments(smoke_parser, default_repeat=1, default_mode="smoke")

    full_parser = subparsers.add_parser("full", help="Run the full experiment suite with bench-aware size schedules")
    add_common_run_arguments(full_parser, default_repeat=3, default_mode="full")

    custom_parser = subparsers.add_parser("run", help="Run a custom experiment using explicit size values")
    add_common_run_arguments(custom_parser, default_repeat=1, default_mode="custom")
    custom_parser.add_argument(
        "--sizes",
        type=int,
        nargs="+",
        required=True,
        help="One or more scalar size values to apply to each selected benchmark",
    )

    return parser


def main():
    parser = build_parser()
    args = parser.parse_args()

    if args.command == "list":
        list_benchmarks(get_all_specs(args.base_dir))
        return

    mode = "custom" if args.command == "run" else args.command
    run_experiments(
        base_dir=args.base_dir,
        mode=mode,
        output_path=args.output,
        repeat=args.repeat,
        selected_ops=args.ops,
        append=args.append,
        resume=args.resume,
        custom_sizes=getattr(args, "sizes", None),
    )


if __name__ == "__main__":
    main()
