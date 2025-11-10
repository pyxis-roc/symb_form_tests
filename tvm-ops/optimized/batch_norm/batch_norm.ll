; ModuleID = 'TVMMod'
source_filename = "TVMMod"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__TVMFFIErrorSetRaisedFromCStr = linkonce dllexport local_unnamed_addr global ptr null, align 8
@.str = private constant [61 x i8] c"Assert fail: num_args == 6, batch_norm: num_args should be 6\00", align 1
@.str.1 = private constant [13 x i8] c"RuntimeError\00", align 1
@.str.2 = private constant [69 x i8] c"Assert fail: not T.isnullptr(args), batch_norm: args pointer is NULL\00", align 1
@.str.3 = private constant [152 x i8] c"Assert fail: var_A_type_index == 0 or var_A_type_index == 4 or var_A_type_index == 7 or var_A_type_index >= 64, batch_norm: Expect arg[0] to be pointer\00", align 1
@.str.4 = private constant [168 x i8] c"Assert fail: var_gamma_type_index == 0 or var_gamma_type_index == 4 or var_gamma_type_index == 7 or var_gamma_type_index >= 64, batch_norm: Expect arg[1] to be pointer\00", align 1
@.str.5 = private constant [164 x i8] c"Assert fail: var_beta_type_index == 0 or var_beta_type_index == 4 or var_beta_type_index == 7 or var_beta_type_index >= 64, batch_norm: Expect arg[2] to be pointer\00", align 1
@.str.6 = private constant [192 x i8] c"Assert fail: var_moving_mean_type_index == 0 or var_moving_mean_type_index == 4 or var_moving_mean_type_index == 7 or var_moving_mean_type_index >= 64, batch_norm: Expect arg[3] to be pointer\00", align 1
@.str.7 = private constant [188 x i8] c"Assert fail: var_moving_var_type_index == 0 or var_moving_var_type_index == 4 or var_moving_var_type_index == 7 or var_moving_var_type_index >= 64, batch_norm: Expect arg[4] to be pointer\00", align 1
@.str.8 = private constant [168 x i8] c"Assert fail: var_T_add_type_index == 0 or var_T_add_type_index == 4 or var_T_add_type_index == 7 or var_T_add_type_index >= 64, batch_norm: Expect arg[5] to be pointer\00", align 1
@.str.9 = private constant [101 x i8] c"Assert fail: not T.isnullptr(var_A), batch_norm.var_A is expected to have non-NULL DLTensor* pointer\00", align 1
@.str.10 = private constant [103 x i8] c"Assert fail: 4 == T.tvm_struct_get(var_A, 0, 4, \22int32\22), batch_norm.var_A.ndim is expected to equal 4\00", align 1
@.str.11 = private constant [109 x i8] c"Assert fail: not T.isnullptr(var_gamma), batch_norm.var_gamma is expected to have non-NULL DLTensor* pointer\00", align 1
@.str.12 = private constant [111 x i8] c"Assert fail: 1 == T.tvm_struct_get(var_gamma, 0, 4, \22int32\22), batch_norm.var_gamma.ndim is expected to equal 1\00", align 1
@.str.13 = private constant [107 x i8] c"Assert fail: not T.isnullptr(var_beta), batch_norm.var_beta is expected to have non-NULL DLTensor* pointer\00", align 1
@.str.14 = private constant [109 x i8] c"Assert fail: 1 == T.tvm_struct_get(var_beta, 0, 4, \22int32\22), batch_norm.var_beta.ndim is expected to equal 1\00", align 1
@.str.15 = private constant [121 x i8] c"Assert fail: not T.isnullptr(var_moving_mean), batch_norm.var_moving_mean is expected to have non-NULL DLTensor* pointer\00", align 1
@.str.16 = private constant [123 x i8] c"Assert fail: 1 == T.tvm_struct_get(var_moving_mean, 0, 4, \22int32\22), batch_norm.var_moving_mean.ndim is expected to equal 1\00", align 1
@.str.17 = private constant [119 x i8] c"Assert fail: not T.isnullptr(var_moving_var), batch_norm.var_moving_var is expected to have non-NULL DLTensor* pointer\00", align 1
@.str.18 = private constant [121 x i8] c"Assert fail: 1 == T.tvm_struct_get(var_moving_var, 0, 4, \22int32\22), batch_norm.var_moving_var.ndim is expected to equal 1\00", align 1
@.str.19 = private constant [109 x i8] c"Assert fail: not T.isnullptr(var_T_add), batch_norm.var_T_add is expected to have non-NULL DLTensor* pointer\00", align 1
@.str.20 = private constant [111 x i8] c"Assert fail: 4 == T.tvm_struct_get(var_T_add, 0, 4, \22int32\22), batch_norm.var_T_add.ndim is expected to equal 4\00", align 1
@.str.21 = private constant [233 x i8] c"Assert fail: T.tvm_struct_get(var_A, 0, 5, \22uint8\22) == T.uint8(2) and T.tvm_struct_get(var_A, 0, 6, \22uint8\22) == T.uint8(32) and T.tvm_struct_get(var_A, 0, 7, \22uint16\22) == T.uint16(1), batch_norm.var_A.dtype is expected to be float32\00", align 1
@.str.22 = private constant [341 x i8] c"Assert fail: (W == 1 or 1 == T.Cast(\22int32\22, batch_norm_var_A_strides[3])) and (H == 1 or W == T.Cast(\22int32\22, batch_norm_var_A_strides[2])) and (C == 1 or W * H == T.Cast(\22int32\22, batch_norm_var_A_strides[1])) and (N == 1 or W * H * C == T.Cast(\22int32\22, batch_norm_var_A_strides[0])), batch_norm.var_A.strides: expected to be compact array\00", align 1
@.str.23 = private constant [193 x i8] c"Assert fail: T.uint64(0) == T.tvm_struct_get(var_A, 0, 8, \22uint64\22), Argument batch_norm.var_A.byte_offset has an unsatisfied constraint: T.uint64(0) == T.tvm_struct_get(var_A, 0, 8, \22uint64\22)\00", align 1
@.str.24 = private constant [173 x i8] c"Assert fail: T.tvm_struct_get(var_A, 0, 10, \22int32\22) == 1, Argument batch_norm.var_A.device_type has an unsatisfied constraint: 1 == T.tvm_struct_get(var_A, 0, 10, \22int32\22)\00", align 1
@.str.25 = private constant [114 x i8] c"Assert fail: N * C * H * W == 0 or not T.isnullptr(A), batch_norm.var_A is expected to have non-NULL data pointer\00", align 1
@.str.26 = private constant [249 x i8] c"Assert fail: T.tvm_struct_get(var_gamma, 0, 5, \22uint8\22) == T.uint8(2) and T.tvm_struct_get(var_gamma, 0, 6, \22uint8\22) == T.uint8(32) and T.tvm_struct_get(var_gamma, 0, 7, \22uint16\22) == T.uint16(1), batch_norm.var_gamma.dtype is expected to be float32\00", align 1
@.str.27 = private constant [188 x i8] c"Assert fail: C == T.Cast(\22int32\22, batch_norm_var_gamma_shape[0]), Argument batch_norm.var_gamma.shape[0] has an unsatisfied constraint: C == T.Cast(\22int32\22, batch_norm_var_gamma_shape[0])\00", align 1
@.str.28 = private constant [137 x i8] c"Assert fail: C == 1 or 1 == T.Cast(\22int32\22, batch_norm_var_gamma_strides[0]), batch_norm.var_gamma.strides: expected to be compact array\00", align 1
@.str.29 = private constant [205 x i8] c"Assert fail: T.uint64(0) == T.tvm_struct_get(var_gamma, 0, 8, \22uint64\22), Argument batch_norm.var_gamma.byte_offset has an unsatisfied constraint: T.uint64(0) == T.tvm_struct_get(var_gamma, 0, 8, \22uint64\22)\00", align 1
@.str.30 = private constant [185 x i8] c"Assert fail: T.tvm_struct_get(var_gamma, 0, 10, \22int32\22) == 1, Argument batch_norm.var_gamma.device_type has an unsatisfied constraint: 1 == T.tvm_struct_get(var_gamma, 0, 10, \22int32\22)\00", align 1
@.str.31 = private constant [191 x i8] c"Assert fail: dev_id == T.tvm_struct_get(var_gamma, 0, 9, \22int32\22), Argument batch_norm.var_gamma.device_id has an unsatisfied constraint: dev_id == T.tvm_struct_get(var_gamma, 0, 9, \22int32\22)\00", align 1
@.str.32 = private constant [110 x i8] c"Assert fail: C == 0 or not T.isnullptr(gamma), batch_norm.var_gamma is expected to have non-NULL data pointer\00", align 1
@.str.33 = private constant [245 x i8] c"Assert fail: T.tvm_struct_get(var_beta, 0, 5, \22uint8\22) == T.uint8(2) and T.tvm_struct_get(var_beta, 0, 6, \22uint8\22) == T.uint8(32) and T.tvm_struct_get(var_beta, 0, 7, \22uint16\22) == T.uint16(1), batch_norm.var_beta.dtype is expected to be float32\00", align 1
@.str.34 = private constant [185 x i8] c"Assert fail: C == T.Cast(\22int32\22, batch_norm_var_beta_shape[0]), Argument batch_norm.var_beta.shape[0] has an unsatisfied constraint: C == T.Cast(\22int32\22, batch_norm_var_beta_shape[0])\00", align 1
@.str.35 = private constant [135 x i8] c"Assert fail: C == 1 or 1 == T.Cast(\22int32\22, batch_norm_var_beta_strides[0]), batch_norm.var_beta.strides: expected to be compact array\00", align 1
@.str.36 = private constant [202 x i8] c"Assert fail: T.uint64(0) == T.tvm_struct_get(var_beta, 0, 8, \22uint64\22), Argument batch_norm.var_beta.byte_offset has an unsatisfied constraint: T.uint64(0) == T.tvm_struct_get(var_beta, 0, 8, \22uint64\22)\00", align 1
@.str.37 = private constant [182 x i8] c"Assert fail: T.tvm_struct_get(var_beta, 0, 10, \22int32\22) == 1, Argument batch_norm.var_beta.device_type has an unsatisfied constraint: 1 == T.tvm_struct_get(var_beta, 0, 10, \22int32\22)\00", align 1
@.str.38 = private constant [188 x i8] c"Assert fail: dev_id == T.tvm_struct_get(var_beta, 0, 9, \22int32\22), Argument batch_norm.var_beta.device_id has an unsatisfied constraint: dev_id == T.tvm_struct_get(var_beta, 0, 9, \22int32\22)\00", align 1
@.str.39 = private constant [108 x i8] c"Assert fail: C == 0 or not T.isnullptr(beta), batch_norm.var_beta is expected to have non-NULL data pointer\00", align 1
@.str.40 = private constant [273 x i8] c"Assert fail: T.tvm_struct_get(var_moving_mean, 0, 5, \22uint8\22) == T.uint8(2) and T.tvm_struct_get(var_moving_mean, 0, 6, \22uint8\22) == T.uint8(32) and T.tvm_struct_get(var_moving_mean, 0, 7, \22uint16\22) == T.uint16(1), batch_norm.var_moving_mean.dtype is expected to be float32\00", align 1
@.str.41 = private constant [206 x i8] c"Assert fail: C == T.Cast(\22int32\22, batch_norm_var_moving_mean_shape[0]), Argument batch_norm.var_moving_mean.shape[0] has an unsatisfied constraint: C == T.Cast(\22int32\22, batch_norm_var_moving_mean_shape[0])\00", align 1
@.str.42 = private constant [149 x i8] c"Assert fail: C == 1 or 1 == T.Cast(\22int32\22, batch_norm_var_moving_mean_strides[0]), batch_norm.var_moving_mean.strides: expected to be compact array\00", align 1
@.str.43 = private constant [223 x i8] c"Assert fail: T.uint64(0) == T.tvm_struct_get(var_moving_mean, 0, 8, \22uint64\22), Argument batch_norm.var_moving_mean.byte_offset has an unsatisfied constraint: T.uint64(0) == T.tvm_struct_get(var_moving_mean, 0, 8, \22uint64\22)\00", align 1
@.str.44 = private constant [203 x i8] c"Assert fail: T.tvm_struct_get(var_moving_mean, 0, 10, \22int32\22) == 1, Argument batch_norm.var_moving_mean.device_type has an unsatisfied constraint: 1 == T.tvm_struct_get(var_moving_mean, 0, 10, \22int32\22)\00", align 1
@.str.45 = private constant [209 x i8] c"Assert fail: dev_id == T.tvm_struct_get(var_moving_mean, 0, 9, \22int32\22), Argument batch_norm.var_moving_mean.device_id has an unsatisfied constraint: dev_id == T.tvm_struct_get(var_moving_mean, 0, 9, \22int32\22)\00", align 1
@.str.46 = private constant [122 x i8] c"Assert fail: C == 0 or not T.isnullptr(moving_mean), batch_norm.var_moving_mean is expected to have non-NULL data pointer\00", align 1
@.str.47 = private constant [269 x i8] c"Assert fail: T.tvm_struct_get(var_moving_var, 0, 5, \22uint8\22) == T.uint8(2) and T.tvm_struct_get(var_moving_var, 0, 6, \22uint8\22) == T.uint8(32) and T.tvm_struct_get(var_moving_var, 0, 7, \22uint16\22) == T.uint16(1), batch_norm.var_moving_var.dtype is expected to be float32\00", align 1
@.str.48 = private constant [203 x i8] c"Assert fail: C == T.Cast(\22int32\22, batch_norm_var_moving_var_shape[0]), Argument batch_norm.var_moving_var.shape[0] has an unsatisfied constraint: C == T.Cast(\22int32\22, batch_norm_var_moving_var_shape[0])\00", align 1
@.str.49 = private constant [147 x i8] c"Assert fail: C == 1 or 1 == T.Cast(\22int32\22, batch_norm_var_moving_var_strides[0]), batch_norm.var_moving_var.strides: expected to be compact array\00", align 1
@.str.50 = private constant [220 x i8] c"Assert fail: T.uint64(0) == T.tvm_struct_get(var_moving_var, 0, 8, \22uint64\22), Argument batch_norm.var_moving_var.byte_offset has an unsatisfied constraint: T.uint64(0) == T.tvm_struct_get(var_moving_var, 0, 8, \22uint64\22)\00", align 1
@.str.51 = private constant [200 x i8] c"Assert fail: T.tvm_struct_get(var_moving_var, 0, 10, \22int32\22) == 1, Argument batch_norm.var_moving_var.device_type has an unsatisfied constraint: 1 == T.tvm_struct_get(var_moving_var, 0, 10, \22int32\22)\00", align 1
@.str.52 = private constant [206 x i8] c"Assert fail: dev_id == T.tvm_struct_get(var_moving_var, 0, 9, \22int32\22), Argument batch_norm.var_moving_var.device_id has an unsatisfied constraint: dev_id == T.tvm_struct_get(var_moving_var, 0, 9, \22int32\22)\00", align 1
@.str.53 = private constant [120 x i8] c"Assert fail: C == 0 or not T.isnullptr(moving_var), batch_norm.var_moving_var is expected to have non-NULL data pointer\00", align 1
@.str.54 = private constant [249 x i8] c"Assert fail: T.tvm_struct_get(var_T_add, 0, 5, \22uint8\22) == T.uint8(2) and T.tvm_struct_get(var_T_add, 0, 6, \22uint8\22) == T.uint8(32) and T.tvm_struct_get(var_T_add, 0, 7, \22uint16\22) == T.uint16(1), batch_norm.var_T_add.dtype is expected to be float32\00", align 1
@.str.55 = private constant [188 x i8] c"Assert fail: N == T.Cast(\22int32\22, batch_norm_var_T_add_shape[0]), Argument batch_norm.var_T_add.shape[0] has an unsatisfied constraint: N == T.Cast(\22int32\22, batch_norm_var_T_add_shape[0])\00", align 1
@.str.56 = private constant [188 x i8] c"Assert fail: C == T.Cast(\22int32\22, batch_norm_var_T_add_shape[1]), Argument batch_norm.var_T_add.shape[1] has an unsatisfied constraint: C == T.Cast(\22int32\22, batch_norm_var_T_add_shape[1])\00", align 1
@.str.57 = private constant [188 x i8] c"Assert fail: H == T.Cast(\22int32\22, batch_norm_var_T_add_shape[2]), Argument batch_norm.var_T_add.shape[2] has an unsatisfied constraint: H == T.Cast(\22int32\22, batch_norm_var_T_add_shape[2])\00", align 1
@.str.58 = private constant [188 x i8] c"Assert fail: W == T.Cast(\22int32\22, batch_norm_var_T_add_shape[3]), Argument batch_norm.var_T_add.shape[3] has an unsatisfied constraint: W == T.Cast(\22int32\22, batch_norm_var_T_add_shape[3])\00", align 1
@.str.59 = private constant [361 x i8] c"Assert fail: (W == 1 or 1 == T.Cast(\22int32\22, batch_norm_var_T_add_strides[3])) and (H == 1 or W == T.Cast(\22int32\22, batch_norm_var_T_add_strides[2])) and (C == 1 or W * H == T.Cast(\22int32\22, batch_norm_var_T_add_strides[1])) and (N == 1 or W * H * C == T.Cast(\22int32\22, batch_norm_var_T_add_strides[0])), batch_norm.var_T_add.strides: expected to be compact array\00", align 1
@.str.60 = private constant [205 x i8] c"Assert fail: T.uint64(0) == T.tvm_struct_get(var_T_add, 0, 8, \22uint64\22), Argument batch_norm.var_T_add.byte_offset has an unsatisfied constraint: T.uint64(0) == T.tvm_struct_get(var_T_add, 0, 8, \22uint64\22)\00", align 1
@.str.61 = private constant [185 x i8] c"Assert fail: T.tvm_struct_get(var_T_add, 0, 10, \22int32\22) == 1, Argument batch_norm.var_T_add.device_type has an unsatisfied constraint: 1 == T.tvm_struct_get(var_T_add, 0, 10, \22int32\22)\00", align 1
@.str.62 = private constant [191 x i8] c"Assert fail: dev_id == T.tvm_struct_get(var_T_add, 0, 9, \22int32\22), Argument batch_norm.var_T_add.device_id has an unsatisfied constraint: dev_id == T.tvm_struct_get(var_T_add, 0, 9, \22int32\22)\00", align 1
@.str.63 = private constant [122 x i8] c"Assert fail: N * C * H * W == 0 or not T.isnullptr(T_add), batch_norm.var_T_add is expected to have non-NULL data pointer\00", align 1
@__TVMBackendAllocWorkspace = linkonce dllexport local_unnamed_addr global ptr null, align 8
@__TVMBackendFreeWorkspace = linkonce dllexport local_unnamed_addr global ptr null, align 8
@__tvm_main__ = weak dllexport local_unnamed_addr constant [11 x i8] c"batch_norm\00", align 1
@llvm.global_ctors = appending global [0 x { i32, ptr, ptr }] zeroinitializer

define dllexport range(i32 -1, 1) i32 @batch_norm(ptr noalias nocapture readnone %self_handle, ptr noalias readonly %args, i32 %num_args, ptr noalias nocapture readnone %result) local_unnamed_addr #0 !dbg !5 {
entry:
    #dbg_value(ptr %self_handle, !11, !DIExpression(), !15)
    #dbg_value(ptr %args, !12, !DIExpression(), !15)
    #dbg_value(i32 %num_args, !13, !DIExpression(), !15)
    #dbg_value(ptr %result, !14, !DIExpression(), !15)
  %0 = icmp eq i32 %num_args, 6, !dbg !15
  br i1 %0, label %assert_end, label %assert_fail, !dbg !15, !prof !16

common.ret:                                       ; preds = %assert_end134, %assert_fail133, %assert_fail131, %assert_fail129, %assert_fail127, %assert_fail125, %assert_fail121, %assert_fail119, %assert_fail117, %assert_fail115, %assert_fail113, %assert_fail111, %assert_fail109, %assert_fail107, %assert_fail105, %assert_fail103, %assert_fail99, %assert_fail97, %assert_fail95, %assert_fail93, %assert_fail91, %assert_fail89, %assert_fail87, %assert_fail83, %assert_fail81, %assert_fail79, %assert_fail77, %assert_fail75, %assert_fail73, %assert_fail71, %assert_fail67, %assert_fail65, %assert_fail63, %assert_fail61, %assert_fail59, %assert_fail57, %assert_fail55, %assert_fail51, %assert_fail49, %assert_fail47, %assert_fail45, %assert_fail43, %assert_fail41, %assert_fail39, %assert_fail37, %assert_fail35, %assert_fail33, %assert_fail31, %assert_fail29, %assert_fail27, %assert_fail25, %assert_fail23, %assert_fail21, %assert_fail19, %assert_fail17, %assert_fail15, %assert_fail13, %assert_fail11, %assert_fail9, %assert_fail7, %assert_fail5, %assert_fail3, %assert_fail1, %assert_fail
  %common.ret.op = phi i32 [ -1, %assert_fail ], [ -1, %assert_fail1 ], [ -1, %assert_fail3 ], [ -1, %assert_fail5 ], [ -1, %assert_fail7 ], [ -1, %assert_fail9 ], [ -1, %assert_fail11 ], [ -1, %assert_fail13 ], [ -1, %assert_fail15 ], [ -1, %assert_fail17 ], [ -1, %assert_fail19 ], [ -1, %assert_fail21 ], [ -1, %assert_fail23 ], [ -1, %assert_fail25 ], [ -1, %assert_fail27 ], [ -1, %assert_fail29 ], [ -1, %assert_fail31 ], [ -1, %assert_fail33 ], [ -1, %assert_fail35 ], [ -1, %assert_fail37 ], [ -1, %assert_fail39 ], [ -1, %assert_fail41 ], [ -1, %assert_fail43 ], [ -1, %assert_fail45 ], [ -1, %assert_fail47 ], [ -1, %assert_fail49 ], [ -1, %assert_fail51 ], [ -1, %assert_fail55 ], [ -1, %assert_fail57 ], [ -1, %assert_fail59 ], [ -1, %assert_fail61 ], [ -1, %assert_fail63 ], [ -1, %assert_fail65 ], [ -1, %assert_fail67 ], [ -1, %assert_fail71 ], [ -1, %assert_fail73 ], [ -1, %assert_fail75 ], [ -1, %assert_fail77 ], [ -1, %assert_fail79 ], [ -1, %assert_fail81 ], [ -1, %assert_fail83 ], [ -1, %assert_fail87 ], [ -1, %assert_fail89 ], [ -1, %assert_fail91 ], [ -1, %assert_fail93 ], [ -1, %assert_fail95 ], [ -1, %assert_fail97 ], [ -1, %assert_fail99 ], [ -1, %assert_fail103 ], [ -1, %assert_fail105 ], [ -1, %assert_fail107 ], [ -1, %assert_fail109 ], [ -1, %assert_fail111 ], [ -1, %assert_fail113 ], [ -1, %assert_fail115 ], [ -1, %assert_fail117 ], [ -1, %assert_fail119 ], [ -1, %assert_fail121 ], [ -1, %assert_fail125 ], [ -1, %assert_fail127 ], [ -1, %assert_fail129 ], [ -1, %assert_fail131 ], [ -1, %assert_fail133 ], [ %367, %assert_end134 ]
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
  br i1 %6, label %assert_end6, label %switch.early.test135, !dbg !15

switch.early.test135:                             ; preds = %assert_end4
  switch i32 %var_gamma.type_index.fr, label %assert_fail5 [
    i32 7, label %assert_end6
    i32 4, label %assert_end6
    i32 0, label %assert_end6
  ], !dbg !15

assert_fail5:                                     ; preds = %switch.early.test135
  %7 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %7(ptr nonnull @.str.1, ptr nonnull @.str.4), !dbg !15
  br label %common.ret, !dbg !15

assert_end6:                                      ; preds = %switch.early.test135, %switch.early.test135, %switch.early.test135, %assert_end4
  %8 = getelementptr inbounds nuw i8, ptr %args, i64 32, !dbg !15
  %var_beta.type_index = load i32, ptr %8, align 4, !dbg !15
    #dbg_declare(i32 %var_beta.type_index, !23, !DIExpression(), !15)
    #dbg_declare(i32 %var_beta.type_index, !23, !DIExpression(), !15)
  %var_beta.type_index.fr = freeze i32 %var_beta.type_index, !dbg !15
  %9 = icmp sgt i32 %var_beta.type_index.fr, 63, !dbg !15
  br i1 %9, label %assert_end8, label %switch.early.test136, !dbg !15

switch.early.test136:                             ; preds = %assert_end6
  switch i32 %var_beta.type_index.fr, label %assert_fail7 [
    i32 7, label %assert_end8
    i32 4, label %assert_end8
    i32 0, label %assert_end8
  ], !dbg !15

assert_fail7:                                     ; preds = %switch.early.test136
  %10 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %10(ptr nonnull @.str.1, ptr nonnull @.str.5), !dbg !15
  br label %common.ret, !dbg !15

assert_end8:                                      ; preds = %switch.early.test136, %switch.early.test136, %switch.early.test136, %assert_end6
  %11 = getelementptr inbounds nuw i8, ptr %args, i64 48, !dbg !15
  %var_moving_mean.type_index = load i32, ptr %11, align 4, !dbg !15
    #dbg_declare(i32 %var_moving_mean.type_index, !24, !DIExpression(), !15)
    #dbg_declare(i32 %var_moving_mean.type_index, !24, !DIExpression(), !15)
  %var_moving_mean.type_index.fr = freeze i32 %var_moving_mean.type_index, !dbg !15
  %12 = icmp sgt i32 %var_moving_mean.type_index.fr, 63, !dbg !15
  br i1 %12, label %assert_end10, label %switch.early.test137, !dbg !15

switch.early.test137:                             ; preds = %assert_end8
  switch i32 %var_moving_mean.type_index.fr, label %assert_fail9 [
    i32 7, label %assert_end10
    i32 4, label %assert_end10
    i32 0, label %assert_end10
  ], !dbg !15

assert_fail9:                                     ; preds = %switch.early.test137
  %13 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %13(ptr nonnull @.str.1, ptr nonnull @.str.6), !dbg !15
  br label %common.ret, !dbg !15

assert_end10:                                     ; preds = %switch.early.test137, %switch.early.test137, %switch.early.test137, %assert_end8
  %14 = getelementptr inbounds nuw i8, ptr %args, i64 64, !dbg !15
  %var_moving_var.type_index = load i32, ptr %14, align 4, !dbg !15
    #dbg_declare(i32 %var_moving_var.type_index, !25, !DIExpression(), !15)
    #dbg_declare(i32 %var_moving_var.type_index, !25, !DIExpression(), !15)
  %var_moving_var.type_index.fr = freeze i32 %var_moving_var.type_index, !dbg !15
  %15 = icmp sgt i32 %var_moving_var.type_index.fr, 63, !dbg !15
  br i1 %15, label %assert_end12, label %switch.early.test138, !dbg !15

switch.early.test138:                             ; preds = %assert_end10
  switch i32 %var_moving_var.type_index.fr, label %assert_fail11 [
    i32 7, label %assert_end12
    i32 4, label %assert_end12
    i32 0, label %assert_end12
  ], !dbg !15

assert_fail11:                                    ; preds = %switch.early.test138
  %16 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %16(ptr nonnull @.str.1, ptr nonnull @.str.7), !dbg !15
  br label %common.ret, !dbg !15

assert_end12:                                     ; preds = %switch.early.test138, %switch.early.test138, %switch.early.test138, %assert_end10
  %17 = getelementptr inbounds nuw i8, ptr %args, i64 80, !dbg !15
  %var_T_add.type_index = load i32, ptr %17, align 4, !dbg !15
    #dbg_declare(i32 %var_T_add.type_index, !26, !DIExpression(), !15)
    #dbg_declare(i32 %var_T_add.type_index, !26, !DIExpression(), !15)
  %var_T_add.type_index.fr = freeze i32 %var_T_add.type_index, !dbg !15
  %18 = icmp sgt i32 %var_T_add.type_index.fr, 63, !dbg !15
  br i1 %18, label %assert_end14, label %switch.early.test139, !dbg !15

switch.early.test139:                             ; preds = %assert_end12
  switch i32 %var_T_add.type_index.fr, label %assert_fail13 [
    i32 7, label %assert_end14
    i32 4, label %assert_end14
    i32 0, label %assert_end14
  ], !dbg !15

assert_fail13:                                    ; preds = %switch.early.test139
  %19 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %19(ptr nonnull @.str.1, ptr nonnull @.str.8), !dbg !15
  br label %common.ret, !dbg !15

assert_end14:                                     ; preds = %switch.early.test139, %switch.early.test139, %switch.early.test139, %assert_end12
  %20 = getelementptr inbounds nuw i8, ptr %args, i64 8, !dbg !15
  %21 = load ptr, ptr %20, align 8, !dbg !15
  %22 = icmp eq i32 %var_A.type_index.fr, 72, !dbg !15
  %var_A.idx = select i1 %22, i64 16, i64 0, !dbg !15
  %var_A = getelementptr inbounds nuw i8, ptr %21, i64 %var_A.idx, !dbg !15
    #dbg_declare(ptr %var_A, !27, !DIExpression(), !15)
    #dbg_declare(ptr %var_A, !27, !DIExpression(), !15)
  %23 = getelementptr inbounds nuw i8, ptr %args, i64 24, !dbg !15
  %24 = load ptr, ptr %23, align 8, !dbg !15
  %25 = icmp eq i32 %var_gamma.type_index.fr, 72, !dbg !15
  %var_gamma.idx = select i1 %25, i64 16, i64 0, !dbg !15
  %var_gamma = getelementptr inbounds nuw i8, ptr %24, i64 %var_gamma.idx, !dbg !15
    #dbg_declare(ptr %var_gamma, !28, !DIExpression(), !15)
    #dbg_declare(ptr %var_gamma, !28, !DIExpression(), !15)
  %26 = getelementptr inbounds nuw i8, ptr %args, i64 40, !dbg !15
  %27 = load ptr, ptr %26, align 8, !dbg !15
  %28 = icmp eq i32 %var_beta.type_index.fr, 72, !dbg !15
  %var_beta.idx = select i1 %28, i64 16, i64 0, !dbg !15
  %var_beta = getelementptr inbounds nuw i8, ptr %27, i64 %var_beta.idx, !dbg !15
    #dbg_declare(ptr %var_beta, !29, !DIExpression(), !15)
    #dbg_declare(ptr %var_beta, !29, !DIExpression(), !15)
  %29 = getelementptr inbounds nuw i8, ptr %args, i64 56, !dbg !15
  %30 = load ptr, ptr %29, align 8, !dbg !15
  %31 = icmp eq i32 %var_moving_mean.type_index.fr, 72, !dbg !15
  %var_moving_mean.idx = select i1 %31, i64 16, i64 0, !dbg !15
  %var_moving_mean = getelementptr inbounds nuw i8, ptr %30, i64 %var_moving_mean.idx, !dbg !15
    #dbg_declare(ptr %var_moving_mean, !30, !DIExpression(), !15)
    #dbg_declare(ptr %var_moving_mean, !30, !DIExpression(), !15)
  %32 = getelementptr inbounds nuw i8, ptr %args, i64 72, !dbg !15
  %33 = load ptr, ptr %32, align 8, !dbg !15
  %34 = icmp eq i32 %var_moving_var.type_index.fr, 72, !dbg !15
  %var_moving_var.idx = select i1 %34, i64 16, i64 0, !dbg !15
  %var_moving_var = getelementptr inbounds nuw i8, ptr %33, i64 %var_moving_var.idx, !dbg !15
    #dbg_declare(ptr %var_moving_var, !31, !DIExpression(), !15)
    #dbg_declare(ptr %var_moving_var, !31, !DIExpression(), !15)
  %35 = getelementptr inbounds nuw i8, ptr %args, i64 88, !dbg !15
  %36 = load ptr, ptr %35, align 8, !dbg !15
  %37 = icmp eq i32 %var_T_add.type_index.fr, 72, !dbg !15
  %var_T_add.idx = select i1 %37, i64 16, i64 0, !dbg !15
  %var_T_add = getelementptr inbounds nuw i8, ptr %36, i64 %var_T_add.idx, !dbg !15
    #dbg_declare(ptr %var_T_add, !32, !DIExpression(), !15)
    #dbg_declare(ptr %var_T_add, !32, !DIExpression(), !15)
  %.not140 = icmp eq ptr %21, null, !dbg !15
  br i1 %.not140, label %assert_fail15, label %assert_end16, !dbg !15, !prof !20

assert_fail15:                                    ; preds = %assert_end14
  %38 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %38(ptr nonnull @.str.1, ptr nonnull @.str.9), !dbg !15
  br label %common.ret, !dbg !15

assert_end16:                                     ; preds = %assert_end14
  %39 = getelementptr inbounds nuw i8, ptr %var_A, i64 16, !dbg !15
  %40 = load i32, ptr %39, align 4, !dbg !15
  %41 = icmp eq i32 %40, 4, !dbg !15
  br i1 %41, label %assert_end18, label %assert_fail17, !dbg !15, !prof !16

assert_fail17:                                    ; preds = %assert_end16
  %42 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %42(ptr nonnull @.str.1, ptr nonnull @.str.10), !dbg !15
  br label %common.ret, !dbg !15

assert_end18:                                     ; preds = %assert_end16
  %43 = getelementptr inbounds nuw i8, ptr %var_A, i64 24, !dbg !15
  %batch_norm.var_A.shape = load ptr, ptr %43, align 8, !dbg !15
    #dbg_declare(ptr %batch_norm.var_A.shape, !33, !DIExpression(), !15)
    #dbg_declare(ptr %batch_norm.var_A.shape, !33, !DIExpression(), !15)
  %44 = load i64, ptr %batch_norm.var_A.shape, align 8, !dbg !15, !tbaa !36
  %N = trunc i64 %44 to i32, !dbg !15
    #dbg_declare(i32 %N, !46, !DIExpression(), !15)
    #dbg_declare(i32 %N, !46, !DIExpression(), !15)
  %45 = getelementptr inbounds nuw i8, ptr %batch_norm.var_A.shape, i64 8, !dbg !15
  %46 = load i64, ptr %45, align 8, !dbg !15, !tbaa !47
  %C = trunc i64 %46 to i32, !dbg !15
    #dbg_declare(i32 %C, !49, !DIExpression(), !15)
    #dbg_declare(i32 %C, !49, !DIExpression(), !15)
  %47 = getelementptr inbounds nuw i8, ptr %batch_norm.var_A.shape, i64 16, !dbg !15
  %48 = load i64, ptr %47, align 8, !dbg !15, !tbaa !50
  %H = trunc i64 %48 to i32, !dbg !15
    #dbg_declare(i32 %H, !53, !DIExpression(), !15)
    #dbg_declare(i32 %H, !53, !DIExpression(), !15)
  %49 = getelementptr inbounds nuw i8, ptr %batch_norm.var_A.shape, i64 24, !dbg !15
  %50 = load i64, ptr %49, align 8, !dbg !15, !tbaa !54
  %W = trunc i64 %50 to i32, !dbg !15
    #dbg_declare(i32 %W, !56, !DIExpression(), !15)
    #dbg_declare(i32 %W, !56, !DIExpression(), !15)
  %51 = getelementptr inbounds nuw i8, ptr %var_A, i64 32, !dbg !15
  %batch_norm.var_A.strides = load ptr, ptr %51, align 8, !dbg !15
    #dbg_declare(ptr %batch_norm.var_A.strides, !57, !DIExpression(), !15)
    #dbg_declare(ptr %batch_norm.var_A.strides, !57, !DIExpression(), !15)
  %52 = getelementptr inbounds nuw i8, ptr %var_A, i64 12, !dbg !15
  %dev_id = load i32, ptr %52, align 4, !dbg !15
    #dbg_declare(i32 %dev_id, !58, !DIExpression(), !15)
    #dbg_declare(i32 %dev_id, !58, !DIExpression(), !15)
  %A = load ptr, ptr %var_A, align 8, !dbg !15
    #dbg_declare(ptr %A, !59, !DIExpression(), !15)
    #dbg_declare(ptr %A, !59, !DIExpression(), !15)
  call void @llvm.assume(i1 true) [ "align"(ptr %A, i64 64) ], !dbg !15
  %.not141 = icmp eq ptr %24, null, !dbg !15
  br i1 %.not141, label %assert_fail19, label %assert_end20, !dbg !15, !prof !20

assert_fail19:                                    ; preds = %assert_end18
  %53 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %53(ptr nonnull @.str.1, ptr nonnull @.str.11), !dbg !15
  br label %common.ret, !dbg !15

assert_end20:                                     ; preds = %assert_end18
  %54 = getelementptr inbounds nuw i8, ptr %var_gamma, i64 16, !dbg !15
  %55 = load i32, ptr %54, align 4, !dbg !15
  %56 = icmp eq i32 %55, 1, !dbg !15
  br i1 %56, label %assert_end22, label %assert_fail21, !dbg !15, !prof !16

assert_fail21:                                    ; preds = %assert_end20
  %57 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %57(ptr nonnull @.str.1, ptr nonnull @.str.12), !dbg !15
  br label %common.ret, !dbg !15

assert_end22:                                     ; preds = %assert_end20
  %58 = getelementptr inbounds nuw i8, ptr %var_gamma, i64 24, !dbg !15
  %batch_norm.var_gamma.shape = load ptr, ptr %58, align 8, !dbg !15
    #dbg_declare(ptr %batch_norm.var_gamma.shape, !62, !DIExpression(), !15)
    #dbg_declare(ptr %batch_norm.var_gamma.shape, !62, !DIExpression(), !15)
  %59 = getelementptr inbounds nuw i8, ptr %var_gamma, i64 32, !dbg !15
  %batch_norm.var_gamma.strides = load ptr, ptr %59, align 8, !dbg !15
    #dbg_declare(ptr %batch_norm.var_gamma.strides, !63, !DIExpression(), !15)
    #dbg_declare(ptr %batch_norm.var_gamma.strides, !63, !DIExpression(), !15)
  %gamma = load ptr, ptr %var_gamma, align 8, !dbg !15
    #dbg_declare(ptr %gamma, !64, !DIExpression(), !15)
    #dbg_declare(ptr %gamma, !64, !DIExpression(), !15)
  call void @llvm.assume(i1 true) [ "align"(ptr %gamma, i64 64) ], !dbg !15
  %.not142 = icmp eq ptr %27, null, !dbg !15
  br i1 %.not142, label %assert_fail23, label %assert_end24, !dbg !15, !prof !20

assert_fail23:                                    ; preds = %assert_end22
  %60 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %60(ptr nonnull @.str.1, ptr nonnull @.str.13), !dbg !15
  br label %common.ret, !dbg !15

assert_end24:                                     ; preds = %assert_end22
  %61 = getelementptr inbounds nuw i8, ptr %var_beta, i64 16, !dbg !15
  %62 = load i32, ptr %61, align 4, !dbg !15
  %63 = icmp eq i32 %62, 1, !dbg !15
  br i1 %63, label %assert_end26, label %assert_fail25, !dbg !15, !prof !16

assert_fail25:                                    ; preds = %assert_end24
  %64 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %64(ptr nonnull @.str.1, ptr nonnull @.str.14), !dbg !15
  br label %common.ret, !dbg !15

assert_end26:                                     ; preds = %assert_end24
  %65 = getelementptr inbounds nuw i8, ptr %var_beta, i64 24, !dbg !15
  %batch_norm.var_beta.shape = load ptr, ptr %65, align 8, !dbg !15
    #dbg_declare(ptr %batch_norm.var_beta.shape, !65, !DIExpression(), !15)
    #dbg_declare(ptr %batch_norm.var_beta.shape, !65, !DIExpression(), !15)
  %66 = getelementptr inbounds nuw i8, ptr %var_beta, i64 32, !dbg !15
  %batch_norm.var_beta.strides = load ptr, ptr %66, align 8, !dbg !15
    #dbg_declare(ptr %batch_norm.var_beta.strides, !66, !DIExpression(), !15)
    #dbg_declare(ptr %batch_norm.var_beta.strides, !66, !DIExpression(), !15)
  %beta = load ptr, ptr %var_beta, align 8, !dbg !15
    #dbg_declare(ptr %beta, !67, !DIExpression(), !15)
    #dbg_declare(ptr %beta, !67, !DIExpression(), !15)
  call void @llvm.assume(i1 true) [ "align"(ptr %beta, i64 64) ], !dbg !15
  %.not143 = icmp eq ptr %30, null, !dbg !15
  br i1 %.not143, label %assert_fail27, label %assert_end28, !dbg !15, !prof !20

assert_fail27:                                    ; preds = %assert_end26
  %67 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %67(ptr nonnull @.str.1, ptr nonnull @.str.15), !dbg !15
  br label %common.ret, !dbg !15

assert_end28:                                     ; preds = %assert_end26
  %68 = getelementptr inbounds nuw i8, ptr %var_moving_mean, i64 16, !dbg !15
  %69 = load i32, ptr %68, align 4, !dbg !15
  %70 = icmp eq i32 %69, 1, !dbg !15
  br i1 %70, label %assert_end30, label %assert_fail29, !dbg !15, !prof !16

assert_fail29:                                    ; preds = %assert_end28
  %71 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %71(ptr nonnull @.str.1, ptr nonnull @.str.16), !dbg !15
  br label %common.ret, !dbg !15

assert_end30:                                     ; preds = %assert_end28
  %72 = getelementptr inbounds nuw i8, ptr %var_moving_mean, i64 24, !dbg !15
  %batch_norm.var_moving_mean.shape = load ptr, ptr %72, align 8, !dbg !15
    #dbg_declare(ptr %batch_norm.var_moving_mean.shape, !68, !DIExpression(), !15)
    #dbg_declare(ptr %batch_norm.var_moving_mean.shape, !68, !DIExpression(), !15)
  %73 = getelementptr inbounds nuw i8, ptr %var_moving_mean, i64 32, !dbg !15
  %batch_norm.var_moving_mean.strides = load ptr, ptr %73, align 8, !dbg !15
    #dbg_declare(ptr %batch_norm.var_moving_mean.strides, !69, !DIExpression(), !15)
    #dbg_declare(ptr %batch_norm.var_moving_mean.strides, !69, !DIExpression(), !15)
  %moving_mean = load ptr, ptr %var_moving_mean, align 8, !dbg !15
    #dbg_declare(ptr %moving_mean, !70, !DIExpression(), !15)
    #dbg_declare(ptr %moving_mean, !70, !DIExpression(), !15)
  call void @llvm.assume(i1 true) [ "align"(ptr %moving_mean, i64 64) ], !dbg !15
  %.not144 = icmp eq ptr %33, null, !dbg !15
  br i1 %.not144, label %assert_fail31, label %assert_end32, !dbg !15, !prof !20

assert_fail31:                                    ; preds = %assert_end30
  %74 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %74(ptr nonnull @.str.1, ptr nonnull @.str.17), !dbg !15
  br label %common.ret, !dbg !15

assert_end32:                                     ; preds = %assert_end30
  %75 = getelementptr inbounds nuw i8, ptr %var_moving_var, i64 16, !dbg !15
  %76 = load i32, ptr %75, align 4, !dbg !15
  %77 = icmp eq i32 %76, 1, !dbg !15
  br i1 %77, label %assert_end34, label %assert_fail33, !dbg !15, !prof !16

assert_fail33:                                    ; preds = %assert_end32
  %78 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %78(ptr nonnull @.str.1, ptr nonnull @.str.18), !dbg !15
  br label %common.ret, !dbg !15

assert_end34:                                     ; preds = %assert_end32
  %79 = getelementptr inbounds nuw i8, ptr %var_moving_var, i64 24, !dbg !15
  %batch_norm.var_moving_var.shape = load ptr, ptr %79, align 8, !dbg !15
    #dbg_declare(ptr %batch_norm.var_moving_var.shape, !71, !DIExpression(), !15)
    #dbg_declare(ptr %batch_norm.var_moving_var.shape, !71, !DIExpression(), !15)
  %80 = getelementptr inbounds nuw i8, ptr %var_moving_var, i64 32, !dbg !15
  %batch_norm.var_moving_var.strides = load ptr, ptr %80, align 8, !dbg !15
    #dbg_declare(ptr %batch_norm.var_moving_var.strides, !72, !DIExpression(), !15)
    #dbg_declare(ptr %batch_norm.var_moving_var.strides, !72, !DIExpression(), !15)
  %moving_var = load ptr, ptr %var_moving_var, align 8, !dbg !15
    #dbg_declare(ptr %moving_var, !73, !DIExpression(), !15)
    #dbg_declare(ptr %moving_var, !73, !DIExpression(), !15)
  call void @llvm.assume(i1 true) [ "align"(ptr %moving_var, i64 64) ], !dbg !15
  %.not145 = icmp eq ptr %36, null, !dbg !15
  br i1 %.not145, label %assert_fail35, label %assert_end36, !dbg !15, !prof !20

assert_fail35:                                    ; preds = %assert_end34
  %81 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %81(ptr nonnull @.str.1, ptr nonnull @.str.19), !dbg !15
  br label %common.ret, !dbg !15

assert_end36:                                     ; preds = %assert_end34
  %82 = getelementptr inbounds nuw i8, ptr %var_T_add, i64 16, !dbg !15
  %83 = load i32, ptr %82, align 4, !dbg !15
  %84 = icmp eq i32 %83, 4, !dbg !15
  br i1 %84, label %assert_end38, label %assert_fail37, !dbg !15, !prof !16

assert_fail37:                                    ; preds = %assert_end36
  %85 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %85(ptr nonnull @.str.1, ptr nonnull @.str.20), !dbg !15
  br label %common.ret, !dbg !15

assert_end38:                                     ; preds = %assert_end36
  %86 = getelementptr inbounds nuw i8, ptr %var_T_add, i64 24, !dbg !15
  %batch_norm.var_T_add.shape = load ptr, ptr %86, align 8, !dbg !15
    #dbg_declare(ptr %batch_norm.var_T_add.shape, !74, !DIExpression(), !15)
    #dbg_declare(ptr %batch_norm.var_T_add.shape, !74, !DIExpression(), !15)
  %87 = getelementptr inbounds nuw i8, ptr %var_T_add, i64 32, !dbg !15
  %batch_norm.var_T_add.strides = load ptr, ptr %87, align 8, !dbg !15
    #dbg_declare(ptr %batch_norm.var_T_add.strides, !75, !DIExpression(), !15)
    #dbg_declare(ptr %batch_norm.var_T_add.strides, !75, !DIExpression(), !15)
  %T_add = load ptr, ptr %var_T_add, align 8, !dbg !15
    #dbg_declare(ptr %T_add, !76, !DIExpression(), !15)
    #dbg_declare(ptr %T_add, !76, !DIExpression(), !15)
  call void @llvm.assume(i1 true) [ "align"(ptr %T_add, i64 64) ], !dbg !15
  %88 = getelementptr inbounds nuw i8, ptr %var_A, i64 22, !dbg !15
  %89 = load i16, ptr %88, align 2, !dbg !15
  %90 = icmp eq i16 %89, 1, !dbg !15
  %91 = getelementptr inbounds nuw i8, ptr %var_A, i64 21, !dbg !15
  %92 = load i8, ptr %91, align 1, !dbg !15
  %93 = icmp eq i8 %92, 32, !dbg !15
  %94 = getelementptr inbounds nuw i8, ptr %var_A, i64 20, !dbg !15
  %95 = load i8, ptr %94, align 1, !dbg !15
  %96 = icmp eq i8 %95, 2, !dbg !15
  %97 = and i1 %93, %96, !dbg !15
  %98 = and i1 %90, %97, !dbg !15
  br i1 %98, label %assert_end40, label %assert_fail39, !dbg !15, !prof !16

assert_fail39:                                    ; preds = %assert_end38
  %99 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %99(ptr nonnull @.str.1, ptr nonnull @.str.21), !dbg !15
  br label %common.ret, !dbg !15

assert_end40:                                     ; preds = %assert_end38
  %.not146 = icmp eq ptr %batch_norm.var_A.strides, null, !dbg !15
  br i1 %.not146, label %if_end, label %if_then, !dbg !15, !prof !20

if_then:                                          ; preds = %assert_end40
  %100 = mul nsw i32 %W, %H, !dbg !15
  %101 = mul nsw i32 %100, %C, !dbg !15
  %102 = load i64, ptr %batch_norm.var_A.strides, align 8, !dbg !15, !tbaa !77
  %103 = trunc i64 %102 to i32, !dbg !15
  %104 = icmp eq i32 %101, %103, !dbg !15
  %105 = icmp eq i32 %N, 1, !dbg !15
  %106 = or i1 %105, %104, !dbg !15
  %107 = getelementptr inbounds nuw i8, ptr %batch_norm.var_A.strides, i64 8, !dbg !15
  %108 = load i64, ptr %107, align 8, !dbg !15, !tbaa !87
  %109 = trunc i64 %108 to i32, !dbg !15
  %110 = icmp eq i32 %100, %109, !dbg !15
  %111 = icmp eq i32 %C, 1, !dbg !15
  %112 = or i1 %111, %110, !dbg !15
  %113 = getelementptr inbounds nuw i8, ptr %batch_norm.var_A.strides, i64 16, !dbg !15
  %114 = load i64, ptr %113, align 8, !dbg !15, !tbaa !89
  %115 = trunc i64 %114 to i32, !dbg !15
  %116 = icmp eq i32 %W, %115, !dbg !15
  %117 = icmp eq i32 %H, 1, !dbg !15
  %118 = or i1 %117, %116, !dbg !15
  %119 = getelementptr inbounds nuw i8, ptr %batch_norm.var_A.strides, i64 24, !dbg !15
  %120 = load i64, ptr %119, align 8, !dbg !15, !tbaa !92
  %121 = and i64 %120, 4294967295, !dbg !15
  %122 = icmp eq i64 %121, 1, !dbg !15
  %123 = icmp eq i32 %W, 1, !dbg !15
  %124 = or i1 %123, %122, !dbg !15
  %125 = and i1 %118, %124, !dbg !15
  %126 = and i1 %112, %125, !dbg !15
  %127 = and i1 %106, %126, !dbg !15
  br i1 %127, label %if_end, label %assert_fail41, !dbg !15, !prof !16

if_end:                                           ; preds = %if_then, %assert_end40
  %128 = getelementptr inbounds nuw i8, ptr %var_A, i64 40, !dbg !15
  %129 = load i64, ptr %128, align 8, !dbg !15
  %130 = icmp eq i64 %129, 0, !dbg !15
  br i1 %130, label %assert_end44, label %assert_fail43, !dbg !15, !prof !16

assert_fail41:                                    ; preds = %if_then
  %131 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %131(ptr nonnull @.str.1, ptr nonnull @.str.22), !dbg !15
  br label %common.ret, !dbg !15

assert_fail43:                                    ; preds = %if_end
  %132 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %132(ptr nonnull @.str.1, ptr nonnull @.str.23), !dbg !15
  br label %common.ret, !dbg !15

assert_end44:                                     ; preds = %if_end
  %133 = getelementptr inbounds nuw i8, ptr %var_A, i64 8, !dbg !15
  %134 = load i32, ptr %133, align 4, !dbg !15
  %135 = icmp eq i32 %134, 1, !dbg !15
  br i1 %135, label %assert_end46, label %assert_fail45, !dbg !15, !prof !16

assert_fail45:                                    ; preds = %assert_end44
  %136 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %136(ptr nonnull @.str.1, ptr nonnull @.str.24), !dbg !15
  br label %common.ret, !dbg !15

assert_end46:                                     ; preds = %assert_end44
  %137 = icmp ne ptr %A, null, !dbg !15
  %138 = mul i32 %W, %H, !dbg !15
  %139 = mul i32 %138, %N, !dbg !15
  %140 = mul i32 %139, %C, !dbg !15
  %141 = icmp eq i32 %140, 0, !dbg !15
  %142 = or i1 %141, %137, !dbg !15
  br i1 %142, label %assert_end48, label %assert_fail47, !dbg !15, !prof !16

assert_fail47:                                    ; preds = %assert_end46
  %143 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %143(ptr nonnull @.str.1, ptr nonnull @.str.25), !dbg !15
  br label %common.ret, !dbg !15

assert_end48:                                     ; preds = %assert_end46
  %144 = getelementptr inbounds nuw i8, ptr %var_gamma, i64 22, !dbg !15
  %145 = load i16, ptr %144, align 2, !dbg !15
  %146 = icmp eq i16 %145, 1, !dbg !15
  %147 = getelementptr inbounds nuw i8, ptr %var_gamma, i64 21, !dbg !15
  %148 = load i8, ptr %147, align 1, !dbg !15
  %149 = icmp eq i8 %148, 32, !dbg !15
  %150 = getelementptr inbounds nuw i8, ptr %var_gamma, i64 20, !dbg !15
  %151 = load i8, ptr %150, align 1, !dbg !15
  %152 = icmp eq i8 %151, 2, !dbg !15
  %153 = and i1 %149, %152, !dbg !15
  %154 = and i1 %146, %153, !dbg !15
  br i1 %154, label %assert_end50, label %assert_fail49, !dbg !15, !prof !16

assert_fail49:                                    ; preds = %assert_end48
  %155 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %155(ptr nonnull @.str.1, ptr nonnull @.str.26), !dbg !15
  br label %common.ret, !dbg !15

assert_end50:                                     ; preds = %assert_end48
  %156 = load i64, ptr %batch_norm.var_gamma.shape, align 8, !dbg !15, !tbaa !94
  %157 = trunc i64 %156 to i32, !dbg !15
  %158 = icmp eq i32 %C, %157, !dbg !15
  br i1 %158, label %assert_end52, label %assert_fail51, !dbg !15, !prof !16

assert_fail51:                                    ; preds = %assert_end50
  %159 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %159(ptr nonnull @.str.1, ptr nonnull @.str.27), !dbg !15
  br label %common.ret, !dbg !15

assert_end52:                                     ; preds = %assert_end50
  %.not147 = icmp eq ptr %batch_norm.var_gamma.strides, null, !dbg !15
  br i1 %.not147, label %if_end54, label %if_then53, !dbg !15, !prof !20

if_then53:                                        ; preds = %assert_end52
  %160 = load i64, ptr %batch_norm.var_gamma.strides, align 8, !dbg !15, !tbaa !104
  %161 = and i64 %160, 4294967295, !dbg !15
  %162 = icmp eq i64 %161, 1, !dbg !15
  %163 = icmp eq i32 %C, 1, !dbg !15
  %164 = or i1 %163, %162, !dbg !15
  br i1 %164, label %if_end54, label %assert_fail55, !dbg !15, !prof !16

if_end54:                                         ; preds = %if_then53, %assert_end52
  %165 = getelementptr inbounds nuw i8, ptr %var_gamma, i64 40, !dbg !15
  %166 = load i64, ptr %165, align 8, !dbg !15
  %167 = icmp eq i64 %166, 0, !dbg !15
  br i1 %167, label %assert_end58, label %assert_fail57, !dbg !15, !prof !16

assert_fail55:                                    ; preds = %if_then53
  %168 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %168(ptr nonnull @.str.1, ptr nonnull @.str.28), !dbg !15
  br label %common.ret, !dbg !15

assert_fail57:                                    ; preds = %if_end54
  %169 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %169(ptr nonnull @.str.1, ptr nonnull @.str.29), !dbg !15
  br label %common.ret, !dbg !15

assert_end58:                                     ; preds = %if_end54
  %170 = getelementptr inbounds nuw i8, ptr %var_gamma, i64 8, !dbg !15
  %171 = load i32, ptr %170, align 4, !dbg !15
  %172 = icmp eq i32 %171, 1, !dbg !15
  br i1 %172, label %assert_end60, label %assert_fail59, !dbg !15, !prof !16

assert_fail59:                                    ; preds = %assert_end58
  %173 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %173(ptr nonnull @.str.1, ptr nonnull @.str.30), !dbg !15
  br label %common.ret, !dbg !15

assert_end60:                                     ; preds = %assert_end58
  %174 = getelementptr inbounds nuw i8, ptr %var_gamma, i64 12, !dbg !15
  %175 = load i32, ptr %174, align 4, !dbg !15
  %176 = icmp eq i32 %dev_id, %175, !dbg !15
  br i1 %176, label %assert_end62, label %assert_fail61, !dbg !15, !prof !16

assert_fail61:                                    ; preds = %assert_end60
  %177 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %177(ptr nonnull @.str.1, ptr nonnull @.str.31), !dbg !15
  br label %common.ret, !dbg !15

assert_end62:                                     ; preds = %assert_end60
  %178 = icmp ne ptr %gamma, null, !dbg !15
  %179 = icmp eq i32 %C, 0, !dbg !15
  %180 = or i1 %179, %178, !dbg !15
  br i1 %180, label %assert_end64, label %assert_fail63, !dbg !15, !prof !16

assert_fail63:                                    ; preds = %assert_end62
  %181 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %181(ptr nonnull @.str.1, ptr nonnull @.str.32), !dbg !15
  br label %common.ret, !dbg !15

assert_end64:                                     ; preds = %assert_end62
  %182 = getelementptr inbounds nuw i8, ptr %var_beta, i64 22, !dbg !15
  %183 = load i16, ptr %182, align 2, !dbg !15
  %184 = icmp eq i16 %183, 1, !dbg !15
  %185 = getelementptr inbounds nuw i8, ptr %var_beta, i64 21, !dbg !15
  %186 = load i8, ptr %185, align 1, !dbg !15
  %187 = icmp eq i8 %186, 32, !dbg !15
  %188 = getelementptr inbounds nuw i8, ptr %var_beta, i64 20, !dbg !15
  %189 = load i8, ptr %188, align 1, !dbg !15
  %190 = icmp eq i8 %189, 2, !dbg !15
  %191 = and i1 %187, %190, !dbg !15
  %192 = and i1 %184, %191, !dbg !15
  br i1 %192, label %assert_end66, label %assert_fail65, !dbg !15, !prof !16

assert_fail65:                                    ; preds = %assert_end64
  %193 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %193(ptr nonnull @.str.1, ptr nonnull @.str.33), !dbg !15
  br label %common.ret, !dbg !15

assert_end66:                                     ; preds = %assert_end64
  %194 = load i64, ptr %batch_norm.var_beta.shape, align 8, !dbg !15, !tbaa !114
  %195 = trunc i64 %194 to i32, !dbg !15
  %196 = icmp eq i32 %C, %195, !dbg !15
  br i1 %196, label %assert_end68, label %assert_fail67, !dbg !15, !prof !16

assert_fail67:                                    ; preds = %assert_end66
  %197 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %197(ptr nonnull @.str.1, ptr nonnull @.str.34), !dbg !15
  br label %common.ret, !dbg !15

assert_end68:                                     ; preds = %assert_end66
  %.not148 = icmp eq ptr %batch_norm.var_beta.strides, null, !dbg !15
  br i1 %.not148, label %if_end70, label %if_then69, !dbg !15, !prof !20

if_then69:                                        ; preds = %assert_end68
  %198 = load i64, ptr %batch_norm.var_beta.strides, align 8, !dbg !15, !tbaa !124
  %199 = and i64 %198, 4294967295, !dbg !15
  %200 = icmp eq i64 %199, 1, !dbg !15
  %201 = icmp eq i32 %C, 1, !dbg !15
  %202 = or i1 %201, %200, !dbg !15
  br i1 %202, label %if_end70, label %assert_fail71, !dbg !15, !prof !16

if_end70:                                         ; preds = %if_then69, %assert_end68
  %203 = getelementptr inbounds nuw i8, ptr %var_beta, i64 40, !dbg !15
  %204 = load i64, ptr %203, align 8, !dbg !15
  %205 = icmp eq i64 %204, 0, !dbg !15
  br i1 %205, label %assert_end74, label %assert_fail73, !dbg !15, !prof !16

assert_fail71:                                    ; preds = %if_then69
  %206 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %206(ptr nonnull @.str.1, ptr nonnull @.str.35), !dbg !15
  br label %common.ret, !dbg !15

assert_fail73:                                    ; preds = %if_end70
  %207 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %207(ptr nonnull @.str.1, ptr nonnull @.str.36), !dbg !15
  br label %common.ret, !dbg !15

assert_end74:                                     ; preds = %if_end70
  %208 = getelementptr inbounds nuw i8, ptr %var_beta, i64 8, !dbg !15
  %209 = load i32, ptr %208, align 4, !dbg !15
  %210 = icmp eq i32 %209, 1, !dbg !15
  br i1 %210, label %assert_end76, label %assert_fail75, !dbg !15, !prof !16

assert_fail75:                                    ; preds = %assert_end74
  %211 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %211(ptr nonnull @.str.1, ptr nonnull @.str.37), !dbg !15
  br label %common.ret, !dbg !15

assert_end76:                                     ; preds = %assert_end74
  %212 = getelementptr inbounds nuw i8, ptr %var_beta, i64 12, !dbg !15
  %213 = load i32, ptr %212, align 4, !dbg !15
  %214 = icmp eq i32 %dev_id, %213, !dbg !15
  br i1 %214, label %assert_end78, label %assert_fail77, !dbg !15, !prof !16

assert_fail77:                                    ; preds = %assert_end76
  %215 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %215(ptr nonnull @.str.1, ptr nonnull @.str.38), !dbg !15
  br label %common.ret, !dbg !15

assert_end78:                                     ; preds = %assert_end76
  %216 = icmp ne ptr %beta, null, !dbg !15
  %217 = or i1 %179, %216, !dbg !15
  br i1 %217, label %assert_end80, label %assert_fail79, !dbg !15, !prof !16

assert_fail79:                                    ; preds = %assert_end78
  %218 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %218(ptr nonnull @.str.1, ptr nonnull @.str.39), !dbg !15
  br label %common.ret, !dbg !15

assert_end80:                                     ; preds = %assert_end78
  %219 = getelementptr inbounds nuw i8, ptr %var_moving_mean, i64 22, !dbg !15
  %220 = load i16, ptr %219, align 2, !dbg !15
  %221 = icmp eq i16 %220, 1, !dbg !15
  %222 = getelementptr inbounds nuw i8, ptr %var_moving_mean, i64 21, !dbg !15
  %223 = load i8, ptr %222, align 1, !dbg !15
  %224 = icmp eq i8 %223, 32, !dbg !15
  %225 = getelementptr inbounds nuw i8, ptr %var_moving_mean, i64 20, !dbg !15
  %226 = load i8, ptr %225, align 1, !dbg !15
  %227 = icmp eq i8 %226, 2, !dbg !15
  %228 = and i1 %224, %227, !dbg !15
  %229 = and i1 %221, %228, !dbg !15
  br i1 %229, label %assert_end82, label %assert_fail81, !dbg !15, !prof !16

assert_fail81:                                    ; preds = %assert_end80
  %230 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %230(ptr nonnull @.str.1, ptr nonnull @.str.40), !dbg !15
  br label %common.ret, !dbg !15

assert_end82:                                     ; preds = %assert_end80
  %231 = load i64, ptr %batch_norm.var_moving_mean.shape, align 8, !dbg !15, !tbaa !134
  %232 = trunc i64 %231 to i32, !dbg !15
  %233 = icmp eq i32 %C, %232, !dbg !15
  br i1 %233, label %assert_end84, label %assert_fail83, !dbg !15, !prof !16

assert_fail83:                                    ; preds = %assert_end82
  %234 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %234(ptr nonnull @.str.1, ptr nonnull @.str.41), !dbg !15
  br label %common.ret, !dbg !15

assert_end84:                                     ; preds = %assert_end82
  %.not149 = icmp eq ptr %batch_norm.var_moving_mean.strides, null, !dbg !15
  br i1 %.not149, label %if_end86, label %if_then85, !dbg !15, !prof !20

if_then85:                                        ; preds = %assert_end84
  %235 = load i64, ptr %batch_norm.var_moving_mean.strides, align 8, !dbg !15, !tbaa !144
  %236 = and i64 %235, 4294967295, !dbg !15
  %237 = icmp eq i64 %236, 1, !dbg !15
  %238 = icmp eq i32 %C, 1, !dbg !15
  %239 = or i1 %238, %237, !dbg !15
  br i1 %239, label %if_end86, label %assert_fail87, !dbg !15, !prof !16

if_end86:                                         ; preds = %if_then85, %assert_end84
  %240 = getelementptr inbounds nuw i8, ptr %var_moving_mean, i64 40, !dbg !15
  %241 = load i64, ptr %240, align 8, !dbg !15
  %242 = icmp eq i64 %241, 0, !dbg !15
  br i1 %242, label %assert_end90, label %assert_fail89, !dbg !15, !prof !16

assert_fail87:                                    ; preds = %if_then85
  %243 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %243(ptr nonnull @.str.1, ptr nonnull @.str.42), !dbg !15
  br label %common.ret, !dbg !15

assert_fail89:                                    ; preds = %if_end86
  %244 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %244(ptr nonnull @.str.1, ptr nonnull @.str.43), !dbg !15
  br label %common.ret, !dbg !15

assert_end90:                                     ; preds = %if_end86
  %245 = getelementptr inbounds nuw i8, ptr %var_moving_mean, i64 8, !dbg !15
  %246 = load i32, ptr %245, align 4, !dbg !15
  %247 = icmp eq i32 %246, 1, !dbg !15
  br i1 %247, label %assert_end92, label %assert_fail91, !dbg !15, !prof !16

assert_fail91:                                    ; preds = %assert_end90
  %248 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %248(ptr nonnull @.str.1, ptr nonnull @.str.44), !dbg !15
  br label %common.ret, !dbg !15

assert_end92:                                     ; preds = %assert_end90
  %249 = getelementptr inbounds nuw i8, ptr %var_moving_mean, i64 12, !dbg !15
  %250 = load i32, ptr %249, align 4, !dbg !15
  %251 = icmp eq i32 %dev_id, %250, !dbg !15
  br i1 %251, label %assert_end94, label %assert_fail93, !dbg !15, !prof !16

assert_fail93:                                    ; preds = %assert_end92
  %252 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %252(ptr nonnull @.str.1, ptr nonnull @.str.45), !dbg !15
  br label %common.ret, !dbg !15

assert_end94:                                     ; preds = %assert_end92
  %253 = icmp ne ptr %moving_mean, null, !dbg !15
  %254 = or i1 %179, %253, !dbg !15
  br i1 %254, label %assert_end96, label %assert_fail95, !dbg !15, !prof !16

assert_fail95:                                    ; preds = %assert_end94
  %255 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %255(ptr nonnull @.str.1, ptr nonnull @.str.46), !dbg !15
  br label %common.ret, !dbg !15

assert_end96:                                     ; preds = %assert_end94
  %256 = getelementptr inbounds nuw i8, ptr %var_moving_var, i64 22, !dbg !15
  %257 = load i16, ptr %256, align 2, !dbg !15
  %258 = icmp eq i16 %257, 1, !dbg !15
  %259 = getelementptr inbounds nuw i8, ptr %var_moving_var, i64 21, !dbg !15
  %260 = load i8, ptr %259, align 1, !dbg !15
  %261 = icmp eq i8 %260, 32, !dbg !15
  %262 = getelementptr inbounds nuw i8, ptr %var_moving_var, i64 20, !dbg !15
  %263 = load i8, ptr %262, align 1, !dbg !15
  %264 = icmp eq i8 %263, 2, !dbg !15
  %265 = and i1 %261, %264, !dbg !15
  %266 = and i1 %258, %265, !dbg !15
  br i1 %266, label %assert_end98, label %assert_fail97, !dbg !15, !prof !16

assert_fail97:                                    ; preds = %assert_end96
  %267 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %267(ptr nonnull @.str.1, ptr nonnull @.str.47), !dbg !15
  br label %common.ret, !dbg !15

assert_end98:                                     ; preds = %assert_end96
  %268 = load i64, ptr %batch_norm.var_moving_var.shape, align 8, !dbg !15, !tbaa !154
  %269 = trunc i64 %268 to i32, !dbg !15
  %270 = icmp eq i32 %C, %269, !dbg !15
  br i1 %270, label %assert_end100, label %assert_fail99, !dbg !15, !prof !16

assert_fail99:                                    ; preds = %assert_end98
  %271 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %271(ptr nonnull @.str.1, ptr nonnull @.str.48), !dbg !15
  br label %common.ret, !dbg !15

assert_end100:                                    ; preds = %assert_end98
  %.not150 = icmp eq ptr %batch_norm.var_moving_var.strides, null, !dbg !15
  br i1 %.not150, label %if_end102, label %if_then101, !dbg !15, !prof !20

if_then101:                                       ; preds = %assert_end100
  %272 = load i64, ptr %batch_norm.var_moving_var.strides, align 8, !dbg !15, !tbaa !164
  %273 = and i64 %272, 4294967295, !dbg !15
  %274 = icmp eq i64 %273, 1, !dbg !15
  %275 = icmp eq i32 %C, 1, !dbg !15
  %276 = or i1 %275, %274, !dbg !15
  br i1 %276, label %if_end102, label %assert_fail103, !dbg !15, !prof !16

if_end102:                                        ; preds = %if_then101, %assert_end100
  %277 = getelementptr inbounds nuw i8, ptr %var_moving_var, i64 40, !dbg !15
  %278 = load i64, ptr %277, align 8, !dbg !15
  %279 = icmp eq i64 %278, 0, !dbg !15
  br i1 %279, label %assert_end106, label %assert_fail105, !dbg !15, !prof !16

assert_fail103:                                   ; preds = %if_then101
  %280 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %280(ptr nonnull @.str.1, ptr nonnull @.str.49), !dbg !15
  br label %common.ret, !dbg !15

assert_fail105:                                   ; preds = %if_end102
  %281 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %281(ptr nonnull @.str.1, ptr nonnull @.str.50), !dbg !15
  br label %common.ret, !dbg !15

assert_end106:                                    ; preds = %if_end102
  %282 = getelementptr inbounds nuw i8, ptr %var_moving_var, i64 8, !dbg !15
  %283 = load i32, ptr %282, align 4, !dbg !15
  %284 = icmp eq i32 %283, 1, !dbg !15
  br i1 %284, label %assert_end108, label %assert_fail107, !dbg !15, !prof !16

assert_fail107:                                   ; preds = %assert_end106
  %285 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %285(ptr nonnull @.str.1, ptr nonnull @.str.51), !dbg !15
  br label %common.ret, !dbg !15

assert_end108:                                    ; preds = %assert_end106
  %286 = getelementptr inbounds nuw i8, ptr %var_moving_var, i64 12, !dbg !15
  %287 = load i32, ptr %286, align 4, !dbg !15
  %288 = icmp eq i32 %dev_id, %287, !dbg !15
  br i1 %288, label %assert_end110, label %assert_fail109, !dbg !15, !prof !16

assert_fail109:                                   ; preds = %assert_end108
  %289 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %289(ptr nonnull @.str.1, ptr nonnull @.str.52), !dbg !15
  br label %common.ret, !dbg !15

assert_end110:                                    ; preds = %assert_end108
  %290 = icmp ne ptr %moving_var, null, !dbg !15
  %291 = or i1 %179, %290, !dbg !15
  br i1 %291, label %assert_end112, label %assert_fail111, !dbg !15, !prof !16

assert_fail111:                                   ; preds = %assert_end110
  %292 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %292(ptr nonnull @.str.1, ptr nonnull @.str.53), !dbg !15
  br label %common.ret, !dbg !15

assert_end112:                                    ; preds = %assert_end110
  %293 = getelementptr inbounds nuw i8, ptr %var_T_add, i64 22, !dbg !15
  %294 = load i16, ptr %293, align 2, !dbg !15
  %295 = icmp eq i16 %294, 1, !dbg !15
  %296 = getelementptr inbounds nuw i8, ptr %var_T_add, i64 21, !dbg !15
  %297 = load i8, ptr %296, align 1, !dbg !15
  %298 = icmp eq i8 %297, 32, !dbg !15
  %299 = getelementptr inbounds nuw i8, ptr %var_T_add, i64 20, !dbg !15
  %300 = load i8, ptr %299, align 1, !dbg !15
  %301 = icmp eq i8 %300, 2, !dbg !15
  %302 = and i1 %298, %301, !dbg !15
  %303 = and i1 %295, %302, !dbg !15
  br i1 %303, label %assert_end114, label %assert_fail113, !dbg !15, !prof !16

assert_fail113:                                   ; preds = %assert_end112
  %304 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %304(ptr nonnull @.str.1, ptr nonnull @.str.54), !dbg !15
  br label %common.ret, !dbg !15

assert_end114:                                    ; preds = %assert_end112
  %305 = load i64, ptr %batch_norm.var_T_add.shape, align 8, !dbg !15, !tbaa !174
  %306 = trunc i64 %305 to i32, !dbg !15
  %307 = icmp eq i32 %N, %306, !dbg !15
  br i1 %307, label %assert_end116, label %assert_fail115, !dbg !15, !prof !16

assert_fail115:                                   ; preds = %assert_end114
  %308 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %308(ptr nonnull @.str.1, ptr nonnull @.str.55), !dbg !15
  br label %common.ret, !dbg !15

assert_end116:                                    ; preds = %assert_end114
  %309 = getelementptr inbounds nuw i8, ptr %batch_norm.var_T_add.shape, i64 8, !dbg !15
  %310 = load i64, ptr %309, align 8, !dbg !15, !tbaa !184
  %311 = trunc i64 %310 to i32, !dbg !15
  %312 = icmp eq i32 %C, %311, !dbg !15
  br i1 %312, label %assert_end118, label %assert_fail117, !dbg !15, !prof !16

assert_fail117:                                   ; preds = %assert_end116
  %313 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %313(ptr nonnull @.str.1, ptr nonnull @.str.56), !dbg !15
  br label %common.ret, !dbg !15

assert_end118:                                    ; preds = %assert_end116
  %314 = getelementptr inbounds nuw i8, ptr %batch_norm.var_T_add.shape, i64 16, !dbg !15
  %315 = load i64, ptr %314, align 8, !dbg !15, !tbaa !186
  %316 = trunc i64 %315 to i32, !dbg !15
  %317 = icmp eq i32 %H, %316, !dbg !15
  br i1 %317, label %assert_end120, label %assert_fail119, !dbg !15, !prof !16

assert_fail119:                                   ; preds = %assert_end118
  %318 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %318(ptr nonnull @.str.1, ptr nonnull @.str.57), !dbg !15
  br label %common.ret, !dbg !15

assert_end120:                                    ; preds = %assert_end118
  %319 = getelementptr inbounds nuw i8, ptr %batch_norm.var_T_add.shape, i64 24, !dbg !15
  %320 = load i64, ptr %319, align 8, !dbg !15, !tbaa !189
  %321 = trunc i64 %320 to i32, !dbg !15
  %322 = icmp eq i32 %W, %321, !dbg !15
  br i1 %322, label %assert_end122, label %assert_fail121, !dbg !15, !prof !16

assert_fail121:                                   ; preds = %assert_end120
  %323 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %323(ptr nonnull @.str.1, ptr nonnull @.str.58), !dbg !15
  br label %common.ret, !dbg !15

assert_end122:                                    ; preds = %assert_end120
  %.not151 = icmp eq ptr %batch_norm.var_T_add.strides, null, !dbg !15
  br i1 %.not151, label %if_end124, label %if_then123, !dbg !15, !prof !20

if_then123:                                       ; preds = %assert_end122
  %324 = mul nsw i32 %138, %C, !dbg !15
  %325 = load i64, ptr %batch_norm.var_T_add.strides, align 8, !dbg !15, !tbaa !191
  %326 = trunc i64 %325 to i32, !dbg !15
  %327 = icmp eq i32 %324, %326, !dbg !15
  %328 = icmp eq i32 %N, 1, !dbg !15
  %329 = or i1 %328, %327, !dbg !15
  %330 = getelementptr inbounds nuw i8, ptr %batch_norm.var_T_add.strides, i64 8, !dbg !15
  %331 = load i64, ptr %330, align 8, !dbg !15, !tbaa !201
  %332 = trunc i64 %331 to i32, !dbg !15
  %333 = icmp eq i32 %138, %332, !dbg !15
  %334 = icmp eq i32 %C, 1, !dbg !15
  %335 = or i1 %334, %333, !dbg !15
  %336 = getelementptr inbounds nuw i8, ptr %batch_norm.var_T_add.strides, i64 16, !dbg !15
  %337 = load i64, ptr %336, align 8, !dbg !15, !tbaa !203
  %338 = trunc i64 %337 to i32, !dbg !15
  %339 = icmp eq i32 %W, %338, !dbg !15
  %340 = icmp eq i32 %H, 1, !dbg !15
  %341 = or i1 %340, %339, !dbg !15
  %342 = getelementptr inbounds nuw i8, ptr %batch_norm.var_T_add.strides, i64 24, !dbg !15
  %343 = load i64, ptr %342, align 8, !dbg !15, !tbaa !206
  %344 = and i64 %343, 4294967295, !dbg !15
  %345 = icmp eq i64 %344, 1, !dbg !15
  %346 = icmp eq i32 %W, 1, !dbg !15
  %347 = or i1 %346, %345, !dbg !15
  %348 = and i1 %341, %347, !dbg !15
  %349 = and i1 %335, %348, !dbg !15
  %350 = and i1 %329, %349, !dbg !15
  br i1 %350, label %if_end124, label %assert_fail125, !dbg !15, !prof !16

if_end124:                                        ; preds = %if_then123, %assert_end122
  %351 = getelementptr inbounds nuw i8, ptr %var_T_add, i64 40, !dbg !15
  %352 = load i64, ptr %351, align 8, !dbg !15
  %353 = icmp eq i64 %352, 0, !dbg !15
  br i1 %353, label %assert_end128, label %assert_fail127, !dbg !15, !prof !16

assert_fail125:                                   ; preds = %if_then123
  %354 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %354(ptr nonnull @.str.1, ptr nonnull @.str.59), !dbg !15
  br label %common.ret, !dbg !15

assert_fail127:                                   ; preds = %if_end124
  %355 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %355(ptr nonnull @.str.1, ptr nonnull @.str.60), !dbg !15
  br label %common.ret, !dbg !15

assert_end128:                                    ; preds = %if_end124
  %356 = getelementptr inbounds nuw i8, ptr %var_T_add, i64 8, !dbg !15
  %357 = load i32, ptr %356, align 4, !dbg !15
  %358 = icmp eq i32 %357, 1, !dbg !15
  br i1 %358, label %assert_end130, label %assert_fail129, !dbg !15, !prof !16

assert_fail129:                                   ; preds = %assert_end128
  %359 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %359(ptr nonnull @.str.1, ptr nonnull @.str.61), !dbg !15
  br label %common.ret, !dbg !15

assert_end130:                                    ; preds = %assert_end128
  %360 = getelementptr inbounds nuw i8, ptr %var_T_add, i64 12, !dbg !15
  %361 = load i32, ptr %360, align 4, !dbg !15
  %362 = icmp eq i32 %dev_id, %361, !dbg !15
  br i1 %362, label %assert_end132, label %assert_fail131, !dbg !15, !prof !16

assert_fail131:                                   ; preds = %assert_end130
  %363 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %363(ptr nonnull @.str.1, ptr nonnull @.str.62), !dbg !15
  br label %common.ret, !dbg !15

assert_end132:                                    ; preds = %assert_end130
  %364 = icmp ne ptr %T_add, null, !dbg !15
  %365 = or i1 %141, %364, !dbg !15
  br i1 %365, label %assert_end134, label %assert_fail133, !dbg !15, !prof !16

assert_fail133:                                   ; preds = %assert_end132
  %366 = load ptr, ptr @__TVMFFIErrorSetRaisedFromCStr, align 8, !dbg !15, !tbaa !17
  tail call void %366(ptr nonnull @.str.1, ptr nonnull @.str.63), !dbg !15
  br label %common.ret, !dbg !15

assert_end134:                                    ; preds = %assert_end132
  %367 = tail call fastcc i32 @batch_norm_compute_(i32 %dev_id, i32 %C, i32 %N, i32 %H, i32 %W, ptr %A, ptr %gamma, ptr %beta, ptr %T_add), !dbg !15
  br label %common.ret, !dbg !15
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: noinline
define internal fastcc range(i32 -1, 1) i32 @batch_norm_compute_(i32 %dev_id, i32 %C, i32 %N, i32 %H, i32 %W, ptr noalias nocapture readonly align 64 %A, ptr noalias nocapture readonly align 64 %gamma, ptr noalias nocapture readonly align 64 %beta, ptr noalias nocapture writeonly align 64 %T_add) unnamed_addr #2 !dbg !208 {
entry:
    #dbg_value(i32 %dev_id, !212, !DIExpression(), !221)
    #dbg_value(i32 %C, !213, !DIExpression(), !221)
    #dbg_value(i32 %N, !214, !DIExpression(), !221)
    #dbg_value(i32 %H, !215, !DIExpression(), !221)
    #dbg_value(i32 %W, !216, !DIExpression(), !221)
    #dbg_value(ptr %A, !217, !DIExpression(), !221)
    #dbg_value(ptr %gamma, !218, !DIExpression(), !221)
    #dbg_value(ptr %beta, !219, !DIExpression(), !221)
    #dbg_value(ptr %T_add, !220, !DIExpression(), !221)
  %0 = sext i32 %C to i64, !dbg !221
  %1 = shl nuw nsw i64 %0, 2, !dbg !221
  %2 = load ptr, ptr @__TVMBackendAllocWorkspace, align 8, !dbg !221, !tbaa !17
  %A_red = tail call ptr %2(i32 1, i32 %dev_id, i64 %1, i32 2, i32 32), !dbg !221
    #dbg_declare(ptr %A_red, !222, !DIExpression(), !221)
    #dbg_declare(ptr %A_red, !222, !DIExpression(), !221)
  call void @llvm.assume(i1 true) [ "align"(ptr %A_red, i64 64) ], !dbg !221
  %3 = icmp eq ptr %A_red, null, !dbg !221
  br i1 %3, label %common.ret, label %if_end, !dbg !221, !prof !16

common.ret:                                       ; preds = %if_end161, %if_end158, %if_end155, %for_end_ax0140, %if_end7, %if_end2, %if_end, %entry
  %common.ret.op = phi i32 [ -1, %entry ], [ -1, %if_end ], [ -1, %if_end2 ], [ -1, %if_end7 ], [ -1, %for_end_ax0140 ], [ -1, %if_end155 ], [ -1, %if_end158 ], [ %., %if_end161 ]
  ret i32 %common.ret.op, !dbg !221

if_end:                                           ; preds = %entry
  %4 = mul i32 %H, %N, !dbg !221
  %5 = mul i32 %4, %C, !dbg !221
  %6 = mul nsw i32 %5, %W, !dbg !221
  %7 = sext i32 %6 to i64, !dbg !221
  %8 = shl nuw nsw i64 %7, 2, !dbg !221
  %9 = load ptr, ptr @__TVMBackendAllocWorkspace, align 8, !dbg !221, !tbaa !17
  %T_subtract = tail call ptr %9(i32 1, i32 %dev_id, i64 %8, i32 2, i32 32), !dbg !221
    #dbg_declare(ptr %T_subtract, !223, !DIExpression(), !221)
    #dbg_declare(ptr %T_subtract, !223, !DIExpression(), !221)
  call void @llvm.assume(i1 true) [ "align"(ptr %T_subtract, i64 64) ], !dbg !221
  %10 = icmp eq ptr %T_subtract, null, !dbg !221
  br i1 %10, label %common.ret, label %if_end2, !dbg !221, !prof !16

if_end2:                                          ; preds = %if_end
  %11 = tail call i32 @llvm.smax.i32(i32 %6, i32 %C), !dbg !221
  %12 = sext i32 %11 to i64, !dbg !221
  %13 = shl nuw nsw i64 %12, 2, !dbg !221
  %14 = load ptr, ptr @__TVMBackendAllocWorkspace, align 8, !dbg !221, !tbaa !17
  %T_subtract5 = tail call ptr %14(i32 1, i32 %dev_id, i64 %13, i32 2, i32 32), !dbg !221
    #dbg_declare(ptr %T_subtract5, !223, !DIExpression(), !221)
    #dbg_declare(ptr %T_subtract5, !223, !DIExpression(), !221)
  call void @llvm.assume(i1 true) [ "align"(ptr %T_subtract5, i64 64) ], !dbg !221
  %15 = icmp eq ptr %T_subtract5, null, !dbg !221
  br i1 %15, label %common.ret, label %if_end7, !dbg !221, !prof !16

if_end7:                                          ; preds = %if_end2
  %16 = load ptr, ptr @__TVMBackendAllocWorkspace, align 8, !dbg !221, !tbaa !17
  %T_subtract10 = tail call ptr %16(i32 1, i32 %dev_id, i64 %13, i32 2, i32 32), !dbg !221
    #dbg_declare(ptr %T_subtract10, !223, !DIExpression(), !221)
    #dbg_declare(ptr %T_subtract10, !223, !DIExpression(), !221)
  call void @llvm.assume(i1 true) [ "align"(ptr %T_subtract10, i64 64) ], !dbg !221
  %17 = icmp eq ptr %T_subtract10, null, !dbg !221
  br i1 %17, label %common.ret, label %for_begin_ax0.preheader, !dbg !221, !prof !16

for_begin_ax0.preheader:                          ; preds = %if_end7
    #dbg_declare(i32 0, !224, !DIExpression(), !221)
  %18 = icmp sgt i32 %C, 0, !dbg !221
  br i1 %18, label %for_begin_k0.preheader.lr.ph, label %for_begin_ax020.preheader, !dbg !221, !prof !225

for_begin_k0.preheader.lr.ph:                     ; preds = %for_begin_ax0.preheader
  %19 = icmp slt i32 %N, 1
  %20 = icmp slt i32 %W, 1
  %21 = icmp slt i32 %H, 1
  %or.cond.not577 = select i1 %19, i1 true, i1 %21
  %brmerge = select i1 %or.cond.not577, i1 true, i1 %20
  br i1 %brmerge, label %for_body_ax017.lr.ph, label %for_begin_k0.preheader.us.us.us.preheader, !prof !226

for_begin_k0.preheader.us.us.us.preheader:        ; preds = %for_begin_k0.preheader.lr.ph
  %22 = zext nneg i32 %W to i64, !dbg !221
  %23 = zext nneg i32 %H to i64, !dbg !221
  %wide.trip.count350 = zext nneg i32 %C to i64, !dbg !221
  %wide.trip.count345 = zext nneg i32 %N to i64
  %wide.trip.count340 = zext nneg i32 %H to i64
  %wide.trip.count = zext nneg i32 %W to i64
  %xtraiter = and i64 %wide.trip.count, 1
  %24 = icmp eq i32 %W, 1
  %unroll_iter = and i64 %wide.trip.count, 2147483646
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br label %for_begin_k0.preheader.us.us.us, !dbg !221

for_begin_k0.preheader.us.us.us:                  ; preds = %for_begin_k0.preheader.us.us.us.preheader, %for_begin_k0.for_end_k0_crit_edge.split.us.split.us.us.us.us
  %indvars.iv347 = phi i64 [ 0, %for_begin_k0.preheader.us.us.us.preheader ], [ %indvars.iv.next348, %for_begin_k0.for_end_k0_crit_edge.split.us.split.us.us.us.us ]
    #dbg_declare(i64 %indvars.iv347, !224, !DIExpression(), !221)
    #dbg_declare(i32 0, !227, !DIExpression(), !221)
  %25 = getelementptr inbounds nuw float, ptr %A_red, i64 %indvars.iv347
  %.promoted.us.us.us = load float, ptr %25, align 4, !tbaa !228
  br label %for_begin_k2.preheader.us.us.us.us.us, !dbg !221

for_begin_k2.preheader.us.us.us.us.us:            ; preds = %for_begin_k2.for_end_k2_crit_edge.split.us.us.us.us.us.us, %for_begin_k0.preheader.us.us.us
  %indvars.iv342 = phi i64 [ %indvars.iv.next343, %for_begin_k2.for_end_k2_crit_edge.split.us.us.us.us.us.us ], [ 0, %for_begin_k0.preheader.us.us.us ]
  %.lcssa.us.lcssa.us.us178.us.us.us = phi float [ %.lcssa727, %for_begin_k2.for_end_k2_crit_edge.split.us.us.us.us.us.us ], [ %.promoted.us.us.us, %for_begin_k0.preheader.us.us.us ]
    #dbg_declare(i64 %indvars.iv342, !227, !DIExpression(), !221)
    #dbg_declare(i32 0, !230, !DIExpression(), !221)
  %26 = mul nuw nsw i64 %indvars.iv342, %0
  %27 = add nuw nsw i64 %26, %indvars.iv347
  %28 = mul nuw nsw i64 %27, %23
  br label %for_begin_k3.preheader.us.us.us.us.us.us, !dbg !221

for_begin_k3.preheader.us.us.us.us.us.us:         ; preds = %for_begin_k3.for_end_k3_crit_edge.us.us.us.us.us.us, %for_begin_k2.preheader.us.us.us.us.us
  %indvars.iv337 = phi i64 [ %indvars.iv.next338, %for_begin_k3.for_end_k3_crit_edge.us.us.us.us.us.us ], [ 0, %for_begin_k2.preheader.us.us.us.us.us ]
  %.lcssa.us171.us.us.us.us.us = phi float [ %.lcssa727, %for_begin_k3.for_end_k3_crit_edge.us.us.us.us.us.us ], [ %.lcssa.us.lcssa.us.us178.us.us.us, %for_begin_k2.preheader.us.us.us.us.us ]
    #dbg_declare(i64 %indvars.iv337, !230, !DIExpression(), !221)
    #dbg_declare(i32 0, !231, !DIExpression(), !221)
  %29 = or i64 %indvars.iv337, %indvars.iv342
  %30 = add nuw nsw i64 %indvars.iv337, %28
  %31 = mul nuw nsw i64 %30, %22
  %invariant.gep = getelementptr float, ptr %A, i64 %31, !dbg !221
  br i1 %24, label %for_begin_k3.for_end_k3_crit_edge.us.us.us.us.us.us.unr-lcssa, label %for_body_k3.us.us.us.us.us.us, !dbg !221, !prof !232

for_body_k3.us.us.us.us.us.us:                    ; preds = %for_begin_k3.preheader.us.us.us.us.us.us, %for_body_k3.us.us.us.us.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for_body_k3.us.us.us.us.us.us ], [ 0, %for_begin_k3.preheader.us.us.us.us.us.us ]
  %32 = phi float [ %40, %for_body_k3.us.us.us.us.us.us ], [ %.lcssa.us171.us.us.us.us.us, %for_begin_k3.preheader.us.us.us.us.us.us ]
  %niter = phi i64 [ %niter.next.1, %for_body_k3.us.us.us.us.us.us ], [ 0, %for_begin_k3.preheader.us.us.us.us.us.us ]
    #dbg_declare(i64 %indvars.iv, !231, !DIExpression(), !221)
  %33 = or i64 %29, %indvars.iv, !dbg !221
  %34 = and i64 %33, 4294967295, !dbg !221
  %35 = icmp eq i64 %34, 0, !dbg !221
  %36 = select i1 %35, float 0.000000e+00, float %32, !dbg !221, !prof !16
  %gep = getelementptr float, ptr %invariant.gep, i64 %indvars.iv, !dbg !221
  %37 = load float, ptr %gep, align 4, !dbg !221, !tbaa !233
  %38 = fadd float %37, %36, !dbg !221
  %indvars.iv.next = or disjoint i64 %indvars.iv, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next, !231, !DIExpression(), !221)
    #dbg_declare(i64 %indvars.iv.next, !231, !DIExpression(), !221)
  %gep.1 = getelementptr float, ptr %invariant.gep, i64 %indvars.iv.next, !dbg !221
  %39 = load float, ptr %gep.1, align 4, !dbg !221, !tbaa !233
  %40 = fadd float %39, %38, !dbg !221
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2, !dbg !221
    #dbg_declare(i64 %indvars.iv.next.1, !231, !DIExpression(), !221)
  %niter.next.1 = add i64 %niter, 2, !dbg !221
  %niter.ncmp.1 = icmp eq i64 %niter.next.1, %unroll_iter, !dbg !221
  br i1 %niter.ncmp.1, label %for_begin_k3.for_end_k3_crit_edge.us.us.us.us.us.us.unr-lcssa, label %for_body_k3.us.us.us.us.us.us, !dbg !221, !prof !235

for_begin_k3.for_end_k3_crit_edge.us.us.us.us.us.us.unr-lcssa: ; preds = %for_body_k3.us.us.us.us.us.us, %for_begin_k3.preheader.us.us.us.us.us.us
  %.lcssa727.ph = phi float [ poison, %for_begin_k3.preheader.us.us.us.us.us.us ], [ %40, %for_body_k3.us.us.us.us.us.us ]
  %indvars.iv.unr = phi i64 [ 0, %for_begin_k3.preheader.us.us.us.us.us.us ], [ %indvars.iv.next.1, %for_body_k3.us.us.us.us.us.us ]
  %.unr = phi float [ %.lcssa.us171.us.us.us.us.us, %for_begin_k3.preheader.us.us.us.us.us.us ], [ %40, %for_body_k3.us.us.us.us.us.us ]
  br i1 %lcmp.mod.not, label %for_begin_k3.for_end_k3_crit_edge.us.us.us.us.us.us, label %for_body_k3.us.us.us.us.us.us.epil, !dbg !221, !prof !236

for_body_k3.us.us.us.us.us.us.epil:               ; preds = %for_begin_k3.for_end_k3_crit_edge.us.us.us.us.us.us.unr-lcssa
    #dbg_declare(i64 %indvars.iv.unr, !231, !DIExpression(), !221)
  %41 = or i64 %29, %indvars.iv.unr, !dbg !221
  %42 = and i64 %41, 4294967295, !dbg !221
  %43 = icmp eq i64 %42, 0, !dbg !221
  %44 = select i1 %43, float 0.000000e+00, float %.unr, !dbg !221, !prof !16
  %gep.epil = getelementptr float, ptr %invariant.gep, i64 %indvars.iv.unr, !dbg !221
  %45 = load float, ptr %gep.epil, align 4, !dbg !221, !tbaa !233
  %46 = fadd float %45, %44, !dbg !221
    #dbg_declare(i64 %indvars.iv.unr, !231, !DIExpression(DW_OP_plus_uconst, 1), !221)
  br label %for_begin_k3.for_end_k3_crit_edge.us.us.us.us.us.us, !dbg !221

for_begin_k3.for_end_k3_crit_edge.us.us.us.us.us.us: ; preds = %for_begin_k3.for_end_k3_crit_edge.us.us.us.us.us.us.unr-lcssa, %for_body_k3.us.us.us.us.us.us.epil
  %.lcssa727 = phi float [ %.lcssa727.ph, %for_begin_k3.for_end_k3_crit_edge.us.us.us.us.us.us.unr-lcssa ], [ %46, %for_body_k3.us.us.us.us.us.us.epil ], !dbg !221
  %indvars.iv.next338 = add nuw nsw i64 %indvars.iv337, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next338, !230, !DIExpression(), !221)
  %exitcond341.not = icmp eq i64 %indvars.iv.next338, %wide.trip.count340, !dbg !221
  br i1 %exitcond341.not, label %for_begin_k2.for_end_k2_crit_edge.split.us.us.us.us.us.us, label %for_begin_k3.preheader.us.us.us.us.us.us, !dbg !221, !prof !237

for_begin_k2.for_end_k2_crit_edge.split.us.us.us.us.us.us: ; preds = %for_begin_k3.for_end_k3_crit_edge.us.us.us.us.us.us
  %indvars.iv.next343 = add nuw nsw i64 %indvars.iv342, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next343, !227, !DIExpression(), !221)
  %exitcond346.not = icmp eq i64 %indvars.iv.next343, %wide.trip.count345, !dbg !221
  br i1 %exitcond346.not, label %for_begin_k0.for_end_k0_crit_edge.split.us.split.us.us.us.us, label %for_begin_k2.preheader.us.us.us.us.us, !dbg !221, !prof !237

for_begin_k0.for_end_k0_crit_edge.split.us.split.us.us.us.us: ; preds = %for_begin_k2.for_end_k2_crit_edge.split.us.us.us.us.us.us
  store float %.lcssa727, ptr %25, align 4, !tbaa !228
  %indvars.iv.next348 = add nuw nsw i64 %indvars.iv347, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next348, !224, !DIExpression(), !221)
  %exitcond351.not = icmp eq i64 %indvars.iv.next348, %wide.trip.count350, !dbg !221
  br i1 %exitcond351.not, label %for_body_ax017.lr.ph, label %for_begin_k0.preheader.us.us.us, !dbg !221, !prof !237

for_body_ax017.lr.ph:                             ; preds = %for_begin_k0.for_end_k0_crit_edge.split.us.split.us.us.us.us, %for_begin_k0.preheader.lr.ph
  %factor.op.mul = mul i32 %H, %W, !dbg !221
  %.reass = mul i32 %factor.op.mul, %N
  %47 = sitofp i32 %.reass to float
  %wide.trip.count355 = zext nneg i32 %C to i64, !dbg !221
  %min.iters.check = icmp ult i32 %C, 4, !dbg !221
  br i1 %min.iters.check, label %for_body_ax017.preheader, label %vector.ph, !dbg !221, !prof !232

vector.ph:                                        ; preds = %for_body_ax017.lr.ph
  %n.vec = and i64 %wide.trip.count355, 2147483644, !dbg !221
  %broadcast.splatinsert = insertelement <4 x float> poison, float %47, i64 0, !dbg !221
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer, !dbg !221
  br label %vector.body, !dbg !221

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !221
  %48 = getelementptr inbounds nuw float, ptr %A_red, i64 %index, !dbg !221
  %wide.load = load <4 x float>, ptr %48, align 16, !dbg !221, !tbaa !228
  %49 = fdiv <4 x float> %wide.load, %broadcast.splat, !dbg !221
  store <4 x float> %49, ptr %48, align 16, !dbg !221, !tbaa !228
  %index.next = add nuw i64 %index, 4, !dbg !221
  %50 = icmp eq i64 %index.next, %n.vec, !dbg !221
  br i1 %50, label %middle.block, label %vector.body, !dbg !221, !prof !238, !llvm.loop !239

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count355, !dbg !221
  br i1 %cmp.n, label %for_begin_ax020.preheader, label %for_body_ax017.preheader, !dbg !221, !prof !242

for_body_ax017.preheader:                         ; preds = %for_body_ax017.lr.ph, %middle.block
  %indvars.iv352.ph = phi i64 [ 0, %for_body_ax017.lr.ph ], [ %n.vec, %middle.block ]
  br label %for_body_ax017, !dbg !221

for_begin_ax020.preheader:                        ; preds = %for_body_ax017, %middle.block, %for_begin_ax0.preheader
    #dbg_declare(i32 0, !224, !DIExpression(), !221)
  %51 = icmp slt i32 %N, 1, !dbg !221
  br i1 %51, label %for_begin_ax072.preheader, label %for_begin_ax1.preheader.lr.ph, !dbg !221, !prof !232

for_begin_ax1.preheader.lr.ph:                    ; preds = %for_begin_ax020.preheader
  %52 = icmp sgt i32 %W, 0
  br i1 %18, label %for_begin_ax1.preheader.lr.ph.split.us, label %for_begin_ax1102.preheader.lr.ph, !prof !225

for_begin_ax1.preheader.lr.ph.split.us:           ; preds = %for_begin_ax1.preheader.lr.ph
  %53 = icmp slt i32 %H, 1
  br i1 %53, label %for_begin_ax128.preheader.us.preheader, label %for_begin_ax1.preheader.us.us.preheader, !prof !232

for_begin_ax1.preheader.us.us.preheader:          ; preds = %for_begin_ax1.preheader.lr.ph.split.us
  %54 = sext i32 %W to i64
  %55 = zext nneg i32 %H to i64
  %wide.trip.count375 = zext nneg i32 %N to i64, !dbg !221
  %wide.trip.count370 = zext nneg i32 %C to i64
  %wide.trip.count365 = zext nneg i32 %H to i64
  %wide.trip.count360 = zext i32 %W to i64
  %min.iters.check584 = icmp ult i32 %W, 8
  %n.vec587 = and i64 %wide.trip.count360, 2147483640
  %cmp.n595 = icmp eq i64 %n.vec587, %wide.trip.count360
  br label %for_begin_ax1.preheader.us.us

for_begin_ax1.preheader.us.us:                    ; preds = %for_begin_ax1.preheader.us.us.preheader, %for_begin_ax1.for_end_ax1_crit_edge.split.us.us.us
  %indvars.iv372 = phi i64 [ 0, %for_begin_ax1.preheader.us.us.preheader ], [ %indvars.iv.next373, %for_begin_ax1.for_end_ax1_crit_edge.split.us.us.us ]
    #dbg_declare(i64 %indvars.iv372, !224, !DIExpression(), !221)
    #dbg_declare(i32 0, !243, !DIExpression(), !221)
  %56 = mul nuw nsw i64 %indvars.iv372, %0
  br i1 %52, label %for_begin_ax2.preheader.us.us.us.us, label %for_begin_ax1.for_end_ax1_crit_edge.split.us.us.us, !prof !225

for_begin_ax1.for_end_ax1_crit_edge.split.us.us.us: ; preds = %for_begin_ax2.for_end_ax2_crit_edge.split.us.us.us.us.us, %for_begin_ax1.preheader.us.us
  %indvars.iv.next373 = add nuw nsw i64 %indvars.iv372, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next373, !224, !DIExpression(), !221)
  %exitcond376.not = icmp eq i64 %indvars.iv.next373, %wide.trip.count375, !dbg !221
  br i1 %exitcond376.not, label %for_begin_ax128.preheader.us.preheader, label %for_begin_ax1.preheader.us.us, !dbg !221, !prof !237

for_begin_ax2.preheader.us.us.us.us:              ; preds = %for_begin_ax1.preheader.us.us, %for_begin_ax2.for_end_ax2_crit_edge.split.us.us.us.us.us
  %indvars.iv367 = phi i64 [ %indvars.iv.next368, %for_begin_ax2.for_end_ax2_crit_edge.split.us.us.us.us.us ], [ 0, %for_begin_ax1.preheader.us.us ]
    #dbg_declare(i64 %indvars.iv367, !243, !DIExpression(), !221)
    #dbg_declare(i32 0, !244, !DIExpression(), !221)
  %57 = getelementptr inbounds nuw float, ptr %A_red, i64 %indvars.iv367
  %58 = add nuw nsw i64 %indvars.iv367, %56
  %59 = mul nuw nsw i64 %58, %55
  %60 = load float, ptr %57, align 4, !tbaa !228
  %broadcast.splatinsert592 = insertelement <4 x float> poison, float %60, i64 0
  %broadcast.splat593 = shufflevector <4 x float> %broadcast.splatinsert592, <4 x float> poison, <4 x i32> zeroinitializer
  br label %for_begin_ax3.preheader.us.us.us.us.us, !dbg !221

for_begin_ax3.preheader.us.us.us.us.us:           ; preds = %for_begin_ax3.for_end_ax3_crit_edge.us.us.us.us.us, %for_begin_ax2.preheader.us.us.us.us
  %indvars.iv362 = phi i64 [ %indvars.iv.next363, %for_begin_ax3.for_end_ax3_crit_edge.us.us.us.us.us ], [ 0, %for_begin_ax2.preheader.us.us.us.us ]
    #dbg_declare(i64 %indvars.iv362, !244, !DIExpression(), !221)
    #dbg_declare(i32 0, !245, !DIExpression(), !221)
  %61 = add nuw nsw i64 %indvars.iv362, %59
  %62 = mul nuw nsw i64 %61, %54
  br i1 %min.iters.check584, label %for_body_ax3.us.us.us.us.us.preheader, label %vector.body588, !dbg !221, !prof !232

vector.body588:                                   ; preds = %for_begin_ax3.preheader.us.us.us.us.us, %vector.body588
  %index589 = phi i64 [ %index.next594, %vector.body588 ], [ 0, %for_begin_ax3.preheader.us.us.us.us.us ], !dbg !221
  %63 = add nuw nsw i64 %index589, %62, !dbg !221
  %64 = getelementptr inbounds float, ptr %A, i64 %63, !dbg !221
  %65 = getelementptr inbounds nuw i8, ptr %64, i64 16, !dbg !221
  %wide.load590 = load <4 x float>, ptr %64, align 4, !dbg !221, !tbaa !233
  %wide.load591 = load <4 x float>, ptr %65, align 4, !dbg !221, !tbaa !233
  %66 = fsub <4 x float> %wide.load590, %broadcast.splat593, !dbg !221
  %67 = fsub <4 x float> %wide.load591, %broadcast.splat593, !dbg !221
  %68 = getelementptr inbounds float, ptr %T_subtract, i64 %63, !dbg !221
  %69 = getelementptr inbounds nuw i8, ptr %68, i64 16, !dbg !221
  store <4 x float> %66, ptr %68, align 4, !dbg !221, !tbaa !246
  store <4 x float> %67, ptr %69, align 4, !dbg !221, !tbaa !246
  %index.next594 = add nuw i64 %index589, 8, !dbg !221
  %70 = icmp eq i64 %index.next594, %n.vec587, !dbg !221
  br i1 %70, label %middle.block582, label %vector.body588, !dbg !221, !prof !248, !llvm.loop !249

middle.block582:                                  ; preds = %vector.body588
  br i1 %cmp.n595, label %for_begin_ax3.for_end_ax3_crit_edge.us.us.us.us.us, label %for_body_ax3.us.us.us.us.us.preheader, !dbg !221, !prof !250

for_body_ax3.us.us.us.us.us.preheader:            ; preds = %for_begin_ax3.preheader.us.us.us.us.us, %middle.block582
  %indvars.iv357.ph = phi i64 [ 0, %for_begin_ax3.preheader.us.us.us.us.us ], [ %n.vec587, %middle.block582 ]
  br label %for_body_ax3.us.us.us.us.us, !dbg !221

for_body_ax3.us.us.us.us.us:                      ; preds = %for_body_ax3.us.us.us.us.us.preheader, %for_body_ax3.us.us.us.us.us
  %indvars.iv357 = phi i64 [ %indvars.iv.next358, %for_body_ax3.us.us.us.us.us ], [ %indvars.iv357.ph, %for_body_ax3.us.us.us.us.us.preheader ]
    #dbg_declare(i64 %indvars.iv357, !245, !DIExpression(), !221)
  %71 = add nuw nsw i64 %indvars.iv357, %62, !dbg !221
  %72 = getelementptr inbounds float, ptr %A, i64 %71, !dbg !221
  %73 = load float, ptr %72, align 4, !dbg !221, !tbaa !233
  %74 = fsub float %73, %60, !dbg !221
  %75 = getelementptr inbounds float, ptr %T_subtract, i64 %71, !dbg !221
  store float %74, ptr %75, align 4, !dbg !221, !tbaa !246
  %indvars.iv.next358 = add nuw nsw i64 %indvars.iv357, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next358, !245, !DIExpression(), !221)
  %exitcond361.not = icmp eq i64 %indvars.iv.next358, %wide.trip.count360, !dbg !221
  br i1 %exitcond361.not, label %for_begin_ax3.for_end_ax3_crit_edge.us.us.us.us.us, label %for_body_ax3.us.us.us.us.us, !dbg !221, !prof !251, !llvm.loop !252

for_begin_ax3.for_end_ax3_crit_edge.us.us.us.us.us: ; preds = %for_body_ax3.us.us.us.us.us, %middle.block582
  %indvars.iv.next363 = add nuw nsw i64 %indvars.iv362, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next363, !244, !DIExpression(), !221)
  %exitcond366.not = icmp eq i64 %indvars.iv.next363, %wide.trip.count365, !dbg !221
  br i1 %exitcond366.not, label %for_begin_ax2.for_end_ax2_crit_edge.split.us.us.us.us.us, label %for_begin_ax3.preheader.us.us.us.us.us, !dbg !221, !prof !237

for_begin_ax2.for_end_ax2_crit_edge.split.us.us.us.us.us: ; preds = %for_begin_ax3.for_end_ax3_crit_edge.us.us.us.us.us
  %indvars.iv.next368 = add nuw nsw i64 %indvars.iv367, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next368, !243, !DIExpression(), !221)
  %exitcond371.not = icmp eq i64 %indvars.iv.next368, %wide.trip.count370, !dbg !221
  br i1 %exitcond371.not, label %for_begin_ax1.for_end_ax1_crit_edge.split.us.us.us, label %for_begin_ax2.preheader.us.us.us.us, !dbg !221, !prof !237

for_body_ax017:                                   ; preds = %for_body_ax017.preheader, %for_body_ax017
  %indvars.iv352 = phi i64 [ %indvars.iv.next353, %for_body_ax017 ], [ %indvars.iv352.ph, %for_body_ax017.preheader ]
    #dbg_declare(i64 %indvars.iv352, !224, !DIExpression(), !221)
  %76 = getelementptr inbounds nuw float, ptr %A_red, i64 %indvars.iv352, !dbg !221
  %77 = load float, ptr %76, align 4, !dbg !221, !tbaa !228
  %78 = fdiv float %77, %47, !dbg !221
  store float %78, ptr %76, align 4, !dbg !221, !tbaa !228
  %indvars.iv.next353 = add nuw nsw i64 %indvars.iv352, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next353, !224, !DIExpression(), !221)
  %exitcond356.not = icmp eq i64 %indvars.iv.next353, %wide.trip.count355, !dbg !221
  br i1 %exitcond356.not, label %for_begin_ax020.preheader, label %for_body_ax017, !dbg !221, !prof !251, !llvm.loop !253

for_begin_ax128.preheader.us.preheader:           ; preds = %for_begin_ax1.for_end_ax1_crit_edge.split.us.us.us, %for_begin_ax1.preheader.lr.ph.split.us
  %79 = icmp slt i32 %W, 1
  %80 = sext i32 %W to i64
  %81 = sext i32 %H to i64
  %wide.trip.count395 = zext nneg i32 %N to i64, !dbg !221
  %wide.trip.count390 = zext nneg i32 %C to i64
  %wide.trip.count385 = zext nneg i32 %H to i64
  %wide.trip.count380 = zext i32 %W to i64
  %brmerge556 = select i1 %53, i1 true, i1 %79
  %min.iters.check599 = icmp ult i32 %W, 8
  %n.vec602 = and i64 %wide.trip.count380, 2147483640
  %cmp.n610 = icmp eq i64 %n.vec602, %wide.trip.count380
  br label %for_begin_ax128.preheader.us

for_begin_ax128.preheader.us:                     ; preds = %for_begin_ax128.preheader.us.preheader, %for_begin_ax128.for_end_ax130_crit_edge.us
  %indvars.iv392 = phi i64 [ 0, %for_begin_ax128.preheader.us.preheader ], [ %indvars.iv.next393, %for_begin_ax128.for_end_ax130_crit_edge.us ]
    #dbg_declare(i64 %indvars.iv392, !224, !DIExpression(), !221)
    #dbg_declare(i32 0, !243, !DIExpression(), !221)
  %82 = mul nuw nsw i64 %indvars.iv392, %0
  br i1 %brmerge556, label %for_begin_ax128.for_end_ax130_crit_edge.us, label %for_begin_ax232.preheader.us.us.us, !prof !254

for_begin_ax128.for_end_ax130_crit_edge.us:       ; preds = %for_begin_ax232.for_end_ax234_crit_edge.split.us.us.us.us, %for_begin_ax128.preheader.us
  %indvars.iv.next393 = add nuw nsw i64 %indvars.iv392, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next393, !224, !DIExpression(), !221)
  %exitcond396.not = icmp eq i64 %indvars.iv.next393, %wide.trip.count395, !dbg !221
  br i1 %exitcond396.not, label %for_begin_ax144.preheader.lr.ph, label %for_begin_ax128.preheader.us, !dbg !221, !prof !237

for_begin_ax232.preheader.us.us.us:               ; preds = %for_begin_ax128.preheader.us, %for_begin_ax232.for_end_ax234_crit_edge.split.us.us.us.us
  %indvars.iv387 = phi i64 [ %indvars.iv.next388, %for_begin_ax232.for_end_ax234_crit_edge.split.us.us.us.us ], [ 0, %for_begin_ax128.preheader.us ]
    #dbg_declare(i64 %indvars.iv387, !243, !DIExpression(), !221)
    #dbg_declare(i32 0, !244, !DIExpression(), !221)
  %83 = getelementptr inbounds nuw float, ptr %A_red, i64 %indvars.iv387
  %84 = add nuw nsw i64 %indvars.iv387, %82
  %85 = mul nuw nsw i64 %84, %81
  %86 = load float, ptr %83, align 4, !tbaa !228
  %broadcast.splatinsert607 = insertelement <4 x float> poison, float %86, i64 0
  %broadcast.splat608 = shufflevector <4 x float> %broadcast.splatinsert607, <4 x float> poison, <4 x i32> zeroinitializer
  br label %for_begin_ax336.preheader.us.us.us.us, !dbg !221

for_begin_ax336.preheader.us.us.us.us:            ; preds = %for_begin_ax336.for_end_ax338_crit_edge.us.us.us.us, %for_begin_ax232.preheader.us.us.us
  %indvars.iv382 = phi i64 [ %indvars.iv.next383, %for_begin_ax336.for_end_ax338_crit_edge.us.us.us.us ], [ 0, %for_begin_ax232.preheader.us.us.us ]
    #dbg_declare(i64 %indvars.iv382, !244, !DIExpression(), !221)
    #dbg_declare(i32 0, !245, !DIExpression(), !221)
  %87 = add nuw nsw i64 %indvars.iv382, %85
  %88 = mul nuw nsw i64 %87, %80
  br i1 %min.iters.check599, label %for_body_ax337.us.us.us.us.preheader, label %vector.body603, !dbg !221, !prof !232

vector.body603:                                   ; preds = %for_begin_ax336.preheader.us.us.us.us, %vector.body603
  %index604 = phi i64 [ %index.next609, %vector.body603 ], [ 0, %for_begin_ax336.preheader.us.us.us.us ], !dbg !221
  %89 = add nuw nsw i64 %index604, %88, !dbg !221
  %90 = getelementptr inbounds float, ptr %A, i64 %89, !dbg !221
  %91 = getelementptr inbounds nuw i8, ptr %90, i64 16, !dbg !221
  %wide.load605 = load <4 x float>, ptr %90, align 4, !dbg !221, !tbaa !233
  %wide.load606 = load <4 x float>, ptr %91, align 4, !dbg !221, !tbaa !233
  %92 = fsub <4 x float> %wide.load605, %broadcast.splat608, !dbg !221
  %93 = fsub <4 x float> %wide.load606, %broadcast.splat608, !dbg !221
  %94 = getelementptr inbounds float, ptr %T_subtract5, i64 %89, !dbg !221
  %95 = getelementptr inbounds nuw i8, ptr %94, i64 16, !dbg !221
  store <4 x float> %92, ptr %94, align 4, !dbg !221, !tbaa !255
  store <4 x float> %93, ptr %95, align 4, !dbg !221, !tbaa !255
  %index.next609 = add nuw i64 %index604, 8, !dbg !221
  %96 = icmp eq i64 %index.next609, %n.vec602, !dbg !221
  br i1 %96, label %middle.block597, label %vector.body603, !dbg !221, !prof !248, !llvm.loop !257

middle.block597:                                  ; preds = %vector.body603
  br i1 %cmp.n610, label %for_begin_ax336.for_end_ax338_crit_edge.us.us.us.us, label %for_body_ax337.us.us.us.us.preheader, !dbg !221, !prof !250

for_body_ax337.us.us.us.us.preheader:             ; preds = %for_begin_ax336.preheader.us.us.us.us, %middle.block597
  %indvars.iv377.ph = phi i64 [ 0, %for_begin_ax336.preheader.us.us.us.us ], [ %n.vec602, %middle.block597 ]
  br label %for_body_ax337.us.us.us.us, !dbg !221

for_body_ax337.us.us.us.us:                       ; preds = %for_body_ax337.us.us.us.us.preheader, %for_body_ax337.us.us.us.us
  %indvars.iv377 = phi i64 [ %indvars.iv.next378, %for_body_ax337.us.us.us.us ], [ %indvars.iv377.ph, %for_body_ax337.us.us.us.us.preheader ]
    #dbg_declare(i64 %indvars.iv377, !245, !DIExpression(), !221)
  %97 = add nuw nsw i64 %indvars.iv377, %88, !dbg !221
  %98 = getelementptr inbounds float, ptr %A, i64 %97, !dbg !221
  %99 = load float, ptr %98, align 4, !dbg !221, !tbaa !233
  %100 = fsub float %99, %86, !dbg !221
  %101 = getelementptr inbounds float, ptr %T_subtract5, i64 %97, !dbg !221
  store float %100, ptr %101, align 4, !dbg !221, !tbaa !255
  %indvars.iv.next378 = add nuw nsw i64 %indvars.iv377, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next378, !245, !DIExpression(), !221)
  %exitcond381.not = icmp eq i64 %indvars.iv.next378, %wide.trip.count380, !dbg !221
  br i1 %exitcond381.not, label %for_begin_ax336.for_end_ax338_crit_edge.us.us.us.us, label %for_body_ax337.us.us.us.us, !dbg !221, !prof !251, !llvm.loop !258

for_begin_ax336.for_end_ax338_crit_edge.us.us.us.us: ; preds = %for_body_ax337.us.us.us.us, %middle.block597
  %indvars.iv.next383 = add nuw nsw i64 %indvars.iv382, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next383, !244, !DIExpression(), !221)
  %exitcond386.not = icmp eq i64 %indvars.iv.next383, %wide.trip.count385, !dbg !221
  br i1 %exitcond386.not, label %for_begin_ax232.for_end_ax234_crit_edge.split.us.us.us.us, label %for_begin_ax336.preheader.us.us.us.us, !dbg !221, !prof !237

for_begin_ax232.for_end_ax234_crit_edge.split.us.us.us.us: ; preds = %for_begin_ax336.for_end_ax338_crit_edge.us.us.us.us
  %indvars.iv.next388 = add nuw nsw i64 %indvars.iv387, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next388, !243, !DIExpression(), !221)
  %exitcond391.not = icmp eq i64 %indvars.iv.next388, %wide.trip.count390, !dbg !221
  br i1 %exitcond391.not, label %for_begin_ax128.for_end_ax130_crit_edge.us, label %for_begin_ax232.preheader.us.us.us, !dbg !221, !prof !237

for_begin_ax144.preheader.lr.ph:                  ; preds = %for_begin_ax128.for_end_ax130_crit_edge.us
    #dbg_declare(i32 0, !224, !DIExpression(), !221)
  %102 = icmp slt i32 %H, 1
  %103 = icmp slt i32 %W, 1
  %104 = sext i32 %W to i64
  %105 = sext i32 %H to i64
  %wide.trip.count415 = zext nneg i32 %N to i64, !dbg !221
  %wide.trip.count410 = zext nneg i32 %C to i64
  %wide.trip.count405 = zext nneg i32 %H to i64
  %wide.trip.count400 = zext nneg i32 %W to i64
  %brmerge559 = select i1 %102, i1 true, i1 %103
  %min.iters.check614 = icmp ult i32 %W, 8
  %n.vec617 = and i64 %wide.trip.count380, 2147483640
  %cmp.n625 = icmp eq i64 %n.vec617, %wide.trip.count380
  br label %for_begin_ax144.preheader.us

for_begin_ax144.preheader.us:                     ; preds = %for_begin_ax144.preheader.lr.ph, %for_begin_ax144.for_end_ax146_crit_edge.us
  %indvars.iv412 = phi i64 [ 0, %for_begin_ax144.preheader.lr.ph ], [ %indvars.iv.next413, %for_begin_ax144.for_end_ax146_crit_edge.us ]
    #dbg_declare(i64 %indvars.iv412, !224, !DIExpression(), !221)
    #dbg_declare(i32 0, !243, !DIExpression(), !221)
  %106 = mul nuw nsw i64 %indvars.iv412, %0
  br i1 %brmerge559, label %for_begin_ax144.for_end_ax146_crit_edge.us, label %for_begin_ax248.preheader.us.us.us, !prof !254

for_begin_ax144.for_end_ax146_crit_edge.us:       ; preds = %for_begin_ax248.for_end_ax250_crit_edge.split.us.us.us.us, %for_begin_ax144.preheader.us
  %indvars.iv.next413 = add nuw nsw i64 %indvars.iv412, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next413, !224, !DIExpression(), !221)
  %exitcond416.not = icmp eq i64 %indvars.iv.next413, %wide.trip.count415, !dbg !221
  br i1 %exitcond416.not, label %for_begin_ax160.preheader.lr.ph, label %for_begin_ax144.preheader.us, !dbg !221, !prof !237

for_begin_ax248.preheader.us.us.us:               ; preds = %for_begin_ax144.preheader.us, %for_begin_ax248.for_end_ax250_crit_edge.split.us.us.us.us
  %indvars.iv407 = phi i64 [ %indvars.iv.next408, %for_begin_ax248.for_end_ax250_crit_edge.split.us.us.us.us ], [ 0, %for_begin_ax144.preheader.us ]
    #dbg_declare(i64 %indvars.iv407, !243, !DIExpression(), !221)
    #dbg_declare(i32 0, !244, !DIExpression(), !221)
  %107 = getelementptr inbounds nuw float, ptr %A_red, i64 %indvars.iv407
  %108 = add nuw nsw i64 %indvars.iv407, %106
  %109 = mul nuw nsw i64 %108, %105
  %110 = load float, ptr %107, align 4, !tbaa !228
  %broadcast.splatinsert622 = insertelement <4 x float> poison, float %110, i64 0
  %broadcast.splat623 = shufflevector <4 x float> %broadcast.splatinsert622, <4 x float> poison, <4 x i32> zeroinitializer
  br label %for_begin_ax352.preheader.us.us.us.us, !dbg !221

for_begin_ax352.preheader.us.us.us.us:            ; preds = %for_begin_ax352.for_end_ax354_crit_edge.us.us.us.us, %for_begin_ax248.preheader.us.us.us
  %indvars.iv402 = phi i64 [ %indvars.iv.next403, %for_begin_ax352.for_end_ax354_crit_edge.us.us.us.us ], [ 0, %for_begin_ax248.preheader.us.us.us ]
    #dbg_declare(i64 %indvars.iv402, !244, !DIExpression(), !221)
    #dbg_declare(i32 0, !245, !DIExpression(), !221)
  %111 = add nuw nsw i64 %indvars.iv402, %109
  %112 = mul nuw nsw i64 %111, %104
  br i1 %min.iters.check614, label %for_body_ax353.us.us.us.us.preheader, label %vector.body618, !dbg !221, !prof !232

vector.body618:                                   ; preds = %for_begin_ax352.preheader.us.us.us.us, %vector.body618
  %index619 = phi i64 [ %index.next624, %vector.body618 ], [ 0, %for_begin_ax352.preheader.us.us.us.us ], !dbg !221
  %113 = add nuw nsw i64 %index619, %112, !dbg !221
  %114 = getelementptr inbounds float, ptr %A, i64 %113, !dbg !221
  %115 = getelementptr inbounds nuw i8, ptr %114, i64 16, !dbg !221
  %wide.load620 = load <4 x float>, ptr %114, align 4, !dbg !221, !tbaa !233
  %wide.load621 = load <4 x float>, ptr %115, align 4, !dbg !221, !tbaa !233
  %116 = fsub <4 x float> %wide.load620, %broadcast.splat623, !dbg !221
  %117 = fsub <4 x float> %wide.load621, %broadcast.splat623, !dbg !221
  %118 = getelementptr inbounds float, ptr %T_subtract10, i64 %113, !dbg !221
  %119 = getelementptr inbounds nuw i8, ptr %118, i64 16, !dbg !221
  store <4 x float> %116, ptr %118, align 4, !dbg !221, !tbaa !259
  store <4 x float> %117, ptr %119, align 4, !dbg !221, !tbaa !259
  %index.next624 = add nuw i64 %index619, 8, !dbg !221
  %120 = icmp eq i64 %index.next624, %n.vec617, !dbg !221
  br i1 %120, label %middle.block612, label %vector.body618, !dbg !221, !prof !248, !llvm.loop !261

middle.block612:                                  ; preds = %vector.body618
  br i1 %cmp.n625, label %for_begin_ax352.for_end_ax354_crit_edge.us.us.us.us, label %for_body_ax353.us.us.us.us.preheader, !dbg !221, !prof !250

for_body_ax353.us.us.us.us.preheader:             ; preds = %for_begin_ax352.preheader.us.us.us.us, %middle.block612
  %indvars.iv397.ph = phi i64 [ 0, %for_begin_ax352.preheader.us.us.us.us ], [ %n.vec617, %middle.block612 ]
  br label %for_body_ax353.us.us.us.us, !dbg !221

for_body_ax353.us.us.us.us:                       ; preds = %for_body_ax353.us.us.us.us.preheader, %for_body_ax353.us.us.us.us
  %indvars.iv397 = phi i64 [ %indvars.iv.next398, %for_body_ax353.us.us.us.us ], [ %indvars.iv397.ph, %for_body_ax353.us.us.us.us.preheader ]
    #dbg_declare(i64 %indvars.iv397, !245, !DIExpression(), !221)
  %121 = add nuw nsw i64 %indvars.iv397, %112, !dbg !221
  %122 = getelementptr inbounds float, ptr %A, i64 %121, !dbg !221
  %123 = load float, ptr %122, align 4, !dbg !221, !tbaa !233
  %124 = fsub float %123, %110, !dbg !221
  %125 = getelementptr inbounds float, ptr %T_subtract10, i64 %121, !dbg !221
  store float %124, ptr %125, align 4, !dbg !221, !tbaa !259
  %indvars.iv.next398 = add nuw nsw i64 %indvars.iv397, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next398, !245, !DIExpression(), !221)
  %exitcond401.not = icmp eq i64 %indvars.iv.next398, %wide.trip.count400, !dbg !221
  br i1 %exitcond401.not, label %for_begin_ax352.for_end_ax354_crit_edge.us.us.us.us, label %for_body_ax353.us.us.us.us, !dbg !221, !prof !251, !llvm.loop !262

for_begin_ax352.for_end_ax354_crit_edge.us.us.us.us: ; preds = %for_body_ax353.us.us.us.us, %middle.block612
  %indvars.iv.next403 = add nuw nsw i64 %indvars.iv402, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next403, !244, !DIExpression(), !221)
  %exitcond406.not = icmp eq i64 %indvars.iv.next403, %wide.trip.count405, !dbg !221
  br i1 %exitcond406.not, label %for_begin_ax248.for_end_ax250_crit_edge.split.us.us.us.us, label %for_begin_ax352.preheader.us.us.us.us, !dbg !221, !prof !237

for_begin_ax248.for_end_ax250_crit_edge.split.us.us.us.us: ; preds = %for_begin_ax352.for_end_ax354_crit_edge.us.us.us.us
  %indvars.iv.next408 = add nuw nsw i64 %indvars.iv407, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next408, !243, !DIExpression(), !221)
  %exitcond411.not = icmp eq i64 %indvars.iv.next408, %wide.trip.count410, !dbg !221
  br i1 %exitcond411.not, label %for_begin_ax144.for_end_ax146_crit_edge.us, label %for_begin_ax248.preheader.us.us.us, !dbg !221, !prof !237

for_begin_ax160.preheader.lr.ph:                  ; preds = %for_begin_ax144.for_end_ax146_crit_edge.us
    #dbg_declare(i32 0, !224, !DIExpression(), !221)
  %126 = icmp slt i32 %H, 1
  %127 = icmp slt i32 %W, 1
  %128 = sext i32 %W to i64
  %129 = sext i32 %H to i64
  %wide.trip.count435 = zext nneg i32 %N to i64, !dbg !221
  %wide.trip.count430 = zext nneg i32 %C to i64
  %wide.trip.count425 = zext nneg i32 %H to i64
  %wide.trip.count420 = zext nneg i32 %W to i64
  %brmerge562 = select i1 %126, i1 true, i1 %127
  %min.iters.check629 = icmp ult i32 %W, 8
  %n.vec632 = and i64 %wide.trip.count380, 2147483640
  %cmp.n640 = icmp eq i64 %n.vec632, %wide.trip.count380
  br label %for_begin_ax160.preheader.us

for_begin_ax160.preheader.us:                     ; preds = %for_begin_ax160.preheader.lr.ph, %for_begin_ax160.for_end_ax162_crit_edge.us
  %indvars.iv432 = phi i64 [ 0, %for_begin_ax160.preheader.lr.ph ], [ %indvars.iv.next433, %for_begin_ax160.for_end_ax162_crit_edge.us ]
    #dbg_declare(i64 %indvars.iv432, !224, !DIExpression(), !221)
    #dbg_declare(i32 0, !243, !DIExpression(), !221)
  %130 = mul nuw nsw i64 %indvars.iv432, %0
  br i1 %brmerge562, label %for_begin_ax160.for_end_ax162_crit_edge.us, label %for_begin_ax264.preheader.us.us.us, !prof !254

for_begin_ax160.for_end_ax162_crit_edge.us:       ; preds = %for_begin_ax264.for_end_ax266_crit_edge.split.us.us.us.us, %for_begin_ax160.preheader.us
  %indvars.iv.next433 = add nuw nsw i64 %indvars.iv432, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next433, !224, !DIExpression(), !221)
  %exitcond436.not = icmp eq i64 %indvars.iv.next433, %wide.trip.count435, !dbg !221
  br i1 %exitcond436.not, label %for_begin_ax072.preheader, label %for_begin_ax160.preheader.us, !dbg !221, !prof !237

for_begin_ax264.preheader.us.us.us:               ; preds = %for_begin_ax160.preheader.us, %for_begin_ax264.for_end_ax266_crit_edge.split.us.us.us.us
  %indvars.iv427 = phi i64 [ %indvars.iv.next428, %for_begin_ax264.for_end_ax266_crit_edge.split.us.us.us.us ], [ 0, %for_begin_ax160.preheader.us ]
    #dbg_declare(i64 %indvars.iv427, !243, !DIExpression(), !221)
    #dbg_declare(i32 0, !244, !DIExpression(), !221)
  %131 = add nuw nsw i64 %indvars.iv427, %130
  %132 = mul nuw nsw i64 %131, %129
  br label %for_begin_ax368.preheader.us.us.us.us, !dbg !221

for_begin_ax368.preheader.us.us.us.us:            ; preds = %for_begin_ax368.for_end_ax370_crit_edge.us.us.us.us, %for_begin_ax264.preheader.us.us.us
  %indvars.iv422 = phi i64 [ %indvars.iv.next423, %for_begin_ax368.for_end_ax370_crit_edge.us.us.us.us ], [ 0, %for_begin_ax264.preheader.us.us.us ]
    #dbg_declare(i64 %indvars.iv422, !244, !DIExpression(), !221)
    #dbg_declare(i32 0, !245, !DIExpression(), !221)
  %133 = add nuw nsw i64 %indvars.iv422, %132
  %134 = mul nuw nsw i64 %133, %128
  br i1 %min.iters.check629, label %for_body_ax369.us.us.us.us.preheader, label %vector.body633, !dbg !221, !prof !232

vector.body633:                                   ; preds = %for_begin_ax368.preheader.us.us.us.us, %vector.body633
  %index634 = phi i64 [ %index.next639, %vector.body633 ], [ 0, %for_begin_ax368.preheader.us.us.us.us ], !dbg !221
  %135 = add nuw nsw i64 %index634, %134, !dbg !221
  %136 = getelementptr inbounds float, ptr %T_subtract10, i64 %135, !dbg !221
  %137 = getelementptr inbounds nuw i8, ptr %136, i64 16, !dbg !221
  %wide.load635 = load <4 x float>, ptr %136, align 4, !dbg !221, !tbaa !259
  %wide.load636 = load <4 x float>, ptr %137, align 4, !dbg !221, !tbaa !259
  %138 = getelementptr inbounds float, ptr %T_subtract5, i64 %135, !dbg !221
  %139 = getelementptr inbounds nuw i8, ptr %138, i64 16, !dbg !221
  %wide.load637 = load <4 x float>, ptr %138, align 4, !dbg !221, !tbaa !255
  %wide.load638 = load <4 x float>, ptr %139, align 4, !dbg !221, !tbaa !255
  %140 = fmul <4 x float> %wide.load635, %wide.load637, !dbg !221
  %141 = fmul <4 x float> %wide.load636, %wide.load638, !dbg !221
  store <4 x float> %140, ptr %138, align 4, !dbg !221, !tbaa !255
  store <4 x float> %141, ptr %139, align 4, !dbg !221, !tbaa !255
  %index.next639 = add nuw i64 %index634, 8, !dbg !221
  %142 = icmp eq i64 %index.next639, %n.vec632, !dbg !221
  br i1 %142, label %middle.block627, label %vector.body633, !dbg !221, !prof !248, !llvm.loop !263

middle.block627:                                  ; preds = %vector.body633
  br i1 %cmp.n640, label %for_begin_ax368.for_end_ax370_crit_edge.us.us.us.us, label %for_body_ax369.us.us.us.us.preheader, !dbg !221, !prof !250

for_body_ax369.us.us.us.us.preheader:             ; preds = %for_begin_ax368.preheader.us.us.us.us, %middle.block627
  %indvars.iv417.ph = phi i64 [ 0, %for_begin_ax368.preheader.us.us.us.us ], [ %n.vec632, %middle.block627 ]
  br label %for_body_ax369.us.us.us.us, !dbg !221

for_body_ax369.us.us.us.us:                       ; preds = %for_body_ax369.us.us.us.us.preheader, %for_body_ax369.us.us.us.us
  %indvars.iv417 = phi i64 [ %indvars.iv.next418, %for_body_ax369.us.us.us.us ], [ %indvars.iv417.ph, %for_body_ax369.us.us.us.us.preheader ]
    #dbg_declare(i64 %indvars.iv417, !245, !DIExpression(), !221)
  %143 = add nuw nsw i64 %indvars.iv417, %134, !dbg !221
  %144 = getelementptr inbounds float, ptr %T_subtract10, i64 %143, !dbg !221
  %145 = load float, ptr %144, align 4, !dbg !221, !tbaa !259
  %146 = getelementptr inbounds float, ptr %T_subtract5, i64 %143, !dbg !221
  %147 = load float, ptr %146, align 4, !dbg !221, !tbaa !255
  %148 = fmul float %145, %147, !dbg !221
  store float %148, ptr %146, align 4, !dbg !221, !tbaa !255
  %indvars.iv.next418 = add nuw nsw i64 %indvars.iv417, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next418, !245, !DIExpression(), !221)
  %exitcond421.not = icmp eq i64 %indvars.iv.next418, %wide.trip.count420, !dbg !221
  br i1 %exitcond421.not, label %for_begin_ax368.for_end_ax370_crit_edge.us.us.us.us, label %for_body_ax369.us.us.us.us, !dbg !221, !prof !251, !llvm.loop !264

for_begin_ax368.for_end_ax370_crit_edge.us.us.us.us: ; preds = %for_body_ax369.us.us.us.us, %middle.block627
  %indvars.iv.next423 = add nuw nsw i64 %indvars.iv422, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next423, !244, !DIExpression(), !221)
  %exitcond426.not = icmp eq i64 %indvars.iv.next423, %wide.trip.count425, !dbg !221
  br i1 %exitcond426.not, label %for_begin_ax264.for_end_ax266_crit_edge.split.us.us.us.us, label %for_begin_ax368.preheader.us.us.us.us, !dbg !221, !prof !237

for_begin_ax264.for_end_ax266_crit_edge.split.us.us.us.us: ; preds = %for_begin_ax368.for_end_ax370_crit_edge.us.us.us.us
  %indvars.iv.next428 = add nuw nsw i64 %indvars.iv427, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next428, !243, !DIExpression(), !221)
  %exitcond431.not = icmp eq i64 %indvars.iv.next428, %wide.trip.count430, !dbg !221
  br i1 %exitcond431.not, label %for_begin_ax160.for_end_ax162_crit_edge.us, label %for_begin_ax264.preheader.us.us.us, !dbg !221, !prof !237

for_begin_ax072.preheader:                        ; preds = %for_begin_ax160.for_end_ax162_crit_edge.us, %for_begin_ax020.preheader
    #dbg_declare(i32 0, !224, !DIExpression(), !221)
  br i1 %18, label %for_begin_k076.preheader.lr.ph, label %for_begin_ax098.preheader, !dbg !221, !prof !265

for_begin_k076.preheader.lr.ph:                   ; preds = %for_begin_ax072.preheader
  %149 = icmp slt i32 %W, 1
  %150 = icmp slt i32 %H, 1
  %or.cond563.not580 = select i1 %51, i1 true, i1 %150
  %brmerge565 = select i1 %or.cond563.not580, i1 true, i1 %149
  br i1 %brmerge565, label %for_body_ax091.lr.ph, label %for_begin_k076.preheader.us.us.us.preheader, !prof !226

for_begin_k076.preheader.us.us.us.preheader:      ; preds = %for_begin_k076.preheader.lr.ph
  %151 = zext nneg i32 %W to i64, !dbg !221
  %152 = zext nneg i32 %H to i64, !dbg !221
  %wide.trip.count455 = zext nneg i32 %C to i64, !dbg !221
  %wide.trip.count450 = zext nneg i32 %N to i64
  %wide.trip.count445 = zext nneg i32 %H to i64
  %wide.trip.count440 = zext nneg i32 %W to i64
  %xtraiter729 = and i64 %wide.trip.count440, 1
  %153 = icmp eq i32 %W, 1
  %unroll_iter733 = and i64 %wide.trip.count440, 2147483646
  %lcmp.mod731.not = icmp eq i64 %xtraiter729, 0
  br label %for_begin_k076.preheader.us.us.us, !dbg !221

for_begin_k076.preheader.us.us.us:                ; preds = %for_begin_k076.preheader.us.us.us.preheader, %for_begin_k076.for_end_k078_crit_edge.split.us.split.us.us.us.us
  %indvars.iv452 = phi i64 [ 0, %for_begin_k076.preheader.us.us.us.preheader ], [ %indvars.iv.next453, %for_begin_k076.for_end_k078_crit_edge.split.us.split.us.us.us.us ]
    #dbg_declare(i64 %indvars.iv452, !224, !DIExpression(), !221)
    #dbg_declare(i32 0, !227, !DIExpression(), !221)
  %154 = getelementptr inbounds nuw float, ptr %A_red, i64 %indvars.iv452
  %.promoted.us.us.us276 = load float, ptr %154, align 4, !tbaa !228
  br label %for_begin_k280.preheader.us.us.us.us.us, !dbg !221

for_begin_k280.preheader.us.us.us.us.us:          ; preds = %for_begin_k280.for_end_k282_crit_edge.split.us.us.us.us.us.us, %for_begin_k076.preheader.us.us.us
  %indvars.iv447 = phi i64 [ %indvars.iv.next448, %for_begin_k280.for_end_k282_crit_edge.split.us.us.us.us.us.us ], [ 0, %for_begin_k076.preheader.us.us.us ]
  %.lcssa.us.lcssa.us.us264.us.us.us = phi float [ %.lcssa, %for_begin_k280.for_end_k282_crit_edge.split.us.us.us.us.us.us ], [ %.promoted.us.us.us276, %for_begin_k076.preheader.us.us.us ]
    #dbg_declare(i64 %indvars.iv447, !227, !DIExpression(), !221)
    #dbg_declare(i32 0, !230, !DIExpression(), !221)
  %155 = mul nuw nsw i64 %indvars.iv447, %0
  %156 = add nuw nsw i64 %155, %indvars.iv452
  %157 = mul nuw nsw i64 %156, %152
  br label %for_begin_k384.preheader.us.us.us.us.us.us, !dbg !221

for_begin_k384.preheader.us.us.us.us.us.us:       ; preds = %for_begin_k384.for_end_k386_crit_edge.us.us.us.us.us.us, %for_begin_k280.preheader.us.us.us.us.us
  %indvars.iv442 = phi i64 [ %indvars.iv.next443, %for_begin_k384.for_end_k386_crit_edge.us.us.us.us.us.us ], [ 0, %for_begin_k280.preheader.us.us.us.us.us ]
  %.lcssa.us257.us.us.us.us.us = phi float [ %.lcssa, %for_begin_k384.for_end_k386_crit_edge.us.us.us.us.us.us ], [ %.lcssa.us.lcssa.us.us264.us.us.us, %for_begin_k280.preheader.us.us.us.us.us ]
    #dbg_declare(i64 %indvars.iv442, !230, !DIExpression(), !221)
    #dbg_declare(i32 0, !231, !DIExpression(), !221)
  %158 = or i64 %indvars.iv442, %indvars.iv447
  %159 = add nuw nsw i64 %indvars.iv442, %157
  %160 = mul nuw nsw i64 %159, %151
  %invariant.gep547 = getelementptr float, ptr %T_subtract5, i64 %160, !dbg !221
  br i1 %153, label %for_begin_k384.for_end_k386_crit_edge.us.us.us.us.us.us.unr-lcssa, label %for_body_k385.us.us.us.us.us.us, !dbg !221, !prof !232

for_body_k385.us.us.us.us.us.us:                  ; preds = %for_begin_k384.preheader.us.us.us.us.us.us, %for_body_k385.us.us.us.us.us.us
  %indvars.iv437 = phi i64 [ %indvars.iv.next438.1, %for_body_k385.us.us.us.us.us.us ], [ 0, %for_begin_k384.preheader.us.us.us.us.us.us ]
  %161 = phi float [ %169, %for_body_k385.us.us.us.us.us.us ], [ %.lcssa.us257.us.us.us.us.us, %for_begin_k384.preheader.us.us.us.us.us.us ]
  %niter734 = phi i64 [ %niter734.next.1, %for_body_k385.us.us.us.us.us.us ], [ 0, %for_begin_k384.preheader.us.us.us.us.us.us ]
    #dbg_declare(i64 %indvars.iv437, !231, !DIExpression(), !221)
  %162 = or i64 %158, %indvars.iv437, !dbg !221
  %163 = and i64 %162, 4294967295, !dbg !221
  %164 = icmp eq i64 %163, 0, !dbg !221
  %165 = select i1 %164, float 0.000000e+00, float %161, !dbg !221, !prof !16
  %gep548 = getelementptr float, ptr %invariant.gep547, i64 %indvars.iv437, !dbg !221
  %166 = load float, ptr %gep548, align 4, !dbg !221, !tbaa !255
  %167 = fadd float %166, %165, !dbg !221
  %indvars.iv.next438 = or disjoint i64 %indvars.iv437, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next438, !231, !DIExpression(), !221)
    #dbg_declare(i64 %indvars.iv.next438, !231, !DIExpression(), !221)
  %gep548.1 = getelementptr float, ptr %invariant.gep547, i64 %indvars.iv.next438, !dbg !221
  %168 = load float, ptr %gep548.1, align 4, !dbg !221, !tbaa !255
  %169 = fadd float %168, %167, !dbg !221
  %indvars.iv.next438.1 = add nuw nsw i64 %indvars.iv437, 2, !dbg !221
    #dbg_declare(i64 %indvars.iv.next438.1, !231, !DIExpression(), !221)
  %niter734.next.1 = add i64 %niter734, 2, !dbg !221
  %niter734.ncmp.1 = icmp eq i64 %niter734.next.1, %unroll_iter733, !dbg !221
  br i1 %niter734.ncmp.1, label %for_begin_k384.for_end_k386_crit_edge.us.us.us.us.us.us.unr-lcssa, label %for_body_k385.us.us.us.us.us.us, !dbg !221, !prof !235

for_begin_k384.for_end_k386_crit_edge.us.us.us.us.us.us.unr-lcssa: ; preds = %for_body_k385.us.us.us.us.us.us, %for_begin_k384.preheader.us.us.us.us.us.us
  %.lcssa.ph = phi float [ poison, %for_begin_k384.preheader.us.us.us.us.us.us ], [ %169, %for_body_k385.us.us.us.us.us.us ]
  %indvars.iv437.unr = phi i64 [ 0, %for_begin_k384.preheader.us.us.us.us.us.us ], [ %indvars.iv.next438.1, %for_body_k385.us.us.us.us.us.us ]
  %.unr730 = phi float [ %.lcssa.us257.us.us.us.us.us, %for_begin_k384.preheader.us.us.us.us.us.us ], [ %169, %for_body_k385.us.us.us.us.us.us ]
  br i1 %lcmp.mod731.not, label %for_begin_k384.for_end_k386_crit_edge.us.us.us.us.us.us, label %for_body_k385.us.us.us.us.us.us.epil, !dbg !221, !prof !236

for_body_k385.us.us.us.us.us.us.epil:             ; preds = %for_begin_k384.for_end_k386_crit_edge.us.us.us.us.us.us.unr-lcssa
    #dbg_declare(i64 %indvars.iv437.unr, !231, !DIExpression(), !221)
  %170 = or i64 %158, %indvars.iv437.unr, !dbg !221
  %171 = and i64 %170, 4294967295, !dbg !221
  %172 = icmp eq i64 %171, 0, !dbg !221
  %173 = select i1 %172, float 0.000000e+00, float %.unr730, !dbg !221, !prof !16
  %gep548.epil = getelementptr float, ptr %invariant.gep547, i64 %indvars.iv437.unr, !dbg !221
  %174 = load float, ptr %gep548.epil, align 4, !dbg !221, !tbaa !255
  %175 = fadd float %174, %173, !dbg !221
    #dbg_declare(i64 %indvars.iv437.unr, !231, !DIExpression(DW_OP_plus_uconst, 1), !221)
  br label %for_begin_k384.for_end_k386_crit_edge.us.us.us.us.us.us, !dbg !221

for_begin_k384.for_end_k386_crit_edge.us.us.us.us.us.us: ; preds = %for_begin_k384.for_end_k386_crit_edge.us.us.us.us.us.us.unr-lcssa, %for_body_k385.us.us.us.us.us.us.epil
  %.lcssa = phi float [ %.lcssa.ph, %for_begin_k384.for_end_k386_crit_edge.us.us.us.us.us.us.unr-lcssa ], [ %175, %for_body_k385.us.us.us.us.us.us.epil ], !dbg !221
  %indvars.iv.next443 = add nuw nsw i64 %indvars.iv442, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next443, !230, !DIExpression(), !221)
  %exitcond446.not = icmp eq i64 %indvars.iv.next443, %wide.trip.count445, !dbg !221
  br i1 %exitcond446.not, label %for_begin_k280.for_end_k282_crit_edge.split.us.us.us.us.us.us, label %for_begin_k384.preheader.us.us.us.us.us.us, !dbg !221, !prof !237

for_begin_k280.for_end_k282_crit_edge.split.us.us.us.us.us.us: ; preds = %for_begin_k384.for_end_k386_crit_edge.us.us.us.us.us.us
  %indvars.iv.next448 = add nuw nsw i64 %indvars.iv447, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next448, !227, !DIExpression(), !221)
  %exitcond451.not = icmp eq i64 %indvars.iv.next448, %wide.trip.count450, !dbg !221
  br i1 %exitcond451.not, label %for_begin_k076.for_end_k078_crit_edge.split.us.split.us.us.us.us, label %for_begin_k280.preheader.us.us.us.us.us, !dbg !221, !prof !237

for_begin_k076.for_end_k078_crit_edge.split.us.split.us.us.us.us: ; preds = %for_begin_k280.for_end_k282_crit_edge.split.us.us.us.us.us.us
  store float %.lcssa, ptr %154, align 4, !tbaa !228
  %indvars.iv.next453 = add nuw nsw i64 %indvars.iv452, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next453, !224, !DIExpression(), !221)
  %exitcond456.not = icmp eq i64 %indvars.iv.next453, %wide.trip.count455, !dbg !221
  br i1 %exitcond456.not, label %for_body_ax091.lr.ph, label %for_begin_k076.preheader.us.us.us, !dbg !221, !prof !237

for_body_ax091.lr.ph:                             ; preds = %for_begin_k076.for_end_k078_crit_edge.split.us.split.us.us.us.us, %for_begin_k076.preheader.lr.ph
  %factor.op.mul280 = mul i32 %H, %W, !dbg !221
  %.reass281 = mul i32 %factor.op.mul280, %N
  %176 = sitofp i32 %.reass281 to float
  %wide.trip.count460 = zext nneg i32 %C to i64, !dbg !221
  %min.iters.check644 = icmp ult i32 %C, 4, !dbg !221
  br i1 %min.iters.check644, label %for_body_ax091.preheader, label %vector.ph645, !dbg !221, !prof !232

vector.ph645:                                     ; preds = %for_body_ax091.lr.ph
  %n.vec647 = and i64 %wide.trip.count460, 2147483644, !dbg !221
  %broadcast.splatinsert651 = insertelement <4 x float> poison, float %176, i64 0, !dbg !221
  %broadcast.splat652 = shufflevector <4 x float> %broadcast.splatinsert651, <4 x float> poison, <4 x i32> zeroinitializer, !dbg !221
  br label %vector.body648, !dbg !221

vector.body648:                                   ; preds = %vector.body648, %vector.ph645
  %index649 = phi i64 [ 0, %vector.ph645 ], [ %index.next653, %vector.body648 ], !dbg !221
  %177 = getelementptr inbounds nuw float, ptr %A_red, i64 %index649, !dbg !221
  %wide.load650 = load <4 x float>, ptr %177, align 16, !dbg !221, !tbaa !228
  %178 = fdiv <4 x float> %wide.load650, %broadcast.splat652, !dbg !221
  store <4 x float> %178, ptr %177, align 16, !dbg !221, !tbaa !228
  %index.next653 = add nuw i64 %index649, 4, !dbg !221
  %179 = icmp eq i64 %index.next653, %n.vec647, !dbg !221
  br i1 %179, label %middle.block642, label %vector.body648, !dbg !221, !prof !238, !llvm.loop !266

middle.block642:                                  ; preds = %vector.body648
  %cmp.n654 = icmp eq i64 %n.vec647, %wide.trip.count460, !dbg !221
  br i1 %cmp.n654, label %for_body_ax195.preheader, label %for_body_ax091.preheader, !dbg !221, !prof !242

for_body_ax091.preheader:                         ; preds = %for_body_ax091.lr.ph, %middle.block642
  %indvars.iv457.ph = phi i64 [ 0, %for_body_ax091.lr.ph ], [ %n.vec647, %middle.block642 ]
  br label %for_body_ax091, !dbg !221

for_body_ax195.preheader:                         ; preds = %for_body_ax091, %middle.block642
    #dbg_declare(i32 0, !243, !DIExpression(), !221)
  %wide.trip.count465 = zext nneg i32 %C to i64, !dbg !221
  %min.iters.check658 = icmp ult i32 %C, 8, !dbg !221
  br i1 %min.iters.check658, label %for_body_ax195.preheader726, label %vector.ph659, !dbg !221, !prof !232

vector.ph659:                                     ; preds = %for_body_ax195.preheader
  %n.vec661 = and i64 %wide.trip.count460, 2147483640, !dbg !221
  br label %vector.body662, !dbg !221

vector.body662:                                   ; preds = %vector.body662, %vector.ph659
  %index663 = phi i64 [ 0, %vector.ph659 ], [ %index.next666, %vector.body662 ], !dbg !221
  %180 = getelementptr inbounds nuw float, ptr %A_red, i64 %index663, !dbg !221
  %181 = getelementptr inbounds nuw i8, ptr %180, i64 16, !dbg !221
  %wide.load664 = load <4 x float>, ptr %180, align 32, !dbg !221, !tbaa !228
  %wide.load665 = load <4 x float>, ptr %181, align 16, !dbg !221, !tbaa !228
  %182 = fadd <4 x float> %wide.load664, splat (float 0x3EE4F8B580000000), !dbg !221
  %183 = fadd <4 x float> %wide.load665, splat (float 0x3EE4F8B580000000), !dbg !221
  store <4 x float> %182, ptr %180, align 32, !dbg !221, !tbaa !228
  store <4 x float> %183, ptr %181, align 16, !dbg !221, !tbaa !228
  %index.next666 = add nuw i64 %index663, 8, !dbg !221
  %184 = icmp eq i64 %index.next666, %n.vec661, !dbg !221
  br i1 %184, label %middle.block656, label %vector.body662, !dbg !221, !prof !248, !llvm.loop !267

middle.block656:                                  ; preds = %vector.body662
  %cmp.n667 = icmp eq i64 %n.vec661, %wide.trip.count460, !dbg !221
  br i1 %cmp.n667, label %for_body_i1.preheader, label %for_body_ax195.preheader726, !dbg !221, !prof !250

for_body_ax195.preheader726:                      ; preds = %for_body_ax195.preheader, %middle.block656
  %indvars.iv462.ph = phi i64 [ 0, %for_body_ax195.preheader ], [ %n.vec661, %middle.block656 ]
  br label %for_body_ax195, !dbg !221

for_body_ax091:                                   ; preds = %for_body_ax091.preheader, %for_body_ax091
  %indvars.iv457 = phi i64 [ %indvars.iv.next458, %for_body_ax091 ], [ %indvars.iv457.ph, %for_body_ax091.preheader ]
    #dbg_declare(i64 %indvars.iv457, !224, !DIExpression(), !221)
  %185 = getelementptr inbounds nuw float, ptr %A_red, i64 %indvars.iv457, !dbg !221
  %186 = load float, ptr %185, align 4, !dbg !221, !tbaa !228
  %187 = fdiv float %186, %176, !dbg !221
  store float %187, ptr %185, align 4, !dbg !221, !tbaa !228
  %indvars.iv.next458 = add nuw nsw i64 %indvars.iv457, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next458, !224, !DIExpression(), !221)
  %exitcond461.not = icmp eq i64 %indvars.iv.next458, %wide.trip.count460, !dbg !221
  br i1 %exitcond461.not, label %for_body_ax195.preheader, label %for_body_ax091, !dbg !221, !prof !251, !llvm.loop !268

for_body_i1.preheader:                            ; preds = %for_body_ax195, %middle.block656
    #dbg_declare(i32 0, !269, !DIExpression(), !221)
  %wide.trip.count470 = zext nneg i32 %C to i64, !dbg !221
  %min.iters.check671 = icmp ult i32 %C, 4, !dbg !221
  br i1 %min.iters.check671, label %for_body_i1.preheader725, label %vector.ph672, !dbg !221, !prof !232

vector.ph672:                                     ; preds = %for_body_i1.preheader
  %n.vec674 = and i64 %wide.trip.count460, 2147483644, !dbg !221
  br label %vector.body675, !dbg !221

vector.body675:                                   ; preds = %vector.body675, %vector.ph672
  %index676 = phi i64 [ 0, %vector.ph672 ], [ %index.next678, %vector.body675 ], !dbg !221
  %188 = getelementptr inbounds nuw float, ptr %A_red, i64 %index676, !dbg !221
  %wide.load677 = load <4 x float>, ptr %188, align 16, !dbg !221, !tbaa !228
  %189 = tail call <4 x float> @llvm.sqrt.v4f32(<4 x float> %wide.load677), !dbg !221
  store <4 x float> %189, ptr %188, align 16, !dbg !221, !tbaa !228
  %index.next678 = add nuw i64 %index676, 4, !dbg !221
  %190 = icmp eq i64 %index.next678, %n.vec674, !dbg !221
  br i1 %190, label %middle.block669, label %vector.body675, !dbg !221, !prof !238, !llvm.loop !270

middle.block669:                                  ; preds = %vector.body675
  %cmp.n679 = icmp eq i64 %n.vec674, %wide.trip.count460, !dbg !221
  br i1 %cmp.n679, label %for_begin_ax098.preheader, label %for_body_i1.preheader725, !dbg !221, !prof !242

for_body_i1.preheader725:                         ; preds = %for_body_i1.preheader, %middle.block669
  %indvars.iv467.ph = phi i64 [ 0, %for_body_i1.preheader ], [ %n.vec674, %middle.block669 ]
  br label %for_body_i1, !dbg !221

for_body_ax195:                                   ; preds = %for_body_ax195.preheader726, %for_body_ax195
  %indvars.iv462 = phi i64 [ %indvars.iv.next463, %for_body_ax195 ], [ %indvars.iv462.ph, %for_body_ax195.preheader726 ]
    #dbg_declare(i64 %indvars.iv462, !243, !DIExpression(), !221)
  %191 = getelementptr inbounds nuw float, ptr %A_red, i64 %indvars.iv462, !dbg !221
  %192 = load float, ptr %191, align 4, !dbg !221, !tbaa !228
  %193 = fadd float %192, 0x3EE4F8B580000000, !dbg !221
  store float %193, ptr %191, align 4, !dbg !221, !tbaa !228
  %indvars.iv.next463 = add nuw nsw i64 %indvars.iv462, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next463, !243, !DIExpression(), !221)
  %exitcond466.not = icmp eq i64 %indvars.iv.next463, %wide.trip.count465, !dbg !221
  br i1 %exitcond466.not, label %for_body_i1.preheader, label %for_body_ax195, !dbg !221, !prof !251, !llvm.loop !271

for_begin_ax098.preheader:                        ; preds = %for_body_i1, %middle.block669, %for_begin_ax072.preheader
    #dbg_declare(i32 0, !224, !DIExpression(), !221)
  br i1 %51, label %for_begin_ax1114.preheader, label %for_begin_ax1102.preheader.lr.ph, !dbg !221, !prof !265

for_begin_ax1102.preheader.lr.ph:                 ; preds = %for_begin_ax1.preheader.lr.ph, %for_begin_ax098.preheader
  %194 = icmp slt i32 %H, 1
  %195 = icmp slt i32 %W, 1
  %196 = sext i32 %W to i64, !dbg !221
  %197 = sext i32 %H to i64, !dbg !221
  %wide.trip.count490 = zext nneg i32 %N to i64, !dbg !221
  %wide.trip.count485 = zext nneg i32 %C to i64
  %wide.trip.count480 = zext nneg i32 %H to i64
  %wide.trip.count475 = zext i32 %W to i64
  %brmerge568 = select i1 %194, i1 true, i1 %195
  %min.iters.check683 = icmp ult i32 %W, 4
  %n.vec686 = and i64 %wide.trip.count475, 2147483644
  %cmp.n693 = icmp eq i64 %n.vec686, %wide.trip.count475
  br label %for_begin_ax1102.preheader, !dbg !221

for_body_i1:                                      ; preds = %for_body_i1.preheader725, %for_body_i1
  %indvars.iv467 = phi i64 [ %indvars.iv.next468, %for_body_i1 ], [ %indvars.iv467.ph, %for_body_i1.preheader725 ]
    #dbg_declare(i64 %indvars.iv467, !269, !DIExpression(), !221)
  %198 = getelementptr inbounds nuw float, ptr %A_red, i64 %indvars.iv467, !dbg !221
  %199 = load float, ptr %198, align 4, !dbg !221, !tbaa !228
  %200 = tail call float @llvm.sqrt.f32(float %199), !dbg !221
  store float %200, ptr %198, align 4, !dbg !221, !tbaa !228
  %indvars.iv.next468 = add nuw nsw i64 %indvars.iv467, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next468, !269, !DIExpression(), !221)
  %exitcond471.not = icmp eq i64 %indvars.iv.next468, %wide.trip.count470, !dbg !221
  br i1 %exitcond471.not, label %for_begin_ax098.preheader, label %for_body_i1, !dbg !221, !prof !251, !llvm.loop !272

for_begin_ax1102.preheader:                       ; preds = %for_begin_ax1102.preheader.lr.ph, %for_end_ax1104
  %indvars.iv487 = phi i64 [ 0, %for_begin_ax1102.preheader.lr.ph ], [ %indvars.iv.next488, %for_end_ax1104 ]
    #dbg_declare(i64 %indvars.iv487, !224, !DIExpression(), !221)
    #dbg_declare(i32 0, !243, !DIExpression(), !221)
  br i1 %18, label %for_begin_ax2106.preheader.lr.ph, label %for_end_ax1104, !dbg !221, !prof !225

for_begin_ax2106.preheader.lr.ph:                 ; preds = %for_begin_ax1102.preheader
  %201 = mul nuw nsw i64 %indvars.iv487, %0
  br i1 %brmerge568, label %for_end_ax1104, label %for_begin_ax2106.preheader.us.us, !prof !254

for_begin_ax2106.preheader.us.us:                 ; preds = %for_begin_ax2106.preheader.lr.ph, %for_begin_ax2106.for_end_ax2108_crit_edge.split.us.us.us
  %indvars.iv482 = phi i64 [ %indvars.iv.next483, %for_begin_ax2106.for_end_ax2108_crit_edge.split.us.us.us ], [ 0, %for_begin_ax2106.preheader.lr.ph ]
    #dbg_declare(i64 %indvars.iv482, !243, !DIExpression(), !221)
    #dbg_declare(i32 0, !244, !DIExpression(), !221)
  %202 = add nuw nsw i64 %indvars.iv482, %201
  %203 = mul nuw nsw i64 %202, %197
  %204 = getelementptr inbounds nuw float, ptr %A_red, i64 %indvars.iv482
  %205 = load float, ptr %204, align 4, !tbaa !228
  %broadcast.splatinsert690 = insertelement <4 x float> poison, float %205, i64 0
  %broadcast.splat691 = shufflevector <4 x float> %broadcast.splatinsert690, <4 x float> poison, <4 x i32> zeroinitializer
  br label %for_begin_ax3110.preheader.us.us.us, !dbg !221

for_begin_ax3110.preheader.us.us.us:              ; preds = %for_begin_ax3110.for_end_ax3112_crit_edge.us.us.us, %for_begin_ax2106.preheader.us.us
  %indvars.iv477 = phi i64 [ %indvars.iv.next478, %for_begin_ax3110.for_end_ax3112_crit_edge.us.us.us ], [ 0, %for_begin_ax2106.preheader.us.us ]
    #dbg_declare(i64 %indvars.iv477, !244, !DIExpression(), !221)
    #dbg_declare(i32 0, !245, !DIExpression(), !221)
  %206 = add nuw nsw i64 %indvars.iv477, %203
  %207 = mul nuw nsw i64 %206, %196
  %invariant.gep549 = getelementptr float, ptr %T_subtract, i64 %207, !dbg !221
  br i1 %min.iters.check683, label %for_body_ax3111.us.us.us.preheader, label %vector.body687, !dbg !221, !prof !232

vector.body687:                                   ; preds = %for_begin_ax3110.preheader.us.us.us, %vector.body687
  %index688 = phi i64 [ %index.next692, %vector.body687 ], [ 0, %for_begin_ax3110.preheader.us.us.us ], !dbg !221
  %208 = getelementptr float, ptr %invariant.gep549, i64 %index688, !dbg !221
  %wide.load689 = load <4 x float>, ptr %208, align 4, !dbg !221, !tbaa !246
  %209 = fdiv <4 x float> %wide.load689, %broadcast.splat691, !dbg !221
  store <4 x float> %209, ptr %208, align 4, !dbg !221, !tbaa !246
  %index.next692 = add nuw i64 %index688, 4, !dbg !221
  %210 = icmp eq i64 %index.next692, %n.vec686, !dbg !221
  br i1 %210, label %middle.block681, label %vector.body687, !dbg !221, !prof !238, !llvm.loop !273

middle.block681:                                  ; preds = %vector.body687
  br i1 %cmp.n693, label %for_begin_ax3110.for_end_ax3112_crit_edge.us.us.us, label %for_body_ax3111.us.us.us.preheader, !dbg !221, !prof !242

for_body_ax3111.us.us.us.preheader:               ; preds = %for_begin_ax3110.preheader.us.us.us, %middle.block681
  %indvars.iv472.ph = phi i64 [ 0, %for_begin_ax3110.preheader.us.us.us ], [ %n.vec686, %middle.block681 ]
  br label %for_body_ax3111.us.us.us, !dbg !221

for_body_ax3111.us.us.us:                         ; preds = %for_body_ax3111.us.us.us.preheader, %for_body_ax3111.us.us.us
  %indvars.iv472 = phi i64 [ %indvars.iv.next473, %for_body_ax3111.us.us.us ], [ %indvars.iv472.ph, %for_body_ax3111.us.us.us.preheader ]
    #dbg_declare(i64 %indvars.iv472, !245, !DIExpression(), !221)
  %gep550 = getelementptr float, ptr %invariant.gep549, i64 %indvars.iv472, !dbg !221
  %211 = load float, ptr %gep550, align 4, !dbg !221, !tbaa !246
  %212 = fdiv float %211, %205, !dbg !221
  store float %212, ptr %gep550, align 4, !dbg !221, !tbaa !246
  %indvars.iv.next473 = add nuw nsw i64 %indvars.iv472, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next473, !245, !DIExpression(), !221)
  %exitcond476.not = icmp eq i64 %indvars.iv.next473, %wide.trip.count475, !dbg !221
  br i1 %exitcond476.not, label %for_begin_ax3110.for_end_ax3112_crit_edge.us.us.us, label %for_body_ax3111.us.us.us, !dbg !221, !prof !251, !llvm.loop !274

for_begin_ax3110.for_end_ax3112_crit_edge.us.us.us: ; preds = %for_body_ax3111.us.us.us, %middle.block681
  %indvars.iv.next478 = add nuw nsw i64 %indvars.iv477, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next478, !244, !DIExpression(), !221)
  %exitcond481.not = icmp eq i64 %indvars.iv.next478, %wide.trip.count480, !dbg !221
  br i1 %exitcond481.not, label %for_begin_ax2106.for_end_ax2108_crit_edge.split.us.us.us, label %for_begin_ax3110.preheader.us.us.us, !dbg !221, !prof !237

for_begin_ax2106.for_end_ax2108_crit_edge.split.us.us.us: ; preds = %for_begin_ax3110.for_end_ax3112_crit_edge.us.us.us
  %indvars.iv.next483 = add nuw nsw i64 %indvars.iv482, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next483, !243, !DIExpression(), !221)
  %exitcond486.not = icmp eq i64 %indvars.iv.next483, %wide.trip.count485, !dbg !221
  br i1 %exitcond486.not, label %for_end_ax1104, label %for_begin_ax2106.preheader.us.us, !dbg !221, !prof !237

for_begin_ax1114.preheader:                       ; preds = %for_end_ax1104, %for_begin_ax098.preheader
    #dbg_declare(i32 0, !243, !DIExpression(), !221)
  br i1 %18, label %for_body_ax1115.preheader, label %for_begin_ax0118.preheader, !dbg !221, !prof !225

for_body_ax1115.preheader:                        ; preds = %for_begin_ax1114.preheader
  %213 = zext nneg i32 %C to i64, !dbg !221
  %214 = shl nuw nsw i64 %213, 2, !dbg !221
  tail call void @llvm.memcpy.p0.p0.i64(ptr nonnull align 64 %T_subtract10, ptr align 64 %gamma, i64 %214, i1 false), !dbg !221
    #dbg_declare(i64 poison, !243, !DIExpression(), !221)
  br label %for_begin_ax0118.preheader, !dbg !221

for_end_ax1104:                                   ; preds = %for_begin_ax2106.for_end_ax2108_crit_edge.split.us.us.us, %for_begin_ax2106.preheader.lr.ph, %for_begin_ax1102.preheader
  %indvars.iv.next488 = add nuw nsw i64 %indvars.iv487, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next488, !224, !DIExpression(), !221)
  %exitcond491.not = icmp eq i64 %indvars.iv.next488, %wide.trip.count490, !dbg !221
  br i1 %exitcond491.not, label %for_begin_ax1114.preheader, label %for_begin_ax1102.preheader, !dbg !221, !prof !237

for_begin_ax0118.preheader:                       ; preds = %for_body_ax1115.preheader, %for_begin_ax1114.preheader
    #dbg_declare(i32 0, !224, !DIExpression(), !221)
  br i1 %51, label %for_begin_ax1134.preheader, label %for_begin_ax1122.preheader.lr.ph, !dbg !221, !prof !232

for_begin_ax1122.preheader.lr.ph:                 ; preds = %for_begin_ax0118.preheader
  %215 = icmp slt i32 %H, 1
  %216 = icmp slt i32 %W, 1
  %217 = sext i32 %W to i64, !dbg !221
  %218 = sext i32 %H to i64, !dbg !221
  %wide.trip.count513 = zext nneg i32 %N to i64, !dbg !221
  %wide.trip.count508 = zext nneg i32 %C to i64
  %wide.trip.count503 = zext nneg i32 %H to i64
  %wide.trip.count498 = zext i32 %W to i64
  %brmerge571 = select i1 %215, i1 true, i1 %216
  %min.iters.check697 = icmp ult i32 %W, 8
  %n.vec700 = and i64 %wide.trip.count498, 2147483640
  %cmp.n708 = icmp eq i64 %n.vec700, %wide.trip.count498
  br label %for_begin_ax1122.preheader, !dbg !221

for_begin_ax1122.preheader:                       ; preds = %for_begin_ax1122.preheader.lr.ph, %for_end_ax1124
  %indvars.iv510 = phi i64 [ 0, %for_begin_ax1122.preheader.lr.ph ], [ %indvars.iv.next511, %for_end_ax1124 ]
    #dbg_declare(i64 %indvars.iv510, !224, !DIExpression(), !221)
    #dbg_declare(i32 0, !243, !DIExpression(), !221)
  br i1 %18, label %for_begin_ax2126.preheader.lr.ph, label %for_end_ax1124, !dbg !221, !prof !225

for_begin_ax2126.preheader.lr.ph:                 ; preds = %for_begin_ax1122.preheader
  %219 = mul nuw nsw i64 %indvars.iv510, %0
  br i1 %brmerge571, label %for_end_ax1124, label %for_begin_ax2126.preheader.us.us, !prof !254

for_begin_ax2126.preheader.us.us:                 ; preds = %for_begin_ax2126.preheader.lr.ph, %for_begin_ax2126.for_end_ax2128_crit_edge.split.us.us.us
  %indvars.iv505 = phi i64 [ %indvars.iv.next506, %for_begin_ax2126.for_end_ax2128_crit_edge.split.us.us.us ], [ 0, %for_begin_ax2126.preheader.lr.ph ]
    #dbg_declare(i64 %indvars.iv505, !243, !DIExpression(), !221)
    #dbg_declare(i32 0, !244, !DIExpression(), !221)
  %220 = getelementptr inbounds nuw float, ptr %T_subtract10, i64 %indvars.iv505
  %221 = add nuw nsw i64 %indvars.iv505, %219
  %222 = mul nuw nsw i64 %221, %218
  %223 = load float, ptr %220, align 4, !tbaa !259
  %broadcast.splatinsert705 = insertelement <4 x float> poison, float %223, i64 0
  %broadcast.splat706 = shufflevector <4 x float> %broadcast.splatinsert705, <4 x float> poison, <4 x i32> zeroinitializer
  br label %for_begin_ax3130.preheader.us.us.us, !dbg !221

for_begin_ax3130.preheader.us.us.us:              ; preds = %for_begin_ax3130.for_end_ax3132_crit_edge.us.us.us, %for_begin_ax2126.preheader.us.us
  %indvars.iv500 = phi i64 [ %indvars.iv.next501, %for_begin_ax3130.for_end_ax3132_crit_edge.us.us.us ], [ 0, %for_begin_ax2126.preheader.us.us ]
    #dbg_declare(i64 %indvars.iv500, !244, !DIExpression(), !221)
    #dbg_declare(i32 0, !245, !DIExpression(), !221)
  %224 = add nuw nsw i64 %indvars.iv500, %222
  %225 = mul nuw nsw i64 %224, %217
  %invariant.gep551 = getelementptr float, ptr %T_subtract, i64 %225, !dbg !221
  br i1 %min.iters.check697, label %for_body_ax3131.us.us.us.preheader, label %vector.body701, !dbg !221, !prof !232

vector.body701:                                   ; preds = %for_begin_ax3130.preheader.us.us.us, %vector.body701
  %index702 = phi i64 [ %index.next707, %vector.body701 ], [ 0, %for_begin_ax3130.preheader.us.us.us ], !dbg !221
  %226 = getelementptr float, ptr %invariant.gep551, i64 %index702, !dbg !221
  %227 = getelementptr i8, ptr %226, i64 16, !dbg !221
  %wide.load703 = load <4 x float>, ptr %226, align 4, !dbg !221, !tbaa !246
  %wide.load704 = load <4 x float>, ptr %227, align 4, !dbg !221, !tbaa !246
  %228 = fmul <4 x float> %broadcast.splat706, %wide.load703, !dbg !221
  %229 = fmul <4 x float> %broadcast.splat706, %wide.load704, !dbg !221
  store <4 x float> %228, ptr %226, align 4, !dbg !221, !tbaa !246
  store <4 x float> %229, ptr %227, align 4, !dbg !221, !tbaa !246
  %index.next707 = add nuw i64 %index702, 8, !dbg !221
  %230 = icmp eq i64 %index.next707, %n.vec700, !dbg !221
  br i1 %230, label %middle.block695, label %vector.body701, !dbg !221, !prof !248, !llvm.loop !275

middle.block695:                                  ; preds = %vector.body701
  br i1 %cmp.n708, label %for_begin_ax3130.for_end_ax3132_crit_edge.us.us.us, label %for_body_ax3131.us.us.us.preheader, !dbg !221, !prof !250

for_body_ax3131.us.us.us.preheader:               ; preds = %for_begin_ax3130.preheader.us.us.us, %middle.block695
  %indvars.iv495.ph = phi i64 [ 0, %for_begin_ax3130.preheader.us.us.us ], [ %n.vec700, %middle.block695 ]
  br label %for_body_ax3131.us.us.us, !dbg !221

for_body_ax3131.us.us.us:                         ; preds = %for_body_ax3131.us.us.us.preheader, %for_body_ax3131.us.us.us
  %indvars.iv495 = phi i64 [ %indvars.iv.next496, %for_body_ax3131.us.us.us ], [ %indvars.iv495.ph, %for_body_ax3131.us.us.us.preheader ]
    #dbg_declare(i64 %indvars.iv495, !245, !DIExpression(), !221)
  %gep552 = getelementptr float, ptr %invariant.gep551, i64 %indvars.iv495, !dbg !221
  %231 = load float, ptr %gep552, align 4, !dbg !221, !tbaa !246
  %232 = fmul float %223, %231, !dbg !221
  store float %232, ptr %gep552, align 4, !dbg !221, !tbaa !246
  %indvars.iv.next496 = add nuw nsw i64 %indvars.iv495, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next496, !245, !DIExpression(), !221)
  %exitcond499.not = icmp eq i64 %indvars.iv.next496, %wide.trip.count498, !dbg !221
  br i1 %exitcond499.not, label %for_begin_ax3130.for_end_ax3132_crit_edge.us.us.us, label %for_body_ax3131.us.us.us, !dbg !221, !prof !251, !llvm.loop !276

for_begin_ax3130.for_end_ax3132_crit_edge.us.us.us: ; preds = %for_body_ax3131.us.us.us, %middle.block695
  %indvars.iv.next501 = add nuw nsw i64 %indvars.iv500, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next501, !244, !DIExpression(), !221)
  %exitcond504.not = icmp eq i64 %indvars.iv.next501, %wide.trip.count503, !dbg !221
  br i1 %exitcond504.not, label %for_begin_ax2126.for_end_ax2128_crit_edge.split.us.us.us, label %for_begin_ax3130.preheader.us.us.us, !dbg !221, !prof !237

for_begin_ax2126.for_end_ax2128_crit_edge.split.us.us.us: ; preds = %for_begin_ax3130.for_end_ax3132_crit_edge.us.us.us
  %indvars.iv.next506 = add nuw nsw i64 %indvars.iv505, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next506, !243, !DIExpression(), !221)
  %exitcond509.not = icmp eq i64 %indvars.iv.next506, %wide.trip.count508, !dbg !221
  br i1 %exitcond509.not, label %for_end_ax1124, label %for_begin_ax2126.preheader.us.us, !dbg !221, !prof !237

for_begin_ax1134.preheader:                       ; preds = %for_end_ax1124, %for_begin_ax0118.preheader
    #dbg_declare(i32 0, !243, !DIExpression(), !221)
  br i1 %18, label %for_body_ax1135.preheader, label %for_begin_ax0138.preheader, !dbg !221, !prof !225

for_body_ax1135.preheader:                        ; preds = %for_begin_ax1134.preheader
  %233 = zext nneg i32 %C to i64, !dbg !221
  %234 = shl nuw nsw i64 %233, 2, !dbg !221
  tail call void @llvm.memcpy.p0.p0.i64(ptr nonnull align 64 %T_subtract5, ptr align 64 %beta, i64 %234, i1 false), !dbg !221
    #dbg_declare(i64 poison, !243, !DIExpression(), !221)
  br label %for_begin_ax0138.preheader, !dbg !221

for_end_ax1124:                                   ; preds = %for_begin_ax2126.for_end_ax2128_crit_edge.split.us.us.us, %for_begin_ax2126.preheader.lr.ph, %for_begin_ax1122.preheader
  %indvars.iv.next511 = add nuw nsw i64 %indvars.iv510, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next511, !224, !DIExpression(), !221)
  %exitcond514.not = icmp eq i64 %indvars.iv.next511, %wide.trip.count513, !dbg !221
  br i1 %exitcond514.not, label %for_begin_ax1134.preheader, label %for_begin_ax1122.preheader, !dbg !221, !prof !237

for_begin_ax0138.preheader:                       ; preds = %for_body_ax1135.preheader, %for_begin_ax1134.preheader
    #dbg_declare(i32 0, !224, !DIExpression(), !221)
  br i1 %51, label %for_end_ax0140, label %for_begin_ax1142.preheader.lr.ph, !dbg !221, !prof !232

for_begin_ax1142.preheader.lr.ph:                 ; preds = %for_begin_ax0138.preheader
  %235 = icmp slt i32 %H, 1
  %236 = icmp slt i32 %W, 1
  %237 = sext i32 %W to i64, !dbg !221
  %238 = sext i32 %H to i64, !dbg !221
  %wide.trip.count536 = zext nneg i32 %N to i64, !dbg !221
  %wide.trip.count531 = zext nneg i32 %C to i64
  %wide.trip.count526 = zext nneg i32 %H to i64
  %wide.trip.count521 = zext i32 %W to i64
  %brmerge574 = select i1 %235, i1 true, i1 %236
  %min.iters.check712 = icmp ult i32 %W, 8
  %n.vec715 = and i64 %wide.trip.count521, 2147483640
  %cmp.n723 = icmp eq i64 %n.vec715, %wide.trip.count521
  br label %for_begin_ax1142.preheader, !dbg !221

for_begin_ax1142.preheader:                       ; preds = %for_begin_ax1142.preheader.lr.ph, %for_end_ax1144
  %indvars.iv533 = phi i64 [ 0, %for_begin_ax1142.preheader.lr.ph ], [ %indvars.iv.next534, %for_end_ax1144 ]
    #dbg_declare(i64 %indvars.iv533, !224, !DIExpression(), !221)
    #dbg_declare(i32 0, !243, !DIExpression(), !221)
  br i1 %18, label %for_begin_ax2146.preheader.lr.ph, label %for_end_ax1144, !dbg !221, !prof !225

for_begin_ax2146.preheader.lr.ph:                 ; preds = %for_begin_ax1142.preheader
  %239 = mul nuw nsw i64 %indvars.iv533, %0
  br i1 %brmerge574, label %for_end_ax1144, label %for_begin_ax2146.preheader.us.us, !prof !254

for_begin_ax2146.preheader.us.us:                 ; preds = %for_begin_ax2146.preheader.lr.ph, %for_begin_ax2146.for_end_ax2148_crit_edge.split.us.us.us
  %indvars.iv528 = phi i64 [ %indvars.iv.next529, %for_begin_ax2146.for_end_ax2148_crit_edge.split.us.us.us ], [ 0, %for_begin_ax2146.preheader.lr.ph ]
    #dbg_declare(i64 %indvars.iv528, !243, !DIExpression(), !221)
    #dbg_declare(i32 0, !244, !DIExpression(), !221)
  %240 = getelementptr inbounds nuw float, ptr %T_subtract5, i64 %indvars.iv528
  %241 = add nuw nsw i64 %indvars.iv528, %239
  %242 = mul nuw nsw i64 %241, %238
  %243 = load float, ptr %240, align 4, !tbaa !255
  %broadcast.splatinsert720 = insertelement <4 x float> poison, float %243, i64 0
  %broadcast.splat721 = shufflevector <4 x float> %broadcast.splatinsert720, <4 x float> poison, <4 x i32> zeroinitializer
  br label %for_begin_ax3150.preheader.us.us.us, !dbg !221

for_begin_ax3150.preheader.us.us.us:              ; preds = %for_begin_ax3150.for_end_ax3152_crit_edge.us.us.us, %for_begin_ax2146.preheader.us.us
  %indvars.iv523 = phi i64 [ %indvars.iv.next524, %for_begin_ax3150.for_end_ax3152_crit_edge.us.us.us ], [ 0, %for_begin_ax2146.preheader.us.us ]
    #dbg_declare(i64 %indvars.iv523, !244, !DIExpression(), !221)
    #dbg_declare(i32 0, !245, !DIExpression(), !221)
  %244 = add nuw nsw i64 %indvars.iv523, %242
  %245 = mul nuw nsw i64 %244, %237
  br i1 %min.iters.check712, label %for_body_ax3151.us.us.us.preheader, label %vector.body716, !dbg !221, !prof !232

vector.body716:                                   ; preds = %for_begin_ax3150.preheader.us.us.us, %vector.body716
  %index717 = phi i64 [ %index.next722, %vector.body716 ], [ 0, %for_begin_ax3150.preheader.us.us.us ], !dbg !221
  %246 = add nuw nsw i64 %index717, %245, !dbg !221
  %247 = getelementptr inbounds float, ptr %T_subtract, i64 %246, !dbg !221
  %248 = getelementptr inbounds nuw i8, ptr %247, i64 16, !dbg !221
  %wide.load718 = load <4 x float>, ptr %247, align 4, !dbg !221, !tbaa !246
  %wide.load719 = load <4 x float>, ptr %248, align 4, !dbg !221, !tbaa !246
  %249 = fadd <4 x float> %broadcast.splat721, %wide.load718, !dbg !221
  %250 = fadd <4 x float> %broadcast.splat721, %wide.load719, !dbg !221
  %251 = getelementptr inbounds float, ptr %T_add, i64 %246, !dbg !221
  %252 = getelementptr inbounds nuw i8, ptr %251, i64 16, !dbg !221
  store <4 x float> %249, ptr %251, align 4, !dbg !221, !tbaa !277
  store <4 x float> %250, ptr %252, align 4, !dbg !221, !tbaa !277
  %index.next722 = add nuw i64 %index717, 8, !dbg !221
  %253 = icmp eq i64 %index.next722, %n.vec715, !dbg !221
  br i1 %253, label %middle.block710, label %vector.body716, !dbg !221, !prof !248, !llvm.loop !279

middle.block710:                                  ; preds = %vector.body716
  br i1 %cmp.n723, label %for_begin_ax3150.for_end_ax3152_crit_edge.us.us.us, label %for_body_ax3151.us.us.us.preheader, !dbg !221, !prof !250

for_body_ax3151.us.us.us.preheader:               ; preds = %for_begin_ax3150.preheader.us.us.us, %middle.block710
  %indvars.iv518.ph = phi i64 [ 0, %for_begin_ax3150.preheader.us.us.us ], [ %n.vec715, %middle.block710 ]
  br label %for_body_ax3151.us.us.us, !dbg !221

for_body_ax3151.us.us.us:                         ; preds = %for_body_ax3151.us.us.us.preheader, %for_body_ax3151.us.us.us
  %indvars.iv518 = phi i64 [ %indvars.iv.next519, %for_body_ax3151.us.us.us ], [ %indvars.iv518.ph, %for_body_ax3151.us.us.us.preheader ]
    #dbg_declare(i64 %indvars.iv518, !245, !DIExpression(), !221)
  %254 = add nuw nsw i64 %indvars.iv518, %245, !dbg !221
  %255 = getelementptr inbounds float, ptr %T_subtract, i64 %254, !dbg !221
  %256 = load float, ptr %255, align 4, !dbg !221, !tbaa !246
  %257 = fadd float %243, %256, !dbg !221
  %258 = getelementptr inbounds float, ptr %T_add, i64 %254, !dbg !221
  store float %257, ptr %258, align 4, !dbg !221, !tbaa !277
  %indvars.iv.next519 = add nuw nsw i64 %indvars.iv518, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next519, !245, !DIExpression(), !221)
  %exitcond522.not = icmp eq i64 %indvars.iv.next519, %wide.trip.count521, !dbg !221
  br i1 %exitcond522.not, label %for_begin_ax3150.for_end_ax3152_crit_edge.us.us.us, label %for_body_ax3151.us.us.us, !dbg !221, !prof !251, !llvm.loop !280

for_begin_ax3150.for_end_ax3152_crit_edge.us.us.us: ; preds = %for_body_ax3151.us.us.us, %middle.block710
  %indvars.iv.next524 = add nuw nsw i64 %indvars.iv523, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next524, !244, !DIExpression(), !221)
  %exitcond527.not = icmp eq i64 %indvars.iv.next524, %wide.trip.count526, !dbg !221
  br i1 %exitcond527.not, label %for_begin_ax2146.for_end_ax2148_crit_edge.split.us.us.us, label %for_begin_ax3150.preheader.us.us.us, !dbg !221, !prof !237

for_begin_ax2146.for_end_ax2148_crit_edge.split.us.us.us: ; preds = %for_begin_ax3150.for_end_ax3152_crit_edge.us.us.us
  %indvars.iv.next529 = add nuw nsw i64 %indvars.iv528, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next529, !243, !DIExpression(), !221)
  %exitcond532.not = icmp eq i64 %indvars.iv.next529, %wide.trip.count531, !dbg !221
  br i1 %exitcond532.not, label %for_end_ax1144, label %for_begin_ax2146.preheader.us.us, !dbg !221, !prof !237

for_end_ax0140:                                   ; preds = %for_end_ax1144, %for_begin_ax0138.preheader
  %259 = load ptr, ptr @__TVMBackendFreeWorkspace, align 8, !dbg !221, !tbaa !17
  %260 = tail call i32 %259(i32 1, i32 %dev_id, ptr nonnull %T_subtract10), !dbg !221
  %.not = icmp eq i32 %260, 0, !dbg !221
  br i1 %.not, label %if_end155, label %common.ret, !dbg !221, !prof !20

for_end_ax1144:                                   ; preds = %for_begin_ax2146.for_end_ax2148_crit_edge.split.us.us.us, %for_begin_ax2146.preheader.lr.ph, %for_begin_ax1142.preheader
  %indvars.iv.next534 = add nuw nsw i64 %indvars.iv533, 1, !dbg !221
    #dbg_declare(i64 %indvars.iv.next534, !224, !DIExpression(), !221)
  %exitcond537.not = icmp eq i64 %indvars.iv.next534, %wide.trip.count536, !dbg !221
  br i1 %exitcond537.not, label %for_end_ax0140, label %for_begin_ax1142.preheader, !dbg !221, !prof !237

if_end155:                                        ; preds = %for_end_ax0140
  %261 = load ptr, ptr @__TVMBackendFreeWorkspace, align 8, !dbg !221, !tbaa !17
  %262 = tail call i32 %261(i32 1, i32 %dev_id, ptr nonnull %T_subtract5), !dbg !221
  %.not166 = icmp eq i32 %262, 0, !dbg !221
  br i1 %.not166, label %if_end158, label %common.ret, !dbg !221, !prof !20

if_end158:                                        ; preds = %if_end155
  %263 = load ptr, ptr @__TVMBackendFreeWorkspace, align 8, !dbg !221, !tbaa !17
  %264 = tail call i32 %263(i32 1, i32 %dev_id, ptr nonnull %T_subtract), !dbg !221
  %.not167 = icmp eq i32 %264, 0, !dbg !221
  br i1 %.not167, label %if_end161, label %common.ret, !dbg !221, !prof !20

if_end161:                                        ; preds = %if_end158
  %265 = load ptr, ptr @__TVMBackendFreeWorkspace, align 8, !dbg !221, !tbaa !17
  %266 = tail call i32 %265(i32 1, i32 %dev_id, ptr nonnull %A_red), !dbg !221
  %.not168 = icmp ne i32 %266, 0, !dbg !221
  %. = sext i1 %.not168 to i32, !dbg !221
  br label %common.ret, !dbg !221
}

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
declare i32 @llvm.smax.i32(i32, i32) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fabs.f32(float) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare half @llvm.fabs.f16(half) #5

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #6

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x float> @llvm.sqrt.v4f32(<4 x float>) #5

attributes #0 = { "target-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #2 = { noinline "target-cpu"="generic" }
attributes #3 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nofree nosync nounwind memory(none) "target-cpu"="generic" "target-features" }
attributes #5 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "TVM", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "IRModule.CodeGenLLVM", directory: ".")
!2 = !{i32 2, !"tvm_target", !"llvm -mtriple=x86_64-unknown-linux-gnu"}
!3 = !{i32 4, !"Debug Info Version", i32 3}
!4 = !{i32 4, !"Dwarf Version", i32 4}
!5 = distinct !DISubprogram(name: "batch_norm", scope: !1, file: !1, type: !6, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !10)
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
!24 = !DILocalVariable(name: "var_moving_mean.type_index", scope: !5, file: !1, type: !8)
!25 = !DILocalVariable(name: "var_moving_var.type_index", scope: !5, file: !1, type: !8)
!26 = !DILocalVariable(name: "var_T_add.type_index", scope: !5, file: !1, type: !8)
!27 = !DILocalVariable(name: "var_A", scope: !5, file: !1, type: !9)
!28 = !DILocalVariable(name: "var_gamma", scope: !5, file: !1, type: !9)
!29 = !DILocalVariable(name: "var_beta", scope: !5, file: !1, type: !9)
!30 = !DILocalVariable(name: "var_moving_mean", scope: !5, file: !1, type: !9)
!31 = !DILocalVariable(name: "var_moving_var", scope: !5, file: !1, type: !9)
!32 = !DILocalVariable(name: "var_T_add", scope: !5, file: !1, type: !9)
!33 = !DILocalVariable(name: "batch_norm.var_A.shape", scope: !5, file: !1, type: !34)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35)
!35 = !DIBasicType(name: "int64", size: 64, encoding: DW_ATE_signed)
!36 = !{!37, !37, i64 0}
!37 = !{!"0x6079bb191b20.w8.b0", !38, i64 0}
!38 = !{!"0x6079bb191b20.w16.b0", !39, i64 0}
!39 = !{!"0x6079bb191b20.w32.b0", !40, i64 0}
!40 = !{!"0x6079bb191b20.w64.b0", !41, i64 0}
!41 = !{!"0x6079bb191b20.w128.b0", !42, i64 0}
!42 = !{!"0x6079bb191b20.w256.b0", !43, i64 0}
!43 = !{!"0x6079bb191b20.w512.b0", !44, i64 0}
!44 = !{!"0x6079bb191b20.w1024.b0", !45, i64 0}
!45 = !{!"0x6079bb191b20", !19, i64 0}
!46 = !DILocalVariable(name: "N", scope: !5, file: !1, type: !8)
!47 = !{!48, !48, i64 0}
!48 = !{!"0x6079bb191b20.w8.b8", !38, i64 0}
!49 = !DILocalVariable(name: "C", scope: !5, file: !1, type: !8)
!50 = !{!51, !51, i64 0}
!51 = !{!"0x6079bb191b20.w8.b16", !52, i64 0}
!52 = !{!"0x6079bb191b20.w16.b16", !39, i64 0}
!53 = !DILocalVariable(name: "H", scope: !5, file: !1, type: !8)
!54 = !{!55, !55, i64 0}
!55 = !{!"0x6079bb191b20.w8.b24", !52, i64 0}
!56 = !DILocalVariable(name: "W", scope: !5, file: !1, type: !8)
!57 = !DILocalVariable(name: "batch_norm.var_A.strides", scope: !5, file: !1, type: !34)
!58 = !DILocalVariable(name: "dev_id", scope: !5, file: !1, type: !8)
!59 = !DILocalVariable(name: "A", scope: !5, file: !1, type: !60)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61)
!61 = !DIBasicType(name: "float32", size: 32, encoding: DW_ATE_float)
!62 = !DILocalVariable(name: "batch_norm.var_gamma.shape", scope: !5, file: !1, type: !34)
!63 = !DILocalVariable(name: "batch_norm.var_gamma.strides", scope: !5, file: !1, type: !34)
!64 = !DILocalVariable(name: "gamma", scope: !5, file: !1, type: !60)
!65 = !DILocalVariable(name: "batch_norm.var_beta.shape", scope: !5, file: !1, type: !34)
!66 = !DILocalVariable(name: "batch_norm.var_beta.strides", scope: !5, file: !1, type: !34)
!67 = !DILocalVariable(name: "beta", scope: !5, file: !1, type: !60)
!68 = !DILocalVariable(name: "batch_norm.var_moving_mean.shape", scope: !5, file: !1, type: !34)
!69 = !DILocalVariable(name: "batch_norm.var_moving_mean.strides", scope: !5, file: !1, type: !34)
!70 = !DILocalVariable(name: "moving_mean", scope: !5, file: !1, type: !60)
!71 = !DILocalVariable(name: "batch_norm.var_moving_var.shape", scope: !5, file: !1, type: !34)
!72 = !DILocalVariable(name: "batch_norm.var_moving_var.strides", scope: !5, file: !1, type: !34)
!73 = !DILocalVariable(name: "moving_var", scope: !5, file: !1, type: !60)
!74 = !DILocalVariable(name: "batch_norm.var_T_add.shape", scope: !5, file: !1, type: !34)
!75 = !DILocalVariable(name: "batch_norm.var_T_add.strides", scope: !5, file: !1, type: !34)
!76 = !DILocalVariable(name: "T_add", scope: !5, file: !1, type: !60)
!77 = !{!78, !78, i64 0}
!78 = !{!"0x6079bb1926f0.w8.b0", !79, i64 0}
!79 = !{!"0x6079bb1926f0.w16.b0", !80, i64 0}
!80 = !{!"0x6079bb1926f0.w32.b0", !81, i64 0}
!81 = !{!"0x6079bb1926f0.w64.b0", !82, i64 0}
!82 = !{!"0x6079bb1926f0.w128.b0", !83, i64 0}
!83 = !{!"0x6079bb1926f0.w256.b0", !84, i64 0}
!84 = !{!"0x6079bb1926f0.w512.b0", !85, i64 0}
!85 = !{!"0x6079bb1926f0.w1024.b0", !86, i64 0}
!86 = !{!"0x6079bb1926f0", !19, i64 0}
!87 = !{!88, !88, i64 0}
!88 = !{!"0x6079bb1926f0.w8.b8", !79, i64 0}
!89 = !{!90, !90, i64 0}
!90 = !{!"0x6079bb1926f0.w8.b16", !91, i64 0}
!91 = !{!"0x6079bb1926f0.w16.b16", !80, i64 0}
!92 = !{!93, !93, i64 0}
!93 = !{!"0x6079bb1926f0.w8.b24", !91, i64 0}
!94 = !{!95, !95, i64 0}
!95 = !{!"0x6079bb1977b0.w8.b0", !96, i64 0}
!96 = !{!"0x6079bb1977b0.w16.b0", !97, i64 0}
!97 = !{!"0x6079bb1977b0.w32.b0", !98, i64 0}
!98 = !{!"0x6079bb1977b0.w64.b0", !99, i64 0}
!99 = !{!"0x6079bb1977b0.w128.b0", !100, i64 0}
!100 = !{!"0x6079bb1977b0.w256.b0", !101, i64 0}
!101 = !{!"0x6079bb1977b0.w512.b0", !102, i64 0}
!102 = !{!"0x6079bb1977b0.w1024.b0", !103, i64 0}
!103 = !{!"0x6079bb1977b0", !19, i64 0}
!104 = !{!105, !105, i64 0}
!105 = !{!"0x6079bb197c20.w8.b0", !106, i64 0}
!106 = !{!"0x6079bb197c20.w16.b0", !107, i64 0}
!107 = !{!"0x6079bb197c20.w32.b0", !108, i64 0}
!108 = !{!"0x6079bb197c20.w64.b0", !109, i64 0}
!109 = !{!"0x6079bb197c20.w128.b0", !110, i64 0}
!110 = !{!"0x6079bb197c20.w256.b0", !111, i64 0}
!111 = !{!"0x6079bb197c20.w512.b0", !112, i64 0}
!112 = !{!"0x6079bb197c20.w1024.b0", !113, i64 0}
!113 = !{!"0x6079bb197c20", !19, i64 0}
!114 = !{!115, !115, i64 0}
!115 = !{!"0x6079bb193cd0.w8.b0", !116, i64 0}
!116 = !{!"0x6079bb193cd0.w16.b0", !117, i64 0}
!117 = !{!"0x6079bb193cd0.w32.b0", !118, i64 0}
!118 = !{!"0x6079bb193cd0.w64.b0", !119, i64 0}
!119 = !{!"0x6079bb193cd0.w128.b0", !120, i64 0}
!120 = !{!"0x6079bb193cd0.w256.b0", !121, i64 0}
!121 = !{!"0x6079bb193cd0.w512.b0", !122, i64 0}
!122 = !{!"0x6079bb193cd0.w1024.b0", !123, i64 0}
!123 = !{!"0x6079bb193cd0", !19, i64 0}
!124 = !{!125, !125, i64 0}
!125 = !{!"0x6079bb194b90.w8.b0", !126, i64 0}
!126 = !{!"0x6079bb194b90.w16.b0", !127, i64 0}
!127 = !{!"0x6079bb194b90.w32.b0", !128, i64 0}
!128 = !{!"0x6079bb194b90.w64.b0", !129, i64 0}
!129 = !{!"0x6079bb194b90.w128.b0", !130, i64 0}
!130 = !{!"0x6079bb194b90.w256.b0", !131, i64 0}
!131 = !{!"0x6079bb194b90.w512.b0", !132, i64 0}
!132 = !{!"0x6079bb194b90.w1024.b0", !133, i64 0}
!133 = !{!"0x6079bb194b90", !19, i64 0}
!134 = !{!135, !135, i64 0}
!135 = !{!"0x6079bb19c7e0.w8.b0", !136, i64 0}
!136 = !{!"0x6079bb19c7e0.w16.b0", !137, i64 0}
!137 = !{!"0x6079bb19c7e0.w32.b0", !138, i64 0}
!138 = !{!"0x6079bb19c7e0.w64.b0", !139, i64 0}
!139 = !{!"0x6079bb19c7e0.w128.b0", !140, i64 0}
!140 = !{!"0x6079bb19c7e0.w256.b0", !141, i64 0}
!141 = !{!"0x6079bb19c7e0.w512.b0", !142, i64 0}
!142 = !{!"0x6079bb19c7e0.w1024.b0", !143, i64 0}
!143 = !{!"0x6079bb19c7e0", !19, i64 0}
!144 = !{!145, !145, i64 0}
!145 = !{!"0x6079bb199700.w8.b0", !146, i64 0}
!146 = !{!"0x6079bb199700.w16.b0", !147, i64 0}
!147 = !{!"0x6079bb199700.w32.b0", !148, i64 0}
!148 = !{!"0x6079bb199700.w64.b0", !149, i64 0}
!149 = !{!"0x6079bb199700.w128.b0", !150, i64 0}
!150 = !{!"0x6079bb199700.w256.b0", !151, i64 0}
!151 = !{!"0x6079bb199700.w512.b0", !152, i64 0}
!152 = !{!"0x6079bb199700.w1024.b0", !153, i64 0}
!153 = !{!"0x6079bb199700", !19, i64 0}
!154 = !{!155, !155, i64 0}
!155 = !{!"0x6079bb110d70.w8.b0", !156, i64 0}
!156 = !{!"0x6079bb110d70.w16.b0", !157, i64 0}
!157 = !{!"0x6079bb110d70.w32.b0", !158, i64 0}
!158 = !{!"0x6079bb110d70.w64.b0", !159, i64 0}
!159 = !{!"0x6079bb110d70.w128.b0", !160, i64 0}
!160 = !{!"0x6079bb110d70.w256.b0", !161, i64 0}
!161 = !{!"0x6079bb110d70.w512.b0", !162, i64 0}
!162 = !{!"0x6079bb110d70.w1024.b0", !163, i64 0}
!163 = !{!"0x6079bb110d70", !19, i64 0}
!164 = !{!165, !165, i64 0}
!165 = !{!"0x6079bb197040.w8.b0", !166, i64 0}
!166 = !{!"0x6079bb197040.w16.b0", !167, i64 0}
!167 = !{!"0x6079bb197040.w32.b0", !168, i64 0}
!168 = !{!"0x6079bb197040.w64.b0", !169, i64 0}
!169 = !{!"0x6079bb197040.w128.b0", !170, i64 0}
!170 = !{!"0x6079bb197040.w256.b0", !171, i64 0}
!171 = !{!"0x6079bb197040.w512.b0", !172, i64 0}
!172 = !{!"0x6079bb197040.w1024.b0", !173, i64 0}
!173 = !{!"0x6079bb197040", !19, i64 0}
!174 = !{!175, !175, i64 0}
!175 = !{!"0x6079bb19c240.w8.b0", !176, i64 0}
!176 = !{!"0x6079bb19c240.w16.b0", !177, i64 0}
!177 = !{!"0x6079bb19c240.w32.b0", !178, i64 0}
!178 = !{!"0x6079bb19c240.w64.b0", !179, i64 0}
!179 = !{!"0x6079bb19c240.w128.b0", !180, i64 0}
!180 = !{!"0x6079bb19c240.w256.b0", !181, i64 0}
!181 = !{!"0x6079bb19c240.w512.b0", !182, i64 0}
!182 = !{!"0x6079bb19c240.w1024.b0", !183, i64 0}
!183 = !{!"0x6079bb19c240", !19, i64 0}
!184 = !{!185, !185, i64 0}
!185 = !{!"0x6079bb19c240.w8.b8", !176, i64 0}
!186 = !{!187, !187, i64 0}
!187 = !{!"0x6079bb19c240.w8.b16", !188, i64 0}
!188 = !{!"0x6079bb19c240.w16.b16", !177, i64 0}
!189 = !{!190, !190, i64 0}
!190 = !{!"0x6079bb19c240.w8.b24", !188, i64 0}
!191 = !{!192, !192, i64 0}
!192 = !{!"0x6079bb117ff0.w8.b0", !193, i64 0}
!193 = !{!"0x6079bb117ff0.w16.b0", !194, i64 0}
!194 = !{!"0x6079bb117ff0.w32.b0", !195, i64 0}
!195 = !{!"0x6079bb117ff0.w64.b0", !196, i64 0}
!196 = !{!"0x6079bb117ff0.w128.b0", !197, i64 0}
!197 = !{!"0x6079bb117ff0.w256.b0", !198, i64 0}
!198 = !{!"0x6079bb117ff0.w512.b0", !199, i64 0}
!199 = !{!"0x6079bb117ff0.w1024.b0", !200, i64 0}
!200 = !{!"0x6079bb117ff0", !19, i64 0}
!201 = !{!202, !202, i64 0}
!202 = !{!"0x6079bb117ff0.w8.b8", !193, i64 0}
!203 = !{!204, !204, i64 0}
!204 = !{!"0x6079bb117ff0.w8.b16", !205, i64 0}
!205 = !{!"0x6079bb117ff0.w16.b16", !194, i64 0}
!206 = !{!207, !207, i64 0}
!207 = !{!"0x6079bb117ff0.w8.b24", !205, i64 0}
!208 = distinct !DISubprogram(name: "batch_norm_compute_", scope: !1, file: !1, type: !209, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !211)
!209 = !DISubroutineType(types: !210)
!210 = !{!8, !8, !8, !8, !8, !8, !60, !60, !60, !60}
!211 = !{!212, !213, !214, !215, !216, !217, !218, !219, !220}
!212 = !DILocalVariable(name: "dev_id", arg: 1, scope: !208, file: !1, type: !8)
!213 = !DILocalVariable(name: "C", arg: 2, scope: !208, file: !1, type: !8)
!214 = !DILocalVariable(name: "N", arg: 3, scope: !208, file: !1, type: !8)
!215 = !DILocalVariable(name: "H", arg: 4, scope: !208, file: !1, type: !8)
!216 = !DILocalVariable(name: "W", arg: 5, scope: !208, file: !1, type: !8)
!217 = !DILocalVariable(name: "A", arg: 6, scope: !208, file: !1, type: !60)
!218 = !DILocalVariable(name: "gamma", arg: 7, scope: !208, file: !1, type: !60)
!219 = !DILocalVariable(name: "beta", arg: 8, scope: !208, file: !1, type: !60)
!220 = !DILocalVariable(name: "T_add", arg: 9, scope: !208, file: !1, type: !60)
!221 = !DILocation(line: 0, scope: !208)
!222 = !DILocalVariable(name: "A_red", scope: !208, file: !1, type: !60)
!223 = !DILocalVariable(name: "T_subtract", scope: !208, file: !1, type: !60)
!224 = !DILocalVariable(name: "ax0", scope: !208, file: !1, type: !8)
!225 = !{!"branch_weights", i32 127, i32 1}
!226 = !{!"branch_weights", i32 48769, i32 2048383}
!227 = !DILocalVariable(name: "k0", scope: !208, file: !1, type: !8)
!228 = !{!229, !229, i64 0}
!229 = !{!"0x6079bb018090", !19, i64 0}
!230 = !DILocalVariable(name: "k2", scope: !208, file: !1, type: !8)
!231 = !DILocalVariable(name: "k3", scope: !208, file: !1, type: !8)
!232 = !{!"branch_weights", i32 1, i32 127}
!233 = !{!234, !234, i64 0}
!234 = !{!"0x6079bb0b0bc0", !19, i64 0}
!235 = !{!"branch_weights", i32 127, i32 67108705}
!236 = !{!"branch_weights", i32 1, i32 1}
!237 = !{!"branch_weights", i32 127, i32 134217601}
!238 = !{!"branch_weights", i32 127, i32 33554289}
!239 = distinct !{!239, !240, !241}
!240 = !{!"llvm.loop.isvectorized", i32 1}
!241 = !{!"llvm.loop.unroll.runtime.disable"}
!242 = !{!"branch_weights", i32 1, i32 3}
!243 = !DILocalVariable(name: "ax1", scope: !208, file: !1, type: !8)
!244 = !DILocalVariable(name: "ax2", scope: !208, file: !1, type: !8)
!245 = !DILocalVariable(name: "ax3", scope: !208, file: !1, type: !8)
!246 = !{!247, !247, i64 0}
!247 = !{!"0x6079bafda770", !19, i64 0}
!248 = !{!"branch_weights", i32 127, i32 16777081}
!249 = distinct !{!249, !240, !241}
!250 = !{!"branch_weights", i32 1, i32 7}
!251 = !{!"branch_weights", i32 127, i32 0}
!252 = distinct !{!252, !241, !240}
!253 = distinct !{!253, !241, !240}
!254 = !{!"branch_weights", i32 255, i32 16129}
!255 = !{!256, !256, i64 0}
!256 = !{!"0x6079bb01dd60", !19, i64 0}
!257 = distinct !{!257, !240, !241}
!258 = distinct !{!258, !241, !240}
!259 = !{!260, !260, i64 0}
!260 = !{!"0x6079bb181af0", !19, i64 0}
!261 = distinct !{!261, !240, !241}
!262 = distinct !{!262, !241, !240}
!263 = distinct !{!263, !240, !241}
!264 = distinct !{!264, !241, !240}
!265 = !{!"branch_weights", i32 1073741824, i32 1073741824}
!266 = distinct !{!266, !240, !241}
!267 = distinct !{!267, !240, !241}
!268 = distinct !{!268, !241, !240}
!269 = !DILocalVariable(name: "i1", scope: !208, file: !1, type: !8)
!270 = distinct !{!270, !240, !241}
!271 = distinct !{!271, !241, !240}
!272 = distinct !{!272, !241, !240}
!273 = distinct !{!273, !240, !241}
!274 = distinct !{!274, !241, !240}
!275 = distinct !{!275, !240, !241}
!276 = distinct !{!276, !241, !240}
!277 = !{!278, !278, i64 0}
!278 = !{!"0x6079bb14ee60", !19, i64 0}
!279 = distinct !{!279, !240, !241}
!280 = distinct !{!280, !241, !240}
