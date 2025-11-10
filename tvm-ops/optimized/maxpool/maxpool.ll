; ModuleID = 'TVMMod'
source_filename = "TVMMod"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__TVMFFIErrorSetRaisedFromCStr = linkonce dllexport local_unnamed_addr global ptr null, align 8
@.str = private constant [58 x i8] c"Assert fail: num_args == 2, maxpool: num_args should be 2\00", align 1
@.str.1 = private constant [13 x i8] c"RuntimeError\00", align 1
@.str.2 = private constant [66 x i8] c"Assert fail: not T.isnullptr(args), maxpool: args pointer is NULL\00", align 1
@.str.3 = private constant [149 x i8] c"Assert fail: var_A_type_index == 0 or var_A_type_index == 4 or var_A_type_index == 7 or var_A_type_index >= 64, maxpool: Expect arg[0] to be pointer\00", align 1
@.str.4 = private constant [177 x i8] c"Assert fail: var_pool_max_type_index == 0 or var_pool_max_type_index == 4 or var_pool_max_type_index == 7 or var_pool_max_type_index >= 64, maxpool: Expect arg[1] to be pointer\00", align 1
@.str.5 = private constant [98 x i8] c"Assert fail: not T.isnullptr(var_A), maxpool.var_A is expected to have non-NULL DLTensor* pointer\00", align 1
@.str.6 = private constant [100 x i8] c"Assert fail: 4 == T.tvm_struct_get(var_A, 0, 4, \22int32\22), maxpool.var_A.ndim is expected to equal 4\00", align 1
@.str.7 = private constant [112 x i8] c"Assert fail: not T.isnullptr(var_pool_max), maxpool.var_pool_max is expected to have non-NULL DLTensor* pointer\00", align 1
@.str.8 = private constant [114 x i8] c"Assert fail: 4 == T.tvm_struct_get(var_pool_max, 0, 4, \22int32\22), maxpool.var_pool_max.ndim is expected to equal 4\00", align 1
@.str.9 = private constant [230 x i8] c"Assert fail: T.tvm_struct_get(var_A, 0, 5, \22uint8\22) == T.uint8(2) and T.tvm_struct_get(var_A, 0, 6, \22uint8\22) == T.uint8(32) and T.tvm_struct_get(var_A, 0, 7, \22uint16\22) == T.uint16(1), maxpool.var_A.dtype is expected to be float32\00", align 1
@.str.10 = private constant [326 x i8] c"Assert fail: (W == 1 or 1 == T.Cast(\22int32\22, maxpool_var_A_strides[3])) and (H == 1 or W == T.Cast(\22int32\22, maxpool_var_A_strides[2])) and (C == 1 or W * H == T.Cast(\22int32\22, maxpool_var_A_strides[1])) and (N == 1 or W * H * C == T.Cast(\22int32\22, maxpool_var_A_strides[0])), maxpool.var_A.strides: expected to be compact array\00", align 1
@.str.11 = private constant [190 x i8] c"Assert fail: T.uint64(0) == T.tvm_struct_get(var_A, 0, 8, \22uint64\22), Argument maxpool.var_A.byte_offset has an unsatisfied constraint: T.uint64(0) == T.tvm_struct_get(var_A, 0, 8, \22uint64\22)\00", align 1
@.str.12 = private constant [170 x i8] c"Assert fail: T.tvm_struct_get(var_A, 0, 10, \22int32\22) == 1, Argument maxpool.var_A.device_type has an unsatisfied constraint: 1 == T.tvm_struct_get(var_A, 0, 10, \22int32\22)\00", align 1
@.str.13 = private constant [111 x i8] c"Assert fail: N * C * H * W == 0 or not T.isnullptr(A), maxpool.var_A is expected to have non-NULL data pointer\00", align 1
@.str.14 = private constant [258 x i8] c"Assert fail: T.tvm_struct_get(var_pool_max, 0, 5, \22uint8\22) == T.uint8(2) and T.tvm_struct_get(var_pool_max, 0, 6, \22uint8\22) == T.uint8(32) and T.tvm_struct_get(var_pool_max, 0, 7, \22uint16\22) == T.uint16(1), maxpool.var_pool_max.dtype is expected to be float32\00", align 1
@.str.15 = private constant [188 x i8] c"Assert fail: N == T.Cast(\22int32\22, maxpool_var_pool_max_shape[0]), Argument maxpool.var_pool_max.shape[0] has an unsatisfied constraint: N == T.Cast(\22int32\22, maxpool_var_pool_max_shape[0])\00", align 1
@.str.16 = private constant [188 x i8] c"Assert fail: C == T.Cast(\22int32\22, maxpool_var_pool_max_shape[1]), Argument maxpool.var_pool_max.shape[1] has an unsatisfied constraint: C == T.Cast(\22int32\22, maxpool_var_pool_max_shape[1])\00", align 1
@.str.17 = private constant [211 x i8] c"Assert fail: T.shift_right(H, 1) == T.Cast(\22int32\22, maxpool_var_pool_max_shape[2]), Argument maxpool.var_pool_max.shape[2] has an unsatisfied constraint: H // 2 == T.Cast(\22int32\22, maxpool_var_pool_max_shape[2])\00", align 1
@.str.18 = private constant [211 x i8] c"Assert fail: T.shift_right(W, 1) == T.Cast(\22int32\22, maxpool_var_pool_max_shape[3]), Argument maxpool.var_pool_max.shape[3] has an unsatisfied constraint: W // 2 == T.Cast(\22int32\22, maxpool_var_pool_max_shape[3])\00", align 1
@.str.19 = private constant [487 x i8] c"Assert fail: (T.shift_right(W, 1) == 1 or 1 == T.Cast(\22int32\22, maxpool_var_pool_max_strides[3])) and (T.shift_right(H, 1) == 1 or T.shift_right(W, 1) == T.Cast(\22int32\22, maxpool_var_pool_max_strides[2])) and (C == 1 or T.shift_right(W, 1) * T.shift_right(H, 1) == T.Cast(\22int32\22, maxpool_var_pool_max_strides[1])) and (N == 1 or T.shift_right(W, 1) * T.shift_right(H, 1) * C == T.Cast(\22int32\22, maxpool_var_pool_max_strides[0])), maxpool.var_pool_max.strides: expected to be compact array\00", align 1
@.str.20 = private constant [211 x i8] c"Assert fail: T.uint64(0) == T.tvm_struct_get(var_pool_max, 0, 8, \22uint64\22), Argument maxpool.var_pool_max.byte_offset has an unsatisfied constraint: T.uint64(0) == T.tvm_struct_get(var_pool_max, 0, 8, \22uint64\22)\00", align 1
@.str.21 = private constant [191 x i8] c"Assert fail: T.tvm_struct_get(var_pool_max, 0, 10, \22int32\22) == 1, Argument maxpool.var_pool_max.device_type has an unsatisfied constraint: 1 == T.tvm_struct_get(var_pool_max, 0, 10, \22int32\22)\00", align 1
@.str.22 = private constant [197 x i8] c"Assert fail: dev_id == T.tvm_struct_get(var_pool_max, 0, 9, \22int32\22), Argument maxpool.var_pool_max.device_id has an unsatisfied constraint: dev_id == T.tvm_struct_get(var_pool_max, 0, 9, \22int32\22)\00", align 1
@.str.23 = private constant [161 x i8] c"Assert fail: N * C * T.shift_right(H, 1) * T.shift_right(W, 1) == 0 or not T.isnullptr(pool_max), maxpool.var_pool_max is expected to have non-NULL data pointer\00", align 1
@__tvm_main__ = weak dllexport local_unnamed_addr constant [8 x i8] c"maxpool\00", align 1
@llvm.global_ctors = appending global [0 x { i32, ptr, ptr }] zeroinitializer

define dllexport range(i32 -1, 1) i32 @maxpool(ptr noalias nocapture readnone %self_handle, ptr noalias readonly %args, i32 %num_args, ptr noalias nocapture readnone %result) local_unnamed_addr #0 !dbg !5 {
entry:
    #dbg_value(ptr %self_handle, !11, !DIExpression(), !15)
    #dbg_value(ptr %args, !12, !DIExpression(), !15)
    #dbg_value(i32 %num_args, !13, !DIExpression(), !15)
    #dbg_value(ptr %result, !14, !DIExpression(), !15)
  %0 = icmp eq i32 %num_args, 2, !dbg !15
  br i1 %0, label %assert_end, label %assert_fail, !dbg !15, !prof !16

common.ret:                                       ; preds = %assert_end46, %assert_fail45, %assert_fail43, %assert_fail41, %assert_fail39, %assert_fail37, %assert_fail33, %assert_fail31, %assert_fail29, %assert_fail27, %assert_fail25, %assert_fail23, %assert_fail21, %assert_fail19, %assert_fail17, %assert_fail15, %assert_fail13, %assert_fail11, %assert_fail9, %assert_fail7, %assert_fail5, %assert_fail3, %assert_fail1, %assert_fail
  %common.ret.op = phi i32 [ -1, %assert_fail ], [ -1, %assert_fail1 ], [ -1, %assert_fail3 ], [ -1, %assert_fail5 ], [ -1, %assert_fail7 ], [ -1, %assert_fail9 ], [ -1, %assert_fail11 ], [ -1, %assert_fail13 ], [ -1, %assert_fail15 ], [ -1, %assert_fail17 ], [ -1, %assert_fail19 ], [ -1, %assert_fail21 ], [ -1, %assert_fail23 ], [ -1, %assert_fail25 ], [ -1, %assert_fail27 ], [ -1, %assert_fail29 ], [ -1, %assert_fail31 ], [ -1, %assert_fail33 ], [ -1, %assert_fail37 ], [ -1, %assert_fail39 ], [ -1, %assert_fail41 ], [ -1, %assert_fail43 ], [ -1, %assert_fail45 ], [ 0, %assert_end46 ]
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
  %var_pool_max.type_index = load i32, ptr %5, align 4, !dbg !15
    #dbg_declare(i32 %var_pool_max.type_index, !22, !DIExpression(), !15)
    #dbg_declare(i32 %var_pool_max.type_index, !22, !DIExpression(), !15)
  %var_pool_max.type_index.fr = freeze i32 %var_pool_max.type_index, !dbg !15
  %6 = icmp sgt i32 %var_pool_max.type_index.fr, 63, !dbg !15
  br i1 %6, label %assert_end6, label %switch.early.test47, !dbg !15

switch.early.test47:                              ; preds = %assert_end4
  switch i32 %var_pool_max.type_index.fr, label %assert_fail5 [
    i32 7, label %assert_end6
    i32 4, label %assert_end6
    i32 0, label %assert_end6
  ], !dbg !15

assert_fail5:                                     ; preds = %switch.early.test47
  %7 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %7(ptr nonnull @.str.1, ptr nonnull @.str.4), !dbg !15
  br label %common.ret, !dbg !15

assert_end6:                                      ; preds = %switch.early.test47, %switch.early.test47, %switch.early.test47, %assert_end4
  %8 = getelementptr inbounds nuw i8, ptr %args, i64 8, !dbg !15
  %9 = load ptr, ptr %8, align 8, !dbg !15
  %10 = icmp eq i32 %var_A.type_index.fr, 72, !dbg !15
  %var_A.idx = select i1 %10, i64 16, i64 0, !dbg !15
  %var_A = getelementptr inbounds nuw i8, ptr %9, i64 %var_A.idx, !dbg !15
    #dbg_declare(ptr %var_A, !23, !DIExpression(), !15)
    #dbg_declare(ptr %var_A, !23, !DIExpression(), !15)
  %11 = getelementptr inbounds nuw i8, ptr %args, i64 24, !dbg !15
  %12 = load ptr, ptr %11, align 8, !dbg !15
  %13 = icmp eq i32 %var_pool_max.type_index.fr, 72, !dbg !15
  %var_pool_max.idx = select i1 %13, i64 16, i64 0, !dbg !15
  %var_pool_max = getelementptr inbounds nuw i8, ptr %12, i64 %var_pool_max.idx, !dbg !15
    #dbg_declare(ptr %var_pool_max, !24, !DIExpression(), !15)
    #dbg_declare(ptr %var_pool_max, !24, !DIExpression(), !15)
  %.not49 = icmp eq ptr %9, null, !dbg !15
  br i1 %.not49, label %assert_fail7, label %assert_end8, !dbg !15, !prof !20

assert_fail7:                                     ; preds = %assert_end6
  %14 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %14(ptr nonnull @.str.1, ptr nonnull @.str.5), !dbg !15
  br label %common.ret, !dbg !15

assert_end8:                                      ; preds = %assert_end6
  %15 = getelementptr inbounds nuw i8, ptr %var_A, i64 16, !dbg !15
  %16 = load i32, ptr %15, align 4, !dbg !15
  %17 = icmp eq i32 %16, 4, !dbg !15
  br i1 %17, label %assert_end10, label %assert_fail9, !dbg !15, !prof !16

assert_fail9:                                     ; preds = %assert_end8
  %18 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %18(ptr nonnull @.str.1, ptr nonnull @.str.6), !dbg !15
  br label %common.ret, !dbg !15

assert_end10:                                     ; preds = %assert_end8
  %19 = getelementptr inbounds nuw i8, ptr %var_A, i64 24, !dbg !15
  %maxpool.var_A.shape = load ptr, ptr %19, align 8, !dbg !15
    #dbg_declare(ptr %maxpool.var_A.shape, !25, !DIExpression(), !15)
    #dbg_declare(ptr %maxpool.var_A.shape, !25, !DIExpression(), !15)
  %20 = load i64, ptr %maxpool.var_A.shape, align 8, !dbg !15, !tbaa !28
  %N = trunc i64 %20 to i32, !dbg !15
    #dbg_declare(i32 %N, !38, !DIExpression(), !15)
    #dbg_declare(i32 %N, !38, !DIExpression(), !15)
  %21 = getelementptr inbounds nuw i8, ptr %maxpool.var_A.shape, i64 8, !dbg !15
  %22 = load i64, ptr %21, align 8, !dbg !15, !tbaa !39
  %C = trunc i64 %22 to i32, !dbg !15
    #dbg_declare(i32 %C, !41, !DIExpression(), !15)
    #dbg_declare(i32 %C, !41, !DIExpression(), !15)
  %23 = getelementptr inbounds nuw i8, ptr %maxpool.var_A.shape, i64 16, !dbg !15
  %24 = load i64, ptr %23, align 8, !dbg !15, !tbaa !42
  %H = trunc i64 %24 to i32, !dbg !15
    #dbg_declare(i32 %H, !45, !DIExpression(), !15)
    #dbg_declare(i32 %H, !45, !DIExpression(), !15)
  %25 = getelementptr inbounds nuw i8, ptr %maxpool.var_A.shape, i64 24, !dbg !15
  %26 = load i64, ptr %25, align 8, !dbg !15, !tbaa !46
  %W = trunc i64 %26 to i32, !dbg !15
    #dbg_declare(i32 %W, !48, !DIExpression(), !15)
    #dbg_declare(i32 %W, !48, !DIExpression(), !15)
  %27 = getelementptr inbounds nuw i8, ptr %var_A, i64 32, !dbg !15
  %maxpool.var_A.strides = load ptr, ptr %27, align 8, !dbg !15
    #dbg_declare(ptr %maxpool.var_A.strides, !49, !DIExpression(), !15)
    #dbg_declare(ptr %maxpool.var_A.strides, !49, !DIExpression(), !15)
  %28 = getelementptr inbounds nuw i8, ptr %var_A, i64 12, !dbg !15
  %dev_id = load i32, ptr %28, align 4, !dbg !15
    #dbg_declare(i32 %dev_id, !50, !DIExpression(), !15)
    #dbg_declare(i32 %dev_id, !50, !DIExpression(), !15)
  %A = load ptr, ptr %var_A, align 8, !dbg !15
    #dbg_declare(ptr %A, !51, !DIExpression(), !15)
    #dbg_declare(ptr %A, !51, !DIExpression(), !15)
  call void @llvm.assume(i1 true) [ "align"(ptr %A, i64 64) ], !dbg !15
  %.not50 = icmp eq ptr %12, null, !dbg !15
  br i1 %.not50, label %assert_fail11, label %assert_end12, !dbg !15, !prof !20

assert_fail11:                                    ; preds = %assert_end10
  %29 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %29(ptr nonnull @.str.1, ptr nonnull @.str.7), !dbg !15
  br label %common.ret, !dbg !15

assert_end12:                                     ; preds = %assert_end10
  %30 = getelementptr inbounds nuw i8, ptr %var_pool_max, i64 16, !dbg !15
  %31 = load i32, ptr %30, align 4, !dbg !15
  %32 = icmp eq i32 %31, 4, !dbg !15
  br i1 %32, label %assert_end14, label %assert_fail13, !dbg !15, !prof !16

assert_fail13:                                    ; preds = %assert_end12
  %33 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %33(ptr nonnull @.str.1, ptr nonnull @.str.8), !dbg !15
  br label %common.ret, !dbg !15

assert_end14:                                     ; preds = %assert_end12
  %34 = getelementptr inbounds nuw i8, ptr %var_pool_max, i64 24, !dbg !15
  %maxpool.var_pool_max.shape = load ptr, ptr %34, align 8, !dbg !15
    #dbg_declare(ptr %maxpool.var_pool_max.shape, !54, !DIExpression(), !15)
    #dbg_declare(ptr %maxpool.var_pool_max.shape, !54, !DIExpression(), !15)
  %35 = getelementptr inbounds nuw i8, ptr %var_pool_max, i64 32, !dbg !15
  %maxpool.var_pool_max.strides = load ptr, ptr %35, align 8, !dbg !15
    #dbg_declare(ptr %maxpool.var_pool_max.strides, !55, !DIExpression(), !15)
    #dbg_declare(ptr %maxpool.var_pool_max.strides, !55, !DIExpression(), !15)
  %pool_max = load ptr, ptr %var_pool_max, align 8, !dbg !15
    #dbg_declare(ptr %pool_max, !56, !DIExpression(), !15)
    #dbg_declare(ptr %pool_max, !56, !DIExpression(), !15)
  call void @llvm.assume(i1 true) [ "align"(ptr %pool_max, i64 64) ], !dbg !15
  %36 = getelementptr inbounds nuw i8, ptr %var_A, i64 22, !dbg !15
  %37 = load i16, ptr %36, align 2, !dbg !15
  %38 = icmp eq i16 %37, 1, !dbg !15
  %39 = getelementptr inbounds nuw i8, ptr %var_A, i64 21, !dbg !15
  %40 = load i8, ptr %39, align 1, !dbg !15
  %41 = icmp eq i8 %40, 32, !dbg !15
  %42 = getelementptr inbounds nuw i8, ptr %var_A, i64 20, !dbg !15
  %43 = load i8, ptr %42, align 1, !dbg !15
  %44 = icmp eq i8 %43, 2, !dbg !15
  %45 = and i1 %41, %44, !dbg !15
  %46 = and i1 %38, %45, !dbg !15
  br i1 %46, label %assert_end16, label %assert_fail15, !dbg !15, !prof !16

assert_fail15:                                    ; preds = %assert_end14
  %47 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %47(ptr nonnull @.str.1, ptr nonnull @.str.9), !dbg !15
  br label %common.ret, !dbg !15

assert_end16:                                     ; preds = %assert_end14
  %.not51 = icmp eq ptr %maxpool.var_A.strides, null, !dbg !15
  br i1 %.not51, label %if_end, label %if_then, !dbg !15, !prof !20

if_then:                                          ; preds = %assert_end16
  %48 = mul nsw i32 %W, %H, !dbg !15
  %49 = mul nsw i32 %48, %C, !dbg !15
  %50 = load i64, ptr %maxpool.var_A.strides, align 8, !dbg !15, !tbaa !57
  %51 = trunc i64 %50 to i32, !dbg !15
  %52 = icmp eq i32 %49, %51, !dbg !15
  %53 = icmp eq i32 %N, 1, !dbg !15
  %54 = or i1 %53, %52, !dbg !15
  %55 = getelementptr inbounds nuw i8, ptr %maxpool.var_A.strides, i64 8, !dbg !15
  %56 = load i64, ptr %55, align 8, !dbg !15, !tbaa !67
  %57 = trunc i64 %56 to i32, !dbg !15
  %58 = icmp eq i32 %48, %57, !dbg !15
  %59 = icmp eq i32 %C, 1, !dbg !15
  %60 = or i1 %59, %58, !dbg !15
  %61 = getelementptr inbounds nuw i8, ptr %maxpool.var_A.strides, i64 16, !dbg !15
  %62 = load i64, ptr %61, align 8, !dbg !15, !tbaa !69
  %63 = trunc i64 %62 to i32, !dbg !15
  %64 = icmp eq i32 %W, %63, !dbg !15
  %65 = icmp eq i32 %H, 1, !dbg !15
  %66 = or i1 %65, %64, !dbg !15
  %67 = getelementptr inbounds nuw i8, ptr %maxpool.var_A.strides, i64 24, !dbg !15
  %68 = load i64, ptr %67, align 8, !dbg !15, !tbaa !72
  %69 = and i64 %68, 4294967295, !dbg !15
  %70 = icmp eq i64 %69, 1, !dbg !15
  %71 = icmp eq i32 %W, 1, !dbg !15
  %72 = or i1 %71, %70, !dbg !15
  %73 = and i1 %66, %72, !dbg !15
  %74 = and i1 %60, %73, !dbg !15
  %75 = and i1 %54, %74, !dbg !15
  br i1 %75, label %if_end, label %assert_fail17, !dbg !15, !prof !16

if_end:                                           ; preds = %if_then, %assert_end16
  %76 = getelementptr inbounds nuw i8, ptr %var_A, i64 40, !dbg !15
  %77 = load i64, ptr %76, align 8, !dbg !15
  %78 = icmp eq i64 %77, 0, !dbg !15
  br i1 %78, label %assert_end20, label %assert_fail19, !dbg !15, !prof !16

assert_fail17:                                    ; preds = %if_then
  %79 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %79(ptr nonnull @.str.1, ptr nonnull @.str.10), !dbg !15
  br label %common.ret, !dbg !15

assert_fail19:                                    ; preds = %if_end
  %80 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %80(ptr nonnull @.str.1, ptr nonnull @.str.11), !dbg !15
  br label %common.ret, !dbg !15

assert_end20:                                     ; preds = %if_end
  %81 = getelementptr inbounds nuw i8, ptr %var_A, i64 8, !dbg !15
  %82 = load i32, ptr %81, align 4, !dbg !15
  %83 = icmp eq i32 %82, 1, !dbg !15
  br i1 %83, label %assert_end22, label %assert_fail21, !dbg !15, !prof !16

assert_fail21:                                    ; preds = %assert_end20
  %84 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %84(ptr nonnull @.str.1, ptr nonnull @.str.12), !dbg !15
  br label %common.ret, !dbg !15

assert_end22:                                     ; preds = %assert_end20
  %85 = icmp ne ptr %A, null, !dbg !15
  %86 = mul nsw i32 %C, %N, !dbg !15
  %87 = mul nsw i32 %86, %H, !dbg !15
  %88 = mul nsw i32 %87, %W, !dbg !15
  %89 = icmp eq i32 %88, 0, !dbg !15
  %90 = or i1 %89, %85, !dbg !15
  br i1 %90, label %assert_end24, label %assert_fail23, !dbg !15, !prof !16

assert_fail23:                                    ; preds = %assert_end22
  %91 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %91(ptr nonnull @.str.1, ptr nonnull @.str.13), !dbg !15
  br label %common.ret, !dbg !15

assert_end24:                                     ; preds = %assert_end22
  %92 = getelementptr inbounds nuw i8, ptr %var_pool_max, i64 22, !dbg !15
  %93 = load i16, ptr %92, align 2, !dbg !15
  %94 = icmp eq i16 %93, 1, !dbg !15
  %95 = getelementptr inbounds nuw i8, ptr %var_pool_max, i64 21, !dbg !15
  %96 = load i8, ptr %95, align 1, !dbg !15
  %97 = icmp eq i8 %96, 32, !dbg !15
  %98 = getelementptr inbounds nuw i8, ptr %var_pool_max, i64 20, !dbg !15
  %99 = load i8, ptr %98, align 1, !dbg !15
  %100 = icmp eq i8 %99, 2, !dbg !15
  %101 = and i1 %97, %100, !dbg !15
  %102 = and i1 %94, %101, !dbg !15
  br i1 %102, label %assert_end26, label %assert_fail25, !dbg !15, !prof !16

assert_fail25:                                    ; preds = %assert_end24
  %103 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %103(ptr nonnull @.str.1, ptr nonnull @.str.14), !dbg !15
  br label %common.ret, !dbg !15

assert_end26:                                     ; preds = %assert_end24
  %104 = load i64, ptr %maxpool.var_pool_max.shape, align 8, !dbg !15, !tbaa !74
  %105 = trunc i64 %104 to i32, !dbg !15
  %106 = icmp eq i32 %N, %105, !dbg !15
  br i1 %106, label %assert_end28, label %assert_fail27, !dbg !15, !prof !16

assert_fail27:                                    ; preds = %assert_end26
  %107 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %107(ptr nonnull @.str.1, ptr nonnull @.str.15), !dbg !15
  br label %common.ret, !dbg !15

assert_end28:                                     ; preds = %assert_end26
  %108 = getelementptr inbounds nuw i8, ptr %maxpool.var_pool_max.shape, i64 8, !dbg !15
  %109 = load i64, ptr %108, align 8, !dbg !15, !tbaa !84
  %110 = trunc i64 %109 to i32, !dbg !15
  %111 = icmp eq i32 %C, %110, !dbg !15
  br i1 %111, label %assert_end30, label %assert_fail29, !dbg !15, !prof !16

assert_fail29:                                    ; preds = %assert_end28
  %112 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %112(ptr nonnull @.str.1, ptr nonnull @.str.16), !dbg !15
  br label %common.ret, !dbg !15

assert_end30:                                     ; preds = %assert_end28
  %113 = ashr i32 %H, 1, !dbg !15
  %114 = getelementptr inbounds nuw i8, ptr %maxpool.var_pool_max.shape, i64 16, !dbg !15
  %115 = load i64, ptr %114, align 8, !dbg !15, !tbaa !86
  %116 = trunc i64 %115 to i32, !dbg !15
  %117 = icmp eq i32 %113, %116, !dbg !15
  br i1 %117, label %assert_end32, label %assert_fail31, !dbg !15, !prof !16

assert_fail31:                                    ; preds = %assert_end30
  %118 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %118(ptr nonnull @.str.1, ptr nonnull @.str.17), !dbg !15
  br label %common.ret, !dbg !15

assert_end32:                                     ; preds = %assert_end30
  %119 = ashr i32 %W, 1, !dbg !15
  %120 = getelementptr inbounds nuw i8, ptr %maxpool.var_pool_max.shape, i64 24, !dbg !15
  %121 = load i64, ptr %120, align 8, !dbg !15, !tbaa !89
  %122 = trunc i64 %121 to i32, !dbg !15
  %123 = icmp eq i32 %119, %122, !dbg !15
  br i1 %123, label %assert_end34, label %assert_fail33, !dbg !15, !prof !16

assert_fail33:                                    ; preds = %assert_end32
  %124 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %124(ptr nonnull @.str.1, ptr nonnull @.str.18), !dbg !15
  br label %common.ret, !dbg !15

assert_end34:                                     ; preds = %assert_end32
  %.not52 = icmp eq ptr %maxpool.var_pool_max.strides, null, !dbg !15
  br i1 %.not52, label %if_end36, label %if_then35, !dbg !15, !prof !20

if_then35:                                        ; preds = %assert_end34
  %125 = mul nsw i32 %119, %113, !dbg !15
  %126 = mul nsw i32 %125, %C, !dbg !15
  %127 = load i64, ptr %maxpool.var_pool_max.strides, align 8, !dbg !15, !tbaa !91
  %128 = trunc i64 %127 to i32, !dbg !15
  %129 = icmp eq i32 %126, %128, !dbg !15
  %130 = icmp eq i32 %N, 1, !dbg !15
  %131 = or i1 %130, %129, !dbg !15
  %132 = getelementptr inbounds nuw i8, ptr %maxpool.var_pool_max.strides, i64 8, !dbg !15
  %133 = load i64, ptr %132, align 8, !dbg !15, !tbaa !101
  %134 = trunc i64 %133 to i32, !dbg !15
  %135 = icmp eq i32 %125, %134, !dbg !15
  %136 = icmp eq i32 %C, 1, !dbg !15
  %137 = or i1 %136, %135, !dbg !15
  %138 = getelementptr inbounds nuw i8, ptr %maxpool.var_pool_max.strides, i64 16, !dbg !15
  %139 = load i64, ptr %138, align 8, !dbg !15, !tbaa !103
  %140 = trunc i64 %139 to i32, !dbg !15
  %141 = icmp eq i32 %119, %140, !dbg !15
  %142 = icmp eq i32 %113, 1, !dbg !15
  %143 = or i1 %142, %141, !dbg !15
  %144 = getelementptr inbounds nuw i8, ptr %maxpool.var_pool_max.strides, i64 24, !dbg !15
  %145 = load i64, ptr %144, align 8, !dbg !15, !tbaa !106
  %146 = and i64 %145, 4294967295, !dbg !15
  %147 = icmp eq i64 %146, 1, !dbg !15
  %148 = icmp eq i32 %119, 1, !dbg !15
  %149 = or i1 %148, %147, !dbg !15
  %150 = and i1 %143, %149, !dbg !15
  %151 = and i1 %137, %150, !dbg !15
  %152 = and i1 %131, %151, !dbg !15
  br i1 %152, label %if_end36, label %assert_fail37, !dbg !15, !prof !16

if_end36:                                         ; preds = %if_then35, %assert_end34
  %153 = getelementptr inbounds nuw i8, ptr %var_pool_max, i64 40, !dbg !15
  %154 = load i64, ptr %153, align 8, !dbg !15
  %155 = icmp eq i64 %154, 0, !dbg !15
  br i1 %155, label %assert_end40, label %assert_fail39, !dbg !15, !prof !16

assert_fail37:                                    ; preds = %if_then35
  %156 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %156(ptr nonnull @.str.1, ptr nonnull @.str.19), !dbg !15
  br label %common.ret, !dbg !15

assert_fail39:                                    ; preds = %if_end36
  %157 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %157(ptr nonnull @.str.1, ptr nonnull @.str.20), !dbg !15
  br label %common.ret, !dbg !15

assert_end40:                                     ; preds = %if_end36
  %158 = getelementptr inbounds nuw i8, ptr %var_pool_max, i64 8, !dbg !15
  %159 = load i32, ptr %158, align 4, !dbg !15
  %160 = icmp eq i32 %159, 1, !dbg !15
  br i1 %160, label %assert_end42, label %assert_fail41, !dbg !15, !prof !16

assert_fail41:                                    ; preds = %assert_end40
  %161 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %161(ptr nonnull @.str.1, ptr nonnull @.str.21), !dbg !15
  br label %common.ret, !dbg !15

assert_end42:                                     ; preds = %assert_end40
  %162 = getelementptr inbounds nuw i8, ptr %var_pool_max, i64 12, !dbg !15
  %163 = load i32, ptr %162, align 4, !dbg !15
  %164 = icmp eq i32 %dev_id, %163, !dbg !15
  br i1 %164, label %assert_end44, label %assert_fail43, !dbg !15, !prof !16

assert_fail43:                                    ; preds = %assert_end42
  %165 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %165(ptr nonnull @.str.1, ptr nonnull @.str.22), !dbg !15
  br label %common.ret, !dbg !15

assert_end44:                                     ; preds = %assert_end42
  %166 = icmp ne ptr %pool_max, null, !dbg !15
  %167 = mul nsw i32 %113, %86, !dbg !15
  %168 = mul nsw i32 %167, %119, !dbg !15
  %169 = icmp eq i32 %168, 0, !dbg !15
  %170 = or i1 %169, %166, !dbg !15
  br i1 %170, label %assert_end46, label %assert_fail45, !dbg !15, !prof !16

assert_fail45:                                    ; preds = %assert_end44
  %171 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %171(ptr nonnull @.str.1, ptr nonnull @.str.23), !dbg !15
  br label %common.ret, !dbg !15

assert_end46:                                     ; preds = %assert_end44
  tail call fastcc void @maxpool_compute_(i32 %N, i32 %C, i32 %H, i32 %W, ptr %pool_max, ptr %A), !dbg !15
  br label %common.ret, !dbg !15
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define internal fastcc void @maxpool_compute_(i32 %N, i32 %C, i32 %H, i32 %W, ptr noalias nocapture writeonly align 64 %pool_max, ptr noalias nocapture readonly align 64 %A) unnamed_addr #2 !dbg !108 {
entry:
    #dbg_value(i32 %N, !112, !DIExpression(), !118)
    #dbg_value(i32 %C, !113, !DIExpression(), !118)
    #dbg_value(i32 %H, !114, !DIExpression(), !118)
    #dbg_value(i32 %W, !115, !DIExpression(), !118)
    #dbg_value(ptr %pool_max, !116, !DIExpression(), !118)
    #dbg_value(ptr %A, !117, !DIExpression(), !118)
    #dbg_declare(i32 0, !119, !DIExpression(), !118)
  %0 = icmp sgt i32 %N, 0, !dbg !118
  br i1 %0, label %for_begin_ax1.preheader.lr.ph, label %for_end_ax0, !dbg !118, !prof !120

for_begin_ax1.preheader.lr.ph:                    ; preds = %entry
  %1 = icmp slt i32 %C, 1
  %2 = ashr i32 %H, 1
  %3 = ashr i32 %W, 1
  %4 = icmp slt i32 %3, 1
  %5 = icmp slt i32 %2, 1
  %or.cond.not48 = select i1 %1, i1 true, i1 %5
  %brmerge = select i1 %or.cond.not48, i1 true, i1 %4
  br i1 %brmerge, label %for_end_ax0, label %for_begin_ax1.preheader.us.us.us.preheader, !prof !121

for_begin_ax1.preheader.us.us.us.preheader:       ; preds = %for_begin_ax1.preheader.lr.ph
  %6 = zext nneg i32 %W to i64, !dbg !118
  %7 = zext nneg i32 %3 to i64, !dbg !118
  %8 = zext nneg i32 %2 to i64, !dbg !118
  %9 = zext nneg i32 %H to i64, !dbg !118
  %10 = zext nneg i32 %C to i64, !dbg !118
  %wide.trip.count40 = zext nneg i32 %N to i64, !dbg !118
  %wide.trip.count35 = zext nneg i32 %C to i64
  %wide.trip.count30 = zext nneg i32 %2 to i64
  %wide.trip.count = zext nneg i32 %3 to i64
  %invariant.gep42 = getelementptr i8, ptr %A, i64 4
  %invariant.gep44 = getelementptr i8, ptr %A, i64 4
  %min.iters.check = icmp ult i32 %3, 4
  %n.vec = and i64 %wide.trip.count, 2147483644
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br label %for_begin_ax1.preheader.us.us.us, !dbg !118

for_begin_ax1.preheader.us.us.us:                 ; preds = %for_begin_ax1.preheader.us.us.us.preheader, %for_begin_ax1.for_end_ax1_crit_edge.split.us.split.us.us.us.us
  %indvars.iv37 = phi i64 [ 0, %for_begin_ax1.preheader.us.us.us.preheader ], [ %indvars.iv.next38, %for_begin_ax1.for_end_ax1_crit_edge.split.us.split.us.us.us.us ]
    #dbg_declare(i64 %indvars.iv37, !119, !DIExpression(), !118)
    #dbg_declare(i32 0, !122, !DIExpression(), !118)
  %11 = mul nuw nsw i64 %indvars.iv37, %10
  br label %for_body_ax1.us.us.us.us.us, !dbg !118

for_body_ax1.us.us.us.us.us:                      ; preds = %for_begin_ax2.for_end_ax2_crit_edge.split.us.us.us.us.us.us, %for_begin_ax1.preheader.us.us.us
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %for_begin_ax2.for_end_ax2_crit_edge.split.us.us.us.us.us.us ], [ 0, %for_begin_ax1.preheader.us.us.us ]
    #dbg_declare(i64 %indvars.iv32, !122, !DIExpression(), !118)
    #dbg_declare(i32 0, !123, !DIExpression(), !118)
  %12 = add nuw nsw i64 %indvars.iv32, %11
  %13 = mul nuw nsw i64 %12, %8
  %14 = mul nuw nsw i64 %12, %9
  %invariant.op = add nuw i64 %14, 1, !dbg !118
  br label %for_body_ax2.us.us.us.us.us.us, !dbg !118

for_body_ax2.us.us.us.us.us.us:                   ; preds = %for_begin_ax3.for_end_ax3_crit_edge.us.us.us.us.us.us, %for_body_ax1.us.us.us.us.us
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %for_begin_ax3.for_end_ax3_crit_edge.us.us.us.us.us.us ], [ 0, %for_body_ax1.us.us.us.us.us ]
    #dbg_declare(i64 %indvars.iv27, !123, !DIExpression(), !118)
    #dbg_declare(i32 0, !124, !DIExpression(), !118)
  %15 = add nuw nsw i64 %indvars.iv27, %13
  %16 = mul nuw nsw i64 %15, %7
  %17 = shl nuw nsw i64 %indvars.iv27, 1
  %18 = add nuw nsw i64 %17, %14
  %invariant.gep = getelementptr inbounds nuw float, ptr %pool_max, i64 %16, !dbg !118
  %19 = mul nuw nsw i64 %18, %6
  %.reass = add i64 %17, %invariant.op
  %20 = mul nsw i64 %.reass, %6
  br i1 %min.iters.check, label %if_end.us.us.us.us.us.us.1.1.preheader, label %vector.ph, !dbg !118, !prof !125

vector.ph:                                        ; preds = %for_body_ax2.us.us.us.us.us.us
  %21 = getelementptr inbounds nuw float, ptr %A, i64 %19
  %22 = getelementptr float, ptr %A, i64 %20
  br label %vector.body, !dbg !118

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !118
  %23 = getelementptr inbounds nuw float, ptr %invariant.gep, i64 %index, !dbg !118
  %24 = shl nuw nsw i64 %index, 1, !dbg !118
  %25 = getelementptr inbounds nuw float, ptr %21, i64 %24, !dbg !118
  %wide.vec = load <8 x float>, ptr %25, align 4, !dbg !118, !tbaa !126
  %strided.vec = shufflevector <8 x float> %wide.vec, <8 x float> poison, <4 x i32> <i32 0, i32 2, i32 4, i32 6>, !dbg !118
  %strided.vec1 = shufflevector <8 x float> %wide.vec, <8 x float> poison, <4 x i32> <i32 1, i32 3, i32 5, i32 7>, !dbg !118
  %26 = fcmp olt <4 x float> %strided.vec, splat (float 0xC7EFFFFFE0000000), !dbg !118
  %27 = select <4 x i1> %26, <4 x float> splat (float 0xC7EFFFFFE0000000), <4 x float> %strided.vec, !dbg !118
  %28 = fcmp ogt <4 x float> %27, %strided.vec1, !dbg !118
  %29 = select <4 x i1> %28, <4 x float> %27, <4 x float> %strided.vec1, !dbg !118
  %30 = getelementptr float, ptr %22, i64 %24, !dbg !118
  %wide.vec2 = load <8 x float>, ptr %30, align 4, !dbg !118, !tbaa !126
  %strided.vec3 = shufflevector <8 x float> %wide.vec2, <8 x float> poison, <4 x i32> <i32 0, i32 2, i32 4, i32 6>, !dbg !118
  %strided.vec4 = shufflevector <8 x float> %wide.vec2, <8 x float> poison, <4 x i32> <i32 1, i32 3, i32 5, i32 7>, !dbg !118
  %31 = fcmp ogt <4 x float> %29, %strided.vec3, !dbg !118
  %32 = select <4 x i1> %31, <4 x float> %29, <4 x float> %strided.vec3, !dbg !118
  %33 = fcmp ogt <4 x float> %32, %strided.vec4, !dbg !118
  %34 = select <4 x i1> %33, <4 x float> %32, <4 x float> %strided.vec4, !dbg !118
  store <4 x float> %34, ptr %23, align 4, !dbg !118, !tbaa !128
  %index.next = add nuw i64 %index, 4, !dbg !118
  %35 = icmp eq i64 %index.next, %n.vec, !dbg !118
  br i1 %35, label %middle.block, label %vector.body, !dbg !118, !prof !130, !llvm.loop !131

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for_begin_ax3.for_end_ax3_crit_edge.us.us.us.us.us.us, label %if_end.us.us.us.us.us.us.1.1.preheader, !dbg !118, !prof !134

if_end.us.us.us.us.us.us.1.1.preheader:           ; preds = %for_body_ax2.us.us.us.us.us.us, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for_body_ax2.us.us.us.us.us.us ], [ %n.vec, %middle.block ]
  br label %if_end.us.us.us.us.us.us.1.1, !dbg !118

if_end.us.us.us.us.us.us.1.1:                     ; preds = %if_end.us.us.us.us.us.us.1.1.preheader, %if_end.us.us.us.us.us.us.1.1
  %indvars.iv = phi i64 [ %indvars.iv.next, %if_end.us.us.us.us.us.us.1.1 ], [ %indvars.iv.ph, %if_end.us.us.us.us.us.us.1.1.preheader ]
    #dbg_declare(i64 %indvars.iv, !124, !DIExpression(), !118)
  %gep = getelementptr inbounds nuw float, ptr %invariant.gep, i64 %indvars.iv
  %36 = shl nuw nsw i64 %indvars.iv, 1
    #dbg_declare(i32 0, !135, !DIExpression(), !118)
    #dbg_declare(i64 0, !135, !DIExpression(), !118)
  %37 = add nuw nsw i64 %19, %36
    #dbg_declare(i32 0, !136, !DIExpression(), !118)
    #dbg_declare(i64 0, !136, !DIExpression(), !118)
  %38 = getelementptr inbounds float, ptr %A, i64 %37, !dbg !118
  %39 = load float, ptr %38, align 4, !dbg !118, !tbaa !126
  %40 = fcmp olt float %39, 0xC7EFFFFFE0000000, !dbg !118
  %41 = select i1 %40, float 0xC7EFFFFFE0000000, float %39, !dbg !118
    #dbg_declare(i64 1, !136, !DIExpression(), !118)
    #dbg_declare(i64 1, !136, !DIExpression(), !118)
  %gep43 = getelementptr float, ptr %invariant.gep42, i64 %37, !dbg !118
  %42 = load float, ptr %gep43, align 4, !dbg !118, !tbaa !126
  %43 = fcmp ogt float %41, %42, !dbg !118
  %44 = select i1 %43, float %41, float %42, !dbg !118
    #dbg_declare(i64 2, !136, !DIExpression(), !118)
    #dbg_declare(i64 1, !135, !DIExpression(), !118)
    #dbg_declare(i64 1, !135, !DIExpression(), !118)
  %45 = add nsw i64 %20, %36
    #dbg_declare(i32 0, !136, !DIExpression(), !118)
    #dbg_declare(i64 0, !136, !DIExpression(), !118)
  %46 = getelementptr inbounds float, ptr %A, i64 %45, !dbg !118
  %47 = load float, ptr %46, align 4, !dbg !118, !tbaa !126
  %48 = fcmp ogt float %44, %47, !dbg !118
  %49 = select i1 %48, float %44, float %47, !dbg !118
    #dbg_declare(i64 1, !136, !DIExpression(), !118)
    #dbg_declare(i64 1, !136, !DIExpression(), !118)
  %gep45 = getelementptr float, ptr %invariant.gep44, i64 %45, !dbg !118
  %50 = load float, ptr %gep45, align 4, !dbg !118, !tbaa !126
  %51 = fcmp ogt float %49, %50, !dbg !118
  %52 = select i1 %51, float %49, float %50, !dbg !118
  store float %52, ptr %gep, align 4, !dbg !118, !tbaa !128
    #dbg_declare(i64 2, !136, !DIExpression(), !118)
    #dbg_declare(i64 2, !135, !DIExpression(), !118)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !118
    #dbg_declare(i64 %indvars.iv.next, !124, !DIExpression(), !118)
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count, !dbg !118
  br i1 %exitcond.not, label %for_begin_ax3.for_end_ax3_crit_edge.us.us.us.us.us.us, label %if_end.us.us.us.us.us.us.1.1, !dbg !118, !prof !137, !llvm.loop !138

for_begin_ax3.for_end_ax3_crit_edge.us.us.us.us.us.us: ; preds = %if_end.us.us.us.us.us.us.1.1, %middle.block
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1, !dbg !118
    #dbg_declare(i64 %indvars.iv.next28, !123, !DIExpression(), !118)
  %exitcond31.not = icmp eq i64 %indvars.iv.next28, %wide.trip.count30, !dbg !118
  br i1 %exitcond31.not, label %for_begin_ax2.for_end_ax2_crit_edge.split.us.us.us.us.us.us, label %for_body_ax2.us.us.us.us.us.us, !dbg !118, !prof !139

for_begin_ax2.for_end_ax2_crit_edge.split.us.us.us.us.us.us: ; preds = %for_begin_ax3.for_end_ax3_crit_edge.us.us.us.us.us.us
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1, !dbg !118
    #dbg_declare(i64 %indvars.iv.next33, !122, !DIExpression(), !118)
  %exitcond36.not = icmp eq i64 %indvars.iv.next33, %wide.trip.count35, !dbg !118
  br i1 %exitcond36.not, label %for_begin_ax1.for_end_ax1_crit_edge.split.us.split.us.us.us.us, label %for_body_ax1.us.us.us.us.us, !dbg !118, !prof !139

for_begin_ax1.for_end_ax1_crit_edge.split.us.split.us.us.us.us: ; preds = %for_begin_ax2.for_end_ax2_crit_edge.split.us.us.us.us.us.us
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1, !dbg !118
    #dbg_declare(i64 %indvars.iv.next38, !119, !DIExpression(), !118)
  %exitcond41.not = icmp eq i64 %indvars.iv.next38, %wide.trip.count40, !dbg !118
  br i1 %exitcond41.not, label %for_end_ax0, label %for_begin_ax1.preheader.us.us.us, !dbg !118, !prof !139

for_end_ax0:                                      ; preds = %for_begin_ax1.for_end_ax1_crit_edge.split.us.split.us.us.us.us, %for_begin_ax1.preheader.lr.ph, %entry
  ret void, !dbg !118
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
!5 = distinct !DISubprogram(name: "maxpool", scope: !1, file: !1, type: !6, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !10)
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
!22 = !DILocalVariable(name: "var_pool_max.type_index", scope: !5, file: !1, type: !8)
!23 = !DILocalVariable(name: "var_A", scope: !5, file: !1, type: !9)
!24 = !DILocalVariable(name: "var_pool_max", scope: !5, file: !1, type: !9)
!25 = !DILocalVariable(name: "maxpool.var_A.shape", scope: !5, file: !1, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27)
!27 = !DIBasicType(name: "int64", size: 64, encoding: DW_ATE_signed)
!28 = !{!29, !29, i64 0}
!29 = !{!"0x6079baca63b0.w8.b0", !30, i64 0}
!30 = !{!"0x6079baca63b0.w16.b0", !31, i64 0}
!31 = !{!"0x6079baca63b0.w32.b0", !32, i64 0}
!32 = !{!"0x6079baca63b0.w64.b0", !33, i64 0}
!33 = !{!"0x6079baca63b0.w128.b0", !34, i64 0}
!34 = !{!"0x6079baca63b0.w256.b0", !35, i64 0}
!35 = !{!"0x6079baca63b0.w512.b0", !36, i64 0}
!36 = !{!"0x6079baca63b0.w1024.b0", !37, i64 0}
!37 = !{!"0x6079baca63b0", !19, i64 0}
!38 = !DILocalVariable(name: "N", scope: !5, file: !1, type: !8)
!39 = !{!40, !40, i64 0}
!40 = !{!"0x6079baca63b0.w8.b8", !30, i64 0}
!41 = !DILocalVariable(name: "C", scope: !5, file: !1, type: !8)
!42 = !{!43, !43, i64 0}
!43 = !{!"0x6079baca63b0.w8.b16", !44, i64 0}
!44 = !{!"0x6079baca63b0.w16.b16", !31, i64 0}
!45 = !DILocalVariable(name: "H", scope: !5, file: !1, type: !8)
!46 = !{!47, !47, i64 0}
!47 = !{!"0x6079baca63b0.w8.b24", !44, i64 0}
!48 = !DILocalVariable(name: "W", scope: !5, file: !1, type: !8)
!49 = !DILocalVariable(name: "maxpool.var_A.strides", scope: !5, file: !1, type: !26)
!50 = !DILocalVariable(name: "dev_id", scope: !5, file: !1, type: !8)
!51 = !DILocalVariable(name: "A", scope: !5, file: !1, type: !52)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53)
!53 = !DIBasicType(name: "float32", size: 32, encoding: DW_ATE_float)
!54 = !DILocalVariable(name: "maxpool.var_pool_max.shape", scope: !5, file: !1, type: !26)
!55 = !DILocalVariable(name: "maxpool.var_pool_max.strides", scope: !5, file: !1, type: !26)
!56 = !DILocalVariable(name: "pool_max", scope: !5, file: !1, type: !52)
!57 = !{!58, !58, i64 0}
!58 = !{!"0x6079bb073630.w8.b0", !59, i64 0}
!59 = !{!"0x6079bb073630.w16.b0", !60, i64 0}
!60 = !{!"0x6079bb073630.w32.b0", !61, i64 0}
!61 = !{!"0x6079bb073630.w64.b0", !62, i64 0}
!62 = !{!"0x6079bb073630.w128.b0", !63, i64 0}
!63 = !{!"0x6079bb073630.w256.b0", !64, i64 0}
!64 = !{!"0x6079bb073630.w512.b0", !65, i64 0}
!65 = !{!"0x6079bb073630.w1024.b0", !66, i64 0}
!66 = !{!"0x6079bb073630", !19, i64 0}
!67 = !{!68, !68, i64 0}
!68 = !{!"0x6079bb073630.w8.b8", !59, i64 0}
!69 = !{!70, !70, i64 0}
!70 = !{!"0x6079bb073630.w8.b16", !71, i64 0}
!71 = !{!"0x6079bb073630.w16.b16", !60, i64 0}
!72 = !{!73, !73, i64 0}
!73 = !{!"0x6079bb073630.w8.b24", !71, i64 0}
!74 = !{!75, !75, i64 0}
!75 = !{!"0x6079bb153850.w8.b0", !76, i64 0}
!76 = !{!"0x6079bb153850.w16.b0", !77, i64 0}
!77 = !{!"0x6079bb153850.w32.b0", !78, i64 0}
!78 = !{!"0x6079bb153850.w64.b0", !79, i64 0}
!79 = !{!"0x6079bb153850.w128.b0", !80, i64 0}
!80 = !{!"0x6079bb153850.w256.b0", !81, i64 0}
!81 = !{!"0x6079bb153850.w512.b0", !82, i64 0}
!82 = !{!"0x6079bb153850.w1024.b0", !83, i64 0}
!83 = !{!"0x6079bb153850", !19, i64 0}
!84 = !{!85, !85, i64 0}
!85 = !{!"0x6079bb153850.w8.b8", !76, i64 0}
!86 = !{!87, !87, i64 0}
!87 = !{!"0x6079bb153850.w8.b16", !88, i64 0}
!88 = !{!"0x6079bb153850.w16.b16", !77, i64 0}
!89 = !{!90, !90, i64 0}
!90 = !{!"0x6079bb153850.w8.b24", !88, i64 0}
!91 = !{!92, !92, i64 0}
!92 = !{!"0x6079bb1e2870.w8.b0", !93, i64 0}
!93 = !{!"0x6079bb1e2870.w16.b0", !94, i64 0}
!94 = !{!"0x6079bb1e2870.w32.b0", !95, i64 0}
!95 = !{!"0x6079bb1e2870.w64.b0", !96, i64 0}
!96 = !{!"0x6079bb1e2870.w128.b0", !97, i64 0}
!97 = !{!"0x6079bb1e2870.w256.b0", !98, i64 0}
!98 = !{!"0x6079bb1e2870.w512.b0", !99, i64 0}
!99 = !{!"0x6079bb1e2870.w1024.b0", !100, i64 0}
!100 = !{!"0x6079bb1e2870", !19, i64 0}
!101 = !{!102, !102, i64 0}
!102 = !{!"0x6079bb1e2870.w8.b8", !93, i64 0}
!103 = !{!104, !104, i64 0}
!104 = !{!"0x6079bb1e2870.w8.b16", !105, i64 0}
!105 = !{!"0x6079bb1e2870.w16.b16", !94, i64 0}
!106 = !{!107, !107, i64 0}
!107 = !{!"0x6079bb1e2870.w8.b24", !105, i64 0}
!108 = distinct !DISubprogram(name: "maxpool_compute_", scope: !1, file: !1, type: !109, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !111)
!109 = !DISubroutineType(cc: DW_CC_nocall, types: !110)
!110 = !{!8, !8, !8, !8, !8, !52, !52}
!111 = !{!112, !113, !114, !115, !116, !117}
!112 = !DILocalVariable(name: "N", arg: 1, scope: !108, file: !1, type: !8)
!113 = !DILocalVariable(name: "C", arg: 2, scope: !108, file: !1, type: !8)
!114 = !DILocalVariable(name: "H", arg: 3, scope: !108, file: !1, type: !8)
!115 = !DILocalVariable(name: "W", arg: 4, scope: !108, file: !1, type: !8)
!116 = !DILocalVariable(name: "pool_max", arg: 5, scope: !108, file: !1, type: !52)
!117 = !DILocalVariable(name: "A", arg: 6, scope: !108, file: !1, type: !52)
!118 = !DILocation(line: 0, scope: !108)
!119 = !DILocalVariable(name: "ax0", scope: !108, file: !1, type: !8)
!120 = !{!"branch_weights", i32 127, i32 1}
!121 = !{!"branch_weights", i32 48769, i32 2048383}
!122 = !DILocalVariable(name: "ax1", scope: !108, file: !1, type: !8)
!123 = !DILocalVariable(name: "ax2", scope: !108, file: !1, type: !8)
!124 = !DILocalVariable(name: "ax3", scope: !108, file: !1, type: !8)
!125 = !{!"branch_weights", i32 1, i32 127}
!126 = !{!127, !127, i64 0}
!127 = !{!"0x6079baca3e80", !19, i64 0}
!128 = !{!129, !129, i64 0}
!129 = !{!"0x6079baf9b8c0", !19, i64 0}
!130 = !{!"branch_weights", i32 127, i32 33554289}
!131 = distinct !{!131, !132, !133}
!132 = !{!"llvm.loop.isvectorized", i32 1}
!133 = !{!"llvm.loop.unroll.runtime.disable"}
!134 = !{!"branch_weights", i32 1, i32 3}
!135 = !DILocalVariable(name: "rv0", scope: !108, file: !1, type: !8)
!136 = !DILocalVariable(name: "rv1", scope: !108, file: !1, type: !8)
!137 = !{!"branch_weights", i32 127, i32 0}
!138 = distinct !{!138, !133, !132}
!139 = !{!"branch_weights", i32 127, i32 134217601}
