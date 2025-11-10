; ModuleID = 'TVMMod'
source_filename = "TVMMod"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__TVMFFIErrorSetRaisedFromCStr = linkonce dllexport local_unnamed_addr global ptr null, align 8
@.str = private constant [55 x i8] c"Assert fail: num_args == 3, gemm: num_args should be 3\00", align 1
@.str.1 = private constant [13 x i8] c"RuntimeError\00", align 1
@.str.2 = private constant [63 x i8] c"Assert fail: not T.isnullptr(args), gemm: args pointer is NULL\00", align 1
@.str.3 = private constant [146 x i8] c"Assert fail: var_A_type_index == 0 or var_A_type_index == 4 or var_A_type_index == 7 or var_A_type_index >= 64, gemm: Expect arg[0] to be pointer\00", align 1
@.str.4 = private constant [146 x i8] c"Assert fail: var_B_type_index == 0 or var_B_type_index == 4 or var_B_type_index == 7 or var_B_type_index >= 64, gemm: Expect arg[1] to be pointer\00", align 1
@.str.5 = private constant [186 x i8] c"Assert fail: var_T_matmul_NT_type_index == 0 or var_T_matmul_NT_type_index == 4 or var_T_matmul_NT_type_index == 7 or var_T_matmul_NT_type_index >= 64, gemm: Expect arg[2] to be pointer\00", align 1
@.str.6 = private constant [95 x i8] c"Assert fail: not T.isnullptr(var_A), gemm.var_A is expected to have non-NULL DLTensor* pointer\00", align 1
@.str.7 = private constant [97 x i8] c"Assert fail: 2 == T.tvm_struct_get(var_A, 0, 4, \22int32\22), gemm.var_A.ndim is expected to equal 2\00", align 1
@.str.8 = private constant [95 x i8] c"Assert fail: not T.isnullptr(var_B), gemm.var_B is expected to have non-NULL DLTensor* pointer\00", align 1
@.str.9 = private constant [97 x i8] c"Assert fail: 2 == T.tvm_struct_get(var_B, 0, 4, \22int32\22), gemm.var_B.ndim is expected to equal 2\00", align 1
@.str.10 = private constant [115 x i8] c"Assert fail: not T.isnullptr(var_T_matmul_NT), gemm.var_T_matmul_NT is expected to have non-NULL DLTensor* pointer\00", align 1
@.str.11 = private constant [117 x i8] c"Assert fail: 2 == T.tvm_struct_get(var_T_matmul_NT, 0, 4, \22int32\22), gemm.var_T_matmul_NT.ndim is expected to equal 2\00", align 1
@.str.12 = private constant [227 x i8] c"Assert fail: T.tvm_struct_get(var_A, 0, 5, \22uint8\22) == T.uint8(2) and T.tvm_struct_get(var_A, 0, 6, \22uint8\22) == T.uint8(32) and T.tvm_struct_get(var_A, 0, 7, \22uint16\22) == T.uint16(1), gemm.var_A.dtype is expected to be float32\00", align 1
@.str.13 = private constant [179 x i8] c"Assert fail: (K == 1 or 1 == T.Cast(\22int32\22, gemm_var_A_strides[1])) and (M == 1 or K == T.Cast(\22int32\22, gemm_var_A_strides[0])), gemm.var_A.strides: expected to be compact array\00", align 1
@.str.14 = private constant [187 x i8] c"Assert fail: T.uint64(0) == T.tvm_struct_get(var_A, 0, 8, \22uint64\22), Argument gemm.var_A.byte_offset has an unsatisfied constraint: T.uint64(0) == T.tvm_struct_get(var_A, 0, 8, \22uint64\22)\00", align 1
@.str.15 = private constant [167 x i8] c"Assert fail: T.tvm_struct_get(var_A, 0, 10, \22int32\22) == 1, Argument gemm.var_A.device_type has an unsatisfied constraint: 1 == T.tvm_struct_get(var_A, 0, 10, \22int32\22)\00", align 1
@.str.16 = private constant [100 x i8] c"Assert fail: M * K == 0 or not T.isnullptr(A), gemm.var_A is expected to have non-NULL data pointer\00", align 1
@.str.17 = private constant [227 x i8] c"Assert fail: T.tvm_struct_get(var_B, 0, 5, \22uint8\22) == T.uint8(2) and T.tvm_struct_get(var_B, 0, 6, \22uint8\22) == T.uint8(32) and T.tvm_struct_get(var_B, 0, 7, \22uint16\22) == T.uint16(1), gemm.var_B.dtype is expected to be float32\00", align 1
@.str.18 = private constant [158 x i8] c"Assert fail: K == T.Cast(\22int32\22, gemm_var_B_shape[0]), Argument gemm.var_B.shape[0] has an unsatisfied constraint: K == T.Cast(\22int32\22, gemm_var_B_shape[0])\00", align 1
@.str.19 = private constant [179 x i8] c"Assert fail: (N == 1 or 1 == T.Cast(\22int32\22, gemm_var_B_strides[1])) and (K == 1 or N == T.Cast(\22int32\22, gemm_var_B_strides[0])), gemm.var_B.strides: expected to be compact array\00", align 1
@.str.20 = private constant [187 x i8] c"Assert fail: T.uint64(0) == T.tvm_struct_get(var_B, 0, 8, \22uint64\22), Argument gemm.var_B.byte_offset has an unsatisfied constraint: T.uint64(0) == T.tvm_struct_get(var_B, 0, 8, \22uint64\22)\00", align 1
@.str.21 = private constant [167 x i8] c"Assert fail: T.tvm_struct_get(var_B, 0, 10, \22int32\22) == 1, Argument gemm.var_B.device_type has an unsatisfied constraint: 1 == T.tvm_struct_get(var_B, 0, 10, \22int32\22)\00", align 1
@.str.22 = private constant [173 x i8] c"Assert fail: dev_id == T.tvm_struct_get(var_B, 0, 9, \22int32\22), Argument gemm.var_B.device_id has an unsatisfied constraint: dev_id == T.tvm_struct_get(var_B, 0, 9, \22int32\22)\00", align 1
@.str.23 = private constant [100 x i8] c"Assert fail: K * N == 0 or not T.isnullptr(B), gemm.var_B is expected to have non-NULL data pointer\00", align 1
@.str.24 = private constant [267 x i8] c"Assert fail: T.tvm_struct_get(var_T_matmul_NT, 0, 5, \22uint8\22) == T.uint8(2) and T.tvm_struct_get(var_T_matmul_NT, 0, 6, \22uint8\22) == T.uint8(32) and T.tvm_struct_get(var_T_matmul_NT, 0, 7, \22uint16\22) == T.uint16(1), gemm.var_T_matmul_NT.dtype is expected to be float32\00", align 1
@.str.25 = private constant [188 x i8] c"Assert fail: M == T.Cast(\22int32\22, gemm_var_T_matmul_NT_shape[0]), Argument gemm.var_T_matmul_NT.shape[0] has an unsatisfied constraint: M == T.Cast(\22int32\22, gemm_var_T_matmul_NT_shape[0])\00", align 1
@.str.26 = private constant [188 x i8] c"Assert fail: K == T.Cast(\22int32\22, gemm_var_T_matmul_NT_shape[1]), Argument gemm.var_T_matmul_NT.shape[1] has an unsatisfied constraint: K == T.Cast(\22int32\22, gemm_var_T_matmul_NT_shape[1])\00", align 1
@.str.27 = private constant [209 x i8] c"Assert fail: (K == 1 or 1 == T.Cast(\22int32\22, gemm_var_T_matmul_NT_strides[1])) and (M == 1 or K == T.Cast(\22int32\22, gemm_var_T_matmul_NT_strides[0])), gemm.var_T_matmul_NT.strides: expected to be compact array\00", align 1
@.str.28 = private constant [217 x i8] c"Assert fail: T.uint64(0) == T.tvm_struct_get(var_T_matmul_NT, 0, 8, \22uint64\22), Argument gemm.var_T_matmul_NT.byte_offset has an unsatisfied constraint: T.uint64(0) == T.tvm_struct_get(var_T_matmul_NT, 0, 8, \22uint64\22)\00", align 1
@.str.29 = private constant [197 x i8] c"Assert fail: T.tvm_struct_get(var_T_matmul_NT, 0, 10, \22int32\22) == 1, Argument gemm.var_T_matmul_NT.device_type has an unsatisfied constraint: 1 == T.tvm_struct_get(var_T_matmul_NT, 0, 10, \22int32\22)\00", align 1
@.str.30 = private constant [203 x i8] c"Assert fail: dev_id == T.tvm_struct_get(var_T_matmul_NT, 0, 9, \22int32\22), Argument gemm.var_T_matmul_NT.device_id has an unsatisfied constraint: dev_id == T.tvm_struct_get(var_T_matmul_NT, 0, 9, \22int32\22)\00", align 1
@.str.31 = private constant [120 x i8] c"Assert fail: M * K == 0 or not T.isnullptr(T_matmul_NT), gemm.var_T_matmul_NT is expected to have non-NULL data pointer\00", align 1
@__tvm_main__ = weak dllexport local_unnamed_addr constant [5 x i8] c"gemm\00", align 1
@llvm.global_ctors = appending global [0 x { i32, ptr, ptr }] zeroinitializer

define dllexport range(i32 -1, 1) i32 @gemm(ptr noalias nocapture readnone %self_handle, ptr noalias readonly %args, i32 %num_args, ptr noalias nocapture readnone %result) local_unnamed_addr #0 !dbg !5 {
entry:
    #dbg_value(ptr %self_handle, !11, !DIExpression(), !15)
    #dbg_value(ptr %args, !12, !DIExpression(), !15)
    #dbg_value(i32 %num_args, !13, !DIExpression(), !15)
    #dbg_value(ptr %result, !14, !DIExpression(), !15)
  %0 = icmp eq i32 %num_args, 3, !dbg !15
  br i1 %0, label %assert_end, label %assert_fail, !dbg !15, !prof !16

common.ret:                                       ; preds = %assert_end64, %assert_fail63, %assert_fail61, %assert_fail59, %assert_fail57, %assert_fail55, %assert_fail51, %assert_fail49, %assert_fail47, %assert_fail45, %assert_fail43, %assert_fail41, %assert_fail39, %assert_fail37, %assert_fail33, %assert_fail31, %assert_fail29, %assert_fail27, %assert_fail25, %assert_fail23, %assert_fail21, %assert_fail19, %assert_fail17, %assert_fail15, %assert_fail13, %assert_fail11, %assert_fail9, %assert_fail7, %assert_fail5, %assert_fail3, %assert_fail1, %assert_fail
  %common.ret.op = phi i32 [ -1, %assert_fail ], [ -1, %assert_fail1 ], [ -1, %assert_fail3 ], [ -1, %assert_fail5 ], [ -1, %assert_fail7 ], [ -1, %assert_fail9 ], [ -1, %assert_fail11 ], [ -1, %assert_fail13 ], [ -1, %assert_fail15 ], [ -1, %assert_fail17 ], [ -1, %assert_fail19 ], [ -1, %assert_fail21 ], [ -1, %assert_fail23 ], [ -1, %assert_fail25 ], [ -1, %assert_fail27 ], [ -1, %assert_fail29 ], [ -1, %assert_fail31 ], [ -1, %assert_fail33 ], [ -1, %assert_fail37 ], [ -1, %assert_fail39 ], [ -1, %assert_fail41 ], [ -1, %assert_fail43 ], [ -1, %assert_fail45 ], [ -1, %assert_fail47 ], [ -1, %assert_fail49 ], [ -1, %assert_fail51 ], [ -1, %assert_fail55 ], [ -1, %assert_fail57 ], [ -1, %assert_fail59 ], [ -1, %assert_fail61 ], [ -1, %assert_fail63 ], [ 0, %assert_end64 ]
  ret i32 %common.ret.op, !dbg !15

assert_fail:                                      ; preds = %entry
  %1 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %1(ptr nonnull @.str.1, ptr nonnull @.str), !dbg !15
  br label %common.ret, !dbg !15

assert_end:                                       ; preds = %entry
  %.not = icmp eq ptr %args, null, !dbg !15
  br i1 %.not, label %assert_fail1, label %assert_end2, !dbg !15, !prof !20

assert_fail1:                                     ; preds = %assert_end
  %2 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
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
  %4 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %4(ptr nonnull @.str.1, ptr nonnull @.str.3), !dbg !15
  br label %common.ret, !dbg !15

assert_end4:                                      ; preds = %switch.early.test, %switch.early.test, %switch.early.test, %assert_end2
  %5 = getelementptr inbounds nuw i8, ptr %args, i64 16, !dbg !15
  %var_B.type_index = load i32, ptr %5, align 4, !dbg !15
    #dbg_declare(i32 %var_B.type_index, !22, !DIExpression(), !15)
    #dbg_declare(i32 %var_B.type_index, !22, !DIExpression(), !15)
  %var_B.type_index.fr = freeze i32 %var_B.type_index, !dbg !15
  %6 = icmp sgt i32 %var_B.type_index.fr, 63, !dbg !15
  br i1 %6, label %assert_end6, label %switch.early.test65, !dbg !15

switch.early.test65:                              ; preds = %assert_end4
  switch i32 %var_B.type_index.fr, label %assert_fail5 [
    i32 7, label %assert_end6
    i32 4, label %assert_end6
    i32 0, label %assert_end6
  ], !dbg !15

assert_fail5:                                     ; preds = %switch.early.test65
  %7 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %7(ptr nonnull @.str.1, ptr nonnull @.str.4), !dbg !15
  br label %common.ret, !dbg !15

assert_end6:                                      ; preds = %switch.early.test65, %switch.early.test65, %switch.early.test65, %assert_end4
  %8 = getelementptr inbounds nuw i8, ptr %args, i64 32, !dbg !15
  %var_T_matmul_NT.type_index = load i32, ptr %8, align 4, !dbg !15
    #dbg_declare(i32 %var_T_matmul_NT.type_index, !23, !DIExpression(), !15)
    #dbg_declare(i32 %var_T_matmul_NT.type_index, !23, !DIExpression(), !15)
  %var_T_matmul_NT.type_index.fr = freeze i32 %var_T_matmul_NT.type_index, !dbg !15
  %9 = icmp sgt i32 %var_T_matmul_NT.type_index.fr, 63, !dbg !15
  br i1 %9, label %assert_end8, label %switch.early.test66, !dbg !15

switch.early.test66:                              ; preds = %assert_end6
  switch i32 %var_T_matmul_NT.type_index.fr, label %assert_fail7 [
    i32 7, label %assert_end8
    i32 4, label %assert_end8
    i32 0, label %assert_end8
  ], !dbg !15

assert_fail7:                                     ; preds = %switch.early.test66
  %10 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %10(ptr nonnull @.str.1, ptr nonnull @.str.5), !dbg !15
  br label %common.ret, !dbg !15

assert_end8:                                      ; preds = %switch.early.test66, %switch.early.test66, %switch.early.test66, %assert_end6
  %11 = getelementptr inbounds nuw i8, ptr %args, i64 8, !dbg !15
  %12 = load ptr, ptr %11, align 8, !dbg !15
  %13 = icmp eq i32 %var_A.type_index.fr, 72, !dbg !15
  %var_A.idx = select i1 %13, i64 16, i64 0, !dbg !15
  %var_A = getelementptr inbounds nuw i8, ptr %12, i64 %var_A.idx, !dbg !15
    #dbg_declare(ptr %var_A, !24, !DIExpression(), !15)
    #dbg_declare(ptr %var_A, !24, !DIExpression(), !15)
  %14 = getelementptr inbounds nuw i8, ptr %args, i64 24, !dbg !15
  %15 = load ptr, ptr %14, align 8, !dbg !15
  %16 = icmp eq i32 %var_B.type_index.fr, 72, !dbg !15
  %var_B.idx = select i1 %16, i64 16, i64 0, !dbg !15
  %var_B = getelementptr inbounds nuw i8, ptr %15, i64 %var_B.idx, !dbg !15
    #dbg_declare(ptr %var_B, !25, !DIExpression(), !15)
    #dbg_declare(ptr %var_B, !25, !DIExpression(), !15)
  %17 = getelementptr inbounds nuw i8, ptr %args, i64 40, !dbg !15
  %18 = load ptr, ptr %17, align 8, !dbg !15
  %19 = icmp eq i32 %var_T_matmul_NT.type_index.fr, 72, !dbg !15
  %var_T_matmul_NT.idx = select i1 %19, i64 16, i64 0, !dbg !15
  %var_T_matmul_NT = getelementptr inbounds nuw i8, ptr %18, i64 %var_T_matmul_NT.idx, !dbg !15
    #dbg_declare(ptr %var_T_matmul_NT, !26, !DIExpression(), !15)
    #dbg_declare(ptr %var_T_matmul_NT, !26, !DIExpression(), !15)
  %.not67 = icmp eq ptr %12, null, !dbg !15
  br i1 %.not67, label %assert_fail9, label %assert_end10, !dbg !15, !prof !20

assert_fail9:                                     ; preds = %assert_end8
  %20 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %20(ptr nonnull @.str.1, ptr nonnull @.str.6), !dbg !15
  br label %common.ret, !dbg !15

assert_end10:                                     ; preds = %assert_end8
  %21 = getelementptr inbounds nuw i8, ptr %var_A, i64 16, !dbg !15
  %22 = load i32, ptr %21, align 4, !dbg !15
  %23 = icmp eq i32 %22, 2, !dbg !15
  br i1 %23, label %assert_end12, label %assert_fail11, !dbg !15, !prof !16

assert_fail11:                                    ; preds = %assert_end10
  %24 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %24(ptr nonnull @.str.1, ptr nonnull @.str.7), !dbg !15
  br label %common.ret, !dbg !15

assert_end12:                                     ; preds = %assert_end10
  %25 = getelementptr inbounds nuw i8, ptr %var_A, i64 24, !dbg !15
  %gemm.var_A.shape = load ptr, ptr %25, align 8, !dbg !15
    #dbg_declare(ptr %gemm.var_A.shape, !27, !DIExpression(), !15)
    #dbg_declare(ptr %gemm.var_A.shape, !27, !DIExpression(), !15)
  %26 = load i64, ptr %gemm.var_A.shape, align 8, !dbg !15, !tbaa !30
  %M = trunc i64 %26 to i32, !dbg !15
    #dbg_declare(i32 %M, !40, !DIExpression(), !15)
    #dbg_declare(i32 %M, !40, !DIExpression(), !15)
  %27 = getelementptr inbounds nuw i8, ptr %gemm.var_A.shape, i64 8, !dbg !15
  %28 = load i64, ptr %27, align 8, !dbg !15, !tbaa !41
  %K = trunc i64 %28 to i32, !dbg !15
    #dbg_declare(i32 %K, !43, !DIExpression(), !15)
    #dbg_declare(i32 %K, !43, !DIExpression(), !15)
  %29 = getelementptr inbounds nuw i8, ptr %var_A, i64 32, !dbg !15
  %gemm.var_A.strides = load ptr, ptr %29, align 8, !dbg !15
    #dbg_declare(ptr %gemm.var_A.strides, !44, !DIExpression(), !15)
    #dbg_declare(ptr %gemm.var_A.strides, !44, !DIExpression(), !15)
  %30 = getelementptr inbounds nuw i8, ptr %var_A, i64 12, !dbg !15
  %dev_id = load i32, ptr %30, align 4, !dbg !15
    #dbg_declare(i32 %dev_id, !45, !DIExpression(), !15)
    #dbg_declare(i32 %dev_id, !45, !DIExpression(), !15)
  %A = load ptr, ptr %var_A, align 8, !dbg !15
    #dbg_declare(ptr %A, !46, !DIExpression(), !15)
    #dbg_declare(ptr %A, !46, !DIExpression(), !15)
  call void @llvm.assume(i1 true) [ "align"(ptr %A, i64 64) ], !dbg !15
  %.not68 = icmp eq ptr %15, null, !dbg !15
  br i1 %.not68, label %assert_fail13, label %assert_end14, !dbg !15, !prof !20

assert_fail13:                                    ; preds = %assert_end12
  %31 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %31(ptr nonnull @.str.1, ptr nonnull @.str.8), !dbg !15
  br label %common.ret, !dbg !15

assert_end14:                                     ; preds = %assert_end12
  %32 = getelementptr inbounds nuw i8, ptr %var_B, i64 16, !dbg !15
  %33 = load i32, ptr %32, align 4, !dbg !15
  %34 = icmp eq i32 %33, 2, !dbg !15
  br i1 %34, label %assert_end16, label %assert_fail15, !dbg !15, !prof !16

assert_fail15:                                    ; preds = %assert_end14
  %35 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %35(ptr nonnull @.str.1, ptr nonnull @.str.9), !dbg !15
  br label %common.ret, !dbg !15

assert_end16:                                     ; preds = %assert_end14
  %36 = getelementptr inbounds nuw i8, ptr %var_B, i64 24, !dbg !15
  %gemm.var_B.shape = load ptr, ptr %36, align 8, !dbg !15
    #dbg_declare(ptr %gemm.var_B.shape, !49, !DIExpression(), !15)
    #dbg_declare(ptr %gemm.var_B.shape, !49, !DIExpression(), !15)
  %37 = getelementptr inbounds nuw i8, ptr %gemm.var_B.shape, i64 8, !dbg !15
  %38 = load i64, ptr %37, align 8, !dbg !15, !tbaa !50
  %N = trunc i64 %38 to i32, !dbg !15
    #dbg_declare(i32 %N, !60, !DIExpression(), !15)
    #dbg_declare(i32 %N, !60, !DIExpression(), !15)
  %39 = getelementptr inbounds nuw i8, ptr %var_B, i64 32, !dbg !15
  %gemm.var_B.strides = load ptr, ptr %39, align 8, !dbg !15
    #dbg_declare(ptr %gemm.var_B.strides, !61, !DIExpression(), !15)
    #dbg_declare(ptr %gemm.var_B.strides, !61, !DIExpression(), !15)
  %B = load ptr, ptr %var_B, align 8, !dbg !15
    #dbg_declare(ptr %B, !62, !DIExpression(), !15)
    #dbg_declare(ptr %B, !62, !DIExpression(), !15)
  call void @llvm.assume(i1 true) [ "align"(ptr %B, i64 64) ], !dbg !15
  %.not69 = icmp eq ptr %18, null, !dbg !15
  br i1 %.not69, label %assert_fail17, label %assert_end18, !dbg !15, !prof !20

assert_fail17:                                    ; preds = %assert_end16
  %40 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %40(ptr nonnull @.str.1, ptr nonnull @.str.10), !dbg !15
  br label %common.ret, !dbg !15

assert_end18:                                     ; preds = %assert_end16
  %41 = getelementptr inbounds nuw i8, ptr %var_T_matmul_NT, i64 16, !dbg !15
  %42 = load i32, ptr %41, align 4, !dbg !15
  %43 = icmp eq i32 %42, 2, !dbg !15
  br i1 %43, label %assert_end20, label %assert_fail19, !dbg !15, !prof !16

assert_fail19:                                    ; preds = %assert_end18
  %44 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %44(ptr nonnull @.str.1, ptr nonnull @.str.11), !dbg !15
  br label %common.ret, !dbg !15

assert_end20:                                     ; preds = %assert_end18
  %45 = getelementptr inbounds nuw i8, ptr %var_T_matmul_NT, i64 24, !dbg !15
  %gemm.var_T_matmul_NT.shape = load ptr, ptr %45, align 8, !dbg !15
    #dbg_declare(ptr %gemm.var_T_matmul_NT.shape, !63, !DIExpression(), !15)
    #dbg_declare(ptr %gemm.var_T_matmul_NT.shape, !63, !DIExpression(), !15)
  %46 = getelementptr inbounds nuw i8, ptr %var_T_matmul_NT, i64 32, !dbg !15
  %gemm.var_T_matmul_NT.strides = load ptr, ptr %46, align 8, !dbg !15
    #dbg_declare(ptr %gemm.var_T_matmul_NT.strides, !64, !DIExpression(), !15)
    #dbg_declare(ptr %gemm.var_T_matmul_NT.strides, !64, !DIExpression(), !15)
  %T_matmul_NT = load ptr, ptr %var_T_matmul_NT, align 8, !dbg !15
    #dbg_declare(ptr %T_matmul_NT, !65, !DIExpression(), !15)
    #dbg_declare(ptr %T_matmul_NT, !65, !DIExpression(), !15)
  call void @llvm.assume(i1 true) [ "align"(ptr %T_matmul_NT, i64 64) ], !dbg !15
  %47 = getelementptr inbounds nuw i8, ptr %var_A, i64 22, !dbg !15
  %48 = load i16, ptr %47, align 2, !dbg !15
  %49 = icmp eq i16 %48, 1, !dbg !15
  %50 = getelementptr inbounds nuw i8, ptr %var_A, i64 21, !dbg !15
  %51 = load i8, ptr %50, align 1, !dbg !15
  %52 = icmp eq i8 %51, 32, !dbg !15
  %53 = getelementptr inbounds nuw i8, ptr %var_A, i64 20, !dbg !15
  %54 = load i8, ptr %53, align 1, !dbg !15
  %55 = icmp eq i8 %54, 2, !dbg !15
  %56 = and i1 %52, %55, !dbg !15
  %57 = and i1 %49, %56, !dbg !15
  br i1 %57, label %assert_end22, label %assert_fail21, !dbg !15, !prof !16

assert_fail21:                                    ; preds = %assert_end20
  %58 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %58(ptr nonnull @.str.1, ptr nonnull @.str.12), !dbg !15
  br label %common.ret, !dbg !15

assert_end22:                                     ; preds = %assert_end20
  %.not70 = icmp eq ptr %gemm.var_A.strides, null, !dbg !15
  br i1 %.not70, label %if_end, label %if_then, !dbg !15, !prof !20

if_then:                                          ; preds = %assert_end22
  %59 = load i64, ptr %gemm.var_A.strides, align 8, !dbg !15, !tbaa !66
  %60 = trunc i64 %59 to i32, !dbg !15
  %61 = icmp eq i32 %K, %60, !dbg !15
  %62 = icmp eq i32 %M, 1, !dbg !15
  %63 = or i1 %62, %61, !dbg !15
  %64 = getelementptr inbounds nuw i8, ptr %gemm.var_A.strides, i64 8, !dbg !15
  %65 = load i64, ptr %64, align 8, !dbg !15, !tbaa !76
  %66 = and i64 %65, 4294967295, !dbg !15
  %67 = icmp eq i64 %66, 1, !dbg !15
  %68 = icmp eq i32 %K, 1, !dbg !15
  %69 = or i1 %68, %67, !dbg !15
  %70 = and i1 %63, %69, !dbg !15
  br i1 %70, label %if_end, label %assert_fail23, !dbg !15, !prof !16

if_end:                                           ; preds = %if_then, %assert_end22
  %71 = getelementptr inbounds nuw i8, ptr %var_A, i64 40, !dbg !15
  %72 = load i64, ptr %71, align 8, !dbg !15
  %73 = icmp eq i64 %72, 0, !dbg !15
  br i1 %73, label %assert_end26, label %assert_fail25, !dbg !15, !prof !16

assert_fail23:                                    ; preds = %if_then
  %74 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %74(ptr nonnull @.str.1, ptr nonnull @.str.13), !dbg !15
  br label %common.ret, !dbg !15

assert_fail25:                                    ; preds = %if_end
  %75 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %75(ptr nonnull @.str.1, ptr nonnull @.str.14), !dbg !15
  br label %common.ret, !dbg !15

assert_end26:                                     ; preds = %if_end
  %76 = getelementptr inbounds nuw i8, ptr %var_A, i64 8, !dbg !15
  %77 = load i32, ptr %76, align 4, !dbg !15
  %78 = icmp eq i32 %77, 1, !dbg !15
  br i1 %78, label %assert_end28, label %assert_fail27, !dbg !15, !prof !16

assert_fail27:                                    ; preds = %assert_end26
  %79 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %79(ptr nonnull @.str.1, ptr nonnull @.str.15), !dbg !15
  br label %common.ret, !dbg !15

assert_end28:                                     ; preds = %assert_end26
  %80 = icmp ne ptr %A, null, !dbg !15
  %81 = mul nsw i32 %K, %M, !dbg !15
  %82 = icmp eq i32 %81, 0, !dbg !15
  %83 = or i1 %82, %80, !dbg !15
  br i1 %83, label %assert_end30, label %assert_fail29, !dbg !15, !prof !16

assert_fail29:                                    ; preds = %assert_end28
  %84 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %84(ptr nonnull @.str.1, ptr nonnull @.str.16), !dbg !15
  br label %common.ret, !dbg !15

assert_end30:                                     ; preds = %assert_end28
  %85 = getelementptr inbounds nuw i8, ptr %var_B, i64 22, !dbg !15
  %86 = load i16, ptr %85, align 2, !dbg !15
  %87 = icmp eq i16 %86, 1, !dbg !15
  %88 = getelementptr inbounds nuw i8, ptr %var_B, i64 21, !dbg !15
  %89 = load i8, ptr %88, align 1, !dbg !15
  %90 = icmp eq i8 %89, 32, !dbg !15
  %91 = getelementptr inbounds nuw i8, ptr %var_B, i64 20, !dbg !15
  %92 = load i8, ptr %91, align 1, !dbg !15
  %93 = icmp eq i8 %92, 2, !dbg !15
  %94 = and i1 %90, %93, !dbg !15
  %95 = and i1 %87, %94, !dbg !15
  br i1 %95, label %assert_end32, label %assert_fail31, !dbg !15, !prof !16

assert_fail31:                                    ; preds = %assert_end30
  %96 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %96(ptr nonnull @.str.1, ptr nonnull @.str.17), !dbg !15
  br label %common.ret, !dbg !15

assert_end32:                                     ; preds = %assert_end30
  %97 = load i64, ptr %gemm.var_B.shape, align 8, !dbg !15, !tbaa !78
  %98 = trunc i64 %97 to i32, !dbg !15
  %99 = icmp eq i32 %K, %98, !dbg !15
  br i1 %99, label %assert_end34, label %assert_fail33, !dbg !15, !prof !16

assert_fail33:                                    ; preds = %assert_end32
  %100 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %100(ptr nonnull @.str.1, ptr nonnull @.str.18), !dbg !15
  br label %common.ret, !dbg !15

assert_end34:                                     ; preds = %assert_end32
  %.not71 = icmp eq ptr %gemm.var_B.strides, null, !dbg !15
  br i1 %.not71, label %if_end36, label %if_then35, !dbg !15, !prof !20

if_then35:                                        ; preds = %assert_end34
  %101 = load i64, ptr %gemm.var_B.strides, align 8, !dbg !15, !tbaa !80
  %102 = trunc i64 %101 to i32, !dbg !15
  %103 = icmp eq i32 %N, %102, !dbg !15
  %104 = icmp eq i32 %K, 1, !dbg !15
  %105 = or i1 %104, %103, !dbg !15
  %106 = getelementptr inbounds nuw i8, ptr %gemm.var_B.strides, i64 8, !dbg !15
  %107 = load i64, ptr %106, align 8, !dbg !15, !tbaa !90
  %108 = and i64 %107, 4294967295, !dbg !15
  %109 = icmp eq i64 %108, 1, !dbg !15
  %110 = icmp eq i32 %N, 1, !dbg !15
  %111 = or i1 %110, %109, !dbg !15
  %112 = and i1 %105, %111, !dbg !15
  br i1 %112, label %if_end36, label %assert_fail37, !dbg !15, !prof !16

if_end36:                                         ; preds = %if_then35, %assert_end34
  %113 = getelementptr inbounds nuw i8, ptr %var_B, i64 40, !dbg !15
  %114 = load i64, ptr %113, align 8, !dbg !15
  %115 = icmp eq i64 %114, 0, !dbg !15
  br i1 %115, label %assert_end40, label %assert_fail39, !dbg !15, !prof !16

assert_fail37:                                    ; preds = %if_then35
  %116 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %116(ptr nonnull @.str.1, ptr nonnull @.str.19), !dbg !15
  br label %common.ret, !dbg !15

assert_fail39:                                    ; preds = %if_end36
  %117 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %117(ptr nonnull @.str.1, ptr nonnull @.str.20), !dbg !15
  br label %common.ret, !dbg !15

assert_end40:                                     ; preds = %if_end36
  %118 = getelementptr inbounds nuw i8, ptr %var_B, i64 8, !dbg !15
  %119 = load i32, ptr %118, align 4, !dbg !15
  %120 = icmp eq i32 %119, 1, !dbg !15
  br i1 %120, label %assert_end42, label %assert_fail41, !dbg !15, !prof !16

assert_fail41:                                    ; preds = %assert_end40
  %121 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %121(ptr nonnull @.str.1, ptr nonnull @.str.21), !dbg !15
  br label %common.ret, !dbg !15

assert_end42:                                     ; preds = %assert_end40
  %122 = getelementptr inbounds nuw i8, ptr %var_B, i64 12, !dbg !15
  %123 = load i32, ptr %122, align 4, !dbg !15
  %124 = icmp eq i32 %dev_id, %123, !dbg !15
  br i1 %124, label %assert_end44, label %assert_fail43, !dbg !15, !prof !16

assert_fail43:                                    ; preds = %assert_end42
  %125 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %125(ptr nonnull @.str.1, ptr nonnull @.str.22), !dbg !15
  br label %common.ret, !dbg !15

assert_end44:                                     ; preds = %assert_end42
  %126 = icmp ne ptr %B, null, !dbg !15
  %127 = mul nsw i32 %N, %K, !dbg !15
  %128 = icmp eq i32 %127, 0, !dbg !15
  %129 = or i1 %128, %126, !dbg !15
  br i1 %129, label %assert_end46, label %assert_fail45, !dbg !15, !prof !16

assert_fail45:                                    ; preds = %assert_end44
  %130 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %130(ptr nonnull @.str.1, ptr nonnull @.str.23), !dbg !15
  br label %common.ret, !dbg !15

assert_end46:                                     ; preds = %assert_end44
  %131 = getelementptr inbounds nuw i8, ptr %var_T_matmul_NT, i64 22, !dbg !15
  %132 = load i16, ptr %131, align 2, !dbg !15
  %133 = icmp eq i16 %132, 1, !dbg !15
  %134 = getelementptr inbounds nuw i8, ptr %var_T_matmul_NT, i64 21, !dbg !15
  %135 = load i8, ptr %134, align 1, !dbg !15
  %136 = icmp eq i8 %135, 32, !dbg !15
  %137 = getelementptr inbounds nuw i8, ptr %var_T_matmul_NT, i64 20, !dbg !15
  %138 = load i8, ptr %137, align 1, !dbg !15
  %139 = icmp eq i8 %138, 2, !dbg !15
  %140 = and i1 %136, %139, !dbg !15
  %141 = and i1 %133, %140, !dbg !15
  br i1 %141, label %assert_end48, label %assert_fail47, !dbg !15, !prof !16

assert_fail47:                                    ; preds = %assert_end46
  %142 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %142(ptr nonnull @.str.1, ptr nonnull @.str.24), !dbg !15
  br label %common.ret, !dbg !15

assert_end48:                                     ; preds = %assert_end46
  %143 = load i64, ptr %gemm.var_T_matmul_NT.shape, align 8, !dbg !15, !tbaa !92
  %144 = trunc i64 %143 to i32, !dbg !15
  %145 = icmp eq i32 %M, %144, !dbg !15
  br i1 %145, label %assert_end50, label %assert_fail49, !dbg !15, !prof !16

assert_fail49:                                    ; preds = %assert_end48
  %146 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %146(ptr nonnull @.str.1, ptr nonnull @.str.25), !dbg !15
  br label %common.ret, !dbg !15

assert_end50:                                     ; preds = %assert_end48
  %147 = getelementptr inbounds nuw i8, ptr %gemm.var_T_matmul_NT.shape, i64 8, !dbg !15
  %148 = load i64, ptr %147, align 8, !dbg !15, !tbaa !102
  %149 = trunc i64 %148 to i32, !dbg !15
  %150 = icmp eq i32 %K, %149, !dbg !15
  br i1 %150, label %assert_end52, label %assert_fail51, !dbg !15, !prof !16

assert_fail51:                                    ; preds = %assert_end50
  %151 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %151(ptr nonnull @.str.1, ptr nonnull @.str.26), !dbg !15
  br label %common.ret, !dbg !15

assert_end52:                                     ; preds = %assert_end50
  %.not72 = icmp eq ptr %gemm.var_T_matmul_NT.strides, null, !dbg !15
  br i1 %.not72, label %if_end54, label %if_then53, !dbg !15, !prof !20

if_then53:                                        ; preds = %assert_end52
  %152 = load i64, ptr %gemm.var_T_matmul_NT.strides, align 8, !dbg !15, !tbaa !104
  %153 = trunc i64 %152 to i32, !dbg !15
  %154 = icmp eq i32 %K, %153, !dbg !15
  %155 = icmp eq i32 %M, 1, !dbg !15
  %156 = or i1 %155, %154, !dbg !15
  %157 = getelementptr inbounds nuw i8, ptr %gemm.var_T_matmul_NT.strides, i64 8, !dbg !15
  %158 = load i64, ptr %157, align 8, !dbg !15, !tbaa !114
  %159 = and i64 %158, 4294967295, !dbg !15
  %160 = icmp eq i64 %159, 1, !dbg !15
  %161 = icmp eq i32 %K, 1, !dbg !15
  %162 = or i1 %161, %160, !dbg !15
  %163 = and i1 %156, %162, !dbg !15
  br i1 %163, label %if_end54, label %assert_fail55, !dbg !15, !prof !16

if_end54:                                         ; preds = %if_then53, %assert_end52
  %164 = getelementptr inbounds nuw i8, ptr %var_T_matmul_NT, i64 40, !dbg !15
  %165 = load i64, ptr %164, align 8, !dbg !15
  %166 = icmp eq i64 %165, 0, !dbg !15
  br i1 %166, label %assert_end58, label %assert_fail57, !dbg !15, !prof !16

assert_fail55:                                    ; preds = %if_then53
  %167 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %167(ptr nonnull @.str.1, ptr nonnull @.str.27), !dbg !15
  br label %common.ret, !dbg !15

assert_fail57:                                    ; preds = %if_end54
  %168 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %168(ptr nonnull @.str.1, ptr nonnull @.str.28), !dbg !15
  br label %common.ret, !dbg !15

assert_end58:                                     ; preds = %if_end54
  %169 = getelementptr inbounds nuw i8, ptr %var_T_matmul_NT, i64 8, !dbg !15
  %170 = load i32, ptr %169, align 4, !dbg !15
  %171 = icmp eq i32 %170, 1, !dbg !15
  br i1 %171, label %assert_end60, label %assert_fail59, !dbg !15, !prof !16

assert_fail59:                                    ; preds = %assert_end58
  %172 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %172(ptr nonnull @.str.1, ptr nonnull @.str.29), !dbg !15
  br label %common.ret, !dbg !15

assert_end60:                                     ; preds = %assert_end58
  %173 = getelementptr inbounds nuw i8, ptr %var_T_matmul_NT, i64 12, !dbg !15
  %174 = load i32, ptr %173, align 4, !dbg !15
  %175 = icmp eq i32 %dev_id, %174, !dbg !15
  br i1 %175, label %assert_end62, label %assert_fail61, !dbg !15, !prof !16

assert_fail61:                                    ; preds = %assert_end60
  %176 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %176(ptr nonnull @.str.1, ptr nonnull @.str.30), !dbg !15
  br label %common.ret, !dbg !15

assert_end62:                                     ; preds = %assert_end60
  %177 = icmp ne ptr %T_matmul_NT, null, !dbg !15
  %178 = or i1 %82, %177, !dbg !15
  br i1 %178, label %assert_end64, label %assert_fail63, !dbg !15, !prof !16

assert_fail63:                                    ; preds = %assert_end62
  %179 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %179(ptr nonnull @.str.1, ptr nonnull @.str.31), !dbg !15
  br label %common.ret, !dbg !15

assert_end64:                                     ; preds = %assert_end62
  tail call fastcc void @gemm_compute_(i32 %M, i32 %K, ptr %T_matmul_NT, ptr %A, ptr %B, i32 %N), !dbg !15
  br label %common.ret, !dbg !15
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define internal fastcc void @gemm_compute_(i32 %M, i32 %K, ptr noalias nocapture writeonly align 64 %T_matmul_NT, ptr noalias nocapture readonly align 64 %A, ptr noalias nocapture readonly align 64 %B, i32 %N) unnamed_addr #2 !dbg !116 {
entry:
    #dbg_value(i32 %M, !120, !DIExpression(), !126)
    #dbg_value(i32 %K, !121, !DIExpression(), !126)
    #dbg_value(ptr %T_matmul_NT, !122, !DIExpression(), !126)
    #dbg_value(ptr %A, !123, !DIExpression(), !126)
    #dbg_value(ptr %B, !124, !DIExpression(), !126)
    #dbg_value(i32 %N, !125, !DIExpression(), !126)
    #dbg_declare(i32 0, !127, !DIExpression(), !126)
  %0 = icmp sgt i32 %M, 0, !dbg !126
  %1 = icmp sgt i32 %K, 0
  %or.cond = select i1 %0, i1 %1, i1 false, !dbg !126
  br i1 %or.cond, label %for_begin_i1.preheader.us.preheader, label %for_end_i0, !dbg !126, !prof !128

for_begin_i1.preheader.us.preheader:              ; preds = %entry
  %2 = sext i32 %N to i64, !dbg !126
  %3 = zext nneg i32 %K to i64, !dbg !126
  %wide.trip.count15 = zext nneg i32 %M to i64, !dbg !126
  %wide.trip.count10 = zext nneg i32 %K to i64
  %exitcond.peel.not = icmp eq i32 %K, 1
  %4 = add nsw i64 %3, -1, !dbg !126
  %xtraiter = and i64 %4, 3
  %5 = add nsw i32 %K, -2
  %6 = icmp ult i32 %5, 3
  %unroll_iter = and i64 %4, -4
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br label %for_begin_i1.preheader.us, !dbg !126

for_begin_i1.preheader.us:                        ; preds = %for_begin_i1.preheader.us.preheader, %for_begin_i1.for_end_i1_crit_edge.split.us.us
  %indvars.iv12 = phi i64 [ 0, %for_begin_i1.preheader.us.preheader ], [ %indvars.iv.next13, %for_begin_i1.for_end_i1_crit_edge.split.us.us ]
    #dbg_declare(i64 %indvars.iv12, !127, !DIExpression(), !126)
    #dbg_declare(i32 0, !129, !DIExpression(), !126)
  %7 = mul nuw nsw i64 %indvars.iv12, %3
  %invariant.gep19 = getelementptr inbounds nuw float, ptr %T_matmul_NT, i64 %7, !dbg !126
  %8 = getelementptr inbounds nuw float, ptr %A, i64 %7
  %9 = load float, ptr %8, align 4, !tbaa !130
  %invariant.gep = getelementptr inbounds nuw float, ptr %A, i64 %7
  br label %if_end.us.us.peel, !dbg !126

if_end.us.us.peel:                                ; preds = %for_begin_k.for_end_k_crit_edge.us.us, %for_begin_i1.preheader.us
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %for_begin_k.for_end_k_crit_edge.us.us ], [ 0, %for_begin_i1.preheader.us ]
    #dbg_declare(i64 %indvars.iv7, !129, !DIExpression(), !126)
    #dbg_declare(i32 0, !132, !DIExpression(), !126)
  %gep20 = getelementptr inbounds nuw float, ptr %invariant.gep19, i64 %indvars.iv7
  %10 = mul nsw i64 %indvars.iv7, %2
    #dbg_declare(i64 0, !132, !DIExpression(), !126)
  %11 = getelementptr inbounds float, ptr %B, i64 %10, !dbg !126
  %12 = load float, ptr %11, align 4, !dbg !126, !tbaa !133
  %13 = tail call float @llvm.fmuladd.f32(float %9, float %12, float 0.000000e+00), !dbg !126
  store float %13, ptr %gep20, align 4, !dbg !126, !tbaa !135
    #dbg_declare(i64 1, !132, !DIExpression(), !126)
  br i1 %exitcond.peel.not, label %for_begin_k.for_end_k_crit_edge.us.us, label %for_body_k.us.us.peel.next, !dbg !126, !prof !137

for_body_k.us.us.peel.next:                       ; preds = %if_end.us.us.peel
  %invariant.gep17 = getelementptr float, ptr %B, i64 %10, !dbg !126
  br i1 %6, label %for_begin_k.for_end_k_crit_edge.us.us.loopexit.unr-lcssa, label %if_end.us.us, !dbg !126, !prof !138

if_end.us.us:                                     ; preds = %for_body_k.us.us.peel.next, %if_end.us.us
  %14 = phi float [ %26, %if_end.us.us ], [ %13, %for_body_k.us.us.peel.next ]
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %if_end.us.us ], [ 1, %for_body_k.us.us.peel.next ]
  %niter = phi i64 [ %niter.next.3, %if_end.us.us ], [ 0, %for_body_k.us.us.peel.next ]
    #dbg_declare(i64 %indvars.iv, !132, !DIExpression(), !126)
  %gep = getelementptr inbounds nuw float, ptr %invariant.gep, i64 %indvars.iv, !dbg !126
  %15 = load float, ptr %gep, align 4, !dbg !126, !tbaa !130
  %gep18 = getelementptr float, ptr %invariant.gep17, i64 %indvars.iv, !dbg !126
  %16 = load float, ptr %gep18, align 4, !dbg !126, !tbaa !133
  %17 = tail call float @llvm.fmuladd.f32(float %15, float %16, float %14), !dbg !126
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !126
    #dbg_declare(i64 %indvars.iv.next, !132, !DIExpression(), !126)
    #dbg_declare(i64 %indvars.iv.next, !132, !DIExpression(), !126)
  %gep.1 = getelementptr inbounds nuw float, ptr %invariant.gep, i64 %indvars.iv.next, !dbg !126
  %18 = load float, ptr %gep.1, align 4, !dbg !126, !tbaa !130
  %gep18.1 = getelementptr float, ptr %invariant.gep17, i64 %indvars.iv.next, !dbg !126
  %19 = load float, ptr %gep18.1, align 4, !dbg !126, !tbaa !133
  %20 = tail call float @llvm.fmuladd.f32(float %18, float %19, float %17), !dbg !126
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2, !dbg !126
    #dbg_declare(i64 %indvars.iv.next.1, !132, !DIExpression(), !126)
    #dbg_declare(i64 %indvars.iv.next.1, !132, !DIExpression(), !126)
  %gep.2 = getelementptr inbounds nuw float, ptr %invariant.gep, i64 %indvars.iv.next.1, !dbg !126
  %21 = load float, ptr %gep.2, align 4, !dbg !126, !tbaa !130
  %gep18.2 = getelementptr float, ptr %invariant.gep17, i64 %indvars.iv.next.1, !dbg !126
  %22 = load float, ptr %gep18.2, align 4, !dbg !126, !tbaa !133
  %23 = tail call float @llvm.fmuladd.f32(float %21, float %22, float %20), !dbg !126
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3, !dbg !126
    #dbg_declare(i64 %indvars.iv.next.2, !132, !DIExpression(), !126)
    #dbg_declare(i64 %indvars.iv.next.2, !132, !DIExpression(), !126)
  %gep.3 = getelementptr inbounds nuw float, ptr %invariant.gep, i64 %indvars.iv.next.2, !dbg !126
  %24 = load float, ptr %gep.3, align 4, !dbg !126, !tbaa !130
  %gep18.3 = getelementptr float, ptr %invariant.gep17, i64 %indvars.iv.next.2, !dbg !126
  %25 = load float, ptr %gep18.3, align 4, !dbg !126, !tbaa !133
  %26 = tail call float @llvm.fmuladd.f32(float %24, float %25, float %23), !dbg !126
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4, !dbg !126
    #dbg_declare(i64 %indvars.iv.next.3, !132, !DIExpression(), !126)
  %niter.next.3 = add i64 %niter, 4, !dbg !126
  %niter.ncmp.3 = icmp eq i64 %niter.next.3, %unroll_iter, !dbg !126
  br i1 %niter.ncmp.3, label %for_begin_k.for_end_k_crit_edge.us.us.loopexit.unr-lcssa, label %if_end.us.us, !dbg !126, !prof !139, !llvm.loop !140

for_begin_k.for_end_k_crit_edge.us.us.loopexit.unr-lcssa: ; preds = %if_end.us.us, %for_body_k.us.us.peel.next
  %.lcssa.ph = phi float [ poison, %for_body_k.us.us.peel.next ], [ %26, %if_end.us.us ]
  %.unr = phi float [ %13, %for_body_k.us.us.peel.next ], [ %26, %if_end.us.us ]
  %indvars.iv.unr = phi i64 [ 1, %for_body_k.us.us.peel.next ], [ %indvars.iv.next.3, %if_end.us.us ]
  br i1 %lcmp.mod.not, label %for_begin_k.for_end_k_crit_edge.us.us.loopexit, label %if_end.us.us.epil, !dbg !126, !prof !142

if_end.us.us.epil:                                ; preds = %for_begin_k.for_end_k_crit_edge.us.us.loopexit.unr-lcssa, %if_end.us.us.epil
  %27 = phi float [ %30, %if_end.us.us.epil ], [ %.unr, %for_begin_k.for_end_k_crit_edge.us.us.loopexit.unr-lcssa ]
  %indvars.iv.epil = phi i64 [ %indvars.iv.next.epil, %if_end.us.us.epil ], [ %indvars.iv.unr, %for_begin_k.for_end_k_crit_edge.us.us.loopexit.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.next, %if_end.us.us.epil ], [ 0, %for_begin_k.for_end_k_crit_edge.us.us.loopexit.unr-lcssa ]
    #dbg_declare(i64 %indvars.iv.epil, !132, !DIExpression(), !126)
  %gep.epil = getelementptr inbounds nuw float, ptr %invariant.gep, i64 %indvars.iv.epil, !dbg !126
  %28 = load float, ptr %gep.epil, align 4, !dbg !126, !tbaa !130
  %gep18.epil = getelementptr float, ptr %invariant.gep17, i64 %indvars.iv.epil, !dbg !126
  %29 = load float, ptr %gep18.epil, align 4, !dbg !126, !tbaa !133
  %30 = tail call float @llvm.fmuladd.f32(float %28, float %29, float %27), !dbg !126
  %indvars.iv.next.epil = add nuw nsw i64 %indvars.iv.epil, 1, !dbg !126
    #dbg_declare(i64 %indvars.iv.next.epil, !132, !DIExpression(), !126)
  %epil.iter.next = add i64 %epil.iter, 1, !dbg !126
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.next, %xtraiter, !dbg !126
  br i1 %epil.iter.cmp.not, label %for_begin_k.for_end_k_crit_edge.us.us.loopexit, label %if_end.us.us.epil, !dbg !126, !prof !143, !llvm.loop !144

for_begin_k.for_end_k_crit_edge.us.us.loopexit:   ; preds = %if_end.us.us.epil, %for_begin_k.for_end_k_crit_edge.us.us.loopexit.unr-lcssa
  %.lcssa = phi float [ %.lcssa.ph, %for_begin_k.for_end_k_crit_edge.us.us.loopexit.unr-lcssa ], [ %30, %if_end.us.us.epil ], !dbg !126
  store float %.lcssa, ptr %gep20, align 4, !dbg !126, !tbaa !135
  br label %for_begin_k.for_end_k_crit_edge.us.us, !dbg !126

for_begin_k.for_end_k_crit_edge.us.us:            ; preds = %for_begin_k.for_end_k_crit_edge.us.us.loopexit, %if_end.us.us.peel
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !126
    #dbg_declare(i64 %indvars.iv.next8, !129, !DIExpression(), !126)
  %exitcond11.not = icmp eq i64 %indvars.iv.next8, %wide.trip.count10, !dbg !126
  br i1 %exitcond11.not, label %for_begin_i1.for_end_i1_crit_edge.split.us.us, label %if_end.us.us.peel, !dbg !126, !prof !137

for_begin_i1.for_end_i1_crit_edge.split.us.us:    ; preds = %for_begin_k.for_end_k_crit_edge.us.us
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1, !dbg !126
    #dbg_declare(i64 %indvars.iv.next13, !127, !DIExpression(), !126)
  %exitcond16.not = icmp eq i64 %indvars.iv.next13, %wide.trip.count15, !dbg !126
  br i1 %exitcond16.not, label %for_end_i0, label %for_begin_i1.preheader.us, !dbg !126, !prof !137

for_end_i0:                                       ; preds = %for_begin_i1.for_end_i1_crit_edge.split.us.us, %entry
  ret void, !dbg !126
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
  %v9 = icmp samesign ugt i32 %v8, 4096
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
  %v15 = icmp samesign ugt i32 %v1, 2139095040
  br i1 %v15, label %b6, label %b7

b6:                                               ; preds = %b5
  %v16 = lshr i32 %v0, 13
  %v17 = and i32 %v16, 511
  %v18 = or disjoint i32 %v17, 32256
  br label %b13

b7:                                               ; preds = %b5
  %v19 = icmp samesign ugt i32 %v1, 1199570943
  br i1 %v19, label %b13, label %b8

b8:                                               ; preds = %b7
  %v20 = icmp samesign ult i32 %v1, 754974720
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
  %v33 = icmp samesign ugt i32 %v32, 4096
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
  %v7 = icmp samesign ugt i16 %v1, 31743
  br i1 %v7, label %b3, label %b4

b3:                                               ; preds = %b2
  %v8 = shl nuw nsw i32 %v2, 13
  %v9 = or i32 %v8, 2139095040
  br label %b6

b4:                                               ; preds = %b2
  %v10 = icmp eq i16 %v1, 0
  br i1 %v10, label %b6, label %b5

b5:                                               ; preds = %b4
  %v11 = icmp samesign ult i16 %v1, 256
  %v12 = lshr i32 %v2, 8
  %v13 = select i1 %v11, i32 %v2, i32 %v12
  %v14 = select i1 %v11, i32 32, i32 24
  %v15 = icmp samesign ult i32 %v13, 16
  %v16 = lshr i32 %v13, 4
  %v17 = add nsw i32 %v14, -4
  %v18 = select i1 %v15, i32 %v13, i32 %v16
  %v19 = select i1 %v15, i32 %v14, i32 %v17
  %v20 = icmp samesign ult i32 %v18, 4
  %v21 = lshr i32 %v18, 2
  %v22 = add nsw i32 %v19, -2
  %v23 = select i1 %v20, i32 %v18, i32 %v21
  %v24 = select i1 %v20, i32 %v19, i32 %v22
  %v25 = icmp samesign ult i32 %v23, 2
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

attributes #0 = { "target-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #2 = { nofree noinline norecurse nosync nounwind memory(argmem: readwrite) "target-cpu"="generic" }
attributes #3 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nofree nosync nounwind memory(none) "target-cpu"="generic" "target-features" }
attributes #5 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "TVM", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "IRModule.CodeGenLLVM", directory: ".")
!2 = !{i32 2, !"tvm_target", !"llvm -mtriple=x86_64-unknown-linux-gnu"}
!3 = !{i32 4, !"Debug Info Version", i32 3}
!4 = !{i32 4, !"Dwarf Version", i32 4}
!5 = distinct !DISubprogram(name: "gemm", scope: !1, file: !1, type: !6, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !10)
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
!22 = !DILocalVariable(name: "var_B.type_index", scope: !5, file: !1, type: !8)
!23 = !DILocalVariable(name: "var_T_matmul_NT.type_index", scope: !5, file: !1, type: !8)
!24 = !DILocalVariable(name: "var_A", scope: !5, file: !1, type: !9)
!25 = !DILocalVariable(name: "var_B", scope: !5, file: !1, type: !9)
!26 = !DILocalVariable(name: "var_T_matmul_NT", scope: !5, file: !1, type: !9)
!27 = !DILocalVariable(name: "gemm.var_A.shape", scope: !5, file: !1, type: !28)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29)
!29 = !DIBasicType(name: "int64", size: 64, encoding: DW_ATE_signed)
!30 = !{!31, !31, i64 0}
!31 = !{!"0x6528911e8450.w8.b0", !32, i64 0}
!32 = !{!"0x6528911e8450.w16.b0", !33, i64 0}
!33 = !{!"0x6528911e8450.w32.b0", !34, i64 0}
!34 = !{!"0x6528911e8450.w64.b0", !35, i64 0}
!35 = !{!"0x6528911e8450.w128.b0", !36, i64 0}
!36 = !{!"0x6528911e8450.w256.b0", !37, i64 0}
!37 = !{!"0x6528911e8450.w512.b0", !38, i64 0}
!38 = !{!"0x6528911e8450.w1024.b0", !39, i64 0}
!39 = !{!"0x6528911e8450", !19, i64 0}
!40 = !DILocalVariable(name: "M", scope: !5, file: !1, type: !8)
!41 = !{!42, !42, i64 0}
!42 = !{!"0x6528911e8450.w8.b8", !32, i64 0}
!43 = !DILocalVariable(name: "K", scope: !5, file: !1, type: !8)
!44 = !DILocalVariable(name: "gemm.var_A.strides", scope: !5, file: !1, type: !28)
!45 = !DILocalVariable(name: "dev_id", scope: !5, file: !1, type: !8)
!46 = !DILocalVariable(name: "A", scope: !5, file: !1, type: !47)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48)
!48 = !DIBasicType(name: "float32", size: 32, encoding: DW_ATE_float)
!49 = !DILocalVariable(name: "gemm.var_B.shape", scope: !5, file: !1, type: !28)
!50 = !{!51, !51, i64 0}
!51 = !{!"0x652891213800.w8.b8", !52, i64 0}
!52 = !{!"0x652891213800.w16.b0", !53, i64 0}
!53 = !{!"0x652891213800.w32.b0", !54, i64 0}
!54 = !{!"0x652891213800.w64.b0", !55, i64 0}
!55 = !{!"0x652891213800.w128.b0", !56, i64 0}
!56 = !{!"0x652891213800.w256.b0", !57, i64 0}
!57 = !{!"0x652891213800.w512.b0", !58, i64 0}
!58 = !{!"0x652891213800.w1024.b0", !59, i64 0}
!59 = !{!"0x652891213800", !19, i64 0}
!60 = !DILocalVariable(name: "N", scope: !5, file: !1, type: !8)
!61 = !DILocalVariable(name: "gemm.var_B.strides", scope: !5, file: !1, type: !28)
!62 = !DILocalVariable(name: "B", scope: !5, file: !1, type: !47)
!63 = !DILocalVariable(name: "gemm.var_T_matmul_NT.shape", scope: !5, file: !1, type: !28)
!64 = !DILocalVariable(name: "gemm.var_T_matmul_NT.strides", scope: !5, file: !1, type: !28)
!65 = !DILocalVariable(name: "T_matmul_NT", scope: !5, file: !1, type: !47)
!66 = !{!67, !67, i64 0}
!67 = !{!"0x652891140890.w8.b0", !68, i64 0}
!68 = !{!"0x652891140890.w16.b0", !69, i64 0}
!69 = !{!"0x652891140890.w32.b0", !70, i64 0}
!70 = !{!"0x652891140890.w64.b0", !71, i64 0}
!71 = !{!"0x652891140890.w128.b0", !72, i64 0}
!72 = !{!"0x652891140890.w256.b0", !73, i64 0}
!73 = !{!"0x652891140890.w512.b0", !74, i64 0}
!74 = !{!"0x652891140890.w1024.b0", !75, i64 0}
!75 = !{!"0x652891140890", !19, i64 0}
!76 = !{!77, !77, i64 0}
!77 = !{!"0x652891140890.w8.b8", !68, i64 0}
!78 = !{!79, !79, i64 0}
!79 = !{!"0x652891213800.w8.b0", !52, i64 0}
!80 = !{!81, !81, i64 0}
!81 = !{!"0x65289131dc80.w8.b0", !82, i64 0}
!82 = !{!"0x65289131dc80.w16.b0", !83, i64 0}
!83 = !{!"0x65289131dc80.w32.b0", !84, i64 0}
!84 = !{!"0x65289131dc80.w64.b0", !85, i64 0}
!85 = !{!"0x65289131dc80.w128.b0", !86, i64 0}
!86 = !{!"0x65289131dc80.w256.b0", !87, i64 0}
!87 = !{!"0x65289131dc80.w512.b0", !88, i64 0}
!88 = !{!"0x65289131dc80.w1024.b0", !89, i64 0}
!89 = !{!"0x65289131dc80", !19, i64 0}
!90 = !{!91, !91, i64 0}
!91 = !{!"0x65289131dc80.w8.b8", !82, i64 0}
!92 = !{!93, !93, i64 0}
!93 = !{!"0x6528912bdb00.w8.b0", !94, i64 0}
!94 = !{!"0x6528912bdb00.w16.b0", !95, i64 0}
!95 = !{!"0x6528912bdb00.w32.b0", !96, i64 0}
!96 = !{!"0x6528912bdb00.w64.b0", !97, i64 0}
!97 = !{!"0x6528912bdb00.w128.b0", !98, i64 0}
!98 = !{!"0x6528912bdb00.w256.b0", !99, i64 0}
!99 = !{!"0x6528912bdb00.w512.b0", !100, i64 0}
!100 = !{!"0x6528912bdb00.w1024.b0", !101, i64 0}
!101 = !{!"0x6528912bdb00", !19, i64 0}
!102 = !{!103, !103, i64 0}
!103 = !{!"0x6528912bdb00.w8.b8", !94, i64 0}
!104 = !{!105, !105, i64 0}
!105 = !{!"0x6528912f2de0.w8.b0", !106, i64 0}
!106 = !{!"0x6528912f2de0.w16.b0", !107, i64 0}
!107 = !{!"0x6528912f2de0.w32.b0", !108, i64 0}
!108 = !{!"0x6528912f2de0.w64.b0", !109, i64 0}
!109 = !{!"0x6528912f2de0.w128.b0", !110, i64 0}
!110 = !{!"0x6528912f2de0.w256.b0", !111, i64 0}
!111 = !{!"0x6528912f2de0.w512.b0", !112, i64 0}
!112 = !{!"0x6528912f2de0.w1024.b0", !113, i64 0}
!113 = !{!"0x6528912f2de0", !19, i64 0}
!114 = !{!115, !115, i64 0}
!115 = !{!"0x6528912f2de0.w8.b8", !106, i64 0}
!116 = distinct !DISubprogram(name: "gemm_compute_", scope: !1, file: !1, type: !117, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !119)
!117 = !DISubroutineType(cc: DW_CC_nocall, types: !118)
!118 = !{!8, !8, !8, !47, !47, !47, !8}
!119 = !{!120, !121, !122, !123, !124, !125}
!120 = !DILocalVariable(name: "M", arg: 1, scope: !116, file: !1, type: !8)
!121 = !DILocalVariable(name: "K", arg: 2, scope: !116, file: !1, type: !8)
!122 = !DILocalVariable(name: "T_matmul_NT", arg: 3, scope: !116, file: !1, type: !47)
!123 = !DILocalVariable(name: "A", arg: 4, scope: !116, file: !1, type: !47)
!124 = !DILocalVariable(name: "B", arg: 5, scope: !116, file: !1, type: !47)
!125 = !DILocalVariable(name: "N", arg: 6, scope: !116, file: !1, type: !8)
!126 = !DILocation(line: 0, scope: !116)
!127 = !DILocalVariable(name: "i0", scope: !116, file: !1, type: !8)
!128 = !{!"branch_weights", i32 16129, i32 255}
!129 = !DILocalVariable(name: "i1", scope: !116, file: !1, type: !8)
!130 = !{!131, !131, i64 0}
!131 = !{!"0x6528911f6770", !19, i64 0}
!132 = !DILocalVariable(name: "k", scope: !116, file: !1, type: !8)
!133 = !{!134, !134, i64 0}
!134 = !{!"0x652891046800", !19, i64 0}
!135 = !{!136, !136, i64 0}
!136 = !{!"0x652890ecf730", !19, i64 0}
!137 = !{!"branch_weights", i32 127, i32 134217601}
!138 = !{!"branch_weights", i32 1, i32 127}
!139 = !{!"branch_weights", i32 127, i32 33554289}
!140 = distinct !{!140, !141}
!141 = !{!"llvm.loop.peeled.count", i32 1}
!142 = !{!"branch_weights", i32 3, i32 1}
!143 = !{!"branch_weights", i32 1, i32 1}
!144 = distinct !{!144, !145}
!145 = !{!"llvm.loop.unroll.disable"}
