from benchmark_spec import BenchSpec, TVMRunner
import os
import tvm
import tvm.topi
import numpy as np

class ConvBenchSpec(BenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {
            "inst_pad_temp_2": 1,
            "null": 0,
            'inst_smax_1': 226
        }

    def get_input_shape(self) -> dict:
        return {
            "N": 1,  # Batch size
            "CI": 3,  # Input channels
            "H": 224,  # Input height
            "W": 224,  # Input width
            "CO": 64,  # Output channels
            "KH": 7,   # Kernel height
            "KW": 7,   # Kernel width
        }
    
    def get_symbolic_patches(self) -> dict:
        return self.symbolic_patches

    def add_symbolic_patch(self, key: str, value: int):
        self.symbolic_patches[key] = value
    
    def get_kernel_llvm_path(self) -> str:
        return os.path.join(self.get_directory(), "conv.ll")
    
    def get_directory(self):
        return os.path.abspath(os.path.join(self.base_dir, "./conv"))

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
        runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
        os.makedirs(self.get_directory(), exist_ok=True)
        with open(self.get_kernel_llvm_path(), 'w') as f:
            f.write(runtime_mod.get_source())

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
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}

    def get_input_shape(self) -> dict:
        return {
            "M": 128,  # Rows of A and C
            "N": 128,  # Columns of B and C
            "K": 128   # Columns of A, Rows of B
        }

    def get_symbolic_patches(self) -> dict:
        return self.symbolic_patches

    def add_symbolic_patch(self, key: str, value: int):
        self.symbolic_patches[key] = value

    def get_kernel_llvm_path(self) -> str:
        return os.path.join(self.get_directory(), "matmul.ll")

    def get_directory(self):
        return os.path.abspath(os.path.join(self.base_dir, "./matmul"))

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
            func(A, B, C)


    def get_tvm_runner(self) -> TVMRunner:
        return self.MatmulRunner()

    def get_name(self):
        return "matmul_benchmark"

class ConcatBenchSpec(BenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {
            "inst_smax_1": 128 * 2
        }

    def get_input_shape(self) -> dict:
        return {
            "M": 128,
            "N": 128,  # Number of tensors to concatenate
        }

    def get_symbolic_patches(self) -> dict:
        return self.symbolic_patches

    def add_symbolic_patch(self, key: str, value: int):
        self.symbolic_patches[key] = value

    def get_kernel_llvm_path(self) -> str:
        return os.path.join(self.get_directory(), "concat.ll")

    def get_directory(self):
        return os.path.abspath(os.path.join(self.base_dir, "./concat"))

    def generate_kernel(self):
        """Generate a concat kernel using tvm.topi.concatenate."""
        M = tvm.te.var("M")
        N = tvm.te.var("N")
        A = tvm.te.placeholder((M, N), "float32", name="A")
        B = tvm.te.placeholder((M, N), "float32", name="B")
        C = tvm.topi.concatenate([A, B], axis=0)
        te_func = tvm.te.create_prim_func([A, B, C]).with_attr({"global_symbol": "concat"})
        IRmod = tvm.IRModule({"concat": te_func})
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
            func(A, B, C)

    def get_tvm_runner(self) -> TVMRunner:
        return self.ConcatRunner()

    def get_name(self):
        return "concat_benchmark"

class GatherBenchSpec(BenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}

    def get_input_shape(self) -> dict:
        return {
            "M": 128,  # Number of elements in the input tensor
            "N": 64,   # Number of indices to gather
            "K": 64
        }

    def get_symbolic_patches(self) -> dict:
        return self.symbolic_patches

    def add_symbolic_patch(self, key: str, value: int):
        self.symbolic_patches[key] = value

    def get_kernel_llvm_path(self) -> str:
        return os.path.join(self.get_directory(), "gather.ll")

    def get_directory(self):
        return os.path.abspath(os.path.join(self.base_dir, "./gather"))

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
            func(A, indices, C)

    def get_tvm_runner(self) -> TVMRunner:
        return self.GatherRunner()

    def get_name(self):
        return "gather_benchmark"

class ReshapeBenchSpec(BenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}
    
    def get_input_shape(self) -> dict:
        return {
            "M": 128,  # Original shape
            "N": 64,   # New shape
        }

    def get_symbolic_patches(self) -> dict:
        return self.symbolic_patches

    def add_symbolic_patch(self, key: str, value: int):
        self.symbolic_patches[key] = value

    def get_kernel_llvm_path(self) -> str:
        return os.path.join(self.get_directory(), "reshape.ll")

    def get_directory(self):
        return os.path.abspath(os.path.join(self.base_dir, "./reshape"))

    def generate_kernel(self):
        """Generate a reshape kernel using tvm.topi.reshape."""
        M = tvm.te.var("M")
        N = tvm.te.var("N")
        A = tvm.te.placeholder((M, N), "float32", name="A")
        C = tvm.topi.reshape(A, (M * N,))
        te_func = tvm.te.create_prim_func([A, C]).with_attr({"global_symbol": "reshape"})
        IRmod = tvm.IRModule({"reshape": te_func})
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
            func(A, C)

    def get_tvm_runner(self) -> TVMRunner:
        return self.ReshapeRunner()

    def get_name(self):
        return "reshape_benchmark"

class ShapeBenchSpec(BenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}
    
    def get_input_shape(self) -> dict:
        return {
            "M": 128,  # Shape dimension
            "N": 64,   # Not used in this benchmark
        }

    def get_symbolic_patches(self) -> dict:
        return self.symbolic_patches

    def add_symbolic_patch(self, key: str, value: int):
        self.symbolic_patches[key] = value

    def get_kernel_llvm_path(self) -> str:
        return os.path.join(self.get_directory(), "shape.ll")

    def get_directory(self):
        return os.path.abspath(os.path.join(self.base_dir, "./shape"))

    def generate_kernel(self):
        """Generate a shape kernel using tvm.topi.shape."""
        M = tvm.te.var("M")
        N = tvm.te.var("N")
        A = tvm.te.placeholder((M, N), "float32", name="A")
        # Shape is a constant op, so we just output the shape as a tensor
        out_shape = tvm.topi.shape(A)
        te_func = tvm.te.create_prim_func([A, out_shape]).with_attr({"global_symbol": "shape"})
        IRmod = tvm.IRModule({"shape": te_func})
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
            func(A, C)

    def get_tvm_runner(self) -> TVMRunner:
        return self.ShapeRunner()

    def get_name(self):
        return "shape_benchmark"

class SqueezeBenchSpec(BenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}
    
    def get_input_shape(self) -> dict:
        return {
            "M": 128,  # Original shape
            "N": 1,    # Squeeze axis size
        }

    def get_symbolic_patches(self) -> dict:
        return self.symbolic_patches

    def add_symbolic_patch(self, key: str, value: int):
        self.symbolic_patches[key] = value

    def get_kernel_llvm_path(self) -> str:
        return os.path.join(self.get_directory(), "squeeze.ll")

    def get_directory(self):
        return os.path.abspath(os.path.join(self.base_dir, "./squeeze"))

    def generate_kernel(self):
        """Generate a squeeze kernel using tvm.topi.squeeze."""
        M = tvm.te.var("M")
        A = tvm.te.placeholder((M, 1), "float32", name="A")
        C = tvm.topi.squeeze(A, axis=[1])
        te_func = tvm.te.create_prim_func([A, C]).with_attr({"global_symbol": "squeeze"})
        IRmod = tvm.IRModule({"squeeze": te_func})
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
            func(A, C)

    def get_tvm_runner(self) -> TVMRunner:
        return self.SqueezeRunner()

    def get_name(self):
        return "squeeze_benchmark"
    
class UnsqueezeBenchSpec(BenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}
    
    def get_input_shape(self) -> dict:
        return {
            "M": 128,  # Original shape
            "N": 1,    # Unsqueeze axis size
        }

    def get_symbolic_patches(self) -> dict:
        return self.symbolic_patches

    def add_symbolic_patch(self, key: str, value: int):
        self.symbolic_patches[key] = value

    def get_kernel_llvm_path(self) -> str:
        return os.path.join(self.get_directory(), "unsqueeze.ll")

    def get_directory(self):
        return os.path.abspath(os.path.join(self.base_dir, "./unsqueeze"))

    def generate_kernel(self):
        """Generate an unsqueeze kernel using tvm.topi.expand_dims."""
        M = tvm.te.var("M")
        N = tvm.te.var("N")
        A = tvm.te.placeholder((M, N), "float32", name="A")
        C = tvm.topi.expand_dims(A, axis=1, num_newaxis=1)
        te_func = tvm.te.create_prim_func([A, C]).with_attr({"global_symbol": "unsqueeze"})
        IRmod = tvm.IRModule({"unsqueeze": te_func})
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
            func(A, C)

    def get_tvm_runner(self) -> TVMRunner:
        return self.UnsqueezeRunner()

    def get_name(self):
        return "unsqueeze_benchmark"

class AddBenchSpec(BenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}

    def get_input_shape(self) -> dict:
        return {
            "M": 128,
            "N": 128
        }

    def get_symbolic_patches(self) -> dict:
        return self.symbolic_patches

    def add_symbolic_patch(self, key: str, value: int):
        self.symbolic_patches[key] = value

    def get_kernel_llvm_path(self) -> str:
        return os.path.join(self.get_directory(), "add.ll")

    def get_directory(self):
        return os.path.abspath(os.path.join(self.base_dir, "./add"))

    def generate_kernel(self):
        """Generate an add kernel using tvm.topi.nn.add."""
        M = tvm.te.var("M")
        N = tvm.te.var("N")
        A = tvm.te.placeholder((M, N), "float32", name="A")
        B = tvm.te.placeholder((M, N), "float32", name="B")
        C = tvm.topi.nn.add(A, B)
        te_func = tvm.te.create_prim_func([A, B, C]).with_attr({"global_symbol": "add"})
        IRmod = tvm.IRModule({"add": te_func})
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
            func(A, B, C)

    def get_tvm_runner(self) -> TVMRunner:
        return self.AddRunner()

    def get_name(self):
        return "add_benchmark"

class CastBenchSpec(BenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}

    def get_input_shape(self) -> dict:
        return {
            "M": 128,
            "N": 128
        }

    def get_symbolic_patches(self) -> dict:
        return self.symbolic_patches

    def add_symbolic_patch(self, key: str, value: int):
        self.symbolic_patches[key] = value

    def get_kernel_llvm_path(self) -> str:
        return os.path.join(self.get_directory(), "cast.ll")

    def get_directory(self):
        return os.path.abspath(os.path.join(self.base_dir, "./cast"))

    def generate_kernel(self):
        """Generate a cast kernel using tvm.topi.cast."""
        M = tvm.te.var("M")
        N = tvm.te.var("N")
        A = tvm.te.placeholder((M, N), "float32", name="A")
        C = tvm.topi.cast(A, "int32")
        te_func = tvm.te.create_prim_func([A, C]).with_attr({"global_symbol": "cast"})
        IRmod = tvm.IRModule({"cast": te_func})
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
            func(A, C)

    def get_tvm_runner(self) -> TVMRunner:
        return self.CastRunner()

    def get_name(self):
        return "cast_benchmark"

class MulBenchSpec(BenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}

    def get_input_shape(self) -> dict:
        return {
            "M": 128,
            "K": 128,
            "N": 128
        }

    def get_symbolic_patches(self) -> dict:
        return self.symbolic_patches

    def add_symbolic_patch(self, key: str, value: int):
        self.symbolic_patches[key] = value

    def get_kernel_llvm_path(self) -> str:
        return os.path.join(self.get_directory(), "mul.ll")

    def get_directory(self):
        return os.path.abspath(os.path.join(self.base_dir, "./mul"))

    def generate_kernel(self):
        """Generate a multiplication kernel using tvm.topi.multiply."""
        M = tvm.te.var("M")
        N = tvm.te.var("N")
        A = tvm.te.placeholder((M, N), "float32", name="A")
        B = tvm.te.placeholder((M, N), "float32", name="B")
        C = tvm.topi.multiply(A, B)
        te_func = tvm.te.create_prim_func([A, B, C]).with_attr({"global_symbol": "mul"})
        IRmod = tvm.IRModule({"mul": te_func})
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
            func(A, B, C)

    def get_tvm_runner(self) -> TVMRunner:
        return self.MulRunner()

    def get_name(self):
        return "mul_benchmark"

class ReluBenchSpec(BenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}

    def get_input_shape(self) -> dict:
        return {
            "M": 128,
            "N": 128
        }

    def get_symbolic_patches(self) -> dict:
        return self.symbolic_patches

    def add_symbolic_patch(self, key: str, value: int):
        self.symbolic_patches[key] = value

    def get_kernel_llvm_path(self) -> str:
        return os.path.join(self.get_directory(), "relu.ll")

    def get_directory(self):
        return os.path.abspath(os.path.join(self.base_dir, "./relu"))

    def generate_kernel(self):
        """Generate a relu kernel using tvm.topi.nn.relu."""
        M = tvm.te.var("M")
        N = tvm.te.var("N")
        A = tvm.te.placeholder((M, N), "float32", name="A")
        C = tvm.topi.nn.relu(A)
        te_func = tvm.te.create_prim_func([A, C]).with_attr({"global_symbol": "relu"})
        IRmod = tvm.IRModule({"relu": te_func})
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
            func(A, C)

    def get_tvm_runner(self) -> TVMRunner:
        return self.ReluRunner()

    def get_name(self):
        return "relu_benchmark"
    
class SubBenchSpec(BenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}

    def get_input_shape(self) -> dict:
        return {
            "M": 128,
            "N": 128
        }

    def get_symbolic_patches(self) -> dict:
        return self.symbolic_patches

    def add_symbolic_patch(self, key: str, value: int):
        self.symbolic_patches[key] = value

    def get_kernel_llvm_path(self) -> str:
        return os.path.join(self.get_directory(), "sub.ll")

    def get_directory(self):
        return os.path.abspath(os.path.join(self.base_dir, "./sub"))

    def generate_kernel(self):
        """Generate a subtraction kernel using tvm.topi.subtract."""
        M = tvm.te.var("M")
        N = tvm.te.var("N")
        A = tvm.te.placeholder((M, N), "float32", name="A")
        B = tvm.te.placeholder((M, N), "float32", name="B")
        C = tvm.topi.subtract(A, B)
        te_func = tvm.te.create_prim_func([A, B, C]).with_attr({"global_symbol": "sub"})
        IRmod = tvm.IRModule({"sub": te_func})
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
            func(A, B, C)

    def get_tvm_runner(self) -> TVMRunner:
        return self.SubRunner()

    def get_name(self):
        return "sub_benchmark"

class TransposeBenchSpec(BenchSpec):
    def __init__(self, base_dir: str):
        super().__init__()
        self.base_dir = base_dir
        self.symbolic_patches = {}

    def get_input_shape(self) -> dict:
        return {
            "M": 128,
            "N": 128
        }

    def get_symbolic_patches(self) -> dict:
        return self.symbolic_patches

    def add_symbolic_patch(self, key: str, value: int):
        self.symbolic_patches[key] = value

    def get_kernel_llvm_path(self) -> str:
        return os.path.join(self.get_directory(), "transpose.ll")

    def get_directory(self):
        return os.path.abspath(os.path.join(self.base_dir, "./transpose"))

    def generate_kernel(self):
        """Generate a transpose kernel using tvm.topi.transpose."""
        M = tvm.te.var("M")
        N = tvm.te.var("N")
        A = tvm.te.placeholder((M, N), "float32", name="A")
        C = tvm.topi.transpose(A)
        te_func = tvm.te.create_prim_func([A, C]).with_attr({"global_symbol": "transpose"})
        IRmod = tvm.IRModule({"transpose": te_func})
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
            func(A, C)

    def get_tvm_runner(self) -> TVMRunner:
        return self.TransposeRunner()

    def get_name(self):
        return "transpose_benchmark"