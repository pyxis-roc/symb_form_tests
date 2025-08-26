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

class TVMRunner(ABC):
    @abstractmethod
    def run(self, module, input:dict)->int:
        """Run the TVM module with the given arguments."""
        
class BenchSpec(ABC):
    @abstractmethod
    def get_input(self) -> dict:
        """Get the input data for the benchmark."""
    
    @abstractmethod
    def get_kernel_llvm_path(self) -> str:
        """Get the path to the LLVM kernel."""
    
    @abstractmethod
    def get_tvm_runner(self) -> TVMRunner:
        """Get the TVM runner instance."""

    @abstractmethod
    def get_directory(self) -> str:
        """Get the current working directory for the benchmark."""
    
    @abstractmethod
    def get_name(self) -> str:
        """Get the name of the benchmark."""

class ConvBenchSpec(BenchSpec):
    def __init__(self):
        # Default input values for the convolution benchmark
        self.input = {
            "N": 1,  # Batch size
            "CI": 3,  # Input channels
            "H": 224,  # Input height
            "W": 224,  # Input width
            "CO": 64,  # Output channels
            "KH": 7,   # Kernel height
            "KW": 7,   # Kernel width
            "inst_pad_temp_2": 1,
            "null": 0
        }

    def get_input(self) -> dict:
        return self.input
    
    def get_kernel_llvm_path(self) -> str:
        return os.path.abspath(os.path.join(os.path.dirname(__file__), "./conv/conv.ll"))
    
    def get_directory(self):
        return os.path.abspath(os.path.join(os.path.dirname(__file__), "./conv"))

    class ConvRunner(TVMRunner):
        def run(self, module, input: dict):
            ctx = tvm.cpu(0)
            N = input.get("N", 1)
            CI = input.get("CI", 3)
            H = input.get("H", 224)
            W = input.get("W", 224)
            CO = input.get("CO", 64)
            KH = input.get("KH", 7)
            KW = input.get("KW", 7)

            A_np = np.random.randn(N, CI, H, W).astype("float32")
            Wt_np = np.random.randn(CO, CI, KH, KW).astype("float32")
            # Output shape for conv2d with stride=1, padding=1
            OH = H - KH + 3
            OW = W - KW + 3
            C_np = np.zeros((N, CO, OH, OW), dtype="float32")

            A = tvm.nd.array(A_np, ctx)
            Wt = tvm.nd.array(Wt_np, ctx)
            C = tvm.nd.array(C_np, ctx)

            func = module["conv"]

            start = perf_counter_ns()
            func(A, Wt, C)
            end = perf_counter_ns()

            return end - start


    def get_tvm_runner(self) -> TVMRunner:
        return self.ConvRunner()

    def get_name(self):
        return "conv2d_benchmark"

class MatmulBenchSpec(BenchSpec):

    def __init__(self):
        # Default input values for the matrix multiplication benchmark
        self.input = {
            "M": 128,  # Rows of A and C
            "N": 128,  # Columns of B and C
            "K": 128   # Columns of A, Rows of B
        }

    def get_input(self) -> dict:
        return self.input

    def get_kernel_llvm_path(self) -> str:
        return os.path.abspath(os.path.join(os.path.dirname(__file__), "./matmul/matmul.ll"))

    def get_directory(self):
        return os.path.abspath(os.path.join(os.path.dirname(__file__), "./matmul"))

    class MatmulRunner(TVMRunner):
        def run(self, module, input: dict):
            ctx = tvm.cpu(0)
            M = input.get("M", 128)
            N = input.get("N", 128)
            K = input.get("K", 128)

            A_np = np.random.randn(M, K).astype("float32")
            B_np = np.random.randn(K, N).astype("float32")
            C_np = np.zeros((M, N), dtype="float32")

            A = tvm.nd.array(A_np, ctx)
            B = tvm.nd.array(B_np, ctx)
            C = tvm.nd.array(C_np, ctx)

            func = module["matmul"]

            start = perf_counter_ns()
            func(A, B, C)
            end = perf_counter_ns()

            return end - start


    def get_tvm_runner(self) -> TVMRunner:
        return self.MatmulRunner()

    def get_name(self):
        return "matmul_benchmark"

class ConcatBenchSpec(BenchSpec):

    def __init__(self):
        # Default input values for the concatenation benchmark
        self.input = {
            "M": 128,  # Number of elements in each tensor
            "N": 128   # Number of tensors to concatenate
        }

    def get_input(self) -> dict:
        return self.input

    def get_kernel_llvm_path(self) -> str:
        return os.path.abspath(os.path.join(os.path.dirname(__file__), "./concat/concat.ll"))

    def get_directory(self):
        return os.path.abspath(os.path.join(os.path.dirname(__file__), "./concat"))

    class ConcatRunner(TVMRunner):
        def run(self, module, input: dict):
            ctx = tvm.cpu(0)
            M = input.get("M", 128)
            N = input.get("N", 128)  # Number of tensors to concatenate

            # Create N tensors of shape (M,) and concatenate along axis=0
            A = tvm.nd.array(np.random.randn(M, N).astype("float32"), ctx)
            B = tvm.nd.array(np.random.randn(M, N).astype("float32"), ctx)
            C = tvm.nd.array(np.zeros((M*2, N), dtype="float32"), ctx)

            func = module["concat"]
            
            start = perf_counter_ns()
            func(A, B, C)
            end = perf_counter_ns()
            return end - start

    def get_tvm_runner(self) -> TVMRunner:
        return self.ConcatRunner()

    def get_name(self):
        return "concat_benchmark"

class GatherBenchSpec(BenchSpec):
    def __init__(self):
        self.input = {
            "M": 128,  # Number of elements in the input tensor
            "N": 64,   # Number of indices to gather
            "K": 64    # Number of output elements
        }

    def get_input(self) -> dict:
        return self.input

    def get_kernel_llvm_path(self) -> str:
        return os.path.abspath(os.path.join(os.path.dirname(__file__), "./gather/gather.ll"))

    def get_directory(self):
        return os.path.abspath(os.path.join(os.path.dirname(__file__), "./gather"))

    class GatherRunner(TVMRunner):
        def run(self, module, input: dict):
            ctx = tvm.cpu(0)
            M = input.get("M", 128)
            N = input.get("N", 64)
            K = input.get("K", 64)

            A_np = np.random.randn(M,N).astype("float32")
            indices_np = np.random.randint(0, M, size=(K,)).astype("int32")
            C_np = np.zeros((K,N), dtype="float32")

            A = tvm.nd.array(A_np, ctx)
            indices = tvm.nd.array(indices_np, ctx)
            C = tvm.nd.array(C_np, ctx)

            func = module["gather"]

            start = perf_counter_ns()
            func(A, indices, C)
            end = perf_counter_ns()
            return end - start

    def get_tvm_runner(self) -> TVMRunner:
        return self.GatherRunner()

    def get_name(self):
        return "gather_benchmark"

class ReshapeBenchSpec(BenchSpec):

    def __init__(self):
        self.input = {
            "M": 128,  # Original shape
            "N": 64    # New shape
        }
    
    def get_input(self) -> dict:
        return self.input

    def get_kernel_llvm_path(self) -> str:
        return os.path.abspath(os.path.join(os.path.dirname(__file__), "./reshape/reshape.ll"))

    def get_directory(self):
        return os.path.abspath(os.path.join(os.path.dirname(__file__), "./reshape"))

    class ReshapeRunner(TVMRunner):
        def run(self, module, input: dict):
            ctx = tvm.cpu(0)
            M = input.get("M", 128)
            N = input.get("N", 64)

            A_np = np.random.randn(M,N).astype("float32")
            C_np = np.zeros((M*N,), dtype="float32")

            A = tvm.nd.array(A_np, ctx)
            C = tvm.nd.array(C_np, ctx)

            func = module["reshape"]

            start = perf_counter_ns()
            func(A, C)
            end = perf_counter_ns()
            return end - start

    def get_tvm_runner(self) -> TVMRunner:
        return self.ReshapeRunner()

    def get_name(self):
        return "reshape_benchmark"

class ShapeBenchSpec(BenchSpec):

    def __init__(self):
        self.input = {
            "M": 128,  # Shape dimension
            "N": 64    # Not used in this benchmark
        }
    
    def get_input(self) -> dict:
        return self.input

    def get_kernel_llvm_path(self) -> str:
        return os.path.abspath(os.path.join(os.path.dirname(__file__), "./shape/shape.ll"))

    def get_directory(self):
        return os.path.abspath(os.path.join(os.path.dirname(__file__), "./shape"))

    class ShapeRunner(TVMRunner):
        def run(self, module, input: dict):
            ctx = tvm.cpu(0)
            M = input.get("M", 128)
            N = input.get("N", 64)

            A_np = np.random.randn(M, N).astype("float32")
            C_np = np.zeros((2,), dtype="int32")

            A = tvm.nd.array(A_np, ctx)
            C = tvm.nd.array(C_np, ctx)

            func = module["shape"]
            
            start = perf_counter_ns()
            func(A, C)
            end = perf_counter_ns()
            return end - start 

    def get_tvm_runner(self) -> TVMRunner:
        return self.ShapeRunner()

    def get_name(self):
        return "shape_benchmark"

class SqueezeBenchSpec(BenchSpec):
    
    def __init__(self):
        self.input = {
            "M": 128,  # Original shape
            "N": 1     # Squeeze axis size
        }

    def get_input(self) -> dict:
        return self.input

    def get_kernel_llvm_path(self) -> str:
        return os.path.abspath(os.path.join(os.path.dirname(__file__), "./squeeze/squeeze.ll"))

    def get_directory(self):
        return os.path.abspath(os.path.join(os.path.dirname(__file__), "./squeeze"))

    class SqueezeRunner(TVMRunner):
        def run(self, module, input: dict):
            ctx = tvm.cpu(0)
            M = input.get("M", 128)
            N = input.get("N", 1)

            # Input shape is (M, 1), output shape is (M,)
            A_np = np.random.randn(M, N).astype("float32")
            C_np = np.zeros((M,), dtype="float32")

            A = tvm.nd.array(A_np, ctx)
            C = tvm.nd.array(C_np, ctx)

            func = module["squeeze"]
            
            start = perf_counter_ns()
            func(A, C)
            end = perf_counter_ns()
            return end - start


    def get_tvm_runner(self) -> TVMRunner:
        return self.SqueezeRunner()

    def get_name(self):
        return "squeeze_benchmark"
    
class UnsqueezeBenchSpec(BenchSpec):
    
    def __init__(self):
        self.input = {
            "M": 128,  # Original shape
            "N": 1     # Unsqueeze axis size
        }

    def get_input(self) -> dict:
        return self.input  

    def get_kernel_llvm_path(self) -> str:
        return os.path.abspath(os.path.join(os.path.dirname(__file__), "./unsqueeze/unsqueeze.ll"))

    def get_directory(self):
        return os.path.abspath(os.path.join(os.path.dirname(__file__), "./unsqueeze"))

    class UnsqueezeRunner(TVMRunner):
        def run(self, module, input: dict):
            ctx = tvm.cpu(0)
            M = input.get("M", 128)
            N = input.get("N", 1)

            # Input shape is (M, N), output shape is (M, N, 1)
            # But according to your creation, A is (M, N), C is unsqueezed at dim=1 -> (M, 1, N)
            # So input shape is (M, N), output shape is (M, 1, N)
            A_np = np.random.randn(M, N).astype("float32")
            C_np = np.zeros((M, 1, N), dtype="float32")

            A = tvm.nd.array(A_np, ctx)
            C = tvm.nd.array(C_np, ctx)

            func = module["unsqueeze"]

            start = perf_counter_ns()
            func(A, C)
            end = perf_counter_ns()

            return end - start

    def get_tvm_runner(self) -> TVMRunner:
        return self.UnsqueezeRunner()

    def get_name(self):
        return "unsqueeze_benchmark"

class AddBenchSpec(BenchSpec):

    def __init__(self):
        self.input = {
            "M": 128,  # Rows of A and B
            "N": 128   # Columns of A and B
        }

    def get_input(self) -> dict:
        return self.input

    def get_kernel_llvm_path(self) -> str:
        return os.path.abspath(os.path.join(os.path.dirname(__file__), "./add/add.ll"))

    def get_directory(self):
        return os.path.abspath(os.path.join(os.path.dirname(__file__), "./add"))

    class AddRunner(TVMRunner):
        def run(self, module, input: dict):
            ctx = tvm.cpu(0)
            M = input.get("M", 128)
            N = input.get("N", 128)

            A_np = np.random.randn(M, N).astype("float32")
            B_np = np.random.randn(M, N).astype("float32")
            C_np = np.zeros((M, N), dtype="float32")

            A = tvm.nd.array(A_np, ctx)
            B = tvm.nd.array(B_np, ctx)
            C = tvm.nd.array(C_np, ctx)

            func = module["add"]

            start = perf_counter_ns()
            func(A, B, C)
            end = perf_counter_ns()
            return end - start

    def get_tvm_runner(self) -> TVMRunner:
        return self.AddRunner()

    def get_name(self):
        return "add_benchmark"

class CastBenchSpec(BenchSpec):

    def __init__(self):
        self.input = {
            "M": 128,
            "N": 128
        }

    def get_input(self) -> dict:
        return self.input

    def get_kernel_llvm_path(self) -> str:
        return os.path.abspath(os.path.join(os.path.dirname(__file__), "./cast/cast.ll"))

    def get_directory(self):
        return os.path.abspath(os.path.join(os.path.dirname(__file__), "./cast"))

    class CastRunner(TVMRunner):
        def run(self, module, input: dict):
            ctx = tvm.cpu(0)
            M = input.get("M", 128)
            N = input.get("N", 128)

            A_np = np.random.randn(M, N).astype("float32")
            C_np = np.zeros((M, N), dtype="int32")

            A = tvm.nd.array(A_np, ctx)
            C = tvm.nd.array(C_np, ctx)

            func = module["cast"]

            start = perf_counter_ns()
            func(A, C)
            end = perf_counter_ns()
            return end - start

    def get_tvm_runner(self) -> TVMRunner:
        return self.CastRunner()

    def get_name(self):
        return "cast_benchmark"

class MulBenchSpec(BenchSpec):

    def __init__(self):
        self.input = {
            "M": 128,
            "N": 128,
            "K": 128
        }

    def get_input(self) -> dict:
        return self.input

    def get_kernel_llvm_path(self) -> str:
        return os.path.abspath(os.path.join(os.path.dirname(__file__), "./mul/mul.ll"))

    def get_directory(self):
        return os.path.abspath(os.path.join(os.path.dirname(__file__), "./mul"))

    class MulRunner(TVMRunner):
        def run(self, module, input: dict):
            ctx = tvm.cpu(0)
            M = input.get("M", 128)
            K = input.get("K", 128)
            N = input.get("N", 128)

            A_np = np.random.randn(M, K).astype("float32")
            B_np = np.random.randn(K, N).astype("float32")
            C_np = np.zeros((M, N), dtype="float32")

            A = tvm.nd.array(A_np, ctx)
            B = tvm.nd.array(B_np, ctx)
            C = tvm.nd.array(C_np, ctx)

            func = module["mul"]

            start = perf_counter_ns()
            func(A, B, C)
            end = perf_counter_ns()
            return end - start

    def get_tvm_runner(self) -> TVMRunner:
        return self.MulRunner()

    def get_name(self):
        return "mul_benchmark"

class ReluBenchSpec(BenchSpec):

    def __init__(self):
        self.input = {
            "M": 128,  # Rows of A
            "N": 128
        }

    def get_input(self) -> dict:
        return self.input

    def get_kernel_llvm_path(self) -> str:
        return os.path.abspath(os.path.join(os.path.dirname(__file__), "./relu/relu.ll"))

    def get_directory(self):
        return os.path.abspath(os.path.join(os.path.dirname(__file__), "./relu"))

    class ReluRunner(TVMRunner):
        def run(self, module, input: dict):
            ctx = tvm.cpu(0)
            M = input.get("M", 128)
            N = input.get("N", 128)

            A_np = np.random.randn(M, N).astype("float32")
            C_np = np.zeros((M, N), dtype="float32")

            A = tvm.nd.array(A_np, ctx)
            C = tvm.nd.array(C_np, ctx)

            func = module["relu"]

            start = perf_counter_ns()
            func(A, C)
            end = perf_counter_ns()
            return end - start

    def get_tvm_runner(self) -> TVMRunner:
        return self.ReluRunner()

    def get_name(self):
        return "relu_benchmark"
    
class SubBenchSpec(BenchSpec):

    def __init__(self):
        self.input = {
            "M": 128,  # Rows of A and B
            "N": 128   # Columns of A and B
        }

    def get_input(self) -> dict:
        return self.input

    def get_kernel_llvm_path(self) -> str:
        return os.path.abspath(os.path.join(os.path.dirname(__file__), "./sub/sub.ll"))

    def get_directory(self):
        return os.path.abspath(os.path.join(os.path.dirname(__file__), "./sub"))

    class SubRunner(TVMRunner):
        def run(self, module, input: dict):
            ctx = tvm.cpu(0)
            M = input.get("M", 128)
            N = input.get("N", 128)

            A_np = np.random.randn(M, N).astype("float32")
            B_np = np.random.randn(M, N).astype("float32")
            C_np = np.zeros((M, N), dtype="float32")

            A = tvm.nd.array(A_np, ctx)
            B = tvm.nd.array(B_np, ctx)
            C = tvm.nd.array(C_np, ctx)

            func = module["sub"]

            start = perf_counter_ns()
            func(A, B, C)
            end = perf_counter_ns()
            return end - start

    def get_tvm_runner(self) -> TVMRunner:
        return self.SubRunner()

    def get_name(self):
        return "sub_benchmark"

class TransposeBenchSpec(BenchSpec):

    def __init__(self):
        # Default input values for the transpose benchmark
        self.input = {
            "M": 128,  # Rows of A and C
            "N": 128   # Columns of A and C
        }

    def get_input(self) -> dict:
        return self.input

    def get_kernel_llvm_path(self) -> str:
        return os.path.abspath(os.path.join(os.path.dirname(__file__), "./transpose/transpose.ll"))

    def get_directory(self):
        return os.path.abspath(os.path.join(os.path.dirname(__file__), "./transpose"))

    class TransposeRunner(TVMRunner):
        def run(self, module, input: dict):
            ctx = tvm.cpu(0)
            M = input.get("M", 128)
            N = input.get("N", 128)

            A_np = np.random.randn(M, N).astype("float32")
            C_np = np.zeros((N, M), dtype="float32")

            A = tvm.nd.array(A_np, ctx)
            C = tvm.nd.array(C_np, ctx)

            func = module["transpose"]

            start = perf_counter_ns()
            func(A, C)
            end = perf_counter_ns()
            return end - start

    def get_tvm_runner(self) -> TVMRunner:
        return self.TransposeRunner()

    def get_name(self):
        return "transpose_benchmark"


def get_symb_overhead(bench:BenchSpec):
    input = bench.get_input()
    kernel_llvm_path = bench.get_kernel_llvm_path()

    symb_input_file = tempfile.NamedTemporaryFile(mode="w+", delete=False, suffix=".json")
    symb_input_path = symb_input_file.name

    with open(symb_input_path, "w") as f:
        json.dump(input, f)

    kernel_base_name = os.path.splitext(os.path.basename(kernel_llvm_path))[0]
    func_name = kernel_base_name + "_compute_"
    result = subprocess.run(
        ['symb-viewer', kernel_llvm_path, func_name, f'-subs={symb_input_path}', '--quiet', '--time'],
        check=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.DEVNULL,
        text=True
    )
    # Example output:
    # ----------------------------- 
    # Total time: 2.383399e-02s
    # Substitution time: 1.818739e-03s
    total_time = None
    subst_time = None
    for line in result.stdout.splitlines():
        m_total = re.search(r'Total time:\s*([0-9.eE+-]+)s', line)
        m_subst = re.search(r'Substitution time:\s*([0-9.eE+-]+)s', line)
        if m_total:
            total_time = float(m_total.group(1))
        if m_subst:
            subst_time = float(m_subst.group(1))
    if total_time is None or subst_time is None:
        raise RuntimeError("Failed to parse timing output from symb-viewer")
    total_elapsed = int(total_time * 1e9)
    exec_elapsed = int(subst_time * 1e9)

    return total_elapsed - exec_elapsed, exec_elapsed


def get_dynm_overhead(bench:BenchSpec):
    input_data = bench.get_input()
    kernel_path = bench.get_kernel_llvm_path()

    runner = bench.get_tvm_runner()
    module = tvm.runtime.load_module(kernel_path)
    exec_ns = runner.run(module, input_data)

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

    return init_ns, exec_ns


def run_benchmark(size, label):
    bench = None
    if label == "conv":
        bench = ConvBenchSpec()
        bench.input["H"] = size
        bench.input["W"] = size 
    elif label == "matmul":
        bench = MatmulBenchSpec()
        bench.input["M"] = size
        bench.input["N"] = size
        bench.input["K"] = size
    elif label == "add":
        bench = AddBenchSpec()
        bench.input["M"] = size
        bench.input["N"] = size
    elif label == "mul":
        bench = MulBenchSpec()
        bench.input["M"] = size
        bench.input["N"] = size
        bench.input["K"] = size
    elif label == "sub":
        bench = SubBenchSpec()
        bench.input["M"] = size
        bench.input["N"] = size
    elif label == "relu":
        bench = ReluBenchSpec()
        bench.input["M"] = size
        bench.input["N"] = size
    elif label == "cast":
        bench = CastBenchSpec()
        bench.input["M"] = size
        bench.input["N"] = size
    elif label == "concat":
        bench = ConcatBenchSpec()
        bench.input["M"] = size
        bench.input["N"] = size
    elif label == "gather":
        bench = GatherBenchSpec()
        bench.input["M"] = size
        bench.input["N"] = size
        bench.input["K"] = size
    elif label == "reshape":
        bench = ReshapeBenchSpec()
        bench.input["M"] = size
        bench.input["N"] = size
    elif label == "shape":
        bench = ShapeBenchSpec()
        bench.input["M"] = size
        bench.input["N"] = size
    elif label == "squeeze":
        bench = SqueezeBenchSpec()
        bench.input["M"] = size
        bench.input["N"] = 1
    elif label == "unsqueeze":
        bench = UnsqueezeBenchSpec()
        bench.input["M"] = size
        bench.input["N"] = 1
    elif label == "transpose":
        bench = TransposeBenchSpec()
        bench.input["M"] = size
        bench.input["N"] = size
    else:
        raise ValueError(f"Unsupported benchmark label: {label}")
    
    dynm_init_ns, dynm_exec_ns = get_dynm_overhead(bench)
    symb_init_ns, symb_exec_ns = get_symb_overhead(bench)

    return namedtuple("BenchmarkResult", ["dynm_init_ns", "dynm_exec_ns", "symb_init_ns", "symb_exec_ns"])(
        dynm_init_ns, dynm_exec_ns, symb_init_ns, symb_exec_ns
    )

def run_benchmarks(sizes, label, repeat=5):

    results = []
    for size in sizes:
        dynm_init_times = []
        dynm_exec_times = []
        symb_init_times = []
        symb_exec_times = []
        for _ in range(repeat):
            sleep(1)  # Sleep for 1 second between runs to avoid any potential interference
            result = run_benchmark(size, label)
            dynm_init_times.append(result.dynm_init_ns)
            dynm_exec_times.append(result.dynm_exec_ns)
            symb_init_times.append(result.symb_init_ns)
            symb_exec_times.append(result.symb_exec_ns)
            
        avg_dynm_init_ns = sum(dynm_init_times) // len(dynm_init_times)
        avg_dynm_exec_ns = sum(dynm_exec_times) // len(dynm_exec_times)
        avg_symb_init_ns = sum(symb_init_times) // len(symb_init_times)
        avg_symb_exec_ns = sum(symb_exec_times) // len(symb_exec_times)

        results.append({
            "size": size, 
            "avg_dynm_init_ns": avg_dynm_init_ns, 
            "avg_dynm_exec_ns": avg_dynm_exec_ns, 
            "avg_symb_init_ns": avg_symb_init_ns, 
            "avg_symb_exec_ns": avg_symb_exec_ns
        })
        print(
            f"{label} size={size},\n"
            f"  avg_dynm_init_time={avg_dynm_init_ns} ns,\n"
            f"  avg_dynm_exec_time={avg_dynm_exec_ns} ns,\n"
            f"  avg_symb_init_time={avg_symb_init_ns} ns,\n"
            f"  avg_symb_exec_time={avg_symb_exec_ns} ns"
        )
    return results


def save_results_to_csv(filename, labels, results_list: list[list]):
    with open(filename, "w", newline="") as csvfile:
        fieldnames = ["label", "size", "avg_dynm_init_ns", "avg_dynm_exec_ns", "avg_symb_init_ns", "avg_symb_exec_ns"]
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)

        writer.writeheader()
        for label, results in zip(labels, results_list):
            for result in results:
                row = {"label": label}
                row.update(result)
                writer.writerow(row)

if __name__ == "__main__":

    matmul_sizes = [64, 128, 256, 512, 1024, 2048, 4096]
    sizes = [64, 128, 256, 512, 1024, 2048, 4096, 8192]
    labels = [
        "conv", "matmul", "add", "mul", "sub", "relu", "cast", 
        "concat", "gather", "reshape", "shape", "squeeze", 
        "unsqueeze", "transpose"
    ]
    results = []
    for label in labels:
        if label == "matmul":
            result = run_benchmarks(matmul_sizes, label)
            results.append(result)
        else:
            result = run_benchmarks(sizes, label)
            results.append(result)
    
    save_results_to_csv("overhead_results.csv", labels, results)
