import tvm
from tvm import te
import os

# A = te.placeholder((128, 128), "float32", name="A")
# B = te.placeholder((128, 128), "float32", name="B")
# k = te.reduce_axis((0, 128), "k")
# Y = te.compute((128, 128), lambda i, j: te.sum(A[i, k] * B[k, j], axis=k), name="Y")
# C = te.compute((128, 128), lambda i, j: te.max(Y[i, j], 0), name="C")

# te_func = te.create_prim_func([A, B, C]).with_attr({"global_symbol": "mm_relu"})
# TEModule = tvm.IRModule({"mm_relu": te_func})


def generate_gather():
    """Generate a gather kernel using tvm.topi.take."""
    M = te.var("M")
    N = te.var("N")
    K = te.var("K")
    A = te.placeholder((M, N), "float32", name="A")
    indices = te.placeholder((K,), "int32", name="indices")
    C = tvm.topi.take(A, indices, axis=0)
    te_func = te.create_prim_func([A, indices, C]).with_attr({"global_symbol": "gather"})
    IRmod = tvm.IRModule({"gather": te_func})
    runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
    os.makedirs("gather", exist_ok=True)
    with open("gather/gather.ll", 'w') as f:
        f.write(runtime_mod.get_source())

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
    C = tvm.topi.nn.conv2d(A, Wt, strides=1, padding=1, dilation=1, out_dtype="float32")
    te_func = te.create_prim_func([A, Wt, C]).with_attr({"global_symbol": "conv"})
    IRmod = tvm.IRModule({"conv": te_func})
    runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
    os.makedirs("conv", exist_ok=True)
    with open("conv/conv.ll", 'w') as f:
        f.write(runtime_mod.get_source())

def generate_unsqueeze():
    """Generate an unsqueeze kernel using tvm.topi.expand_dims."""
    M = te.var("M")
    N = te.var("N")
    A = te.placeholder((M, N), "float32", name="A")
    C = tvm.topi.expand_dims(A, axis=1, num_newaxis=1)
    te_func = te.create_prim_func([A, C]).with_attr({"global_symbol": "unsqueeze"})
    IRmod = tvm.IRModule({"unsqueeze": te_func})
    runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
    os.makedirs("unsqueeze", exist_ok=True)
    with open("unsqueeze/unsqueeze.ll", 'w') as f:
        f.write(runtime_mod.get_source())

def generate_reshape():
    """Generate a reshape kernel using tvm.topi.reshape."""
    M = te.var("M")
    N = te.var("N")
    A = te.placeholder((M, N), "float32", name="A")
    C = tvm.topi.reshape(A, (M * N,))
    te_func = te.create_prim_func([A, C]).with_attr({"global_symbol": "reshape"})
    IRmod = tvm.IRModule({"reshape": te_func})
    runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
    os.makedirs("reshape", exist_ok=True)
    with open("reshape/reshape.ll", 'w') as f:
        f.write(runtime_mod.get_source())

def generate_concat():
    """Generate a concat kernel using tvm.topi.concatenate."""
    M = te.var("M")
    N = te.var("N")
    A = te.placeholder((M, N), "float32", name="A")
    B = te.placeholder((M, N), "float32", name="B")
    C = tvm.topi.concatenate([A, B], axis=0)
    te_func = te.create_prim_func([A, B, C]).with_attr({"global_symbol": "concat"})
    IRmod = tvm.IRModule({"concat": te_func})
    runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
    os.makedirs("concat", exist_ok=True)
    with open("concat/concat.ll", 'w') as f:
        f.write(runtime_mod.get_source())

def generate_add():
    """Generate an add kernel using tvm.topi.nn.add."""
    M = te.var("M")
    N = te.var("N")
    A = te.placeholder((M, N), "float32", name="A")
    B = te.placeholder((M, N), "float32", name="B")
    C = tvm.topi.nn.add(A, B)
    te_func = te.create_prim_func([A, B, C]).with_attr({"global_symbol": "add"})
    IRmod = tvm.IRModule({"add": te_func})
    runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
    os.makedirs("add", exist_ok=True)
    with open("add/add.ll", 'w') as f:
        f.write(runtime_mod.get_source())

def generate_shape():
    """Generate a shape kernel using tvm.topi.shape."""
    M = te.var("M")
    N = te.var("N")
    A = te.placeholder((M, N), "float32", name="A")
    # shape is a constant op, so we just output the shape as a tensor
    out_shape = tvm.topi.shape(A)
    te_func = te.create_prim_func([A, out_shape]).with_attr({"global_symbol": "shape"})
    IRmod = tvm.IRModule({"shape": te_func})
    runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
    os.makedirs("shape", exist_ok=True)
    with open("shape/shape.ll", 'w') as f:
        f.write(runtime_mod.get_source())

def generate_squeeze():
    """Generate a squeeze kernel using tvm.topi.squeeze."""
    M = te.var("M")
    A = te.placeholder((M, 1), "float32", name="A")
    C = tvm.topi.squeeze(A, axis=[1])
    te_func = te.create_prim_func([A, C]).with_attr({"global_symbol": "squeeze"})
    IRmod = tvm.IRModule({"squeeze": te_func})
    runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
    os.makedirs("squeeze", exist_ok=True)
    with open("squeeze/squeeze.ll", 'w') as f:
        f.write(runtime_mod.get_source())

def generate_transpose():
    """Generate a transpose kernel using tvm.topi.transpose."""
    M = te.var("M")
    N = te.var("N")
    A = te.placeholder((M, N), "float32", name="A")
    C = tvm.topi.transpose(A)
    te_func = te.create_prim_func([A, C]).with_attr({"global_symbol": "transpose"})
    IRmod = tvm.IRModule({"transpose": te_func})
    runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
    os.makedirs("transpose", exist_ok=True)
    with open("transpose/transpose.ll", 'w') as f:
        f.write(runtime_mod.get_source())

def generate_matmul():
    """Generate a matmul kernel using tvm.topi.nn.matmul."""
    M = te.var("M")
    K = te.var("K")
    N = te.var("N")
    A = te.placeholder((M, K), "float32", name="A")
    B = te.placeholder((K, N), "float32", name="B")
    C = tvm.topi.nn.matmul(A, B)
    te_func = te.create_prim_func([A, B, C]).with_attr({"global_symbol": "matmul"})
    IRmod = tvm.IRModule({"matmul": te_func})
    runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
    os.makedirs("matmul", exist_ok=True)
    with open("matmul/matmul.ll", 'w') as f:
        f.write(runtime_mod.get_source())

def generate_reorder_output():
    """Generate a reorder output kernel using tvm.topi.transpose (as a placeholder)."""
    M = te.var("M")
    N = te.var("N")
    A = te.placeholder((M, N), "float32", name="A")
    # For demonstration, just transpose as a reorder
    C = tvm.topi.transpose(A)
    te_func = te.create_prim_func([A, C]).with_attr({"global_symbol": "reorder_output"})
    IRmod = tvm.IRModule({"reorder_output": te_func})
    runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
    os.makedirs("reorder_output", exist_ok=True)
    with open("reorder_output/reorder_output.ll", 'w') as f:
        f.write(runtime_mod.get_source())

def generate_mul():
    """Generate a multiplication kernel using tvm.topi.multiply."""
    M = te.var("M")
    N = te.var("N")
    A = te.placeholder((M, N), "float32", name="A")
    B = te.placeholder((M, N), "float32", name="B")
    C = tvm.topi.multiply(A, B)
    te_func = te.create_prim_func([A, B, C]).with_attr({"global_symbol": "mul"})
    IRmod = tvm.IRModule({"mul": te_func})
    runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
    os.makedirs("mul", exist_ok=True)
    with open("mul/mul.ll", 'w') as f:
        f.write(runtime_mod.get_source())

def generate_slice():
    """Generate a slice kernel using tvm.topi.strided_slice."""
    M = te.var("M")
    N = te.var("N")
    A = te.placeholder((M, N), "float32", name="A")
    C = tvm.topi.strided_slice(A, begin=[0, 0], end=[M, N//2])
    te_func = te.create_prim_func([A, C]).with_attr({"global_symbol": "slice"})
    IRmod = tvm.IRModule({"slice": te_func})
    runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
    os.makedirs("slice", exist_ok=True)
    with open("slice/slice.ll", 'w') as f:
        f.write(runtime_mod.get_source())

def generate_cast():
    """Generate a cast kernel using tvm.topi.cast."""
    M = te.var("M")
    N = te.var("N")
    A = te.placeholder((M, N), "float32", name="A")
    C = tvm.topi.cast(A, "int32")
    te_func = te.create_prim_func([A, C]).with_attr({"global_symbol": "cast"})
    IRmod = tvm.IRModule({"cast": te_func})
    runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
    os.makedirs("cast", exist_ok=True)
    with open("cast/cast.ll", 'w') as f:
        f.write(runtime_mod.get_source())

def generate_reorder_input():
    """Generate a reorder input kernel using tvm.topi.transpose (as a placeholder)."""
    M = te.var("M")
    N = te.var("N")
    A = te.placeholder((M, N), "float32", name="A")
    # For demonstration, just transpose as a reorder
    C = tvm.topi.transpose(A)
    te_func = te.create_prim_func([A, C]).with_attr({"global_symbol": "reorder_input"})
    IRmod = tvm.IRModule({"reorder_input": te_func})
    runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
    os.makedirs("reorder_input", exist_ok=True)
    with open("reorder_input/reorder_input.ll", 'w') as f:
        f.write(runtime_mod.get_source())

def generate_constant_of_shape():
    """Generate a constant_of_shape kernel using tvm.topi.full."""
    M = te.var("M")
    N = te.var("N")
    shape = (M, N)
    C = tvm.topi.full(1.0, shape, "float32")
    te_func = te.create_prim_func([C]).with_attr({"global_symbol": "constant_of_shape"})
    IRmod = tvm.IRModule({"constant_of_shape": te_func})
    runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
    os.makedirs("constant_of_shape", exist_ok=True)
    with open("constant_of_shape/constant_of_shape.ll", 'w') as f:
        f.write(runtime_mod.get_source())

def generate_nonzero():
    """Generate a nonzero kernel using tvm.topi.nonzero."""
    M = te.var("M")
    N = te.var("N")
    A = te.placeholder((M, N), "float32", name="A")
    C = tvm.topi.nonzero(A)
    te_func = te.create_prim_func([A, C]).with_attr({"global_symbol": "nonzero"})
    IRmod = tvm.IRModule({"nonzero": te_func})
    runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
    os.makedirs("nonzero", exist_ok=True)
    with open("nonzero/nonzero.ll", 'w') as f:
        f.write(runtime_mod.get_source())

def generate_relu():
    """Generate a relu kernel using tvm.topi.nn.relu."""
    M = te.var("M")
    N = te.var("N")
    A = te.placeholder((M, N), "float32", name="A")
    C = tvm.topi.nn.relu(A)
    te_func = te.create_prim_func([A, C]).with_attr({"global_symbol": "relu"})
    IRmod = tvm.IRModule({"relu": te_func})
    runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
    os.makedirs("relu", exist_ok=True)
    with open("relu/relu.ll", 'w') as f:
        f.write(runtime_mod.get_source())

def generate_non_max_suppression():
    """Generate a non_max_suppression kernel using tvm.topi.vision.non_max_suppression."""
    num_boxes = te.var("num_boxes")
    boxes = te.placeholder((num_boxes, 4), "float32", name="boxes")
    scores = te.placeholder((num_boxes,), "float32", name="scores")
    C = tvm.topi.vision.non_max_suppression(boxes, scores, max_output_size=10, iou_threshold=0.5)
    te_func = te.create_prim_func([boxes, scores, C]).with_attr({"global_symbol": "non_max_suppression"})
    IRmod = tvm.IRModule({"non_max_suppression": te_func})
    runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
    os.makedirs("non_max_suppression", exist_ok=True)
    with open("non_max_suppression/non_max_suppression.ll", 'w') as f:
        f.write(runtime_mod.get_source())

def generate_sub():
    """Generate a subtraction kernel using tvm.topi.subtract."""
    M = te.var("M")
    N = te.var("N")
    A = te.placeholder((M, N), "float32", name="A")
    B = te.placeholder((M, N), "float32", name="B")
    C = tvm.topi.subtract(A, B)
    te_func = te.create_prim_func([A, B, C]).with_attr({"global_symbol": "sub"})
    IRmod = tvm.IRModule({"sub": te_func})
    runtime_mod = tvm.tir.build(IRmod, target=tvm.target.Target("llvm"))
    os.makedirs("sub", exist_ok=True)
    with open("sub/sub.ll", 'w') as f:
        f.write(runtime_mod.get_source())

if __name__ == "__main__":
    funcs = [
        generate_gather,
        generate_conv,
        generate_unsqueeze,
        generate_reshape,
        generate_concat,
        generate_add,
        generate_shape,
        generate_squeeze,
        generate_transpose,
        generate_matmul,
        generate_reorder_output,
        generate_mul,
        generate_slice,
        generate_cast,
        generate_reorder_input,
        generate_constant_of_shape,
        generate_nonzero,
        generate_relu,
        generate_non_max_suppression,
        generate_sub,
    ]
    for func in funcs:
        try:
            print(f"Running {func.__name__}...")
            func()
        except Exception as e:
            print(f"Exception in {func.__name__}: {e}")
