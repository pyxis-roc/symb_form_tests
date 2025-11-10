; ModuleID = 'TVMMod'
source_filename = "TVMMod"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__TVMFFIErrorSetRaisedFromCStr = linkonce dllexport local_unnamed_addr global ptr null, align 8
@.str = private constant [54 x i8] c"Assert fail: num_args == 3, add: num_args should be 3\00", align 1
@.str.1 = private constant [13 x i8] c"RuntimeError\00", align 1
@.str.2 = private constant [62 x i8] c"Assert fail: not T.isnullptr(args), add: args pointer is NULL\00", align 1
@.str.3 = private constant [145 x i8] c"Assert fail: var_A_type_index == 0 or var_A_type_index == 4 or var_A_type_index == 7 or var_A_type_index >= 64, add: Expect arg[0] to be pointer\00", align 1
@.str.4 = private constant [145 x i8] c"Assert fail: var_B_type_index == 0 or var_B_type_index == 4 or var_B_type_index == 7 or var_B_type_index >= 64, add: Expect arg[1] to be pointer\00", align 1
@.str.5 = private constant [161 x i8] c"Assert fail: var_T_add_type_index == 0 or var_T_add_type_index == 4 or var_T_add_type_index == 7 or var_T_add_type_index >= 64, add: Expect arg[2] to be pointer\00", align 1
@.str.6 = private constant [94 x i8] c"Assert fail: not T.isnullptr(var_A), add.var_A is expected to have non-NULL DLTensor* pointer\00", align 1
@.str.7 = private constant [96 x i8] c"Assert fail: 2 == T.tvm_struct_get(var_A, 0, 4, \22int32\22), add.var_A.ndim is expected to equal 2\00", align 1
@.str.8 = private constant [94 x i8] c"Assert fail: not T.isnullptr(var_B), add.var_B is expected to have non-NULL DLTensor* pointer\00", align 1
@.str.9 = private constant [96 x i8] c"Assert fail: 2 == T.tvm_struct_get(var_B, 0, 4, \22int32\22), add.var_B.ndim is expected to equal 2\00", align 1
@.str.10 = private constant [102 x i8] c"Assert fail: not T.isnullptr(var_T_add), add.var_T_add is expected to have non-NULL DLTensor* pointer\00", align 1
@.str.11 = private constant [104 x i8] c"Assert fail: 2 == T.tvm_struct_get(var_T_add, 0, 4, \22int32\22), add.var_T_add.ndim is expected to equal 2\00", align 1
@.str.12 = private constant [226 x i8] c"Assert fail: T.tvm_struct_get(var_A, 0, 5, \22uint8\22) == T.uint8(2) and T.tvm_struct_get(var_A, 0, 6, \22uint8\22) == T.uint8(32) and T.tvm_struct_get(var_A, 0, 7, \22uint16\22) == T.uint16(1), add.var_A.dtype is expected to be float32\00", align 1
@.str.13 = private constant [176 x i8] c"Assert fail: (N == 1 or 1 == T.Cast(\22int32\22, add_var_A_strides[1])) and (M == 1 or N == T.Cast(\22int32\22, add_var_A_strides[0])), add.var_A.strides: expected to be compact array\00", align 1
@.str.14 = private constant [186 x i8] c"Assert fail: T.uint64(0) == T.tvm_struct_get(var_A, 0, 8, \22uint64\22), Argument add.var_A.byte_offset has an unsatisfied constraint: T.uint64(0) == T.tvm_struct_get(var_A, 0, 8, \22uint64\22)\00", align 1
@.str.15 = private constant [166 x i8] c"Assert fail: T.tvm_struct_get(var_A, 0, 10, \22int32\22) == 1, Argument add.var_A.device_type has an unsatisfied constraint: 1 == T.tvm_struct_get(var_A, 0, 10, \22int32\22)\00", align 1
@.str.16 = private constant [99 x i8] c"Assert fail: M * N == 0 or not T.isnullptr(A), add.var_A is expected to have non-NULL data pointer\00", align 1
@.str.17 = private constant [226 x i8] c"Assert fail: T.tvm_struct_get(var_B, 0, 5, \22uint8\22) == T.uint8(2) and T.tvm_struct_get(var_B, 0, 6, \22uint8\22) == T.uint8(32) and T.tvm_struct_get(var_B, 0, 7, \22uint16\22) == T.uint16(1), add.var_B.dtype is expected to be float32\00", align 1
@.str.18 = private constant [155 x i8] c"Assert fail: M == T.Cast(\22int32\22, add_var_B_shape[0]), Argument add.var_B.shape[0] has an unsatisfied constraint: M == T.Cast(\22int32\22, add_var_B_shape[0])\00", align 1
@.str.19 = private constant [155 x i8] c"Assert fail: N == T.Cast(\22int32\22, add_var_B_shape[1]), Argument add.var_B.shape[1] has an unsatisfied constraint: N == T.Cast(\22int32\22, add_var_B_shape[1])\00", align 1
@.str.20 = private constant [176 x i8] c"Assert fail: (N == 1 or 1 == T.Cast(\22int32\22, add_var_B_strides[1])) and (M == 1 or N == T.Cast(\22int32\22, add_var_B_strides[0])), add.var_B.strides: expected to be compact array\00", align 1
@.str.21 = private constant [186 x i8] c"Assert fail: T.uint64(0) == T.tvm_struct_get(var_B, 0, 8, \22uint64\22), Argument add.var_B.byte_offset has an unsatisfied constraint: T.uint64(0) == T.tvm_struct_get(var_B, 0, 8, \22uint64\22)\00", align 1
@.str.22 = private constant [166 x i8] c"Assert fail: T.tvm_struct_get(var_B, 0, 10, \22int32\22) == 1, Argument add.var_B.device_type has an unsatisfied constraint: 1 == T.tvm_struct_get(var_B, 0, 10, \22int32\22)\00", align 1
@.str.23 = private constant [172 x i8] c"Assert fail: dev_id == T.tvm_struct_get(var_B, 0, 9, \22int32\22), Argument add.var_B.device_id has an unsatisfied constraint: dev_id == T.tvm_struct_get(var_B, 0, 9, \22int32\22)\00", align 1
@.str.24 = private constant [99 x i8] c"Assert fail: M * N == 0 or not T.isnullptr(B), add.var_B is expected to have non-NULL data pointer\00", align 1
@.str.25 = private constant [242 x i8] c"Assert fail: T.tvm_struct_get(var_T_add, 0, 5, \22uint8\22) == T.uint8(2) and T.tvm_struct_get(var_T_add, 0, 6, \22uint8\22) == T.uint8(32) and T.tvm_struct_get(var_T_add, 0, 7, \22uint16\22) == T.uint16(1), add.var_T_add.dtype is expected to be float32\00", align 1
@.str.26 = private constant [167 x i8] c"Assert fail: M == T.Cast(\22int32\22, add_var_T_add_shape[0]), Argument add.var_T_add.shape[0] has an unsatisfied constraint: M == T.Cast(\22int32\22, add_var_T_add_shape[0])\00", align 1
@.str.27 = private constant [167 x i8] c"Assert fail: N == T.Cast(\22int32\22, add_var_T_add_shape[1]), Argument add.var_T_add.shape[1] has an unsatisfied constraint: N == T.Cast(\22int32\22, add_var_T_add_shape[1])\00", align 1
@.str.28 = private constant [188 x i8] c"Assert fail: (N == 1 or 1 == T.Cast(\22int32\22, add_var_T_add_strides[1])) and (M == 1 or N == T.Cast(\22int32\22, add_var_T_add_strides[0])), add.var_T_add.strides: expected to be compact array\00", align 1
@.str.29 = private constant [198 x i8] c"Assert fail: T.uint64(0) == T.tvm_struct_get(var_T_add, 0, 8, \22uint64\22), Argument add.var_T_add.byte_offset has an unsatisfied constraint: T.uint64(0) == T.tvm_struct_get(var_T_add, 0, 8, \22uint64\22)\00", align 1
@.str.30 = private constant [178 x i8] c"Assert fail: T.tvm_struct_get(var_T_add, 0, 10, \22int32\22) == 1, Argument add.var_T_add.device_type has an unsatisfied constraint: 1 == T.tvm_struct_get(var_T_add, 0, 10, \22int32\22)\00", align 1
@.str.31 = private constant [184 x i8] c"Assert fail: dev_id == T.tvm_struct_get(var_T_add, 0, 9, \22int32\22), Argument add.var_T_add.device_id has an unsatisfied constraint: dev_id == T.tvm_struct_get(var_T_add, 0, 9, \22int32\22)\00", align 1
@.str.32 = private constant [107 x i8] c"Assert fail: M * N == 0 or not T.isnullptr(T_add), add.var_T_add is expected to have non-NULL data pointer\00", align 1
@__tvm_main__ = weak dllexport local_unnamed_addr constant [4 x i8] c"add\00", align 1
@llvm.global_ctors = appending global [0 x { i32, ptr, ptr }] zeroinitializer

define dllexport range(i32 -1, 1) i32 @add(ptr noalias nocapture readnone %self_handle, ptr noalias readonly %args, i32 %num_args, ptr noalias nocapture readnone %result) local_unnamed_addr #0 !dbg !5 {
entry:
    #dbg_value(ptr %self_handle, !11, !DIExpression(), !15)
    #dbg_value(ptr %args, !12, !DIExpression(), !15)
    #dbg_value(i32 %num_args, !13, !DIExpression(), !15)
    #dbg_value(ptr %result, !14, !DIExpression(), !15)
  %0 = icmp eq i32 %num_args, 3, !dbg !15
  br i1 %0, label %assert_end, label %assert_fail, !dbg !15, !prof !16

common.ret:                                       ; preds = %assert_end66, %assert_fail65, %assert_fail63, %assert_fail61, %assert_fail59, %assert_fail57, %assert_fail53, %assert_fail51, %assert_fail49, %assert_fail47, %assert_fail45, %assert_fail43, %assert_fail41, %assert_fail39, %assert_fail35, %assert_fail33, %assert_fail31, %assert_fail29, %assert_fail27, %assert_fail25, %assert_fail23, %assert_fail21, %assert_fail19, %assert_fail17, %assert_fail15, %assert_fail13, %assert_fail11, %assert_fail9, %assert_fail7, %assert_fail5, %assert_fail3, %assert_fail1, %assert_fail
  %common.ret.op = phi i32 [ -1, %assert_fail ], [ -1, %assert_fail1 ], [ -1, %assert_fail3 ], [ -1, %assert_fail5 ], [ -1, %assert_fail7 ], [ -1, %assert_fail9 ], [ -1, %assert_fail11 ], [ -1, %assert_fail13 ], [ -1, %assert_fail15 ], [ -1, %assert_fail17 ], [ -1, %assert_fail19 ], [ -1, %assert_fail21 ], [ -1, %assert_fail23 ], [ -1, %assert_fail25 ], [ -1, %assert_fail27 ], [ -1, %assert_fail29 ], [ -1, %assert_fail31 ], [ -1, %assert_fail33 ], [ -1, %assert_fail35 ], [ -1, %assert_fail39 ], [ -1, %assert_fail41 ], [ -1, %assert_fail43 ], [ -1, %assert_fail45 ], [ -1, %assert_fail47 ], [ -1, %assert_fail49 ], [ -1, %assert_fail51 ], [ -1, %assert_fail53 ], [ -1, %assert_fail57 ], [ -1, %assert_fail59 ], [ -1, %assert_fail61 ], [ -1, %assert_fail63 ], [ -1, %assert_fail65 ], [ 0, %assert_end66 ]
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
  br i1 %6, label %assert_end6, label %switch.early.test67, !dbg !15

switch.early.test67:                              ; preds = %assert_end4
  switch i32 %var_B.type_index.fr, label %assert_fail5 [
    i32 7, label %assert_end6
    i32 4, label %assert_end6
    i32 0, label %assert_end6
  ], !dbg !15

assert_fail5:                                     ; preds = %switch.early.test67
  %7 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %7(ptr nonnull @.str.1, ptr nonnull @.str.4), !dbg !15
  br label %common.ret, !dbg !15

assert_end6:                                      ; preds = %switch.early.test67, %switch.early.test67, %switch.early.test67, %assert_end4
  %8 = getelementptr inbounds nuw i8, ptr %args, i64 32, !dbg !15
  %var_T_add.type_index = load i32, ptr %8, align 4, !dbg !15
    #dbg_declare(i32 %var_T_add.type_index, !23, !DIExpression(), !15)
    #dbg_declare(i32 %var_T_add.type_index, !23, !DIExpression(), !15)
  %var_T_add.type_index.fr = freeze i32 %var_T_add.type_index, !dbg !15
  %9 = icmp sgt i32 %var_T_add.type_index.fr, 63, !dbg !15
  br i1 %9, label %assert_end8, label %switch.early.test68, !dbg !15

switch.early.test68:                              ; preds = %assert_end6
  switch i32 %var_T_add.type_index.fr, label %assert_fail7 [
    i32 7, label %assert_end8
    i32 4, label %assert_end8
    i32 0, label %assert_end8
  ], !dbg !15

assert_fail7:                                     ; preds = %switch.early.test68
  %10 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %10(ptr nonnull @.str.1, ptr nonnull @.str.5), !dbg !15
  br label %common.ret, !dbg !15

assert_end8:                                      ; preds = %switch.early.test68, %switch.early.test68, %switch.early.test68, %assert_end6
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
  %19 = icmp eq i32 %var_T_add.type_index.fr, 72, !dbg !15
  %var_T_add.idx = select i1 %19, i64 16, i64 0, !dbg !15
  %var_T_add = getelementptr inbounds nuw i8, ptr %18, i64 %var_T_add.idx, !dbg !15
    #dbg_declare(ptr %var_T_add, !26, !DIExpression(), !15)
    #dbg_declare(ptr %var_T_add, !26, !DIExpression(), !15)
  %.not69 = icmp eq ptr %12, null, !dbg !15
  br i1 %.not69, label %assert_fail9, label %assert_end10, !dbg !15, !prof !20

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
  %add.var_A.shape = load ptr, ptr %25, align 8, !dbg !15
    #dbg_declare(ptr %add.var_A.shape, !27, !DIExpression(), !15)
    #dbg_declare(ptr %add.var_A.shape, !27, !DIExpression(), !15)
  %26 = load i64, ptr %add.var_A.shape, align 8, !dbg !15, !tbaa !30
  %M = trunc i64 %26 to i32, !dbg !15
    #dbg_declare(i32 %M, !40, !DIExpression(), !15)
    #dbg_declare(i32 %M, !40, !DIExpression(), !15)
  %27 = getelementptr inbounds nuw i8, ptr %add.var_A.shape, i64 8, !dbg !15
  %28 = load i64, ptr %27, align 8, !dbg !15, !tbaa !41
  %N = trunc i64 %28 to i32, !dbg !15
    #dbg_declare(i32 %N, !43, !DIExpression(), !15)
    #dbg_declare(i32 %N, !43, !DIExpression(), !15)
  %29 = getelementptr inbounds nuw i8, ptr %var_A, i64 32, !dbg !15
  %add.var_A.strides = load ptr, ptr %29, align 8, !dbg !15
    #dbg_declare(ptr %add.var_A.strides, !44, !DIExpression(), !15)
    #dbg_declare(ptr %add.var_A.strides, !44, !DIExpression(), !15)
  %30 = getelementptr inbounds nuw i8, ptr %var_A, i64 12, !dbg !15
  %dev_id = load i32, ptr %30, align 4, !dbg !15
    #dbg_declare(i32 %dev_id, !45, !DIExpression(), !15)
    #dbg_declare(i32 %dev_id, !45, !DIExpression(), !15)
  %A = load ptr, ptr %var_A, align 8, !dbg !15
    #dbg_declare(ptr %A, !46, !DIExpression(), !15)
    #dbg_declare(ptr %A, !46, !DIExpression(), !15)
  call void @llvm.assume(i1 true) [ "align"(ptr %A, i64 64) ], !dbg !15
  %.not70 = icmp eq ptr %15, null, !dbg !15
  br i1 %.not70, label %assert_fail13, label %assert_end14, !dbg !15, !prof !20

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
  %add.var_B.shape = load ptr, ptr %36, align 8, !dbg !15
    #dbg_declare(ptr %add.var_B.shape, !49, !DIExpression(), !15)
    #dbg_declare(ptr %add.var_B.shape, !49, !DIExpression(), !15)
  %37 = getelementptr inbounds nuw i8, ptr %var_B, i64 32, !dbg !15
  %add.var_B.strides = load ptr, ptr %37, align 8, !dbg !15
    #dbg_declare(ptr %add.var_B.strides, !50, !DIExpression(), !15)
    #dbg_declare(ptr %add.var_B.strides, !50, !DIExpression(), !15)
  %B = load ptr, ptr %var_B, align 8, !dbg !15
    #dbg_declare(ptr %B, !51, !DIExpression(), !15)
    #dbg_declare(ptr %B, !51, !DIExpression(), !15)
  call void @llvm.assume(i1 true) [ "align"(ptr %B, i64 64) ], !dbg !15
  %.not71 = icmp eq ptr %18, null, !dbg !15
  br i1 %.not71, label %assert_fail17, label %assert_end18, !dbg !15, !prof !20

assert_fail17:                                    ; preds = %assert_end16
  %38 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %38(ptr nonnull @.str.1, ptr nonnull @.str.10), !dbg !15
  br label %common.ret, !dbg !15

assert_end18:                                     ; preds = %assert_end16
  %39 = getelementptr inbounds nuw i8, ptr %var_T_add, i64 16, !dbg !15
  %40 = load i32, ptr %39, align 4, !dbg !15
  %41 = icmp eq i32 %40, 2, !dbg !15
  br i1 %41, label %assert_end20, label %assert_fail19, !dbg !15, !prof !16

assert_fail19:                                    ; preds = %assert_end18
  %42 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %42(ptr nonnull @.str.1, ptr nonnull @.str.11), !dbg !15
  br label %common.ret, !dbg !15

assert_end20:                                     ; preds = %assert_end18
  %43 = getelementptr inbounds nuw i8, ptr %var_T_add, i64 24, !dbg !15
  %add.var_T_add.shape = load ptr, ptr %43, align 8, !dbg !15
    #dbg_declare(ptr %add.var_T_add.shape, !52, !DIExpression(), !15)
    #dbg_declare(ptr %add.var_T_add.shape, !52, !DIExpression(), !15)
  %44 = getelementptr inbounds nuw i8, ptr %var_T_add, i64 32, !dbg !15
  %add.var_T_add.strides = load ptr, ptr %44, align 8, !dbg !15
    #dbg_declare(ptr %add.var_T_add.strides, !53, !DIExpression(), !15)
    #dbg_declare(ptr %add.var_T_add.strides, !53, !DIExpression(), !15)
  %T_add = load ptr, ptr %var_T_add, align 8, !dbg !15
    #dbg_declare(ptr %T_add, !54, !DIExpression(), !15)
    #dbg_declare(ptr %T_add, !54, !DIExpression(), !15)
  call void @llvm.assume(i1 true) [ "align"(ptr %T_add, i64 64) ], !dbg !15
  %45 = getelementptr inbounds nuw i8, ptr %var_A, i64 22, !dbg !15
  %46 = load i16, ptr %45, align 2, !dbg !15
  %47 = icmp eq i16 %46, 1, !dbg !15
  %48 = getelementptr inbounds nuw i8, ptr %var_A, i64 21, !dbg !15
  %49 = load i8, ptr %48, align 1, !dbg !15
  %50 = icmp eq i8 %49, 32, !dbg !15
  %51 = getelementptr inbounds nuw i8, ptr %var_A, i64 20, !dbg !15
  %52 = load i8, ptr %51, align 1, !dbg !15
  %53 = icmp eq i8 %52, 2, !dbg !15
  %54 = and i1 %50, %53, !dbg !15
  %55 = and i1 %47, %54, !dbg !15
  br i1 %55, label %assert_end22, label %assert_fail21, !dbg !15, !prof !16

assert_fail21:                                    ; preds = %assert_end20
  %56 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %56(ptr nonnull @.str.1, ptr nonnull @.str.12), !dbg !15
  br label %common.ret, !dbg !15

assert_end22:                                     ; preds = %assert_end20
  %.not72 = icmp eq ptr %add.var_A.strides, null, !dbg !15
  br i1 %.not72, label %if_end, label %if_then, !dbg !15, !prof !20

if_then:                                          ; preds = %assert_end22
  %57 = load i64, ptr %add.var_A.strides, align 8, !dbg !15, !tbaa !55
  %58 = trunc i64 %57 to i32, !dbg !15
  %59 = icmp eq i32 %N, %58, !dbg !15
  %60 = icmp eq i32 %M, 1, !dbg !15
  %61 = or i1 %60, %59, !dbg !15
  %62 = getelementptr inbounds nuw i8, ptr %add.var_A.strides, i64 8, !dbg !15
  %63 = load i64, ptr %62, align 8, !dbg !15, !tbaa !65
  %64 = and i64 %63, 4294967295, !dbg !15
  %65 = icmp eq i64 %64, 1, !dbg !15
  %66 = icmp eq i32 %N, 1, !dbg !15
  %67 = or i1 %66, %65, !dbg !15
  %68 = and i1 %61, %67, !dbg !15
  br i1 %68, label %if_end, label %assert_fail23, !dbg !15, !prof !16

if_end:                                           ; preds = %if_then, %assert_end22
  %69 = getelementptr inbounds nuw i8, ptr %var_A, i64 40, !dbg !15
  %70 = load i64, ptr %69, align 8, !dbg !15
  %71 = icmp eq i64 %70, 0, !dbg !15
  br i1 %71, label %assert_end26, label %assert_fail25, !dbg !15, !prof !16

assert_fail23:                                    ; preds = %if_then
  %72 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %72(ptr nonnull @.str.1, ptr nonnull @.str.13), !dbg !15
  br label %common.ret, !dbg !15

assert_fail25:                                    ; preds = %if_end
  %73 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %73(ptr nonnull @.str.1, ptr nonnull @.str.14), !dbg !15
  br label %common.ret, !dbg !15

assert_end26:                                     ; preds = %if_end
  %74 = getelementptr inbounds nuw i8, ptr %var_A, i64 8, !dbg !15
  %75 = load i32, ptr %74, align 4, !dbg !15
  %76 = icmp eq i32 %75, 1, !dbg !15
  br i1 %76, label %assert_end28, label %assert_fail27, !dbg !15, !prof !16

assert_fail27:                                    ; preds = %assert_end26
  %77 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %77(ptr nonnull @.str.1, ptr nonnull @.str.15), !dbg !15
  br label %common.ret, !dbg !15

assert_end28:                                     ; preds = %assert_end26
  %78 = icmp ne ptr %A, null, !dbg !15
  %79 = mul nsw i32 %N, %M, !dbg !15
  %80 = icmp eq i32 %79, 0, !dbg !15
  %81 = or i1 %80, %78, !dbg !15
  br i1 %81, label %assert_end30, label %assert_fail29, !dbg !15, !prof !16

assert_fail29:                                    ; preds = %assert_end28
  %82 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %82(ptr nonnull @.str.1, ptr nonnull @.str.16), !dbg !15
  br label %common.ret, !dbg !15

assert_end30:                                     ; preds = %assert_end28
  %83 = getelementptr inbounds nuw i8, ptr %var_B, i64 22, !dbg !15
  %84 = load i16, ptr %83, align 2, !dbg !15
  %85 = icmp eq i16 %84, 1, !dbg !15
  %86 = getelementptr inbounds nuw i8, ptr %var_B, i64 21, !dbg !15
  %87 = load i8, ptr %86, align 1, !dbg !15
  %88 = icmp eq i8 %87, 32, !dbg !15
  %89 = getelementptr inbounds nuw i8, ptr %var_B, i64 20, !dbg !15
  %90 = load i8, ptr %89, align 1, !dbg !15
  %91 = icmp eq i8 %90, 2, !dbg !15
  %92 = and i1 %88, %91, !dbg !15
  %93 = and i1 %85, %92, !dbg !15
  br i1 %93, label %assert_end32, label %assert_fail31, !dbg !15, !prof !16

assert_fail31:                                    ; preds = %assert_end30
  %94 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %94(ptr nonnull @.str.1, ptr nonnull @.str.17), !dbg !15
  br label %common.ret, !dbg !15

assert_end32:                                     ; preds = %assert_end30
  %95 = load i64, ptr %add.var_B.shape, align 8, !dbg !15, !tbaa !67
  %96 = trunc i64 %95 to i32, !dbg !15
  %97 = icmp eq i32 %M, %96, !dbg !15
  br i1 %97, label %assert_end34, label %assert_fail33, !dbg !15, !prof !16

assert_fail33:                                    ; preds = %assert_end32
  %98 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %98(ptr nonnull @.str.1, ptr nonnull @.str.18), !dbg !15
  br label %common.ret, !dbg !15

assert_end34:                                     ; preds = %assert_end32
  %99 = getelementptr inbounds nuw i8, ptr %add.var_B.shape, i64 8, !dbg !15
  %100 = load i64, ptr %99, align 8, !dbg !15, !tbaa !77
  %101 = trunc i64 %100 to i32, !dbg !15
  %102 = icmp eq i32 %N, %101, !dbg !15
  br i1 %102, label %assert_end36, label %assert_fail35, !dbg !15, !prof !16

assert_fail35:                                    ; preds = %assert_end34
  %103 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %103(ptr nonnull @.str.1, ptr nonnull @.str.19), !dbg !15
  br label %common.ret, !dbg !15

assert_end36:                                     ; preds = %assert_end34
  %.not73 = icmp eq ptr %add.var_B.strides, null, !dbg !15
  br i1 %.not73, label %if_end38, label %if_then37, !dbg !15, !prof !20

if_then37:                                        ; preds = %assert_end36
  %104 = load i64, ptr %add.var_B.strides, align 8, !dbg !15, !tbaa !79
  %105 = trunc i64 %104 to i32, !dbg !15
  %106 = icmp eq i32 %N, %105, !dbg !15
  %107 = icmp eq i32 %M, 1, !dbg !15
  %108 = or i1 %107, %106, !dbg !15
  %109 = getelementptr inbounds nuw i8, ptr %add.var_B.strides, i64 8, !dbg !15
  %110 = load i64, ptr %109, align 8, !dbg !15, !tbaa !89
  %111 = and i64 %110, 4294967295, !dbg !15
  %112 = icmp eq i64 %111, 1, !dbg !15
  %113 = icmp eq i32 %N, 1, !dbg !15
  %114 = or i1 %113, %112, !dbg !15
  %115 = and i1 %108, %114, !dbg !15
  br i1 %115, label %if_end38, label %assert_fail39, !dbg !15, !prof !16

if_end38:                                         ; preds = %if_then37, %assert_end36
  %116 = getelementptr inbounds nuw i8, ptr %var_B, i64 40, !dbg !15
  %117 = load i64, ptr %116, align 8, !dbg !15
  %118 = icmp eq i64 %117, 0, !dbg !15
  br i1 %118, label %assert_end42, label %assert_fail41, !dbg !15, !prof !16

assert_fail39:                                    ; preds = %if_then37
  %119 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %119(ptr nonnull @.str.1, ptr nonnull @.str.20), !dbg !15
  br label %common.ret, !dbg !15

assert_fail41:                                    ; preds = %if_end38
  %120 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %120(ptr nonnull @.str.1, ptr nonnull @.str.21), !dbg !15
  br label %common.ret, !dbg !15

assert_end42:                                     ; preds = %if_end38
  %121 = getelementptr inbounds nuw i8, ptr %var_B, i64 8, !dbg !15
  %122 = load i32, ptr %121, align 4, !dbg !15
  %123 = icmp eq i32 %122, 1, !dbg !15
  br i1 %123, label %assert_end44, label %assert_fail43, !dbg !15, !prof !16

assert_fail43:                                    ; preds = %assert_end42
  %124 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %124(ptr nonnull @.str.1, ptr nonnull @.str.22), !dbg !15
  br label %common.ret, !dbg !15

assert_end44:                                     ; preds = %assert_end42
  %125 = getelementptr inbounds nuw i8, ptr %var_B, i64 12, !dbg !15
  %126 = load i32, ptr %125, align 4, !dbg !15
  %127 = icmp eq i32 %dev_id, %126, !dbg !15
  br i1 %127, label %assert_end46, label %assert_fail45, !dbg !15, !prof !16

assert_fail45:                                    ; preds = %assert_end44
  %128 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %128(ptr nonnull @.str.1, ptr nonnull @.str.23), !dbg !15
  br label %common.ret, !dbg !15

assert_end46:                                     ; preds = %assert_end44
  %129 = icmp ne ptr %B, null, !dbg !15
  %130 = or i1 %80, %129, !dbg !15
  br i1 %130, label %assert_end48, label %assert_fail47, !dbg !15, !prof !16

assert_fail47:                                    ; preds = %assert_end46
  %131 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %131(ptr nonnull @.str.1, ptr nonnull @.str.24), !dbg !15
  br label %common.ret, !dbg !15

assert_end48:                                     ; preds = %assert_end46
  %132 = getelementptr inbounds nuw i8, ptr %var_T_add, i64 22, !dbg !15
  %133 = load i16, ptr %132, align 2, !dbg !15
  %134 = icmp eq i16 %133, 1, !dbg !15
  %135 = getelementptr inbounds nuw i8, ptr %var_T_add, i64 21, !dbg !15
  %136 = load i8, ptr %135, align 1, !dbg !15
  %137 = icmp eq i8 %136, 32, !dbg !15
  %138 = getelementptr inbounds nuw i8, ptr %var_T_add, i64 20, !dbg !15
  %139 = load i8, ptr %138, align 1, !dbg !15
  %140 = icmp eq i8 %139, 2, !dbg !15
  %141 = and i1 %137, %140, !dbg !15
  %142 = and i1 %134, %141, !dbg !15
  br i1 %142, label %assert_end50, label %assert_fail49, !dbg !15, !prof !16

assert_fail49:                                    ; preds = %assert_end48
  %143 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %143(ptr nonnull @.str.1, ptr nonnull @.str.25), !dbg !15
  br label %common.ret, !dbg !15

assert_end50:                                     ; preds = %assert_end48
  %144 = load i64, ptr %add.var_T_add.shape, align 8, !dbg !15, !tbaa !91
  %145 = trunc i64 %144 to i32, !dbg !15
  %146 = icmp eq i32 %M, %145, !dbg !15
  br i1 %146, label %assert_end52, label %assert_fail51, !dbg !15, !prof !16

assert_fail51:                                    ; preds = %assert_end50
  %147 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %147(ptr nonnull @.str.1, ptr nonnull @.str.26), !dbg !15
  br label %common.ret, !dbg !15

assert_end52:                                     ; preds = %assert_end50
  %148 = getelementptr inbounds nuw i8, ptr %add.var_T_add.shape, i64 8, !dbg !15
  %149 = load i64, ptr %148, align 8, !dbg !15, !tbaa !101
  %150 = trunc i64 %149 to i32, !dbg !15
  %151 = icmp eq i32 %N, %150, !dbg !15
  br i1 %151, label %assert_end54, label %assert_fail53, !dbg !15, !prof !16

assert_fail53:                                    ; preds = %assert_end52
  %152 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %152(ptr nonnull @.str.1, ptr nonnull @.str.27), !dbg !15
  br label %common.ret, !dbg !15

assert_end54:                                     ; preds = %assert_end52
  %.not74 = icmp eq ptr %add.var_T_add.strides, null, !dbg !15
  br i1 %.not74, label %if_end56, label %if_then55, !dbg !15, !prof !20

if_then55:                                        ; preds = %assert_end54
  %153 = load i64, ptr %add.var_T_add.strides, align 8, !dbg !15, !tbaa !103
  %154 = trunc i64 %153 to i32, !dbg !15
  %155 = icmp eq i32 %N, %154, !dbg !15
  %156 = icmp eq i32 %M, 1, !dbg !15
  %157 = or i1 %156, %155, !dbg !15
  %158 = getelementptr inbounds nuw i8, ptr %add.var_T_add.strides, i64 8, !dbg !15
  %159 = load i64, ptr %158, align 8, !dbg !15, !tbaa !113
  %160 = and i64 %159, 4294967295, !dbg !15
  %161 = icmp eq i64 %160, 1, !dbg !15
  %162 = icmp eq i32 %N, 1, !dbg !15
  %163 = or i1 %162, %161, !dbg !15
  %164 = and i1 %157, %163, !dbg !15
  br i1 %164, label %if_end56, label %assert_fail57, !dbg !15, !prof !16

if_end56:                                         ; preds = %if_then55, %assert_end54
  %165 = getelementptr inbounds nuw i8, ptr %var_T_add, i64 40, !dbg !15
  %166 = load i64, ptr %165, align 8, !dbg !15
  %167 = icmp eq i64 %166, 0, !dbg !15
  br i1 %167, label %assert_end60, label %assert_fail59, !dbg !15, !prof !16

assert_fail57:                                    ; preds = %if_then55
  %168 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %168(ptr nonnull @.str.1, ptr nonnull @.str.28), !dbg !15
  br label %common.ret, !dbg !15

assert_fail59:                                    ; preds = %if_end56
  %169 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %169(ptr nonnull @.str.1, ptr nonnull @.str.29), !dbg !15
  br label %common.ret, !dbg !15

assert_end60:                                     ; preds = %if_end56
  %170 = getelementptr inbounds nuw i8, ptr %var_T_add, i64 8, !dbg !15
  %171 = load i32, ptr %170, align 4, !dbg !15
  %172 = icmp eq i32 %171, 1, !dbg !15
  br i1 %172, label %assert_end62, label %assert_fail61, !dbg !15, !prof !16

assert_fail61:                                    ; preds = %assert_end60
  %173 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %173(ptr nonnull @.str.1, ptr nonnull @.str.30), !dbg !15
  br label %common.ret, !dbg !15

assert_end62:                                     ; preds = %assert_end60
  %174 = getelementptr inbounds nuw i8, ptr %var_T_add, i64 12, !dbg !15
  %175 = load i32, ptr %174, align 4, !dbg !15
  %176 = icmp eq i32 %dev_id, %175, !dbg !15
  br i1 %176, label %assert_end64, label %assert_fail63, !dbg !15, !prof !16

assert_fail63:                                    ; preds = %assert_end62
  %177 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %177(ptr nonnull @.str.1, ptr nonnull @.str.31), !dbg !15
  br label %common.ret, !dbg !15

assert_end64:                                     ; preds = %assert_end62
  %178 = icmp ne ptr %T_add, null, !dbg !15
  %179 = or i1 %80, %178, !dbg !15
  br i1 %179, label %assert_end66, label %assert_fail65, !dbg !15, !prof !16

assert_fail65:                                    ; preds = %assert_end64
  %180 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %180(ptr nonnull @.str.1, ptr nonnull @.str.32), !dbg !15
  br label %common.ret, !dbg !15

assert_end66:                                     ; preds = %assert_end64
  tail call fastcc void @add_compute_(i32 %M, i32 %N, ptr %T_add, ptr %A, ptr %B), !dbg !15
  br label %common.ret, !dbg !15
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define internal fastcc void @add_compute_(i32 %M, i32 %N, ptr noalias nocapture writeonly align 64 %T_add, ptr noalias nocapture readonly align 64 %A, ptr noalias nocapture readonly align 64 %B) unnamed_addr #2 !dbg !115 {
entry:
    #dbg_value(i32 %M, !119, !DIExpression(), !124)
    #dbg_value(i32 %N, !120, !DIExpression(), !124)
    #dbg_value(ptr %T_add, !121, !DIExpression(), !124)
    #dbg_value(ptr %A, !122, !DIExpression(), !124)
    #dbg_value(ptr %B, !123, !DIExpression(), !124)
    #dbg_declare(i32 0, !125, !DIExpression(), !124)
  %0 = icmp sgt i32 %M, 0, !dbg !124
  %1 = icmp sgt i32 %N, 0
  %or.cond = select i1 %0, i1 %1, i1 false, !dbg !124
  br i1 %or.cond, label %for_begin_ax1.preheader.us.preheader, label %for_end_ax0, !dbg !124, !prof !126

for_begin_ax1.preheader.us.preheader:             ; preds = %entry
  %2 = zext nneg i32 %N to i64, !dbg !124
  %wide.trip.count8 = zext nneg i32 %M to i64, !dbg !124
  %min.iters.check = icmp ult i32 %N, 8
  %n.vec = and i64 %2, 2147483640
  %cmp.n = icmp eq i64 %n.vec, %2
  br label %for_begin_ax1.preheader.us, !dbg !124

for_begin_ax1.preheader.us:                       ; preds = %for_begin_ax1.preheader.us.preheader, %for_begin_ax1.for_end_ax1_crit_edge.us
  %indvars.iv5 = phi i64 [ 0, %for_begin_ax1.preheader.us.preheader ], [ %indvars.iv.next6, %for_begin_ax1.for_end_ax1_crit_edge.us ]
    #dbg_declare(i64 %indvars.iv5, !125, !DIExpression(), !124)
    #dbg_declare(i32 0, !127, !DIExpression(), !124)
  %3 = mul nuw nsw i64 %indvars.iv5, %2
  br i1 %min.iters.check, label %for_body_ax1.us.preheader, label %vector.body, !dbg !124, !prof !128

vector.body:                                      ; preds = %for_begin_ax1.preheader.us, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %for_begin_ax1.preheader.us ], !dbg !124
  %4 = add nuw nsw i64 %index, %3, !dbg !124
  %5 = getelementptr inbounds nuw float, ptr %B, i64 %4, !dbg !124
  %6 = getelementptr inbounds nuw i8, ptr %5, i64 16, !dbg !124
  %wide.load = load <4 x float>, ptr %5, align 4, !dbg !124, !tbaa !129
  %wide.load1 = load <4 x float>, ptr %6, align 4, !dbg !124, !tbaa !129
  %7 = getelementptr inbounds nuw float, ptr %A, i64 %4, !dbg !124
  %8 = getelementptr inbounds nuw i8, ptr %7, i64 16, !dbg !124
  %wide.load2 = load <4 x float>, ptr %7, align 4, !dbg !124, !tbaa !131
  %wide.load3 = load <4 x float>, ptr %8, align 4, !dbg !124, !tbaa !131
  %9 = fadd <4 x float> %wide.load, %wide.load2, !dbg !124
  %10 = fadd <4 x float> %wide.load1, %wide.load3, !dbg !124
  %11 = getelementptr inbounds nuw float, ptr %T_add, i64 %4, !dbg !124
  %12 = getelementptr inbounds nuw i8, ptr %11, i64 16, !dbg !124
  store <4 x float> %9, ptr %11, align 4, !dbg !124, !tbaa !133
  store <4 x float> %10, ptr %12, align 4, !dbg !124, !tbaa !133
  %index.next = add nuw i64 %index, 8, !dbg !124
  %13 = icmp eq i64 %index.next, %n.vec, !dbg !124
  br i1 %13, label %middle.block, label %vector.body, !dbg !124, !prof !135, !llvm.loop !136

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for_begin_ax1.for_end_ax1_crit_edge.us, label %for_body_ax1.us.preheader, !dbg !124, !prof !139

for_body_ax1.us.preheader:                        ; preds = %for_begin_ax1.preheader.us, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for_begin_ax1.preheader.us ], [ %n.vec, %middle.block ]
  br label %for_body_ax1.us, !dbg !124

for_body_ax1.us:                                  ; preds = %for_body_ax1.us.preheader, %for_body_ax1.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for_body_ax1.us ], [ %indvars.iv.ph, %for_body_ax1.us.preheader ]
    #dbg_declare(i64 %indvars.iv, !127, !DIExpression(), !124)
  %14 = add nuw nsw i64 %indvars.iv, %3, !dbg !124
  %15 = getelementptr inbounds nuw float, ptr %B, i64 %14, !dbg !124
  %16 = load float, ptr %15, align 4, !dbg !124, !tbaa !129
  %17 = getelementptr inbounds nuw float, ptr %A, i64 %14, !dbg !124
  %18 = load float, ptr %17, align 4, !dbg !124, !tbaa !131
  %19 = fadd float %16, %18, !dbg !124
  %20 = getelementptr inbounds nuw float, ptr %T_add, i64 %14, !dbg !124
  store float %19, ptr %20, align 4, !dbg !124, !tbaa !133
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !124
    #dbg_declare(i64 %indvars.iv.next, !127, !DIExpression(), !124)
  %exitcond.not = icmp eq i64 %indvars.iv.next, %2, !dbg !124
  br i1 %exitcond.not, label %for_begin_ax1.for_end_ax1_crit_edge.us, label %for_body_ax1.us, !dbg !124, !prof !140, !llvm.loop !141

for_begin_ax1.for_end_ax1_crit_edge.us:           ; preds = %for_body_ax1.us, %middle.block
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1, !dbg !124
    #dbg_declare(i64 %indvars.iv.next6, !125, !DIExpression(), !124)
  %exitcond9.not = icmp eq i64 %indvars.iv.next6, %wide.trip.count8, !dbg !124
  br i1 %exitcond9.not, label %for_end_ax0, label %for_begin_ax1.preheader.us, !dbg !124, !prof !142

for_end_ax0:                                      ; preds = %for_begin_ax1.for_end_ax1_crit_edge.us, %entry
  ret void, !dbg !124
}

; Function Attrs: nofree nosync nounwind memory(none)
define weak dso_local half @__truncsfhf2(float %a0) local_unnamed_addr #3 section ".text.tvm.fp16.conv" {
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
define weak dso_local float @__extendhfsf2(half %a0) local_unnamed_addr #3 section ".text.tvm.fp16.conv" {
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
declare float @llvm.fabs.f32(float) #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare half @llvm.fabs.f16(half) #4

attributes #0 = { "target-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #2 = { nofree noinline norecurse nosync nounwind memory(argmem: readwrite) "target-cpu"="generic" }
attributes #3 = { nofree nosync nounwind memory(none) "target-cpu"="generic" "target-features" }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "TVM", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "IRModule.CodeGenLLVM", directory: ".")
!2 = !{i32 2, !"tvm_target", !"llvm -mtriple=x86_64-unknown-linux-gnu"}
!3 = !{i32 4, !"Debug Info Version", i32 3}
!4 = !{i32 4, !"Dwarf Version", i32 4}
!5 = distinct !DISubprogram(name: "add", scope: !1, file: !1, type: !6, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !10)
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
!23 = !DILocalVariable(name: "var_T_add.type_index", scope: !5, file: !1, type: !8)
!24 = !DILocalVariable(name: "var_A", scope: !5, file: !1, type: !9)
!25 = !DILocalVariable(name: "var_B", scope: !5, file: !1, type: !9)
!26 = !DILocalVariable(name: "var_T_add", scope: !5, file: !1, type: !9)
!27 = !DILocalVariable(name: "add.var_A.shape", scope: !5, file: !1, type: !28)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29)
!29 = !DIBasicType(name: "int64", size: 64, encoding: DW_ATE_signed)
!30 = !{!31, !31, i64 0}
!31 = !{!"0x63a8dd169b30.w8.b0", !32, i64 0}
!32 = !{!"0x63a8dd169b30.w16.b0", !33, i64 0}
!33 = !{!"0x63a8dd169b30.w32.b0", !34, i64 0}
!34 = !{!"0x63a8dd169b30.w64.b0", !35, i64 0}
!35 = !{!"0x63a8dd169b30.w128.b0", !36, i64 0}
!36 = !{!"0x63a8dd169b30.w256.b0", !37, i64 0}
!37 = !{!"0x63a8dd169b30.w512.b0", !38, i64 0}
!38 = !{!"0x63a8dd169b30.w1024.b0", !39, i64 0}
!39 = !{!"0x63a8dd169b30", !19, i64 0}
!40 = !DILocalVariable(name: "M", scope: !5, file: !1, type: !8)
!41 = !{!42, !42, i64 0}
!42 = !{!"0x63a8dd169b30.w8.b8", !32, i64 0}
!43 = !DILocalVariable(name: "N", scope: !5, file: !1, type: !8)
!44 = !DILocalVariable(name: "add.var_A.strides", scope: !5, file: !1, type: !28)
!45 = !DILocalVariable(name: "dev_id", scope: !5, file: !1, type: !8)
!46 = !DILocalVariable(name: "A", scope: !5, file: !1, type: !47)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48)
!48 = !DIBasicType(name: "float32", size: 32, encoding: DW_ATE_float)
!49 = !DILocalVariable(name: "add.var_B.shape", scope: !5, file: !1, type: !28)
!50 = !DILocalVariable(name: "add.var_B.strides", scope: !5, file: !1, type: !28)
!51 = !DILocalVariable(name: "B", scope: !5, file: !1, type: !47)
!52 = !DILocalVariable(name: "add.var_T_add.shape", scope: !5, file: !1, type: !28)
!53 = !DILocalVariable(name: "add.var_T_add.strides", scope: !5, file: !1, type: !28)
!54 = !DILocalVariable(name: "T_add", scope: !5, file: !1, type: !47)
!55 = !{!56, !56, i64 0}
!56 = !{!"0x63a8dd163a90.w8.b0", !57, i64 0}
!57 = !{!"0x63a8dd163a90.w16.b0", !58, i64 0}
!58 = !{!"0x63a8dd163a90.w32.b0", !59, i64 0}
!59 = !{!"0x63a8dd163a90.w64.b0", !60, i64 0}
!60 = !{!"0x63a8dd163a90.w128.b0", !61, i64 0}
!61 = !{!"0x63a8dd163a90.w256.b0", !62, i64 0}
!62 = !{!"0x63a8dd163a90.w512.b0", !63, i64 0}
!63 = !{!"0x63a8dd163a90.w1024.b0", !64, i64 0}
!64 = !{!"0x63a8dd163a90", !19, i64 0}
!65 = !{!66, !66, i64 0}
!66 = !{!"0x63a8dd163a90.w8.b8", !57, i64 0}
!67 = !{!68, !68, i64 0}
!68 = !{!"0x63a8dd101300.w8.b0", !69, i64 0}
!69 = !{!"0x63a8dd101300.w16.b0", !70, i64 0}
!70 = !{!"0x63a8dd101300.w32.b0", !71, i64 0}
!71 = !{!"0x63a8dd101300.w64.b0", !72, i64 0}
!72 = !{!"0x63a8dd101300.w128.b0", !73, i64 0}
!73 = !{!"0x63a8dd101300.w256.b0", !74, i64 0}
!74 = !{!"0x63a8dd101300.w512.b0", !75, i64 0}
!75 = !{!"0x63a8dd101300.w1024.b0", !76, i64 0}
!76 = !{!"0x63a8dd101300", !19, i64 0}
!77 = !{!78, !78, i64 0}
!78 = !{!"0x63a8dd101300.w8.b8", !69, i64 0}
!79 = !{!80, !80, i64 0}
!80 = !{!"0x63a8dd1fdd20.w8.b0", !81, i64 0}
!81 = !{!"0x63a8dd1fdd20.w16.b0", !82, i64 0}
!82 = !{!"0x63a8dd1fdd20.w32.b0", !83, i64 0}
!83 = !{!"0x63a8dd1fdd20.w64.b0", !84, i64 0}
!84 = !{!"0x63a8dd1fdd20.w128.b0", !85, i64 0}
!85 = !{!"0x63a8dd1fdd20.w256.b0", !86, i64 0}
!86 = !{!"0x63a8dd1fdd20.w512.b0", !87, i64 0}
!87 = !{!"0x63a8dd1fdd20.w1024.b0", !88, i64 0}
!88 = !{!"0x63a8dd1fdd20", !19, i64 0}
!89 = !{!90, !90, i64 0}
!90 = !{!"0x63a8dd1fdd20.w8.b8", !81, i64 0}
!91 = !{!92, !92, i64 0}
!92 = !{!"0x63a8dd1d5b20.w8.b0", !93, i64 0}
!93 = !{!"0x63a8dd1d5b20.w16.b0", !94, i64 0}
!94 = !{!"0x63a8dd1d5b20.w32.b0", !95, i64 0}
!95 = !{!"0x63a8dd1d5b20.w64.b0", !96, i64 0}
!96 = !{!"0x63a8dd1d5b20.w128.b0", !97, i64 0}
!97 = !{!"0x63a8dd1d5b20.w256.b0", !98, i64 0}
!98 = !{!"0x63a8dd1d5b20.w512.b0", !99, i64 0}
!99 = !{!"0x63a8dd1d5b20.w1024.b0", !100, i64 0}
!100 = !{!"0x63a8dd1d5b20", !19, i64 0}
!101 = !{!102, !102, i64 0}
!102 = !{!"0x63a8dd1d5b20.w8.b8", !93, i64 0}
!103 = !{!104, !104, i64 0}
!104 = !{!"0x63a8dd1fd450.w8.b0", !105, i64 0}
!105 = !{!"0x63a8dd1fd450.w16.b0", !106, i64 0}
!106 = !{!"0x63a8dd1fd450.w32.b0", !107, i64 0}
!107 = !{!"0x63a8dd1fd450.w64.b0", !108, i64 0}
!108 = !{!"0x63a8dd1fd450.w128.b0", !109, i64 0}
!109 = !{!"0x63a8dd1fd450.w256.b0", !110, i64 0}
!110 = !{!"0x63a8dd1fd450.w512.b0", !111, i64 0}
!111 = !{!"0x63a8dd1fd450.w1024.b0", !112, i64 0}
!112 = !{!"0x63a8dd1fd450", !19, i64 0}
!113 = !{!114, !114, i64 0}
!114 = !{!"0x63a8dd1fd450.w8.b8", !105, i64 0}
!115 = distinct !DISubprogram(name: "add_compute_", scope: !1, file: !1, type: !116, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !118)
!116 = !DISubroutineType(cc: DW_CC_nocall, types: !117)
!117 = !{!8, !8, !8, !47, !47, !47}
!118 = !{!119, !120, !121, !122, !123}
!119 = !DILocalVariable(name: "M", arg: 1, scope: !115, file: !1, type: !8)
!120 = !DILocalVariable(name: "N", arg: 2, scope: !115, file: !1, type: !8)
!121 = !DILocalVariable(name: "T_add", arg: 3, scope: !115, file: !1, type: !47)
!122 = !DILocalVariable(name: "A", arg: 4, scope: !115, file: !1, type: !47)
!123 = !DILocalVariable(name: "B", arg: 5, scope: !115, file: !1, type: !47)
!124 = !DILocation(line: 0, scope: !115)
!125 = !DILocalVariable(name: "ax0", scope: !115, file: !1, type: !8)
!126 = !{!"branch_weights", i32 16129, i32 255}
!127 = !DILocalVariable(name: "ax1", scope: !115, file: !1, type: !8)
!128 = !{!"branch_weights", i32 1, i32 127}
!129 = !{!130, !130, i64 0}
!130 = !{!"0x63a8dd1c99c0", !19, i64 0}
!131 = !{!132, !132, i64 0}
!132 = !{!"0x63a8dd17e020", !19, i64 0}
!133 = !{!134, !134, i64 0}
!134 = !{!"0x63a8dd10cc60", !19, i64 0}
!135 = !{!"branch_weights", i32 127, i32 16777081}
!136 = distinct !{!136, !137, !138}
!137 = !{!"llvm.loop.isvectorized", i32 1}
!138 = !{!"llvm.loop.unroll.runtime.disable"}
!139 = !{!"branch_weights", i32 1, i32 7}
!140 = !{!"branch_weights", i32 127, i32 0}
!141 = distinct !{!141, !138, !137}
!142 = !{!"branch_weights", i32 127, i32 134217601}
