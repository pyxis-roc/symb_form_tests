; ModuleID = 'TVMMod'
source_filename = "TVMMod"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__TVMFFIErrorSetRaisedFromCStr = linkonce dllexport local_unnamed_addr global ptr null, align 8
@.str = private constant [54 x i8] c"Assert fail: num_args == 2, sum: num_args should be 2\00", align 1
@.str.1 = private constant [13 x i8] c"RuntimeError\00", align 1
@.str.2 = private constant [62 x i8] c"Assert fail: not T.isnullptr(args), sum: args pointer is NULL\00", align 1
@.str.3 = private constant [145 x i8] c"Assert fail: var_A_type_index == 0 or var_A_type_index == 4 or var_A_type_index == 7 or var_A_type_index >= 64, sum: Expect arg[0] to be pointer\00", align 1
@.str.4 = private constant [161 x i8] c"Assert fail: var_A_red_type_index == 0 or var_A_red_type_index == 4 or var_A_red_type_index == 7 or var_A_red_type_index >= 64, sum: Expect arg[1] to be pointer\00", align 1
@.str.5 = private constant [94 x i8] c"Assert fail: not T.isnullptr(var_A), sum.var_A is expected to have non-NULL DLTensor* pointer\00", align 1
@.str.6 = private constant [96 x i8] c"Assert fail: 2 == T.tvm_struct_get(var_A, 0, 4, \22int32\22), sum.var_A.ndim is expected to equal 2\00", align 1
@.str.7 = private constant [102 x i8] c"Assert fail: not T.isnullptr(var_A_red), sum.var_A_red is expected to have non-NULL DLTensor* pointer\00", align 1
@.str.8 = private constant [104 x i8] c"Assert fail: 1 == T.tvm_struct_get(var_A_red, 0, 4, \22int32\22), sum.var_A_red.ndim is expected to equal 1\00", align 1
@.str.9 = private constant [226 x i8] c"Assert fail: T.tvm_struct_get(var_A, 0, 5, \22uint8\22) == T.uint8(2) and T.tvm_struct_get(var_A, 0, 6, \22uint8\22) == T.uint8(32) and T.tvm_struct_get(var_A, 0, 7, \22uint16\22) == T.uint16(1), sum.var_A.dtype is expected to be float32\00", align 1
@.str.10 = private constant [176 x i8] c"Assert fail: (N == 1 or 1 == T.Cast(\22int32\22, sum_var_A_strides[1])) and (M == 1 or N == T.Cast(\22int32\22, sum_var_A_strides[0])), sum.var_A.strides: expected to be compact array\00", align 1
@.str.11 = private constant [186 x i8] c"Assert fail: T.uint64(0) == T.tvm_struct_get(var_A, 0, 8, \22uint64\22), Argument sum.var_A.byte_offset has an unsatisfied constraint: T.uint64(0) == T.tvm_struct_get(var_A, 0, 8, \22uint64\22)\00", align 1
@.str.12 = private constant [166 x i8] c"Assert fail: T.tvm_struct_get(var_A, 0, 10, \22int32\22) == 1, Argument sum.var_A.device_type has an unsatisfied constraint: 1 == T.tvm_struct_get(var_A, 0, 10, \22int32\22)\00", align 1
@.str.13 = private constant [99 x i8] c"Assert fail: M * N == 0 or not T.isnullptr(A), sum.var_A is expected to have non-NULL data pointer\00", align 1
@.str.14 = private constant [242 x i8] c"Assert fail: T.tvm_struct_get(var_A_red, 0, 5, \22uint8\22) == T.uint8(2) and T.tvm_struct_get(var_A_red, 0, 6, \22uint8\22) == T.uint8(32) and T.tvm_struct_get(var_A_red, 0, 7, \22uint16\22) == T.uint16(1), sum.var_A_red.dtype is expected to be float32\00", align 1
@.str.15 = private constant [167 x i8] c"Assert fail: M == T.Cast(\22int32\22, sum_var_A_red_shape[0]), Argument sum.var_A_red.shape[0] has an unsatisfied constraint: M == T.Cast(\22int32\22, sum_var_A_red_shape[0])\00", align 1
@.str.16 = private constant [123 x i8] c"Assert fail: M == 1 or 1 == T.Cast(\22int32\22, sum_var_A_red_strides[0]), sum.var_A_red.strides: expected to be compact array\00", align 1
@.str.17 = private constant [198 x i8] c"Assert fail: T.uint64(0) == T.tvm_struct_get(var_A_red, 0, 8, \22uint64\22), Argument sum.var_A_red.byte_offset has an unsatisfied constraint: T.uint64(0) == T.tvm_struct_get(var_A_red, 0, 8, \22uint64\22)\00", align 1
@.str.18 = private constant [178 x i8] c"Assert fail: T.tvm_struct_get(var_A_red, 0, 10, \22int32\22) == 1, Argument sum.var_A_red.device_type has an unsatisfied constraint: 1 == T.tvm_struct_get(var_A_red, 0, 10, \22int32\22)\00", align 1
@.str.19 = private constant [184 x i8] c"Assert fail: dev_id == T.tvm_struct_get(var_A_red, 0, 9, \22int32\22), Argument sum.var_A_red.device_id has an unsatisfied constraint: dev_id == T.tvm_struct_get(var_A_red, 0, 9, \22int32\22)\00", align 1
@.str.20 = private constant [103 x i8] c"Assert fail: M == 0 or not T.isnullptr(A_red), sum.var_A_red is expected to have non-NULL data pointer\00", align 1
@__tvm_main__ = weak dllexport local_unnamed_addr constant [4 x i8] c"sum\00", align 1
@llvm.global_ctors = appending global [0 x { i32, ptr, ptr }] zeroinitializer

define dllexport range(i32 -1, 1) i32 @sum(ptr noalias nocapture readnone %self_handle, ptr noalias readonly %args, i32 %num_args, ptr noalias nocapture readnone %result) local_unnamed_addr #0 !dbg !5 {
entry:
    #dbg_value(ptr %self_handle, !11, !DIExpression(), !15)
    #dbg_value(ptr %args, !12, !DIExpression(), !15)
    #dbg_value(i32 %num_args, !13, !DIExpression(), !15)
    #dbg_value(ptr %result, !14, !DIExpression(), !15)
  %0 = icmp eq i32 %num_args, 2, !dbg !15
  br i1 %0, label %assert_end, label %assert_fail, !dbg !15, !prof !16

common.ret:                                       ; preds = %assert_end40, %assert_fail39, %assert_fail37, %assert_fail35, %assert_fail33, %assert_fail31, %assert_fail27, %assert_fail25, %assert_fail23, %assert_fail21, %assert_fail19, %assert_fail17, %assert_fail15, %assert_fail13, %assert_fail11, %assert_fail9, %assert_fail7, %assert_fail5, %assert_fail3, %assert_fail1, %assert_fail
  %common.ret.op = phi i32 [ -1, %assert_fail ], [ -1, %assert_fail1 ], [ -1, %assert_fail3 ], [ -1, %assert_fail5 ], [ -1, %assert_fail7 ], [ -1, %assert_fail9 ], [ -1, %assert_fail11 ], [ -1, %assert_fail13 ], [ -1, %assert_fail15 ], [ -1, %assert_fail17 ], [ -1, %assert_fail19 ], [ -1, %assert_fail21 ], [ -1, %assert_fail23 ], [ -1, %assert_fail25 ], [ -1, %assert_fail27 ], [ -1, %assert_fail31 ], [ -1, %assert_fail33 ], [ -1, %assert_fail35 ], [ -1, %assert_fail37 ], [ -1, %assert_fail39 ], [ 0, %assert_end40 ]
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
  %var_A_red.type_index = load i32, ptr %5, align 4, !dbg !15
    #dbg_declare(i32 %var_A_red.type_index, !22, !DIExpression(), !15)
    #dbg_declare(i32 %var_A_red.type_index, !22, !DIExpression(), !15)
  %var_A_red.type_index.fr = freeze i32 %var_A_red.type_index, !dbg !15
  %6 = icmp sgt i32 %var_A_red.type_index.fr, 63, !dbg !15
  br i1 %6, label %assert_end6, label %switch.early.test41, !dbg !15

switch.early.test41:                              ; preds = %assert_end4
  switch i32 %var_A_red.type_index.fr, label %assert_fail5 [
    i32 7, label %assert_end6
    i32 4, label %assert_end6
    i32 0, label %assert_end6
  ], !dbg !15

assert_fail5:                                     ; preds = %switch.early.test41
  %7 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %7(ptr nonnull @.str.1, ptr nonnull @.str.4), !dbg !15
  br label %common.ret, !dbg !15

assert_end6:                                      ; preds = %switch.early.test41, %switch.early.test41, %switch.early.test41, %assert_end4
  %8 = getelementptr inbounds nuw i8, ptr %args, i64 8, !dbg !15
  %9 = load ptr, ptr %8, align 8, !dbg !15
  %10 = icmp eq i32 %var_A.type_index.fr, 72, !dbg !15
  %var_A.idx = select i1 %10, i64 16, i64 0, !dbg !15
  %var_A = getelementptr inbounds nuw i8, ptr %9, i64 %var_A.idx, !dbg !15
    #dbg_declare(ptr %var_A, !23, !DIExpression(), !15)
    #dbg_declare(ptr %var_A, !23, !DIExpression(), !15)
  %11 = getelementptr inbounds nuw i8, ptr %args, i64 24, !dbg !15
  %12 = load ptr, ptr %11, align 8, !dbg !15
  %13 = icmp eq i32 %var_A_red.type_index.fr, 72, !dbg !15
  %var_A_red.idx = select i1 %13, i64 16, i64 0, !dbg !15
  %var_A_red = getelementptr inbounds nuw i8, ptr %12, i64 %var_A_red.idx, !dbg !15
    #dbg_declare(ptr %var_A_red, !24, !DIExpression(), !15)
    #dbg_declare(ptr %var_A_red, !24, !DIExpression(), !15)
  %.not42 = icmp eq ptr %9, null, !dbg !15
  br i1 %.not42, label %assert_fail7, label %assert_end8, !dbg !15, !prof !20

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
  %sum.var_A.shape = load ptr, ptr %19, align 8, !dbg !15
    #dbg_declare(ptr %sum.var_A.shape, !25, !DIExpression(), !15)
    #dbg_declare(ptr %sum.var_A.shape, !25, !DIExpression(), !15)
  %20 = load i64, ptr %sum.var_A.shape, align 8, !dbg !15, !tbaa !28
  %M = trunc i64 %20 to i32, !dbg !15
    #dbg_declare(i32 %M, !38, !DIExpression(), !15)
    #dbg_declare(i32 %M, !38, !DIExpression(), !15)
  %21 = getelementptr inbounds nuw i8, ptr %sum.var_A.shape, i64 8, !dbg !15
  %22 = load i64, ptr %21, align 8, !dbg !15, !tbaa !39
  %N = trunc i64 %22 to i32, !dbg !15
    #dbg_declare(i32 %N, !41, !DIExpression(), !15)
    #dbg_declare(i32 %N, !41, !DIExpression(), !15)
  %23 = getelementptr inbounds nuw i8, ptr %var_A, i64 32, !dbg !15
  %sum.var_A.strides = load ptr, ptr %23, align 8, !dbg !15
    #dbg_declare(ptr %sum.var_A.strides, !42, !DIExpression(), !15)
    #dbg_declare(ptr %sum.var_A.strides, !42, !DIExpression(), !15)
  %24 = getelementptr inbounds nuw i8, ptr %var_A, i64 12, !dbg !15
  %dev_id = load i32, ptr %24, align 4, !dbg !15
    #dbg_declare(i32 %dev_id, !43, !DIExpression(), !15)
    #dbg_declare(i32 %dev_id, !43, !DIExpression(), !15)
  %A = load ptr, ptr %var_A, align 8, !dbg !15
    #dbg_declare(ptr %A, !44, !DIExpression(), !15)
    #dbg_declare(ptr %A, !44, !DIExpression(), !15)
  call void @llvm.assume(i1 true) [ "align"(ptr %A, i64 64) ], !dbg !15
  %.not43 = icmp eq ptr %12, null, !dbg !15
  br i1 %.not43, label %assert_fail11, label %assert_end12, !dbg !15, !prof !20

assert_fail11:                                    ; preds = %assert_end10
  %25 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %25(ptr nonnull @.str.1, ptr nonnull @.str.7), !dbg !15
  br label %common.ret, !dbg !15

assert_end12:                                     ; preds = %assert_end10
  %26 = getelementptr inbounds nuw i8, ptr %var_A_red, i64 16, !dbg !15
  %27 = load i32, ptr %26, align 4, !dbg !15
  %28 = icmp eq i32 %27, 1, !dbg !15
  br i1 %28, label %assert_end14, label %assert_fail13, !dbg !15, !prof !16

assert_fail13:                                    ; preds = %assert_end12
  %29 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %29(ptr nonnull @.str.1, ptr nonnull @.str.8), !dbg !15
  br label %common.ret, !dbg !15

assert_end14:                                     ; preds = %assert_end12
  %30 = getelementptr inbounds nuw i8, ptr %var_A_red, i64 24, !dbg !15
  %sum.var_A_red.shape = load ptr, ptr %30, align 8, !dbg !15
    #dbg_declare(ptr %sum.var_A_red.shape, !47, !DIExpression(), !15)
    #dbg_declare(ptr %sum.var_A_red.shape, !47, !DIExpression(), !15)
  %31 = getelementptr inbounds nuw i8, ptr %var_A_red, i64 32, !dbg !15
  %sum.var_A_red.strides = load ptr, ptr %31, align 8, !dbg !15
    #dbg_declare(ptr %sum.var_A_red.strides, !48, !DIExpression(), !15)
    #dbg_declare(ptr %sum.var_A_red.strides, !48, !DIExpression(), !15)
  %A_red = load ptr, ptr %var_A_red, align 8, !dbg !15
    #dbg_declare(ptr %A_red, !49, !DIExpression(), !15)
    #dbg_declare(ptr %A_red, !49, !DIExpression(), !15)
  call void @llvm.assume(i1 true) [ "align"(ptr %A_red, i64 64) ], !dbg !15
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
  %.not44 = icmp eq ptr %sum.var_A.strides, null, !dbg !15
  br i1 %.not44, label %if_end, label %if_then, !dbg !15, !prof !20

if_then:                                          ; preds = %assert_end16
  %44 = load i64, ptr %sum.var_A.strides, align 8, !dbg !15, !tbaa !50
  %45 = trunc i64 %44 to i32, !dbg !15
  %46 = icmp eq i32 %N, %45, !dbg !15
  %47 = icmp eq i32 %M, 1, !dbg !15
  %48 = or i1 %47, %46, !dbg !15
  %49 = getelementptr inbounds nuw i8, ptr %sum.var_A.strides, i64 8, !dbg !15
  %50 = load i64, ptr %49, align 8, !dbg !15, !tbaa !60
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
  %70 = getelementptr inbounds nuw i8, ptr %var_A_red, i64 22, !dbg !15
  %71 = load i16, ptr %70, align 2, !dbg !15
  %72 = icmp eq i16 %71, 1, !dbg !15
  %73 = getelementptr inbounds nuw i8, ptr %var_A_red, i64 21, !dbg !15
  %74 = load i8, ptr %73, align 1, !dbg !15
  %75 = icmp eq i8 %74, 32, !dbg !15
  %76 = getelementptr inbounds nuw i8, ptr %var_A_red, i64 20, !dbg !15
  %77 = load i8, ptr %76, align 1, !dbg !15
  %78 = icmp eq i8 %77, 2, !dbg !15
  %79 = and i1 %75, %78, !dbg !15
  %80 = and i1 %72, %79, !dbg !15
  br i1 %80, label %assert_end26, label %assert_fail25, !dbg !15, !prof !16

assert_fail25:                                    ; preds = %assert_end24
  %81 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %81(ptr nonnull @.str.1, ptr nonnull @.str.14), !dbg !15
  br label %common.ret, !dbg !15

assert_end26:                                     ; preds = %assert_end24
  %82 = load i64, ptr %sum.var_A_red.shape, align 8, !dbg !15, !tbaa !62
  %83 = trunc i64 %82 to i32, !dbg !15
  %84 = icmp eq i32 %M, %83, !dbg !15
  br i1 %84, label %assert_end28, label %assert_fail27, !dbg !15, !prof !16

assert_fail27:                                    ; preds = %assert_end26
  %85 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %85(ptr nonnull @.str.1, ptr nonnull @.str.15), !dbg !15
  br label %common.ret, !dbg !15

assert_end28:                                     ; preds = %assert_end26
  %.not45 = icmp eq ptr %sum.var_A_red.strides, null, !dbg !15
  br i1 %.not45, label %if_end30, label %if_then29, !dbg !15, !prof !20

if_then29:                                        ; preds = %assert_end28
  %86 = load i64, ptr %sum.var_A_red.strides, align 8, !dbg !15, !tbaa !72
  %87 = and i64 %86, 4294967295, !dbg !15
  %88 = icmp eq i64 %87, 1, !dbg !15
  %89 = icmp eq i32 %M, 1, !dbg !15
  %90 = or i1 %89, %88, !dbg !15
  br i1 %90, label %if_end30, label %assert_fail31, !dbg !15, !prof !16

if_end30:                                         ; preds = %if_then29, %assert_end28
  %91 = getelementptr inbounds nuw i8, ptr %var_A_red, i64 40, !dbg !15
  %92 = load i64, ptr %91, align 8, !dbg !15
  %93 = icmp eq i64 %92, 0, !dbg !15
  br i1 %93, label %assert_end34, label %assert_fail33, !dbg !15, !prof !16

assert_fail31:                                    ; preds = %if_then29
  %94 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %94(ptr nonnull @.str.1, ptr nonnull @.str.16), !dbg !15
  br label %common.ret, !dbg !15

assert_fail33:                                    ; preds = %if_end30
  %95 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %95(ptr nonnull @.str.1, ptr nonnull @.str.17), !dbg !15
  br label %common.ret, !dbg !15

assert_end34:                                     ; preds = %if_end30
  %96 = getelementptr inbounds nuw i8, ptr %var_A_red, i64 8, !dbg !15
  %97 = load i32, ptr %96, align 4, !dbg !15
  %98 = icmp eq i32 %97, 1, !dbg !15
  br i1 %98, label %assert_end36, label %assert_fail35, !dbg !15, !prof !16

assert_fail35:                                    ; preds = %assert_end34
  %99 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %99(ptr nonnull @.str.1, ptr nonnull @.str.18), !dbg !15
  br label %common.ret, !dbg !15

assert_end36:                                     ; preds = %assert_end34
  %100 = getelementptr inbounds nuw i8, ptr %var_A_red, i64 12, !dbg !15
  %101 = load i32, ptr %100, align 4, !dbg !15
  %102 = icmp eq i32 %dev_id, %101, !dbg !15
  br i1 %102, label %assert_end38, label %assert_fail37, !dbg !15, !prof !16

assert_fail37:                                    ; preds = %assert_end36
  %103 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %103(ptr nonnull @.str.1, ptr nonnull @.str.19), !dbg !15
  br label %common.ret, !dbg !15

assert_end38:                                     ; preds = %assert_end36
  %104 = icmp ne ptr %A_red, null, !dbg !15
  %105 = icmp eq i32 %M, 0, !dbg !15
  %106 = or i1 %105, %104, !dbg !15
  br i1 %106, label %assert_end40, label %assert_fail39, !dbg !15, !prof !16

assert_fail39:                                    ; preds = %assert_end38
  %107 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %107(ptr nonnull @.str.1, ptr nonnull @.str.20), !dbg !15
  br label %common.ret, !dbg !15

assert_end40:                                     ; preds = %assert_end38
  tail call fastcc void @sum_compute_(i32 %M, i32 %N, ptr %A_red, ptr %A), !dbg !15
  br label %common.ret, !dbg !15
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define internal fastcc void @sum_compute_(i32 %M, i32 %N, ptr noalias nocapture writeonly align 64 %A_red, ptr noalias nocapture readonly align 64 %A) unnamed_addr #2 !dbg !82 {
entry:
    #dbg_value(i32 %M, !86, !DIExpression(), !90)
    #dbg_value(i32 %N, !87, !DIExpression(), !90)
    #dbg_value(ptr %A_red, !88, !DIExpression(), !90)
    #dbg_value(ptr %A, !89, !DIExpression(), !90)
    #dbg_declare(i32 0, !91, !DIExpression(), !90)
  %0 = icmp sgt i32 %M, 0, !dbg !90
  %1 = icmp sgt i32 %N, 0
  %or.cond = select i1 %0, i1 %1, i1 false, !dbg !90
  br i1 %or.cond, label %for_begin_k1.preheader.us.preheader, label %for_end_ax0, !dbg !90, !prof !92

for_begin_k1.preheader.us.preheader:              ; preds = %entry
  %2 = zext nneg i32 %N to i64, !dbg !90
  %wide.trip.count9 = zext nneg i32 %M to i64, !dbg !90
  %exitcond.peel.not = icmp eq i32 %N, 1
  %3 = add nsw i64 %2, -1, !dbg !90
  %xtraiter = and i64 %3, 7
  %4 = add nsw i32 %N, -2
  %5 = icmp ult i32 %4, 7
  %unroll_iter = and i64 %3, -8
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br label %for_begin_k1.preheader.us, !dbg !90

for_begin_k1.preheader.us:                        ; preds = %for_begin_k1.preheader.us.preheader, %for_begin_k1.for_end_k1_crit_edge.us
  %indvars.iv6 = phi i64 [ 0, %for_begin_k1.preheader.us.preheader ], [ %indvars.iv.next7, %for_begin_k1.for_end_k1_crit_edge.us ]
    #dbg_declare(i64 %indvars.iv6, !91, !DIExpression(), !90)
    #dbg_declare(i32 0, !93, !DIExpression(), !90)
  %6 = getelementptr inbounds nuw float, ptr %A_red, i64 %indvars.iv6
  %7 = mul nuw nsw i64 %indvars.iv6, %2
    #dbg_declare(i64 0, !93, !DIExpression(), !90)
  %8 = getelementptr inbounds nuw float, ptr %A, i64 %7, !dbg !90
  %9 = load float, ptr %8, align 4, !dbg !90, !tbaa !94
  %10 = fadd float %9, 0.000000e+00, !dbg !90
    #dbg_declare(i64 1, !93, !DIExpression(), !90)
  br i1 %exitcond.peel.not, label %for_begin_k1.for_end_k1_crit_edge.us, label %for_body_k1.us.peel.next, !dbg !90, !prof !96

for_body_k1.us.peel.next:                         ; preds = %for_begin_k1.preheader.us
  %invariant.gep = getelementptr inbounds nuw float, ptr %A, i64 %7, !dbg !90
  br i1 %5, label %for_begin_k1.for_end_k1_crit_edge.us.loopexit.unr-lcssa, label %for_body_k1.us.peel.next.new, !dbg !90, !prof !97

for_body_k1.us.peel.next.new:                     ; preds = %for_body_k1.us.peel.next
  %invariant.gep6 = getelementptr inbounds i8, ptr %invariant.gep, i64 4, !dbg !90
  %invariant.gep8 = getelementptr inbounds i8, ptr %invariant.gep, i64 8, !dbg !90
  %invariant.gep10 = getelementptr inbounds i8, ptr %invariant.gep, i64 12, !dbg !90
  %invariant.gep12 = getelementptr inbounds i8, ptr %invariant.gep, i64 16, !dbg !90
  %invariant.gep14 = getelementptr inbounds i8, ptr %invariant.gep, i64 20, !dbg !90
  %invariant.gep16 = getelementptr inbounds i8, ptr %invariant.gep, i64 24, !dbg !90
  %invariant.gep18 = getelementptr inbounds i8, ptr %invariant.gep, i64 28, !dbg !90
  br label %for_body_k1.us, !dbg !90

for_body_k1.us:                                   ; preds = %for_body_k1.us, %for_body_k1.us.peel.next.new
  %indvars.iv = phi i64 [ 1, %for_body_k1.us.peel.next.new ], [ %indvars.iv.next.7, %for_body_k1.us ]
  %11 = phi float [ %10, %for_body_k1.us.peel.next.new ], [ %27, %for_body_k1.us ]
  %niter = phi i64 [ 0, %for_body_k1.us.peel.next.new ], [ %niter.next.7, %for_body_k1.us ]
    #dbg_declare(i64 %indvars.iv, !93, !DIExpression(), !90)
  %gep = getelementptr inbounds nuw float, ptr %invariant.gep, i64 %indvars.iv, !dbg !90
  %12 = load float, ptr %gep, align 4, !dbg !90, !tbaa !94
  %13 = fadd float %12, %11, !dbg !90
    #dbg_declare(i64 %indvars.iv, !93, !DIExpression(DW_OP_plus_uconst, 1), !90)
    #dbg_declare(i64 %indvars.iv, !93, !DIExpression(DW_OP_plus_uconst, 1), !90)
  %gep7 = getelementptr inbounds float, ptr %invariant.gep6, i64 %indvars.iv, !dbg !90
  %14 = load float, ptr %gep7, align 4, !dbg !90, !tbaa !94
  %15 = fadd float %14, %13, !dbg !90
    #dbg_declare(i64 %indvars.iv, !93, !DIExpression(DW_OP_plus_uconst, 2), !90)
    #dbg_declare(i64 %indvars.iv, !93, !DIExpression(DW_OP_plus_uconst, 2), !90)
  %gep9 = getelementptr inbounds float, ptr %invariant.gep8, i64 %indvars.iv, !dbg !90
  %16 = load float, ptr %gep9, align 4, !dbg !90, !tbaa !94
  %17 = fadd float %16, %15, !dbg !90
    #dbg_declare(i64 %indvars.iv, !93, !DIExpression(DW_OP_plus_uconst, 3), !90)
    #dbg_declare(i64 %indvars.iv, !93, !DIExpression(DW_OP_plus_uconst, 3), !90)
  %gep11 = getelementptr inbounds float, ptr %invariant.gep10, i64 %indvars.iv, !dbg !90
  %18 = load float, ptr %gep11, align 4, !dbg !90, !tbaa !94
  %19 = fadd float %18, %17, !dbg !90
    #dbg_declare(i64 %indvars.iv, !93, !DIExpression(DW_OP_plus_uconst, 4), !90)
    #dbg_declare(i64 %indvars.iv, !93, !DIExpression(DW_OP_plus_uconst, 4), !90)
  %gep13 = getelementptr inbounds float, ptr %invariant.gep12, i64 %indvars.iv, !dbg !90
  %20 = load float, ptr %gep13, align 4, !dbg !90, !tbaa !94
  %21 = fadd float %20, %19, !dbg !90
    #dbg_declare(i64 %indvars.iv, !93, !DIExpression(DW_OP_plus_uconst, 5), !90)
    #dbg_declare(i64 %indvars.iv, !93, !DIExpression(DW_OP_plus_uconst, 5), !90)
  %gep15 = getelementptr inbounds float, ptr %invariant.gep14, i64 %indvars.iv, !dbg !90
  %22 = load float, ptr %gep15, align 4, !dbg !90, !tbaa !94
  %23 = fadd float %22, %21, !dbg !90
    #dbg_declare(i64 %indvars.iv, !93, !DIExpression(DW_OP_plus_uconst, 6), !90)
    #dbg_declare(i64 %indvars.iv, !93, !DIExpression(DW_OP_plus_uconst, 6), !90)
  %gep17 = getelementptr inbounds float, ptr %invariant.gep16, i64 %indvars.iv, !dbg !90
  %24 = load float, ptr %gep17, align 4, !dbg !90, !tbaa !94
  %25 = fadd float %24, %23, !dbg !90
    #dbg_declare(i64 %indvars.iv, !93, !DIExpression(DW_OP_plus_uconst, 7), !90)
    #dbg_declare(i64 %indvars.iv, !93, !DIExpression(DW_OP_plus_uconst, 7), !90)
  %gep19 = getelementptr inbounds float, ptr %invariant.gep18, i64 %indvars.iv, !dbg !90
  %26 = load float, ptr %gep19, align 4, !dbg !90, !tbaa !94
  %27 = fadd float %26, %25, !dbg !90
  %indvars.iv.next.7 = add nuw nsw i64 %indvars.iv, 8, !dbg !90
    #dbg_declare(i64 %indvars.iv.next.7, !93, !DIExpression(), !90)
  %niter.next.7 = add i64 %niter, 8, !dbg !90
  %niter.ncmp.7 = icmp eq i64 %niter.next.7, %unroll_iter, !dbg !90
  br i1 %niter.ncmp.7, label %for_begin_k1.for_end_k1_crit_edge.us.loopexit.unr-lcssa, label %for_body_k1.us, !dbg !90, !prof !98, !llvm.loop !99

for_begin_k1.for_end_k1_crit_edge.us.loopexit.unr-lcssa: ; preds = %for_body_k1.us, %for_body_k1.us.peel.next
  %.lcssa2.ph = phi float [ poison, %for_body_k1.us.peel.next ], [ %27, %for_body_k1.us ]
  %indvars.iv.unr = phi i64 [ 1, %for_body_k1.us.peel.next ], [ %indvars.iv.next.7, %for_body_k1.us ]
  %.unr = phi float [ %10, %for_body_k1.us.peel.next ], [ %27, %for_body_k1.us ]
  br i1 %lcmp.mod.not, label %for_begin_k1.for_end_k1_crit_edge.us, label %for_body_k1.us.epil, !dbg !90, !prof !101

for_body_k1.us.epil:                              ; preds = %for_begin_k1.for_end_k1_crit_edge.us.loopexit.unr-lcssa, %for_body_k1.us.epil
  %indvars.iv.epil = phi i64 [ %indvars.iv.next.epil, %for_body_k1.us.epil ], [ %indvars.iv.unr, %for_begin_k1.for_end_k1_crit_edge.us.loopexit.unr-lcssa ]
  %28 = phi float [ %30, %for_body_k1.us.epil ], [ %.unr, %for_begin_k1.for_end_k1_crit_edge.us.loopexit.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.next, %for_body_k1.us.epil ], [ 0, %for_begin_k1.for_end_k1_crit_edge.us.loopexit.unr-lcssa ]
    #dbg_declare(i64 %indvars.iv.epil, !93, !DIExpression(), !90)
  %gep.epil = getelementptr inbounds nuw float, ptr %invariant.gep, i64 %indvars.iv.epil, !dbg !90
  %29 = load float, ptr %gep.epil, align 4, !dbg !90, !tbaa !94
  %30 = fadd float %29, %28, !dbg !90
  %indvars.iv.next.epil = add nuw nsw i64 %indvars.iv.epil, 1, !dbg !90
    #dbg_declare(i64 %indvars.iv.next.epil, !93, !DIExpression(), !90)
  %epil.iter.next = add i64 %epil.iter, 1, !dbg !90
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.next, %xtraiter, !dbg !90
  br i1 %epil.iter.cmp.not, label %for_begin_k1.for_end_k1_crit_edge.us, label %for_body_k1.us.epil, !dbg !90, !prof !102, !llvm.loop !103

for_begin_k1.for_end_k1_crit_edge.us:             ; preds = %for_begin_k1.for_end_k1_crit_edge.us.loopexit.unr-lcssa, %for_body_k1.us.epil, %for_begin_k1.preheader.us
  %.lcssa = phi float [ %10, %for_begin_k1.preheader.us ], [ %.lcssa2.ph, %for_begin_k1.for_end_k1_crit_edge.us.loopexit.unr-lcssa ], [ %30, %for_body_k1.us.epil ], !dbg !90
  store float %.lcssa, ptr %6, align 4, !dbg !90, !tbaa !105
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1, !dbg !90
    #dbg_declare(i64 %indvars.iv.next7, !91, !DIExpression(), !90)
  %exitcond10.not = icmp eq i64 %indvars.iv.next7, %wide.trip.count9, !dbg !90
  br i1 %exitcond10.not, label %for_end_ax0, label %for_begin_k1.preheader.us, !dbg !90, !prof !96

for_end_ax0:                                      ; preds = %for_begin_k1.for_end_k1_crit_edge.us, %entry
  ret void, !dbg !90
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
!5 = distinct !DISubprogram(name: "sum", scope: !1, file: !1, type: !6, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !10)
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
!22 = !DILocalVariable(name: "var_A_red.type_index", scope: !5, file: !1, type: !8)
!23 = !DILocalVariable(name: "var_A", scope: !5, file: !1, type: !9)
!24 = !DILocalVariable(name: "var_A_red", scope: !5, file: !1, type: !9)
!25 = !DILocalVariable(name: "sum.var_A.shape", scope: !5, file: !1, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27)
!27 = !DIBasicType(name: "int64", size: 64, encoding: DW_ATE_signed)
!28 = !{!29, !29, i64 0}
!29 = !{!"0x64892fccd9d0.w8.b0", !30, i64 0}
!30 = !{!"0x64892fccd9d0.w16.b0", !31, i64 0}
!31 = !{!"0x64892fccd9d0.w32.b0", !32, i64 0}
!32 = !{!"0x64892fccd9d0.w64.b0", !33, i64 0}
!33 = !{!"0x64892fccd9d0.w128.b0", !34, i64 0}
!34 = !{!"0x64892fccd9d0.w256.b0", !35, i64 0}
!35 = !{!"0x64892fccd9d0.w512.b0", !36, i64 0}
!36 = !{!"0x64892fccd9d0.w1024.b0", !37, i64 0}
!37 = !{!"0x64892fccd9d0", !19, i64 0}
!38 = !DILocalVariable(name: "M", scope: !5, file: !1, type: !8)
!39 = !{!40, !40, i64 0}
!40 = !{!"0x64892fccd9d0.w8.b8", !30, i64 0}
!41 = !DILocalVariable(name: "N", scope: !5, file: !1, type: !8)
!42 = !DILocalVariable(name: "sum.var_A.strides", scope: !5, file: !1, type: !26)
!43 = !DILocalVariable(name: "dev_id", scope: !5, file: !1, type: !8)
!44 = !DILocalVariable(name: "A", scope: !5, file: !1, type: !45)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46)
!46 = !DIBasicType(name: "float32", size: 32, encoding: DW_ATE_float)
!47 = !DILocalVariable(name: "sum.var_A_red.shape", scope: !5, file: !1, type: !26)
!48 = !DILocalVariable(name: "sum.var_A_red.strides", scope: !5, file: !1, type: !26)
!49 = !DILocalVariable(name: "A_red", scope: !5, file: !1, type: !45)
!50 = !{!51, !51, i64 0}
!51 = !{!"0x64892fd816d0.w8.b0", !52, i64 0}
!52 = !{!"0x64892fd816d0.w16.b0", !53, i64 0}
!53 = !{!"0x64892fd816d0.w32.b0", !54, i64 0}
!54 = !{!"0x64892fd816d0.w64.b0", !55, i64 0}
!55 = !{!"0x64892fd816d0.w128.b0", !56, i64 0}
!56 = !{!"0x64892fd816d0.w256.b0", !57, i64 0}
!57 = !{!"0x64892fd816d0.w512.b0", !58, i64 0}
!58 = !{!"0x64892fd816d0.w1024.b0", !59, i64 0}
!59 = !{!"0x64892fd816d0", !19, i64 0}
!60 = !{!61, !61, i64 0}
!61 = !{!"0x64892fd816d0.w8.b8", !52, i64 0}
!62 = !{!63, !63, i64 0}
!63 = !{!"0x64892fe24b10.w8.b0", !64, i64 0}
!64 = !{!"0x64892fe24b10.w16.b0", !65, i64 0}
!65 = !{!"0x64892fe24b10.w32.b0", !66, i64 0}
!66 = !{!"0x64892fe24b10.w64.b0", !67, i64 0}
!67 = !{!"0x64892fe24b10.w128.b0", !68, i64 0}
!68 = !{!"0x64892fe24b10.w256.b0", !69, i64 0}
!69 = !{!"0x64892fe24b10.w512.b0", !70, i64 0}
!70 = !{!"0x64892fe24b10.w1024.b0", !71, i64 0}
!71 = !{!"0x64892fe24b10", !19, i64 0}
!72 = !{!73, !73, i64 0}
!73 = !{!"0x64892fe02ec0.w8.b0", !74, i64 0}
!74 = !{!"0x64892fe02ec0.w16.b0", !75, i64 0}
!75 = !{!"0x64892fe02ec0.w32.b0", !76, i64 0}
!76 = !{!"0x64892fe02ec0.w64.b0", !77, i64 0}
!77 = !{!"0x64892fe02ec0.w128.b0", !78, i64 0}
!78 = !{!"0x64892fe02ec0.w256.b0", !79, i64 0}
!79 = !{!"0x64892fe02ec0.w512.b0", !80, i64 0}
!80 = !{!"0x64892fe02ec0.w1024.b0", !81, i64 0}
!81 = !{!"0x64892fe02ec0", !19, i64 0}
!82 = distinct !DISubprogram(name: "sum_compute_", scope: !1, file: !1, type: !83, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !85)
!83 = !DISubroutineType(cc: DW_CC_nocall, types: !84)
!84 = !{!8, !8, !8, !45, !45}
!85 = !{!86, !87, !88, !89}
!86 = !DILocalVariable(name: "M", arg: 1, scope: !82, file: !1, type: !8)
!87 = !DILocalVariable(name: "N", arg: 2, scope: !82, file: !1, type: !8)
!88 = !DILocalVariable(name: "A_red", arg: 3, scope: !82, file: !1, type: !45)
!89 = !DILocalVariable(name: "A", arg: 4, scope: !82, file: !1, type: !45)
!90 = !DILocation(line: 0, scope: !82)
!91 = !DILocalVariable(name: "ax0", scope: !82, file: !1, type: !8)
!92 = !{!"branch_weights", i32 16129, i32 255}
!93 = !DILocalVariable(name: "k1", scope: !82, file: !1, type: !8)
!94 = !{!95, !95, i64 0}
!95 = !{!"0x64892fc3f850", !19, i64 0}
!96 = !{!"branch_weights", i32 127, i32 134217601}
!97 = !{!"branch_weights", i32 1, i32 127}
!98 = !{!"branch_weights", i32 127, i32 16777081}
!99 = distinct !{!99, !100}
!100 = !{!"llvm.loop.peeled.count", i32 1}
!101 = !{!"branch_weights", i32 7, i32 1}
!102 = !{!"branch_weights", i32 1, i32 3}
!103 = distinct !{!103, !104}
!104 = !{!"llvm.loop.unroll.disable"}
!105 = !{!106, !106, i64 0}
!106 = !{!"0x64892fb42550", !19, i64 0}
