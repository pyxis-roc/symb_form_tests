from benchmark_spec import BenchSpec, TVMRunner
import os
import tvm
import tvm.topi
import numpy as np
from time import perf_counter_ns

class BaseBenchSpec(BenchSpec):
    def apply_optimizations(self, IRmod):
        """Apply a common sequence of optimizations to the IRModule."""
        seq = tvm.transform.Sequential([
            tvm.tir.transform.Simplify(),
            tvm.tir.transform.LoopPartition(),
            tvm.tir.transform.VectorizeLoop(),
            tvm.tir.transform.UnrollLoop(),
            tvm.tir.transform.InjectVirtualThread(),
            tvm.tir.transform.InjectDoubleBuffer(),
            tvm.tir.transform.ThreadSync("shared"),
            tvm.tir.transform.ThreadSync("warp"),
            tvm.tir.transform.RemoveNoOp(),
            tvm.tir.transform.HoistIfThenElse(),
            tvm.tir.transform.SplitHostDevice()
        ])
        with tvm.transform.PassContext(opt_level=3):
            return seq(IRmod)

class ConvBenchSpec(BaseBenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {
            "inst_pad_temp_2": 1,
            "null": 0,
            'inst_smax_1': 226
        }
        self.input_shape = {
            "N": 1,  # Batch size
            "CI": 3,  # Input channels
            "H": 224,  # Input height
            "W": 224,  # Input width
            "CO": 64,  # Output channels
            "KH": 7,   # Kernel height
            "KW": 7,   # Kernel width
        }

    def get_input_shape(self) -> dict:
        return self.input_shape

    def generate_kernel(self):
        """Generate a conv2d kernel using tvm.topi.nn.conv2d."""
        N = tvm.te.var("N")
        CI = tvm.te.var("CI")
        H = tvm.te.var("H")
        W = tvm.te.var("W")
        CO = tvm.te.var("CO")
        KH = tvm.te.var("KH")
        KW = tvm.te.var("KW")
        A = tvm.te.placeholder((N, CI, H, W), "float32", name="A")
        Wt = tvm.te.placeholder((CO, CI, KH, KW), "float32", name="W")
        C = tvm.topi.nn.conv2d(A, Wt, strides=1, padding=1, dilation=1, out_dtype="float32")
        te_func = tvm.te.create_prim_func([A, Wt, C]).with_attr({"global_symbol": "conv"})
        IRmod = tvm.IRModule({"conv": te_func})
        IRmod = self.apply_optimizations(IRmod)
        runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
        os.makedirs(self.get_directory(), exist_ok=True)
        with open(self.get_kernel_llvm_path(), 'w') as f:
            f.write(runtime_mod.get_source())

    class ConvRunner(TVMRunner):
        def run(self, module, input: dict) -> int:
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
        return "conv"

class MatmulBenchSpec(BaseBenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}
        self.input_shape = {
            "M": 128,  # Rows of A and C
            "N": 128,  # Columns of B and C
            "K": 128   # Columns of A, Rows of B
        }

    def get_input_shape(self) -> dict:
        return self.input_shape

    def generate_kernel(self):
        """Generate a matmul kernel using tvm.topi.nn.matmul."""
        M = tvm.te.var("M")
        K = tvm.te.var("K")
        N = tvm.te.var("N")
        A = tvm.te.placeholder((M, K), "float32", name="A")
        B = tvm.te.placeholder((K, N), "float32", name="B")
        C = tvm.topi.nn.matmul(A, B)
        te_func = tvm.te.create_prim_func([A, B, C]).with_attr({"global_symbol": "matmul"})
        IRmod = tvm.IRModule({"matmul": te_func})
        IRmod = self.apply_optimizations(IRmod)
        runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
        os.makedirs(self.get_directory(), exist_ok=True)
        with open(self.get_kernel_llvm_path(), 'w') as f:
            f.write(runtime_mod.get_source())

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
        return "matmul"

class ConcatBenchSpec(BaseBenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {
            "inst_smax_1": 128 * 2
        }
        self.input_shape = {
            "M": 128,
            "N": 128,  # Number of tensors to concatenate
        }

    def get_input_shape(self) -> dict:
        return self.input_shape

    def generate_kernel(self):
        """Generate a concat kernel using tvm.topi.concatenate."""
        M = tvm.te.var("M")
        N = tvm.te.var("N")
        A = tvm.te.placeholder((M, N), "float32", name="A")
        B = tvm.te.placeholder((M, N), "float32", name="B")
        C = tvm.topi.concatenate([A, B], axis=0)
        te_func = tvm.te.create_prim_func([A, B, C]).with_attr({"global_symbol": "concat"})
        IRmod = tvm.IRModule({"concat": te_func})
        IRmod = self.apply_optimizations(IRmod)
        runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
        os.makedirs(self.get_directory(), exist_ok=True)
        with open(self.get_kernel_llvm_path(), 'w') as f:
            f.write(runtime_mod.get_source())

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
        return "concat"

class GatherBenchSpec(BaseBenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}
        self.input_shape = {
            "M": 128,  # Number of elements in the input tensor
            "N": 64,   # Number of indices to gather
            "K": 64
        }

    def get_input_shape(self) -> dict:
        return self.input_shape

    def generate_kernel(self):
        """Generate a gather kernel using tvm.topi.take."""
        M = tvm.te.var("M")
        N = tvm.te.var("N")
        K = tvm.te.var("K")
        A = tvm.te.placeholder((M, N), "float32", name="A")
        indices = tvm.te.placeholder((K,), "int32", name="indices")
        C = tvm.topi.take(A, indices, axis=0)
        te_func = tvm.te.create_prim_func([A, indices, C]).with_attr({"global_symbol": "gather"})
        IRmod = tvm.IRModule({"gather": te_func})
        IRmod = self.apply_optimizations(IRmod)
        runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
        os.makedirs(self.get_directory(), exist_ok=True)
        with open(self.get_kernel_llvm_path(), 'w') as f:
            f.write(runtime_mod.get_source())

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
        return "gather"

class ReshapeBenchSpec(BaseBenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}
        self.input_shape = {
            "M": 128,  # Original shape
            "N": 64,   # New shape
        }

    def get_input_shape(self) -> dict:
        return self.input_shape

    def generate_kernel(self):
        """Generate a reshape kernel using tvm.topi.reshape."""
        M = tvm.te.var("M")
        N = tvm.te.var("N")
        A = tvm.te.placeholder((M, N), "float32", name="A")
        C = tvm.topi.reshape(A, (M * N,))
        te_func = tvm.te.create_prim_func([A, C]).with_attr({"global_symbol": "reshape"})
        IRmod = tvm.IRModule({"reshape": te_func})
        IRmod = self.apply_optimizations(IRmod)
        runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
        os.makedirs(self.get_directory(), exist_ok=True)
        with open(self.get_kernel_llvm_path(), 'w') as f:
            f.write(runtime_mod.get_source())

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
        return "reshape"

class ShapeBenchSpec(BaseBenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}
        self.input_shape = {
            "M": 128,  # Shape dimension
            "N": 64,   # Not used in this benchmark
        }

    def get_input_shape(self) -> dict:
        return self.input_shape

    def generate_kernel(self):
        """Generate a shape kernel using tvm.topi.shape."""
        M = tvm.te.var("M")
        N = tvm.te.var("N")
        A = tvm.te.placeholder((M, N), "float32", name="A")
        # Shape is a constant op, so we just output the shape as a tensor
        out_shape = tvm.topi.shape(A)
        te_func = tvm.te.create_prim_func([A, out_shape]).with_attr({"global_symbol": "shape"})
        IRmod = tvm.IRModule({"shape": te_func})
        IRmod = self.apply_optimizations(IRmod)
        runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
        os.makedirs(self.get_directory(), exist_ok=True)
        with open(self.get_kernel_llvm_path(), 'w') as f:
            f.write(runtime_mod.get_source())

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
        return "shape"

class SqueezeBenchSpec(BaseBenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}
        self.input_shape = {
            "M": 128,  # Original shape
            "N": 1,    # Squeeze axis size
        }

    def get_input_shape(self) -> dict:
        return self.input_shape

    def generate_kernel(self):
        """Generate a squeeze kernel using tvm.topi.squeeze."""
        M = tvm.te.var("M")
        A = tvm.te.placeholder((M, 1), "float32", name="A")
        C = tvm.topi.squeeze(A, axis=[1])
        te_func = tvm.te.create_prim_func([A, C]).with_attr({"global_symbol": "squeeze"})
        IRmod = tvm.IRModule({"squeeze": te_func})
        IRmod = self.apply_optimizations(IRmod)
        runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
        os.makedirs(self.get_directory(), exist_ok=True)
        with open(self.get_kernel_llvm_path(), 'w') as f:
            f.write(runtime_mod.get_source())

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
        return "squeeze"
    
class UnsqueezeBenchSpec(BaseBenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}
        self.input_shape = {
            "M": 128,  # Original shape
            "N": 1,    # Unsqueeze axis size
        }

    def get_input_shape(self) -> dict:
        return self.input_shape

    def generate_kernel(self):
        """Generate an unsqueeze kernel using tvm.topi.expand_dims."""
        M = tvm.te.var("M")
        N = tvm.te.var("N")
        A = tvm.te.placeholder((M, N), "float32", name="A")
        C = tvm.topi.expand_dims(A, axis=1, num_newaxis=1)
        te_func = tvm.te.create_prim_func([A, C]).with_attr({"global_symbol": "unsqueeze"})
        IRmod = tvm.IRModule({"unsqueeze": te_func})
        IRmod = self.apply_optimizations(IRmod)
        runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
        os.makedirs(self.get_directory(), exist_ok=True)
        with open(self.get_kernel_llvm_path(), 'w') as f:
            f.write(runtime_mod.get_source())

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
        return "unsqueeze"

class AddBenchSpec(BaseBenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}
        self.input_shape = {
            "M": 128,
            "N": 128
        }

    def get_input_shape(self) -> dict:
        return self.input_shape

    def generate_kernel(self):
        """Generate an add kernel using tvm.topi.nn.add."""
        M = tvm.te.var("M")
        N = tvm.te.var("N")
        A = tvm.te.placeholder((M, N), "float32", name="A")
        B = tvm.te.placeholder((M, N), "float32", name="B")
        C = tvm.topi.nn.add(A, B)
        te_func = tvm.te.create_prim_func([A, B, C]).with_attr({"global_symbol": "add"})
        IRmod = tvm.IRModule({"add": te_func})
        IRmod = self.apply_optimizations(IRmod)
        runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
        os.makedirs(self.get_directory(), exist_ok=True)
        with open(self.get_kernel_llvm_path(), 'w') as f:
            f.write(runtime_mod.get_source())

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
        return "add"

class CastBenchSpec(BaseBenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}
        self.input_shape = {
            "M": 128,
            "N": 128
        }

    def get_input_shape(self) -> dict:
        return self.input_shape

    def generate_kernel(self):
        """Generate a cast kernel using tvm.topi.cast."""
        M = tvm.te.var("M")
        N = tvm.te.var("N")
        A = tvm.te.placeholder((M, N), "float32", name="A")
        C = tvm.topi.cast(A, "int32")
        te_func = tvm.te.create_prim_func([A, C]).with_attr({"global_symbol": "cast"})
        IRmod = tvm.IRModule({"cast": te_func})
        IRmod = self.apply_optimizations(IRmod)
        runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
        os.makedirs(self.get_directory(), exist_ok=True)
        with open(self.get_kernel_llvm_path(), 'w') as f:
            f.write(runtime_mod.get_source())

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
        return "cast"

class MulBenchSpec(BaseBenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}
        self.input_shape = {
            "M": 128,
            "K": 128,
            "N": 128
        }

    def get_input_shape(self) -> dict:
        return self.input_shape

    def generate_kernel(self):
        """Generate a multiplication kernel using tvm.topi.multiply."""
        M = tvm.te.var("M")
        N = tvm.te.var("N")
        A = tvm.te.placeholder((M, N), "float32", name="A")
        B = tvm.te.placeholder((M, N), "float32", name="B")
        C = tvm.topi.multiply(A, B)
        te_func = tvm.te.create_prim_func([A, B, C]).with_attr({"global_symbol": "mul"})
        IRmod = tvm.IRModule({"mul": te_func})
        IRmod = self.apply_optimizations(IRmod)
        runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
        os.makedirs(self.get_directory(), exist_ok=True)
        with open(self.get_kernel_llvm_path(), 'w') as f:
            f.write(runtime_mod.get_source())

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
        return "mul"

class ReluBenchSpec(BaseBenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}
        self.input_shape = {
            "M": 128,
            "N": 128
        }

    def get_input_shape(self) -> dict:
        return self.input_shape

    def generate_kernel(self):
        """Generate a relu kernel using tvm.topi.nn.relu."""
        M = tvm.te.var("M")
        N = tvm.te.var("N")
        A = tvm.te.placeholder((M, N), "float32", name="A")
        C = tvm.topi.nn.relu(A)
        te_func = tvm.te.create_prim_func([A, C]).with_attr({"global_symbol": "relu"})
        IRmod = tvm.IRModule({"relu": te_func})
        IRmod = self.apply_optimizations(IRmod)
        runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
        os.makedirs(self.get_directory(), exist_ok=True)
        with open(self.get_kernel_llvm_path(), 'w') as f:
            f.write(runtime_mod.get_source())

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
        return "relu"
    
class SubBenchSpec(BaseBenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}
        self.input_shape = {
            "M": 128,
            "N": 128
        }

    def get_input_shape(self) -> dict:
        return self.input_shape

    def generate_kernel(self):
        """Generate a subtraction kernel using tvm.topi.subtract."""
        M = tvm.te.var("M")
        N = tvm.te.var("N")
        A = tvm.te.placeholder((M, N), "float32", name="A")
        B = tvm.te.placeholder((M, N), "float32", name="B")
        C = tvm.topi.subtract(A, B)
        te_func = tvm.te.create_prim_func([A, B, C]).with_attr({"global_symbol": "sub"})
        IRmod = tvm.IRModule({"sub": te_func})
        IRmod = self.apply_optimizations(IRmod)
        runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
        os.makedirs(self.get_directory(), exist_ok=True)
        with open(self.get_kernel_llvm_path(), 'w') as f:
            f.write(runtime_mod.get_source())

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
        return "sub"

class TransposeBenchSpec(BaseBenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}
        self.input_shape = {
            "M": 128,
            "N": 128
        }

    def get_input_shape(self) -> dict:
        return self.input_shape

    def generate_kernel(self):
        """Generate a transpose kernel using tvm.topi.transpose."""
        M = tvm.te.var("M")
        N = tvm.te.var("N")
        A = tvm.te.placeholder((M, N), "float32", name="A")
        C = tvm.topi.transpose(A)
        te_func = tvm.te.create_prim_func([A, C]).with_attr({"global_symbol": "transpose"})
        IRmod = tvm.IRModule({"transpose": te_func})
        IRmod = self.apply_optimizations(IRmod)
        runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
        os.makedirs(self.get_directory(), exist_ok=True)
        with open(self.get_kernel_llvm_path(), 'w') as f:
            f.write(runtime_mod.get_source())

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
        return "transpose"

class SliceBenchSpec(BaseBenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}
        self.input_shape = {
            "M": 128,
            "N": 128,
        }

    def get_input_shape(self) -> dict:
        return self.input_shape

    def generate_kernel(self):
        """Generate a slice kernel using tvm.topi.strided_slice."""
        M = tvm.te.var("M")
        N = tvm.te.var("N")
        A = tvm.te.placeholder((M, N), "float32", name="A")
        C = tvm.topi.strided_slice(A, begin=[0, 0], end = [64, 64], strides=[1, 1])  # Use constant values
        te_func = tvm.te.create_prim_func([A, C]).with_attr({"global_symbol": "slice"})
        IRmod = tvm.IRModule({"slice": te_func})
        IRmod = self.apply_optimizations(IRmod)
        runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
        os.makedirs(self.get_directory(), exist_ok=True)
        with open(self.get_kernel_llvm_path(), 'w') as f:
            f.write(runtime_mod.get_source())

    class SliceRunner(TVMRunner):
        def run(self, module, input: dict):
            ctx = tvm.cpu(0)
            M = input.get("M", 128)
            N = input.get("N", 128)

            A_np = np.random.randn(M, N).astype("float32")
            C_np = np.zeros((64, 64), dtype="float32")

            A = tvm.nd.array(A_np, ctx)
            C = tvm.nd.array(C_np, ctx)

            func = module["slice"]
            start = perf_counter_ns()
            func(A, C)
            end = perf_counter_ns()
            return end - start

    def get_tvm_runner(self) -> TVMRunner:
        return self.SliceRunner()

    def get_name(self):
        return "slice"

class BatchNormalizationBenchSpec(BaseBenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {
            'inst_T_subtract5_1': 1,
            'inst_T_subtract5_2': 1,
            'inst_T_subtract5_3': 1,
            'inst_T_subtract5_4': 1,
            'inst_T_subtract5_5': 1,
            'inst_T_subtract_1':1,
            'inst_T_subtract_2':1,
            'inst_T_subtract_3':1,
            'inst_T_subtract_4':1,
            'inst_T_subtract_5':1,
            'inst_T_subtract_6':1,
            'inst_T_subtract10_1':1,
            'inst_T_subtract10_2':1,
            'inst_T_subtract10_3':1,
            'inst_T_subtract10_4':1,
            'inst_T_subtract10_5':1,
            'inst_T_subtract10_6':1,
            'inst_A_red_1': 1,
            'inst_A_red_2': 1,
            'inst_A_red_3': 1,
            'inst_A_red_4': 1,
            'inst_A_red_5': 1,
            'inst_A_red_6': 1,
            'inst_A_red_7': 1,
            'inst__1': 0,
            'inst__2': 0,
            'inst__3': 0,
            'inst__4': 0,
            'null':0
        }
        self.input_shape = {
            "N": 128,  # Batch size
            "C": 64,   # Channels
            "H": 32,   # Height
            "W": 32    # Width
        }

    def get_input_shape(self) -> dict:
        return self.input_shape

    def generate_kernel(self):
        """Generate a batch normalization kernel using tvm.topi.nn.batch_norm."""
        N = tvm.te.var("N")
        C = tvm.te.var("C")
        H = tvm.te.var("H")
        W = tvm.te.var("W")
        A = tvm.te.placeholder((N, C, H, W), "float32", name="A")
        gamma = tvm.te.placeholder((C,), "float32", name="gamma")
        beta = tvm.te.placeholder((C,), "float32", name="beta")
        moving_mean = tvm.te.placeholder((C,), "float32", name="moving_mean")
        moving_var = tvm.te.placeholder((C,), "float32", name="moving_var")
        C, _, _ = tvm.topi.nn.batch_norm(A, gamma, beta, moving_mean, moving_var)
        te_func = tvm.te.create_prim_func([A, gamma, beta, moving_mean, moving_var, C]).with_attr({"global_symbol": "batch_norm"})
        IRmod = tvm.IRModule({"batch_norm": te_func})
        IRmod = self.apply_optimizations(IRmod)
        runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
        os.makedirs(self.get_directory(), exist_ok=True)
        with open(self.get_kernel_llvm_path(), 'w') as f:
            f.write(runtime_mod.get_source())

    class BatchNormalizationRunner(TVMRunner):
        def run(self, module, input: dict):
            ctx = tvm.cpu(0)
            N = input.get("N", 128)
            C = input.get("C", 64)
            H = input.get("H", 32)
            W = input.get("W", 32)

            A_np = np.random.randn(N, C, H, W).astype("float32")
            gamma_np = np.random.randn(C).astype("float32")
            beta_np = np.random.randn(C).astype("float32")
            moving_mean_np = np.random.randn(C).astype("float32")
            moving_var_np = np.random.randn(C).astype("float32")
            C_np = np.zeros((N, C, H, W), dtype="float32")

            A = tvm.nd.array(A_np, ctx)
            gamma = tvm.nd.array(gamma_np, ctx)
            beta = tvm.nd.array(beta_np, ctx)
            moving_mean = tvm.nd.array(moving_mean_np, ctx)
            moving_var = tvm.nd.array(moving_var_np, ctx)
            C = tvm.nd.array(C_np, ctx)

            func = module["batch_norm"]
            start = perf_counter_ns()
            func(A, gamma, beta, moving_mean, moving_var, C)
            end = perf_counter_ns()
            return end - start

    def get_tvm_runner(self) -> TVMRunner:
        return self.BatchNormalizationRunner()

    def get_name(self):
        return "batch_norm"

class DivBenchSpec(BaseBenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}
        self.input_shape = {
            "M": 128,
            "N": 128
        }

    def get_input_shape(self) -> dict:
        return self.input_shape

    def generate_kernel(self):
        """Generate a division kernel using tvm.topi.divide."""
        M = tvm.te.var("M")
        N = tvm.te.var("N")
        A = tvm.te.placeholder((M, N), "float32", name="A")
        B = tvm.te.placeholder((M, N), "float32", name="B")
        C = tvm.topi.divide(A, B)
        te_func = tvm.te.create_prim_func([A, B, C]).with_attr({"global_symbol": "div"})
        IRmod = tvm.IRModule({"div": te_func})
        IRmod = self.apply_optimizations(IRmod)
        runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
        os.makedirs(self.get_directory(), exist_ok=True)
        with open(self.get_kernel_llvm_path(), 'w') as f:
            f.write(runtime_mod.get_source())

    class DivRunner(TVMRunner):
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

            func = module["div"]
            start = perf_counter_ns()
            func(A, B, C)
            end = perf_counter_ns()
            return end - start

    def get_tvm_runner(self) -> TVMRunner:
        return self.DivRunner()

    def get_name(self):
        return "div"

class SumBenchSpec(BaseBenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}
        self.input_shape = {
            "M": 128,
            "N": 128
        }

    def get_input_shape(self) -> dict:
        return self.input_shape

    def generate_kernel(self):
        """Generate a sum kernel using tvm.topi.sum."""
        M = tvm.te.var("M")
        N = tvm.te.var("N")
        A = tvm.te.placeholder((M, N), "float32", name="A")
        C = tvm.topi.sum(A, axis=1)
        te_func = tvm.te.create_prim_func([A, C]).with_attr({"global_symbol": "sum"})
        IRmod = tvm.IRModule({"sum": te_func})
        IRmod = self.apply_optimizations(IRmod)
        runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
        os.makedirs(self.get_directory(), exist_ok=True)
        with open(self.get_kernel_llvm_path(), 'w') as f:
            f.write(runtime_mod.get_source())

    class SumRunner(TVMRunner):
        def run(self, module, input: dict):
            ctx = tvm.cpu(0)
            M = input.get("M", 128)
            N = input.get("N", 128)

            A_np = np.random.randn(M, N).astype("float32")
            C_np = np.zeros((M,), dtype="float32")

            A = tvm.nd.array(A_np, ctx)
            C = tvm.nd.array(C_np, ctx)

            func = module["sum"]
            start = perf_counter_ns()
            func(A, C)
            end = perf_counter_ns()
            return end - start

    def get_tvm_runner(self) -> TVMRunner:
        return self.SumRunner()

    def get_name(self):
        return "sum"

class NonZeroBenchSpec(BaseBenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {
            'inst_Z_1': 1,
            'null': 0
        }
        self.input_shape = {
            "M": 128,
            "N": 128
        }

    def get_input_shape(self) -> dict:
        return self.input_shape

    def generate_kernel(self):
        """Generate a nonzero kernel using tvm.topi.nonzero."""
        M = tvm.te.var("M")
        N = tvm.te.var("N")
        A = tvm.te.placeholder((M, N), "float32", name="A")
        Z = tvm.te.compute((M, N), lambda i, j: 0, name="Z")
        C = tvm.topi.not_equal(A, Z)
        te_func = tvm.te.create_prim_func([A, C]).with_attr({"global_symbol": "nonzero"})
        IRmod = tvm.IRModule({"nonzero": te_func})
        IRmod = self.apply_optimizations(IRmod)
        runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
        os.makedirs(self.get_directory(), exist_ok=True)
        with open(self.get_kernel_llvm_path(), 'w') as f:
            f.write(runtime_mod.get_source())

    class NonZeroRunner(TVMRunner):
        def run(self, module, input: dict):
            ctx = tvm.cpu(0)
            M = input.get("M", 128)
            N = input.get("N", 128)

            A_np = np.random.randn(M, N).astype("float32")
            C_np = np.zeros((M, N), dtype="bool")

            A = tvm.nd.array(A_np, ctx)
            C = tvm.nd.array(C_np, ctx)

            func = module["nonzero"]
            start = perf_counter_ns()
            func(A, C)
            end = perf_counter_ns()
            return end - start

    def get_tvm_runner(self) -> TVMRunner:
        return self.NonZeroRunner()

    def get_name(self):
        return "nonzero"

class PowBenchSpec(BaseBenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}
        self.input_shape = {
            "M": 128,
            "N": 128
        }

    def get_input_shape(self) -> dict:
        return self.input_shape

    def generate_kernel(self):
        """Generate a power kernel using tvm.topi.power."""
        M = tvm.te.var("M")
        N = tvm.te.var("N")
        A = tvm.te.placeholder((M, N), "float32", name="A")
        C = tvm.topi.power(A, 2.0)
        te_func = tvm.te.create_prim_func([A, C]).with_attr({"global_symbol": "pow"})
        IRmod = tvm.IRModule({"pow": te_func})
        IRmod = self.apply_optimizations(IRmod)
        runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
        os.makedirs(self.get_directory(), exist_ok=True)
        with open(self.get_kernel_llvm_path(), 'w') as f:
            f.write(runtime_mod.get_source())

    class PowRunner(TVMRunner):
        def run(self, module, input: dict):
            ctx = tvm.cpu(0)
            M = input.get("M", 128)
            N = input.get("N", 128)

            A_np = np.random.randn(M, N).astype("float32")
            C_np = np.zeros((M, N), dtype="float32")

            A = tvm.nd.array(A_np, ctx)
            C = tvm.nd.array(C_np, ctx)

            func = module["pow"]
            start = perf_counter_ns()
            func(A, C)
            end = perf_counter_ns()
            return end - start

    def get_tvm_runner(self) -> TVMRunner:
        return self.PowRunner()

    def get_name(self):
        return "pow"

class SqrtBenchSpec(BaseBenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}
        self.input_shape = {
            "M": 128,
            "N": 128
        }

    def get_input_shape(self) -> dict:
        return self.input_shape

    def generate_kernel(self):
        """Generate a square root kernel using tvm.topi.sqrt."""
        M = tvm.te.var("M")
        N = tvm.te.var("N")
        A = tvm.te.placeholder((M, N), "float32", name="A")
        C = tvm.topi.sqrt(A)
        te_func = tvm.te.create_prim_func([A, C]).with_attr({"global_symbol": "sqrt"})
        IRmod = tvm.IRModule({"sqrt": te_func})
        IRmod = self.apply_optimizations(IRmod)
        runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
        os.makedirs(self.get_directory(), exist_ok=True)
        with open(self.get_kernel_llvm_path(), 'w') as f:
            f.write(runtime_mod.get_source())

    class SqrtRunner(TVMRunner):
        def run(self, module, input: dict):
            ctx = tvm.cpu(0)
            M = input.get("M", 128)
            N = input.get("N", 128)

            A_np = np.random.randn(M, N).astype("float32")
            C_np = np.zeros((M, N), dtype="float32")

            A = tvm.nd.array(A_np, ctx)
            C = tvm.nd.array(C_np, ctx)

            func = module["sqrt"]
            start = perf_counter_ns()
            func(A, C)
            end = perf_counter_ns()
            return end - start

    def get_tvm_runner(self) -> TVMRunner:
        return self.SqrtRunner()

    def get_name(self):
        return "sqrt"

class ClipBenchSpec(BaseBenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}
        self.input_shape = {
            "M": 128,
            "N": 128,
            "min_val": -1.0,
            "max_val": 1.0
        }

    def get_input_shape(self) -> dict:
        return self.input_shape

    def generate_kernel(self):
        """Generate a clip kernel using tvm.topi.clip."""
        M = tvm.te.var("M")
        N = tvm.te.var("N")
        A = tvm.te.placeholder((M, N), "float32", name="A")
        C = tvm.topi.clip(A, a_min=-1.0, a_max=1.0)
        te_func = tvm.te.create_prim_func([A, C]).with_attr({"global_symbol": "clip"})
        IRmod = tvm.IRModule({"clip": te_func})
        IRmod = self.apply_optimizations(IRmod)
        runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
        os.makedirs(self.get_directory(), exist_ok=True)
        with open(self.get_kernel_llvm_path(), 'w') as f:
            f.write(runtime_mod.get_source())

    class ClipRunner(TVMRunner):
        def run(self, module, input: dict):
            ctx = tvm.cpu(0)
            M = input.get("M", 128)
            N = input.get("N", 128)

            A_np = np.random.randn(M, N).astype("float32")
            C_np = np.zeros((M, N), dtype="float32")

            A = tvm.nd.array(A_np, ctx)
            C = tvm.nd.array(C_np, ctx)

            func = module["clip"]
            start = perf_counter_ns()
            func(A, C)
            end = perf_counter_ns()
            return end - start

    def get_tvm_runner(self) -> TVMRunner:
        return self.ClipRunner()

    def get_name(self):
        return "clip"
    

class LeakyReluBenchSpec(BaseBenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}
        self.input_shape = {
            "M": 128,
            "N": 128,
            "alpha": 0.1
        }

    def get_input_shape(self) -> dict:
        return self.input_shape

    def generate_kernel(self):
        """Generate a LeakyReLU kernel using tvm.topi.nn.leaky_relu."""
        M = tvm.te.var("M")
        N = tvm.te.var("N")
        A = tvm.te.placeholder((M, N), "float32", name="A")
        C = tvm.topi.nn.leaky_relu(A, alpha=0.1)
        te_func = tvm.te.create_prim_func([A, C]).with_attr({"global_symbol": "leaky_relu"})
        IRmod = tvm.IRModule({"leaky_relu": te_func})
        IRmod = self.apply_optimizations(IRmod)
        runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
        os.makedirs(self.get_directory(), exist_ok=True)
        with open(self.get_kernel_llvm_path(), 'w') as f:
            f.write(runtime_mod.get_source())

    class LeakyReluRunner(TVMRunner):
        def run(self, module, input: dict):
            ctx = tvm.cpu(0)
            M = input.get("M", 128)
            N = input.get("N", 128)

            A_np = np.random.randn(M, N).astype("float32")
            C_np = np.zeros((M, N), dtype="float32")

            A = tvm.nd.array(A_np, ctx)
            C = tvm.nd.array(C_np, ctx)

            func = module["leaky_relu"]
            start = perf_counter_ns()
            func(A, C)
            end = perf_counter_ns()
            return end - start

    def get_tvm_runner(self) -> TVMRunner:
        return self.LeakyReluRunner()

    def get_name(self):
        return "leaky_relu"

class GemmBenchSpec(BaseBenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}
        self.input_shape = {
            "M": 128,
            "N": 128,
            "K": 128
        }

    def get_input_shape(self) -> dict:
        return self.input_shape

    def generate_kernel(self):
        """Generate a GEMM kernel using tvm.topi.nn.dense."""
        M = tvm.te.var("M")
        K = tvm.te.var("K")
        N = tvm.te.var("N")
        A = tvm.te.placeholder((M, K), "float32", name="A")
        B = tvm.te.placeholder((K, N), "float32", name="B")
        C = tvm.topi.nn.dense(A, B)
        te_func = tvm.te.create_prim_func([A, B, C]).with_attr({"global_symbol": "gemm"})
        IRmod = tvm.IRModule({"gemm": te_func})
        IRmod = self.apply_optimizations(IRmod)
        runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
        os.makedirs(self.get_directory(), exist_ok=True)
        with open(self.get_kernel_llvm_path(), 'w') as f:
            f.write(runtime_mod.get_source())

    class GemmRunner(TVMRunner):
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

            func = module["gemm"]
            start = perf_counter_ns()
            func(A, B, C)
            end = perf_counter_ns()
            return end - start

    def get_tvm_runner(self) -> TVMRunner:
        return self.GemmRunner()

    def get_name(self):
        return "gemm"

class SoftmaxBenchSpec(BaseBenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {
            'inst_T_softmax_exp_1': 1,
            'inst_T_softmax_exp_2': 1,
            'inst_T_softmax_maxelem_1': 1,
            'inst_T_softmax_maxelem_2': 1,
            'inst_T_softmax_maxelem_3': 1,
            'inst__1': 0,
            'null': 0
        }
        self.input_shape = {
            "M": 128,
            "N": 128
        }

    def get_input_shape(self) -> dict:
        return self.input_shape

    def generate_kernel(self):
        """Generate a softmax kernel using tvm.topi.nn.softmax."""
        M = tvm.te.var("M")
        N = tvm.te.var("N")
        A = tvm.te.placeholder((M, N), "float32", name="A")
        C = tvm.topi.nn.softmax(A)
        te_func = tvm.te.create_prim_func([A, C]).with_attr({"global_symbol": "softmax"})
        IRmod = tvm.IRModule({"softmax": te_func})
        IRmod = self.apply_optimizations(IRmod)
        runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
        os.makedirs(self.get_directory(), exist_ok=True)
        with open(self.get_kernel_llvm_path(), 'w') as f:
            f.write(runtime_mod.get_source())

    class SoftmaxRunner(TVMRunner):
        def run(self, module, input: dict):
            ctx = tvm.cpu(0)
            M = input.get("M", 128)
            N = input.get("N", 128)

            A_np = np.random.randn(M, N).astype("float32")
            C_np = np.zeros((M, N), dtype="float32")

            A = tvm.nd.array(A_np, ctx)
            C = tvm.nd.array(C_np, ctx)

            func = module["softmax"]
            start = perf_counter_ns()
            func(A, C)
            end = perf_counter_ns()
            return end - start

    def get_tvm_runner(self) -> TVMRunner:
        return self.SoftmaxRunner()

    def get_name(self):
        return "softmax"

class TanhBenchSpec(BaseBenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}
        self.input_shape = {
            "M": 128,
            "N": 128
        }

    def get_input_shape(self) -> dict:
        return self.input_shape

    def generate_kernel(self):
        """Generate a tanh kernel using tvm.topi.tanh."""
        M = tvm.te.var("M")
        N = tvm.te.var("N")
        A = tvm.te.placeholder((M, N), "float32", name="A")
        C = tvm.topi.tanh(A)
        te_func = tvm.te.create_prim_func([A, C]).with_attr({"global_symbol": "tanh"})
        IRmod = tvm.IRModule({"tanh": te_func})
        IRmod = self.apply_optimizations(IRmod)
        runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
        os.makedirs(self.get_directory(), exist_ok=True)
        with open(self.get_kernel_llvm_path(), 'w') as f:
            f.write(runtime_mod.get_source())

    class TanhRunner(TVMRunner):
        def run(self, module, input: dict):
            ctx = tvm.cpu(0)
            M = input.get("M", 128)
            N = input.get("N", 128)

            A_np = np.random.randn(M, N).astype("float32")
            C_np = np.zeros((M, N), dtype="float32")

            A = tvm.nd.array(A_np, ctx)
            C = tvm.nd.array(C_np, ctx)

            func = module["tanh"]
            start = perf_counter_ns()
            func(A, C)
            end = perf_counter_ns()
            return end - start

    def get_tvm_runner(self) -> TVMRunner:
        return self.TanhRunner()

    def get_name(self):
        return "tanh"

class MaxPoolBenchSpec(BaseBenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}
        self.input_shape = {
            "N": 1,
            "C": 3,
            "H": 224,
            "W": 224,
            "pool_size": 2,
            "strides": 2
        }

    def get_input_shape(self) -> dict:
        return self.input_shape

    def generate_kernel(self):
        """Generate a maxpool kernel using tvm.topi.nn.pool2d."""
        N = tvm.te.var("N")
        C = tvm.te.var("C")
        H = tvm.te.var("H")
        W = tvm.te.var("W")
        pool_size = (2, 2)
        strides = (2, 2)
        padding = (0, 0, 0, 0)  # Top, left, bottom, right padding
        A = tvm.te.placeholder((N, C, H, W), "float32", name="A")
        C = tvm.topi.nn.pool2d(A, pool_size, strides, (1, 1), padding, pool_type="max", layout="NCHW")
        te_func = tvm.te.create_prim_func([A, C]).with_attr({"global_symbol": "maxpool"})
        IRmod = tvm.IRModule({"maxpool": te_func})
        IRmod = self.apply_optimizations(IRmod)
        runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
        os.makedirs(self.get_directory(), exist_ok=True)
        with open(self.get_kernel_llvm_path(), 'w') as f:
            f.write(runtime_mod.get_source())

    class MaxPoolRunner(TVMRunner):
        def run(self, module, input: dict):
            ctx = tvm.cpu(0)
            N = input.get("N", 1)
            C = input.get("C", 3)
            H = input.get("H", 224)
            W = input.get("W", 224)

            A_np = np.random.randn(N, C, H, W).astype("float32")
            C_np = np.zeros((N, C, H // 2, W // 2), dtype="float32")

            A = tvm.nd.array(A_np, ctx)
            C = tvm.nd.array(C_np, ctx)

            func = module["maxpool"]
            start = perf_counter_ns()
            func(A, C)
            end = perf_counter_ns()
            return end - start

    def get_tvm_runner(self) -> TVMRunner:
        return self.MaxPoolRunner()

    def get_name(self):
        return "maxpool"

class ExpBenchSpec(BaseBenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}
        self.input_shape = {
            "M": 128,
            "N": 128
        }

    def get_input_shape(self) -> dict:
        return self.input_shape

    def generate_kernel(self):
        """Generate an exponential kernel using tvm.topi.exp."""
        M = tvm.te.var("M")
        N = tvm.te.var("N")
        A = tvm.te.placeholder((M, N), "float32", name="A")
        C = tvm.topi.exp(A)
        te_func = tvm.te.create_prim_func([A, C]).with_attr({"global_symbol": "exp"})
        IRmod = tvm.IRModule({"exp": te_func})
        IRmod = self.apply_optimizations(IRmod)
        runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
        os.makedirs(self.get_directory(), exist_ok=True)
        with open(self.get_kernel_llvm_path(), 'w') as f:
            f.write(runtime_mod.get_source())

    class ExpRunner(TVMRunner):
        def run(self, module, input: dict):
            ctx = tvm.cpu(0)
            M = input.get("M", 128)
            N = input.get("N", 128)

            A_np = np.random.randn(M, N).astype("float32")
            C_np = np.zeros((M, N), dtype="float32")

            A = tvm.nd.array(A_np, ctx)
            C = tvm.nd.array(C_np, ctx)

            func = module["exp"]
            start = perf_counter_ns()
            func(A, C)
            end = perf_counter_ns()
            return end - start

    def get_tvm_runner(self) -> TVMRunner:
        return self.ExpRunner()

    def get_name(self):
        return "exp"

class LogBenchSpec(BaseBenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}
        self.input_shape = {
            "M": 128,
            "N": 128
        }

    def get_input_shape(self) -> dict:
        return self.input_shape

    def generate_kernel(self):
        """Generate a logarithm kernel using tvm.topi.log."""
        M = tvm.te.var("M")
        N = tvm.te.var("N")
        A = tvm.te.placeholder((M, N), "float32", name="A")
        C = tvm.topi.log(A)
        te_func = tvm.te.create_prim_func([A, C]).with_attr({"global_symbol": "log"})
        IRmod = tvm.IRModule({"log": te_func})
        IRmod = self.apply_optimizations(IRmod)
        runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
        os.makedirs(self.get_directory(), exist_ok=True)
        with open(self.get_kernel_llvm_path(), 'w') as f:
            f.write(runtime_mod.get_source())

    class LogRunner(TVMRunner):
        def run(self, module, input: dict):
            ctx = tvm.cpu(0)
            M = input.get("M", 128)
            N = input.get("N", 128)

            A_np = np.random.randn(M, N).astype("float32")
            C_np = np.zeros((M, N), dtype="float32")

            A = tvm.nd.array(A_np, ctx)
            C = tvm.nd.array(C_np, ctx)

            func = module["log"]
            start = perf_counter_ns()
            func(A, C)
            end = perf_counter_ns()
            return end - start

    def get_tvm_runner(self) -> TVMRunner:
        return self.LogRunner()

    def get_name(self):
        return "log"

class PadBenchSpec(BaseBenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {
            'inst_smax_1': 132,
        }
        self.input_shape = {
            "M": 128,
            "N": 128,
            "pad_width": 2
        }

    def get_input_shape(self) -> dict:
        return self.input_shape

    def generate_kernel(self):
        """Generate a padding kernel using tvm.topi.nn.pad."""
        M = tvm.te.var("M")
        N = tvm.te.var("N")
        pad_width = 2
        A = tvm.te.placeholder((M, N), "float32", name="A")
        C = tvm.topi.nn.pad(A, pad_before=(pad_width, pad_width), pad_after=(pad_width, pad_width))
        te_func = tvm.te.create_prim_func([A, C]).with_attr({"global_symbol": "pad"})
        IRmod = tvm.IRModule({"pad": te_func})
        IRmod = self.apply_optimizations(IRmod)
        runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
        os.makedirs(self.get_directory(), exist_ok=True)
        with open(self.get_kernel_llvm_path(), 'w') as f:
            f.write(runtime_mod.get_source())

    class PadRunner(TVMRunner):
        def run(self, module, input: dict):
            ctx = tvm.cpu(0)
            M = input.get("M", 128)
            N = input.get("N", 128)

            A_np = np.random.randn(M, N).astype("float32")
            C_np = np.zeros((M + 4, N + 4), dtype="float32")

            A = tvm.nd.array(A_np, ctx)
            C = tvm.nd.array(C_np, ctx)

            func = module["pad"]
            start = perf_counter_ns()
            func(A, C)
            end = perf_counter_ns()
            return end - start

    def get_tvm_runner(self) -> TVMRunner:
        return self.PadRunner()

    def get_name(self):
        return "pad"

class InstanceNormalizationBenchSpec(BaseBenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {
            'inst_A_red_temp.v0_1': 1,
            'inst_A_red_temp.v0_2': 1,
            'inst_A_red_temp.v0_3': 1,
            'inst_A_red_temp.v1_1': 1,
            'inst_A_red_temp.v1_2': 1,
            'inst_A_red_temp.v1_3': 1,
            'inst__1': 0,
            'null': 0
        }
        self.input_shape = {
            "N": 1,
            "C": 3,
            "H": 224,
            "W": 224
        }

    def get_input_shape(self) -> dict:
        return self.input_shape

    def generate_kernel(self):
        """Generate an instance normalization kernel using tvm.topi.nn.instance_norm."""
        N = tvm.te.var("N")
        C = tvm.te.var("C")
        H = tvm.te.var("H")
        W = tvm.te.var("W")
        A = tvm.te.placeholder((N, C, H, W), "float32", name="A")
        gamma = tvm.te.placeholder((C,), "float32", name="gamma")
        beta = tvm.te.placeholder((C,), "float32", name="beta")
        C = tvm.topi.nn.instance_norm(A, gamma, beta, channel_axis=1, axis=[2, 3])
        te_func = tvm.te.create_prim_func([A, gamma, beta, C]).with_attr({"global_symbol": "instance_norm"})
        IRmod = tvm.IRModule({"instance_norm": te_func})
        IRmod = self.apply_optimizations(IRmod)
        runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
        os.makedirs(self.get_directory(), exist_ok=True)
        with open(self.get_kernel_llvm_path(), 'w') as f:
            f.write(runtime_mod.get_source())

    class InstanceNormalizationRunner(TVMRunner):
        def run(self, module, input: dict):
            ctx = tvm.cpu(0)
            N = input.get("N", 1)
            C = input.get("C", 3)
            H = input.get("H", 224)
            W = input.get("W", 224)

            A_np = np.random.randn(N, C, H, W).astype("float32")
            gamma_np = np.random.randn(C).astype("float32")
            beta_np = np.random.randn(C).astype("float32")
            C_np = np.zeros((N, C, H, W), dtype="float32")

            A = tvm.nd.array(A_np, ctx)
            gamma = tvm.nd.array(gamma_np, ctx)
            beta = tvm.nd.array(beta_np, ctx)
            C = tvm.nd.array(C_np, ctx)

            func = module["instance_norm"]
            start = perf_counter_ns()
            func(A, gamma, beta, C)
            end = perf_counter_ns()
            return end - start

    def get_tvm_runner(self) -> TVMRunner:
        return self.InstanceNormalizationRunner()

    def get_name(self):
        return "instance_norm"