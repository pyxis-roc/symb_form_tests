import sys
import os
import tvm
import numpy as np

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../script-link')))

from symb_eval import symb_eval, parse_basic_graphs, format_evaluated_graphs
from compare import parse_instr, parse_symb, compare_results, print_compare_results
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


def benchmark(spec: BenchSpec):

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
        symb_json_file = tempfile.NamedTemporaryFile(mode="w+", delete=False, suffix=".json"); 
        symb_json_path = symb_json_file.name

        subprocess.run(
            ['symb-viewer', kernel_llvm_path, 'conv_compute_', f'-json={symb_json_path}'],
            check=True
        )

        with open(symb_json_path, "r") as f:
            input_data = f.read()
            basic_graphs = parse_basic_graphs(input_data)
        os.remove(symb_json_path)

        with tempfile.NamedTemporaryFile(mode="w+", delete=False, suffix=".json") as eval_json_file:
            eval_json_path = eval_json_file.name
            evaluated_graphs = symb_eval(input, basic_graphs)
            formated = format_evaluated_graphs(evaluated_graphs)
            json.dump(formated, eval_json_file)

        result = parse_symb(eval_json_path)
        os.remove(eval_json_path)
        
        return result

    # Get exact counts from instrumented run
    instr_counts = get_exact_count()
    symb_counts = get_symb_count()

    # Compare results
    results, summary = compare_results(instr_counts, symb_counts)
    
    print(f"Benchmark: {name}")
    print_compare_results(results, summary)



class ConvBenchSpec(BenchSpec):

    def get_input(self) -> dict:
        return {
            "%N": 1,  # Batch size
            "%CI": 3,  # Input channels
            "%H": 224,  # Input height
            "%W": 224,  # Input width
            "%CO": 64,  # Output channels
            "%KH": 7,   # Kernel height
            "%KW": 7    # Kernel width
        }
    
    def get_kernel_llvm_path(self) -> str:
        return os.path.abspath(os.path.join(os.path.dirname(__file__), "./conv/conv.ll"))
    
    def get_directory(self):
        return os.path.abspath(os.path.join(os.path.dirname(__file__), "./conv"))

    class ConvRunner(TVMRunner):
        def run(self, module, input: dict):
            ctx = tvm.cpu(0)
            N = input.get("%N", 1)
            CI = input.get("%CI", 3)
            H = input.get("%H", 224)
            W = input.get("%W", 224)
            CO = input.get("%CO", 64)
            KH = input.get("%KH", 7)
            KW = input.get("%KW", 7)

            A_np = np.random.randn(N, CI, H, W).astype("float32")
            Wt_np = np.random.randn(CO, CI, KH, KW).astype("float32")
            # Output shape for conv2d with stride=1, padding=0
            OH = H - KH + 3
            OW = W - KW + 3
            C_np = np.zeros((N, CO, OH, OW), dtype="float32")

            A = tvm.nd.array(A_np, ctx)
            Wt = tvm.nd.array(Wt_np, ctx)
            C = tvm.nd.array(C_np, ctx)

            func = module["conv"]
            try:
                func(A, Wt, C)
            except:
                pass

    def get_tvm_runner(self) -> TVMRunner:
        return self.ConvRunner()

    def get_name(self):
        return "conv2d_benchmark"

benchmark(ConvBenchSpec())