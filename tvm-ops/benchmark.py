import sys
import os
import tvm
import numpy as np
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../script-link')))

from compare import parse_instr, parse_symb, compare_results, print_compare_results, print_summary
import subprocess
import json
import tempfile
from abc import ABC, abstractmethod
from time import sleep

class TVMRunner(ABC):
    @abstractmethod
    def run(self, module, input:dict):
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


def benchmark(spec: BenchSpec, debug=False):

    # prepare input data
    input = spec.get_input()
    kernel_llvm_path = spec.get_kernel_llvm_path()
    tvm_runner = spec.get_tvm_runner()
    cwd = spec.get_directory()
    name = spec.get_name()

    os.chdir(cwd)

    def get_exact_count():
        # compile the kernel with instrumentation
        kernel_base = os.path.splitext(os.path.basename(kernel_llvm_path))[0]
        so_name = f"{kernel_base}-instr.so"
        subprocess.run(['instrGen', kernel_llvm_path, so_name], check=True, cwd=cwd)
        module = tvm.runtime.load_module(os.path.join(cwd, so_name))

        # run the module with the input data
        tvm_runner.run(module, input)
        # del module

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
                    ["getBBCounts", kernel_llvm_path, profraw_file],
                    stdout=outfile,
                    check=True
                )
            instr_results = parse_instr(instr_results_path)
            os.remove(instr_results_path)
            os.remove(profraw_file)
            return instr_results
        else:
            raise RuntimeError("No profraw file found. Make sure the instrumented run was successful.")

    def get_symb_count():
        symb_output_file = tempfile.NamedTemporaryFile(mode="w+", delete=False, suffix=".json"); 
        symb_input_file = tempfile.NamedTemporaryFile(mode="w+", delete=False, suffix=".json")
        symb_output_path = symb_output_file.name
        symb_input_path = symb_input_file.name

        with open(symb_input_path, "w") as f:
            json.dump(input, f)

        kernel_base_name = os.path.splitext(os.path.basename(kernel_llvm_path))[0]
        func_name = kernel_base_name + "_compute_"
        subprocess.run(
            ['symb-viewer', kernel_llvm_path, func_name, f'-subs={symb_input_path}', f'-json={symb_output_path}'],
            check=True
        )

        # with open(symb_output_path, "r") as f:
        #     input_data = f.read()
        #     basic_graphs = parse_basic_graphs(input_data)
        # os.remove(symb_output_path)

        # with tempfile.NamedTemporaryFile(mode="w+", delete=False, suffix=".json") as eval_json_file:
        #     eval_json_path = eval_json_file.name
        #     # evaluated_graphs = symb_eval(input, basic_graphs)
        #     # formated = format_evaluated_graphs(evaluated_graphs)
        #     json.dump(formated, eval_json_file)

        result = parse_symb(symb_output_path)
        os.remove(symb_output_path)

        return result

    # Get exact counts from instrumented run
    instr_counts = get_exact_count()
    symb_counts = get_symb_count()

    # Compare results
    results, summary = compare_results(instr_counts, symb_counts)
    
    print(f"Benchmark: {name}")
    if (debug):
        print_compare_results(results, summary)
    else:
        print_summary(summary)

class ConvBenchSpec(BenchSpec):

    def get_input(self) -> dict:
        return {
            "N": 1,  # Batch size
            "CI": 3,  # Input channels
            "H": 224,  # Input height
            "W": 224,  # Input width
            "CO": 64,  # Output channels
            "KH": 7,   # Kernel height
            "KW": 7,   # Kernel width
            "inst_pad_temp_2": 1,
            "null": 0,
            # 'TR_%for_begin_i3.preheader.us.us.us.us.us.us': 1,
            # "TR_%for_body_i3.us13.us.us.us.us.us.epil" : 0,
            'inst_smax_1': 226
        }
    
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
            func(A, Wt, C)


    def get_tvm_runner(self) -> TVMRunner:
        return self.ConvRunner()

    def get_name(self):
        return "conv2d_benchmark"

class MatmulBenchSpec(BenchSpec):

    def get_input(self) -> dict:
        return {
            "M": 128,  # Rows of A and C
            "N": 128,  # Columns of B and C
            "K": 128   # Columns of A, Rows of B
        }

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
            func(A, B, C)


    def get_tvm_runner(self) -> TVMRunner:
        return self.MatmulRunner()

    def get_name(self):
        return "matmul_benchmark"

class ConcatBenchSpec(BenchSpec):

    def get_input(self) -> dict:
        return {
            "M": 128,
            "N": 128,  # Number of tensors to concatenate
            "inst_smax_1": 128 * 2,
        }

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
            func(A, B, C)

    def get_tvm_runner(self) -> TVMRunner:
        return self.ConcatRunner()

    def get_name(self):
        return "concat_benchmark"

class GatherBenchSpec(BenchSpec):

    def get_input(self) -> dict:
        return {
            "M": 128,  # Number of elements in the input tensor
            "N": 64,   # Number of indices to gather
            "K": 64
        }

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
            func(A, indices, C)

    def get_tvm_runner(self) -> TVMRunner:
        return self.GatherRunner()

    def get_name(self):
        return "gather_benchmark"

class ReshapeBenchSpec(BenchSpec):
    
    def get_input(self) -> dict:
        return {
            "M": 128,  # Original shape
            "N": 64,   # New shape
        }

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
            func(A, C)

    def get_tvm_runner(self) -> TVMRunner:
        return self.ReshapeRunner()

    def get_name(self):
        return "reshape_benchmark"

class ShapeBenchSpec(BenchSpec):
    
    def get_input(self) -> dict:
        return {
            "M": 128,  # Shape dimension
            "N": 64,   # Not used in this benchmark
        }

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
            func(A, C)

    def get_tvm_runner(self) -> TVMRunner:
        return self.ShapeRunner()

    def get_name(self):
        return "shape_benchmark"

class SqueezeBenchSpec(BenchSpec):
    
    def get_input(self) -> dict:
        return {
            "M": 128,  # Original shape
            "N": 1,    # Squeeze axis size
        }

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
            func(A, C)

    def get_tvm_runner(self) -> TVMRunner:
        return self.SqueezeRunner()

    def get_name(self):
        return "squeeze_benchmark"
    
class UnsqueezeBenchSpec(BenchSpec):
    
    def get_input(self) -> dict:
        return {
            "M": 128,  # Original shape
            "N": 1,    # Unsqueeze axis size
        }

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
            func(A, C)

    def get_tvm_runner(self) -> TVMRunner:
        return self.UnsqueezeRunner()

    def get_name(self):
        return "unsqueeze_benchmark"

class AddBenchSpec(BenchSpec):
    def get_input(self) -> dict:
        return {
            "M": 128,
            "N": 128
        }

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
            func(A, B, C)

    def get_tvm_runner(self) -> TVMRunner:
        return self.AddRunner()

    def get_name(self):
        return "add_benchmark"

class CastBenchSpec(BenchSpec):
    def get_input(self) -> dict:
        return {
            "M": 128,
            "N": 128
        }

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
            func(A, C)

    def get_tvm_runner(self) -> TVMRunner:
        return self.CastRunner()

    def get_name(self):
        return "cast_benchmark"

class MulBenchSpec(BenchSpec):
    def get_input(self) -> dict:
        return {
            "M": 128,
            "K": 128,
            "N": 128
        }

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
            func(A, B, C)

    def get_tvm_runner(self) -> TVMRunner:
        return self.MulRunner()

    def get_name(self):
        return "mul_benchmark"

class ReluBenchSpec(BenchSpec):
    def get_input(self) -> dict:
        return {
            "M": 128,
            "N": 128
        }

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
            func(A, C)

    def get_tvm_runner(self) -> TVMRunner:
        return self.ReluRunner()

    def get_name(self):
        return "relu_benchmark"
    
class SubBenchSpec(BenchSpec):
    def get_input(self) -> dict:
        return {
            "M": 128,
            "N": 128
        }

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
            func(A, B, C)

    def get_tvm_runner(self) -> TVMRunner:
        return self.SubRunner()

    def get_name(self):
        return "sub_benchmark"

class TransposeBenchSpec(BenchSpec):
    def get_input(self) -> dict:
        return {
            "M": 128,
            "N": 128
        }

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
            func(A, C)

    def get_tvm_runner(self) -> TVMRunner:
        return self.TransposeRunner()

    def get_name(self):
        return "transpose_benchmark"

# if __name__ == '__main__':
#     for bench_cls in [
#         ConvBenchSpec,
#         MatmulBenchSpec,
#         ConcatBenchSpec,
#         GatherBenchSpec,
#         ReshapeBenchSpec,
#         ShapeBenchSpec,
#         SqueezeBenchSpec,
#         UnsqueezeBenchSpec,
#         AddBenchSpec,
#         CastBenchSpec,
#         MulBenchSpec,
#         ReluBenchSpec,
#         SubBenchSpec,
#         TransposeBenchSpec,
#     ]:
#         benchmark(bench_cls())




benchmark(ConvBenchSpec(), debug=True)
# benchmark(ConcatBenchSpec(), debug=True)
# benchmark(TransposeBenchSpec(), debug=True)