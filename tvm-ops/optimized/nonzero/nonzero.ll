; ModuleID = 'TVMMod'
source_filename = "TVMMod"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__TVMFFIErrorSetRaisedFromCStr = linkonce dllexport local_unnamed_addr global ptr null, align 8
@.str = private constant [58 x i8] c"Assert fail: num_args == 2, nonzero: num_args should be 2\00", align 1
@.str.1 = private constant [13 x i8] c"RuntimeError\00", align 1
@.str.2 = private constant [66 x i8] c"Assert fail: not T.isnullptr(args), nonzero: args pointer is NULL\00", align 1
@.str.3 = private constant [149 x i8] c"Assert fail: var_A_type_index == 0 or var_A_type_index == 4 or var_A_type_index == 7 or var_A_type_index >= 64, nonzero: Expect arg[0] to be pointer\00", align 1
@.str.4 = private constant [189 x i8] c"Assert fail: var_T_not_equal_type_index == 0 or var_T_not_equal_type_index == 4 or var_T_not_equal_type_index == 7 or var_T_not_equal_type_index >= 64, nonzero: Expect arg[1] to be pointer\00", align 1
@.str.5 = private constant [98 x i8] c"Assert fail: not T.isnullptr(var_A), nonzero.var_A is expected to have non-NULL DLTensor* pointer\00", align 1
@.str.6 = private constant [100 x i8] c"Assert fail: 2 == T.tvm_struct_get(var_A, 0, 4, \22int32\22), nonzero.var_A.ndim is expected to equal 2\00", align 1
@.str.7 = private constant [118 x i8] c"Assert fail: not T.isnullptr(var_T_not_equal), nonzero.var_T_not_equal is expected to have non-NULL DLTensor* pointer\00", align 1
@.str.8 = private constant [120 x i8] c"Assert fail: 2 == T.tvm_struct_get(var_T_not_equal, 0, 4, \22int32\22), nonzero.var_T_not_equal.ndim is expected to equal 2\00", align 1
@.str.9 = private constant [230 x i8] c"Assert fail: T.tvm_struct_get(var_A, 0, 5, \22uint8\22) == T.uint8(2) and T.tvm_struct_get(var_A, 0, 6, \22uint8\22) == T.uint8(32) and T.tvm_struct_get(var_A, 0, 7, \22uint16\22) == T.uint16(1), nonzero.var_A.dtype is expected to be float32\00", align 1
@.str.10 = private constant [188 x i8] c"Assert fail: (N == 1 or 1 == T.Cast(\22int32\22, nonzero_var_A_strides[1])) and (M == 1 or N == T.Cast(\22int32\22, nonzero_var_A_strides[0])), nonzero.var_A.strides: expected to be compact array\00", align 1
@.str.11 = private constant [190 x i8] c"Assert fail: T.uint64(0) == T.tvm_struct_get(var_A, 0, 8, \22uint64\22), Argument nonzero.var_A.byte_offset has an unsatisfied constraint: T.uint64(0) == T.tvm_struct_get(var_A, 0, 8, \22uint64\22)\00", align 1
@.str.12 = private constant [170 x i8] c"Assert fail: T.tvm_struct_get(var_A, 0, 10, \22int32\22) == 1, Argument nonzero.var_A.device_type has an unsatisfied constraint: 1 == T.tvm_struct_get(var_A, 0, 10, \22int32\22)\00", align 1
@.str.13 = private constant [103 x i8] c"Assert fail: M * N == 0 or not T.isnullptr(A), nonzero.var_A is expected to have non-NULL data pointer\00", align 1
@.str.14 = private constant [266 x i8] c"Assert fail: T.tvm_struct_get(var_T_not_equal, 0, 5, \22uint8\22) == T.uint8(1) and T.tvm_struct_get(var_T_not_equal, 0, 6, \22uint8\22) == T.uint8(1) and T.tvm_struct_get(var_T_not_equal, 0, 7, \22uint16\22) == T.uint16(1), nonzero.var_T_not_equal.dtype is expected to be bool\00", align 1
@.str.15 = private constant [197 x i8] c"Assert fail: M == T.Cast(\22int32\22, nonzero_var_T_not_equal_shape[0]), Argument nonzero.var_T_not_equal.shape[0] has an unsatisfied constraint: M == T.Cast(\22int32\22, nonzero_var_T_not_equal_shape[0])\00", align 1
@.str.16 = private constant [197 x i8] c"Assert fail: N == T.Cast(\22int32\22, nonzero_var_T_not_equal_shape[1]), Argument nonzero.var_T_not_equal.shape[1] has an unsatisfied constraint: N == T.Cast(\22int32\22, nonzero_var_T_not_equal_shape[1])\00", align 1
@.str.17 = private constant [218 x i8] c"Assert fail: (N == 1 or 1 == T.Cast(\22int32\22, nonzero_var_T_not_equal_strides[1])) and (M == 1 or N == T.Cast(\22int32\22, nonzero_var_T_not_equal_strides[0])), nonzero.var_T_not_equal.strides: expected to be compact array\00", align 1
@.str.18 = private constant [220 x i8] c"Assert fail: T.uint64(0) == T.tvm_struct_get(var_T_not_equal, 0, 8, \22uint64\22), Argument nonzero.var_T_not_equal.byte_offset has an unsatisfied constraint: T.uint64(0) == T.tvm_struct_get(var_T_not_equal, 0, 8, \22uint64\22)\00", align 1
@.str.19 = private constant [200 x i8] c"Assert fail: T.tvm_struct_get(var_T_not_equal, 0, 10, \22int32\22) == 1, Argument nonzero.var_T_not_equal.device_type has an unsatisfied constraint: 1 == T.tvm_struct_get(var_T_not_equal, 0, 10, \22int32\22)\00", align 1
@.str.20 = private constant [206 x i8] c"Assert fail: dev_id == T.tvm_struct_get(var_T_not_equal, 0, 9, \22int32\22), Argument nonzero.var_T_not_equal.device_id has an unsatisfied constraint: dev_id == T.tvm_struct_get(var_T_not_equal, 0, 9, \22int32\22)\00", align 1
@.str.21 = private constant [123 x i8] c"Assert fail: M * N == 0 or not T.isnullptr(T_not_equal), nonzero.var_T_not_equal is expected to have non-NULL data pointer\00", align 1
@__TVMBackendAllocWorkspace = linkonce dllexport local_unnamed_addr global ptr null, align 8
@__TVMBackendFreeWorkspace = linkonce dllexport local_unnamed_addr global ptr null, align 8
@__tvm_main__ = weak dllexport local_unnamed_addr constant [8 x i8] c"nonzero\00", align 1
@llvm.global_ctors = appending global [0 x { i32, ptr, ptr }] zeroinitializer

define dllexport range(i32 -1, 1) i32 @nonzero(ptr noalias nocapture readnone %self_handle, ptr noalias readonly %args, i32 %num_args, ptr noalias nocapture readnone %result) local_unnamed_addr #0 !dbg !5 {
entry:
    #dbg_value(ptr %self_handle, !11, !DIExpression(), !15)
    #dbg_value(ptr %args, !12, !DIExpression(), !15)
    #dbg_value(i32 %num_args, !13, !DIExpression(), !15)
    #dbg_value(ptr %result, !14, !DIExpression(), !15)
  %0 = icmp eq i32 %num_args, 2, !dbg !15
  br i1 %0, label %assert_end, label %assert_fail, !dbg !15, !prof !16

common.ret:                                       ; preds = %assert_end42, %assert_fail41, %assert_fail39, %assert_fail37, %assert_fail35, %assert_fail33, %assert_fail29, %assert_fail27, %assert_fail25, %assert_fail23, %assert_fail21, %assert_fail19, %assert_fail17, %assert_fail15, %assert_fail13, %assert_fail11, %assert_fail9, %assert_fail7, %assert_fail5, %assert_fail3, %assert_fail1, %assert_fail
  %common.ret.op = phi i32 [ -1, %assert_fail ], [ -1, %assert_fail1 ], [ -1, %assert_fail3 ], [ -1, %assert_fail5 ], [ -1, %assert_fail7 ], [ -1, %assert_fail9 ], [ -1, %assert_fail11 ], [ -1, %assert_fail13 ], [ -1, %assert_fail15 ], [ -1, %assert_fail17 ], [ -1, %assert_fail19 ], [ -1, %assert_fail21 ], [ -1, %assert_fail23 ], [ -1, %assert_fail25 ], [ -1, %assert_fail27 ], [ -1, %assert_fail29 ], [ -1, %assert_fail33 ], [ -1, %assert_fail35 ], [ -1, %assert_fail37 ], [ -1, %assert_fail39 ], [ -1, %assert_fail41 ], [ %119, %assert_end42 ]
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
  %var_T_not_equal.type_index = load i32, ptr %5, align 4, !dbg !15
    #dbg_declare(i32 %var_T_not_equal.type_index, !22, !DIExpression(), !15)
    #dbg_declare(i32 %var_T_not_equal.type_index, !22, !DIExpression(), !15)
  %var_T_not_equal.type_index.fr = freeze i32 %var_T_not_equal.type_index, !dbg !15
  %6 = icmp sgt i32 %var_T_not_equal.type_index.fr, 63, !dbg !15
  br i1 %6, label %assert_end6, label %switch.early.test43, !dbg !15

switch.early.test43:                              ; preds = %assert_end4
  switch i32 %var_T_not_equal.type_index.fr, label %assert_fail5 [
    i32 7, label %assert_end6
    i32 4, label %assert_end6
    i32 0, label %assert_end6
  ], !dbg !15

assert_fail5:                                     ; preds = %switch.early.test43
  %7 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %7(ptr nonnull @.str.1, ptr nonnull @.str.4), !dbg !15
  br label %common.ret, !dbg !15

assert_end6:                                      ; preds = %switch.early.test43, %switch.early.test43, %switch.early.test43, %assert_end4
  %8 = getelementptr inbounds nuw i8, ptr %args, i64 8, !dbg !15
  %9 = load ptr, ptr %8, align 8, !dbg !15
  %10 = icmp eq i32 %var_A.type_index.fr, 72, !dbg !15
  %var_A.idx = select i1 %10, i64 16, i64 0, !dbg !15
  %var_A = getelementptr inbounds nuw i8, ptr %9, i64 %var_A.idx, !dbg !15
    #dbg_declare(ptr %var_A, !23, !DIExpression(), !15)
    #dbg_declare(ptr %var_A, !23, !DIExpression(), !15)
  %11 = getelementptr inbounds nuw i8, ptr %args, i64 24, !dbg !15
  %12 = load ptr, ptr %11, align 8, !dbg !15
  %13 = icmp eq i32 %var_T_not_equal.type_index.fr, 72, !dbg !15
  %var_T_not_equal.idx = select i1 %13, i64 16, i64 0, !dbg !15
  %var_T_not_equal = getelementptr inbounds nuw i8, ptr %12, i64 %var_T_not_equal.idx, !dbg !15
    #dbg_declare(ptr %var_T_not_equal, !24, !DIExpression(), !15)
    #dbg_declare(ptr %var_T_not_equal, !24, !DIExpression(), !15)
  %.not44 = icmp eq ptr %9, null, !dbg !15
  br i1 %.not44, label %assert_fail7, label %assert_end8, !dbg !15, !prof !20

assert_fail7:                                     ; preds = %assert_end6
  %14 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %14(ptr nonnull @.str.1, ptr nonnull @.str.5), !dbg !15
  br label %common.ret, !dbg !15

assert_end8:                                      ; preds = %assert_end6
  %15 = getelementptr inbounds nuw i8, ptr %var_A, i64 16, !dbg !15
  %16 = load i32, ptr %15, align 4, !dbg !15
  %17 = icmp eq i32 %16, 2, !dbg !15
  br i1 %17, label %assert_end10, label %assert_fail9, !dbg !15, !prof !16

assert_fail9:                                     ; preds = %assert_end8
  %18 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %18(ptr nonnull @.str.1, ptr nonnull @.str.6), !dbg !15
  br label %common.ret, !dbg !15

assert_end10:                                     ; preds = %assert_end8
  %19 = getelementptr inbounds nuw i8, ptr %var_A, i64 24, !dbg !15
  %nonzero.var_A.shape = load ptr, ptr %19, align 8, !dbg !15
    #dbg_declare(ptr %nonzero.var_A.shape, !25, !DIExpression(), !15)
    #dbg_declare(ptr %nonzero.var_A.shape, !25, !DIExpression(), !15)
  %20 = load i64, ptr %nonzero.var_A.shape, align 8, !dbg !15, !tbaa !28
  %M = trunc i64 %20 to i32, !dbg !15
    #dbg_declare(i32 %M, !38, !DIExpression(), !15)
    #dbg_declare(i32 %M, !38, !DIExpression(), !15)
  %21 = getelementptr inbounds nuw i8, ptr %nonzero.var_A.shape, i64 8, !dbg !15
  %22 = load i64, ptr %21, align 8, !dbg !15, !tbaa !39
  %N = trunc i64 %22 to i32, !dbg !15
    #dbg_declare(i32 %N, !41, !DIExpression(), !15)
    #dbg_declare(i32 %N, !41, !DIExpression(), !15)
  %23 = getelementptr inbounds nuw i8, ptr %var_A, i64 32, !dbg !15
  %nonzero.var_A.strides = load ptr, ptr %23, align 8, !dbg !15
    #dbg_declare(ptr %nonzero.var_A.strides, !42, !DIExpression(), !15)
    #dbg_declare(ptr %nonzero.var_A.strides, !42, !DIExpression(), !15)
  %24 = getelementptr inbounds nuw i8, ptr %var_A, i64 12, !dbg !15
  %dev_id = load i32, ptr %24, align 4, !dbg !15
    #dbg_declare(i32 %dev_id, !43, !DIExpression(), !15)
    #dbg_declare(i32 %dev_id, !43, !DIExpression(), !15)
  %A = load ptr, ptr %var_A, align 8, !dbg !15
    #dbg_declare(ptr %A, !44, !DIExpression(), !15)
    #dbg_declare(ptr %A, !44, !DIExpression(), !15)
  call void @llvm.assume(i1 true) [ "align"(ptr %A, i64 64) ], !dbg !15
  %.not45 = icmp eq ptr %12, null, !dbg !15
  br i1 %.not45, label %assert_fail11, label %assert_end12, !dbg !15, !prof !20

assert_fail11:                                    ; preds = %assert_end10
  %25 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %25(ptr nonnull @.str.1, ptr nonnull @.str.7), !dbg !15
  br label %common.ret, !dbg !15

assert_end12:                                     ; preds = %assert_end10
  %26 = getelementptr inbounds nuw i8, ptr %var_T_not_equal, i64 16, !dbg !15
  %27 = load i32, ptr %26, align 4, !dbg !15
  %28 = icmp eq i32 %27, 2, !dbg !15
  br i1 %28, label %assert_end14, label %assert_fail13, !dbg !15, !prof !16

assert_fail13:                                    ; preds = %assert_end12
  %29 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %29(ptr nonnull @.str.1, ptr nonnull @.str.8), !dbg !15
  br label %common.ret, !dbg !15

assert_end14:                                     ; preds = %assert_end12
  %30 = getelementptr inbounds nuw i8, ptr %var_T_not_equal, i64 24, !dbg !15
  %nonzero.var_T_not_equal.shape = load ptr, ptr %30, align 8, !dbg !15
    #dbg_declare(ptr %nonzero.var_T_not_equal.shape, !47, !DIExpression(), !15)
    #dbg_declare(ptr %nonzero.var_T_not_equal.shape, !47, !DIExpression(), !15)
  %31 = getelementptr inbounds nuw i8, ptr %var_T_not_equal, i64 32, !dbg !15
  %nonzero.var_T_not_equal.strides = load ptr, ptr %31, align 8, !dbg !15
    #dbg_declare(ptr %nonzero.var_T_not_equal.strides, !48, !DIExpression(), !15)
    #dbg_declare(ptr %nonzero.var_T_not_equal.strides, !48, !DIExpression(), !15)
  %T_not_equal = load ptr, ptr %var_T_not_equal, align 8, !dbg !15
    #dbg_declare(ptr %T_not_equal, !49, !DIExpression(), !15)
    #dbg_declare(ptr %T_not_equal, !49, !DIExpression(), !15)
  call void @llvm.assume(i1 true) [ "align"(ptr %T_not_equal, i64 64) ], !dbg !15
  %32 = getelementptr inbounds nuw i8, ptr %var_A, i64 22, !dbg !15
  %33 = load i16, ptr %32, align 2, !dbg !15
  %34 = icmp eq i16 %33, 1, !dbg !15
  %35 = getelementptr inbounds nuw i8, ptr %var_A, i64 21, !dbg !15
  %36 = load i8, ptr %35, align 1, !dbg !15
  %37 = icmp eq i8 %36, 32, !dbg !15
  %38 = getelementptr inbounds nuw i8, ptr %var_A, i64 20, !dbg !15
  %39 = load i8, ptr %38, align 1, !dbg !15
  %40 = icmp eq i8 %39, 2, !dbg !15
  %41 = and i1 %37, %40, !dbg !15
  %42 = and i1 %34, %41, !dbg !15
  br i1 %42, label %assert_end16, label %assert_fail15, !dbg !15, !prof !16

assert_fail15:                                    ; preds = %assert_end14
  %43 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %43(ptr nonnull @.str.1, ptr nonnull @.str.9), !dbg !15
  br label %common.ret, !dbg !15

assert_end16:                                     ; preds = %assert_end14
  %.not46 = icmp eq ptr %nonzero.var_A.strides, null, !dbg !15
  br i1 %.not46, label %if_end, label %if_then, !dbg !15, !prof !20

if_then:                                          ; preds = %assert_end16
  %44 = load i64, ptr %nonzero.var_A.strides, align 8, !dbg !15, !tbaa !52
  %45 = trunc i64 %44 to i32, !dbg !15
  %46 = icmp eq i32 %N, %45, !dbg !15
  %47 = icmp eq i32 %M, 1, !dbg !15
  %48 = or i1 %47, %46, !dbg !15
  %49 = getelementptr inbounds nuw i8, ptr %nonzero.var_A.strides, i64 8, !dbg !15
  %50 = load i64, ptr %49, align 8, !dbg !15, !tbaa !62
  %51 = and i64 %50, 4294967295, !dbg !15
  %52 = icmp eq i64 %51, 1, !dbg !15
  %53 = icmp eq i32 %N, 1, !dbg !15
  %54 = or i1 %53, %52, !dbg !15
  %55 = and i1 %48, %54, !dbg !15
  br i1 %55, label %if_end, label %assert_fail17, !dbg !15, !prof !16

if_end:                                           ; preds = %if_then, %assert_end16
  %56 = getelementptr inbounds nuw i8, ptr %var_A, i64 40, !dbg !15
  %57 = load i64, ptr %56, align 8, !dbg !15
  %58 = icmp eq i64 %57, 0, !dbg !15
  br i1 %58, label %assert_end20, label %assert_fail19, !dbg !15, !prof !16

assert_fail17:                                    ; preds = %if_then
  %59 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %59(ptr nonnull @.str.1, ptr nonnull @.str.10), !dbg !15
  br label %common.ret, !dbg !15

assert_fail19:                                    ; preds = %if_end
  %60 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %60(ptr nonnull @.str.1, ptr nonnull @.str.11), !dbg !15
  br label %common.ret, !dbg !15

assert_end20:                                     ; preds = %if_end
  %61 = getelementptr inbounds nuw i8, ptr %var_A, i64 8, !dbg !15
  %62 = load i32, ptr %61, align 4, !dbg !15
  %63 = icmp eq i32 %62, 1, !dbg !15
  br i1 %63, label %assert_end22, label %assert_fail21, !dbg !15, !prof !16

assert_fail21:                                    ; preds = %assert_end20
  %64 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %64(ptr nonnull @.str.1, ptr nonnull @.str.12), !dbg !15
  br label %common.ret, !dbg !15

assert_end22:                                     ; preds = %assert_end20
  %65 = icmp ne ptr %A, null, !dbg !15
  %66 = mul nsw i32 %N, %M, !dbg !15
  %67 = icmp eq i32 %66, 0, !dbg !15
  %68 = or i1 %67, %65, !dbg !15
  br i1 %68, label %assert_end24, label %assert_fail23, !dbg !15, !prof !16

assert_fail23:                                    ; preds = %assert_end22
  %69 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %69(ptr nonnull @.str.1, ptr nonnull @.str.13), !dbg !15
  br label %common.ret, !dbg !15

assert_end24:                                     ; preds = %assert_end22
  %70 = getelementptr inbounds nuw i8, ptr %var_T_not_equal, i64 22, !dbg !15
  %71 = load i16, ptr %70, align 2, !dbg !15
  %72 = icmp eq i16 %71, 1, !dbg !15
  %73 = getelementptr inbounds nuw i8, ptr %var_T_not_equal, i64 21, !dbg !15
  %74 = load i8, ptr %73, align 1, !dbg !15
  %75 = icmp eq i8 %74, 1, !dbg !15
  %76 = getelementptr inbounds nuw i8, ptr %var_T_not_equal, i64 20, !dbg !15
  %77 = load i8, ptr %76, align 1, !dbg !15
  %78 = icmp eq i8 %77, 1, !dbg !15
  %79 = and i1 %75, %78, !dbg !15
  %80 = and i1 %72, %79, !dbg !15
  br i1 %80, label %assert_end26, label %assert_fail25, !dbg !15, !prof !16

assert_fail25:                                    ; preds = %assert_end24
  %81 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %81(ptr nonnull @.str.1, ptr nonnull @.str.14), !dbg !15
  br label %common.ret, !dbg !15

assert_end26:                                     ; preds = %assert_end24
  %82 = load i64, ptr %nonzero.var_T_not_equal.shape, align 8, !dbg !15, !tbaa !64
  %83 = trunc i64 %82 to i32, !dbg !15
  %84 = icmp eq i32 %M, %83, !dbg !15
  br i1 %84, label %assert_end28, label %assert_fail27, !dbg !15, !prof !16

assert_fail27:                                    ; preds = %assert_end26
  %85 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %85(ptr nonnull @.str.1, ptr nonnull @.str.15), !dbg !15
  br label %common.ret, !dbg !15

assert_end28:                                     ; preds = %assert_end26
  %86 = getelementptr inbounds nuw i8, ptr %nonzero.var_T_not_equal.shape, i64 8, !dbg !15
  %87 = load i64, ptr %86, align 8, !dbg !15, !tbaa !74
  %88 = trunc i64 %87 to i32, !dbg !15
  %89 = icmp eq i32 %N, %88, !dbg !15
  br i1 %89, label %assert_end30, label %assert_fail29, !dbg !15, !prof !16

assert_fail29:                                    ; preds = %assert_end28
  %90 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %90(ptr nonnull @.str.1, ptr nonnull @.str.16), !dbg !15
  br label %common.ret, !dbg !15

assert_end30:                                     ; preds = %assert_end28
  %.not47 = icmp eq ptr %nonzero.var_T_not_equal.strides, null, !dbg !15
  br i1 %.not47, label %if_end32, label %if_then31, !dbg !15, !prof !20

if_then31:                                        ; preds = %assert_end30
  %91 = load i64, ptr %nonzero.var_T_not_equal.strides, align 8, !dbg !15, !tbaa !76
  %92 = trunc i64 %91 to i32, !dbg !15
  %93 = icmp eq i32 %N, %92, !dbg !15
  %94 = icmp eq i32 %M, 1, !dbg !15
  %95 = or i1 %94, %93, !dbg !15
  %96 = getelementptr inbounds nuw i8, ptr %nonzero.var_T_not_equal.strides, i64 8, !dbg !15
  %97 = load i64, ptr %96, align 8, !dbg !15, !tbaa !86
  %98 = and i64 %97, 4294967295, !dbg !15
  %99 = icmp eq i64 %98, 1, !dbg !15
  %100 = icmp eq i32 %N, 1, !dbg !15
  %101 = or i1 %100, %99, !dbg !15
  %102 = and i1 %95, %101, !dbg !15
  br i1 %102, label %if_end32, label %assert_fail33, !dbg !15, !prof !16

if_end32:                                         ; preds = %if_then31, %assert_end30
  %103 = getelementptr inbounds nuw i8, ptr %var_T_not_equal, i64 40, !dbg !15
  %104 = load i64, ptr %103, align 8, !dbg !15
  %105 = icmp eq i64 %104, 0, !dbg !15
  br i1 %105, label %assert_end36, label %assert_fail35, !dbg !15, !prof !16

assert_fail33:                                    ; preds = %if_then31
  %106 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %106(ptr nonnull @.str.1, ptr nonnull @.str.17), !dbg !15
  br label %common.ret, !dbg !15

assert_fail35:                                    ; preds = %if_end32
  %107 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %107(ptr nonnull @.str.1, ptr nonnull @.str.18), !dbg !15
  br label %common.ret, !dbg !15

assert_end36:                                     ; preds = %if_end32
  %108 = getelementptr inbounds nuw i8, ptr %var_T_not_equal, i64 8, !dbg !15
  %109 = load i32, ptr %108, align 4, !dbg !15
  %110 = icmp eq i32 %109, 1, !dbg !15
  br i1 %110, label %assert_end38, label %assert_fail37, !dbg !15, !prof !16

assert_fail37:                                    ; preds = %assert_end36
  %111 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %111(ptr nonnull @.str.1, ptr nonnull @.str.19), !dbg !15
  br label %common.ret, !dbg !15

assert_end38:                                     ; preds = %assert_end36
  %112 = getelementptr inbounds nuw i8, ptr %var_T_not_equal, i64 12, !dbg !15
  %113 = load i32, ptr %112, align 4, !dbg !15
  %114 = icmp eq i32 %dev_id, %113, !dbg !15
  br i1 %114, label %assert_end40, label %assert_fail39, !dbg !15, !prof !16

assert_fail39:                                    ; preds = %assert_end38
  %115 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %115(ptr nonnull @.str.1, ptr nonnull @.str.20), !dbg !15
  br label %common.ret, !dbg !15

assert_end40:                                     ; preds = %assert_end38
  %116 = icmp ne ptr %T_not_equal, null, !dbg !15
  %117 = or i1 %67, %116, !dbg !15
  br i1 %117, label %assert_end42, label %assert_fail41, !dbg !15, !prof !16

assert_fail41:                                    ; preds = %assert_end40
  %118 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %118(ptr nonnull @.str.1, ptr nonnull @.str.21), !dbg !15
  br label %common.ret, !dbg !15

assert_end42:                                     ; preds = %assert_end40
  %119 = tail call fastcc i32 @nonzero_compute_(i32 %dev_id, i32 %M, i32 %N, ptr %T_not_equal, ptr %A), !dbg !15
  br label %common.ret, !dbg !15
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: noinline
define internal fastcc range(i32 -1, 1) i32 @nonzero_compute_(i32 %dev_id, i32 %M, i32 %N, ptr noalias nocapture writeonly align 64 %T_not_equal, ptr noalias nocapture readonly align 64 %A) unnamed_addr #2 !dbg !88 {
entry:
    #dbg_value(i32 %dev_id, !92, !DIExpression(), !97)
    #dbg_value(i32 %M, !93, !DIExpression(), !97)
    #dbg_value(i32 %N, !94, !DIExpression(), !97)
    #dbg_value(ptr %T_not_equal, !95, !DIExpression(), !97)
    #dbg_value(ptr %A, !96, !DIExpression(), !97)
  %0 = mul nsw i32 %N, %M, !dbg !97
  %1 = sext i32 %0 to i64, !dbg !97
  %2 = shl nuw nsw i64 %1, 2, !dbg !97
  %3 = load ptr, ptr @__TVMBackendAllocWorkspace, align 8, !dbg !97, !tbaa !17
  %Z = tail call ptr %3(i32 1, i32 %dev_id, i64 %2, i32 0, i32 32), !dbg !97
    #dbg_declare(ptr %Z, !98, !DIExpression(), !97)
    #dbg_declare(ptr %Z, !98, !DIExpression(), !97)
  call void @llvm.assume(i1 true) [ "align"(ptr %Z, i64 64) ], !dbg !97
  %4 = icmp eq ptr %Z, null, !dbg !97
  br i1 %4, label %common.ret, label %for_begin_i.preheader, !dbg !97, !prof !16

for_begin_i.preheader:                            ; preds = %entry
    #dbg_declare(i32 0, !100, !DIExpression(), !97)
  %5 = icmp sgt i32 %M, 0, !dbg !97
  %6 = icmp sgt i32 %N, 0
  %or.cond = select i1 %5, i1 %6, i1 false, !dbg !97
  br i1 %or.cond, label %for_begin_ax1.preheader.us.preheader, label %for_end_ax0, !dbg !97, !prof !101

common.ret:                                       ; preds = %for_end_ax0, %entry
  %common.ret.op = phi i32 [ -1, %entry ], [ %., %for_end_ax0 ]
  ret i32 %common.ret.op, !dbg !97

for_begin_ax1.preheader.us.preheader:             ; preds = %for_begin_i.preheader
  %7 = zext nneg i32 %N to i64, !dbg !97
  %8 = zext nneg i32 %M to i64, !dbg !97
  %9 = mul nuw nsw i64 %7, %8, !dbg !97
  %10 = shl nuw i64 %9, 2, !dbg !97
  tail call void @llvm.memset.p0.i64(ptr nonnull align 64 %Z, i8 0, i64 %10, i1 false), !dbg !97, !tbaa !102
    #dbg_declare(i64 poison, !100, !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned), !97)
    #dbg_declare(i32 0, !104, !DIExpression(), !97)
    #dbg_declare(i32 0, !105, !DIExpression(), !97)
  %11 = zext nneg i32 %N to i64, !dbg !97
  %wide.trip.count16 = zext nneg i32 %M to i64, !dbg !97
  %min.iters.check = icmp ult i32 %N, 8
  %n.vec = and i64 %11, 2147483640
  %cmp.n = icmp eq i64 %n.vec, %11
  br label %for_begin_ax1.preheader.us, !dbg !97

for_begin_ax1.preheader.us:                       ; preds = %for_begin_ax1.preheader.us.preheader, %for_begin_ax1.for_end_ax1_crit_edge.us
  %indvars.iv13 = phi i64 [ 0, %for_begin_ax1.preheader.us.preheader ], [ %indvars.iv.next14, %for_begin_ax1.for_end_ax1_crit_edge.us ]
    #dbg_declare(i64 %indvars.iv13, !105, !DIExpression(), !97)
    #dbg_declare(i32 0, !106, !DIExpression(), !97)
  %12 = mul nuw nsw i64 %indvars.iv13, %11
  br i1 %min.iters.check, label %for_body_ax1.us.preheader, label %vector.body, !dbg !97, !prof !107

vector.body:                                      ; preds = %for_begin_ax1.preheader.us, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %for_begin_ax1.preheader.us ], !dbg !97
  %13 = add nuw nsw i64 %index, %12, !dbg !97
  %14 = getelementptr inbounds nuw float, ptr %A, i64 %13, !dbg !97
  %15 = getelementptr inbounds nuw i8, ptr %14, i64 16, !dbg !97
  %wide.load = load <4 x float>, ptr %14, align 4, !dbg !97, !tbaa !108
  %wide.load18 = load <4 x float>, ptr %15, align 4, !dbg !97, !tbaa !108
  %16 = getelementptr inbounds nuw i32, ptr %Z, i64 %13, !dbg !97
  %17 = getelementptr inbounds nuw i8, ptr %16, i64 16, !dbg !97
  %wide.load19 = load <4 x i32>, ptr %16, align 4, !dbg !97, !tbaa !102
  %wide.load20 = load <4 x i32>, ptr %17, align 4, !dbg !97, !tbaa !102
  %18 = sitofp <4 x i32> %wide.load19 to <4 x float>, !dbg !97
  %19 = sitofp <4 x i32> %wide.load20 to <4 x float>, !dbg !97
  %20 = fcmp one <4 x float> %wide.load, %18, !dbg !97
  %21 = fcmp one <4 x float> %wide.load18, %19, !dbg !97
  %22 = zext <4 x i1> %20 to <4 x i8>, !dbg !97
  %23 = zext <4 x i1> %21 to <4 x i8>, !dbg !97
  %24 = getelementptr inbounds nuw i8, ptr %T_not_equal, i64 %13, !dbg !97
  %25 = getelementptr inbounds nuw i8, ptr %24, i64 4, !dbg !97
  store <4 x i8> %22, ptr %24, align 1, !dbg !97, !tbaa !110
  store <4 x i8> %23, ptr %25, align 1, !dbg !97, !tbaa !110
  %index.next = add nuw i64 %index, 8, !dbg !97
  %26 = icmp eq i64 %index.next, %n.vec, !dbg !97
  br i1 %26, label %middle.block, label %vector.body, !dbg !97, !prof !112, !llvm.loop !113

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for_begin_ax1.for_end_ax1_crit_edge.us, label %for_body_ax1.us.preheader, !dbg !97, !prof !116

for_body_ax1.us.preheader:                        ; preds = %for_begin_ax1.preheader.us, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for_begin_ax1.preheader.us ], [ %n.vec, %middle.block ]
  br label %for_body_ax1.us, !dbg !97

for_body_ax1.us:                                  ; preds = %for_body_ax1.us.preheader, %for_body_ax1.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for_body_ax1.us ], [ %indvars.iv.ph, %for_body_ax1.us.preheader ]
    #dbg_declare(i64 %indvars.iv, !106, !DIExpression(), !97)
  %27 = add nuw nsw i64 %indvars.iv, %12, !dbg !97
  %28 = getelementptr inbounds nuw float, ptr %A, i64 %27, !dbg !97
  %29 = load float, ptr %28, align 4, !dbg !97, !tbaa !108
  %30 = getelementptr inbounds nuw i32, ptr %Z, i64 %27, !dbg !97
  %31 = load i32, ptr %30, align 4, !dbg !97, !tbaa !102
  %32 = sitofp i32 %31 to float, !dbg !97
  %33 = fcmp one float %29, %32, !dbg !97
  %34 = zext i1 %33 to i8, !dbg !97
  %35 = getelementptr inbounds nuw i8, ptr %T_not_equal, i64 %27, !dbg !97
  store i8 %34, ptr %35, align 1, !dbg !97, !tbaa !110
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !97
    #dbg_declare(i64 %indvars.iv.next, !106, !DIExpression(), !97)
  %exitcond.not = icmp eq i64 %indvars.iv.next, %11, !dbg !97
  br i1 %exitcond.not, label %for_begin_ax1.for_end_ax1_crit_edge.us, label %for_body_ax1.us, !dbg !97, !prof !117, !llvm.loop !118

for_begin_ax1.for_end_ax1_crit_edge.us:           ; preds = %for_body_ax1.us, %middle.block
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1, !dbg !97
    #dbg_declare(i64 %indvars.iv.next14, !105, !DIExpression(), !97)
  %exitcond17.not = icmp eq i64 %indvars.iv.next14, %wide.trip.count16, !dbg !97
  br i1 %exitcond17.not, label %for_end_ax0, label %for_begin_ax1.preheader.us, !dbg !97, !prof !119

for_end_ax0:                                      ; preds = %for_begin_ax1.for_end_ax1_crit_edge.us, %for_begin_i.preheader
  %36 = load ptr, ptr @__TVMBackendFreeWorkspace, align 8, !dbg !97, !tbaa !17
  %37 = tail call i32 %36(i32 1, i32 %dev_id, ptr nonnull %Z), !dbg !97
  %.not = icmp ne i32 %37, 0, !dbg !97
  %. = sext i1 %.not to i32, !dbg !97
  br label %common.ret, !dbg !97
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

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #5

attributes #0 = { "target-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #2 = { noinline "target-cpu"="generic" }
attributes #3 = { nofree nosync nounwind memory(none) "target-cpu"="generic" "target-features" }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: write) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "TVM", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "IRModule.CodeGenLLVM", directory: ".")
!2 = !{i32 2, !"tvm_target", !"llvm -mtriple=x86_64-unknown-linux-gnu"}
!3 = !{i32 4, !"Debug Info Version", i32 3}
!4 = !{i32 4, !"Dwarf Version", i32 4}
!5 = distinct !DISubprogram(name: "nonzero", scope: !1, file: !1, type: !6, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !10)
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
!22 = !DILocalVariable(name: "var_T_not_equal.type_index", scope: !5, file: !1, type: !8)
!23 = !DILocalVariable(name: "var_A", scope: !5, file: !1, type: !9)
!24 = !DILocalVariable(name: "var_T_not_equal", scope: !5, file: !1, type: !9)
!25 = !DILocalVariable(name: "nonzero.var_A.shape", scope: !5, file: !1, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27)
!27 = !DIBasicType(name: "int64", size: 64, encoding: DW_ATE_signed)
!28 = !{!29, !29, i64 0}
!29 = !{!"0x63a8dd121090.w8.b0", !30, i64 0}
!30 = !{!"0x63a8dd121090.w16.b0", !31, i64 0}
!31 = !{!"0x63a8dd121090.w32.b0", !32, i64 0}
!32 = !{!"0x63a8dd121090.w64.b0", !33, i64 0}
!33 = !{!"0x63a8dd121090.w128.b0", !34, i64 0}
!34 = !{!"0x63a8dd121090.w256.b0", !35, i64 0}
!35 = !{!"0x63a8dd121090.w512.b0", !36, i64 0}
!36 = !{!"0x63a8dd121090.w1024.b0", !37, i64 0}
!37 = !{!"0x63a8dd121090", !19, i64 0}
!38 = !DILocalVariable(name: "M", scope: !5, file: !1, type: !8)
!39 = !{!40, !40, i64 0}
!40 = !{!"0x63a8dd121090.w8.b8", !30, i64 0}
!41 = !DILocalVariable(name: "N", scope: !5, file: !1, type: !8)
!42 = !DILocalVariable(name: "nonzero.var_A.strides", scope: !5, file: !1, type: !26)
!43 = !DILocalVariable(name: "dev_id", scope: !5, file: !1, type: !8)
!44 = !DILocalVariable(name: "A", scope: !5, file: !1, type: !45)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46)
!46 = !DIBasicType(name: "float32", size: 32, encoding: DW_ATE_float)
!47 = !DILocalVariable(name: "nonzero.var_T_not_equal.shape", scope: !5, file: !1, type: !26)
!48 = !DILocalVariable(name: "nonzero.var_T_not_equal.strides", scope: !5, file: !1, type: !26)
!49 = !DILocalVariable(name: "T_not_equal", scope: !5, file: !1, type: !50)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51)
!51 = !DIBasicType(name: "int8", size: 8, encoding: DW_ATE_signed)
!52 = !{!53, !53, i64 0}
!53 = !{!"0x63a8dd1e4570.w8.b0", !54, i64 0}
!54 = !{!"0x63a8dd1e4570.w16.b0", !55, i64 0}
!55 = !{!"0x63a8dd1e4570.w32.b0", !56, i64 0}
!56 = !{!"0x63a8dd1e4570.w64.b0", !57, i64 0}
!57 = !{!"0x63a8dd1e4570.w128.b0", !58, i64 0}
!58 = !{!"0x63a8dd1e4570.w256.b0", !59, i64 0}
!59 = !{!"0x63a8dd1e4570.w512.b0", !60, i64 0}
!60 = !{!"0x63a8dd1e4570.w1024.b0", !61, i64 0}
!61 = !{!"0x63a8dd1e4570", !19, i64 0}
!62 = !{!63, !63, i64 0}
!63 = !{!"0x63a8dd1e4570.w8.b8", !54, i64 0}
!64 = !{!65, !65, i64 0}
!65 = !{!"0x63a8dd1020a0.w8.b0", !66, i64 0}
!66 = !{!"0x63a8dd1020a0.w16.b0", !67, i64 0}
!67 = !{!"0x63a8dd1020a0.w32.b0", !68, i64 0}
!68 = !{!"0x63a8dd1020a0.w64.b0", !69, i64 0}
!69 = !{!"0x63a8dd1020a0.w128.b0", !70, i64 0}
!70 = !{!"0x63a8dd1020a0.w256.b0", !71, i64 0}
!71 = !{!"0x63a8dd1020a0.w512.b0", !72, i64 0}
!72 = !{!"0x63a8dd1020a0.w1024.b0", !73, i64 0}
!73 = !{!"0x63a8dd1020a0", !19, i64 0}
!74 = !{!75, !75, i64 0}
!75 = !{!"0x63a8dd1020a0.w8.b8", !66, i64 0}
!76 = !{!77, !77, i64 0}
!77 = !{!"0x63a8dd1d0510.w8.b0", !78, i64 0}
!78 = !{!"0x63a8dd1d0510.w16.b0", !79, i64 0}
!79 = !{!"0x63a8dd1d0510.w32.b0", !80, i64 0}
!80 = !{!"0x63a8dd1d0510.w64.b0", !81, i64 0}
!81 = !{!"0x63a8dd1d0510.w128.b0", !82, i64 0}
!82 = !{!"0x63a8dd1d0510.w256.b0", !83, i64 0}
!83 = !{!"0x63a8dd1d0510.w512.b0", !84, i64 0}
!84 = !{!"0x63a8dd1d0510.w1024.b0", !85, i64 0}
!85 = !{!"0x63a8dd1d0510", !19, i64 0}
!86 = !{!87, !87, i64 0}
!87 = !{!"0x63a8dd1d0510.w8.b8", !78, i64 0}
!88 = distinct !DISubprogram(name: "nonzero_compute_", scope: !1, file: !1, type: !89, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !91)
!89 = !DISubroutineType(types: !90)
!90 = !{!8, !8, !8, !8, !50, !45}
!91 = !{!92, !93, !94, !95, !96}
!92 = !DILocalVariable(name: "dev_id", arg: 1, scope: !88, file: !1, type: !8)
!93 = !DILocalVariable(name: "M", arg: 2, scope: !88, file: !1, type: !8)
!94 = !DILocalVariable(name: "N", arg: 3, scope: !88, file: !1, type: !8)
!95 = !DILocalVariable(name: "T_not_equal", arg: 4, scope: !88, file: !1, type: !50)
!96 = !DILocalVariable(name: "A", arg: 5, scope: !88, file: !1, type: !45)
!97 = !DILocation(line: 0, scope: !88)
!98 = !DILocalVariable(name: "Z", scope: !88, file: !1, type: !99)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8)
!100 = !DILocalVariable(name: "i", scope: !88, file: !1, type: !8)
!101 = !{!"branch_weights", i32 16129, i32 255}
!102 = !{!103, !103, i64 0}
!103 = !{!"0x63a8dd216b30", !19, i64 0}
!104 = !DILocalVariable(name: "j", scope: !88, file: !1, type: !8)
!105 = !DILocalVariable(name: "ax0", scope: !88, file: !1, type: !8)
!106 = !DILocalVariable(name: "ax1", scope: !88, file: !1, type: !8)
!107 = !{!"branch_weights", i32 1, i32 127}
!108 = !{!109, !109, i64 0}
!109 = !{!"0x63a8dd05ebc0", !19, i64 0}
!110 = !{!111, !111, i64 0}
!111 = !{!"0x63a8dd19ff70", !19, i64 0}
!112 = !{!"branch_weights", i32 127, i32 16777081}
!113 = distinct !{!113, !114, !115}
!114 = !{!"llvm.loop.isvectorized", i32 1}
!115 = !{!"llvm.loop.unroll.runtime.disable"}
!116 = !{!"branch_weights", i32 1, i32 7}
!117 = !{!"branch_weights", i32 127, i32 0}
!118 = distinct !{!118, !115, !114}
!119 = !{!"branch_weights", i32 127, i32 134217601}
