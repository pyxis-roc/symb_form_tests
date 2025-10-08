; ModuleID = 'TVMMod'
source_filename = "TVMMod"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__TVMFFIErrorSetRaisedByCStr = linkonce dllexport local_unnamed_addr global ptr null, align 8
@.str = private constant [60 x i8] c"Assert fail: num_args == 2, unsqueeze: num_args should be 2\00", align 1
@.str.1 = private constant [13 x i8] c"RuntimeError\00", align 1
@.str.2 = private constant [68 x i8] c"Assert fail: not T.isnullptr(args), unsqueeze: args pointer is NULL\00", align 1
@.str.3 = private constant [151 x i8] c"Assert fail: var_A_type_index == 0 or var_A_type_index == 4 or var_A_type_index == 7 or var_A_type_index >= 64, unsqueeze: Expect arg[0] to be pointer\00", align 1
@.str.4 = private constant [199 x i8] c"Assert fail: var_T_expand_dims_type_index == 0 or var_T_expand_dims_type_index == 4 or var_T_expand_dims_type_index == 7 or var_T_expand_dims_type_index >= 64, unsqueeze: Expect arg[1] to be pointer\00", align 1
@.str.5 = private constant [100 x i8] c"Assert fail: not T.isnullptr(var_A), unsqueeze.var_A is expected to have non-NULL DLTensor* pointer\00", align 1
@.str.6 = private constant [102 x i8] c"Assert fail: 2 == T.tvm_struct_get(var_A, 0, 4, \22int32\22), unsqueeze.var_A.ndim is expected to equal 2\00", align 1
@.str.7 = private constant [124 x i8] c"Assert fail: not T.isnullptr(var_T_expand_dims), unsqueeze.var_T_expand_dims is expected to have non-NULL DLTensor* pointer\00", align 1
@.str.8 = private constant [126 x i8] c"Assert fail: 3 == T.tvm_struct_get(var_T_expand_dims, 0, 4, \22int32\22), unsqueeze.var_T_expand_dims.ndim is expected to equal 3\00", align 1
@.str.9 = private constant [232 x i8] c"Assert fail: T.tvm_struct_get(var_A, 0, 5, \22uint8\22) == T.uint8(2) and T.tvm_struct_get(var_A, 0, 6, \22uint8\22) == T.uint8(32) and T.tvm_struct_get(var_A, 0, 7, \22uint16\22) == T.uint16(1), unsqueeze.var_A.dtype is expected to be float32\00", align 1
@.str.10 = private constant [194 x i8] c"Assert fail: (N == 1 or 1 == T.Cast(\22int32\22, unsqueeze_var_A_strides[1])) and (M == 1 or N == T.Cast(\22int32\22, unsqueeze_var_A_strides[0])), unsqueeze.var_A.strides: expected to be compact array\00", align 1
@.str.11 = private constant [192 x i8] c"Assert fail: T.uint64(0) == T.tvm_struct_get(var_A, 0, 8, \22uint64\22), Argument unsqueeze.var_A.byte_offset has an unsatisfied constraint: T.uint64(0) == T.tvm_struct_get(var_A, 0, 8, \22uint64\22)\00", align 1
@.str.12 = private constant [172 x i8] c"Assert fail: T.tvm_struct_get(var_A, 0, 10, \22int32\22) == 1, Argument unsqueeze.var_A.device_type has an unsatisfied constraint: 1 == T.tvm_struct_get(var_A, 0, 10, \22int32\22)\00", align 1
@.str.13 = private constant [105 x i8] c"Assert fail: M * N == 0 or not T.isnullptr(A), unsqueeze.var_A is expected to have non-NULL data pointer\00", align 1
@.str.14 = private constant [280 x i8] c"Assert fail: T.tvm_struct_get(var_T_expand_dims, 0, 5, \22uint8\22) == T.uint8(2) and T.tvm_struct_get(var_T_expand_dims, 0, 6, \22uint8\22) == T.uint8(32) and T.tvm_struct_get(var_T_expand_dims, 0, 7, \22uint16\22) == T.uint16(1), unsqueeze.var_T_expand_dims.dtype is expected to be float32\00", align 1
@.str.15 = private constant [209 x i8] c"Assert fail: M == T.Cast(\22int32\22, unsqueeze_var_T_expand_dims_shape[0]), Argument unsqueeze.var_T_expand_dims.shape[0] has an unsatisfied constraint: M == T.Cast(\22int32\22, unsqueeze_var_T_expand_dims_shape[0])\00", align 1
@.str.16 = private constant [209 x i8] c"Assert fail: T.Cast(\22int32\22, unsqueeze_var_T_expand_dims_shape[1]) == 1, Argument unsqueeze.var_T_expand_dims.shape[1] has an unsatisfied constraint: 1 == T.Cast(\22int32\22, unsqueeze_var_T_expand_dims_shape[1])\00", align 1
@.str.17 = private constant [209 x i8] c"Assert fail: N == T.Cast(\22int32\22, unsqueeze_var_T_expand_dims_shape[2]), Argument unsqueeze.var_T_expand_dims.shape[2] has an unsatisfied constraint: N == T.Cast(\22int32\22, unsqueeze_var_T_expand_dims_shape[2])\00", align 1
@.str.18 = private constant [230 x i8] c"Assert fail: (N == 1 or 1 == T.Cast(\22int32\22, unsqueeze_var_T_expand_dims_strides[2])) and (M == 1 or N == T.Cast(\22int32\22, unsqueeze_var_T_expand_dims_strides[0])), unsqueeze.var_T_expand_dims.strides: expected to be compact array\00", align 1
@.str.19 = private constant [228 x i8] c"Assert fail: T.uint64(0) == T.tvm_struct_get(var_T_expand_dims, 0, 8, \22uint64\22), Argument unsqueeze.var_T_expand_dims.byte_offset has an unsatisfied constraint: T.uint64(0) == T.tvm_struct_get(var_T_expand_dims, 0, 8, \22uint64\22)\00", align 1
@.str.20 = private constant [208 x i8] c"Assert fail: T.tvm_struct_get(var_T_expand_dims, 0, 10, \22int32\22) == 1, Argument unsqueeze.var_T_expand_dims.device_type has an unsatisfied constraint: 1 == T.tvm_struct_get(var_T_expand_dims, 0, 10, \22int32\22)\00", align 1
@.str.21 = private constant [214 x i8] c"Assert fail: dev_id == T.tvm_struct_get(var_T_expand_dims, 0, 9, \22int32\22), Argument unsqueeze.var_T_expand_dims.device_id has an unsatisfied constraint: dev_id == T.tvm_struct_get(var_T_expand_dims, 0, 9, \22int32\22)\00", align 1
@.str.22 = private constant [129 x i8] c"Assert fail: M * N == 0 or not T.isnullptr(T_expand_dims), unsqueeze.var_T_expand_dims is expected to have non-NULL data pointer\00", align 1
@__tvm_main__ = weak dllexport local_unnamed_addr constant [10 x i8] c"unsqueeze\00", align 1
@llvm.global_ctors = appending global [0 x { i32, ptr, ptr }] zeroinitializer

define dllexport range(i32 -1, 1) i32 @unsqueeze(ptr noalias nocapture readnone %self_handle, ptr noalias readonly %args, i32 %num_args, ptr noalias nocapture readnone %result) local_unnamed_addr #0 !dbg !5 {
entry:
    #dbg_value(ptr %self_handle, !11, !DIExpression(), !15)
    #dbg_value(ptr %args, !12, !DIExpression(), !15)
    #dbg_value(i32 %num_args, !13, !DIExpression(), !15)
    #dbg_value(ptr %result, !14, !DIExpression(), !15)
  %0 = icmp eq i32 %num_args, 2, !dbg !15
  br i1 %0, label %assert_end, label %assert_fail, !dbg !15, !prof !16

common.ret:                                       ; preds = %assert_end44, %assert_fail43, %assert_fail41, %assert_fail39, %assert_fail37, %assert_fail35, %assert_fail31, %assert_fail29, %assert_fail27, %assert_fail25, %assert_fail23, %assert_fail21, %assert_fail19, %assert_fail17, %assert_fail15, %assert_fail13, %assert_fail11, %assert_fail9, %assert_fail7, %assert_fail5, %assert_fail3, %assert_fail1, %assert_fail
  %common.ret.op = phi i32 [ -1, %assert_fail ], [ -1, %assert_fail1 ], [ -1, %assert_fail3 ], [ -1, %assert_fail5 ], [ -1, %assert_fail7 ], [ -1, %assert_fail9 ], [ -1, %assert_fail11 ], [ -1, %assert_fail13 ], [ -1, %assert_fail15 ], [ -1, %assert_fail17 ], [ -1, %assert_fail19 ], [ -1, %assert_fail21 ], [ -1, %assert_fail23 ], [ -1, %assert_fail25 ], [ -1, %assert_fail27 ], [ -1, %assert_fail29 ], [ -1, %assert_fail31 ], [ -1, %assert_fail35 ], [ -1, %assert_fail37 ], [ -1, %assert_fail39 ], [ -1, %assert_fail41 ], [ -1, %assert_fail43 ], [ 0, %assert_end44 ]
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
  %var_T_expand_dims.type_index = load i32, ptr %5, align 4, !dbg !15
    #dbg_declare(i32 %var_T_expand_dims.type_index, !22, !DIExpression(), !15)
    #dbg_declare(i32 %var_T_expand_dims.type_index, !22, !DIExpression(), !15)
  %var_T_expand_dims.type_index.fr = freeze i32 %var_T_expand_dims.type_index, !dbg !15
  %6 = icmp sgt i32 %var_T_expand_dims.type_index.fr, 63, !dbg !15
  br i1 %6, label %assert_end6, label %switch.early.test45, !dbg !15

switch.early.test45:                              ; preds = %assert_end4
  switch i32 %var_T_expand_dims.type_index.fr, label %assert_fail5 [
    i32 7, label %assert_end6
    i32 4, label %assert_end6
    i32 0, label %assert_end6
  ], !dbg !15

assert_fail5:                                     ; preds = %switch.early.test45
  %7 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %7(ptr nonnull @.str.1, ptr nonnull @.str.4), !dbg !15
  br label %common.ret, !dbg !15

assert_end6:                                      ; preds = %switch.early.test45, %switch.early.test45, %switch.early.test45, %assert_end4
  %8 = getelementptr inbounds i8, ptr %args, i64 8, !dbg !15
  %9 = load ptr, ptr %8, align 8, !dbg !15
  %10 = icmp eq i32 %var_A.type_index.fr, 72, !dbg !15
  %var_A.idx = select i1 %10, i64 16, i64 0, !dbg !15
  %var_A = getelementptr inbounds i8, ptr %9, i64 %var_A.idx, !dbg !15
    #dbg_declare(ptr %var_A, !23, !DIExpression(), !15)
    #dbg_declare(ptr %var_A, !23, !DIExpression(), !15)
  %11 = getelementptr inbounds i8, ptr %args, i64 24, !dbg !15
  %12 = load ptr, ptr %11, align 8, !dbg !15
  %13 = icmp eq i32 %var_T_expand_dims.type_index.fr, 72, !dbg !15
  %var_T_expand_dims.idx = select i1 %13, i64 16, i64 0, !dbg !15
  %var_T_expand_dims = getelementptr inbounds i8, ptr %12, i64 %var_T_expand_dims.idx, !dbg !15
    #dbg_declare(ptr %var_T_expand_dims, !24, !DIExpression(), !15)
    #dbg_declare(ptr %var_T_expand_dims, !24, !DIExpression(), !15)
  %.not46 = icmp eq ptr %9, null, !dbg !15
  br i1 %.not46, label %assert_fail7, label %assert_end8, !dbg !15, !prof !20

assert_fail7:                                     ; preds = %assert_end6
  %14 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %14(ptr nonnull @.str.1, ptr nonnull @.str.5), !dbg !15
  br label %common.ret, !dbg !15

assert_end8:                                      ; preds = %assert_end6
  %15 = getelementptr inbounds i8, ptr %var_A, i64 16, !dbg !15
  %16 = load i32, ptr %15, align 4, !dbg !15
  %17 = icmp eq i32 %16, 2, !dbg !15
  br i1 %17, label %assert_end10, label %assert_fail9, !dbg !15, !prof !16

assert_fail9:                                     ; preds = %assert_end8
  %18 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %18(ptr nonnull @.str.1, ptr nonnull @.str.6), !dbg !15
  br label %common.ret, !dbg !15

assert_end10:                                     ; preds = %assert_end8
  %19 = getelementptr inbounds i8, ptr %var_A, i64 24, !dbg !15
  %unsqueeze.var_A.shape = load ptr, ptr %19, align 8, !dbg !15
    #dbg_declare(ptr %unsqueeze.var_A.shape, !25, !DIExpression(), !15)
    #dbg_declare(ptr %unsqueeze.var_A.shape, !25, !DIExpression(), !15)
  %20 = load i64, ptr %unsqueeze.var_A.shape, align 8, !dbg !15, !tbaa !28
  %M = trunc i64 %20 to i32, !dbg !15
    #dbg_declare(i32 %M, !38, !DIExpression(), !15)
    #dbg_declare(i32 %M, !38, !DIExpression(), !15)
  %21 = getelementptr inbounds i8, ptr %unsqueeze.var_A.shape, i64 8, !dbg !15
  %22 = load i64, ptr %21, align 8, !dbg !15, !tbaa !39
  %N = trunc i64 %22 to i32, !dbg !15
    #dbg_declare(i32 %N, !41, !DIExpression(), !15)
    #dbg_declare(i32 %N, !41, !DIExpression(), !15)
  %23 = getelementptr inbounds i8, ptr %var_A, i64 32, !dbg !15
  %unsqueeze.var_A.strides = load ptr, ptr %23, align 8, !dbg !15
    #dbg_declare(ptr %unsqueeze.var_A.strides, !42, !DIExpression(), !15)
    #dbg_declare(ptr %unsqueeze.var_A.strides, !42, !DIExpression(), !15)
  %24 = getelementptr inbounds i8, ptr %var_A, i64 12, !dbg !15
  %dev_id = load i32, ptr %24, align 4, !dbg !15
    #dbg_declare(i32 %dev_id, !43, !DIExpression(), !15)
    #dbg_declare(i32 %dev_id, !43, !DIExpression(), !15)
  %A = load ptr, ptr %var_A, align 8, !dbg !15
    #dbg_declare(ptr %A, !44, !DIExpression(), !15)
    #dbg_declare(ptr %A, !44, !DIExpression(), !15)
  call void @llvm.assume(i1 true) [ "align"(ptr %A, i64 64) ], !dbg !15
  %.not47 = icmp eq ptr %12, null, !dbg !15
  br i1 %.not47, label %assert_fail11, label %assert_end12, !dbg !15, !prof !20

assert_fail11:                                    ; preds = %assert_end10
  %25 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %25(ptr nonnull @.str.1, ptr nonnull @.str.7), !dbg !15
  br label %common.ret, !dbg !15

assert_end12:                                     ; preds = %assert_end10
  %26 = getelementptr inbounds i8, ptr %var_T_expand_dims, i64 16, !dbg !15
  %27 = load i32, ptr %26, align 4, !dbg !15
  %28 = icmp eq i32 %27, 3, !dbg !15
  br i1 %28, label %assert_end14, label %assert_fail13, !dbg !15, !prof !16

assert_fail13:                                    ; preds = %assert_end12
  %29 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %29(ptr nonnull @.str.1, ptr nonnull @.str.8), !dbg !15
  br label %common.ret, !dbg !15

assert_end14:                                     ; preds = %assert_end12
  %30 = getelementptr inbounds i8, ptr %var_T_expand_dims, i64 24, !dbg !15
  %unsqueeze.var_T_expand_dims.shape = load ptr, ptr %30, align 8, !dbg !15
    #dbg_declare(ptr %unsqueeze.var_T_expand_dims.shape, !47, !DIExpression(), !15)
    #dbg_declare(ptr %unsqueeze.var_T_expand_dims.shape, !47, !DIExpression(), !15)
  %31 = getelementptr inbounds i8, ptr %var_T_expand_dims, i64 32, !dbg !15
  %unsqueeze.var_T_expand_dims.strides = load ptr, ptr %31, align 8, !dbg !15
    #dbg_declare(ptr %unsqueeze.var_T_expand_dims.strides, !48, !DIExpression(), !15)
    #dbg_declare(ptr %unsqueeze.var_T_expand_dims.strides, !48, !DIExpression(), !15)
  %T_expand_dims = load ptr, ptr %var_T_expand_dims, align 8, !dbg !15
    #dbg_declare(ptr %T_expand_dims, !49, !DIExpression(), !15)
    #dbg_declare(ptr %T_expand_dims, !49, !DIExpression(), !15)
  call void @llvm.assume(i1 true) [ "align"(ptr %T_expand_dims, i64 64) ], !dbg !15
  %32 = getelementptr inbounds i8, ptr %var_A, i64 22, !dbg !15
  %33 = load i16, ptr %32, align 2, !dbg !15
  %34 = icmp eq i16 %33, 1, !dbg !15
  %35 = getelementptr inbounds i8, ptr %var_A, i64 21, !dbg !15
  %36 = load i8, ptr %35, align 1, !dbg !15
  %37 = icmp eq i8 %36, 32, !dbg !15
  %38 = getelementptr inbounds i8, ptr %var_A, i64 20, !dbg !15
  %39 = load i8, ptr %38, align 1, !dbg !15
  %40 = icmp eq i8 %39, 2, !dbg !15
  %41 = and i1 %37, %40, !dbg !15
  %42 = and i1 %34, %41, !dbg !15
  br i1 %42, label %assert_end16, label %assert_fail15, !dbg !15, !prof !16

assert_fail15:                                    ; preds = %assert_end14
  %43 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %43(ptr nonnull @.str.1, ptr nonnull @.str.9), !dbg !15
  br label %common.ret, !dbg !15

assert_end16:                                     ; preds = %assert_end14
  %.not48 = icmp eq ptr %unsqueeze.var_A.strides, null, !dbg !15
  br i1 %.not48, label %if_end, label %if_then, !dbg !15, !prof !20

if_then:                                          ; preds = %assert_end16
  %44 = load i64, ptr %unsqueeze.var_A.strides, align 8, !dbg !15, !tbaa !50
  %45 = trunc i64 %44 to i32, !dbg !15
  %46 = icmp eq i32 %N, %45, !dbg !15
  %47 = icmp eq i32 %M, 1, !dbg !15
  %48 = or i1 %47, %46, !dbg !15
  %49 = getelementptr inbounds i8, ptr %unsqueeze.var_A.strides, i64 8, !dbg !15
  %50 = load i64, ptr %49, align 8, !dbg !15, !tbaa !60
  %51 = and i64 %50, 4294967295, !dbg !15
  %52 = icmp eq i64 %51, 1, !dbg !15
  %53 = icmp eq i32 %N, 1, !dbg !15
  %54 = or i1 %53, %52, !dbg !15
  %55 = and i1 %48, %54, !dbg !15
  br i1 %55, label %if_end, label %assert_fail17, !dbg !15, !prof !16

if_end:                                           ; preds = %if_then, %assert_end16
  %56 = getelementptr inbounds i8, ptr %var_A, i64 40, !dbg !15
  %57 = load i64, ptr %56, align 8, !dbg !15
  %58 = icmp eq i64 %57, 0, !dbg !15
  br i1 %58, label %assert_end20, label %assert_fail19, !dbg !15, !prof !16

assert_fail17:                                    ; preds = %if_then
  %59 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %59(ptr nonnull @.str.1, ptr nonnull @.str.10), !dbg !15
  br label %common.ret, !dbg !15

assert_fail19:                                    ; preds = %if_end
  %60 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %60(ptr nonnull @.str.1, ptr nonnull @.str.11), !dbg !15
  br label %common.ret, !dbg !15

assert_end20:                                     ; preds = %if_end
  %61 = getelementptr inbounds i8, ptr %var_A, i64 8, !dbg !15
  %62 = load i32, ptr %61, align 4, !dbg !15
  %63 = icmp eq i32 %62, 1, !dbg !15
  br i1 %63, label %assert_end22, label %assert_fail21, !dbg !15, !prof !16

assert_fail21:                                    ; preds = %assert_end20
  %64 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %64(ptr nonnull @.str.1, ptr nonnull @.str.12), !dbg !15
  br label %common.ret, !dbg !15

assert_end22:                                     ; preds = %assert_end20
  %65 = icmp ne ptr %A, null, !dbg !15
  %66 = mul nsw i32 %N, %M, !dbg !15
  %67 = icmp eq i32 %66, 0, !dbg !15
  %68 = or i1 %67, %65, !dbg !15
  br i1 %68, label %assert_end24, label %assert_fail23, !dbg !15, !prof !16

assert_fail23:                                    ; preds = %assert_end22
  %69 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %69(ptr nonnull @.str.1, ptr nonnull @.str.13), !dbg !15
  br label %common.ret, !dbg !15

assert_end24:                                     ; preds = %assert_end22
  %70 = getelementptr inbounds i8, ptr %var_T_expand_dims, i64 22, !dbg !15
  %71 = load i16, ptr %70, align 2, !dbg !15
  %72 = icmp eq i16 %71, 1, !dbg !15
  %73 = getelementptr inbounds i8, ptr %var_T_expand_dims, i64 21, !dbg !15
  %74 = load i8, ptr %73, align 1, !dbg !15
  %75 = icmp eq i8 %74, 32, !dbg !15
  %76 = getelementptr inbounds i8, ptr %var_T_expand_dims, i64 20, !dbg !15
  %77 = load i8, ptr %76, align 1, !dbg !15
  %78 = icmp eq i8 %77, 2, !dbg !15
  %79 = and i1 %75, %78, !dbg !15
  %80 = and i1 %72, %79, !dbg !15
  br i1 %80, label %assert_end26, label %assert_fail25, !dbg !15, !prof !16

assert_fail25:                                    ; preds = %assert_end24
  %81 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %81(ptr nonnull @.str.1, ptr nonnull @.str.14), !dbg !15
  br label %common.ret, !dbg !15

assert_end26:                                     ; preds = %assert_end24
  %82 = load i64, ptr %unsqueeze.var_T_expand_dims.shape, align 8, !dbg !15, !tbaa !62
  %83 = trunc i64 %82 to i32, !dbg !15
  %84 = icmp eq i32 %M, %83, !dbg !15
  br i1 %84, label %assert_end28, label %assert_fail27, !dbg !15, !prof !16

assert_fail27:                                    ; preds = %assert_end26
  %85 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %85(ptr nonnull @.str.1, ptr nonnull @.str.15), !dbg !15
  br label %common.ret, !dbg !15

assert_end28:                                     ; preds = %assert_end26
  %86 = getelementptr inbounds i8, ptr %unsqueeze.var_T_expand_dims.shape, i64 8, !dbg !15
  %87 = load i64, ptr %86, align 8, !dbg !15, !tbaa !72
  %88 = and i64 %87, 4294967295, !dbg !15
  %89 = icmp eq i64 %88, 1, !dbg !15
  br i1 %89, label %assert_end30, label %assert_fail29, !dbg !15, !prof !16

assert_fail29:                                    ; preds = %assert_end28
  %90 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %90(ptr nonnull @.str.1, ptr nonnull @.str.16), !dbg !15
  br label %common.ret, !dbg !15

assert_end30:                                     ; preds = %assert_end28
  %91 = getelementptr inbounds i8, ptr %unsqueeze.var_T_expand_dims.shape, i64 16, !dbg !15
  %92 = load i64, ptr %91, align 8, !dbg !15, !tbaa !74
  %93 = trunc i64 %92 to i32, !dbg !15
  %94 = icmp eq i32 %N, %93, !dbg !15
  br i1 %94, label %assert_end32, label %assert_fail31, !dbg !15, !prof !16

assert_fail31:                                    ; preds = %assert_end30
  %95 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %95(ptr nonnull @.str.1, ptr nonnull @.str.17), !dbg !15
  br label %common.ret, !dbg !15

assert_end32:                                     ; preds = %assert_end30
  %.not49 = icmp eq ptr %unsqueeze.var_T_expand_dims.strides, null, !dbg !15
  br i1 %.not49, label %if_end34, label %if_then33, !dbg !15, !prof !20

if_then33:                                        ; preds = %assert_end32
  %96 = load i64, ptr %unsqueeze.var_T_expand_dims.strides, align 8, !dbg !15, !tbaa !77
  %97 = trunc i64 %96 to i32, !dbg !15
  %98 = icmp eq i32 %N, %97, !dbg !15
  %99 = icmp eq i32 %M, 1, !dbg !15
  %100 = or i1 %99, %98, !dbg !15
  %101 = getelementptr inbounds i8, ptr %unsqueeze.var_T_expand_dims.strides, i64 16, !dbg !15
  %102 = load i64, ptr %101, align 8, !dbg !15, !tbaa !87
  %103 = and i64 %102, 4294967295, !dbg !15
  %104 = icmp eq i64 %103, 1, !dbg !15
  %105 = icmp eq i32 %N, 1, !dbg !15
  %106 = or i1 %105, %104, !dbg !15
  %107 = and i1 %100, %106, !dbg !15
  br i1 %107, label %if_end34, label %assert_fail35, !dbg !15, !prof !16

if_end34:                                         ; preds = %if_then33, %assert_end32
  %108 = getelementptr inbounds i8, ptr %var_T_expand_dims, i64 40, !dbg !15
  %109 = load i64, ptr %108, align 8, !dbg !15
  %110 = icmp eq i64 %109, 0, !dbg !15
  br i1 %110, label %assert_end38, label %assert_fail37, !dbg !15, !prof !16

assert_fail35:                                    ; preds = %if_then33
  %111 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %111(ptr nonnull @.str.1, ptr nonnull @.str.18), !dbg !15
  br label %common.ret, !dbg !15

assert_fail37:                                    ; preds = %if_end34
  %112 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %112(ptr nonnull @.str.1, ptr nonnull @.str.19), !dbg !15
  br label %common.ret, !dbg !15

assert_end38:                                     ; preds = %if_end34
  %113 = getelementptr inbounds i8, ptr %var_T_expand_dims, i64 8, !dbg !15
  %114 = load i32, ptr %113, align 4, !dbg !15
  %115 = icmp eq i32 %114, 1, !dbg !15
  br i1 %115, label %assert_end40, label %assert_fail39, !dbg !15, !prof !16

assert_fail39:                                    ; preds = %assert_end38
  %116 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %116(ptr nonnull @.str.1, ptr nonnull @.str.20), !dbg !15
  br label %common.ret, !dbg !15

assert_end40:                                     ; preds = %assert_end38
  %117 = getelementptr inbounds i8, ptr %var_T_expand_dims, i64 12, !dbg !15
  %118 = load i32, ptr %117, align 4, !dbg !15
  %119 = icmp eq i32 %dev_id, %118, !dbg !15
  br i1 %119, label %assert_end42, label %assert_fail41, !dbg !15, !prof !16

assert_fail41:                                    ; preds = %assert_end40
  %120 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %120(ptr nonnull @.str.1, ptr nonnull @.str.21), !dbg !15
  br label %common.ret, !dbg !15

assert_end42:                                     ; preds = %assert_end40
  %121 = icmp ne ptr %T_expand_dims, null, !dbg !15
  %122 = or i1 %67, %121, !dbg !15
  br i1 %122, label %assert_end44, label %assert_fail43, !dbg !15, !prof !16

assert_fail43:                                    ; preds = %assert_end42
  %123 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  tail call void %123(ptr nonnull @.str.1, ptr nonnull @.str.22), !dbg !15
  br label %common.ret, !dbg !15

assert_end44:                                     ; preds = %assert_end42
  tail call fastcc void @unsqueeze_compute_(i32 %M, i32 %N, ptr %T_expand_dims, ptr %A), !dbg !15
  br label %common.ret, !dbg !15
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define internal fastcc void @unsqueeze_compute_(i32 %M, i32 %N, ptr noalias nocapture writeonly align 64 %T_expand_dims, ptr noalias nocapture readonly align 64 %A) unnamed_addr #2 !dbg !90 {
entry:
    #dbg_value(i32 %M, !94, !DIExpression(), !98)
    #dbg_value(i32 %N, !95, !DIExpression(), !98)
    #dbg_value(ptr %T_expand_dims, !96, !DIExpression(), !98)
    #dbg_value(ptr %A, !97, !DIExpression(), !98)
    #dbg_declare(i32 0, !99, !DIExpression(), !98)
  %0 = icmp sgt i32 %M, 0, !dbg !98
  %1 = icmp sgt i32 %N, 0
  %or.cond = select i1 %0, i1 %1, i1 false, !dbg !98
  br i1 %or.cond, label %for_begin_ax2.preheader.us.preheader, label %for_end_ax0, !dbg !98, !prof !100

for_begin_ax2.preheader.us.preheader:             ; preds = %entry
  %2 = zext nneg i32 %N to i64, !dbg !98
  %3 = shl nuw nsw i64 %2, 2
  %wide.trip.count = zext nneg i32 %M to i64, !dbg !98
  %xtraiter = and i64 %wide.trip.count, 3, !dbg !98
  %4 = icmp ult i32 %M, 4, !dbg !98
  br i1 %4, label %for_end_ax0.loopexit.unr-lcssa, label %for_begin_ax2.preheader.us.preheader.new, !dbg !98, !prof !101

for_begin_ax2.preheader.us.preheader.new:         ; preds = %for_begin_ax2.preheader.us.preheader
  %unroll_iter = and i64 %wide.trip.count, 2147483644, !dbg !98
  br label %for_begin_ax2.preheader.us, !dbg !98

for_begin_ax2.preheader.us:                       ; preds = %for_begin_ax2.preheader.us, %for_begin_ax2.preheader.us.preheader.new
  %indvar = phi i64 [ 0, %for_begin_ax2.preheader.us.preheader.new ], [ %indvar.next.3, %for_begin_ax2.preheader.us ]
  %niter = phi i64 [ 0, %for_begin_ax2.preheader.us.preheader.new ], [ %niter.next.3, %for_begin_ax2.preheader.us ]
  %5 = mul i64 %3, %indvar
  %scevgep = getelementptr i8, ptr %T_expand_dims, i64 %5
    #dbg_declare(i64 %indvar, !99, !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned), !98)
    #dbg_declare(i32 0, !102, !DIExpression(), !98)
  %scevgep4 = getelementptr i8, ptr %A, i64 %5
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 16 %scevgep, ptr align 16 %scevgep4, i64 %3, i1 false), !dbg !98
    #dbg_declare(i64 poison, !102, !DIExpression(), !98)
  %indvar.next = or disjoint i64 %indvar, 1, !dbg !98
    #dbg_declare(i64 %indvar.next, !99, !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned), !98)
  %6 = mul i64 %3, %indvar.next
  %scevgep.1 = getelementptr i8, ptr %T_expand_dims, i64 %6
    #dbg_declare(i64 %indvar.next, !99, !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned), !98)
    #dbg_declare(i32 0, !102, !DIExpression(), !98)
  %scevgep4.1 = getelementptr i8, ptr %A, i64 %6
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 4 %scevgep.1, ptr align 4 %scevgep4.1, i64 %3, i1 false), !dbg !98
    #dbg_declare(i64 poison, !102, !DIExpression(), !98)
  %indvar.next.1 = or disjoint i64 %indvar, 2, !dbg !98
    #dbg_declare(i64 %indvar.next.1, !99, !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned), !98)
  %7 = mul i64 %3, %indvar.next.1
  %scevgep.2 = getelementptr i8, ptr %T_expand_dims, i64 %7
    #dbg_declare(i64 %indvar.next.1, !99, !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned), !98)
    #dbg_declare(i32 0, !102, !DIExpression(), !98)
  %scevgep4.2 = getelementptr i8, ptr %A, i64 %7
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 8 %scevgep.2, ptr align 8 %scevgep4.2, i64 %3, i1 false), !dbg !98
    #dbg_declare(i64 poison, !102, !DIExpression(), !98)
  %indvar.next.2 = or disjoint i64 %indvar, 3, !dbg !98
    #dbg_declare(i64 %indvar.next.2, !99, !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned), !98)
  %8 = mul i64 %3, %indvar.next.2
  %scevgep.3 = getelementptr i8, ptr %T_expand_dims, i64 %8
    #dbg_declare(i64 %indvar.next.2, !99, !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned), !98)
    #dbg_declare(i32 0, !102, !DIExpression(), !98)
  %scevgep4.3 = getelementptr i8, ptr %A, i64 %8
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 4 %scevgep.3, ptr align 4 %scevgep4.3, i64 %3, i1 false), !dbg !98
    #dbg_declare(i64 poison, !102, !DIExpression(), !98)
  %indvar.next.3 = add nuw nsw i64 %indvar, 4, !dbg !98
    #dbg_declare(i64 %indvar.next.3, !99, !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned), !98)
  %niter.next.3 = add i64 %niter, 4, !dbg !98
  %niter.ncmp.3 = icmp eq i64 %niter.next.3, %unroll_iter, !dbg !98
  br i1 %niter.ncmp.3, label %for_end_ax0.loopexit.unr-lcssa, label %for_begin_ax2.preheader.us, !dbg !98, !prof !103

for_end_ax0.loopexit.unr-lcssa:                   ; preds = %for_begin_ax2.preheader.us, %for_begin_ax2.preheader.us.preheader
  %indvar.unr = phi i64 [ 0, %for_begin_ax2.preheader.us.preheader ], [ %indvar.next.3, %for_begin_ax2.preheader.us ]
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0, !dbg !98
  br i1 %lcmp.mod.not, label %for_end_ax0, label %for_begin_ax2.preheader.us.epil, !dbg !98, !prof !104

for_begin_ax2.preheader.us.epil:                  ; preds = %for_end_ax0.loopexit.unr-lcssa, %for_begin_ax2.preheader.us.epil
  %indvar.epil = phi i64 [ %indvar.next.epil, %for_begin_ax2.preheader.us.epil ], [ %indvar.unr, %for_end_ax0.loopexit.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.next, %for_begin_ax2.preheader.us.epil ], [ 0, %for_end_ax0.loopexit.unr-lcssa ]
  %9 = mul i64 %3, %indvar.epil
  %scevgep.epil = getelementptr i8, ptr %T_expand_dims, i64 %9
    #dbg_declare(i64 %indvar.epil, !99, !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned), !98)
    #dbg_declare(i32 0, !102, !DIExpression(), !98)
  %scevgep4.epil = getelementptr i8, ptr %A, i64 %9
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 4 %scevgep.epil, ptr align 4 %scevgep4.epil, i64 %3, i1 false), !dbg !98
    #dbg_declare(i64 poison, !102, !DIExpression(), !98)
  %indvar.next.epil = add nuw nsw i64 %indvar.epil, 1, !dbg !98
    #dbg_declare(i64 %indvar.next.epil, !99, !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned), !98)
  %epil.iter.next = add i64 %epil.iter, 1, !dbg !98
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.next, %xtraiter, !dbg !98
  br i1 %epil.iter.cmp.not, label %for_end_ax0, label %for_begin_ax2.preheader.us.epil, !dbg !98, !prof !105, !llvm.loop !106

for_end_ax0:                                      ; preds = %for_end_ax0.loopexit.unr-lcssa, %for_begin_ax2.preheader.us.epil, %entry
  ret void, !dbg !98
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
declare float @llvm.fabs.f32(float) #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare half @llvm.fabs.f16(half) #4

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #5

attributes #0 = { "target-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #2 = { nofree noinline norecurse nosync nounwind memory(argmem: readwrite) "target-cpu"="generic" }
attributes #3 = { nofree nosync nounwind memory(none) "target-cpu"="generic" "target-features" }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "TVM", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "IRModule.CodeGenLLVM", directory: ".")
!2 = !{i32 2, !"tvm_target", !"llvm -mtriple=x86_64-unknown-linux-gnu"}
!3 = !{i32 4, !"Debug Info Version", i32 3}
!4 = !{i32 4, !"Dwarf Version", i32 4}
!5 = distinct !DISubprogram(name: "unsqueeze", scope: !1, file: !1, type: !6, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !10)
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
!22 = !DILocalVariable(name: "var_T_expand_dims.type_index", scope: !5, file: !1, type: !8)
!23 = !DILocalVariable(name: "var_A", scope: !5, file: !1, type: !9)
!24 = !DILocalVariable(name: "var_T_expand_dims", scope: !5, file: !1, type: !9)
!25 = !DILocalVariable(name: "unsqueeze.var_A.shape", scope: !5, file: !1, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27)
!27 = !DIBasicType(name: "int64", size: 64, encoding: DW_ATE_signed)
!28 = !{!29, !29, i64 0}
!29 = !{!"0x198c7870.w8.b0", !30, i64 0}
!30 = !{!"0x198c7870.w16.b0", !31, i64 0}
!31 = !{!"0x198c7870.w32.b0", !32, i64 0}
!32 = !{!"0x198c7870.w64.b0", !33, i64 0}
!33 = !{!"0x198c7870.w128.b0", !34, i64 0}
!34 = !{!"0x198c7870.w256.b0", !35, i64 0}
!35 = !{!"0x198c7870.w512.b0", !36, i64 0}
!36 = !{!"0x198c7870.w1024.b0", !37, i64 0}
!37 = !{!"0x198c7870", !19, i64 0}
!38 = !DILocalVariable(name: "M", scope: !5, file: !1, type: !8)
!39 = !{!40, !40, i64 0}
!40 = !{!"0x198c7870.w8.b8", !30, i64 0}
!41 = !DILocalVariable(name: "N", scope: !5, file: !1, type: !8)
!42 = !DILocalVariable(name: "unsqueeze.var_A.strides", scope: !5, file: !1, type: !26)
!43 = !DILocalVariable(name: "dev_id", scope: !5, file: !1, type: !8)
!44 = !DILocalVariable(name: "A", scope: !5, file: !1, type: !45)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46)
!46 = !DIBasicType(name: "float32", size: 32, encoding: DW_ATE_float)
!47 = !DILocalVariable(name: "unsqueeze.var_T_expand_dims.shape", scope: !5, file: !1, type: !26)
!48 = !DILocalVariable(name: "unsqueeze.var_T_expand_dims.strides", scope: !5, file: !1, type: !26)
!49 = !DILocalVariable(name: "T_expand_dims", scope: !5, file: !1, type: !45)
!50 = !{!51, !51, i64 0}
!51 = !{!"0x198e45e0.w8.b0", !52, i64 0}
!52 = !{!"0x198e45e0.w16.b0", !53, i64 0}
!53 = !{!"0x198e45e0.w32.b0", !54, i64 0}
!54 = !{!"0x198e45e0.w64.b0", !55, i64 0}
!55 = !{!"0x198e45e0.w128.b0", !56, i64 0}
!56 = !{!"0x198e45e0.w256.b0", !57, i64 0}
!57 = !{!"0x198e45e0.w512.b0", !58, i64 0}
!58 = !{!"0x198e45e0.w1024.b0", !59, i64 0}
!59 = !{!"0x198e45e0", !19, i64 0}
!60 = !{!61, !61, i64 0}
!61 = !{!"0x198e45e0.w8.b8", !52, i64 0}
!62 = !{!63, !63, i64 0}
!63 = !{!"0x198e8af0.w8.b0", !64, i64 0}
!64 = !{!"0x198e8af0.w16.b0", !65, i64 0}
!65 = !{!"0x198e8af0.w32.b0", !66, i64 0}
!66 = !{!"0x198e8af0.w64.b0", !67, i64 0}
!67 = !{!"0x198e8af0.w128.b0", !68, i64 0}
!68 = !{!"0x198e8af0.w256.b0", !69, i64 0}
!69 = !{!"0x198e8af0.w512.b0", !70, i64 0}
!70 = !{!"0x198e8af0.w1024.b0", !71, i64 0}
!71 = !{!"0x198e8af0", !19, i64 0}
!72 = !{!73, !73, i64 0}
!73 = !{!"0x198e8af0.w8.b8", !64, i64 0}
!74 = !{!75, !75, i64 0}
!75 = !{!"0x198e8af0.w8.b16", !76, i64 0}
!76 = !{!"0x198e8af0.w16.b16", !65, i64 0}
!77 = !{!78, !78, i64 0}
!78 = !{!"0x19892d80.w8.b0", !79, i64 0}
!79 = !{!"0x19892d80.w16.b0", !80, i64 0}
!80 = !{!"0x19892d80.w32.b0", !81, i64 0}
!81 = !{!"0x19892d80.w64.b0", !82, i64 0}
!82 = !{!"0x19892d80.w128.b0", !83, i64 0}
!83 = !{!"0x19892d80.w256.b0", !84, i64 0}
!84 = !{!"0x19892d80.w512.b0", !85, i64 0}
!85 = !{!"0x19892d80.w1024.b0", !86, i64 0}
!86 = !{!"0x19892d80", !19, i64 0}
!87 = !{!88, !88, i64 0}
!88 = !{!"0x19892d80.w8.b16", !89, i64 0}
!89 = !{!"0x19892d80.w16.b16", !80, i64 0}
!90 = distinct !DISubprogram(name: "unsqueeze_compute_", scope: !1, file: !1, type: !91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !93)
!91 = !DISubroutineType(cc: DW_CC_nocall, types: !92)
!92 = !{!8, !8, !8, !45, !45}
!93 = !{!94, !95, !96, !97}
!94 = !DILocalVariable(name: "M", arg: 1, scope: !90, file: !1, type: !8)
!95 = !DILocalVariable(name: "N", arg: 2, scope: !90, file: !1, type: !8)
!96 = !DILocalVariable(name: "T_expand_dims", arg: 3, scope: !90, file: !1, type: !45)
!97 = !DILocalVariable(name: "A", arg: 4, scope: !90, file: !1, type: !45)
!98 = !DILocation(line: 0, scope: !90)
!99 = !DILocalVariable(name: "ax0", scope: !90, file: !1, type: !8)
!100 = !{!"branch_weights", i32 16129, i32 255}
!101 = !{!"branch_weights", i32 1, i32 127}
!102 = !DILocalVariable(name: "ax2", scope: !90, file: !1, type: !8)
!103 = !{!"branch_weights", i32 127, i32 33554289}
!104 = !{!"branch_weights", i32 3, i32 1}
!105 = !{!"branch_weights", i32 1, i32 1}
!106 = distinct !{!106, !107}
!107 = !{!"llvm.loop.unroll.disable"}
