from abc import ABC, abstractmethod
import tvm
import tvm.topi
import numpy as np
import os
from time import perf_counter_ns

class TVMRunner(ABC):
    @abstractmethod
    def run(self, module, input:dict) -> int:
        """Run the TVM module with the given arguments. return the execution time in nanoseconds."""
        
class BenchSpec(ABC):
    
    @abstractmethod
    def get_tvm_runner(self) -> TVMRunner:
        """Get the TVM runner instance."""

    @abstractmethod
    def generate_kernel(self):
        """Generate the LLVM kernel and save it to the specified path."""
    
    @abstractmethod
    def get_name(self) -> str:
        """Get the name of the benchmark."""
    
    def __init__(self):
        self.input_shape = {}
        self.symbolic_patches = {}
        self.base_dir = ""
    
    def get_input_shape(self) -> dict:
        return self.input_shape

    def get_symbolic_patches(self) -> dict:
        return self.symbolic_patches

    def add_symbolic_patch(self, key: str, value: int):
        self.symbolic_patches[key] = value

    def get_kernel_llvm_path(self) -> str:
        return os.path.join(self.get_directory(), f"{self.get_name()}.ll")

    def get_directory(self):
        return os.path.abspath(os.path.join(self.base_dir, f"./{self.get_name()}"))

class TVMOperatorBenchSpec(BenchSpec):
    def __init__(self, base_dir: str, operator_name: str, input_shapes: dict, output_shape: tuple, \
                input_types:dict = {}, output_type:str = "float32", **kwargs):
        """
        Generic benchmark specification for any TVM operator.
        :param base_dir: Base directory for storing generated files.
        :param operator_name: Name of the TVM operator (e.g., "add", "multiply").
        :param input_shapes: {'input_0': (shape), 'input_1': (shape), ...} Shapes of the input tensors.
        :param output_shape: Shape of the output tensor.
        :param kwargs: Additional arguments for the operator.
        """
        super().__init__()
        self.base_dir = base_dir
        self.operator_name = operator_name
        self.input_shapes = input_shapes
        self.output_shape = output_shape
        self.input_types = input_types
        self.output_type = output_type
        self.kwargs = kwargs
        self.symbolic_patches = {}

    def get_input_shape(self) -> dict:
        res = {}
        for v, shape in self.input_shapes.items():
            if not isinstance(shape, tuple):
                raise ValueError(f"Input shape for input_{v} must be a tuple, got {type(shape)}")
            for i, dim in enumerate(shape):
                if not isinstance(dim, int):
                    raise ValueError(f"All dimensions in input shape must be integers, got {type(dim)} in shape {shape}")
                dim_name = f"{v}_{i}"
                res[dim_name] = dim
        return res

    def get_symbolic_patches(self) -> dict:
        return self.symbolic_patches

    def add_symbolic_patch(self, key: str, value: int):
        self.symbolic_patches[key] = value

    def get_kernel_llvm_path(self) -> str:
        return os.path.join(self.get_directory(), f"{self.operator_name}.ll")

    def get_directory(self):
        return os.path.abspath(os.path.join(self.base_dir, f"./{self.operator_name}"))

    def generate_kernel(self):
        """Generate a kernel for the specified operator."""
        inputs = []
        for name, shape in self.input_shapes.items():
            if name not in self.input_types:
                input_type = "float32"  # Default type
            else:
                input_type = self.input_types[name]

            inputs.append(tvm.te.placeholder(shape, input_type, name=name))
            
        # Split the operator name to handle two levels (e.g., "nn.conv2d")
        operator_parts = self.operator_name.split(".")
        operator = tvm.topi
        for part in operator_parts:
            operator = getattr(operator, part)  # Resolve each level of the operator
        
        output = operator(*inputs, **self.kwargs) # type: ignore
        te_func = tvm.te.create_prim_func(inputs + [output]).with_attr({"global_symbol": self.operator_name})
        IRmod = tvm.IRModule({self.operator_name: te_func})
        runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
        os.makedirs(self.get_directory(), exist_ok=True)
        with open(self.get_kernel_llvm_path(), 'w') as f:
            f.write(runtime_mod.get_source())

    class GenericRunner(TVMRunner):
        def __init__(self, operator_name: str, input_shapes:dict, output_shape: tuple, \
                     input_types:dict = {}, output_type:str = "float32"):
            self.operator_name = operator_name
            self.input_shapes = input_shapes
            self.output_shape = output_shape
            self.input_types = input_types
            self.output_type = output_type

        def run(self, module, input: dict):
            ctx = tvm.cpu(0)
            inputs = []
            for name, shape in self.input_shapes.items():
                if name not in self.input_types:
                    input_type = "float32"  # Default type
                else:
                    input_type = self.input_types[name]

                inputs.append(tvm.nd.array(np.random.randn(*shape).astype(input_type), ctx))
            
            output = tvm.nd.array(np.zeros(self.output_shape, dtype=self.output_type), ctx)
            func = module[self.operator_name]

            start = perf_counter_ns()
            func(*inputs, output)
            end = perf_counter_ns()

            return end - start

    def get_tvm_runner(self) -> TVMRunner:
        return self.GenericRunner(self.operator_name, self.input_shapes, self.output_shape, \
                                  self.input_types, self.output_type)

    def get_name(self):
        return f"{self.operator_name}_benchmark"