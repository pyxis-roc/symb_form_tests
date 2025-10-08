import tvm
from tvm import te
import os
import numpy as np


def generate_conv():
    """Generate a conv2d kernel using tvm.topi.nn.conv2d."""
    N = te.var("N")
    CI = te.var("CI")
    H = te.var("H")
    W = te.var("W")
    CO = te.var("CO")
    KH = te.var("KH")
    KW = te.var("KW")
    A = te.placeholder((N, CI, H, W), "float32", name="A")
    Wt = te.placeholder((CO, CI, KH, KW), "float32", name="W")
    C = tvm.relax.frontend.nn.conv2d(
        A, Wt, padding=1, dilation=1,
    )
    print(C.shape)
    te_func = te.create_prim_func([A, Wt, C]).with_attr({"global_symbol": "conv"})
    IRmod = tvm.IRModule({"conv": te_func})
    runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))

    return runtime_mod


def get_conv():
    """Get the conv2d kernel."""
    # if not os.path.exists("conv.so"):
    #     return generate_conv()
    return tvm.runtime.load_module("conv.ll")


def run_conv():
    """Run the conv2d kernel."""
    runtime_mod = get_conv()
    ctx = tvm.cpu(0)
    A_np = np.random.randn(1, 3, 224, 224).astype("float32")
    Wt_np = np.random.randn(64, 3, 7, 7).astype("float32")
    C_np = np.zeros((1, 64, 220, 220), dtype="float32")
    A = tvm.nd.array(A_np, ctx)
    Wt = tvm.nd.array(Wt_np, ctx)
    C = tvm.nd.array(C_np, ctx)

    func = runtime_mod["conv"]
    func(A, Wt, C)

    return C.numpy()  # Return the output as a NumPy array

if __name__ == "__main__":
    run_conv()
    print("Conv2D kernel executed successfully.")