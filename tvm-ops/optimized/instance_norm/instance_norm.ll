; ModuleID = 'TVMMod'
source_filename = "TVMMod"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__TVMFFIErrorSetRaisedFromCStr = linkonce dllexport local_unnamed_addr global ptr null, align 8
@.str = private constant [64 x i8] c"Assert fail: num_args == 4, instance_norm: num_args should be 4\00", align 1
@.str.1 = private constant [13 x i8] c"RuntimeError\00", align 1
@.str.2 = private constant [72 x i8] c"Assert fail: not T.isnullptr(args), instance_norm: args pointer is NULL\00", align 1
@.str.3 = private constant [155 x i8] c"Assert fail: var_A_type_index == 0 or var_A_type_index == 4 or var_A_type_index == 7 or var_A_type_index >= 64, instance_norm: Expect arg[0] to be pointer\00", align 1
@.str.4 = private constant [171 x i8] c"Assert fail: var_gamma_type_index == 0 or var_gamma_type_index == 4 or var_gamma_type_index == 7 or var_gamma_type_index >= 64, instance_norm: Expect arg[1] to be pointer\00", align 1
@.str.5 = private constant [167 x i8] c"Assert fail: var_beta_type_index == 0 or var_beta_type_index == 4 or var_beta_type_index == 7 or var_beta_type_index >= 64, instance_norm: Expect arg[2] to be pointer\00", align 1
@.str.6 = private constant [211 x i8] c"Assert fail: var_T_instance_norm_type_index == 0 or var_T_instance_norm_type_index == 4 or var_T_instance_norm_type_index == 7 or var_T_instance_norm_type_index >= 64, instance_norm: Expect arg[3] to be pointer\00", align 1
@.str.7 = private constant [104 x i8] c"Assert fail: not T.isnullptr(var_A), instance_norm.var_A is expected to have non-NULL DLTensor* pointer\00", align 1
@.str.8 = private constant [106 x i8] c"Assert fail: 4 == T.tvm_struct_get(var_A, 0, 4, \22int32\22), instance_norm.var_A.ndim is expected to equal 4\00", align 1
@.str.9 = private constant [112 x i8] c"Assert fail: not T.isnullptr(var_gamma), instance_norm.var_gamma is expected to have non-NULL DLTensor* pointer\00", align 1
@.str.10 = private constant [114 x i8] c"Assert fail: 1 == T.tvm_struct_get(var_gamma, 0, 4, \22int32\22), instance_norm.var_gamma.ndim is expected to equal 1\00", align 1
@.str.11 = private constant [110 x i8] c"Assert fail: not T.isnullptr(var_beta), instance_norm.var_beta is expected to have non-NULL DLTensor* pointer\00", align 1
@.str.12 = private constant [112 x i8] c"Assert fail: 1 == T.tvm_struct_get(var_beta, 0, 4, \22int32\22), instance_norm.var_beta.ndim is expected to equal 1\00", align 1
@.str.13 = private constant [132 x i8] c"Assert fail: not T.isnullptr(var_T_instance_norm), instance_norm.var_T_instance_norm is expected to have non-NULL DLTensor* pointer\00", align 1
@.str.14 = private constant [134 x i8] c"Assert fail: 4 == T.tvm_struct_get(var_T_instance_norm, 0, 4, \22int32\22), instance_norm.var_T_instance_norm.ndim is expected to equal 4\00", align 1
@.str.15 = private constant [236 x i8] c"Assert fail: T.tvm_struct_get(var_A, 0, 5, \22uint8\22) == T.uint8(2) and T.tvm_struct_get(var_A, 0, 6, \22uint8\22) == T.uint8(32) and T.tvm_struct_get(var_A, 0, 7, \22uint16\22) == T.uint16(1), instance_norm.var_A.dtype is expected to be float32\00", align 1
@.str.16 = private constant [356 x i8] c"Assert fail: (W == 1 or 1 == T.Cast(\22int32\22, instance_norm_var_A_strides[3])) and (H == 1 or W == T.Cast(\22int32\22, instance_norm_var_A_strides[2])) and (C == 1 or W * H == T.Cast(\22int32\22, instance_norm_var_A_strides[1])) and (N == 1 or W * H * C == T.Cast(\22int32\22, instance_norm_var_A_strides[0])), instance_norm.var_A.strides: expected to be compact array\00", align 1
@.str.17 = private constant [196 x i8] c"Assert fail: T.uint64(0) == T.tvm_struct_get(var_A, 0, 8, \22uint64\22), Argument instance_norm.var_A.byte_offset has an unsatisfied constraint: T.uint64(0) == T.tvm_struct_get(var_A, 0, 8, \22uint64\22)\00", align 1
@.str.18 = private constant [176 x i8] c"Assert fail: T.tvm_struct_get(var_A, 0, 10, \22int32\22) == 1, Argument instance_norm.var_A.device_type has an unsatisfied constraint: 1 == T.tvm_struct_get(var_A, 0, 10, \22int32\22)\00", align 1
@.str.19 = private constant [117 x i8] c"Assert fail: N * C * H * W == 0 or not T.isnullptr(A), instance_norm.var_A is expected to have non-NULL data pointer\00", align 1
@.str.20 = private constant [252 x i8] c"Assert fail: T.tvm_struct_get(var_gamma, 0, 5, \22uint8\22) == T.uint8(2) and T.tvm_struct_get(var_gamma, 0, 6, \22uint8\22) == T.uint8(32) and T.tvm_struct_get(var_gamma, 0, 7, \22uint16\22) == T.uint16(1), instance_norm.var_gamma.dtype is expected to be float32\00", align 1
@.str.21 = private constant [197 x i8] c"Assert fail: C == T.Cast(\22int32\22, instance_norm_var_gamma_shape[0]), Argument instance_norm.var_gamma.shape[0] has an unsatisfied constraint: C == T.Cast(\22int32\22, instance_norm_var_gamma_shape[0])\00", align 1
@.str.22 = private constant [143 x i8] c"Assert fail: C == 1 or 1 == T.Cast(\22int32\22, instance_norm_var_gamma_strides[0]), instance_norm.var_gamma.strides: expected to be compact array\00", align 1
@.str.23 = private constant [208 x i8] c"Assert fail: T.uint64(0) == T.tvm_struct_get(var_gamma, 0, 8, \22uint64\22), Argument instance_norm.var_gamma.byte_offset has an unsatisfied constraint: T.uint64(0) == T.tvm_struct_get(var_gamma, 0, 8, \22uint64\22)\00", align 1
@.str.24 = private constant [188 x i8] c"Assert fail: T.tvm_struct_get(var_gamma, 0, 10, \22int32\22) == 1, Argument instance_norm.var_gamma.device_type has an unsatisfied constraint: 1 == T.tvm_struct_get(var_gamma, 0, 10, \22int32\22)\00", align 1
@.str.25 = private constant [194 x i8] c"Assert fail: dev_id == T.tvm_struct_get(var_gamma, 0, 9, \22int32\22), Argument instance_norm.var_gamma.device_id has an unsatisfied constraint: dev_id == T.tvm_struct_get(var_gamma, 0, 9, \22int32\22)\00", align 1
@.str.26 = private constant [113 x i8] c"Assert fail: C == 0 or not T.isnullptr(gamma), instance_norm.var_gamma is expected to have non-NULL data pointer\00", align 1
@.str.27 = private constant [248 x i8] c"Assert fail: T.tvm_struct_get(var_beta, 0, 5, \22uint8\22) == T.uint8(2) and T.tvm_struct_get(var_beta, 0, 6, \22uint8\22) == T.uint8(32) and T.tvm_struct_get(var_beta, 0, 7, \22uint16\22) == T.uint16(1), instance_norm.var_beta.dtype is expected to be float32\00", align 1
@.str.28 = private constant [194 x i8] c"Assert fail: C == T.Cast(\22int32\22, instance_norm_var_beta_shape[0]), Argument instance_norm.var_beta.shape[0] has an unsatisfied constraint: C == T.Cast(\22int32\22, instance_norm_var_beta_shape[0])\00", align 1
@.str.29 = private constant [141 x i8] c"Assert fail: C == 1 or 1 == T.Cast(\22int32\22, instance_norm_var_beta_strides[0]), instance_norm.var_beta.strides: expected to be compact array\00", align 1
@.str.30 = private constant [205 x i8] c"Assert fail: T.uint64(0) == T.tvm_struct_get(var_beta, 0, 8, \22uint64\22), Argument instance_norm.var_beta.byte_offset has an unsatisfied constraint: T.uint64(0) == T.tvm_struct_get(var_beta, 0, 8, \22uint64\22)\00", align 1
@.str.31 = private constant [185 x i8] c"Assert fail: T.tvm_struct_get(var_beta, 0, 10, \22int32\22) == 1, Argument instance_norm.var_beta.device_type has an unsatisfied constraint: 1 == T.tvm_struct_get(var_beta, 0, 10, \22int32\22)\00", align 1
@.str.32 = private constant [191 x i8] c"Assert fail: dev_id == T.tvm_struct_get(var_beta, 0, 9, \22int32\22), Argument instance_norm.var_beta.device_id has an unsatisfied constraint: dev_id == T.tvm_struct_get(var_beta, 0, 9, \22int32\22)\00", align 1
@.str.33 = private constant [111 x i8] c"Assert fail: C == 0 or not T.isnullptr(beta), instance_norm.var_beta is expected to have non-NULL data pointer\00", align 1
@.str.34 = private constant [292 x i8] c"Assert fail: T.tvm_struct_get(var_T_instance_norm, 0, 5, \22uint8\22) == T.uint8(2) and T.tvm_struct_get(var_T_instance_norm, 0, 6, \22uint8\22) == T.uint8(32) and T.tvm_struct_get(var_T_instance_norm, 0, 7, \22uint16\22) == T.uint16(1), instance_norm.var_T_instance_norm.dtype is expected to be float32\00", align 1
@.str.35 = private constant [227 x i8] c"Assert fail: N == T.Cast(\22int32\22, instance_norm_var_T_instance_norm_shape[0]), Argument instance_norm.var_T_instance_norm.shape[0] has an unsatisfied constraint: N == T.Cast(\22int32\22, instance_norm_var_T_instance_norm_shape[0])\00", align 1
@.str.36 = private constant [227 x i8] c"Assert fail: C == T.Cast(\22int32\22, instance_norm_var_T_instance_norm_shape[1]), Argument instance_norm.var_T_instance_norm.shape[1] has an unsatisfied constraint: C == T.Cast(\22int32\22, instance_norm_var_T_instance_norm_shape[1])\00", align 1
@.str.37 = private constant [227 x i8] c"Assert fail: H == T.Cast(\22int32\22, instance_norm_var_T_instance_norm_shape[2]), Argument instance_norm.var_T_instance_norm.shape[2] has an unsatisfied constraint: H == T.Cast(\22int32\22, instance_norm_var_T_instance_norm_shape[2])\00", align 1
@.str.38 = private constant [227 x i8] c"Assert fail: W == T.Cast(\22int32\22, instance_norm_var_T_instance_norm_shape[3]), Argument instance_norm.var_T_instance_norm.shape[3] has an unsatisfied constraint: W == T.Cast(\22int32\22, instance_norm_var_T_instance_norm_shape[3])\00", align 1
@.str.39 = private constant [426 x i8] c"Assert fail: (W == 1 or 1 == T.Cast(\22int32\22, instance_norm_var_T_instance_norm_strides[3])) and (H == 1 or W == T.Cast(\22int32\22, instance_norm_var_T_instance_norm_strides[2])) and (C == 1 or W * H == T.Cast(\22int32\22, instance_norm_var_T_instance_norm_strides[1])) and (N == 1 or W * H * C == T.Cast(\22int32\22, instance_norm_var_T_instance_norm_strides[0])), instance_norm.var_T_instance_norm.strides: expected to be compact array\00", align 1
@.str.40 = private constant [238 x i8] c"Assert fail: T.uint64(0) == T.tvm_struct_get(var_T_instance_norm, 0, 8, \22uint64\22), Argument instance_norm.var_T_instance_norm.byte_offset has an unsatisfied constraint: T.uint64(0) == T.tvm_struct_get(var_T_instance_norm, 0, 8, \22uint64\22)\00", align 1
@.str.41 = private constant [218 x i8] c"Assert fail: T.tvm_struct_get(var_T_instance_norm, 0, 10, \22int32\22) == 1, Argument instance_norm.var_T_instance_norm.device_type has an unsatisfied constraint: 1 == T.tvm_struct_get(var_T_instance_norm, 0, 10, \22int32\22)\00", align 1
@.str.42 = private constant [224 x i8] c"Assert fail: dev_id == T.tvm_struct_get(var_T_instance_norm, 0, 9, \22int32\22), Argument instance_norm.var_T_instance_norm.device_id has an unsatisfied constraint: dev_id == T.tvm_struct_get(var_T_instance_norm, 0, 9, \22int32\22)\00", align 1
@.str.43 = private constant [145 x i8] c"Assert fail: N * C * H * W == 0 or not T.isnullptr(T_instance_norm), instance_norm.var_T_instance_norm is expected to have non-NULL data pointer\00", align 1
@__TVMBackendAllocWorkspace = linkonce dllexport local_unnamed_addr global ptr null, align 8
@__TVMBackendFreeWorkspace = linkonce dllexport local_unnamed_addr global ptr null, align 8
@__tvm_main__ = weak dllexport local_unnamed_addr constant [14 x i8] c"instance_norm\00", align 1
@llvm.global_ctors = appending global [0 x { i32, ptr, ptr }] zeroinitializer

define dllexport range(i32 -1, 1) i32 @instance_norm(ptr noalias nocapture readnone %self_handle, ptr noalias readonly %args, i32 %num_args, ptr noalias nocapture readnone %result) local_unnamed_addr #0 !dbg !5 {
entry:
    #dbg_value(ptr %self_handle, !11, !DIExpression(), !15)
    #dbg_value(ptr %args, !12, !DIExpression(), !15)
    #dbg_value(i32 %num_args, !13, !DIExpression(), !15)
    #dbg_value(ptr %result, !14, !DIExpression(), !15)
  %0 = icmp eq i32 %num_args, 4, !dbg !15
  br i1 %0, label %assert_end, label %assert_fail, !dbg !15, !prof !16

common.ret:                                       ; preds = %assert_end90, %assert_fail89, %assert_fail87, %assert_fail85, %assert_fail83, %assert_fail81, %assert_fail77, %assert_fail75, %assert_fail73, %assert_fail71, %assert_fail69, %assert_fail67, %assert_fail65, %assert_fail63, %assert_fail61, %assert_fail59, %assert_fail55, %assert_fail53, %assert_fail51, %assert_fail49, %assert_fail47, %assert_fail45, %assert_fail43, %assert_fail39, %assert_fail37, %assert_fail35, %assert_fail33, %assert_fail31, %assert_fail29, %assert_fail27, %assert_fail25, %assert_fail23, %assert_fail21, %assert_fail19, %assert_fail17, %assert_fail15, %assert_fail13, %assert_fail11, %assert_fail9, %assert_fail7, %assert_fail5, %assert_fail3, %assert_fail1, %assert_fail
  %common.ret.op = phi i32 [ -1, %assert_fail ], [ -1, %assert_fail1 ], [ -1, %assert_fail3 ], [ -1, %assert_fail5 ], [ -1, %assert_fail7 ], [ -1, %assert_fail9 ], [ -1, %assert_fail11 ], [ -1, %assert_fail13 ], [ -1, %assert_fail15 ], [ -1, %assert_fail17 ], [ -1, %assert_fail19 ], [ -1, %assert_fail21 ], [ -1, %assert_fail23 ], [ -1, %assert_fail25 ], [ -1, %assert_fail27 ], [ -1, %assert_fail29 ], [ -1, %assert_fail31 ], [ -1, %assert_fail33 ], [ -1, %assert_fail35 ], [ -1, %assert_fail37 ], [ -1, %assert_fail39 ], [ -1, %assert_fail43 ], [ -1, %assert_fail45 ], [ -1, %assert_fail47 ], [ -1, %assert_fail49 ], [ -1, %assert_fail51 ], [ -1, %assert_fail53 ], [ -1, %assert_fail55 ], [ -1, %assert_fail59 ], [ -1, %assert_fail61 ], [ -1, %assert_fail63 ], [ -1, %assert_fail65 ], [ -1, %assert_fail67 ], [ -1, %assert_fail69 ], [ -1, %assert_fail71 ], [ -1, %assert_fail73 ], [ -1, %assert_fail75 ], [ -1, %assert_fail77 ], [ -1, %assert_fail81 ], [ -1, %assert_fail83 ], [ -1, %assert_fail85 ], [ -1, %assert_fail87 ], [ -1, %assert_fail89 ], [ %267, %assert_end90 ]
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
  %var_gamma.type_index = load i32, ptr %5, align 4, !dbg !15
    #dbg_declare(i32 %var_gamma.type_index, !22, !DIExpression(), !15)
    #dbg_declare(i32 %var_gamma.type_index, !22, !DIExpression(), !15)
  %var_gamma.type_index.fr = freeze i32 %var_gamma.type_index, !dbg !15
  %6 = icmp sgt i32 %var_gamma.type_index.fr, 63, !dbg !15
  br i1 %6, label %assert_end6, label %switch.early.test91, !dbg !15

switch.early.test91:                              ; preds = %assert_end4
  switch i32 %var_gamma.type_index.fr, label %assert_fail5 [
    i32 7, label %assert_end6
    i32 4, label %assert_end6
    i32 0, label %assert_end6
  ], !dbg !15

assert_fail5:                                     ; preds = %switch.early.test91
  %7 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %7(ptr nonnull @.str.1, ptr nonnull @.str.4), !dbg !15
  br label %common.ret, !dbg !15

assert_end6:                                      ; preds = %switch.early.test91, %switch.early.test91, %switch.early.test91, %assert_end4
  %8 = getelementptr inbounds nuw i8, ptr %args, i64 32, !dbg !15
  %var_beta.type_index = load i32, ptr %8, align 4, !dbg !15
    #dbg_declare(i32 %var_beta.type_index, !23, !DIExpression(), !15)
    #dbg_declare(i32 %var_beta.type_index, !23, !DIExpression(), !15)
  %var_beta.type_index.fr = freeze i32 %var_beta.type_index, !dbg !15
  %9 = icmp sgt i32 %var_beta.type_index.fr, 63, !dbg !15
  br i1 %9, label %assert_end8, label %switch.early.test92, !dbg !15

switch.early.test92:                              ; preds = %assert_end6
  switch i32 %var_beta.type_index.fr, label %assert_fail7 [
    i32 7, label %assert_end8
    i32 4, label %assert_end8
    i32 0, label %assert_end8
  ], !dbg !15

assert_fail7:                                     ; preds = %switch.early.test92
  %10 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %10(ptr nonnull @.str.1, ptr nonnull @.str.5), !dbg !15
  br label %common.ret, !dbg !15

assert_end8:                                      ; preds = %switch.early.test92, %switch.early.test92, %switch.early.test92, %assert_end6
  %11 = getelementptr inbounds nuw i8, ptr %args, i64 48, !dbg !15
  %var_T_instance_norm.type_index = load i32, ptr %11, align 4, !dbg !15
    #dbg_declare(i32 %var_T_instance_norm.type_index, !24, !DIExpression(), !15)
    #dbg_declare(i32 %var_T_instance_norm.type_index, !24, !DIExpression(), !15)
  %var_T_instance_norm.type_index.fr = freeze i32 %var_T_instance_norm.type_index, !dbg !15
  %12 = icmp sgt i32 %var_T_instance_norm.type_index.fr, 63, !dbg !15
  br i1 %12, label %assert_end10, label %switch.early.test93, !dbg !15

switch.early.test93:                              ; preds = %assert_end8
  switch i32 %var_T_instance_norm.type_index.fr, label %assert_fail9 [
    i32 7, label %assert_end10
    i32 4, label %assert_end10
    i32 0, label %assert_end10
  ], !dbg !15

assert_fail9:                                     ; preds = %switch.early.test93
  %13 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %13(ptr nonnull @.str.1, ptr nonnull @.str.6), !dbg !15
  br label %common.ret, !dbg !15

assert_end10:                                     ; preds = %switch.early.test93, %switch.early.test93, %switch.early.test93, %assert_end8
  %14 = getelementptr inbounds nuw i8, ptr %args, i64 8, !dbg !15
  %15 = load ptr, ptr %14, align 8, !dbg !15
  %16 = icmp eq i32 %var_A.type_index.fr, 72, !dbg !15
  %var_A.idx = select i1 %16, i64 16, i64 0, !dbg !15
  %var_A = getelementptr inbounds nuw i8, ptr %15, i64 %var_A.idx, !dbg !15
    #dbg_declare(ptr %var_A, !25, !DIExpression(), !15)
    #dbg_declare(ptr %var_A, !25, !DIExpression(), !15)
  %17 = getelementptr inbounds nuw i8, ptr %args, i64 24, !dbg !15
  %18 = load ptr, ptr %17, align 8, !dbg !15
  %19 = icmp eq i32 %var_gamma.type_index.fr, 72, !dbg !15
  %var_gamma.idx = select i1 %19, i64 16, i64 0, !dbg !15
  %var_gamma = getelementptr inbounds nuw i8, ptr %18, i64 %var_gamma.idx, !dbg !15
    #dbg_declare(ptr %var_gamma, !26, !DIExpression(), !15)
    #dbg_declare(ptr %var_gamma, !26, !DIExpression(), !15)
  %20 = getelementptr inbounds nuw i8, ptr %args, i64 40, !dbg !15
  %21 = load ptr, ptr %20, align 8, !dbg !15
  %22 = icmp eq i32 %var_beta.type_index.fr, 72, !dbg !15
  %var_beta.idx = select i1 %22, i64 16, i64 0, !dbg !15
  %var_beta = getelementptr inbounds nuw i8, ptr %21, i64 %var_beta.idx, !dbg !15
    #dbg_declare(ptr %var_beta, !27, !DIExpression(), !15)
    #dbg_declare(ptr %var_beta, !27, !DIExpression(), !15)
  %23 = getelementptr inbounds nuw i8, ptr %args, i64 56, !dbg !15
  %24 = load ptr, ptr %23, align 8, !dbg !15
  %25 = icmp eq i32 %var_T_instance_norm.type_index.fr, 72, !dbg !15
  %var_T_instance_norm.idx = select i1 %25, i64 16, i64 0, !dbg !15
  %var_T_instance_norm = getelementptr inbounds nuw i8, ptr %24, i64 %var_T_instance_norm.idx, !dbg !15
    #dbg_declare(ptr %var_T_instance_norm, !28, !DIExpression(), !15)
    #dbg_declare(ptr %var_T_instance_norm, !28, !DIExpression(), !15)
  %.not94 = icmp eq ptr %15, null, !dbg !15
  br i1 %.not94, label %assert_fail11, label %assert_end12, !dbg !15, !prof !20

assert_fail11:                                    ; preds = %assert_end10
  %26 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %26(ptr nonnull @.str.1, ptr nonnull @.str.7), !dbg !15
  br label %common.ret, !dbg !15

assert_end12:                                     ; preds = %assert_end10
  %27 = getelementptr inbounds nuw i8, ptr %var_A, i64 16, !dbg !15
  %28 = load i32, ptr %27, align 4, !dbg !15
  %29 = icmp eq i32 %28, 4, !dbg !15
  br i1 %29, label %assert_end14, label %assert_fail13, !dbg !15, !prof !16

assert_fail13:                                    ; preds = %assert_end12
  %30 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %30(ptr nonnull @.str.1, ptr nonnull @.str.8), !dbg !15
  br label %common.ret, !dbg !15

assert_end14:                                     ; preds = %assert_end12
  %31 = getelementptr inbounds nuw i8, ptr %var_A, i64 24, !dbg !15
  %instance_norm.var_A.shape = load ptr, ptr %31, align 8, !dbg !15
    #dbg_declare(ptr %instance_norm.var_A.shape, !29, !DIExpression(), !15)
    #dbg_declare(ptr %instance_norm.var_A.shape, !29, !DIExpression(), !15)
  %32 = load i64, ptr %instance_norm.var_A.shape, align 8, !dbg !15, !tbaa !32
  %N = trunc i64 %32 to i32, !dbg !15
    #dbg_declare(i32 %N, !42, !DIExpression(), !15)
    #dbg_declare(i32 %N, !42, !DIExpression(), !15)
  %33 = getelementptr inbounds nuw i8, ptr %instance_norm.var_A.shape, i64 8, !dbg !15
  %34 = load i64, ptr %33, align 8, !dbg !15, !tbaa !43
  %C = trunc i64 %34 to i32, !dbg !15
    #dbg_declare(i32 %C, !45, !DIExpression(), !15)
    #dbg_declare(i32 %C, !45, !DIExpression(), !15)
  %35 = getelementptr inbounds nuw i8, ptr %instance_norm.var_A.shape, i64 16, !dbg !15
  %36 = load i64, ptr %35, align 8, !dbg !15, !tbaa !46
  %H = trunc i64 %36 to i32, !dbg !15
    #dbg_declare(i32 %H, !49, !DIExpression(), !15)
    #dbg_declare(i32 %H, !49, !DIExpression(), !15)
  %37 = getelementptr inbounds nuw i8, ptr %instance_norm.var_A.shape, i64 24, !dbg !15
  %38 = load i64, ptr %37, align 8, !dbg !15, !tbaa !50
  %W = trunc i64 %38 to i32, !dbg !15
    #dbg_declare(i32 %W, !52, !DIExpression(), !15)
    #dbg_declare(i32 %W, !52, !DIExpression(), !15)
  %39 = getelementptr inbounds nuw i8, ptr %var_A, i64 32, !dbg !15
  %instance_norm.var_A.strides = load ptr, ptr %39, align 8, !dbg !15
    #dbg_declare(ptr %instance_norm.var_A.strides, !53, !DIExpression(), !15)
    #dbg_declare(ptr %instance_norm.var_A.strides, !53, !DIExpression(), !15)
  %40 = getelementptr inbounds nuw i8, ptr %var_A, i64 12, !dbg !15
  %dev_id = load i32, ptr %40, align 4, !dbg !15
    #dbg_declare(i32 %dev_id, !54, !DIExpression(), !15)
    #dbg_declare(i32 %dev_id, !54, !DIExpression(), !15)
  %A = load ptr, ptr %var_A, align 8, !dbg !15
    #dbg_declare(ptr %A, !55, !DIExpression(), !15)
    #dbg_declare(ptr %A, !55, !DIExpression(), !15)
  call void @llvm.assume(i1 true) [ "align"(ptr %A, i64 64) ], !dbg !15
  %.not95 = icmp eq ptr %18, null, !dbg !15
  br i1 %.not95, label %assert_fail15, label %assert_end16, !dbg !15, !prof !20

assert_fail15:                                    ; preds = %assert_end14
  %41 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %41(ptr nonnull @.str.1, ptr nonnull @.str.9), !dbg !15
  br label %common.ret, !dbg !15

assert_end16:                                     ; preds = %assert_end14
  %42 = getelementptr inbounds nuw i8, ptr %var_gamma, i64 16, !dbg !15
  %43 = load i32, ptr %42, align 4, !dbg !15
  %44 = icmp eq i32 %43, 1, !dbg !15
  br i1 %44, label %assert_end18, label %assert_fail17, !dbg !15, !prof !16

assert_fail17:                                    ; preds = %assert_end16
  %45 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %45(ptr nonnull @.str.1, ptr nonnull @.str.10), !dbg !15
  br label %common.ret, !dbg !15

assert_end18:                                     ; preds = %assert_end16
  %46 = getelementptr inbounds nuw i8, ptr %var_gamma, i64 24, !dbg !15
  %instance_norm.var_gamma.shape = load ptr, ptr %46, align 8, !dbg !15
    #dbg_declare(ptr %instance_norm.var_gamma.shape, !58, !DIExpression(), !15)
    #dbg_declare(ptr %instance_norm.var_gamma.shape, !58, !DIExpression(), !15)
  %47 = getelementptr inbounds nuw i8, ptr %var_gamma, i64 32, !dbg !15
  %instance_norm.var_gamma.strides = load ptr, ptr %47, align 8, !dbg !15
    #dbg_declare(ptr %instance_norm.var_gamma.strides, !59, !DIExpression(), !15)
    #dbg_declare(ptr %instance_norm.var_gamma.strides, !59, !DIExpression(), !15)
  %gamma = load ptr, ptr %var_gamma, align 8, !dbg !15
    #dbg_declare(ptr %gamma, !60, !DIExpression(), !15)
    #dbg_declare(ptr %gamma, !60, !DIExpression(), !15)
  call void @llvm.assume(i1 true) [ "align"(ptr %gamma, i64 64) ], !dbg !15
  %.not96 = icmp eq ptr %21, null, !dbg !15
  br i1 %.not96, label %assert_fail19, label %assert_end20, !dbg !15, !prof !20

assert_fail19:                                    ; preds = %assert_end18
  %48 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %48(ptr nonnull @.str.1, ptr nonnull @.str.11), !dbg !15
  br label %common.ret, !dbg !15

assert_end20:                                     ; preds = %assert_end18
  %49 = getelementptr inbounds nuw i8, ptr %var_beta, i64 16, !dbg !15
  %50 = load i32, ptr %49, align 4, !dbg !15
  %51 = icmp eq i32 %50, 1, !dbg !15
  br i1 %51, label %assert_end22, label %assert_fail21, !dbg !15, !prof !16

assert_fail21:                                    ; preds = %assert_end20
  %52 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %52(ptr nonnull @.str.1, ptr nonnull @.str.12), !dbg !15
  br label %common.ret, !dbg !15

assert_end22:                                     ; preds = %assert_end20
  %53 = getelementptr inbounds nuw i8, ptr %var_beta, i64 24, !dbg !15
  %instance_norm.var_beta.shape = load ptr, ptr %53, align 8, !dbg !15
    #dbg_declare(ptr %instance_norm.var_beta.shape, !61, !DIExpression(), !15)
    #dbg_declare(ptr %instance_norm.var_beta.shape, !61, !DIExpression(), !15)
  %54 = getelementptr inbounds nuw i8, ptr %var_beta, i64 32, !dbg !15
  %instance_norm.var_beta.strides = load ptr, ptr %54, align 8, !dbg !15
    #dbg_declare(ptr %instance_norm.var_beta.strides, !62, !DIExpression(), !15)
    #dbg_declare(ptr %instance_norm.var_beta.strides, !62, !DIExpression(), !15)
  %beta = load ptr, ptr %var_beta, align 8, !dbg !15
    #dbg_declare(ptr %beta, !63, !DIExpression(), !15)
    #dbg_declare(ptr %beta, !63, !DIExpression(), !15)
  call void @llvm.assume(i1 true) [ "align"(ptr %beta, i64 64) ], !dbg !15
  %.not97 = icmp eq ptr %24, null, !dbg !15
  br i1 %.not97, label %assert_fail23, label %assert_end24, !dbg !15, !prof !20

assert_fail23:                                    ; preds = %assert_end22
  %55 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %55(ptr nonnull @.str.1, ptr nonnull @.str.13), !dbg !15
  br label %common.ret, !dbg !15

assert_end24:                                     ; preds = %assert_end22
  %56 = getelementptr inbounds nuw i8, ptr %var_T_instance_norm, i64 16, !dbg !15
  %57 = load i32, ptr %56, align 4, !dbg !15
  %58 = icmp eq i32 %57, 4, !dbg !15
  br i1 %58, label %assert_end26, label %assert_fail25, !dbg !15, !prof !16

assert_fail25:                                    ; preds = %assert_end24
  %59 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %59(ptr nonnull @.str.1, ptr nonnull @.str.14), !dbg !15
  br label %common.ret, !dbg !15

assert_end26:                                     ; preds = %assert_end24
  %60 = getelementptr inbounds nuw i8, ptr %var_T_instance_norm, i64 24, !dbg !15
  %instance_norm.var_T_instance_norm.shape = load ptr, ptr %60, align 8, !dbg !15
    #dbg_declare(ptr %instance_norm.var_T_instance_norm.shape, !64, !DIExpression(), !15)
    #dbg_declare(ptr %instance_norm.var_T_instance_norm.shape, !64, !DIExpression(), !15)
  %61 = getelementptr inbounds nuw i8, ptr %var_T_instance_norm, i64 32, !dbg !15
  %instance_norm.var_T_instance_norm.strides = load ptr, ptr %61, align 8, !dbg !15
    #dbg_declare(ptr %instance_norm.var_T_instance_norm.strides, !65, !DIExpression(), !15)
    #dbg_declare(ptr %instance_norm.var_T_instance_norm.strides, !65, !DIExpression(), !15)
  %T_instance_norm = load ptr, ptr %var_T_instance_norm, align 8, !dbg !15
    #dbg_declare(ptr %T_instance_norm, !66, !DIExpression(), !15)
    #dbg_declare(ptr %T_instance_norm, !66, !DIExpression(), !15)
  call void @llvm.assume(i1 true) [ "align"(ptr %T_instance_norm, i64 64) ], !dbg !15
  %62 = getelementptr inbounds nuw i8, ptr %var_A, i64 22, !dbg !15
  %63 = load i16, ptr %62, align 2, !dbg !15
  %64 = icmp eq i16 %63, 1, !dbg !15
  %65 = getelementptr inbounds nuw i8, ptr %var_A, i64 21, !dbg !15
  %66 = load i8, ptr %65, align 1, !dbg !15
  %67 = icmp eq i8 %66, 32, !dbg !15
  %68 = getelementptr inbounds nuw i8, ptr %var_A, i64 20, !dbg !15
  %69 = load i8, ptr %68, align 1, !dbg !15
  %70 = icmp eq i8 %69, 2, !dbg !15
  %71 = and i1 %67, %70, !dbg !15
  %72 = and i1 %64, %71, !dbg !15
  br i1 %72, label %assert_end28, label %assert_fail27, !dbg !15, !prof !16

assert_fail27:                                    ; preds = %assert_end26
  %73 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %73(ptr nonnull @.str.1, ptr nonnull @.str.15), !dbg !15
  br label %common.ret, !dbg !15

assert_end28:                                     ; preds = %assert_end26
  %.not98 = icmp eq ptr %instance_norm.var_A.strides, null, !dbg !15
  br i1 %.not98, label %if_end, label %if_then, !dbg !15, !prof !20

if_then:                                          ; preds = %assert_end28
  %74 = mul nsw i32 %W, %H, !dbg !15
  %75 = mul nsw i32 %74, %C, !dbg !15
  %76 = load i64, ptr %instance_norm.var_A.strides, align 8, !dbg !15, !tbaa !67
  %77 = trunc i64 %76 to i32, !dbg !15
  %78 = icmp eq i32 %75, %77, !dbg !15
  %79 = icmp eq i32 %N, 1, !dbg !15
  %80 = or i1 %79, %78, !dbg !15
  %81 = getelementptr inbounds nuw i8, ptr %instance_norm.var_A.strides, i64 8, !dbg !15
  %82 = load i64, ptr %81, align 8, !dbg !15, !tbaa !77
  %83 = trunc i64 %82 to i32, !dbg !15
  %84 = icmp eq i32 %74, %83, !dbg !15
  %85 = icmp eq i32 %C, 1, !dbg !15
  %86 = or i1 %85, %84, !dbg !15
  %87 = getelementptr inbounds nuw i8, ptr %instance_norm.var_A.strides, i64 16, !dbg !15
  %88 = load i64, ptr %87, align 8, !dbg !15, !tbaa !79
  %89 = trunc i64 %88 to i32, !dbg !15
  %90 = icmp eq i32 %W, %89, !dbg !15
  %91 = icmp eq i32 %H, 1, !dbg !15
  %92 = or i1 %91, %90, !dbg !15
  %93 = getelementptr inbounds nuw i8, ptr %instance_norm.var_A.strides, i64 24, !dbg !15
  %94 = load i64, ptr %93, align 8, !dbg !15, !tbaa !82
  %95 = and i64 %94, 4294967295, !dbg !15
  %96 = icmp eq i64 %95, 1, !dbg !15
  %97 = icmp eq i32 %W, 1, !dbg !15
  %98 = or i1 %97, %96, !dbg !15
  %99 = and i1 %92, %98, !dbg !15
  %100 = and i1 %86, %99, !dbg !15
  %101 = and i1 %80, %100, !dbg !15
  br i1 %101, label %if_end, label %assert_fail29, !dbg !15, !prof !16

if_end:                                           ; preds = %if_then, %assert_end28
  %102 = getelementptr inbounds nuw i8, ptr %var_A, i64 40, !dbg !15
  %103 = load i64, ptr %102, align 8, !dbg !15
  %104 = icmp eq i64 %103, 0, !dbg !15
  br i1 %104, label %assert_end32, label %assert_fail31, !dbg !15, !prof !16

assert_fail29:                                    ; preds = %if_then
  %105 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %105(ptr nonnull @.str.1, ptr nonnull @.str.16), !dbg !15
  br label %common.ret, !dbg !15

assert_fail31:                                    ; preds = %if_end
  %106 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %106(ptr nonnull @.str.1, ptr nonnull @.str.17), !dbg !15
  br label %common.ret, !dbg !15

assert_end32:                                     ; preds = %if_end
  %107 = getelementptr inbounds nuw i8, ptr %var_A, i64 8, !dbg !15
  %108 = load i32, ptr %107, align 4, !dbg !15
  %109 = icmp eq i32 %108, 1, !dbg !15
  br i1 %109, label %assert_end34, label %assert_fail33, !dbg !15, !prof !16

assert_fail33:                                    ; preds = %assert_end32
  %110 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %110(ptr nonnull @.str.1, ptr nonnull @.str.18), !dbg !15
  br label %common.ret, !dbg !15

assert_end34:                                     ; preds = %assert_end32
  %111 = icmp ne ptr %A, null, !dbg !15
  %112 = mul i32 %W, %H, !dbg !15
  %113 = mul i32 %112, %N, !dbg !15
  %114 = mul i32 %113, %C, !dbg !15
  %115 = icmp eq i32 %114, 0, !dbg !15
  %116 = or i1 %115, %111, !dbg !15
  br i1 %116, label %assert_end36, label %assert_fail35, !dbg !15, !prof !16

assert_fail35:                                    ; preds = %assert_end34
  %117 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %117(ptr nonnull @.str.1, ptr nonnull @.str.19), !dbg !15
  br label %common.ret, !dbg !15

assert_end36:                                     ; preds = %assert_end34
  %118 = getelementptr inbounds nuw i8, ptr %var_gamma, i64 22, !dbg !15
  %119 = load i16, ptr %118, align 2, !dbg !15
  %120 = icmp eq i16 %119, 1, !dbg !15
  %121 = getelementptr inbounds nuw i8, ptr %var_gamma, i64 21, !dbg !15
  %122 = load i8, ptr %121, align 1, !dbg !15
  %123 = icmp eq i8 %122, 32, !dbg !15
  %124 = getelementptr inbounds nuw i8, ptr %var_gamma, i64 20, !dbg !15
  %125 = load i8, ptr %124, align 1, !dbg !15
  %126 = icmp eq i8 %125, 2, !dbg !15
  %127 = and i1 %123, %126, !dbg !15
  %128 = and i1 %120, %127, !dbg !15
  br i1 %128, label %assert_end38, label %assert_fail37, !dbg !15, !prof !16

assert_fail37:                                    ; preds = %assert_end36
  %129 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %129(ptr nonnull @.str.1, ptr nonnull @.str.20), !dbg !15
  br label %common.ret, !dbg !15

assert_end38:                                     ; preds = %assert_end36
  %130 = load i64, ptr %instance_norm.var_gamma.shape, align 8, !dbg !15, !tbaa !84
  %131 = trunc i64 %130 to i32, !dbg !15
  %132 = icmp eq i32 %C, %131, !dbg !15
  br i1 %132, label %assert_end40, label %assert_fail39, !dbg !15, !prof !16

assert_fail39:                                    ; preds = %assert_end38
  %133 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %133(ptr nonnull @.str.1, ptr nonnull @.str.21), !dbg !15
  br label %common.ret, !dbg !15

assert_end40:                                     ; preds = %assert_end38
  %.not99 = icmp eq ptr %instance_norm.var_gamma.strides, null, !dbg !15
  br i1 %.not99, label %if_end42, label %if_then41, !dbg !15, !prof !20

if_then41:                                        ; preds = %assert_end40
  %134 = load i64, ptr %instance_norm.var_gamma.strides, align 8, !dbg !15, !tbaa !94
  %135 = and i64 %134, 4294967295, !dbg !15
  %136 = icmp eq i64 %135, 1, !dbg !15
  %137 = icmp eq i32 %C, 1, !dbg !15
  %138 = or i1 %137, %136, !dbg !15
  br i1 %138, label %if_end42, label %assert_fail43, !dbg !15, !prof !16

if_end42:                                         ; preds = %if_then41, %assert_end40
  %139 = getelementptr inbounds nuw i8, ptr %var_gamma, i64 40, !dbg !15
  %140 = load i64, ptr %139, align 8, !dbg !15
  %141 = icmp eq i64 %140, 0, !dbg !15
  br i1 %141, label %assert_end46, label %assert_fail45, !dbg !15, !prof !16

assert_fail43:                                    ; preds = %if_then41
  %142 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %142(ptr nonnull @.str.1, ptr nonnull @.str.22), !dbg !15
  br label %common.ret, !dbg !15

assert_fail45:                                    ; preds = %if_end42
  %143 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %143(ptr nonnull @.str.1, ptr nonnull @.str.23), !dbg !15
  br label %common.ret, !dbg !15

assert_end46:                                     ; preds = %if_end42
  %144 = getelementptr inbounds nuw i8, ptr %var_gamma, i64 8, !dbg !15
  %145 = load i32, ptr %144, align 4, !dbg !15
  %146 = icmp eq i32 %145, 1, !dbg !15
  br i1 %146, label %assert_end48, label %assert_fail47, !dbg !15, !prof !16

assert_fail47:                                    ; preds = %assert_end46
  %147 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %147(ptr nonnull @.str.1, ptr nonnull @.str.24), !dbg !15
  br label %common.ret, !dbg !15

assert_end48:                                     ; preds = %assert_end46
  %148 = getelementptr inbounds nuw i8, ptr %var_gamma, i64 12, !dbg !15
  %149 = load i32, ptr %148, align 4, !dbg !15
  %150 = icmp eq i32 %dev_id, %149, !dbg !15
  br i1 %150, label %assert_end50, label %assert_fail49, !dbg !15, !prof !16

assert_fail49:                                    ; preds = %assert_end48
  %151 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %151(ptr nonnull @.str.1, ptr nonnull @.str.25), !dbg !15
  br label %common.ret, !dbg !15

assert_end50:                                     ; preds = %assert_end48
  %152 = icmp ne ptr %gamma, null, !dbg !15
  %153 = icmp eq i32 %C, 0, !dbg !15
  %154 = or i1 %153, %152, !dbg !15
  br i1 %154, label %assert_end52, label %assert_fail51, !dbg !15, !prof !16

assert_fail51:                                    ; preds = %assert_end50
  %155 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %155(ptr nonnull @.str.1, ptr nonnull @.str.26), !dbg !15
  br label %common.ret, !dbg !15

assert_end52:                                     ; preds = %assert_end50
  %156 = getelementptr inbounds nuw i8, ptr %var_beta, i64 22, !dbg !15
  %157 = load i16, ptr %156, align 2, !dbg !15
  %158 = icmp eq i16 %157, 1, !dbg !15
  %159 = getelementptr inbounds nuw i8, ptr %var_beta, i64 21, !dbg !15
  %160 = load i8, ptr %159, align 1, !dbg !15
  %161 = icmp eq i8 %160, 32, !dbg !15
  %162 = getelementptr inbounds nuw i8, ptr %var_beta, i64 20, !dbg !15
  %163 = load i8, ptr %162, align 1, !dbg !15
  %164 = icmp eq i8 %163, 2, !dbg !15
  %165 = and i1 %161, %164, !dbg !15
  %166 = and i1 %158, %165, !dbg !15
  br i1 %166, label %assert_end54, label %assert_fail53, !dbg !15, !prof !16

assert_fail53:                                    ; preds = %assert_end52
  %167 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %167(ptr nonnull @.str.1, ptr nonnull @.str.27), !dbg !15
  br label %common.ret, !dbg !15

assert_end54:                                     ; preds = %assert_end52
  %168 = load i64, ptr %instance_norm.var_beta.shape, align 8, !dbg !15, !tbaa !104
  %169 = trunc i64 %168 to i32, !dbg !15
  %170 = icmp eq i32 %C, %169, !dbg !15
  br i1 %170, label %assert_end56, label %assert_fail55, !dbg !15, !prof !16

assert_fail55:                                    ; preds = %assert_end54
  %171 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %171(ptr nonnull @.str.1, ptr nonnull @.str.28), !dbg !15
  br label %common.ret, !dbg !15

assert_end56:                                     ; preds = %assert_end54
  %.not100 = icmp eq ptr %instance_norm.var_beta.strides, null, !dbg !15
  br i1 %.not100, label %if_end58, label %if_then57, !dbg !15, !prof !20

if_then57:                                        ; preds = %assert_end56
  %172 = load i64, ptr %instance_norm.var_beta.strides, align 8, !dbg !15, !tbaa !114
  %173 = and i64 %172, 4294967295, !dbg !15
  %174 = icmp eq i64 %173, 1, !dbg !15
  %175 = icmp eq i32 %C, 1, !dbg !15
  %176 = or i1 %175, %174, !dbg !15
  br i1 %176, label %if_end58, label %assert_fail59, !dbg !15, !prof !16

if_end58:                                         ; preds = %if_then57, %assert_end56
  %177 = getelementptr inbounds nuw i8, ptr %var_beta, i64 40, !dbg !15
  %178 = load i64, ptr %177, align 8, !dbg !15
  %179 = icmp eq i64 %178, 0, !dbg !15
  br i1 %179, label %assert_end62, label %assert_fail61, !dbg !15, !prof !16

assert_fail59:                                    ; preds = %if_then57
  %180 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %180(ptr nonnull @.str.1, ptr nonnull @.str.29), !dbg !15
  br label %common.ret, !dbg !15

assert_fail61:                                    ; preds = %if_end58
  %181 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %181(ptr nonnull @.str.1, ptr nonnull @.str.30), !dbg !15
  br label %common.ret, !dbg !15

assert_end62:                                     ; preds = %if_end58
  %182 = getelementptr inbounds nuw i8, ptr %var_beta, i64 8, !dbg !15
  %183 = load i32, ptr %182, align 4, !dbg !15
  %184 = icmp eq i32 %183, 1, !dbg !15
  br i1 %184, label %assert_end64, label %assert_fail63, !dbg !15, !prof !16

assert_fail63:                                    ; preds = %assert_end62
  %185 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %185(ptr nonnull @.str.1, ptr nonnull @.str.31), !dbg !15
  br label %common.ret, !dbg !15

assert_end64:                                     ; preds = %assert_end62
  %186 = getelementptr inbounds nuw i8, ptr %var_beta, i64 12, !dbg !15
  %187 = load i32, ptr %186, align 4, !dbg !15
  %188 = icmp eq i32 %dev_id, %187, !dbg !15
  br i1 %188, label %assert_end66, label %assert_fail65, !dbg !15, !prof !16

assert_fail65:                                    ; preds = %assert_end64
  %189 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %189(ptr nonnull @.str.1, ptr nonnull @.str.32), !dbg !15
  br label %common.ret, !dbg !15

assert_end66:                                     ; preds = %assert_end64
  %190 = icmp ne ptr %beta, null, !dbg !15
  %191 = or i1 %153, %190, !dbg !15
  br i1 %191, label %assert_end68, label %assert_fail67, !dbg !15, !prof !16

assert_fail67:                                    ; preds = %assert_end66
  %192 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %192(ptr nonnull @.str.1, ptr nonnull @.str.33), !dbg !15
  br label %common.ret, !dbg !15

assert_end68:                                     ; preds = %assert_end66
  %193 = getelementptr inbounds nuw i8, ptr %var_T_instance_norm, i64 22, !dbg !15
  %194 = load i16, ptr %193, align 2, !dbg !15
  %195 = icmp eq i16 %194, 1, !dbg !15
  %196 = getelementptr inbounds nuw i8, ptr %var_T_instance_norm, i64 21, !dbg !15
  %197 = load i8, ptr %196, align 1, !dbg !15
  %198 = icmp eq i8 %197, 32, !dbg !15
  %199 = getelementptr inbounds nuw i8, ptr %var_T_instance_norm, i64 20, !dbg !15
  %200 = load i8, ptr %199, align 1, !dbg !15
  %201 = icmp eq i8 %200, 2, !dbg !15
  %202 = and i1 %198, %201, !dbg !15
  %203 = and i1 %195, %202, !dbg !15
  br i1 %203, label %assert_end70, label %assert_fail69, !dbg !15, !prof !16

assert_fail69:                                    ; preds = %assert_end68
  %204 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %204(ptr nonnull @.str.1, ptr nonnull @.str.34), !dbg !15
  br label %common.ret, !dbg !15

assert_end70:                                     ; preds = %assert_end68
  %205 = load i64, ptr %instance_norm.var_T_instance_norm.shape, align 8, !dbg !15, !tbaa !124
  %206 = trunc i64 %205 to i32, !dbg !15
  %207 = icmp eq i32 %N, %206, !dbg !15
  br i1 %207, label %assert_end72, label %assert_fail71, !dbg !15, !prof !16

assert_fail71:                                    ; preds = %assert_end70
  %208 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %208(ptr nonnull @.str.1, ptr nonnull @.str.35), !dbg !15
  br label %common.ret, !dbg !15

assert_end72:                                     ; preds = %assert_end70
  %209 = getelementptr inbounds nuw i8, ptr %instance_norm.var_T_instance_norm.shape, i64 8, !dbg !15
  %210 = load i64, ptr %209, align 8, !dbg !15, !tbaa !134
  %211 = trunc i64 %210 to i32, !dbg !15
  %212 = icmp eq i32 %C, %211, !dbg !15
  br i1 %212, label %assert_end74, label %assert_fail73, !dbg !15, !prof !16

assert_fail73:                                    ; preds = %assert_end72
  %213 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %213(ptr nonnull @.str.1, ptr nonnull @.str.36), !dbg !15
  br label %common.ret, !dbg !15

assert_end74:                                     ; preds = %assert_end72
  %214 = getelementptr inbounds nuw i8, ptr %instance_norm.var_T_instance_norm.shape, i64 16, !dbg !15
  %215 = load i64, ptr %214, align 8, !dbg !15, !tbaa !136
  %216 = trunc i64 %215 to i32, !dbg !15
  %217 = icmp eq i32 %H, %216, !dbg !15
  br i1 %217, label %assert_end76, label %assert_fail75, !dbg !15, !prof !16

assert_fail75:                                    ; preds = %assert_end74
  %218 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %218(ptr nonnull @.str.1, ptr nonnull @.str.37), !dbg !15
  br label %common.ret, !dbg !15

assert_end76:                                     ; preds = %assert_end74
  %219 = getelementptr inbounds nuw i8, ptr %instance_norm.var_T_instance_norm.shape, i64 24, !dbg !15
  %220 = load i64, ptr %219, align 8, !dbg !15, !tbaa !139
  %221 = trunc i64 %220 to i32, !dbg !15
  %222 = icmp eq i32 %W, %221, !dbg !15
  br i1 %222, label %assert_end78, label %assert_fail77, !dbg !15, !prof !16

assert_fail77:                                    ; preds = %assert_end76
  %223 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %223(ptr nonnull @.str.1, ptr nonnull @.str.38), !dbg !15
  br label %common.ret, !dbg !15

assert_end78:                                     ; preds = %assert_end76
  %.not101 = icmp eq ptr %instance_norm.var_T_instance_norm.strides, null, !dbg !15
  br i1 %.not101, label %if_end80, label %if_then79, !dbg !15, !prof !20

if_then79:                                        ; preds = %assert_end78
  %224 = mul nsw i32 %112, %C, !dbg !15
  %225 = load i64, ptr %instance_norm.var_T_instance_norm.strides, align 8, !dbg !15, !tbaa !141
  %226 = trunc i64 %225 to i32, !dbg !15
  %227 = icmp eq i32 %224, %226, !dbg !15
  %228 = icmp eq i32 %N, 1, !dbg !15
  %229 = or i1 %228, %227, !dbg !15
  %230 = getelementptr inbounds nuw i8, ptr %instance_norm.var_T_instance_norm.strides, i64 8, !dbg !15
  %231 = load i64, ptr %230, align 8, !dbg !15, !tbaa !151
  %232 = trunc i64 %231 to i32, !dbg !15
  %233 = icmp eq i32 %112, %232, !dbg !15
  %234 = icmp eq i32 %C, 1, !dbg !15
  %235 = or i1 %234, %233, !dbg !15
  %236 = getelementptr inbounds nuw i8, ptr %instance_norm.var_T_instance_norm.strides, i64 16, !dbg !15
  %237 = load i64, ptr %236, align 8, !dbg !15, !tbaa !153
  %238 = trunc i64 %237 to i32, !dbg !15
  %239 = icmp eq i32 %W, %238, !dbg !15
  %240 = icmp eq i32 %H, 1, !dbg !15
  %241 = or i1 %240, %239, !dbg !15
  %242 = getelementptr inbounds nuw i8, ptr %instance_norm.var_T_instance_norm.strides, i64 24, !dbg !15
  %243 = load i64, ptr %242, align 8, !dbg !15, !tbaa !156
  %244 = and i64 %243, 4294967295, !dbg !15
  %245 = icmp eq i64 %244, 1, !dbg !15
  %246 = icmp eq i32 %W, 1, !dbg !15
  %247 = or i1 %246, %245, !dbg !15
  %248 = and i1 %241, %247, !dbg !15
  %249 = and i1 %235, %248, !dbg !15
  %250 = and i1 %229, %249, !dbg !15
  br i1 %250, label %if_end80, label %assert_fail81, !dbg !15, !prof !16

if_end80:                                         ; preds = %if_then79, %assert_end78
  %251 = getelementptr inbounds nuw i8, ptr %var_T_instance_norm, i64 40, !dbg !15
  %252 = load i64, ptr %251, align 8, !dbg !15
  %253 = icmp eq i64 %252, 0, !dbg !15
  br i1 %253, label %assert_end84, label %assert_fail83, !dbg !15, !prof !16

assert_fail81:                                    ; preds = %if_then79
  %254 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %254(ptr nonnull @.str.1, ptr nonnull @.str.39), !dbg !15
  br label %common.ret, !dbg !15

assert_fail83:                                    ; preds = %if_end80
  %255 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %255(ptr nonnull @.str.1, ptr nonnull @.str.40), !dbg !15
  br label %common.ret, !dbg !15

assert_end84:                                     ; preds = %if_end80
  %256 = getelementptr inbounds nuw i8, ptr %var_T_instance_norm, i64 8, !dbg !15
  %257 = load i32, ptr %256, align 4, !dbg !15
  %258 = icmp eq i32 %257, 1, !dbg !15
  br i1 %258, label %assert_end86, label %assert_fail85, !dbg !15, !prof !16

assert_fail85:                                    ; preds = %assert_end84
  %259 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %259(ptr nonnull @.str.1, ptr nonnull @.str.41), !dbg !15
  br label %common.ret, !dbg !15

assert_end86:                                     ; preds = %assert_end84
  %260 = getelementptr inbounds nuw i8, ptr %var_T_instance_norm, i64 12, !dbg !15
  %261 = load i32, ptr %260, align 4, !dbg !15
  %262 = icmp eq i32 %dev_id, %261, !dbg !15
  br i1 %262, label %assert_end88, label %assert_fail87, !dbg !15, !prof !16

assert_fail87:                                    ; preds = %assert_end86
  %263 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %263(ptr nonnull @.str.1, ptr nonnull @.str.42), !dbg !15
  br label %common.ret, !dbg !15

assert_end88:                                     ; preds = %assert_end86
  %264 = icmp ne ptr %T_instance_norm, null, !dbg !15
  %265 = or i1 %115, %264, !dbg !15
  br i1 %265, label %assert_end90, label %assert_fail89, !dbg !15, !prof !16

assert_fail89:                                    ; preds = %assert_end88
  %266 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %266(ptr nonnull @.str.1, ptr nonnull @.str.43), !dbg !15
  br label %common.ret, !dbg !15

assert_end90:                                     ; preds = %assert_end88
  %267 = tail call fastcc i32 @instance_norm_compute_(i32 %dev_id, i32 %N, i32 %C, i32 %H, i32 %W, ptr %A, ptr %T_instance_norm, ptr %gamma, ptr %beta), !dbg !15
  br label %common.ret, !dbg !15
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: noinline
define internal fastcc range(i32 -1, 1) i32 @instance_norm_compute_(i32 %dev_id, i32 %N, i32 %C, i32 %H, i32 %W, ptr noalias nocapture readonly align 64 %A, ptr noalias nocapture writeonly align 64 %T_instance_norm, ptr noalias nocapture readonly align 64 %gamma, ptr noalias nocapture readonly align 64 %beta) unnamed_addr #2 !dbg !158 {
entry:
    #dbg_value(i32 %dev_id, !162, !DIExpression(), !171)
    #dbg_value(i32 %N, !163, !DIExpression(), !171)
    #dbg_value(i32 %C, !164, !DIExpression(), !171)
    #dbg_value(i32 %H, !165, !DIExpression(), !171)
    #dbg_value(i32 %W, !166, !DIExpression(), !171)
    #dbg_value(ptr %A, !167, !DIExpression(), !171)
    #dbg_value(ptr %T_instance_norm, !168, !DIExpression(), !171)
    #dbg_value(ptr %gamma, !169, !DIExpression(), !171)
    #dbg_value(ptr %beta, !170, !DIExpression(), !171)
  %0 = mul nsw i32 %C, %N, !dbg !171
  %1 = sext i32 %0 to i64, !dbg !171
  %2 = shl nuw nsw i64 %1, 2, !dbg !171
  %3 = load ptr, ptr @__TVMBackendAllocWorkspace, align 8, !dbg !171, !tbaa !17
  %A_red_temp.v0 = tail call ptr %3(i32 1, i32 %dev_id, i64 %2, i32 2, i32 32), !dbg !171
    #dbg_declare(ptr %A_red_temp.v0, !172, !DIExpression(), !171)
    #dbg_declare(ptr %A_red_temp.v0, !172, !DIExpression(), !171)
  call void @llvm.assume(i1 true) [ "align"(ptr %A_red_temp.v0, i64 64) ], !dbg !171
  %4 = icmp eq ptr %A_red_temp.v0, null, !dbg !171
  br i1 %4, label %common.ret, label %if_end, !dbg !171, !prof !16

common.ret:                                       ; preds = %if_end15, %for_end_ax08, %if_end, %entry
  %common.ret.op = phi i32 [ -1, %entry ], [ -1, %if_end ], [ -1, %for_end_ax08 ], [ %., %if_end15 ]
  ret i32 %common.ret.op, !dbg !171

if_end:                                           ; preds = %entry
  %5 = load ptr, ptr @__TVMBackendAllocWorkspace, align 8, !dbg !171, !tbaa !17
  %A_red_temp.v1 = tail call ptr %5(i32 1, i32 %dev_id, i64 %2, i32 2, i32 32), !dbg !171
    #dbg_declare(ptr %A_red_temp.v1, !173, !DIExpression(), !171)
    #dbg_declare(ptr %A_red_temp.v1, !173, !DIExpression(), !171)
  call void @llvm.assume(i1 true) [ "align"(ptr %A_red_temp.v1, i64 64) ], !dbg !171
  %6 = icmp eq ptr %A_red_temp.v1, null, !dbg !171
  br i1 %6, label %common.ret, label %for_begin_ax0.preheader, !dbg !171, !prof !16

for_begin_ax0.preheader:                          ; preds = %if_end
    #dbg_declare(i32 0, !174, !DIExpression(), !171)
  %7 = icmp sgt i32 %N, 0, !dbg !171
  %8 = icmp sgt i32 %C, 0
  %or.cond = select i1 %7, i1 %8, i1 false, !dbg !171
  br i1 %or.cond, label %for_begin_ax1.preheader.lr.ph.split.us, label %for_end_ax08, !dbg !171, !prof !175

for_begin_ax1.preheader.lr.ph.split.us:           ; preds = %for_begin_ax0.preheader
  %9 = icmp slt i32 %W, 1
  %10 = icmp slt i32 %H, 1
  %brmerge = select i1 %10, i1 true, i1 %9
  br i1 %brmerge, label %for_begin_ax110.preheader.lr.ph.split.us, label %for_begin_ax1.preheader.us.us.us.preheader, !prof !176

for_begin_ax1.preheader.us.us.us.preheader:       ; preds = %for_begin_ax1.preheader.lr.ph.split.us
  %11 = zext nneg i32 %W to i64, !dbg !171
  %12 = zext nneg i32 %H to i64, !dbg !171
  %13 = zext nneg i32 %C to i64, !dbg !171
  %wide.trip.count73 = zext nneg i32 %N to i64, !dbg !171
  %wide.trip.count68 = zext nneg i32 %C to i64
  %wide.trip.count63 = zext nneg i32 %H to i64
  %wide.trip.count = zext nneg i32 %W to i64
  br label %for_begin_ax1.preheader.us.us.us, !dbg !171

for_begin_ax1.preheader.us.us.us:                 ; preds = %for_begin_ax1.preheader.us.us.us.preheader, %for_begin_ax1.for_end_ax1_crit_edge.split.us.split.us.us.us.us
  %indvars.iv70 = phi i64 [ 0, %for_begin_ax1.preheader.us.us.us.preheader ], [ %indvars.iv.next71, %for_begin_ax1.for_end_ax1_crit_edge.split.us.split.us.us.us.us ]
    #dbg_declare(i64 %indvars.iv70, !174, !DIExpression(), !171)
    #dbg_declare(i32 0, !177, !DIExpression(), !171)
  %14 = mul nuw nsw i64 %indvars.iv70, %13
  br label %for_begin_k2.preheader.us.us.us.us.us, !dbg !171

for_begin_k2.preheader.us.us.us.us.us:            ; preds = %for_begin_k2.for_end_k2_crit_edge.split.us.us.us.us.us.us, %for_begin_ax1.preheader.us.us.us
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %for_begin_k2.for_end_k2_crit_edge.split.us.us.us.us.us.us ], [ 0, %for_begin_ax1.preheader.us.us.us ]
    #dbg_declare(i64 %indvars.iv65, !177, !DIExpression(), !171)
    #dbg_declare(i32 0, !178, !DIExpression(), !171)
  %15 = add nuw nsw i64 %indvars.iv65, %14
  %16 = getelementptr inbounds nuw float, ptr %A_red_temp.v0, i64 %15
  %17 = getelementptr inbounds nuw float, ptr %A_red_temp.v1, i64 %15
  %18 = mul nuw nsw i64 %15, %12
  br label %for_begin_k3.preheader.us.us.us.us.us.us, !dbg !171

for_begin_k3.preheader.us.us.us.us.us.us:         ; preds = %for_begin_k3.for_end_k3_crit_edge.us.us.us.us.us.us, %for_begin_k2.preheader.us.us.us.us.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %for_begin_k3.for_end_k3_crit_edge.us.us.us.us.us.us ], [ 0, %for_begin_k2.preheader.us.us.us.us.us ]
    #dbg_declare(i64 %indvars.iv60, !178, !DIExpression(), !171)
    #dbg_declare(i32 0, !179, !DIExpression(), !171)
  %19 = add nuw nsw i64 %indvars.iv60, %18
  %20 = mul nuw nsw i64 %19, %11
  %invariant.gep = getelementptr inbounds nuw float, ptr %A, i64 %20, !dbg !171
  %.promoted = load float, ptr %16, align 4
  %.promoted99 = load float, ptr %17, align 4
  br label %for_body_k3.us.us.us.us.us.us, !dbg !171

for_body_k3.us.us.us.us.us.us:                    ; preds = %for_body_k3.us.us.us.us.us.us, %for_begin_k3.preheader.us.us.us.us.us.us
  %.pre95100 = phi float [ %v_A_red_temp.v1.us.us.us.us.us.us, %for_body_k3.us.us.us.us.us.us ], [ %.promoted99, %for_begin_k3.preheader.us.us.us.us.us.us ]
  %.pre98 = phi float [ %v_A_red_temp.v0.us.us.us.us.us.us, %for_body_k3.us.us.us.us.us.us ], [ %.promoted, %for_begin_k3.preheader.us.us.us.us.us.us ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %for_body_k3.us.us.us.us.us.us ], [ 0, %for_begin_k3.preheader.us.us.us.us.us.us ]
    #dbg_declare(i64 %indvars.iv, !179, !DIExpression(), !171)
  %21 = or i64 %indvars.iv, %indvars.iv60, !dbg !171
  %22 = and i64 %21, 4294967295, !dbg !171
  %23 = icmp eq i64 %22, 0, !dbg !171
  %..pre95100 = select i1 %23, float 0.000000e+00, float %.pre95100, !dbg !171, !prof !16
  %..pre98 = select i1 %23, float 0.000000e+00, float %.pre98, !dbg !171, !prof !16
  %gep = getelementptr inbounds nuw float, ptr %invariant.gep, i64 %indvars.iv, !dbg !171
  %24 = load float, ptr %gep, align 4, !dbg !171, !tbaa !180
  %v_A_red_temp.v0.us.us.us.us.us.us = fadd float %24, %..pre98, !dbg !171
    #dbg_declare(float %v_A_red_temp.v0.us.us.us.us.us.us, !182, !DIExpression(), !171)
    #dbg_declare(float %v_A_red_temp.v0.us.us.us.us.us.us, !182, !DIExpression(), !171)
  %v_A_red_temp.v1.us.us.us.us.us.us = tail call float @llvm.fmuladd.f32(float %24, float %24, float %..pre95100), !dbg !171
    #dbg_declare(float %v_A_red_temp.v1.us.us.us.us.us.us, !183, !DIExpression(), !171)
    #dbg_declare(float %v_A_red_temp.v1.us.us.us.us.us.us, !183, !DIExpression(), !171)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !171
    #dbg_declare(i64 %indvars.iv.next, !179, !DIExpression(), !171)
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count, !dbg !171
  br i1 %exitcond.not, label %for_begin_k3.for_end_k3_crit_edge.us.us.us.us.us.us, label %for_body_k3.us.us.us.us.us.us, !dbg !171, !prof !184

for_begin_k3.for_end_k3_crit_edge.us.us.us.us.us.us: ; preds = %for_body_k3.us.us.us.us.us.us
  store float %v_A_red_temp.v0.us.us.us.us.us.us, ptr %16, align 4, !dbg !171, !tbaa !185
  store float %v_A_red_temp.v1.us.us.us.us.us.us, ptr %17, align 4, !dbg !171, !tbaa !187
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1, !dbg !171
    #dbg_declare(i64 %indvars.iv.next61, !178, !DIExpression(), !171)
  %exitcond64.not = icmp eq i64 %indvars.iv.next61, %wide.trip.count63, !dbg !171
  br i1 %exitcond64.not, label %for_begin_k2.for_end_k2_crit_edge.split.us.us.us.us.us.us, label %for_begin_k3.preheader.us.us.us.us.us.us, !dbg !171, !prof !184

for_begin_k2.for_end_k2_crit_edge.split.us.us.us.us.us.us: ; preds = %for_begin_k3.for_end_k3_crit_edge.us.us.us.us.us.us
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1, !dbg !171
    #dbg_declare(i64 %indvars.iv.next66, !177, !DIExpression(), !171)
  %exitcond69.not = icmp eq i64 %indvars.iv.next66, %wide.trip.count68, !dbg !171
  br i1 %exitcond69.not, label %for_begin_ax1.for_end_ax1_crit_edge.split.us.split.us.us.us.us, label %for_begin_k2.preheader.us.us.us.us.us, !dbg !171, !prof !184

for_begin_ax1.for_end_ax1_crit_edge.split.us.split.us.us.us.us: ; preds = %for_begin_k2.for_end_k2_crit_edge.split.us.us.us.us.us.us
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1, !dbg !171
    #dbg_declare(i64 %indvars.iv.next71, !174, !DIExpression(), !171)
  %exitcond74.not = icmp eq i64 %indvars.iv.next71, %wide.trip.count73, !dbg !171
  br i1 %exitcond74.not, label %for_begin_ax110.preheader.lr.ph.split.us, label %for_begin_ax1.preheader.us.us.us, !dbg !171, !prof !184

for_begin_ax110.preheader.lr.ph.split.us:         ; preds = %for_begin_ax1.for_end_ax1_crit_edge.split.us.split.us.us.us.us, %for_begin_ax1.preheader.lr.ph.split.us
  %25 = sitofp i32 %W to float
  %26 = sitofp i32 %H to float
  %27 = fmul float %26, %25
  %28 = icmp slt i32 %W, 1
  %29 = icmp slt i32 %H, 1
  %brmerge105 = select i1 %29, i1 true, i1 %28
  br i1 %brmerge105, label %for_end_ax08, label %for_begin_ax110.preheader.us.us.us.preheader, !prof !176

for_begin_ax110.preheader.us.us.us.preheader:     ; preds = %for_begin_ax110.preheader.lr.ph.split.us
  %30 = zext nneg i32 %W to i64, !dbg !171
  %31 = zext nneg i32 %H to i64, !dbg !171
  %32 = zext nneg i32 %C to i64, !dbg !171
  %wide.trip.count93 = zext nneg i32 %N to i64, !dbg !171
  %wide.trip.count88 = zext nneg i32 %C to i64
  %wide.trip.count83 = zext nneg i32 %H to i64
  %wide.trip.count78 = zext nneg i32 %W to i64
  %min.iters.check = icmp ult i32 %W, 8
  %n.vec = and i64 %wide.trip.count78, 2147483640
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count78
  br label %for_begin_ax110.preheader.us.us.us, !dbg !171

for_begin_ax110.preheader.us.us.us:               ; preds = %for_begin_ax110.preheader.us.us.us.preheader, %for_begin_ax110.for_end_ax112_crit_edge.split.us.split.us.us.us.us
  %indvars.iv90 = phi i64 [ 0, %for_begin_ax110.preheader.us.us.us.preheader ], [ %indvars.iv.next91, %for_begin_ax110.for_end_ax112_crit_edge.split.us.split.us.us.us.us ]
    #dbg_declare(i64 %indvars.iv90, !174, !DIExpression(), !171)
    #dbg_declare(i32 0, !177, !DIExpression(), !171)
  %33 = mul nuw nsw i64 %indvars.iv90, %32
  br label %for_begin_ax2.preheader.us.us.us.us.us, !dbg !171

for_begin_ax2.preheader.us.us.us.us.us:           ; preds = %for_begin_ax2.for_end_ax2_crit_edge.split.us.us.us.us.us.us, %for_begin_ax110.preheader.us.us.us
  %indvars.iv85 = phi i64 [ %indvars.iv.next86, %for_begin_ax2.for_end_ax2_crit_edge.split.us.us.us.us.us.us ], [ 0, %for_begin_ax110.preheader.us.us.us ]
    #dbg_declare(i64 %indvars.iv85, !177, !DIExpression(), !171)
    #dbg_declare(i32 0, !189, !DIExpression(), !171)
  %34 = add nuw nsw i64 %indvars.iv85, %33
  %35 = getelementptr inbounds nuw float, ptr %A_red_temp.v0, i64 %34
  %36 = getelementptr inbounds nuw float, ptr %A_red_temp.v1, i64 %34
  %37 = mul nuw nsw i64 %34, %31
  %38 = getelementptr inbounds nuw float, ptr %gamma, i64 %indvars.iv85
  %39 = getelementptr inbounds nuw float, ptr %beta, i64 %indvars.iv85
  %40 = load float, ptr %35, align 4, !tbaa !185
  %41 = fdiv float %40, %27
  %42 = fmul float %41, %41
  %43 = load float, ptr %36, align 4, !tbaa !187
  %44 = fdiv float %43, %27
  %45 = fsub float %44, %42
  %46 = fadd float %45, 0x3EE4F8B580000000
  %47 = tail call float @llvm.sqrt.f32(float %46)
  %48 = fdiv float 1.000000e+00, %47
  %49 = load float, ptr %38, align 4, !tbaa !190
  %50 = load float, ptr %39, align 4, !tbaa !192
  %broadcast.splatinsert = insertelement <4 x float> poison, float %41, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert107 = insertelement <4 x float> poison, float %48, i64 0
  %broadcast.splat108 = shufflevector <4 x float> %broadcast.splatinsert107, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert109 = insertelement <4 x float> poison, float %49, i64 0
  %broadcast.splat110 = shufflevector <4 x float> %broadcast.splatinsert109, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert111 = insertelement <4 x float> poison, float %50, i64 0
  %broadcast.splat112 = shufflevector <4 x float> %broadcast.splatinsert111, <4 x float> poison, <4 x i32> zeroinitializer
  br label %for_begin_ax3.preheader.us.us.us.us.us.us, !dbg !171

for_begin_ax3.preheader.us.us.us.us.us.us:        ; preds = %for_begin_ax3.for_end_ax3_crit_edge.us.us.us.us.us.us, %for_begin_ax2.preheader.us.us.us.us.us
  %indvars.iv80 = phi i64 [ %indvars.iv.next81, %for_begin_ax3.for_end_ax3_crit_edge.us.us.us.us.us.us ], [ 0, %for_begin_ax2.preheader.us.us.us.us.us ]
    #dbg_declare(i64 %indvars.iv80, !189, !DIExpression(), !171)
    #dbg_declare(i32 0, !194, !DIExpression(), !171)
  %51 = add nuw nsw i64 %indvars.iv80, %37
  %52 = mul nuw nsw i64 %51, %30
  br i1 %min.iters.check, label %for_body_ax3.us.us.us.us.us.us.preheader, label %vector.body, !dbg !171, !prof !195

vector.body:                                      ; preds = %for_begin_ax3.preheader.us.us.us.us.us.us, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %for_begin_ax3.preheader.us.us.us.us.us.us ], !dbg !171
  %53 = add nuw nsw i64 %index, %52, !dbg !171
  %54 = getelementptr inbounds float, ptr %A, i64 %53, !dbg !171
  %55 = getelementptr inbounds nuw i8, ptr %54, i64 16, !dbg !171
  %wide.load = load <4 x float>, ptr %54, align 4, !dbg !171, !tbaa !180
  %wide.load106 = load <4 x float>, ptr %55, align 4, !dbg !171, !tbaa !180
  %56 = fsub <4 x float> %wide.load, %broadcast.splat, !dbg !171
  %57 = fsub <4 x float> %wide.load106, %broadcast.splat, !dbg !171
  %58 = fmul <4 x float> %56, %broadcast.splat108, !dbg !171
  %59 = fmul <4 x float> %57, %broadcast.splat108, !dbg !171
  %60 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %58, <4 x float> %broadcast.splat110, <4 x float> %broadcast.splat112), !dbg !171
  %61 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %59, <4 x float> %broadcast.splat110, <4 x float> %broadcast.splat112), !dbg !171
  %62 = getelementptr inbounds float, ptr %T_instance_norm, i64 %53, !dbg !171
  %63 = getelementptr inbounds nuw i8, ptr %62, i64 16, !dbg !171
  store <4 x float> %60, ptr %62, align 4, !dbg !171, !tbaa !196
  store <4 x float> %61, ptr %63, align 4, !dbg !171, !tbaa !196
  %index.next = add nuw i64 %index, 8, !dbg !171
  %64 = icmp eq i64 %index.next, %n.vec, !dbg !171
  br i1 %64, label %middle.block, label %vector.body, !dbg !171, !prof !198, !llvm.loop !199

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for_begin_ax3.for_end_ax3_crit_edge.us.us.us.us.us.us, label %for_body_ax3.us.us.us.us.us.us.preheader, !dbg !171, !prof !202

for_body_ax3.us.us.us.us.us.us.preheader:         ; preds = %for_begin_ax3.preheader.us.us.us.us.us.us, %middle.block
  %indvars.iv75.ph = phi i64 [ 0, %for_begin_ax3.preheader.us.us.us.us.us.us ], [ %n.vec, %middle.block ]
  br label %for_body_ax3.us.us.us.us.us.us, !dbg !171

for_body_ax3.us.us.us.us.us.us:                   ; preds = %for_body_ax3.us.us.us.us.us.us.preheader, %for_body_ax3.us.us.us.us.us.us
  %indvars.iv75 = phi i64 [ %indvars.iv.next76, %for_body_ax3.us.us.us.us.us.us ], [ %indvars.iv75.ph, %for_body_ax3.us.us.us.us.us.us.preheader ]
    #dbg_declare(i64 %indvars.iv75, !194, !DIExpression(), !171)
  %65 = add nuw nsw i64 %indvars.iv75, %52, !dbg !171
  %66 = getelementptr inbounds float, ptr %A, i64 %65, !dbg !171
  %67 = load float, ptr %66, align 4, !dbg !171, !tbaa !180
  %68 = fsub float %67, %41, !dbg !171
  %69 = fmul float %68, %48, !dbg !171
  %70 = tail call float @llvm.fmuladd.f32(float %69, float %49, float %50), !dbg !171
  %71 = getelementptr inbounds float, ptr %T_instance_norm, i64 %65, !dbg !171
  store float %70, ptr %71, align 4, !dbg !171, !tbaa !196
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1, !dbg !171
    #dbg_declare(i64 %indvars.iv.next76, !194, !DIExpression(), !171)
  %exitcond79.not = icmp eq i64 %indvars.iv.next76, %wide.trip.count78, !dbg !171
  br i1 %exitcond79.not, label %for_begin_ax3.for_end_ax3_crit_edge.us.us.us.us.us.us, label %for_body_ax3.us.us.us.us.us.us, !dbg !171, !prof !203, !llvm.loop !204

for_begin_ax3.for_end_ax3_crit_edge.us.us.us.us.us.us: ; preds = %for_body_ax3.us.us.us.us.us.us, %middle.block
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1, !dbg !171
    #dbg_declare(i64 %indvars.iv.next81, !189, !DIExpression(), !171)
  %exitcond84.not = icmp eq i64 %indvars.iv.next81, %wide.trip.count83, !dbg !171
  br i1 %exitcond84.not, label %for_begin_ax2.for_end_ax2_crit_edge.split.us.us.us.us.us.us, label %for_begin_ax3.preheader.us.us.us.us.us.us, !dbg !171, !prof !184

for_begin_ax2.for_end_ax2_crit_edge.split.us.us.us.us.us.us: ; preds = %for_begin_ax3.for_end_ax3_crit_edge.us.us.us.us.us.us
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1, !dbg !171
    #dbg_declare(i64 %indvars.iv.next86, !177, !DIExpression(), !171)
  %exitcond89.not = icmp eq i64 %indvars.iv.next86, %wide.trip.count88, !dbg !171
  br i1 %exitcond89.not, label %for_begin_ax110.for_end_ax112_crit_edge.split.us.split.us.us.us.us, label %for_begin_ax2.preheader.us.us.us.us.us, !dbg !171, !prof !184

for_begin_ax110.for_end_ax112_crit_edge.split.us.split.us.us.us.us: ; preds = %for_begin_ax2.for_end_ax2_crit_edge.split.us.us.us.us.us.us
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1, !dbg !171
    #dbg_declare(i64 %indvars.iv.next91, !174, !DIExpression(), !171)
  %exitcond94.not = icmp eq i64 %indvars.iv.next91, %wide.trip.count93, !dbg !171
  br i1 %exitcond94.not, label %for_end_ax08, label %for_begin_ax110.preheader.us.us.us, !dbg !171, !prof !184

for_end_ax08:                                     ; preds = %for_begin_ax110.for_end_ax112_crit_edge.split.us.split.us.us.us.us, %for_begin_ax110.preheader.lr.ph.split.us, %for_begin_ax0.preheader
  %72 = load ptr, ptr @__TVMBackendFreeWorkspace, align 8, !dbg !171, !tbaa !17
  %73 = tail call i32 %72(i32 1, i32 %dev_id, ptr nonnull %A_red_temp.v1), !dbg !171
  %.not = icmp eq i32 %73, 0, !dbg !171
  br i1 %.not, label %if_end15, label %common.ret, !dbg !171, !prof !20

if_end15:                                         ; preds = %for_end_ax08
  %74 = load ptr, ptr @__TVMBackendFreeWorkspace, align 8, !dbg !171, !tbaa !17
  %75 = tail call i32 %74(i32 1, i32 %dev_id, ptr nonnull %A_red_temp.v0), !dbg !171
  %.not20 = icmp ne i32 %75, 0, !dbg !171
  %. = sext i1 %.not20 to i32, !dbg !171
  br label %common.ret, !dbg !171
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.sqrt.f32(float) #3

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

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x float> @llvm.fmuladd.v4f32(<4 x float>, <4 x float>, <4 x float>) #5

attributes #0 = { "target-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #2 = { noinline "target-cpu"="generic" }
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
!5 = distinct !DISubprogram(name: "instance_norm", scope: !1, file: !1, type: !6, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !10)
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
!22 = !DILocalVariable(name: "var_gamma.type_index", scope: !5, file: !1, type: !8)
!23 = !DILocalVariable(name: "var_beta.type_index", scope: !5, file: !1, type: !8)
!24 = !DILocalVariable(name: "var_T_instance_norm.type_index", scope: !5, file: !1, type: !8)
!25 = !DILocalVariable(name: "var_A", scope: !5, file: !1, type: !9)
!26 = !DILocalVariable(name: "var_gamma", scope: !5, file: !1, type: !9)
!27 = !DILocalVariable(name: "var_beta", scope: !5, file: !1, type: !9)
!28 = !DILocalVariable(name: "var_T_instance_norm", scope: !5, file: !1, type: !9)
!29 = !DILocalVariable(name: "instance_norm.var_A.shape", scope: !5, file: !1, type: !30)
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31)
!31 = !DIBasicType(name: "int64", size: 64, encoding: DW_ATE_signed)
!32 = !{!33, !33, i64 0}
!33 = !{!"0x6079bb074e10.w8.b0", !34, i64 0}
!34 = !{!"0x6079bb074e10.w16.b0", !35, i64 0}
!35 = !{!"0x6079bb074e10.w32.b0", !36, i64 0}
!36 = !{!"0x6079bb074e10.w64.b0", !37, i64 0}
!37 = !{!"0x6079bb074e10.w128.b0", !38, i64 0}
!38 = !{!"0x6079bb074e10.w256.b0", !39, i64 0}
!39 = !{!"0x6079bb074e10.w512.b0", !40, i64 0}
!40 = !{!"0x6079bb074e10.w1024.b0", !41, i64 0}
!41 = !{!"0x6079bb074e10", !19, i64 0}
!42 = !DILocalVariable(name: "N", scope: !5, file: !1, type: !8)
!43 = !{!44, !44, i64 0}
!44 = !{!"0x6079bb074e10.w8.b8", !34, i64 0}
!45 = !DILocalVariable(name: "C", scope: !5, file: !1, type: !8)
!46 = !{!47, !47, i64 0}
!47 = !{!"0x6079bb074e10.w8.b16", !48, i64 0}
!48 = !{!"0x6079bb074e10.w16.b16", !35, i64 0}
!49 = !DILocalVariable(name: "H", scope: !5, file: !1, type: !8)
!50 = !{!51, !51, i64 0}
!51 = !{!"0x6079bb074e10.w8.b24", !48, i64 0}
!52 = !DILocalVariable(name: "W", scope: !5, file: !1, type: !8)
!53 = !DILocalVariable(name: "instance_norm.var_A.strides", scope: !5, file: !1, type: !30)
!54 = !DILocalVariable(name: "dev_id", scope: !5, file: !1, type: !8)
!55 = !DILocalVariable(name: "A", scope: !5, file: !1, type: !56)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57)
!57 = !DIBasicType(name: "float32", size: 32, encoding: DW_ATE_float)
!58 = !DILocalVariable(name: "instance_norm.var_gamma.shape", scope: !5, file: !1, type: !30)
!59 = !DILocalVariable(name: "instance_norm.var_gamma.strides", scope: !5, file: !1, type: !30)
!60 = !DILocalVariable(name: "gamma", scope: !5, file: !1, type: !56)
!61 = !DILocalVariable(name: "instance_norm.var_beta.shape", scope: !5, file: !1, type: !30)
!62 = !DILocalVariable(name: "instance_norm.var_beta.strides", scope: !5, file: !1, type: !30)
!63 = !DILocalVariable(name: "beta", scope: !5, file: !1, type: !56)
!64 = !DILocalVariable(name: "instance_norm.var_T_instance_norm.shape", scope: !5, file: !1, type: !30)
!65 = !DILocalVariable(name: "instance_norm.var_T_instance_norm.strides", scope: !5, file: !1, type: !30)
!66 = !DILocalVariable(name: "T_instance_norm", scope: !5, file: !1, type: !56)
!67 = !{!68, !68, i64 0}
!68 = !{!"0x6079bb1ae190.w8.b0", !69, i64 0}
!69 = !{!"0x6079bb1ae190.w16.b0", !70, i64 0}
!70 = !{!"0x6079bb1ae190.w32.b0", !71, i64 0}
!71 = !{!"0x6079bb1ae190.w64.b0", !72, i64 0}
!72 = !{!"0x6079bb1ae190.w128.b0", !73, i64 0}
!73 = !{!"0x6079bb1ae190.w256.b0", !74, i64 0}
!74 = !{!"0x6079bb1ae190.w512.b0", !75, i64 0}
!75 = !{!"0x6079bb1ae190.w1024.b0", !76, i64 0}
!76 = !{!"0x6079bb1ae190", !19, i64 0}
!77 = !{!78, !78, i64 0}
!78 = !{!"0x6079bb1ae190.w8.b8", !69, i64 0}
!79 = !{!80, !80, i64 0}
!80 = !{!"0x6079bb1ae190.w8.b16", !81, i64 0}
!81 = !{!"0x6079bb1ae190.w16.b16", !70, i64 0}
!82 = !{!83, !83, i64 0}
!83 = !{!"0x6079bb1ae190.w8.b24", !81, i64 0}
!84 = !{!85, !85, i64 0}
!85 = !{!"0x6079bb1ab950.w8.b0", !86, i64 0}
!86 = !{!"0x6079bb1ab950.w16.b0", !87, i64 0}
!87 = !{!"0x6079bb1ab950.w32.b0", !88, i64 0}
!88 = !{!"0x6079bb1ab950.w64.b0", !89, i64 0}
!89 = !{!"0x6079bb1ab950.w128.b0", !90, i64 0}
!90 = !{!"0x6079bb1ab950.w256.b0", !91, i64 0}
!91 = !{!"0x6079bb1ab950.w512.b0", !92, i64 0}
!92 = !{!"0x6079bb1ab950.w1024.b0", !93, i64 0}
!93 = !{!"0x6079bb1ab950", !19, i64 0}
!94 = !{!95, !95, i64 0}
!95 = !{!"0x6079bb1abae0.w8.b0", !96, i64 0}
!96 = !{!"0x6079bb1abae0.w16.b0", !97, i64 0}
!97 = !{!"0x6079bb1abae0.w32.b0", !98, i64 0}
!98 = !{!"0x6079bb1abae0.w64.b0", !99, i64 0}
!99 = !{!"0x6079bb1abae0.w128.b0", !100, i64 0}
!100 = !{!"0x6079bb1abae0.w256.b0", !101, i64 0}
!101 = !{!"0x6079bb1abae0.w512.b0", !102, i64 0}
!102 = !{!"0x6079bb1abae0.w1024.b0", !103, i64 0}
!103 = !{!"0x6079bb1abae0", !19, i64 0}
!104 = !{!105, !105, i64 0}
!105 = !{!"0x6079bb270a80.w8.b0", !106, i64 0}
!106 = !{!"0x6079bb270a80.w16.b0", !107, i64 0}
!107 = !{!"0x6079bb270a80.w32.b0", !108, i64 0}
!108 = !{!"0x6079bb270a80.w64.b0", !109, i64 0}
!109 = !{!"0x6079bb270a80.w128.b0", !110, i64 0}
!110 = !{!"0x6079bb270a80.w256.b0", !111, i64 0}
!111 = !{!"0x6079bb270a80.w512.b0", !112, i64 0}
!112 = !{!"0x6079bb270a80.w1024.b0", !113, i64 0}
!113 = !{!"0x6079bb270a80", !19, i64 0}
!114 = !{!115, !115, i64 0}
!115 = !{!"0x6079bb1a6950.w8.b0", !116, i64 0}
!116 = !{!"0x6079bb1a6950.w16.b0", !117, i64 0}
!117 = !{!"0x6079bb1a6950.w32.b0", !118, i64 0}
!118 = !{!"0x6079bb1a6950.w64.b0", !119, i64 0}
!119 = !{!"0x6079bb1a6950.w128.b0", !120, i64 0}
!120 = !{!"0x6079bb1a6950.w256.b0", !121, i64 0}
!121 = !{!"0x6079bb1a6950.w512.b0", !122, i64 0}
!122 = !{!"0x6079bb1a6950.w1024.b0", !123, i64 0}
!123 = !{!"0x6079bb1a6950", !19, i64 0}
!124 = !{!125, !125, i64 0}
!125 = !{!"0x6079bb1aeb60.w8.b0", !126, i64 0}
!126 = !{!"0x6079bb1aeb60.w16.b0", !127, i64 0}
!127 = !{!"0x6079bb1aeb60.w32.b0", !128, i64 0}
!128 = !{!"0x6079bb1aeb60.w64.b0", !129, i64 0}
!129 = !{!"0x6079bb1aeb60.w128.b0", !130, i64 0}
!130 = !{!"0x6079bb1aeb60.w256.b0", !131, i64 0}
!131 = !{!"0x6079bb1aeb60.w512.b0", !132, i64 0}
!132 = !{!"0x6079bb1aeb60.w1024.b0", !133, i64 0}
!133 = !{!"0x6079bb1aeb60", !19, i64 0}
!134 = !{!135, !135, i64 0}
!135 = !{!"0x6079bb1aeb60.w8.b8", !126, i64 0}
!136 = !{!137, !137, i64 0}
!137 = !{!"0x6079bb1aeb60.w8.b16", !138, i64 0}
!138 = !{!"0x6079bb1aeb60.w16.b16", !127, i64 0}
!139 = !{!140, !140, i64 0}
!140 = !{!"0x6079bb1aeb60.w8.b24", !138, i64 0}
!141 = !{!142, !142, i64 0}
!142 = !{!"0x6079bb06bb10.w8.b0", !143, i64 0}
!143 = !{!"0x6079bb06bb10.w16.b0", !144, i64 0}
!144 = !{!"0x6079bb06bb10.w32.b0", !145, i64 0}
!145 = !{!"0x6079bb06bb10.w64.b0", !146, i64 0}
!146 = !{!"0x6079bb06bb10.w128.b0", !147, i64 0}
!147 = !{!"0x6079bb06bb10.w256.b0", !148, i64 0}
!148 = !{!"0x6079bb06bb10.w512.b0", !149, i64 0}
!149 = !{!"0x6079bb06bb10.w1024.b0", !150, i64 0}
!150 = !{!"0x6079bb06bb10", !19, i64 0}
!151 = !{!152, !152, i64 0}
!152 = !{!"0x6079bb06bb10.w8.b8", !143, i64 0}
!153 = !{!154, !154, i64 0}
!154 = !{!"0x6079bb06bb10.w8.b16", !155, i64 0}
!155 = !{!"0x6079bb06bb10.w16.b16", !144, i64 0}
!156 = !{!157, !157, i64 0}
!157 = !{!"0x6079bb06bb10.w8.b24", !155, i64 0}
!158 = distinct !DISubprogram(name: "instance_norm_compute_", scope: !1, file: !1, type: !159, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !161)
!159 = !DISubroutineType(types: !160)
!160 = !{!8, !8, !8, !8, !8, !8, !56, !56, !56, !56}
!161 = !{!162, !163, !164, !165, !166, !167, !168, !169, !170}
!162 = !DILocalVariable(name: "dev_id", arg: 1, scope: !158, file: !1, type: !8)
!163 = !DILocalVariable(name: "N", arg: 2, scope: !158, file: !1, type: !8)
!164 = !DILocalVariable(name: "C", arg: 3, scope: !158, file: !1, type: !8)
!165 = !DILocalVariable(name: "H", arg: 4, scope: !158, file: !1, type: !8)
!166 = !DILocalVariable(name: "W", arg: 5, scope: !158, file: !1, type: !8)
!167 = !DILocalVariable(name: "A", arg: 6, scope: !158, file: !1, type: !56)
!168 = !DILocalVariable(name: "T_instance_norm", arg: 7, scope: !158, file: !1, type: !56)
!169 = !DILocalVariable(name: "gamma", arg: 8, scope: !158, file: !1, type: !56)
!170 = !DILocalVariable(name: "beta", arg: 9, scope: !158, file: !1, type: !56)
!171 = !DILocation(line: 0, scope: !158)
!172 = !DILocalVariable(name: "A_red_temp.v0", scope: !158, file: !1, type: !56)
!173 = !DILocalVariable(name: "A_red_temp.v1", scope: !158, file: !1, type: !56)
!174 = !DILocalVariable(name: "ax0", scope: !158, file: !1, type: !8)
!175 = !{!"branch_weights", i32 16129, i32 255}
!176 = !{!"branch_weights", i32 255, i32 16129}
!177 = !DILocalVariable(name: "ax1", scope: !158, file: !1, type: !8)
!178 = !DILocalVariable(name: "k2", scope: !158, file: !1, type: !8)
!179 = !DILocalVariable(name: "k3", scope: !158, file: !1, type: !8)
!180 = !{!181, !181, i64 0}
!181 = !{!"0x6079bb1dafa0", !19, i64 0}
!182 = !DILocalVariable(name: "v_A_red_temp.v0", scope: !158, file: !1, type: !57)
!183 = !DILocalVariable(name: "v_A_red_temp.v1", scope: !158, file: !1, type: !57)
!184 = !{!"branch_weights", i32 127, i32 134217601}
!185 = !{!186, !186, i64 0}
!186 = !{!"0x6079bb1426e0", !19, i64 0}
!187 = !{!188, !188, i64 0}
!188 = !{!"0x6079bb17fd50", !19, i64 0}
!189 = !DILocalVariable(name: "ax2", scope: !158, file: !1, type: !8)
!190 = !{!191, !191, i64 0}
!191 = !{!"0x6079bb058440", !19, i64 0}
!192 = !{!193, !193, i64 0}
!193 = !{!"0x6079bafb1140", !19, i64 0}
!194 = !DILocalVariable(name: "ax3", scope: !158, file: !1, type: !8)
!195 = !{!"branch_weights", i32 1, i32 127}
!196 = !{!197, !197, i64 0}
!197 = !{!"0x6079bafc4db0", !19, i64 0}
!198 = !{!"branch_weights", i32 127, i32 16777081}
!199 = distinct !{!199, !200, !201}
!200 = !{!"llvm.loop.isvectorized", i32 1}
!201 = !{!"llvm.loop.unroll.runtime.disable"}
!202 = !{!"branch_weights", i32 1, i32 7}
!203 = !{!"branch_weights", i32 127, i32 0}
!204 = distinct !{!204, !201, !200}
