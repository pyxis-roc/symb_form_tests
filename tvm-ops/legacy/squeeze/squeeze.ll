; ModuleID = 'TVMMod'
source_filename = "TVMMod"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__TVMFFIErrorSetRaisedFromCStr = linkonce dllexport local_unnamed_addr global ptr null, align 8
@.str = private constant [58 x i8] c"Assert fail: num_args == 2, squeeze: num_args should be 2\00", align 1
@.str.1 = private constant [13 x i8] c"RuntimeError\00", align 1
@.str.2 = private constant [66 x i8] c"Assert fail: not T.isnullptr(args), squeeze: args pointer is NULL\00", align 1
@.str.3 = private constant [149 x i8] c"Assert fail: var_A_type_index == 0 or var_A_type_index == 4 or var_A_type_index == 7 or var_A_type_index >= 64, squeeze: Expect arg[0] to be pointer\00", align 1
@.str.4 = private constant [181 x i8] c"Assert fail: var_T_squeeze_type_index == 0 or var_T_squeeze_type_index == 4 or var_T_squeeze_type_index == 7 or var_T_squeeze_type_index >= 64, squeeze: Expect arg[1] to be pointer\00", align 1
@.str.5 = private constant [98 x i8] c"Assert fail: not T.isnullptr(var_A), squeeze.var_A is expected to have non-NULL DLTensor* pointer\00", align 1
@.str.6 = private constant [100 x i8] c"Assert fail: 2 == T.tvm_struct_get(var_A, 0, 4, \22int32\22), squeeze.var_A.ndim is expected to equal 2\00", align 1
@.str.7 = private constant [114 x i8] c"Assert fail: not T.isnullptr(var_T_squeeze), squeeze.var_T_squeeze is expected to have non-NULL DLTensor* pointer\00", align 1
@.str.8 = private constant [116 x i8] c"Assert fail: 1 == T.tvm_struct_get(var_T_squeeze, 0, 4, \22int32\22), squeeze.var_T_squeeze.ndim is expected to equal 1\00", align 1
@.str.9 = private constant [230 x i8] c"Assert fail: T.tvm_struct_get(var_A, 0, 5, \22uint8\22) == T.uint8(2) and T.tvm_struct_get(var_A, 0, 6, \22uint8\22) == T.uint8(32) and T.tvm_struct_get(var_A, 0, 7, \22uint16\22) == T.uint16(1), squeeze.var_A.dtype is expected to be float32\00", align 1
@.str.10 = private constant [167 x i8] c"Assert fail: T.Cast(\22int32\22, squeeze_var_A_shape[1]) == 1, Argument squeeze.var_A.shape[1] has an unsatisfied constraint: 1 == T.Cast(\22int32\22, squeeze_var_A_shape[1])\00", align 1
@.str.11 = private constant [123 x i8] c"Assert fail: M == 1 or 1 == T.Cast(\22int32\22, squeeze_var_A_strides[0]), squeeze.var_A.strides: expected to be compact array\00", align 1
@.str.12 = private constant [190 x i8] c"Assert fail: T.uint64(0) == T.tvm_struct_get(var_A, 0, 8, \22uint64\22), Argument squeeze.var_A.byte_offset has an unsatisfied constraint: T.uint64(0) == T.tvm_struct_get(var_A, 0, 8, \22uint64\22)\00", align 1
@.str.13 = private constant [170 x i8] c"Assert fail: T.tvm_struct_get(var_A, 0, 10, \22int32\22) == 1, Argument squeeze.var_A.device_type has an unsatisfied constraint: 1 == T.tvm_struct_get(var_A, 0, 10, \22int32\22)\00", align 1
@.str.14 = private constant [99 x i8] c"Assert fail: M == 0 or not T.isnullptr(A), squeeze.var_A is expected to have non-NULL data pointer\00", align 1
@.str.15 = private constant [262 x i8] c"Assert fail: T.tvm_struct_get(var_T_squeeze, 0, 5, \22uint8\22) == T.uint8(2) and T.tvm_struct_get(var_T_squeeze, 0, 6, \22uint8\22) == T.uint8(32) and T.tvm_struct_get(var_T_squeeze, 0, 7, \22uint16\22) == T.uint16(1), squeeze.var_T_squeeze.dtype is expected to be float32\00", align 1
@.str.16 = private constant [191 x i8] c"Assert fail: M == T.Cast(\22int32\22, squeeze_var_T_squeeze_shape[0]), Argument squeeze.var_T_squeeze.shape[0] has an unsatisfied constraint: M == T.Cast(\22int32\22, squeeze_var_T_squeeze_shape[0])\00", align 1
@.str.17 = private constant [139 x i8] c"Assert fail: M == 1 or 1 == T.Cast(\22int32\22, squeeze_var_T_squeeze_strides[0]), squeeze.var_T_squeeze.strides: expected to be compact array\00", align 1
@.str.18 = private constant [214 x i8] c"Assert fail: T.uint64(0) == T.tvm_struct_get(var_T_squeeze, 0, 8, \22uint64\22), Argument squeeze.var_T_squeeze.byte_offset has an unsatisfied constraint: T.uint64(0) == T.tvm_struct_get(var_T_squeeze, 0, 8, \22uint64\22)\00", align 1
@.str.19 = private constant [194 x i8] c"Assert fail: T.tvm_struct_get(var_T_squeeze, 0, 10, \22int32\22) == 1, Argument squeeze.var_T_squeeze.device_type has an unsatisfied constraint: 1 == T.tvm_struct_get(var_T_squeeze, 0, 10, \22int32\22)\00", align 1
@.str.20 = private constant [200 x i8] c"Assert fail: dev_id == T.tvm_struct_get(var_T_squeeze, 0, 9, \22int32\22), Argument squeeze.var_T_squeeze.device_id has an unsatisfied constraint: dev_id == T.tvm_struct_get(var_T_squeeze, 0, 9, \22int32\22)\00", align 1
@.str.21 = private constant [115 x i8] c"Assert fail: M == 0 or not T.isnullptr(T_squeeze), squeeze.var_T_squeeze is expected to have non-NULL data pointer\00", align 1
@__tvm_main__ = weak dllexport local_unnamed_addr constant [8 x i8] c"squeeze\00", align 1
@llvm.global_ctors = appending global [0 x { i32, ptr, ptr }] zeroinitializer

define dllexport range(i32 -1, 1) i32 @squeeze(ptr noalias nocapture readnone %self_handle, ptr noalias readonly %args, i32 %num_args, ptr noalias nocapture readnone %result) local_unnamed_addr #0 !dbg !5 {
entry:
    #dbg_value(ptr %self_handle, !11, !DIExpression(), !15)
    #dbg_value(ptr %args, !12, !DIExpression(), !15)
    #dbg_value(i32 %num_args, !13, !DIExpression(), !15)
    #dbg_value(ptr %result, !14, !DIExpression(), !15)
  %0 = icmp eq i32 %num_args, 2, !dbg !15
  br i1 %0, label %assert_end, label %assert_fail, !dbg !15, !prof !16

common.ret:                                       ; preds = %assert_end42, %assert_fail41, %assert_fail39, %assert_fail37, %assert_fail35, %assert_fail33, %assert_fail29, %assert_fail27, %assert_fail25, %assert_fail23, %assert_fail21, %assert_fail19, %assert_fail17, %assert_fail15, %assert_fail13, %assert_fail11, %assert_fail9, %assert_fail7, %assert_fail5, %assert_fail3, %assert_fail1, %assert_fail
  %common.ret.op = phi i32 [ -1, %assert_fail ], [ -1, %assert_fail1 ], [ -1, %assert_fail3 ], [ -1, %assert_fail5 ], [ -1, %assert_fail7 ], [ -1, %assert_fail9 ], [ -1, %assert_fail11 ], [ -1, %assert_fail13 ], [ -1, %assert_fail15 ], [ -1, %assert_fail17 ], [ -1, %assert_fail19 ], [ -1, %assert_fail21 ], [ -1, %assert_fail23 ], [ -1, %assert_fail25 ], [ -1, %assert_fail27 ], [ -1, %assert_fail29 ], [ -1, %assert_fail33 ], [ -1, %assert_fail35 ], [ -1, %assert_fail37 ], [ -1, %assert_fail39 ], [ -1, %assert_fail41 ], [ 0, %assert_end42 ]
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
  %var_T_squeeze.type_index = load i32, ptr %5, align 4, !dbg !15
    #dbg_declare(i32 %var_T_squeeze.type_index, !22, !DIExpression(), !15)
    #dbg_declare(i32 %var_T_squeeze.type_index, !22, !DIExpression(), !15)
  %var_T_squeeze.type_index.fr = freeze i32 %var_T_squeeze.type_index, !dbg !15
  %6 = icmp sgt i32 %var_T_squeeze.type_index.fr, 63, !dbg !15
  br i1 %6, label %assert_end6, label %switch.early.test43, !dbg !15

switch.early.test43:                              ; preds = %assert_end4
  switch i32 %var_T_squeeze.type_index.fr, label %assert_fail5 [
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
  %13 = icmp eq i32 %var_T_squeeze.type_index.fr, 72, !dbg !15
  %var_T_squeeze.idx = select i1 %13, i64 16, i64 0, !dbg !15
  %var_T_squeeze = getelementptr inbounds nuw i8, ptr %12, i64 %var_T_squeeze.idx, !dbg !15
    #dbg_declare(ptr %var_T_squeeze, !24, !DIExpression(), !15)
    #dbg_declare(ptr %var_T_squeeze, !24, !DIExpression(), !15)
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
  %squeeze.var_A.shape = load ptr, ptr %19, align 8, !dbg !15
    #dbg_declare(ptr %squeeze.var_A.shape, !25, !DIExpression(), !15)
    #dbg_declare(ptr %squeeze.var_A.shape, !25, !DIExpression(), !15)
  %20 = load i64, ptr %squeeze.var_A.shape, align 8, !dbg !15, !tbaa !28
  %M = trunc i64 %20 to i32, !dbg !15
    #dbg_declare(i32 %M, !38, !DIExpression(), !15)
    #dbg_declare(i32 %M, !38, !DIExpression(), !15)
  %21 = getelementptr inbounds nuw i8, ptr %var_A, i64 32, !dbg !15
  %squeeze.var_A.strides = load ptr, ptr %21, align 8, !dbg !15
    #dbg_declare(ptr %squeeze.var_A.strides, !39, !DIExpression(), !15)
    #dbg_declare(ptr %squeeze.var_A.strides, !39, !DIExpression(), !15)
  %22 = getelementptr inbounds nuw i8, ptr %var_A, i64 12, !dbg !15
  %dev_id = load i32, ptr %22, align 4, !dbg !15
    #dbg_declare(i32 %dev_id, !40, !DIExpression(), !15)
    #dbg_declare(i32 %dev_id, !40, !DIExpression(), !15)
  %A = load ptr, ptr %var_A, align 8, !dbg !15
    #dbg_declare(ptr %A, !41, !DIExpression(), !15)
    #dbg_declare(ptr %A, !41, !DIExpression(), !15)
  call void @llvm.assume(i1 true) [ "align"(ptr %A, i64 64) ], !dbg !15
  %.not45 = icmp eq ptr %12, null, !dbg !15
  br i1 %.not45, label %assert_fail11, label %assert_end12, !dbg !15, !prof !20

assert_fail11:                                    ; preds = %assert_end10
  %23 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %23(ptr nonnull @.str.1, ptr nonnull @.str.7), !dbg !15
  br label %common.ret, !dbg !15

assert_end12:                                     ; preds = %assert_end10
  %24 = getelementptr inbounds nuw i8, ptr %var_T_squeeze, i64 16, !dbg !15
  %25 = load i32, ptr %24, align 4, !dbg !15
  %26 = icmp eq i32 %25, 1, !dbg !15
  br i1 %26, label %assert_end14, label %assert_fail13, !dbg !15, !prof !16

assert_fail13:                                    ; preds = %assert_end12
  %27 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %27(ptr nonnull @.str.1, ptr nonnull @.str.8), !dbg !15
  br label %common.ret, !dbg !15

assert_end14:                                     ; preds = %assert_end12
  %28 = getelementptr inbounds nuw i8, ptr %var_T_squeeze, i64 24, !dbg !15
  %squeeze.var_T_squeeze.shape = load ptr, ptr %28, align 8, !dbg !15
    #dbg_declare(ptr %squeeze.var_T_squeeze.shape, !44, !DIExpression(), !15)
    #dbg_declare(ptr %squeeze.var_T_squeeze.shape, !44, !DIExpression(), !15)
  %29 = getelementptr inbounds nuw i8, ptr %var_T_squeeze, i64 32, !dbg !15
  %squeeze.var_T_squeeze.strides = load ptr, ptr %29, align 8, !dbg !15
    #dbg_declare(ptr %squeeze.var_T_squeeze.strides, !45, !DIExpression(), !15)
    #dbg_declare(ptr %squeeze.var_T_squeeze.strides, !45, !DIExpression(), !15)
  %T_squeeze = load ptr, ptr %var_T_squeeze, align 8, !dbg !15
    #dbg_declare(ptr %T_squeeze, !46, !DIExpression(), !15)
    #dbg_declare(ptr %T_squeeze, !46, !DIExpression(), !15)
  call void @llvm.assume(i1 true) [ "align"(ptr %T_squeeze, i64 64) ], !dbg !15
  %30 = getelementptr inbounds nuw i8, ptr %var_A, i64 22, !dbg !15
  %31 = load i16, ptr %30, align 2, !dbg !15
  %32 = icmp eq i16 %31, 1, !dbg !15
  %33 = getelementptr inbounds nuw i8, ptr %var_A, i64 21, !dbg !15
  %34 = load i8, ptr %33, align 1, !dbg !15
  %35 = icmp eq i8 %34, 32, !dbg !15
  %36 = getelementptr inbounds nuw i8, ptr %var_A, i64 20, !dbg !15
  %37 = load i8, ptr %36, align 1, !dbg !15
  %38 = icmp eq i8 %37, 2, !dbg !15
  %39 = and i1 %35, %38, !dbg !15
  %40 = and i1 %32, %39, !dbg !15
  br i1 %40, label %assert_end16, label %assert_fail15, !dbg !15, !prof !16

assert_fail15:                                    ; preds = %assert_end14
  %41 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %41(ptr nonnull @.str.1, ptr nonnull @.str.9), !dbg !15
  br label %common.ret, !dbg !15

assert_end16:                                     ; preds = %assert_end14
  %42 = getelementptr inbounds nuw i8, ptr %squeeze.var_A.shape, i64 8, !dbg !15
  %43 = load i64, ptr %42, align 8, !dbg !15, !tbaa !47
  %44 = and i64 %43, 4294967295, !dbg !15
  %45 = icmp eq i64 %44, 1, !dbg !15
  br i1 %45, label %assert_end18, label %assert_fail17, !dbg !15, !prof !16

assert_fail17:                                    ; preds = %assert_end16
  %46 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %46(ptr nonnull @.str.1, ptr nonnull @.str.10), !dbg !15
  br label %common.ret, !dbg !15

assert_end18:                                     ; preds = %assert_end16
  %.not46 = icmp eq ptr %squeeze.var_A.strides, null, !dbg !15
  br i1 %.not46, label %if_end, label %if_then, !dbg !15, !prof !20

if_then:                                          ; preds = %assert_end18
  %47 = load i64, ptr %squeeze.var_A.strides, align 8, !dbg !15, !tbaa !49
  %48 = and i64 %47, 4294967295, !dbg !15
  %49 = icmp eq i64 %48, 1, !dbg !15
  %50 = icmp eq i32 %M, 1, !dbg !15
  %51 = or i1 %50, %49, !dbg !15
  br i1 %51, label %if_end, label %assert_fail19, !dbg !15, !prof !16

if_end:                                           ; preds = %if_then, %assert_end18
  %52 = getelementptr inbounds nuw i8, ptr %var_A, i64 40, !dbg !15
  %53 = load i64, ptr %52, align 8, !dbg !15
  %54 = icmp eq i64 %53, 0, !dbg !15
  br i1 %54, label %assert_end22, label %assert_fail21, !dbg !15, !prof !16

assert_fail19:                                    ; preds = %if_then
  %55 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %55(ptr nonnull @.str.1, ptr nonnull @.str.11), !dbg !15
  br label %common.ret, !dbg !15

assert_fail21:                                    ; preds = %if_end
  %56 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %56(ptr nonnull @.str.1, ptr nonnull @.str.12), !dbg !15
  br label %common.ret, !dbg !15

assert_end22:                                     ; preds = %if_end
  %57 = getelementptr inbounds nuw i8, ptr %var_A, i64 8, !dbg !15
  %58 = load i32, ptr %57, align 4, !dbg !15
  %59 = icmp eq i32 %58, 1, !dbg !15
  br i1 %59, label %assert_end24, label %assert_fail23, !dbg !15, !prof !16

assert_fail23:                                    ; preds = %assert_end22
  %60 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %60(ptr nonnull @.str.1, ptr nonnull @.str.13), !dbg !15
  br label %common.ret, !dbg !15

assert_end24:                                     ; preds = %assert_end22
  %61 = icmp ne ptr %A, null, !dbg !15
  %62 = icmp eq i32 %M, 0, !dbg !15
  %63 = or i1 %62, %61, !dbg !15
  br i1 %63, label %assert_end26, label %assert_fail25, !dbg !15, !prof !16

assert_fail25:                                    ; preds = %assert_end24
  %64 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %64(ptr nonnull @.str.1, ptr nonnull @.str.14), !dbg !15
  br label %common.ret, !dbg !15

assert_end26:                                     ; preds = %assert_end24
  %65 = getelementptr inbounds nuw i8, ptr %var_T_squeeze, i64 22, !dbg !15
  %66 = load i16, ptr %65, align 2, !dbg !15
  %67 = icmp eq i16 %66, 1, !dbg !15
  %68 = getelementptr inbounds nuw i8, ptr %var_T_squeeze, i64 21, !dbg !15
  %69 = load i8, ptr %68, align 1, !dbg !15
  %70 = icmp eq i8 %69, 32, !dbg !15
  %71 = getelementptr inbounds nuw i8, ptr %var_T_squeeze, i64 20, !dbg !15
  %72 = load i8, ptr %71, align 1, !dbg !15
  %73 = icmp eq i8 %72, 2, !dbg !15
  %74 = and i1 %70, %73, !dbg !15
  %75 = and i1 %67, %74, !dbg !15
  br i1 %75, label %assert_end28, label %assert_fail27, !dbg !15, !prof !16

assert_fail27:                                    ; preds = %assert_end26
  %76 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %76(ptr nonnull @.str.1, ptr nonnull @.str.15), !dbg !15
  br label %common.ret, !dbg !15

assert_end28:                                     ; preds = %assert_end26
  %77 = load i64, ptr %squeeze.var_T_squeeze.shape, align 8, !dbg !15, !tbaa !59
  %78 = trunc i64 %77 to i32, !dbg !15
  %79 = icmp eq i32 %M, %78, !dbg !15
  br i1 %79, label %assert_end30, label %assert_fail29, !dbg !15, !prof !16

assert_fail29:                                    ; preds = %assert_end28
  %80 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %80(ptr nonnull @.str.1, ptr nonnull @.str.16), !dbg !15
  br label %common.ret, !dbg !15

assert_end30:                                     ; preds = %assert_end28
  %.not47 = icmp eq ptr %squeeze.var_T_squeeze.strides, null, !dbg !15
  br i1 %.not47, label %if_end32, label %if_then31, !dbg !15, !prof !20

if_then31:                                        ; preds = %assert_end30
  %81 = load i64, ptr %squeeze.var_T_squeeze.strides, align 8, !dbg !15, !tbaa !69
  %82 = and i64 %81, 4294967295, !dbg !15
  %83 = icmp eq i64 %82, 1, !dbg !15
  %84 = icmp eq i32 %M, 1, !dbg !15
  %85 = or i1 %84, %83, !dbg !15
  br i1 %85, label %if_end32, label %assert_fail33, !dbg !15, !prof !16

if_end32:                                         ; preds = %if_then31, %assert_end30
  %86 = getelementptr inbounds nuw i8, ptr %var_T_squeeze, i64 40, !dbg !15
  %87 = load i64, ptr %86, align 8, !dbg !15
  %88 = icmp eq i64 %87, 0, !dbg !15
  br i1 %88, label %assert_end36, label %assert_fail35, !dbg !15, !prof !16

assert_fail33:                                    ; preds = %if_then31
  %89 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %89(ptr nonnull @.str.1, ptr nonnull @.str.17), !dbg !15
  br label %common.ret, !dbg !15

assert_fail35:                                    ; preds = %if_end32
  %90 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %90(ptr nonnull @.str.1, ptr nonnull @.str.18), !dbg !15
  br label %common.ret, !dbg !15

assert_end36:                                     ; preds = %if_end32
  %91 = getelementptr inbounds nuw i8, ptr %var_T_squeeze, i64 8, !dbg !15
  %92 = load i32, ptr %91, align 4, !dbg !15
  %93 = icmp eq i32 %92, 1, !dbg !15
  br i1 %93, label %assert_end38, label %assert_fail37, !dbg !15, !prof !16

assert_fail37:                                    ; preds = %assert_end36
  %94 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %94(ptr nonnull @.str.1, ptr nonnull @.str.19), !dbg !15
  br label %common.ret, !dbg !15

assert_end38:                                     ; preds = %assert_end36
  %95 = getelementptr inbounds nuw i8, ptr %var_T_squeeze, i64 12, !dbg !15
  %96 = load i32, ptr %95, align 4, !dbg !15
  %97 = icmp eq i32 %dev_id, %96, !dbg !15
  br i1 %97, label %assert_end40, label %assert_fail39, !dbg !15, !prof !16

assert_fail39:                                    ; preds = %assert_end38
  %98 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %98(ptr nonnull @.str.1, ptr nonnull @.str.20), !dbg !15
  br label %common.ret, !dbg !15

assert_end40:                                     ; preds = %assert_end38
  %99 = icmp ne ptr %T_squeeze, null, !dbg !15
  %100 = or i1 %62, %99, !dbg !15
  br i1 %100, label %assert_end42, label %assert_fail41, !dbg !15, !prof !16

assert_fail41:                                    ; preds = %assert_end40
  %101 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %101(ptr nonnull @.str.1, ptr nonnull @.str.21), !dbg !15
  br label %common.ret, !dbg !15

assert_end42:                                     ; preds = %assert_end40
  tail call fastcc void @squeeze_compute_(i32 %M, ptr %T_squeeze, ptr %A), !dbg !15
  br label %common.ret, !dbg !15
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define internal fastcc void @squeeze_compute_(i32 %M, ptr noalias nocapture writeonly align 64 %T_squeeze, ptr noalias nocapture readonly align 64 %A) unnamed_addr #2 !dbg !79 {
entry:
    #dbg_value(i32 %M, !83, !DIExpression(), !86)
    #dbg_value(ptr %T_squeeze, !84, !DIExpression(), !86)
    #dbg_value(ptr %A, !85, !DIExpression(), !86)
    #dbg_declare(i32 0, !87, !DIExpression(), !86)
  %0 = icmp sgt i32 %M, 0, !dbg !86
  br i1 %0, label %for_body_ax0.preheader, label %for_end_ax0, !dbg !86, !prof !88

for_body_ax0.preheader:                           ; preds = %entry
  %1 = zext nneg i32 %M to i64, !dbg !86
  %2 = shl nuw nsw i64 %1, 2, !dbg !86
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 64 %T_squeeze, ptr align 64 %A, i64 %2, i1 false), !dbg !86
    #dbg_declare(i64 poison, !87, !DIExpression(), !86)
  br label %for_end_ax0, !dbg !86

for_end_ax0:                                      ; preds = %for_body_ax0.preheader, %entry
  ret void, !dbg !86
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

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #5

attributes #0 = { "target-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #2 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite) "target-cpu"="generic" }
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
!5 = distinct !DISubprogram(name: "squeeze", scope: !1, file: !1, type: !6, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !10)
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
!22 = !DILocalVariable(name: "var_T_squeeze.type_index", scope: !5, file: !1, type: !8)
!23 = !DILocalVariable(name: "var_A", scope: !5, file: !1, type: !9)
!24 = !DILocalVariable(name: "var_T_squeeze", scope: !5, file: !1, type: !9)
!25 = !DILocalVariable(name: "squeeze.var_A.shape", scope: !5, file: !1, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27)
!27 = !DIBasicType(name: "int64", size: 64, encoding: DW_ATE_signed)
!28 = !{!29, !29, i64 0}
!29 = !{!"0x5af4dbd220a0.w8.b0", !30, i64 0}
!30 = !{!"0x5af4dbd220a0.w16.b0", !31, i64 0}
!31 = !{!"0x5af4dbd220a0.w32.b0", !32, i64 0}
!32 = !{!"0x5af4dbd220a0.w64.b0", !33, i64 0}
!33 = !{!"0x5af4dbd220a0.w128.b0", !34, i64 0}
!34 = !{!"0x5af4dbd220a0.w256.b0", !35, i64 0}
!35 = !{!"0x5af4dbd220a0.w512.b0", !36, i64 0}
!36 = !{!"0x5af4dbd220a0.w1024.b0", !37, i64 0}
!37 = !{!"0x5af4dbd220a0", !19, i64 0}
!38 = !DILocalVariable(name: "M", scope: !5, file: !1, type: !8)
!39 = !DILocalVariable(name: "squeeze.var_A.strides", scope: !5, file: !1, type: !26)
!40 = !DILocalVariable(name: "dev_id", scope: !5, file: !1, type: !8)
!41 = !DILocalVariable(name: "A", scope: !5, file: !1, type: !42)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43)
!43 = !DIBasicType(name: "float32", size: 32, encoding: DW_ATE_float)
!44 = !DILocalVariable(name: "squeeze.var_T_squeeze.shape", scope: !5, file: !1, type: !26)
!45 = !DILocalVariable(name: "squeeze.var_T_squeeze.strides", scope: !5, file: !1, type: !26)
!46 = !DILocalVariable(name: "T_squeeze", scope: !5, file: !1, type: !42)
!47 = !{!48, !48, i64 0}
!48 = !{!"0x5af4dbd220a0.w8.b8", !30, i64 0}
!49 = !{!50, !50, i64 0}
!50 = !{!"0x5af4dbd4ed20.w8.b0", !51, i64 0}
!51 = !{!"0x5af4dbd4ed20.w16.b0", !52, i64 0}
!52 = !{!"0x5af4dbd4ed20.w32.b0", !53, i64 0}
!53 = !{!"0x5af4dbd4ed20.w64.b0", !54, i64 0}
!54 = !{!"0x5af4dbd4ed20.w128.b0", !55, i64 0}
!55 = !{!"0x5af4dbd4ed20.w256.b0", !56, i64 0}
!56 = !{!"0x5af4dbd4ed20.w512.b0", !57, i64 0}
!57 = !{!"0x5af4dbd4ed20.w1024.b0", !58, i64 0}
!58 = !{!"0x5af4dbd4ed20", !19, i64 0}
!59 = !{!60, !60, i64 0}
!60 = !{!"0x5af4dbcb7dd0.w8.b0", !61, i64 0}
!61 = !{!"0x5af4dbcb7dd0.w16.b0", !62, i64 0}
!62 = !{!"0x5af4dbcb7dd0.w32.b0", !63, i64 0}
!63 = !{!"0x5af4dbcb7dd0.w64.b0", !64, i64 0}
!64 = !{!"0x5af4dbcb7dd0.w128.b0", !65, i64 0}
!65 = !{!"0x5af4dbcb7dd0.w256.b0", !66, i64 0}
!66 = !{!"0x5af4dbcb7dd0.w512.b0", !67, i64 0}
!67 = !{!"0x5af4dbcb7dd0.w1024.b0", !68, i64 0}
!68 = !{!"0x5af4dbcb7dd0", !19, i64 0}
!69 = !{!70, !70, i64 0}
!70 = !{!"0x5af4dbc9f840.w8.b0", !71, i64 0}
!71 = !{!"0x5af4dbc9f840.w16.b0", !72, i64 0}
!72 = !{!"0x5af4dbc9f840.w32.b0", !73, i64 0}
!73 = !{!"0x5af4dbc9f840.w64.b0", !74, i64 0}
!74 = !{!"0x5af4dbc9f840.w128.b0", !75, i64 0}
!75 = !{!"0x5af4dbc9f840.w256.b0", !76, i64 0}
!76 = !{!"0x5af4dbc9f840.w512.b0", !77, i64 0}
!77 = !{!"0x5af4dbc9f840.w1024.b0", !78, i64 0}
!78 = !{!"0x5af4dbc9f840", !19, i64 0}
!79 = distinct !DISubprogram(name: "squeeze_compute_", scope: !1, file: !1, type: !80, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !82)
!80 = !DISubroutineType(cc: DW_CC_nocall, types: !81)
!81 = !{!8, !8, !42, !42}
!82 = !{!83, !84, !85}
!83 = !DILocalVariable(name: "M", arg: 1, scope: !79, file: !1, type: !8)
!84 = !DILocalVariable(name: "T_squeeze", arg: 2, scope: !79, file: !1, type: !42)
!85 = !DILocalVariable(name: "A", arg: 3, scope: !79, file: !1, type: !42)
!86 = !DILocation(line: 0, scope: !79)
!87 = !DILocalVariable(name: "ax0", scope: !79, file: !1, type: !8)
!88 = !{!"branch_weights", i32 127, i32 1}
