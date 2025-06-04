; ModuleID = 'TVMMod'
source_filename = "TVMMod"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__TVMFFIErrorSetRaisedByCStr = linkonce dllexport local_unnamed_addr global ptr null, align 8
@.str = private constant [55 x i8] c"Assert fail: num_args == 3, conv: num_args should be 3\00", align 1
@.str.1 = private constant [13 x i8] c"RuntimeError\00", align 1
@.str.2 = private constant [63 x i8] c"Assert fail: not T.isnullptr(args), conv: args pointer is NULL\00", align 1
@.str.3 = private constant [146 x i8] c"Assert fail: var_A_type_index == 0 or var_A_type_index == 4 or var_A_type_index == 7 or var_A_type_index >= 64, conv: Expect arg[0] to be pointer\00", align 1
@.str.4 = private constant [146 x i8] c"Assert fail: var_W_type_index == 0 or var_W_type_index == 4 or var_W_type_index == 7 or var_W_type_index >= 64, conv: Expect arg[1] to be pointer\00", align 1
@.str.5 = private constant [186 x i8] c"Assert fail: var_conv2d_nchw_type_index == 0 or var_conv2d_nchw_type_index == 4 or var_conv2d_nchw_type_index == 7 or var_conv2d_nchw_type_index >= 64, conv: Expect arg[2] to be pointer\00", align 1
@.str.6 = private constant [95 x i8] c"Assert fail: not T.isnullptr(var_A), conv.var_A is expected to have non-NULL DLTensor* pointer\00", align 1
@.str.7 = private constant [97 x i8] c"Assert fail: 4 == T.tvm_struct_get(var_A, 0, 4, \22int32\22), conv.var_A.ndim is expected to equal 4\00", align 1
@.str.8 = private constant [95 x i8] c"Assert fail: not T.isnullptr(var_W), conv.var_W is expected to have non-NULL DLTensor* pointer\00", align 1
@.str.9 = private constant [97 x i8] c"Assert fail: 4 == T.tvm_struct_get(var_W, 0, 4, \22int32\22), conv.var_W.ndim is expected to equal 4\00", align 1
@.str.10 = private constant [115 x i8] c"Assert fail: not T.isnullptr(var_conv2d_nchw), conv.var_conv2d_nchw is expected to have non-NULL DLTensor* pointer\00", align 1
@.str.11 = private constant [117 x i8] c"Assert fail: 4 == T.tvm_struct_get(var_conv2d_nchw, 0, 4, \22int32\22), conv.var_conv2d_nchw.ndim is expected to equal 4\00", align 1
@.str.12 = private constant [227 x i8] c"Assert fail: T.tvm_struct_get(var_A, 0, 5, \22uint8\22) == T.uint8(2) and T.tvm_struct_get(var_A, 0, 6, \22uint8\22) == T.uint8(32) and T.tvm_struct_get(var_A, 0, 7, \22uint16\22) == T.uint16(1), conv.var_A.dtype is expected to be float32\00", align 1
@.str.13 = private constant [313 x i8] c"Assert fail: (W == 1 or 1 == T.Cast(\22int32\22, conv_var_A_strides[3])) and (H == 1 or W == T.Cast(\22int32\22, conv_var_A_strides[2])) and (CI == 1 or W * H == T.Cast(\22int32\22, conv_var_A_strides[1])) and (N == 1 or W * H * CI == T.Cast(\22int32\22, conv_var_A_strides[0])), conv.var_A.strides: expected to be compact array\00", align 1
@.str.14 = private constant [187 x i8] c"Assert fail: T.uint64(0) == T.tvm_struct_get(var_A, 0, 8, \22uint64\22), Argument conv.var_A.byte_offset has an unsatisfied constraint: T.uint64(0) == T.tvm_struct_get(var_A, 0, 8, \22uint64\22)\00", align 1
@.str.15 = private constant [167 x i8] c"Assert fail: T.tvm_struct_get(var_A, 0, 10, \22int32\22) == 1, Argument conv.var_A.device_type has an unsatisfied constraint: 1 == T.tvm_struct_get(var_A, 0, 10, \22int32\22)\00", align 1
@.str.16 = private constant [109 x i8] c"Assert fail: N * CI * H * W == 0 or not T.isnullptr(A), conv.var_A is expected to have non-NULL data pointer\00", align 1
@.str.17 = private constant [227 x i8] c"Assert fail: T.tvm_struct_get(var_W, 0, 5, \22uint8\22) == T.uint8(2) and T.tvm_struct_get(var_W, 0, 6, \22uint8\22) == T.uint8(32) and T.tvm_struct_get(var_W, 0, 7, \22uint16\22) == T.uint16(1), conv.var_W.dtype is expected to be float32\00", align 1
@.str.18 = private constant [160 x i8] c"Assert fail: CI == T.Cast(\22int32\22, conv_var_W_shape[1]), Argument conv.var_W.shape[1] has an unsatisfied constraint: CI == T.Cast(\22int32\22, conv_var_W_shape[1])\00", align 1
@.str.19 = private constant [321 x i8] c"Assert fail: (KW == 1 or 1 == T.Cast(\22int32\22, conv_var_W_strides[3])) and (KH == 1 or KW == T.Cast(\22int32\22, conv_var_W_strides[2])) and (CI == 1 or KW * KH == T.Cast(\22int32\22, conv_var_W_strides[1])) and (CO == 1 or KW * KH * CI == T.Cast(\22int32\22, conv_var_W_strides[0])), conv.var_W.strides: expected to be compact array\00", align 1
@.str.20 = private constant [187 x i8] c"Assert fail: T.uint64(0) == T.tvm_struct_get(var_W, 0, 8, \22uint64\22), Argument conv.var_W.byte_offset has an unsatisfied constraint: T.uint64(0) == T.tvm_struct_get(var_W, 0, 8, \22uint64\22)\00", align 1
@.str.21 = private constant [167 x i8] c"Assert fail: T.tvm_struct_get(var_W, 0, 10, \22int32\22) == 1, Argument conv.var_W.device_type has an unsatisfied constraint: 1 == T.tvm_struct_get(var_W, 0, 10, \22int32\22)\00", align 1
@.str.22 = private constant [173 x i8] c"Assert fail: dev_id == T.tvm_struct_get(var_W, 0, 9, \22int32\22), Argument conv.var_W.device_id has an unsatisfied constraint: dev_id == T.tvm_struct_get(var_W, 0, 9, \22int32\22)\00", align 1
@.str.23 = private constant [112 x i8] c"Assert fail: CO * CI * KH * KW == 0 or not T.isnullptr(W), conv.var_W is expected to have non-NULL data pointer\00", align 1
@.str.24 = private constant [267 x i8] c"Assert fail: T.tvm_struct_get(var_conv2d_nchw, 0, 5, \22uint8\22) == T.uint8(2) and T.tvm_struct_get(var_conv2d_nchw, 0, 6, \22uint8\22) == T.uint8(32) and T.tvm_struct_get(var_conv2d_nchw, 0, 7, \22uint16\22) == T.uint16(1), conv.var_conv2d_nchw.dtype is expected to be float32\00", align 1
@.str.25 = private constant [188 x i8] c"Assert fail: N == T.Cast(\22int32\22, conv_var_conv2d_nchw_shape[0]), Argument conv.var_conv2d_nchw.shape[0] has an unsatisfied constraint: N == T.Cast(\22int32\22, conv_var_conv2d_nchw_shape[0])\00", align 1
@.str.26 = private constant [190 x i8] c"Assert fail: CO == T.Cast(\22int32\22, conv_var_conv2d_nchw_shape[1]), Argument conv.var_conv2d_nchw.shape[1] has an unsatisfied constraint: CO == T.Cast(\22int32\22, conv_var_conv2d_nchw_shape[1])\00", align 1
@.str.27 = private constant [206 x i8] c"Assert fail: H + 3 - KH == T.Cast(\22int32\22, conv_var_conv2d_nchw_shape[2]), Argument conv.var_conv2d_nchw.shape[2] has an unsatisfied constraint: H + 3 - KH == T.Cast(\22int32\22, conv_var_conv2d_nchw_shape[2])\00", align 1
@.str.28 = private constant [206 x i8] c"Assert fail: W + 3 - KW == T.Cast(\22int32\22, conv_var_conv2d_nchw_shape[3]), Argument conv.var_conv2d_nchw.shape[3] has an unsatisfied constraint: W + 3 - KW == T.Cast(\22int32\22, conv_var_conv2d_nchw_shape[3])\00", align 1
@.str.29 = private constant [434 x i8] c"Assert fail: (W + 3 - KW == 1 or 1 == T.Cast(\22int32\22, conv_var_conv2d_nchw_strides[3])) and (H + 3 - KH == 1 or W + 3 - KW == T.Cast(\22int32\22, conv_var_conv2d_nchw_strides[2])) and (CO == 1 or (W + 3 - KW) * (H + 3 - KH) == T.Cast(\22int32\22, conv_var_conv2d_nchw_strides[1])) and (N == 1 or (W + 3 - KW) * (H + 3 - KH) * CO == T.Cast(\22int32\22, conv_var_conv2d_nchw_strides[0])), conv.var_conv2d_nchw.strides: expected to be compact array\00", align 1
@.str.30 = private constant [217 x i8] c"Assert fail: T.uint64(0) == T.tvm_struct_get(var_conv2d_nchw, 0, 8, \22uint64\22), Argument conv.var_conv2d_nchw.byte_offset has an unsatisfied constraint: T.uint64(0) == T.tvm_struct_get(var_conv2d_nchw, 0, 8, \22uint64\22)\00", align 1
@.str.31 = private constant [197 x i8] c"Assert fail: T.tvm_struct_get(var_conv2d_nchw, 0, 10, \22int32\22) == 1, Argument conv.var_conv2d_nchw.device_type has an unsatisfied constraint: 1 == T.tvm_struct_get(var_conv2d_nchw, 0, 10, \22int32\22)\00", align 1
@.str.32 = private constant [203 x i8] c"Assert fail: dev_id == T.tvm_struct_get(var_conv2d_nchw, 0, 9, \22int32\22), Argument conv.var_conv2d_nchw.device_id has an unsatisfied constraint: dev_id == T.tvm_struct_get(var_conv2d_nchw, 0, 9, \22int32\22)\00", align 1
@.str.33 = private constant [151 x i8] c"Assert fail: N * CO * (H + 3 - KH) * (W + 3 - KW) == 0 or not T.isnullptr(conv2d_nchw), conv.var_conv2d_nchw is expected to have non-NULL data pointer\00", align 1
@__TVMBackendAllocWorkspace = linkonce dllexport local_unnamed_addr global ptr null, align 8
@__TVMBackendFreeWorkspace = linkonce dllexport local_unnamed_addr global ptr null, align 8
@__tvm_main__ = weak dllexport local_unnamed_addr constant [5 x i8] c"conv\00", align 1
@llvm.global_ctors = appending global [0 x { i32, ptr, ptr }] zeroinitializer

define dllexport range(i32 -1, 1) i32 @conv(ptr noalias nocapture readnone %self_handle, ptr noalias readonly %args, i32 %num_args, ptr noalias nocapture readnone %result) local_unnamed_addr #0 !dbg !5 {
entry:
    #dbg_value(ptr %self_handle, !11, !DIExpression(), !15)
    #dbg_value(ptr %args, !12, !DIExpression(), !15)
    #dbg_value(i32 %num_args, !13, !DIExpression(), !15)
    #dbg_value(ptr %result, !14, !DIExpression(), !15)
  %0 = icmp eq i32 %num_args, 3, !dbg !15
  br i1 %0, label %assert_end, label %assert_fail, !dbg !15, !prof !16

common.ret:                                       ; preds = %assert_end70, %assert_fail69, %assert_fail67, %assert_fail65, %assert_fail63, %assert_fail61, %assert_fail57, %assert_fail55, %assert_fail53, %assert_fail51, %assert_fail49, %assert_fail47, %assert_fail45, %assert_fail43, %assert_fail41, %assert_fail39, %assert_fail35, %assert_fail33, %assert_fail31, %assert_fail29, %assert_fail27, %assert_fail25, %assert_fail23, %assert_fail21, %assert_fail19, %assert_fail15, %assert_fail13, %assert_fail11, %assert_fail9, %assert_fail7, %assert_fail5, %assert_fail3, %assert_fail1, %assert_fail
  %common.ret.op = phi i32 [ -1, %assert_fail ], [ -1, %assert_fail1 ], [ -1, %assert_fail3 ], [ -1, %assert_fail5 ], [ -1, %assert_fail7 ], [ -1, %assert_fail9 ], [ -1, %assert_fail11 ], [ -1, %assert_fail13 ], [ -1, %assert_fail15 ], [ -1, %assert_fail19 ], [ -1, %assert_fail21 ], [ -1, %assert_fail23 ], [ -1, %assert_fail25 ], [ -1, %assert_fail27 ], [ -1, %assert_fail29 ], [ -1, %assert_fail31 ], [ -1, %assert_fail33 ], [ -1, %assert_fail35 ], [ -1, %assert_fail39 ], [ -1, %assert_fail41 ], [ -1, %assert_fail43 ], [ -1, %assert_fail45 ], [ -1, %assert_fail47 ], [ -1, %assert_fail49 ], [ -1, %assert_fail51 ], [ -1, %assert_fail53 ], [ -1, %assert_fail55 ], [ -1, %assert_fail57 ], [ -1, %assert_fail61 ], [ -1, %assert_fail63 ], [ -1, %assert_fail65 ], [ -1, %assert_fail67 ], [ -1, %assert_fail69 ], [ %258, %assert_end70 ]
  ret i32 %common.ret.op, !dbg !15

assert_fail:                                      ; preds = %entry
  %1 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %1(ptr nonnull @.str.1, ptr nonnull @.str), !dbg !15
  br label %common.ret, !dbg !15

assert_end:                                       ; preds = %entry
  %.not = icmp eq ptr %args, null, !dbg !15
  br i1 %.not, label %assert_fail1, label %assert_end2, !dbg !15, !prof !20

assert_fail1:                                     ; preds = %assert_end
  %2 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %2(ptr nonnull @.str.1, ptr nonnull @.str.2), !dbg !15
  br label %common.ret, !dbg !15

assert_end2:                                      ; preds = %assert_end
  %var_A.type_index = load i32, ptr %args, align 4, !dbg !15
    #dbg_declare(i32 %var_A.type_index, !21, !DIExpression(), !15)
    #dbg_declare(i32 %var_A.type_index, !21, !DIExpression(), !15)
  %var_A.type_index.fr = freeze i32 %var_A.type_index, !dbg !15
  %3 = icmp sgt i32 %var_A.type_index.fr, 63, !dbg !15
  br i1 %3, label %assert_end4, label %switch.early.test, !dbg !15

switch.early.test:                                ; preds = %assert_end2
  switch i32 %var_A.type_index.fr, label %assert_fail3 [
    i32 7, label %assert_end4
    i32 4, label %assert_end4
    i32 0, label %assert_end4
  ], !dbg !15

assert_fail3:                                     ; preds = %switch.early.test
  %4 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %4(ptr nonnull @.str.1, ptr nonnull @.str.3), !dbg !15
  br label %common.ret, !dbg !15

assert_end4:                                      ; preds = %switch.early.test, %switch.early.test, %switch.early.test, %assert_end2
  %5 = getelementptr inbounds i8, ptr %args, i64 16, !dbg !15
  %var_W.type_index = load i32, ptr %5, align 4, !dbg !15
    #dbg_declare(i32 %var_W.type_index, !22, !DIExpression(), !15)
    #dbg_declare(i32 %var_W.type_index, !22, !DIExpression(), !15)
  %var_W.type_index.fr = freeze i32 %var_W.type_index, !dbg !15
  %6 = icmp sgt i32 %var_W.type_index.fr, 63, !dbg !15
  br i1 %6, label %assert_end6, label %switch.early.test72, !dbg !15

switch.early.test72:                              ; preds = %assert_end4
  switch i32 %var_W.type_index.fr, label %assert_fail5 [
    i32 7, label %assert_end6
    i32 4, label %assert_end6
    i32 0, label %assert_end6
  ], !dbg !15

assert_fail5:                                     ; preds = %switch.early.test72
  %7 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %7(ptr nonnull @.str.1, ptr nonnull @.str.4), !dbg !15
  br label %common.ret, !dbg !15

assert_end6:                                      ; preds = %switch.early.test72, %switch.early.test72, %switch.early.test72, %assert_end4
  %8 = getelementptr inbounds i8, ptr %args, i64 32, !dbg !15
  %var_conv2d_nchw.type_index = load i32, ptr %8, align 4, !dbg !15
    #dbg_declare(i32 %var_conv2d_nchw.type_index, !23, !DIExpression(), !15)
    #dbg_declare(i32 %var_conv2d_nchw.type_index, !23, !DIExpression(), !15)
  %var_conv2d_nchw.type_index.fr = freeze i32 %var_conv2d_nchw.type_index, !dbg !15
  %9 = icmp sgt i32 %var_conv2d_nchw.type_index.fr, 63, !dbg !15
  br i1 %9, label %assert_end8, label %switch.early.test73, !dbg !15

switch.early.test73:                              ; preds = %assert_end6
  switch i32 %var_conv2d_nchw.type_index.fr, label %assert_fail7 [
    i32 7, label %assert_end8
    i32 4, label %assert_end8
    i32 0, label %assert_end8
  ], !dbg !15

assert_fail7:                                     ; preds = %switch.early.test73
  %10 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %10(ptr nonnull @.str.1, ptr nonnull @.str.5), !dbg !15
  br label %common.ret, !dbg !15

assert_end8:                                      ; preds = %switch.early.test73, %switch.early.test73, %switch.early.test73, %assert_end6
  %11 = getelementptr inbounds i8, ptr %args, i64 8, !dbg !15
  %12 = load ptr, ptr %11, align 8, !dbg !15
  %13 = icmp eq i32 %var_A.type_index.fr, 72, !dbg !15
  %var_A.idx = select i1 %13, i64 16, i64 0, !dbg !15
  %var_A = getelementptr inbounds i8, ptr %12, i64 %var_A.idx, !dbg !15
    #dbg_declare(ptr %var_A, !24, !DIExpression(), !15)
    #dbg_declare(ptr %var_A, !24, !DIExpression(), !15)
  %14 = getelementptr inbounds i8, ptr %args, i64 24, !dbg !15
  %15 = load ptr, ptr %14, align 8, !dbg !15
  %16 = icmp eq i32 %var_W.type_index.fr, 72, !dbg !15
  %var_W.idx = select i1 %16, i64 16, i64 0, !dbg !15
  %var_W = getelementptr inbounds i8, ptr %15, i64 %var_W.idx, !dbg !15
    #dbg_declare(ptr %var_W, !25, !DIExpression(), !15)
    #dbg_declare(ptr %var_W, !25, !DIExpression(), !15)
  %17 = getelementptr inbounds i8, ptr %args, i64 40, !dbg !15
  %18 = load ptr, ptr %17, align 8, !dbg !15
  %19 = icmp eq i32 %var_conv2d_nchw.type_index.fr, 72, !dbg !15
  %var_conv2d_nchw.idx = select i1 %19, i64 16, i64 0, !dbg !15
  %var_conv2d_nchw = getelementptr inbounds i8, ptr %18, i64 %var_conv2d_nchw.idx, !dbg !15
    #dbg_declare(ptr %var_conv2d_nchw, !26, !DIExpression(), !15)
    #dbg_declare(ptr %var_conv2d_nchw, !26, !DIExpression(), !15)
  %.not75 = icmp eq ptr %12, null, !dbg !15
  br i1 %.not75, label %assert_fail9, label %assert_end10, !dbg !15, !prof !20

assert_fail9:                                     ; preds = %assert_end8
  %20 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %20(ptr nonnull @.str.1, ptr nonnull @.str.6), !dbg !15
  br label %common.ret, !dbg !15

assert_end10:                                     ; preds = %assert_end8
  %21 = getelementptr inbounds i8, ptr %var_A, i64 16, !dbg !15
  %22 = load i32, ptr %21, align 4, !dbg !15
  %23 = icmp eq i32 %22, 4, !dbg !15
  br i1 %23, label %assert_end12, label %assert_fail11, !dbg !15, !prof !16

assert_fail11:                                    ; preds = %assert_end10
  %24 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %24(ptr nonnull @.str.1, ptr nonnull @.str.7), !dbg !15
  br label %common.ret, !dbg !15

assert_end12:                                     ; preds = %assert_end10
  %25 = getelementptr inbounds i8, ptr %var_A, i64 24, !dbg !15
  %conv.var_A.shape = load ptr, ptr %25, align 8, !dbg !15
    #dbg_declare(ptr %conv.var_A.shape, !27, !DIExpression(), !15)
    #dbg_declare(ptr %conv.var_A.shape, !27, !DIExpression(), !15)
  %26 = load i64, ptr %conv.var_A.shape, align 8, !dbg !15, !tbaa !30
  %N = trunc i64 %26 to i32, !dbg !15
    #dbg_declare(i32 %N, !40, !DIExpression(), !15)
    #dbg_declare(i32 %N, !40, !DIExpression(), !15)
  %27 = getelementptr inbounds i8, ptr %conv.var_A.shape, i64 8, !dbg !15
  %28 = load i64, ptr %27, align 8, !dbg !15, !tbaa !41
  %CI = trunc i64 %28 to i32, !dbg !15
    #dbg_declare(i32 %CI, !43, !DIExpression(), !15)
    #dbg_declare(i32 %CI, !43, !DIExpression(), !15)
  %29 = getelementptr inbounds i8, ptr %conv.var_A.shape, i64 16, !dbg !15
  %30 = load i64, ptr %29, align 8, !dbg !15, !tbaa !44
  %H = trunc i64 %30 to i32, !dbg !15
    #dbg_declare(i32 %H, !47, !DIExpression(), !15)
    #dbg_declare(i32 %H, !47, !DIExpression(), !15)
  %31 = getelementptr inbounds i8, ptr %conv.var_A.shape, i64 24, !dbg !15
  %32 = load i64, ptr %31, align 8, !dbg !15, !tbaa !48
  %W = trunc i64 %32 to i32, !dbg !15
    #dbg_declare(i32 %W, !50, !DIExpression(), !15)
    #dbg_declare(i32 %W, !50, !DIExpression(), !15)
  %33 = getelementptr inbounds i8, ptr %var_A, i64 32, !dbg !15
  %conv.var_A.strides = load ptr, ptr %33, align 8, !dbg !15
    #dbg_declare(ptr %conv.var_A.strides, !51, !DIExpression(), !15)
    #dbg_declare(ptr %conv.var_A.strides, !51, !DIExpression(), !15)
  %34 = getelementptr inbounds i8, ptr %var_A, i64 12, !dbg !15
  %dev_id = load i32, ptr %34, align 4, !dbg !15
    #dbg_declare(i32 %dev_id, !52, !DIExpression(), !15)
    #dbg_declare(i32 %dev_id, !52, !DIExpression(), !15)
  %A = load ptr, ptr %var_A, align 8, !dbg !15
    #dbg_declare(ptr %A, !53, !DIExpression(), !15)
    #dbg_declare(ptr %A, !53, !DIExpression(), !15)
  call void @llvm.assume(i1 true) [ "align"(ptr %A, i64 64) ], !dbg !15
  %.not76 = icmp eq ptr %15, null, !dbg !15
  br i1 %.not76, label %assert_fail13, label %assert_end14, !dbg !15, !prof !20

assert_fail13:                                    ; preds = %assert_end12
  %35 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %35(ptr nonnull @.str.1, ptr nonnull @.str.8), !dbg !15
  br label %common.ret, !dbg !15

assert_end14:                                     ; preds = %assert_end12
  %36 = getelementptr inbounds i8, ptr %var_W, i64 16, !dbg !15
  %37 = load i32, ptr %36, align 4, !dbg !15
  %38 = icmp eq i32 %37, 4, !dbg !15
  br i1 %38, label %assert_end16, label %assert_fail15, !dbg !15, !prof !16

assert_fail15:                                    ; preds = %assert_end14
  %39 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %39(ptr nonnull @.str.1, ptr nonnull @.str.9), !dbg !15
  br label %common.ret, !dbg !15

assert_end16:                                     ; preds = %assert_end14
  %40 = getelementptr inbounds i8, ptr %var_W, i64 24, !dbg !15
  %conv.var_W.shape = load ptr, ptr %40, align 8, !dbg !15
    #dbg_declare(ptr %conv.var_W.shape, !56, !DIExpression(), !15)
    #dbg_declare(ptr %conv.var_W.shape, !56, !DIExpression(), !15)
  %41 = load i64, ptr %conv.var_W.shape, align 8, !dbg !15, !tbaa !57
  %CO = trunc i64 %41 to i32, !dbg !15
    #dbg_declare(i32 %CO, !67, !DIExpression(), !15)
    #dbg_declare(i32 %CO, !67, !DIExpression(), !15)
  %42 = getelementptr inbounds i8, ptr %conv.var_W.shape, i64 16, !dbg !15
  %43 = load i64, ptr %42, align 8, !dbg !15, !tbaa !68
  %KH = trunc i64 %43 to i32, !dbg !15
    #dbg_declare(i32 %KH, !71, !DIExpression(), !15)
    #dbg_declare(i32 %KH, !71, !DIExpression(), !15)
  %44 = getelementptr inbounds i8, ptr %conv.var_W.shape, i64 24, !dbg !15
  %45 = load i64, ptr %44, align 8, !dbg !15, !tbaa !72
  %KW = trunc i64 %45 to i32, !dbg !15
    #dbg_declare(i32 %KW, !74, !DIExpression(), !15)
    #dbg_declare(i32 %KW, !74, !DIExpression(), !15)
  %46 = getelementptr inbounds i8, ptr %var_W, i64 32, !dbg !15
  %conv.var_W.strides = load ptr, ptr %46, align 8, !dbg !15
    #dbg_declare(ptr %conv.var_W.strides, !75, !DIExpression(), !15)
    #dbg_declare(ptr %conv.var_W.strides, !75, !DIExpression(), !15)
  %W71 = load ptr, ptr %var_W, align 8, !dbg !15
    #dbg_declare(ptr %W71, !76, !DIExpression(), !15)
    #dbg_declare(ptr %W71, !76, !DIExpression(), !15)
  call void @llvm.assume(i1 true) [ "align"(ptr %W71, i64 64) ], !dbg !15
  %.not77 = icmp eq ptr %18, null, !dbg !15
  br i1 %.not77, label %assert_fail19, label %assert_end20, !dbg !15, !prof !20

assert_fail19:                                    ; preds = %assert_end16
  %47 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %47(ptr nonnull @.str.1, ptr nonnull @.str.10), !dbg !15
  br label %common.ret, !dbg !15

assert_end20:                                     ; preds = %assert_end16
  %48 = getelementptr inbounds i8, ptr %var_conv2d_nchw, i64 16, !dbg !15
  %49 = load i32, ptr %48, align 4, !dbg !15
  %50 = icmp eq i32 %49, 4, !dbg !15
  br i1 %50, label %assert_end22, label %assert_fail21, !dbg !15, !prof !16

assert_fail21:                                    ; preds = %assert_end20
  %51 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %51(ptr nonnull @.str.1, ptr nonnull @.str.11), !dbg !15
  br label %common.ret, !dbg !15

assert_end22:                                     ; preds = %assert_end20
  %52 = getelementptr inbounds i8, ptr %var_conv2d_nchw, i64 24, !dbg !15
  %conv.var_conv2d_nchw.shape = load ptr, ptr %52, align 8, !dbg !15
    #dbg_declare(ptr %conv.var_conv2d_nchw.shape, !77, !DIExpression(), !15)
    #dbg_declare(ptr %conv.var_conv2d_nchw.shape, !77, !DIExpression(), !15)
  %53 = getelementptr inbounds i8, ptr %var_conv2d_nchw, i64 32, !dbg !15
  %conv.var_conv2d_nchw.strides = load ptr, ptr %53, align 8, !dbg !15
    #dbg_declare(ptr %conv.var_conv2d_nchw.strides, !78, !DIExpression(), !15)
    #dbg_declare(ptr %conv.var_conv2d_nchw.strides, !78, !DIExpression(), !15)
  %conv2d_nchw = load ptr, ptr %var_conv2d_nchw, align 8, !dbg !15
    #dbg_declare(ptr %conv2d_nchw, !79, !DIExpression(), !15)
    #dbg_declare(ptr %conv2d_nchw, !79, !DIExpression(), !15)
  call void @llvm.assume(i1 true) [ "align"(ptr %conv2d_nchw, i64 64) ], !dbg !15
  %54 = getelementptr inbounds i8, ptr %var_A, i64 22, !dbg !15
  %55 = load i16, ptr %54, align 2, !dbg !15
  %56 = icmp eq i16 %55, 1, !dbg !15
  %57 = getelementptr inbounds i8, ptr %var_A, i64 21, !dbg !15
  %58 = load i8, ptr %57, align 1, !dbg !15
  %59 = icmp eq i8 %58, 32, !dbg !15
  %60 = getelementptr inbounds i8, ptr %var_A, i64 20, !dbg !15
  %61 = load i8, ptr %60, align 1, !dbg !15
  %62 = icmp eq i8 %61, 2, !dbg !15
  %63 = and i1 %59, %62, !dbg !15
  %64 = and i1 %56, %63, !dbg !15
  br i1 %64, label %assert_end24, label %assert_fail23, !dbg !15, !prof !16

assert_fail23:                                    ; preds = %assert_end22
  %65 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %65(ptr nonnull @.str.1, ptr nonnull @.str.12), !dbg !15
  br label %common.ret, !dbg !15

assert_end24:                                     ; preds = %assert_end22
  %.not78 = icmp eq ptr %conv.var_A.strides, null, !dbg !15
  br i1 %.not78, label %if_end, label %if_then, !dbg !15, !prof !20

if_then:                                          ; preds = %assert_end24
  %66 = mul nsw i32 %W, %H, !dbg !15
  %67 = mul nsw i32 %66, %CI, !dbg !15
  %68 = load i64, ptr %conv.var_A.strides, align 8, !dbg !15, !tbaa !80
  %69 = trunc i64 %68 to i32, !dbg !15
  %70 = icmp eq i32 %67, %69, !dbg !15
  %71 = icmp eq i32 %N, 1, !dbg !15
  %72 = or i1 %71, %70, !dbg !15
  %73 = getelementptr inbounds i8, ptr %conv.var_A.strides, i64 8, !dbg !15
  %74 = load i64, ptr %73, align 8, !dbg !15, !tbaa !90
  %75 = trunc i64 %74 to i32, !dbg !15
  %76 = icmp eq i32 %66, %75, !dbg !15
  %77 = icmp eq i32 %CI, 1, !dbg !15
  %78 = or i1 %77, %76, !dbg !15
  %79 = getelementptr inbounds i8, ptr %conv.var_A.strides, i64 16, !dbg !15
  %80 = load i64, ptr %79, align 8, !dbg !15, !tbaa !92
  %81 = trunc i64 %80 to i32, !dbg !15
  %82 = icmp eq i32 %W, %81, !dbg !15
  %83 = icmp eq i32 %H, 1, !dbg !15
  %84 = or i1 %83, %82, !dbg !15
  %85 = getelementptr inbounds i8, ptr %conv.var_A.strides, i64 24, !dbg !15
  %86 = load i64, ptr %85, align 8, !dbg !15, !tbaa !95
  %87 = and i64 %86, 4294967295, !dbg !15
  %88 = icmp eq i64 %87, 1, !dbg !15
  %89 = icmp eq i32 %W, 1, !dbg !15
  %90 = or i1 %89, %88, !dbg !15
  %91 = and i1 %84, %90, !dbg !15
  %92 = and i1 %78, %91, !dbg !15
  %93 = and i1 %72, %92, !dbg !15
  br i1 %93, label %if_end, label %assert_fail25, !dbg !15, !prof !16

if_end:                                           ; preds = %if_then, %assert_end24
  %94 = getelementptr inbounds i8, ptr %var_A, i64 40, !dbg !15
  %95 = load i64, ptr %94, align 8, !dbg !15
  %96 = icmp eq i64 %95, 0, !dbg !15
  br i1 %96, label %assert_end28, label %assert_fail27, !dbg !15, !prof !16

assert_fail25:                                    ; preds = %if_then
  %97 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %97(ptr nonnull @.str.1, ptr nonnull @.str.13), !dbg !15
  br label %common.ret, !dbg !15

assert_fail27:                                    ; preds = %if_end
  %98 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %98(ptr nonnull @.str.1, ptr nonnull @.str.14), !dbg !15
  br label %common.ret, !dbg !15

assert_end28:                                     ; preds = %if_end
  %99 = getelementptr inbounds i8, ptr %var_A, i64 8, !dbg !15
  %100 = load i32, ptr %99, align 4, !dbg !15
  %101 = icmp eq i32 %100, 1, !dbg !15
  br i1 %101, label %assert_end30, label %assert_fail29, !dbg !15, !prof !16

assert_fail29:                                    ; preds = %assert_end28
  %102 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %102(ptr nonnull @.str.1, ptr nonnull @.str.15), !dbg !15
  br label %common.ret, !dbg !15

assert_end30:                                     ; preds = %assert_end28
  %103 = icmp ne ptr %A, null, !dbg !15
  %104 = mul i32 %W, %H, !dbg !15
  %105 = mul i32 %104, %N, !dbg !15
  %106 = mul i32 %105, %CI, !dbg !15
  %107 = icmp eq i32 %106, 0, !dbg !15
  %108 = or i1 %107, %103, !dbg !15
  br i1 %108, label %assert_end32, label %assert_fail31, !dbg !15, !prof !16

assert_fail31:                                    ; preds = %assert_end30
  %109 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %109(ptr nonnull @.str.1, ptr nonnull @.str.16), !dbg !15
  br label %common.ret, !dbg !15

assert_end32:                                     ; preds = %assert_end30
  %110 = getelementptr inbounds i8, ptr %var_W, i64 22, !dbg !15
  %111 = load i16, ptr %110, align 2, !dbg !15
  %112 = icmp eq i16 %111, 1, !dbg !15
  %113 = getelementptr inbounds i8, ptr %var_W, i64 21, !dbg !15
  %114 = load i8, ptr %113, align 1, !dbg !15
  %115 = icmp eq i8 %114, 32, !dbg !15
  %116 = getelementptr inbounds i8, ptr %var_W, i64 20, !dbg !15
  %117 = load i8, ptr %116, align 1, !dbg !15
  %118 = icmp eq i8 %117, 2, !dbg !15
  %119 = and i1 %115, %118, !dbg !15
  %120 = and i1 %112, %119, !dbg !15
  br i1 %120, label %assert_end34, label %assert_fail33, !dbg !15, !prof !16

assert_fail33:                                    ; preds = %assert_end32
  %121 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %121(ptr nonnull @.str.1, ptr nonnull @.str.17), !dbg !15
  br label %common.ret, !dbg !15

assert_end34:                                     ; preds = %assert_end32
  %122 = getelementptr inbounds i8, ptr %conv.var_W.shape, i64 8, !dbg !15
  %123 = load i64, ptr %122, align 8, !dbg !15, !tbaa !97
  %124 = trunc i64 %123 to i32, !dbg !15
  %125 = icmp eq i32 %CI, %124, !dbg !15
  br i1 %125, label %assert_end36, label %assert_fail35, !dbg !15, !prof !16

assert_fail35:                                    ; preds = %assert_end34
  %126 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %126(ptr nonnull @.str.1, ptr nonnull @.str.18), !dbg !15
  br label %common.ret, !dbg !15

assert_end36:                                     ; preds = %assert_end34
  %.not79 = icmp eq ptr %conv.var_W.strides, null, !dbg !15
  br i1 %.not79, label %if_end38, label %if_then37, !dbg !15, !prof !20

if_then37:                                        ; preds = %assert_end36
  %127 = mul nsw i32 %KW, %KH, !dbg !15
  %128 = mul nsw i32 %127, %CI, !dbg !15
  %129 = load i64, ptr %conv.var_W.strides, align 8, !dbg !15, !tbaa !99
  %130 = trunc i64 %129 to i32, !dbg !15
  %131 = icmp eq i32 %128, %130, !dbg !15
  %132 = icmp eq i32 %CO, 1, !dbg !15
  %133 = or i1 %132, %131, !dbg !15
  %134 = getelementptr inbounds i8, ptr %conv.var_W.strides, i64 8, !dbg !15
  %135 = load i64, ptr %134, align 8, !dbg !15, !tbaa !109
  %136 = trunc i64 %135 to i32, !dbg !15
  %137 = icmp eq i32 %127, %136, !dbg !15
  %138 = icmp eq i32 %CI, 1, !dbg !15
  %139 = or i1 %138, %137, !dbg !15
  %140 = getelementptr inbounds i8, ptr %conv.var_W.strides, i64 16, !dbg !15
  %141 = load i64, ptr %140, align 8, !dbg !15, !tbaa !111
  %142 = trunc i64 %141 to i32, !dbg !15
  %143 = icmp eq i32 %KW, %142, !dbg !15
  %144 = icmp eq i32 %KH, 1, !dbg !15
  %145 = or i1 %144, %143, !dbg !15
  %146 = getelementptr inbounds i8, ptr %conv.var_W.strides, i64 24, !dbg !15
  %147 = load i64, ptr %146, align 8, !dbg !15, !tbaa !114
  %148 = and i64 %147, 4294967295, !dbg !15
  %149 = icmp eq i64 %148, 1, !dbg !15
  %150 = icmp eq i32 %KW, 1, !dbg !15
  %151 = or i1 %150, %149, !dbg !15
  %152 = and i1 %145, %151, !dbg !15
  %153 = and i1 %139, %152, !dbg !15
  %154 = and i1 %133, %153, !dbg !15
  br i1 %154, label %if_end38, label %assert_fail39, !dbg !15, !prof !16

if_end38:                                         ; preds = %if_then37, %assert_end36
  %155 = getelementptr inbounds i8, ptr %var_W, i64 40, !dbg !15
  %156 = load i64, ptr %155, align 8, !dbg !15
  %157 = icmp eq i64 %156, 0, !dbg !15
  br i1 %157, label %assert_end42, label %assert_fail41, !dbg !15, !prof !16

assert_fail39:                                    ; preds = %if_then37
  %158 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %158(ptr nonnull @.str.1, ptr nonnull @.str.19), !dbg !15
  br label %common.ret, !dbg !15

assert_fail41:                                    ; preds = %if_end38
  %159 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %159(ptr nonnull @.str.1, ptr nonnull @.str.20), !dbg !15
  br label %common.ret, !dbg !15

assert_end42:                                     ; preds = %if_end38
  %160 = getelementptr inbounds i8, ptr %var_W, i64 8, !dbg !15
  %161 = load i32, ptr %160, align 4, !dbg !15
  %162 = icmp eq i32 %161, 1, !dbg !15
  br i1 %162, label %assert_end44, label %assert_fail43, !dbg !15, !prof !16

assert_fail43:                                    ; preds = %assert_end42
  %163 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %163(ptr nonnull @.str.1, ptr nonnull @.str.21), !dbg !15
  br label %common.ret, !dbg !15

assert_end44:                                     ; preds = %assert_end42
  %164 = getelementptr inbounds i8, ptr %var_W, i64 12, !dbg !15
  %165 = load i32, ptr %164, align 4, !dbg !15
  %166 = icmp eq i32 %dev_id, %165, !dbg !15
  br i1 %166, label %assert_end46, label %assert_fail45, !dbg !15, !prof !16

assert_fail45:                                    ; preds = %assert_end44
  %167 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %167(ptr nonnull @.str.1, ptr nonnull @.str.22), !dbg !15
  br label %common.ret, !dbg !15

assert_end46:                                     ; preds = %assert_end44
  %168 = icmp ne ptr %W71, null, !dbg !15
  %169 = mul i32 %KW, %KH, !dbg !15
  %170 = mul i32 %169, %CI, !dbg !15
  %171 = mul i32 %170, %CO, !dbg !15
  %172 = icmp eq i32 %171, 0, !dbg !15
  %173 = or i1 %172, %168, !dbg !15
  br i1 %173, label %assert_end48, label %assert_fail47, !dbg !15, !prof !16

assert_fail47:                                    ; preds = %assert_end46
  %174 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %174(ptr nonnull @.str.1, ptr nonnull @.str.23), !dbg !15
  br label %common.ret, !dbg !15

assert_end48:                                     ; preds = %assert_end46
  %175 = getelementptr inbounds i8, ptr %var_conv2d_nchw, i64 22, !dbg !15
  %176 = load i16, ptr %175, align 2, !dbg !15
  %177 = icmp eq i16 %176, 1, !dbg !15
  %178 = getelementptr inbounds i8, ptr %var_conv2d_nchw, i64 21, !dbg !15
  %179 = load i8, ptr %178, align 1, !dbg !15
  %180 = icmp eq i8 %179, 32, !dbg !15
  %181 = getelementptr inbounds i8, ptr %var_conv2d_nchw, i64 20, !dbg !15
  %182 = load i8, ptr %181, align 1, !dbg !15
  %183 = icmp eq i8 %182, 2, !dbg !15
  %184 = and i1 %180, %183, !dbg !15
  %185 = and i1 %177, %184, !dbg !15
  br i1 %185, label %assert_end50, label %assert_fail49, !dbg !15, !prof !16

assert_fail49:                                    ; preds = %assert_end48
  %186 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %186(ptr nonnull @.str.1, ptr nonnull @.str.24), !dbg !15
  br label %common.ret, !dbg !15

assert_end50:                                     ; preds = %assert_end48
  %187 = load i64, ptr %conv.var_conv2d_nchw.shape, align 8, !dbg !15, !tbaa !116
  %188 = trunc i64 %187 to i32, !dbg !15
  %189 = icmp eq i32 %N, %188, !dbg !15
  br i1 %189, label %assert_end52, label %assert_fail51, !dbg !15, !prof !16

assert_fail51:                                    ; preds = %assert_end50
  %190 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %190(ptr nonnull @.str.1, ptr nonnull @.str.25), !dbg !15
  br label %common.ret, !dbg !15

assert_end52:                                     ; preds = %assert_end50
  %191 = getelementptr inbounds i8, ptr %conv.var_conv2d_nchw.shape, i64 8, !dbg !15
  %192 = load i64, ptr %191, align 8, !dbg !15, !tbaa !126
  %193 = trunc i64 %192 to i32, !dbg !15
  %194 = icmp eq i32 %CO, %193, !dbg !15
  br i1 %194, label %assert_end54, label %assert_fail53, !dbg !15, !prof !16

assert_fail53:                                    ; preds = %assert_end52
  %195 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %195(ptr nonnull @.str.1, ptr nonnull @.str.26), !dbg !15
  br label %common.ret, !dbg !15

assert_end54:                                     ; preds = %assert_end52
  %196 = add nsw i32 %H, 3, !dbg !15
  %197 = sub i32 %196, %KH, !dbg !15
  %198 = getelementptr inbounds i8, ptr %conv.var_conv2d_nchw.shape, i64 16, !dbg !15
  %199 = load i64, ptr %198, align 8, !dbg !15, !tbaa !128
  %200 = trunc i64 %199 to i32, !dbg !15
  %201 = icmp eq i32 %197, %200, !dbg !15
  br i1 %201, label %assert_end56, label %assert_fail55, !dbg !15, !prof !16

assert_fail55:                                    ; preds = %assert_end54
  %202 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %202(ptr nonnull @.str.1, ptr nonnull @.str.27), !dbg !15
  br label %common.ret, !dbg !15

assert_end56:                                     ; preds = %assert_end54
  %203 = add nsw i32 %W, 3, !dbg !15
  %204 = sub i32 %203, %KW, !dbg !15
  %205 = getelementptr inbounds i8, ptr %conv.var_conv2d_nchw.shape, i64 24, !dbg !15
  %206 = load i64, ptr %205, align 8, !dbg !15, !tbaa !131
  %207 = trunc i64 %206 to i32, !dbg !15
  %208 = icmp eq i32 %204, %207, !dbg !15
  br i1 %208, label %assert_end58, label %assert_fail57, !dbg !15, !prof !16

assert_fail57:                                    ; preds = %assert_end56
  %209 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %209(ptr nonnull @.str.1, ptr nonnull @.str.28), !dbg !15
  br label %common.ret, !dbg !15

assert_end58:                                     ; preds = %assert_end56
  %.not80 = icmp eq ptr %conv.var_conv2d_nchw.strides, null, !dbg !15
  br i1 %.not80, label %if_end60, label %if_then59, !dbg !15, !prof !20

if_then59:                                        ; preds = %assert_end58
  %210 = mul nsw i32 %204, %197, !dbg !15
  %211 = mul nsw i32 %210, %CO, !dbg !15
  %212 = load i64, ptr %conv.var_conv2d_nchw.strides, align 8, !dbg !15, !tbaa !133
  %213 = trunc i64 %212 to i32, !dbg !15
  %214 = icmp eq i32 %211, %213, !dbg !15
  %215 = icmp eq i32 %N, 1, !dbg !15
  %216 = or i1 %215, %214, !dbg !15
  %217 = getelementptr inbounds i8, ptr %conv.var_conv2d_nchw.strides, i64 8, !dbg !15
  %218 = load i64, ptr %217, align 8, !dbg !15, !tbaa !143
  %219 = trunc i64 %218 to i32, !dbg !15
  %220 = icmp eq i32 %210, %219, !dbg !15
  %221 = icmp eq i32 %CO, 1, !dbg !15
  %222 = or i1 %221, %220, !dbg !15
  %223 = getelementptr inbounds i8, ptr %conv.var_conv2d_nchw.strides, i64 16, !dbg !15
  %224 = load i64, ptr %223, align 8, !dbg !15, !tbaa !145
  %225 = trunc i64 %224 to i32, !dbg !15
  %226 = icmp eq i32 %204, %225, !dbg !15
  %227 = icmp eq i32 %197, 1, !dbg !15
  %228 = or i1 %227, %226, !dbg !15
  %229 = getelementptr inbounds i8, ptr %conv.var_conv2d_nchw.strides, i64 24, !dbg !15
  %230 = load i64, ptr %229, align 8, !dbg !15, !tbaa !148
  %231 = and i64 %230, 4294967295, !dbg !15
  %232 = icmp eq i64 %231, 1, !dbg !15
  %233 = icmp eq i32 %204, 1, !dbg !15
  %234 = or i1 %233, %232, !dbg !15
  %235 = and i1 %228, %234, !dbg !15
  %236 = and i1 %222, %235, !dbg !15
  %237 = and i1 %216, %236, !dbg !15
  br i1 %237, label %if_end60, label %assert_fail61, !dbg !15, !prof !16

if_end60:                                         ; preds = %if_then59, %assert_end58
  %238 = getelementptr inbounds i8, ptr %var_conv2d_nchw, i64 40, !dbg !15
  %239 = load i64, ptr %238, align 8, !dbg !15
  %240 = icmp eq i64 %239, 0, !dbg !15
  br i1 %240, label %assert_end64, label %assert_fail63, !dbg !15, !prof !16

assert_fail61:                                    ; preds = %if_then59
  %241 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %241(ptr nonnull @.str.1, ptr nonnull @.str.29), !dbg !15
  br label %common.ret, !dbg !15

assert_fail63:                                    ; preds = %if_end60
  %242 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %242(ptr nonnull @.str.1, ptr nonnull @.str.30), !dbg !15
  br label %common.ret, !dbg !15

assert_end64:                                     ; preds = %if_end60
  %243 = getelementptr inbounds i8, ptr %var_conv2d_nchw, i64 8, !dbg !15
  %244 = load i32, ptr %243, align 4, !dbg !15
  %245 = icmp eq i32 %244, 1, !dbg !15
  br i1 %245, label %assert_end66, label %assert_fail65, !dbg !15, !prof !16

assert_fail65:                                    ; preds = %assert_end64
  %246 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %246(ptr nonnull @.str.1, ptr nonnull @.str.31), !dbg !15
  br label %common.ret, !dbg !15

assert_end66:                                     ; preds = %assert_end64
  %247 = getelementptr inbounds i8, ptr %var_conv2d_nchw, i64 12, !dbg !15
  %248 = load i32, ptr %247, align 4, !dbg !15
  %249 = icmp eq i32 %dev_id, %248, !dbg !15
  br i1 %249, label %assert_end68, label %assert_fail67, !dbg !15, !prof !16

assert_fail67:                                    ; preds = %assert_end66
  %250 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %250(ptr nonnull @.str.1, ptr nonnull @.str.32), !dbg !15
  br label %common.ret, !dbg !15

assert_end68:                                     ; preds = %assert_end66
  %251 = icmp ne ptr %conv2d_nchw, null, !dbg !15
  %252 = mul nsw i32 %CO, %N, !dbg !15
  %253 = mul nsw i32 %252, %197, !dbg !15
  %254 = mul nsw i32 %253, %204, !dbg !15
  %255 = icmp eq i32 %254, 0, !dbg !15
  %256 = or i1 %255, %251, !dbg !15
  br i1 %256, label %assert_end70, label %assert_fail69, !dbg !15, !prof !16

assert_fail69:                                    ; preds = %assert_end68
  %257 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %257(ptr nonnull @.str.1, ptr nonnull @.str.33), !dbg !15
  br label %common.ret, !dbg !15

assert_end70:                                     ; preds = %assert_end68
  %258 = tail call fastcc i32 @conv_compute_(i32 %dev_id, i32 %N, i32 %CI, i32 %H, i32 %W, ptr %A, i32 %CO, i32 %KH, i32 %KW, ptr %conv2d_nchw, ptr %W71), !dbg !15
  br label %common.ret, !dbg !15
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: noinline
define internal fastcc range(i32 -1, 1) i32 @conv_compute_(i32 %dev_id, i32 %N, i32 %CI, i32 %H, i32 %W, ptr noalias nocapture readonly align 64 %A, i32 %CO, i32 %KH, i32 %KW, ptr noalias nocapture align 64 %conv2d_nchw, ptr noalias nocapture readonly align 64 %W1) unnamed_addr #2 !dbg !150 {
entry:
    #dbg_value(i32 %dev_id, !154, !DIExpression(), !165)
    #dbg_value(i32 %N, !155, !DIExpression(), !165)
    #dbg_value(i32 %CI, !156, !DIExpression(), !165)
    #dbg_value(i32 %H, !157, !DIExpression(), !165)
    #dbg_value(i32 %W, !158, !DIExpression(), !165)
    #dbg_value(ptr %A, !159, !DIExpression(), !165)
    #dbg_value(i32 %CO, !160, !DIExpression(), !165)
    #dbg_value(i32 %KH, !161, !DIExpression(), !165)
    #dbg_value(i32 %KW, !162, !DIExpression(), !165)
    #dbg_value(ptr %conv2d_nchw, !163, !DIExpression(), !165)
    #dbg_value(ptr %W1, !164, !DIExpression(), !165)
  %0 = add i32 %W, 2, !dbg !165
  %1 = add i32 %H, 2, !dbg !165
  %2 = mul nsw i32 %CI, %N, !dbg !165
  %3 = mul nsw i32 %2, %1, !dbg !165
  %4 = mul nsw i32 %3, %0, !dbg !165
  %5 = sext i32 %4 to i64, !dbg !165
  %6 = shl nuw nsw i64 %5, 2, !dbg !165
  %7 = load ptr, ptr @__TVMBackendAllocWorkspace, align 8, !dbg !165, !tbaa !17
  %pad_temp = tail call ptr %7(i32 1, i32 %dev_id, i64 %6, i32 2, i32 32), !dbg !165
    #dbg_declare(ptr %pad_temp, !166, !DIExpression(), !165)
    #dbg_declare(ptr %pad_temp, !166, !DIExpression(), !165)
  call void @llvm.assume(i1 true) [ "align"(ptr %pad_temp, i64 64) ], !dbg !165
  %8 = icmp eq ptr %pad_temp, null, !dbg !165
  br i1 %8, label %common.ret, label %for_begin_i0.preheader, !dbg !165, !prof !16

for_begin_i0.preheader:                           ; preds = %entry
    #dbg_declare(i32 0, !167, !DIExpression(), !165)
  %9 = icmp sgt i32 %N, 0, !dbg !165
  br i1 %9, label %for_begin_i1.preheader.lr.ph, label %for_end_nn, !dbg !165, !prof !168

for_begin_i1.preheader.lr.ph:                     ; preds = %for_begin_i0.preheader
  %10 = icmp slt i32 %CI, 1
  %invariant.gep = getelementptr i8, ptr %A, i64 -4
  %11 = icmp slt i32 %W, -1
  %12 = icmp slt i32 %H, -1
  %or.cond.not196 = select i1 %10, i1 true, i1 %12
  %brmerge = select i1 %or.cond.not196, i1 true, i1 %11
  br i1 %brmerge, label %for_begin_ff.preheader.lr.ph, label %for_begin_i1.preheader.us.us.us.preheader, !prof !169

for_begin_i1.preheader.us.us.us.preheader:        ; preds = %for_begin_i1.preheader.lr.ph
  %13 = mul i32 %0, %CI
  %14 = mul i32 %13, %1
  %15 = mul i32 %0, %1
  %smax = tail call i32 @llvm.smax.i32(i32 %0, i32 1), !dbg !165
  %16 = zext nneg i32 %smax to i64, !dbg !165
  %17 = shl nuw nsw i64 %16, 2, !dbg !165
  %18 = sext i32 %W to i64, !dbg !165
  %19 = sext i32 %H to i64, !dbg !165
  %20 = sext i32 %0 to i64, !dbg !165
  %smax121 = tail call i32 @llvm.smax.i32(i32 %1, i32 1), !dbg !165
  %21 = sext i32 %1 to i64, !dbg !165
  %22 = zext nneg i32 %CI to i64, !dbg !165
  %wide.trip.count132 = zext nneg i32 %N to i64, !dbg !165
  %wide.trip.count127 = zext nneg i32 %CI to i64
  %wide.trip.count122 = zext nneg i32 %smax121 to i64
  %exitcond.peel.not = icmp ugt i32 %W, 2147483645
  %23 = add nsw i64 %16, -1, !dbg !165
  %xtraiter = and i64 %23, 1
  %24 = icmp eq i32 %W, 0
  %unroll_iter = and i64 %23, -2
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br label %for_begin_i1.preheader.us.us.us, !dbg !165

for_begin_i1.preheader.us.us.us:                  ; preds = %for_begin_i1.preheader.us.us.us.preheader, %for_begin_i1.for_end_i1_crit_edge.split.us.split.us.us.us.us
  %indvars.iv129 = phi i64 [ 0, %for_begin_i1.preheader.us.us.us.preheader ], [ %indvars.iv.next130, %for_begin_i1.for_end_i1_crit_edge.split.us.split.us.us.us.us ]
  %25 = trunc nuw nsw i64 %indvars.iv129 to i32
  %26 = mul i32 %14, %25
    #dbg_declare(i64 %indvars.iv129, !167, !DIExpression(), !165)
    #dbg_declare(i32 0, !170, !DIExpression(), !165)
  %27 = mul nuw nsw i64 %indvars.iv129, %22
  br label %for_begin_i2.preheader.us.us.us.us.us, !dbg !165

for_begin_i2.preheader.us.us.us.us.us:            ; preds = %for_begin_i2.for_end_i2_crit_edge.split.us.us.us.us.us.us, %for_begin_i1.preheader.us.us.us
  %indvars.iv124 = phi i64 [ %indvars.iv.next125, %for_begin_i2.for_end_i2_crit_edge.split.us.us.us.us.us.us ], [ 0, %for_begin_i1.preheader.us.us.us ]
  %28 = trunc nuw nsw i64 %indvars.iv124 to i32
  %29 = mul i32 %15, %28
  %30 = add i32 %26, %29
    #dbg_declare(i64 %indvars.iv124, !170, !DIExpression(), !165)
    #dbg_declare(i32 0, !171, !DIExpression(), !165)
  %31 = add nuw nsw i64 %indvars.iv124, %27
  %32 = trunc i64 %31 to i32
  %33 = mul i32 %32, %H
  %34 = add i32 %33, -1
  %35 = mul nsw i64 %31, %21
  br label %for_begin_i3.preheader.us.us.us.us.us.us, !dbg !165

for_begin_i3.preheader.us.us.us.us.us.us:         ; preds = %for_begin_i3.for_end_i3_crit_edge.us.us.us.us.us.us, %for_begin_i2.preheader.us.us.us.us.us
  %indvars.iv118 = phi i64 [ %indvars.iv.next119, %for_begin_i3.for_end_i3_crit_edge.us.us.us.us.us.us ], [ 0, %for_begin_i2.preheader.us.us.us.us.us ]
  %36 = trunc nuw nsw i64 %indvars.iv118 to i32
    #dbg_declare(i64 %indvars.iv118, !171, !DIExpression(), !165)
    #dbg_declare(i32 0, !172, !DIExpression(), !165)
  %37 = icmp sle i64 %indvars.iv118, %19
  %38 = icmp ne i64 %indvars.iv118, 0
  %39 = and i1 %38, %37
  %40 = add nsw i64 %indvars.iv118, %35
  %41 = mul nsw i64 %40, %20
  %.fr.us.us.us.us.us.us = freeze i1 %39
  br i1 %.fr.us.us.us.us.us.us, label %if_end3.us.us.us.us.us.us.peel, label %for_body_i3.us.us.us.us.us.us.us.preheader

for_body_i3.us.us.us.us.us.us.us.preheader:       ; preds = %for_begin_i3.preheader.us.us.us.us.us.us
  %42 = mul i32 %0, %36
  %43 = add i32 %30, %42
  %44 = sext i32 %43 to i64
  %45 = shl nsw i64 %44, 2
  %scevgep = getelementptr i8, ptr %pad_temp, i64 %45
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(1) %scevgep, i8 0, i64 %17, i1 false), !dbg !165, !tbaa !173
    #dbg_declare(i64 poison, !172, !DIExpression(), !165)
  br label %for_begin_i3.for_end_i3_crit_edge.us.us.us.us.us.us, !dbg !165

if_end3.us.us.us.us.us.us.peel:                   ; preds = %for_begin_i3.preheader.us.us.us.us.us.us
    #dbg_declare(i64 0, !172, !DIExpression(), !165)
  %46 = getelementptr inbounds float, ptr %pad_temp, i64 %41, !dbg !165
  store float 0.000000e+00, ptr %46, align 4, !dbg !165, !tbaa !173
    #dbg_declare(i64 1, !172, !DIExpression(), !165)
  br i1 %exitcond.peel.not, label %for_begin_i3.for_end_i3_crit_edge.us.us.us.us.us.us, label %for_body_i3.us13.us.us.us.us.us.peel.next, !dbg !165, !prof !175

for_body_i3.us13.us.us.us.us.us.peel.next:        ; preds = %if_end3.us.us.us.us.us.us.peel
  %47 = add i32 %34, %36
  %48 = mul nsw i32 %47, %W
  %49 = sext i32 %48 to i64, !dbg !165
  %invariant.gep171 = getelementptr float, ptr %invariant.gep, i64 %49, !dbg !165
  %invariant.gep172 = getelementptr float, ptr %pad_temp, i64 %41, !dbg !165
  br i1 %24, label %for_begin_i3.for_end_i3_crit_edge.us.us.us.us.us.us.loopexit.unr-lcssa, label %for_body_i3.us13.us.us.us.us.us, !dbg !165, !prof !176

for_body_i3.us13.us.us.us.us.us:                  ; preds = %for_body_i3.us13.us.us.us.us.us.peel.next, %if_end3.us.us.us.us.us.us.1
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %if_end3.us.us.us.us.us.us.1 ], [ 1, %for_body_i3.us13.us.us.us.us.us.peel.next ]
  %niter = phi i64 [ %niter.next.1, %if_end3.us.us.us.us.us.us.1 ], [ 0, %for_body_i3.us13.us.us.us.us.us.peel.next ]
    #dbg_declare(i64 %indvars.iv, !172, !DIExpression(), !165)
  %.not169 = icmp sgt i64 %indvars.iv, %18, !dbg !165
  br i1 %.not169, label %if_end3.us.us.us.us.us.us, label %if_then2.us.us.us.us.us.us, !dbg !165

if_then2.us.us.us.us.us.us:                       ; preds = %for_body_i3.us13.us.us.us.us.us
  %gep = getelementptr float, ptr %invariant.gep171, i64 %indvars.iv, !dbg !165
  %50 = load float, ptr %gep, align 4, !dbg !165, !tbaa !177
  br label %if_end3.us.us.us.us.us.us, !dbg !165

if_end3.us.us.us.us.us.us:                        ; preds = %if_then2.us.us.us.us.us.us, %for_body_i3.us13.us.us.us.us.us
  %51 = phi float [ %50, %if_then2.us.us.us.us.us.us ], [ 0.000000e+00, %for_body_i3.us13.us.us.us.us.us ], !dbg !165
  %gep173 = getelementptr float, ptr %invariant.gep172, i64 %indvars.iv, !dbg !165
  store float %51, ptr %gep173, align 4, !dbg !165, !tbaa !173
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !165
    #dbg_declare(i64 %indvars.iv.next, !172, !DIExpression(), !165)
    #dbg_declare(i64 %indvars.iv.next, !172, !DIExpression(), !165)
  %.not169.1.not = icmp slt i64 %indvars.iv, %18, !dbg !165
  br i1 %.not169.1.not, label %if_then2.us.us.us.us.us.us.1, label %if_end3.us.us.us.us.us.us.1, !dbg !165

if_then2.us.us.us.us.us.us.1:                     ; preds = %if_end3.us.us.us.us.us.us
  %gep.1 = getelementptr float, ptr %invariant.gep171, i64 %indvars.iv.next, !dbg !165
  %52 = load float, ptr %gep.1, align 4, !dbg !165, !tbaa !177
  br label %if_end3.us.us.us.us.us.us.1, !dbg !165

if_end3.us.us.us.us.us.us.1:                      ; preds = %if_then2.us.us.us.us.us.us.1, %if_end3.us.us.us.us.us.us
  %53 = phi float [ %52, %if_then2.us.us.us.us.us.us.1 ], [ 0.000000e+00, %if_end3.us.us.us.us.us.us ], !dbg !165
  %gep173.1 = getelementptr float, ptr %invariant.gep172, i64 %indvars.iv.next, !dbg !165
  store float %53, ptr %gep173.1, align 4, !dbg !165, !tbaa !173
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2, !dbg !165
    #dbg_declare(i64 %indvars.iv.next.1, !172, !DIExpression(), !165)
  %niter.next.1 = add i64 %niter, 2, !dbg !165
  %niter.ncmp.1 = icmp eq i64 %niter.next.1, %unroll_iter, !dbg !165
  br i1 %niter.ncmp.1, label %for_begin_i3.for_end_i3_crit_edge.us.us.us.us.us.us.loopexit.unr-lcssa, label %for_body_i3.us13.us.us.us.us.us, !dbg !165, !prof !179, !llvm.loop !180

for_begin_i3.for_end_i3_crit_edge.us.us.us.us.us.us.loopexit.unr-lcssa: ; preds = %if_end3.us.us.us.us.us.us.1, %for_body_i3.us13.us.us.us.us.us.peel.next
  %indvars.iv.unr = phi i64 [ 1, %for_body_i3.us13.us.us.us.us.us.peel.next ], [ %indvars.iv.next.1, %if_end3.us.us.us.us.us.us.1 ]
  br i1 %lcmp.mod.not, label %for_begin_i3.for_end_i3_crit_edge.us.us.us.us.us.us, label %for_body_i3.us13.us.us.us.us.us.epil, !dbg !165, !prof !182

for_body_i3.us13.us.us.us.us.us.epil:             ; preds = %for_begin_i3.for_end_i3_crit_edge.us.us.us.us.us.us.loopexit.unr-lcssa
    #dbg_declare(i64 %indvars.iv.unr, !172, !DIExpression(), !165)
  %.not169.epil = icmp sgt i64 %indvars.iv.unr, %18, !dbg !165
  br i1 %.not169.epil, label %if_end3.us.us.us.us.us.us.epil, label %if_then2.us.us.us.us.us.us.epil, !dbg !165

if_then2.us.us.us.us.us.us.epil:                  ; preds = %for_body_i3.us13.us.us.us.us.us.epil
  %gep.epil = getelementptr float, ptr %invariant.gep171, i64 %indvars.iv.unr, !dbg !165
  %54 = load float, ptr %gep.epil, align 4, !dbg !165, !tbaa !177
  br label %if_end3.us.us.us.us.us.us.epil, !dbg !165

if_end3.us.us.us.us.us.us.epil:                   ; preds = %if_then2.us.us.us.us.us.us.epil, %for_body_i3.us13.us.us.us.us.us.epil
  %55 = phi float [ %54, %if_then2.us.us.us.us.us.us.epil ], [ 0.000000e+00, %for_body_i3.us13.us.us.us.us.us.epil ], !dbg !165
  %gep173.epil = getelementptr float, ptr %invariant.gep172, i64 %indvars.iv.unr, !dbg !165
  store float %55, ptr %gep173.epil, align 4, !dbg !165, !tbaa !173
    #dbg_declare(i64 %indvars.iv.unr, !172, !DIExpression(DW_OP_plus_uconst, 1), !165)
  br label %for_begin_i3.for_end_i3_crit_edge.us.us.us.us.us.us, !dbg !165

for_begin_i3.for_end_i3_crit_edge.us.us.us.us.us.us: ; preds = %if_end3.us.us.us.us.us.us.epil, %for_begin_i3.for_end_i3_crit_edge.us.us.us.us.us.us.loopexit.unr-lcssa, %if_end3.us.us.us.us.us.us.peel, %for_body_i3.us.us.us.us.us.us.us.preheader
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1, !dbg !165
    #dbg_declare(i64 %indvars.iv.next119, !171, !DIExpression(), !165)
  %exitcond123.not = icmp eq i64 %indvars.iv.next119, %wide.trip.count122, !dbg !165
  br i1 %exitcond123.not, label %for_begin_i2.for_end_i2_crit_edge.split.us.us.us.us.us.us, label %for_begin_i3.preheader.us.us.us.us.us.us, !dbg !165, !prof !175

for_begin_i2.for_end_i2_crit_edge.split.us.us.us.us.us.us: ; preds = %for_begin_i3.for_end_i3_crit_edge.us.us.us.us.us.us
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1, !dbg !165
    #dbg_declare(i64 %indvars.iv.next125, !170, !DIExpression(), !165)
  %exitcond128.not = icmp eq i64 %indvars.iv.next125, %wide.trip.count127, !dbg !165
  br i1 %exitcond128.not, label %for_begin_i1.for_end_i1_crit_edge.split.us.split.us.us.us.us, label %for_begin_i2.preheader.us.us.us.us.us, !dbg !165, !prof !175

for_begin_i1.for_end_i1_crit_edge.split.us.split.us.us.us.us: ; preds = %for_begin_i2.for_end_i2_crit_edge.split.us.us.us.us.us.us
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1, !dbg !165
    #dbg_declare(i64 %indvars.iv.next130, !167, !DIExpression(), !165)
  %exitcond133.not = icmp eq i64 %indvars.iv.next130, %wide.trip.count132, !dbg !165
  br i1 %exitcond133.not, label %for_begin_nn.preheader, label %for_begin_i1.preheader.us.us.us, !dbg !165, !prof !175

common.ret:                                       ; preds = %for_end_nn, %entry
  %common.ret.op = phi i32 [ -1, %entry ], [ %., %for_end_nn ]
  ret i32 %common.ret.op, !dbg !165

for_begin_nn.preheader:                           ; preds = %for_begin_i1.for_end_i1_crit_edge.split.us.split.us.us.us.us
    #dbg_declare(i32 0, !183, !DIExpression(), !165)
  br i1 %9, label %for_begin_ff.preheader.lr.ph, label %for_end_nn, !dbg !165, !prof !184

for_begin_ff.preheader.lr.ph:                     ; preds = %for_begin_i1.preheader.lr.ph, %for_begin_nn.preheader
  %56 = icmp slt i32 %CO, 1
  %57 = add i32 %H, 3
  %58 = sub i32 %57, %KH
  %59 = add i32 %W, 3
  %60 = sub i32 %59, %KW
  %61 = icmp slt i32 %60, 1
  %62 = icmp slt i32 %CI, 1
  %63 = icmp slt i32 %KH, 1
  %64 = icmp slt i32 %KW, 1
  %65 = icmp slt i32 %58, 1
  %or.cond184.not199 = select i1 %56, i1 true, i1 %65
  %brmerge186 = select i1 %or.cond184.not199, i1 true, i1 %61
  %brmerge188 = select i1 %brmerge186, i1 true, i1 %62
  %brmerge190 = select i1 %brmerge188, i1 true, i1 %63
  %brmerge192 = select i1 %brmerge190, i1 true, i1 %64
  br i1 %brmerge192, label %for_end_nn, label %for_begin_ff.preheader.us.us.us.us.us.us.preheader, !prof !185

for_begin_ff.preheader.us.us.us.us.us.us.preheader: ; preds = %for_begin_ff.preheader.lr.ph
  %66 = sext i32 %0 to i64, !dbg !165
  %67 = zext nneg i32 %KW to i64, !dbg !165
  %68 = sext i32 %1 to i64, !dbg !165
  %69 = zext nneg i32 %KH to i64, !dbg !165
  %70 = zext nneg i32 %60 to i64, !dbg !165
  %71 = zext nneg i32 %58 to i64, !dbg !165
  %72 = zext nneg i32 %CI to i64, !dbg !165
  %73 = zext nneg i32 %CO to i64, !dbg !165
  %wide.trip.count167 = zext nneg i32 %N to i64, !dbg !165
  %wide.trip.count162 = zext nneg i32 %CO to i64
  %wide.trip.count157 = zext nneg i32 %58 to i64
  %wide.trip.count152 = zext nneg i32 %60 to i64
  %wide.trip.count147 = zext nneg i32 %CI to i64
  %wide.trip.count142 = zext nneg i32 %KH to i64
  %wide.trip.count137 = zext nneg i32 %KW to i64
  %xtraiter200 = and i64 %wide.trip.count137, 1
  %74 = icmp eq i32 %KW, 1
  %unroll_iter203 = and i64 %wide.trip.count137, 2147483646
  %lcmp.mod201.not = icmp eq i64 %xtraiter200, 0
  br label %for_begin_ff.preheader.us.us.us.us.us.us, !dbg !165

for_begin_ff.preheader.us.us.us.us.us.us:         ; preds = %for_begin_ff.preheader.us.us.us.us.us.us.preheader, %for_begin_ff.for_end_ff_crit_edge.split.us.split.us.split.us.split.us.split.us.us.us.us.us.us.us
  %indvars.iv164 = phi i64 [ 0, %for_begin_ff.preheader.us.us.us.us.us.us.preheader ], [ %indvars.iv.next165, %for_begin_ff.for_end_ff_crit_edge.split.us.split.us.split.us.split.us.split.us.us.us.us.us.us.us ]
    #dbg_declare(i64 %indvars.iv164, !183, !DIExpression(), !165)
    #dbg_declare(i32 0, !186, !DIExpression(), !165)
  %75 = mul nuw nsw i64 %indvars.iv164, %73
  %76 = mul nuw nsw i64 %indvars.iv164, %72
  br label %for_body_ff.us.us.us.us.us.us.us.us.us.us.us, !dbg !165

for_body_ff.us.us.us.us.us.us.us.us.us.us.us:     ; preds = %for_begin_yy.for_end_yy_crit_edge.split.us.split.us.split.us.split.us.us.us.us.us.us.us.us.us.us.us.us, %for_begin_ff.preheader.us.us.us.us.us.us
  %indvars.iv159 = phi i64 [ %indvars.iv.next160, %for_begin_yy.for_end_yy_crit_edge.split.us.split.us.split.us.split.us.us.us.us.us.us.us.us.us.us.us.us ], [ 0, %for_begin_ff.preheader.us.us.us.us.us.us ]
    #dbg_declare(i64 %indvars.iv159, !186, !DIExpression(), !165)
    #dbg_declare(i32 0, !187, !DIExpression(), !165)
  %77 = add nuw nsw i64 %indvars.iv159, %75
  %78 = mul nuw nsw i64 %77, %71
  %79 = mul nuw nsw i64 %indvars.iv159, %72
  br label %for_body_yy.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, !dbg !165

for_body_yy.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us: ; preds = %for_begin_xx.for_end_xx_crit_edge.split.us.split.us.split.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, %for_body_ff.us.us.us.us.us.us.us.us.us.us.us
  %indvars.iv154 = phi i64 [ %indvars.iv.next155, %for_begin_xx.for_end_xx_crit_edge.split.us.split.us.split.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us ], [ 0, %for_body_ff.us.us.us.us.us.us.us.us.us.us.us ]
    #dbg_declare(i64 %indvars.iv154, !187, !DIExpression(), !165)
    #dbg_declare(i32 0, !188, !DIExpression(), !165)
  %80 = add nuw nsw i64 %indvars.iv154, %78
  %81 = mul nuw nsw i64 %80, %70
  %invariant.gep181 = getelementptr inbounds float, ptr %conv2d_nchw, i64 %81, !dbg !165
  br label %for_begin_rc.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, !dbg !165

for_begin_rc.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us: ; preds = %for_begin_rc.for_end_rc_crit_edge.split.us.split.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, %for_body_yy.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us
  %indvars.iv149 = phi i64 [ %indvars.iv.next150, %for_begin_rc.for_end_rc_crit_edge.split.us.split.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us ], [ 0, %for_body_yy.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us ]
    #dbg_declare(i64 %indvars.iv149, !188, !DIExpression(), !165)
    #dbg_declare(i32 0, !189, !DIExpression(), !165)
  %gep182 = getelementptr inbounds float, ptr %invariant.gep181, i64 %indvars.iv149
  %invariant.gep176 = getelementptr float, ptr %pad_temp, i64 %indvars.iv149
  %.promoted = load float, ptr %gep182, align 4, !tbaa !190
  br label %for_begin_ry.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, !dbg !165

for_begin_ry.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us: ; preds = %for_begin_ry.for_end_ry_crit_edge.split.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, %for_begin_rc.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us
  %.lcssa.lcssa180 = phi float [ %.lcssa, %for_begin_ry.for_end_ry_crit_edge.split.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us ], [ %.promoted, %for_begin_rc.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us ]
  %indvars.iv144 = phi i64 [ %indvars.iv.next145, %for_begin_ry.for_end_ry_crit_edge.split.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us ], [ 0, %for_begin_rc.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us ]
    #dbg_declare(i64 %indvars.iv144, !189, !DIExpression(), !165)
    #dbg_declare(i32 0, !192, !DIExpression(), !165)
  %82 = add nuw nsw i64 %indvars.iv144, %76
  %83 = mul nsw i64 %82, %68
  %84 = add nsw i64 %83, %indvars.iv154
  %85 = add nuw nsw i64 %indvars.iv144, %79
  %86 = mul nuw nsw i64 %85, %69
  br label %for_begin_rx.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, !dbg !165

for_begin_rx.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us: ; preds = %for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, %for_begin_ry.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us
  %.lcssa179 = phi float [ %.lcssa, %for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us ], [ %.lcssa.lcssa180, %for_begin_ry.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us ]
  %indvars.iv139 = phi i64 [ %indvars.iv.next140, %for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us ], [ 0, %for_begin_ry.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us ]
    #dbg_declare(i64 %indvars.iv139, !192, !DIExpression(), !165)
    #dbg_declare(i32 0, !193, !DIExpression(), !165)
  %87 = or i64 %indvars.iv139, %indvars.iv144
  %88 = add nsw i64 %84, %indvars.iv139
  %89 = mul nsw i64 %88, %66
  %90 = add nuw nsw i64 %indvars.iv139, %86
  %91 = mul nuw nsw i64 %90, %67
  %gep177 = getelementptr float, ptr %invariant.gep176, i64 %89
  %invariant.gep174 = getelementptr inbounds float, ptr %W1, i64 %91, !dbg !165
  br i1 %74, label %for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.unr-lcssa, label %for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, !dbg !165, !prof !176

for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us: ; preds = %for_begin_rx.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, %for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us
  %92 = phi float [ %103, %for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us ], [ %.lcssa179, %for_begin_rx.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us ]
  %indvars.iv134 = phi i64 [ %indvars.iv.next135.1, %for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us ], [ 0, %for_begin_rx.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us ]
  %niter204 = phi i64 [ %niter204.next.1, %for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us ], [ 0, %for_begin_rx.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us ]
    #dbg_declare(i64 %indvars.iv134, !193, !DIExpression(), !165)
  %93 = or i64 %87, %indvars.iv134, !dbg !165
  %94 = and i64 %93, 4294967295, !dbg !165
  %95 = icmp eq i64 %94, 0, !dbg !165
  %.193 = select i1 %95, float 0.000000e+00, float %92, !dbg !165, !prof !16
  %96 = getelementptr float, ptr %gep177, i64 %indvars.iv134, !dbg !165
  %97 = load float, ptr %96, align 4, !dbg !165, !tbaa !173
  %gep175 = getelementptr inbounds float, ptr %invariant.gep174, i64 %indvars.iv134, !dbg !165
  %98 = load float, ptr %gep175, align 4, !dbg !165, !tbaa !194
  %99 = tail call float @llvm.fmuladd.f32(float %97, float %98, float %.193), !dbg !165
  %indvars.iv.next135 = or disjoint i64 %indvars.iv134, 1, !dbg !165
    #dbg_declare(i64 %indvars.iv.next135, !193, !DIExpression(), !165)
    #dbg_declare(i64 %indvars.iv.next135, !193, !DIExpression(), !165)
  %100 = getelementptr float, ptr %gep177, i64 %indvars.iv.next135, !dbg !165
  %101 = load float, ptr %100, align 4, !dbg !165, !tbaa !173
  %gep175.1 = getelementptr inbounds float, ptr %invariant.gep174, i64 %indvars.iv.next135, !dbg !165
  %102 = load float, ptr %gep175.1, align 4, !dbg !165, !tbaa !194
  %103 = tail call float @llvm.fmuladd.f32(float %101, float %102, float %99), !dbg !165
  %indvars.iv.next135.1 = add nuw nsw i64 %indvars.iv134, 2, !dbg !165
    #dbg_declare(i64 %indvars.iv.next135.1, !193, !DIExpression(), !165)
  %niter204.next.1 = add i64 %niter204, 2, !dbg !165
  %niter204.ncmp.1 = icmp eq i64 %niter204.next.1, %unroll_iter203, !dbg !165
  br i1 %niter204.ncmp.1, label %for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.unr-lcssa, label %for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, !dbg !165, !prof !179

for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.unr-lcssa: ; preds = %for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, %for_begin_rx.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us
  %.lcssa.ph = phi float [ poison, %for_begin_rx.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us ], [ %103, %for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us ]
  %.unr = phi float [ %.lcssa179, %for_begin_rx.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us ], [ %103, %for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us ]
  %indvars.iv134.unr = phi i64 [ 0, %for_begin_rx.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us ], [ %indvars.iv.next135.1, %for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us ]
  br i1 %lcmp.mod201.not, label %for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, label %for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.epil, !dbg !165, !prof !182

for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.epil: ; preds = %for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.unr-lcssa
    #dbg_declare(i64 %indvars.iv134.unr, !193, !DIExpression(), !165)
  %104 = or i64 %87, %indvars.iv134.unr, !dbg !165
  %105 = and i64 %104, 4294967295, !dbg !165
  %106 = icmp eq i64 %105, 0, !dbg !165
  %.193.epil = select i1 %106, float 0.000000e+00, float %.unr, !dbg !165, !prof !16
  %107 = getelementptr float, ptr %gep177, i64 %indvars.iv134.unr, !dbg !165
  %108 = load float, ptr %107, align 4, !dbg !165, !tbaa !173
  %gep175.epil = getelementptr inbounds float, ptr %invariant.gep174, i64 %indvars.iv134.unr, !dbg !165
  %109 = load float, ptr %gep175.epil, align 4, !dbg !165, !tbaa !194
  %110 = tail call float @llvm.fmuladd.f32(float %108, float %109, float %.193.epil), !dbg !165
    #dbg_declare(i64 %indvars.iv134.unr, !193, !DIExpression(DW_OP_plus_uconst, 1), !165)
  br label %for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, !dbg !165

for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us: ; preds = %for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.unr-lcssa, %for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.epil
  %.lcssa = phi float [ %.lcssa.ph, %for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.unr-lcssa ], [ %110, %for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.epil ], !dbg !165
  %indvars.iv.next140 = add nuw nsw i64 %indvars.iv139, 1, !dbg !165
    #dbg_declare(i64 %indvars.iv.next140, !192, !DIExpression(), !165)
  %exitcond143.not = icmp eq i64 %indvars.iv.next140, %wide.trip.count142, !dbg !165
  br i1 %exitcond143.not, label %for_begin_ry.for_end_ry_crit_edge.split.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, label %for_begin_rx.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, !dbg !165, !prof !175

for_begin_ry.for_end_ry_crit_edge.split.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us: ; preds = %for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1, !dbg !165
    #dbg_declare(i64 %indvars.iv.next145, !189, !DIExpression(), !165)
  %exitcond148.not = icmp eq i64 %indvars.iv.next145, %wide.trip.count147, !dbg !165
  br i1 %exitcond148.not, label %for_begin_rc.for_end_rc_crit_edge.split.us.split.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, label %for_begin_ry.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, !dbg !165, !prof !175

for_begin_rc.for_end_rc_crit_edge.split.us.split.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us: ; preds = %for_begin_ry.for_end_ry_crit_edge.split.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us
  store float %.lcssa, ptr %gep182, align 4, !tbaa !190
  %indvars.iv.next150 = add nuw nsw i64 %indvars.iv149, 1, !dbg !165
    #dbg_declare(i64 %indvars.iv.next150, !188, !DIExpression(), !165)
  %exitcond153.not = icmp eq i64 %indvars.iv.next150, %wide.trip.count152, !dbg !165
  br i1 %exitcond153.not, label %for_begin_xx.for_end_xx_crit_edge.split.us.split.us.split.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, label %for_begin_rc.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, !dbg !165, !prof !175

for_begin_xx.for_end_xx_crit_edge.split.us.split.us.split.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us: ; preds = %for_begin_rc.for_end_rc_crit_edge.split.us.split.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us
  %indvars.iv.next155 = add nuw nsw i64 %indvars.iv154, 1, !dbg !165
    #dbg_declare(i64 %indvars.iv.next155, !187, !DIExpression(), !165)
  %exitcond158.not = icmp eq i64 %indvars.iv.next155, %wide.trip.count157, !dbg !165
  br i1 %exitcond158.not, label %for_begin_yy.for_end_yy_crit_edge.split.us.split.us.split.us.split.us.us.us.us.us.us.us.us.us.us.us.us, label %for_body_yy.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, !dbg !165, !prof !175

for_begin_yy.for_end_yy_crit_edge.split.us.split.us.split.us.split.us.us.us.us.us.us.us.us.us.us.us.us: ; preds = %for_begin_xx.for_end_xx_crit_edge.split.us.split.us.split.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us
  %indvars.iv.next160 = add nuw nsw i64 %indvars.iv159, 1, !dbg !165
    #dbg_declare(i64 %indvars.iv.next160, !186, !DIExpression(), !165)
  %exitcond163.not = icmp eq i64 %indvars.iv.next160, %wide.trip.count162, !dbg !165
  br i1 %exitcond163.not, label %for_begin_ff.for_end_ff_crit_edge.split.us.split.us.split.us.split.us.split.us.us.us.us.us.us.us, label %for_body_ff.us.us.us.us.us.us.us.us.us.us.us, !dbg !165, !prof !175

for_begin_ff.for_end_ff_crit_edge.split.us.split.us.split.us.split.us.split.us.us.us.us.us.us.us: ; preds = %for_begin_yy.for_end_yy_crit_edge.split.us.split.us.split.us.split.us.us.us.us.us.us.us.us.us.us.us.us
  %indvars.iv.next165 = add nuw nsw i64 %indvars.iv164, 1, !dbg !165
    #dbg_declare(i64 %indvars.iv.next165, !183, !DIExpression(), !165)
  %exitcond168.not = icmp eq i64 %indvars.iv.next165, %wide.trip.count167, !dbg !165
  br i1 %exitcond168.not, label %for_end_nn, label %for_begin_ff.preheader.us.us.us.us.us.us, !dbg !165, !prof !175

for_end_nn:                                       ; preds = %for_begin_ff.for_end_ff_crit_edge.split.us.split.us.split.us.split.us.split.us.us.us.us.us.us.us, %for_begin_ff.preheader.lr.ph, %for_begin_i0.preheader, %for_begin_nn.preheader
  %111 = load ptr, ptr @__TVMBackendFreeWorkspace, align 8, !dbg !165, !tbaa !17
  %112 = tail call i32 %111(i32 1, i32 %dev_id, ptr nonnull %pad_temp), !dbg !165
  %.not = icmp ne i32 %112, 0, !dbg !165
  %. = sext i1 %.not to i32, !dbg !165
  br label %common.ret, !dbg !165
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #3

; Function Attrs: nofree nosync nounwind memory(none)
define weak dso_local half @__truncsfhf2(float %a0) local_unnamed_addr #4 section ".text.tvm.fp16.conv" {
b0:
  %v0 = bitcast float %a0 to i32
  %0 = tail call float @llvm.fabs.f32(float %a0)
  %v1 = bitcast float %0 to i32
  %v2 = add nsw i32 %v1, -947912704
  %v3 = add nsw i32 %v1, -1199570944
  %v4 = icmp ult i32 %v2, %v3
  br i1 %v4, label %b1, label %b5

b1:                                               ; preds = %b0
  %v5 = lshr i32 %v0, 13
  %v7 = add nsw i32 %v5, -114688
  %v8 = and i32 %v0, 8191
  %v9 = icmp ugt i32 %v8, 4096
  br i1 %v9, label %b2, label %b3

b2:                                               ; preds = %b1
  %v10 = add nsw i32 %v5, -114687
  br label %b13

b3:                                               ; preds = %b1
  %v11 = icmp eq i32 %v8, 4096
  br i1 %v11, label %b4, label %b13

b4:                                               ; preds = %b3
  %v13 = and i32 %v5, 1
  %v14 = add nsw i32 %v7, %v13
  br label %b13

b5:                                               ; preds = %b0
  %v15 = icmp ugt i32 %v1, 2139095040
  br i1 %v15, label %b6, label %b7

b6:                                               ; preds = %b5
  %v16 = lshr i32 %v0, 13
  %v17 = and i32 %v16, 511
  %v18 = or disjoint i32 %v17, 32256
  br label %b13

b7:                                               ; preds = %b5
  %v19 = icmp ugt i32 %v1, 1199570943
  br i1 %v19, label %b13, label %b8

b8:                                               ; preds = %b7
  %v20 = icmp ult i32 %v1, 754974720
  br i1 %v20, label %b13, label %b9

b9:                                               ; preds = %b8
  %v21 = lshr i32 %v1, 23
  %v22 = sub nsw i32 113, %v21
  %v23 = and i32 %v0, 8388607
  %v24 = or disjoint i32 %v23, 8388608
  %v25 = add nsw i32 %v21, -81
  %v26 = shl i32 %v24, %v25
  %v27 = icmp ne i32 %v26, 0
  %v28 = lshr i32 %v24, %v22
  %v29 = zext i1 %v27 to i32
  %v30 = lshr i32 %v28, 13
  %v31 = and i32 %v28, 8191
  %v32 = or i32 %v31, %v29
  %v33 = icmp ugt i32 %v32, 4096
  br i1 %v33, label %b10, label %b11

b10:                                              ; preds = %b9
  %v34 = add nuw nsw i32 %v30, 1
  br label %b13

b11:                                              ; preds = %b9
  %v35 = icmp eq i32 %v32, 4096
  br i1 %v35, label %b12, label %b13

b12:                                              ; preds = %b11
  %v36 = and i32 %v30, 1
  %v37 = add nuw nsw i32 %v36, %v30
  br label %b13

b13:                                              ; preds = %b12, %b11, %b10, %b8, %b7, %b6, %b4, %b3, %b2
  %v38 = phi i32 [ %v18, %b6 ], [ %v10, %b2 ], [ %v14, %b4 ], [ %v7, %b3 ], [ 31744, %b7 ], [ 0, %b8 ], [ %v34, %b10 ], [ %v37, %b12 ], [ %v30, %b11 ]
  %v39 = lshr i32 %v0, 16
  %v40 = and i32 %v39, 32768
  %v41 = or i32 %v38, %v40
  %vlast = trunc i32 %v41 to i16
  %vres = bitcast i16 %vlast to half
  ret half %vres
}

; Function Attrs: nofree nosync nounwind memory(none)
define weak dso_local float @__extendhfsf2(half %a0) local_unnamed_addr #4 section ".text.tvm.fp16.conv" {
b0:
  %0 = tail call half @llvm.fabs.f16(half %a0)
  %v1 = bitcast half %0 to i16
  %v2 = zext nneg i16 %v1 to i32
  %v3 = add nsw i16 %v1, -1024
  %v4 = icmp ult i16 %v3, 30720
  br i1 %v4, label %b1, label %b2

b1:                                               ; preds = %b0
  %v5 = shl nuw nsw i32 %v2, 13
  %v6 = add nuw nsw i32 %v5, 939524096
  br label %b6

b2:                                               ; preds = %b0
  %v7 = icmp ugt i16 %v1, 31743
  br i1 %v7, label %b3, label %b4

b3:                                               ; preds = %b2
  %v8 = shl nuw nsw i32 %v2, 13
  %v9 = or i32 %v8, 2139095040
  br label %b6

b4:                                               ; preds = %b2
  %v10 = icmp eq i16 %v1, 0
  br i1 %v10, label %b6, label %b5

b5:                                               ; preds = %b4
  %v11 = icmp ult i16 %v1, 256
  %v12 = lshr i32 %v2, 8
  %v13 = select i1 %v11, i32 %v2, i32 %v12
  %v14 = select i1 %v11, i32 32, i32 24
  %v15 = icmp ult i32 %v13, 16
  %v16 = lshr i32 %v13, 4
  %v17 = add nsw i32 %v14, -4
  %v18 = select i1 %v15, i32 %v13, i32 %v16
  %v19 = select i1 %v15, i32 %v14, i32 %v17
  %v20 = icmp ult i32 %v18, 4
  %v21 = lshr i32 %v18, 2
  %v22 = add nsw i32 %v19, -2
  %v23 = select i1 %v20, i32 %v18, i32 %v21
  %v24 = select i1 %v20, i32 %v19, i32 %v22
  %v25 = icmp ult i32 %v23, 2
  %v26 = sub nsw i32 0, %v23
  %v27 = select i1 %v25, i32 %v26, i32 -2
  %v28 = add nsw i32 %v27, %v24
  %v29 = add nsw i32 %v28, -8
  %v30 = shl i32 %v2, %v29
  %v31 = xor i32 %v30, 8388608
  %v32 = shl i32 %v28, 23
  %v33 = sub i32 1124073472, %v32
  %v34 = or i32 %v31, %v33
  br label %b6

b6:                                               ; preds = %b5, %b4, %b3, %b1
  %v35 = phi i32 [ %v6, %b1 ], [ %v9, %b3 ], [ %v34, %b5 ], [ 0, %b4 ]
  %vinp = bitcast half %a0 to i16
  %v36 = and i16 %vinp, -32768
  %v37 = zext i16 %v36 to i32
  %v38 = shl nuw i32 %v37, 16
  %v39 = or i32 %v35, %v38
  %v40 = bitcast i32 %v39 to float
  ret float %v40
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fabs.f32(float) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare half @llvm.fabs.f16(half) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #5

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #6

attributes #0 = { "target-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #2 = { noinline "target-cpu"="generic" }
attributes #3 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nofree nosync nounwind memory(none) "target-cpu"="generic" "target-features" }
attributes #5 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { nocallback nofree nounwind willreturn memory(argmem: write) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "TVM", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "IRModule.CodeGenLLVM", directory: ".")
!2 = !{i32 2, !"tvm_target", !"llvm -mtriple=x86_64-unknown-linux-gnu"}
!3 = !{i32 4, !"Debug Info Version", i32 3}
!4 = !{i32 4, !"Dwarf Version", i32 4}
!5 = distinct !DISubprogram(name: "conv", scope: !1, file: !1, type: !6, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !10)
!6 = !DISubroutineType(types: !7)
!7 = !{!8, !9, !9, !8, !9}
!8 = !DIBasicType(name: "int32", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null)
!10 = !{!11, !12, !13, !14}
!11 = !DILocalVariable(name: "self_handle", arg: 1, scope: !5, file: !1, type: !9)
!12 = !DILocalVariable(name: "args", arg: 2, scope: !5, file: !1, type: !9)
!13 = !DILocalVariable(name: "num_args", arg: 3, scope: !5, file: !1, type: !8)
!14 = !DILocalVariable(name: "result", arg: 4, scope: !5, file: !1, type: !9)
!15 = !DILocation(line: 0, scope: !5)
!16 = !{!"branch_weights", i32 1048576, i32 1}
!17 = !{!18, !18, i64 0}
!18 = !{!"ctx_ptr", !19, i64 0}
!19 = !{!"tvm-tbaa"}
!20 = !{!"branch_weights", i32 1, i32 1048576}
!21 = !DILocalVariable(name: "var_A.type_index", scope: !5, file: !1, type: !8)
!22 = !DILocalVariable(name: "var_W.type_index", scope: !5, file: !1, type: !8)
!23 = !DILocalVariable(name: "var_conv2d_nchw.type_index", scope: !5, file: !1, type: !8)
!24 = !DILocalVariable(name: "var_A", scope: !5, file: !1, type: !9)
!25 = !DILocalVariable(name: "var_W", scope: !5, file: !1, type: !9)
!26 = !DILocalVariable(name: "var_conv2d_nchw", scope: !5, file: !1, type: !9)
!27 = !DILocalVariable(name: "conv.var_A.shape", scope: !5, file: !1, type: !28)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29)
!29 = !DIBasicType(name: "int64", size: 64, encoding: DW_ATE_signed)
!30 = !{!31, !31, i64 0}
!31 = !{!"0x310b8050.w8.b0", !32, i64 0}
!32 = !{!"0x310b8050.w16.b0", !33, i64 0}
!33 = !{!"0x310b8050.w32.b0", !34, i64 0}
!34 = !{!"0x310b8050.w64.b0", !35, i64 0}
!35 = !{!"0x310b8050.w128.b0", !36, i64 0}
!36 = !{!"0x310b8050.w256.b0", !37, i64 0}
!37 = !{!"0x310b8050.w512.b0", !38, i64 0}
!38 = !{!"0x310b8050.w1024.b0", !39, i64 0}
!39 = !{!"0x310b8050", !19, i64 0}
!40 = !DILocalVariable(name: "N", scope: !5, file: !1, type: !8)
!41 = !{!42, !42, i64 0}
!42 = !{!"0x310b8050.w8.b8", !32, i64 0}
!43 = !DILocalVariable(name: "CI", scope: !5, file: !1, type: !8)
!44 = !{!45, !45, i64 0}
!45 = !{!"0x310b8050.w8.b16", !46, i64 0}
!46 = !{!"0x310b8050.w16.b16", !33, i64 0}
!47 = !DILocalVariable(name: "H", scope: !5, file: !1, type: !8)
!48 = !{!49, !49, i64 0}
!49 = !{!"0x310b8050.w8.b24", !46, i64 0}
!50 = !DILocalVariable(name: "W", scope: !5, file: !1, type: !8)
!51 = !DILocalVariable(name: "conv.var_A.strides", scope: !5, file: !1, type: !28)
!52 = !DILocalVariable(name: "dev_id", scope: !5, file: !1, type: !8)
!53 = !DILocalVariable(name: "A", scope: !5, file: !1, type: !54)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55)
!55 = !DIBasicType(name: "float32", size: 32, encoding: DW_ATE_float)
!56 = !DILocalVariable(name: "conv.var_W.shape", scope: !5, file: !1, type: !28)
!57 = !{!58, !58, i64 0}
!58 = !{!"0x30fff8c0.w8.b0", !59, i64 0}
!59 = !{!"0x30fff8c0.w16.b0", !60, i64 0}
!60 = !{!"0x30fff8c0.w32.b0", !61, i64 0}
!61 = !{!"0x30fff8c0.w64.b0", !62, i64 0}
!62 = !{!"0x30fff8c0.w128.b0", !63, i64 0}
!63 = !{!"0x30fff8c0.w256.b0", !64, i64 0}
!64 = !{!"0x30fff8c0.w512.b0", !65, i64 0}
!65 = !{!"0x30fff8c0.w1024.b0", !66, i64 0}
!66 = !{!"0x30fff8c0", !19, i64 0}
!67 = !DILocalVariable(name: "CO", scope: !5, file: !1, type: !8)
!68 = !{!69, !69, i64 0}
!69 = !{!"0x30fff8c0.w8.b16", !70, i64 0}
!70 = !{!"0x30fff8c0.w16.b16", !60, i64 0}
!71 = !DILocalVariable(name: "KH", scope: !5, file: !1, type: !8)
!72 = !{!73, !73, i64 0}
!73 = !{!"0x30fff8c0.w8.b24", !70, i64 0}
!74 = !DILocalVariable(name: "KW", scope: !5, file: !1, type: !8)
!75 = !DILocalVariable(name: "conv.var_W.strides", scope: !5, file: !1, type: !28)
!76 = !DILocalVariable(name: "W", scope: !5, file: !1, type: !54)
!77 = !DILocalVariable(name: "conv.var_conv2d_nchw.shape", scope: !5, file: !1, type: !28)
!78 = !DILocalVariable(name: "conv.var_conv2d_nchw.strides", scope: !5, file: !1, type: !28)
!79 = !DILocalVariable(name: "conv2d_nchw", scope: !5, file: !1, type: !54)
!80 = !{!81, !81, i64 0}
!81 = !{!"0x31071400.w8.b0", !82, i64 0}
!82 = !{!"0x31071400.w16.b0", !83, i64 0}
!83 = !{!"0x31071400.w32.b0", !84, i64 0}
!84 = !{!"0x31071400.w64.b0", !85, i64 0}
!85 = !{!"0x31071400.w128.b0", !86, i64 0}
!86 = !{!"0x31071400.w256.b0", !87, i64 0}
!87 = !{!"0x31071400.w512.b0", !88, i64 0}
!88 = !{!"0x31071400.w1024.b0", !89, i64 0}
!89 = !{!"0x31071400", !19, i64 0}
!90 = !{!91, !91, i64 0}
!91 = !{!"0x31071400.w8.b8", !82, i64 0}
!92 = !{!93, !93, i64 0}
!93 = !{!"0x31071400.w8.b16", !94, i64 0}
!94 = !{!"0x31071400.w16.b16", !83, i64 0}
!95 = !{!96, !96, i64 0}
!96 = !{!"0x31071400.w8.b24", !94, i64 0}
!97 = !{!98, !98, i64 0}
!98 = !{!"0x30fff8c0.w8.b8", !59, i64 0}
!99 = !{!100, !100, i64 0}
!100 = !{!"0x31065980.w8.b0", !101, i64 0}
!101 = !{!"0x31065980.w16.b0", !102, i64 0}
!102 = !{!"0x31065980.w32.b0", !103, i64 0}
!103 = !{!"0x31065980.w64.b0", !104, i64 0}
!104 = !{!"0x31065980.w128.b0", !105, i64 0}
!105 = !{!"0x31065980.w256.b0", !106, i64 0}
!106 = !{!"0x31065980.w512.b0", !107, i64 0}
!107 = !{!"0x31065980.w1024.b0", !108, i64 0}
!108 = !{!"0x31065980", !19, i64 0}
!109 = !{!110, !110, i64 0}
!110 = !{!"0x31065980.w8.b8", !101, i64 0}
!111 = !{!112, !112, i64 0}
!112 = !{!"0x31065980.w8.b16", !113, i64 0}
!113 = !{!"0x31065980.w16.b16", !102, i64 0}
!114 = !{!115, !115, i64 0}
!115 = !{!"0x31065980.w8.b24", !113, i64 0}
!116 = !{!117, !117, i64 0}
!117 = !{!"0x310a6f00.w8.b0", !118, i64 0}
!118 = !{!"0x310a6f00.w16.b0", !119, i64 0}
!119 = !{!"0x310a6f00.w32.b0", !120, i64 0}
!120 = !{!"0x310a6f00.w64.b0", !121, i64 0}
!121 = !{!"0x310a6f00.w128.b0", !122, i64 0}
!122 = !{!"0x310a6f00.w256.b0", !123, i64 0}
!123 = !{!"0x310a6f00.w512.b0", !124, i64 0}
!124 = !{!"0x310a6f00.w1024.b0", !125, i64 0}
!125 = !{!"0x310a6f00", !19, i64 0}
!126 = !{!127, !127, i64 0}
!127 = !{!"0x310a6f00.w8.b8", !118, i64 0}
!128 = !{!129, !129, i64 0}
!129 = !{!"0x310a6f00.w8.b16", !130, i64 0}
!130 = !{!"0x310a6f00.w16.b16", !119, i64 0}
!131 = !{!132, !132, i64 0}
!132 = !{!"0x310a6f00.w8.b24", !130, i64 0}
!133 = !{!134, !134, i64 0}
!134 = !{!"0x310a7410.w8.b0", !135, i64 0}
!135 = !{!"0x310a7410.w16.b0", !136, i64 0}
!136 = !{!"0x310a7410.w32.b0", !137, i64 0}
!137 = !{!"0x310a7410.w64.b0", !138, i64 0}
!138 = !{!"0x310a7410.w128.b0", !139, i64 0}
!139 = !{!"0x310a7410.w256.b0", !140, i64 0}
!140 = !{!"0x310a7410.w512.b0", !141, i64 0}
!141 = !{!"0x310a7410.w1024.b0", !142, i64 0}
!142 = !{!"0x310a7410", !19, i64 0}
!143 = !{!144, !144, i64 0}
!144 = !{!"0x310a7410.w8.b8", !135, i64 0}
!145 = !{!146, !146, i64 0}
!146 = !{!"0x310a7410.w8.b16", !147, i64 0}
!147 = !{!"0x310a7410.w16.b16", !136, i64 0}
!148 = !{!149, !149, i64 0}
!149 = !{!"0x310a7410.w8.b24", !147, i64 0}
!150 = distinct !DISubprogram(name: "conv_compute_", scope: !1, file: !1, type: !151, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !153)
!151 = !DISubroutineType(types: !152)
!152 = !{!8, !8, !8, !8, !8, !8, !54, !8, !8, !8, !54, !54}
!153 = !{!154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164}
!154 = !DILocalVariable(name: "dev_id", arg: 1, scope: !150, file: !1, type: !8)
!155 = !DILocalVariable(name: "N", arg: 2, scope: !150, file: !1, type: !8)
!156 = !DILocalVariable(name: "CI", arg: 3, scope: !150, file: !1, type: !8)
!157 = !DILocalVariable(name: "H", arg: 4, scope: !150, file: !1, type: !8)
!158 = !DILocalVariable(name: "W", arg: 5, scope: !150, file: !1, type: !8)
!159 = !DILocalVariable(name: "A", arg: 6, scope: !150, file: !1, type: !54)
!160 = !DILocalVariable(name: "CO", arg: 7, scope: !150, file: !1, type: !8)
!161 = !DILocalVariable(name: "KH", arg: 8, scope: !150, file: !1, type: !8)
!162 = !DILocalVariable(name: "KW", arg: 9, scope: !150, file: !1, type: !8)
!163 = !DILocalVariable(name: "conv2d_nchw", arg: 10, scope: !150, file: !1, type: !54)
!164 = !DILocalVariable(name: "W1", arg: 11, scope: !150, file: !1, type: !54)
!165 = !DILocation(line: 0, scope: !150)
!166 = !DILocalVariable(name: "pad_temp", scope: !150, file: !1, type: !54)
!167 = !DILocalVariable(name: "i0", scope: !150, file: !1, type: !8)
!168 = !{!"branch_weights", i32 127, i32 1}
!169 = !{!"branch_weights", i32 48769, i32 2048383}
!170 = !DILocalVariable(name: "i1", scope: !150, file: !1, type: !8)
!171 = !DILocalVariable(name: "i2", scope: !150, file: !1, type: !8)
!172 = !DILocalVariable(name: "i3", scope: !150, file: !1, type: !8)
!173 = !{!174, !174, i64 0}
!174 = !{!"0x31003c70", !19, i64 0}
!175 = !{!"branch_weights", i32 127, i32 134217601}
!176 = !{!"branch_weights", i32 1, i32 127}
!177 = !{!178, !178, i64 0}
!178 = !{!"0x310035c0", !19, i64 0}
!179 = !{!"branch_weights", i32 127, i32 67108705}
!180 = distinct !{!180, !181}
!181 = !{!"llvm.loop.peeled.count", i32 1}
!182 = !{!"branch_weights", i32 1, i32 1}
!183 = !DILocalVariable(name: "nn", scope: !150, file: !1, type: !8)
!184 = !{!"branch_weights", i32 1073741824, i32 1073741824}
!185 = !{!"branch_weights", i32 197435152, i32 -197435154}
!186 = !DILocalVariable(name: "ff", scope: !150, file: !1, type: !8)
!187 = !DILocalVariable(name: "yy", scope: !150, file: !1, type: !8)
!188 = !DILocalVariable(name: "xx", scope: !150, file: !1, type: !8)
!189 = !DILocalVariable(name: "rc", scope: !150, file: !1, type: !8)
!190 = !{!191, !191, i64 0}
!191 = !{!"0x31061640", !19, i64 0}
!192 = !DILocalVariable(name: "ry", scope: !150, file: !1, type: !8)
!193 = !DILocalVariable(name: "rx", scope: !150, file: !1, type: !8)
!194 = !{!195, !195, i64 0}
!195 = !{!"0x30fa6250", !19, i64 0}
