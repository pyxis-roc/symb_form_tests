; ModuleID = 'conv.ll'
source_filename = "TVMMod"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

$__profc_conv = comdat nodeduplicate

$__profc_TVMMod_conv_compute_ = comdat nodeduplicate

$__profc___truncsfhf2 = comdat nodeduplicate

$__profc___extendhfsf2 = comdat nodeduplicate

$__llvm_profile_filename = comdat any

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
@__llvm_profile_raw_version = hidden constant i64 72057594037927946, comdat
@__profc_conv = private global [49 x i64] zeroinitializer, section "__llvm_prf_cnts", comdat, align 8
@__profvp_conv = private global [33 x i64] zeroinitializer, section "__llvm_prf_vals", comdat($__profc_conv), align 8
@__profd_conv = private global { i64, i64, i64, i64, ptr, ptr, i32, [3 x i16], i32 } { i64 -5293417304136982578, i64 214707379603612669, i64 sub (i64 ptrtoint (ptr @__profc_conv to i64), i64 ptrtoint (ptr @__profd_conv to i64)), i64 0, ptr @conv.local, ptr @__profvp_conv, i32 49, [3 x i16] [i16 33, i16 0, i16 0], i32 0 }, section "__llvm_prf_data", comdat($__profc_conv), align 8
@__profc_TVMMod_conv_compute_ = private global [35 x i64] zeroinitializer, section "__llvm_prf_cnts", comdat, align 8
@__profvp_TVMMod_conv_compute_ = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", comdat($__profc_TVMMod_conv_compute_), align 8
@__profd_TVMMod_conv_compute_ = private global { i64, i64, i64, i64, ptr, ptr, i32, [3 x i16], i32 } { i64 2997439285288324262, i64 210526388759864175, i64 sub (i64 ptrtoint (ptr @__profc_TVMMod_conv_compute_ to i64), i64 ptrtoint (ptr @__profd_TVMMod_conv_compute_ to i64)), i64 0, ptr null, ptr @__profvp_TVMMod_conv_compute_, i32 35, [3 x i16] [i16 2, i16 1, i16 0], i32 0 }, section "__llvm_prf_data", comdat($__profc_TVMMod_conv_compute_), align 8
@__profc___truncsfhf2 = weak hidden global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", comdat, align 8
@__profd___truncsfhf2 = private global { i64, i64, i64, i64, ptr, ptr, i32, [3 x i16], i32 } { i64 -8399318204444975244, i64 650973723264992368, i64 sub (i64 ptrtoint (ptr @__profc___truncsfhf2 to i64), i64 ptrtoint (ptr @__profd___truncsfhf2 to i64)), i64 0, ptr @__truncsfhf2.local, ptr null, i32 9, [3 x i16] zeroinitializer, i32 0 }, section "__llvm_prf_data", comdat($__profc___truncsfhf2), align 8
@__profc___extendhfsf2 = weak hidden global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", comdat, align 8
@__profd___extendhfsf2 = private global { i64, i64, i64, i64, ptr, ptr, i32, [3 x i16], i32 } { i64 4517987130037941523, i64 13698032168178065, i64 sub (i64 ptrtoint (ptr @__profc___extendhfsf2 to i64), i64 ptrtoint (ptr @__profd___extendhfsf2 to i64)), i64 0, ptr @__extendhfsf2.local, ptr null, i32 11, [3 x i16] zeroinitializer, i32 0 }, section "__llvm_prf_data", comdat($__profc___extendhfsf2), align 8
@__llvm_prf_vnodes = private global [36 x { i64, i64, ptr }] zeroinitializer, section "__llvm_prf_vnds", align 8
@__llvm_prf_nm = private constant [59 x i8] c"49x\DAK\CE\CF+c\0C\09\F3\F5\CDO\B1N\06\B2\E3\93\F3s\0BJKR\E3\19\E3\E3K\8AJ\F3\92\8B\D32\D2\8C\80\9C\D4\8A\92\D4\BC\94\8C\B4\E24#\00\FD\B8\13_", section "__llvm_prf_names", align 1
@llvm.compiler.used = appending global [4 x ptr] [ptr @__profd_conv, ptr @__profd_TVMMod_conv_compute_, ptr @__profd___truncsfhf2, ptr @__profd___extendhfsf2], section "llvm.metadata"
@llvm.used = appending global [2 x ptr] [ptr @__llvm_prf_vnodes, ptr @__llvm_prf_nm], section "llvm.metadata"
@__llvm_profile_filename = hidden constant [19 x i8] c"default_%m.profraw\00", comdat

@conv.local = private alias i32 (ptr, ptr, i32, ptr), ptr @conv
@__truncsfhf2.local = private alias half (float), ptr @__truncsfhf2
@__extendhfsf2.local = private alias float (half), ptr @__extendhfsf2

define dllexport range(i32 -1, 1) i32 @conv(ptr noalias nocapture readnone %self_handle, ptr noalias readonly %args, i32 %num_args, ptr noalias nocapture readnone %result) local_unnamed_addr #0 !dbg !5 {
entry:
    #dbg_value(ptr %self_handle, !11, !DIExpression(), !15)
    #dbg_value(ptr %args, !12, !DIExpression(), !15)
    #dbg_value(i32 %num_args, !13, !DIExpression(), !15)
    #dbg_value(ptr %result, !14, !DIExpression(), !15)
  %0 = icmp eq i32 %num_args, 3, !dbg !15
  br i1 %0, label %assert_end, label %assert_fail, !dbg !15, !prof !16

common.ret:                                       ; preds = %assert_end70, %assert_fail69, %assert_fail67, %assert_fail65, %assert_fail63, %assert_fail61, %assert_fail57, %assert_fail55, %assert_fail53, %assert_fail51, %assert_fail49, %assert_fail47, %assert_fail45, %assert_fail43, %assert_fail41, %assert_fail39, %assert_fail35, %assert_fail33, %assert_fail31, %assert_fail29, %assert_fail27, %assert_fail25, %assert_fail23, %assert_fail21, %assert_fail19, %assert_fail15, %assert_fail13, %assert_fail11, %assert_fail9, %assert_fail7, %assert_fail5, %assert_fail3, %assert_fail1, %assert_fail
  %common.ret.op = phi i32 [ -1, %assert_fail ], [ -1, %assert_fail1 ], [ -1, %assert_fail3 ], [ -1, %assert_fail5 ], [ -1, %assert_fail7 ], [ -1, %assert_fail9 ], [ -1, %assert_fail11 ], [ -1, %assert_fail13 ], [ -1, %assert_fail15 ], [ -1, %assert_fail19 ], [ -1, %assert_fail21 ], [ -1, %assert_fail23 ], [ -1, %assert_fail25 ], [ -1, %assert_fail27 ], [ -1, %assert_fail29 ], [ -1, %assert_fail31 ], [ -1, %assert_fail33 ], [ -1, %assert_fail35 ], [ -1, %assert_fail39 ], [ -1, %assert_fail41 ], [ -1, %assert_fail43 ], [ -1, %assert_fail45 ], [ -1, %assert_fail47 ], [ -1, %assert_fail49 ], [ -1, %assert_fail51 ], [ -1, %assert_fail53 ], [ -1, %assert_fail55 ], [ -1, %assert_fail57 ], [ -1, %assert_fail61 ], [ -1, %assert_fail63 ], [ -1, %assert_fail65 ], [ -1, %assert_fail67 ], [ -1, %assert_fail69 ], [ %343, %assert_end70 ]
  ret i32 %common.ret.op, !dbg !15

assert_fail:                                      ; preds = %entry
  %pgocount = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 16), align 8, !dbg !15
  %1 = add i64 %pgocount, 1, !dbg !15
  store i64 %1, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 16), align 8, !dbg !15
  %2 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %3 = ptrtoint ptr %2 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %3, ptr @__profd_conv, i32 0), !dbg !15
  tail call void %2(ptr nonnull @.str.1, ptr nonnull @.str), !dbg !15
  br label %common.ret, !dbg !15

assert_end:                                       ; preds = %entry
  %.not = icmp eq ptr %args, null, !dbg !15
  br i1 %.not, label %assert_fail1, label %assert_end2, !dbg !15, !prof !20

assert_fail1:                                     ; preds = %assert_end
  %pgocount4 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 17), align 8, !dbg !15
  %4 = add i64 %pgocount4, 1, !dbg !15
  store i64 %4, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 17), align 8, !dbg !15
  %5 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %6 = ptrtoint ptr %5 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %6, ptr @__profd_conv, i32 1), !dbg !15
  tail call void %5(ptr nonnull @.str.1, ptr nonnull @.str.2), !dbg !15
  br label %common.ret, !dbg !15

assert_end2:                                      ; preds = %assert_end
  %var_A.type_index = load i32, ptr %args, align 4, !dbg !15
    #dbg_declare(i32 %var_A.type_index, !21, !DIExpression(), !15)
    #dbg_declare(i32 %var_A.type_index, !21, !DIExpression(), !15)
  %var_A.type_index.fr = freeze i32 %var_A.type_index, !dbg !15
  %7 = icmp sgt i32 %var_A.type_index.fr, 63, !dbg !15
  br i1 %7, label %assert_end4, label %switch.early.test, !dbg !15

switch.early.test:                                ; preds = %assert_end2
  %pgocount5 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 7), align 8, !dbg !15
  %8 = add i64 %pgocount5, 1, !dbg !15
  store i64 %8, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 7), align 8, !dbg !15
  switch i32 %var_A.type_index.fr, label %assert_fail3 [
    i32 7, label %switch.early.test.assert_end4_crit_edge
    i32 4, label %switch.early.test.assert_end4_crit_edge1
    i32 0, label %assert_end4
  ], !dbg !15

switch.early.test.assert_end4_crit_edge1:         ; preds = %switch.early.test
  %pgocount6 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 1), align 8, !dbg !15
  %9 = add i64 %pgocount6, 1, !dbg !15
  store i64 %9, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 1), align 8, !dbg !15
  br label %assert_end4, !dbg !15

switch.early.test.assert_end4_crit_edge:          ; preds = %switch.early.test
  %pgocount7 = load i64, ptr @__profc_conv, align 8, !dbg !15
  %10 = add i64 %pgocount7, 1, !dbg !15
  store i64 %10, ptr @__profc_conv, align 8, !dbg !15
  br label %assert_end4, !dbg !15

assert_fail3:                                     ; preds = %switch.early.test
  %pgocount8 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 10), align 8, !dbg !15
  %11 = add i64 %pgocount8, 1, !dbg !15
  store i64 %11, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 10), align 8, !dbg !15
  %12 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %13 = ptrtoint ptr %12 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %13, ptr @__profd_conv, i32 2), !dbg !15
  tail call void %12(ptr nonnull @.str.1, ptr nonnull @.str.3), !dbg !15
  br label %common.ret, !dbg !15

assert_end4:                                      ; preds = %switch.early.test.assert_end4_crit_edge1, %switch.early.test.assert_end4_crit_edge, %switch.early.test, %assert_end2
  %14 = getelementptr inbounds i8, ptr %args, i64 16, !dbg !15
  %var_W.type_index = load i32, ptr %14, align 4, !dbg !15
    #dbg_declare(i32 %var_W.type_index, !22, !DIExpression(), !15)
    #dbg_declare(i32 %var_W.type_index, !22, !DIExpression(), !15)
  %var_W.type_index.fr = freeze i32 %var_W.type_index, !dbg !15
  %15 = icmp sgt i32 %var_W.type_index.fr, 63, !dbg !15
  br i1 %15, label %assert_end6, label %switch.early.test72, !dbg !15

switch.early.test72:                              ; preds = %assert_end4
  %pgocount9 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 8), align 8, !dbg !15
  %16 = add i64 %pgocount9, 1, !dbg !15
  store i64 %16, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 8), align 8, !dbg !15
  switch i32 %var_W.type_index.fr, label %assert_fail5 [
    i32 7, label %switch.early.test72.assert_end6_crit_edge
    i32 4, label %switch.early.test72.assert_end6_crit_edge2
    i32 0, label %assert_end6
  ], !dbg !15

switch.early.test72.assert_end6_crit_edge2:       ; preds = %switch.early.test72
  %pgocount10 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 3), align 8, !dbg !15
  %17 = add i64 %pgocount10, 1, !dbg !15
  store i64 %17, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 3), align 8, !dbg !15
  br label %assert_end6, !dbg !15

switch.early.test72.assert_end6_crit_edge:        ; preds = %switch.early.test72
  %pgocount11 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 2), align 8, !dbg !15
  %18 = add i64 %pgocount11, 1, !dbg !15
  store i64 %18, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 2), align 8, !dbg !15
  br label %assert_end6, !dbg !15

assert_fail5:                                     ; preds = %switch.early.test72
  %pgocount12 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 11), align 8, !dbg !15
  %19 = add i64 %pgocount12, 1, !dbg !15
  store i64 %19, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 11), align 8, !dbg !15
  %20 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %21 = ptrtoint ptr %20 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %21, ptr @__profd_conv, i32 3), !dbg !15
  tail call void %20(ptr nonnull @.str.1, ptr nonnull @.str.4), !dbg !15
  br label %common.ret, !dbg !15

assert_end6:                                      ; preds = %switch.early.test72.assert_end6_crit_edge2, %switch.early.test72.assert_end6_crit_edge, %switch.early.test72, %assert_end4
  %22 = getelementptr inbounds i8, ptr %args, i64 32, !dbg !15
  %var_conv2d_nchw.type_index = load i32, ptr %22, align 4, !dbg !15
    #dbg_declare(i32 %var_conv2d_nchw.type_index, !23, !DIExpression(), !15)
    #dbg_declare(i32 %var_conv2d_nchw.type_index, !23, !DIExpression(), !15)
  %var_conv2d_nchw.type_index.fr = freeze i32 %var_conv2d_nchw.type_index, !dbg !15
  %23 = icmp sgt i32 %var_conv2d_nchw.type_index.fr, 63, !dbg !15
  br i1 %23, label %assert_end8, label %switch.early.test73, !dbg !15

switch.early.test73:                              ; preds = %assert_end6
  %pgocount13 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 9), align 8, !dbg !15
  %24 = add i64 %pgocount13, 1, !dbg !15
  store i64 %24, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 9), align 8, !dbg !15
  switch i32 %var_conv2d_nchw.type_index.fr, label %assert_fail7 [
    i32 7, label %switch.early.test73.assert_end8_crit_edge
    i32 4, label %switch.early.test73.assert_end8_crit_edge3
    i32 0, label %assert_end8
  ], !dbg !15

switch.early.test73.assert_end8_crit_edge3:       ; preds = %switch.early.test73
  %pgocount14 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 5), align 8, !dbg !15
  %25 = add i64 %pgocount14, 1, !dbg !15
  store i64 %25, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 5), align 8, !dbg !15
  br label %assert_end8, !dbg !15

switch.early.test73.assert_end8_crit_edge:        ; preds = %switch.early.test73
  %pgocount15 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 4), align 8, !dbg !15
  %26 = add i64 %pgocount15, 1, !dbg !15
  store i64 %26, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 4), align 8, !dbg !15
  br label %assert_end8, !dbg !15

assert_fail7:                                     ; preds = %switch.early.test73
  %pgocount16 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 12), align 8, !dbg !15
  %27 = add i64 %pgocount16, 1, !dbg !15
  store i64 %27, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 12), align 8, !dbg !15
  %28 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %29 = ptrtoint ptr %28 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %29, ptr @__profd_conv, i32 4), !dbg !15
  tail call void %28(ptr nonnull @.str.1, ptr nonnull @.str.5), !dbg !15
  br label %common.ret, !dbg !15

assert_end8:                                      ; preds = %switch.early.test73.assert_end8_crit_edge3, %switch.early.test73.assert_end8_crit_edge, %switch.early.test73, %assert_end6
  %30 = getelementptr inbounds i8, ptr %args, i64 8, !dbg !15
  %31 = load ptr, ptr %30, align 8, !dbg !15
  %32 = icmp eq i32 %var_A.type_index.fr, 72, !dbg !15
  %33 = zext i1 %32 to i64, !dbg !15
  %pgocount17 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 46), align 8, !dbg !15
  %34 = add i64 %pgocount17, %33, !dbg !15
  store i64 %34, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 46), align 8, !dbg !15
  %var_A.idx = select i1 %32, i64 16, i64 0, !dbg !15
  %var_A = getelementptr inbounds i8, ptr %31, i64 %var_A.idx, !dbg !15
    #dbg_declare(ptr %var_A, !24, !DIExpression(), !15)
    #dbg_declare(ptr %var_A, !24, !DIExpression(), !15)
  %35 = getelementptr inbounds i8, ptr %args, i64 24, !dbg !15
  %36 = load ptr, ptr %35, align 8, !dbg !15
  %37 = icmp eq i32 %var_W.type_index.fr, 72, !dbg !15
  %38 = zext i1 %37 to i64, !dbg !15
  %pgocount18 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 47), align 8, !dbg !15
  %39 = add i64 %pgocount18, %38, !dbg !15
  store i64 %39, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 47), align 8, !dbg !15
  %var_W.idx = select i1 %37, i64 16, i64 0, !dbg !15
  %var_W = getelementptr inbounds i8, ptr %36, i64 %var_W.idx, !dbg !15
    #dbg_declare(ptr %var_W, !25, !DIExpression(), !15)
    #dbg_declare(ptr %var_W, !25, !DIExpression(), !15)
  %40 = getelementptr inbounds i8, ptr %args, i64 40, !dbg !15
  %41 = load ptr, ptr %40, align 8, !dbg !15
  %42 = icmp eq i32 %var_conv2d_nchw.type_index.fr, 72, !dbg !15
  %43 = zext i1 %42 to i64, !dbg !15
  %pgocount19 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 48), align 8, !dbg !15
  %44 = add i64 %pgocount19, %43, !dbg !15
  store i64 %44, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 48), align 8, !dbg !15
  %var_conv2d_nchw.idx = select i1 %42, i64 16, i64 0, !dbg !15
  %var_conv2d_nchw = getelementptr inbounds i8, ptr %41, i64 %var_conv2d_nchw.idx, !dbg !15
    #dbg_declare(ptr %var_conv2d_nchw, !26, !DIExpression(), !15)
    #dbg_declare(ptr %var_conv2d_nchw, !26, !DIExpression(), !15)
  %.not75 = icmp eq ptr %31, null, !dbg !15
  br i1 %.not75, label %assert_fail9, label %assert_end10, !dbg !15, !prof !20

assert_fail9:                                     ; preds = %assert_end8
  %pgocount20 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 18), align 8, !dbg !15
  %45 = add i64 %pgocount20, 1, !dbg !15
  store i64 %45, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 18), align 8, !dbg !15
  %46 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %47 = ptrtoint ptr %46 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %47, ptr @__profd_conv, i32 5), !dbg !15
  tail call void %46(ptr nonnull @.str.1, ptr nonnull @.str.6), !dbg !15
  br label %common.ret, !dbg !15

assert_end10:                                     ; preds = %assert_end8
  %48 = getelementptr inbounds i8, ptr %var_A, i64 16, !dbg !15
  %49 = load i32, ptr %48, align 4, !dbg !15
  %50 = icmp eq i32 %49, 4, !dbg !15
  br i1 %50, label %assert_end12, label %assert_fail11, !dbg !15, !prof !16

assert_fail11:                                    ; preds = %assert_end10
  %pgocount21 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 19), align 8, !dbg !15
  %51 = add i64 %pgocount21, 1, !dbg !15
  store i64 %51, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 19), align 8, !dbg !15
  %52 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %53 = ptrtoint ptr %52 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %53, ptr @__profd_conv, i32 6), !dbg !15
  tail call void %52(ptr nonnull @.str.1, ptr nonnull @.str.7), !dbg !15
  br label %common.ret, !dbg !15

assert_end12:                                     ; preds = %assert_end10
  %54 = getelementptr inbounds i8, ptr %var_A, i64 24, !dbg !15
  %conv.var_A.shape = load ptr, ptr %54, align 8, !dbg !15
    #dbg_declare(ptr %conv.var_A.shape, !27, !DIExpression(), !15)
    #dbg_declare(ptr %conv.var_A.shape, !27, !DIExpression(), !15)
  %55 = load i64, ptr %conv.var_A.shape, align 8, !dbg !15, !tbaa !30
  %N = trunc i64 %55 to i32, !dbg !15
    #dbg_declare(i32 %N, !40, !DIExpression(), !15)
    #dbg_declare(i32 %N, !40, !DIExpression(), !15)
  %56 = getelementptr inbounds i8, ptr %conv.var_A.shape, i64 8, !dbg !15
  %57 = load i64, ptr %56, align 8, !dbg !15, !tbaa !41
  %CI = trunc i64 %57 to i32, !dbg !15
    #dbg_declare(i32 %CI, !43, !DIExpression(), !15)
    #dbg_declare(i32 %CI, !43, !DIExpression(), !15)
  %58 = getelementptr inbounds i8, ptr %conv.var_A.shape, i64 16, !dbg !15
  %59 = load i64, ptr %58, align 8, !dbg !15, !tbaa !44
  %H = trunc i64 %59 to i32, !dbg !15
    #dbg_declare(i32 %H, !47, !DIExpression(), !15)
    #dbg_declare(i32 %H, !47, !DIExpression(), !15)
  %60 = getelementptr inbounds i8, ptr %conv.var_A.shape, i64 24, !dbg !15
  %61 = load i64, ptr %60, align 8, !dbg !15, !tbaa !48
  %W = trunc i64 %61 to i32, !dbg !15
    #dbg_declare(i32 %W, !50, !DIExpression(), !15)
    #dbg_declare(i32 %W, !50, !DIExpression(), !15)
  %62 = getelementptr inbounds i8, ptr %var_A, i64 32, !dbg !15
  %conv.var_A.strides = load ptr, ptr %62, align 8, !dbg !15
    #dbg_declare(ptr %conv.var_A.strides, !51, !DIExpression(), !15)
    #dbg_declare(ptr %conv.var_A.strides, !51, !DIExpression(), !15)
  %63 = getelementptr inbounds i8, ptr %var_A, i64 12, !dbg !15
  %dev_id = load i32, ptr %63, align 4, !dbg !15
    #dbg_declare(i32 %dev_id, !52, !DIExpression(), !15)
    #dbg_declare(i32 %dev_id, !52, !DIExpression(), !15)
  %A = load ptr, ptr %var_A, align 8, !dbg !15
    #dbg_declare(ptr %A, !53, !DIExpression(), !15)
    #dbg_declare(ptr %A, !53, !DIExpression(), !15)
  call void @llvm.assume(i1 true) [ "align"(ptr %A, i64 64) ], !dbg !15
  %.not76 = icmp eq ptr %36, null, !dbg !15
  br i1 %.not76, label %assert_fail13, label %assert_end14, !dbg !15, !prof !20

assert_fail13:                                    ; preds = %assert_end12
  %pgocount22 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 20), align 8, !dbg !15
  %64 = add i64 %pgocount22, 1, !dbg !15
  store i64 %64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 20), align 8, !dbg !15
  %65 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %66 = ptrtoint ptr %65 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %66, ptr @__profd_conv, i32 7), !dbg !15
  tail call void %65(ptr nonnull @.str.1, ptr nonnull @.str.8), !dbg !15
  br label %common.ret, !dbg !15

assert_end14:                                     ; preds = %assert_end12
  %67 = getelementptr inbounds i8, ptr %var_W, i64 16, !dbg !15
  %68 = load i32, ptr %67, align 4, !dbg !15
  %69 = icmp eq i32 %68, 4, !dbg !15
  br i1 %69, label %assert_end16, label %assert_fail15, !dbg !15, !prof !16

assert_fail15:                                    ; preds = %assert_end14
  %pgocount23 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 21), align 8, !dbg !15
  %70 = add i64 %pgocount23, 1, !dbg !15
  store i64 %70, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 21), align 8, !dbg !15
  %71 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %72 = ptrtoint ptr %71 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %72, ptr @__profd_conv, i32 8), !dbg !15
  tail call void %71(ptr nonnull @.str.1, ptr nonnull @.str.9), !dbg !15
  br label %common.ret, !dbg !15

assert_end16:                                     ; preds = %assert_end14
  %73 = getelementptr inbounds i8, ptr %var_W, i64 24, !dbg !15
  %conv.var_W.shape = load ptr, ptr %73, align 8, !dbg !15
    #dbg_declare(ptr %conv.var_W.shape, !56, !DIExpression(), !15)
    #dbg_declare(ptr %conv.var_W.shape, !56, !DIExpression(), !15)
  %74 = load i64, ptr %conv.var_W.shape, align 8, !dbg !15, !tbaa !57
  %CO = trunc i64 %74 to i32, !dbg !15
    #dbg_declare(i32 %CO, !67, !DIExpression(), !15)
    #dbg_declare(i32 %CO, !67, !DIExpression(), !15)
  %75 = getelementptr inbounds i8, ptr %conv.var_W.shape, i64 16, !dbg !15
  %76 = load i64, ptr %75, align 8, !dbg !15, !tbaa !68
  %KH = trunc i64 %76 to i32, !dbg !15
    #dbg_declare(i32 %KH, !71, !DIExpression(), !15)
    #dbg_declare(i32 %KH, !71, !DIExpression(), !15)
  %77 = getelementptr inbounds i8, ptr %conv.var_W.shape, i64 24, !dbg !15
  %78 = load i64, ptr %77, align 8, !dbg !15, !tbaa !72
  %KW = trunc i64 %78 to i32, !dbg !15
    #dbg_declare(i32 %KW, !74, !DIExpression(), !15)
    #dbg_declare(i32 %KW, !74, !DIExpression(), !15)
  %79 = getelementptr inbounds i8, ptr %var_W, i64 32, !dbg !15
  %conv.var_W.strides = load ptr, ptr %79, align 8, !dbg !15
    #dbg_declare(ptr %conv.var_W.strides, !75, !DIExpression(), !15)
    #dbg_declare(ptr %conv.var_W.strides, !75, !DIExpression(), !15)
  %W71 = load ptr, ptr %var_W, align 8, !dbg !15
    #dbg_declare(ptr %W71, !76, !DIExpression(), !15)
    #dbg_declare(ptr %W71, !76, !DIExpression(), !15)
  call void @llvm.assume(i1 true) [ "align"(ptr %W71, i64 64) ], !dbg !15
  %.not77 = icmp eq ptr %41, null, !dbg !15
  br i1 %.not77, label %assert_fail19, label %assert_end20, !dbg !15, !prof !20

assert_fail19:                                    ; preds = %assert_end16
  %pgocount24 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 22), align 8, !dbg !15
  %80 = add i64 %pgocount24, 1, !dbg !15
  store i64 %80, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 22), align 8, !dbg !15
  %81 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %82 = ptrtoint ptr %81 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %82, ptr @__profd_conv, i32 9), !dbg !15
  tail call void %81(ptr nonnull @.str.1, ptr nonnull @.str.10), !dbg !15
  br label %common.ret, !dbg !15

assert_end20:                                     ; preds = %assert_end16
  %83 = getelementptr inbounds i8, ptr %var_conv2d_nchw, i64 16, !dbg !15
  %84 = load i32, ptr %83, align 4, !dbg !15
  %85 = icmp eq i32 %84, 4, !dbg !15
  br i1 %85, label %assert_end22, label %assert_fail21, !dbg !15, !prof !16

assert_fail21:                                    ; preds = %assert_end20
  %pgocount25 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 23), align 8, !dbg !15
  %86 = add i64 %pgocount25, 1, !dbg !15
  store i64 %86, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 23), align 8, !dbg !15
  %87 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %88 = ptrtoint ptr %87 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %88, ptr @__profd_conv, i32 10), !dbg !15
  tail call void %87(ptr nonnull @.str.1, ptr nonnull @.str.11), !dbg !15
  br label %common.ret, !dbg !15

assert_end22:                                     ; preds = %assert_end20
  %89 = getelementptr inbounds i8, ptr %var_conv2d_nchw, i64 24, !dbg !15
  %conv.var_conv2d_nchw.shape = load ptr, ptr %89, align 8, !dbg !15
    #dbg_declare(ptr %conv.var_conv2d_nchw.shape, !77, !DIExpression(), !15)
    #dbg_declare(ptr %conv.var_conv2d_nchw.shape, !77, !DIExpression(), !15)
  %90 = getelementptr inbounds i8, ptr %var_conv2d_nchw, i64 32, !dbg !15
  %conv.var_conv2d_nchw.strides = load ptr, ptr %90, align 8, !dbg !15
    #dbg_declare(ptr %conv.var_conv2d_nchw.strides, !78, !DIExpression(), !15)
    #dbg_declare(ptr %conv.var_conv2d_nchw.strides, !78, !DIExpression(), !15)
  %conv2d_nchw = load ptr, ptr %var_conv2d_nchw, align 8, !dbg !15
    #dbg_declare(ptr %conv2d_nchw, !79, !DIExpression(), !15)
    #dbg_declare(ptr %conv2d_nchw, !79, !DIExpression(), !15)
  call void @llvm.assume(i1 true) [ "align"(ptr %conv2d_nchw, i64 64) ], !dbg !15
  %91 = getelementptr inbounds i8, ptr %var_A, i64 22, !dbg !15
  %92 = load i16, ptr %91, align 2, !dbg !15
  %93 = icmp eq i16 %92, 1, !dbg !15
  %94 = getelementptr inbounds i8, ptr %var_A, i64 21, !dbg !15
  %95 = load i8, ptr %94, align 1, !dbg !15
  %96 = icmp eq i8 %95, 32, !dbg !15
  %97 = getelementptr inbounds i8, ptr %var_A, i64 20, !dbg !15
  %98 = load i8, ptr %97, align 1, !dbg !15
  %99 = icmp eq i8 %98, 2, !dbg !15
  %100 = and i1 %96, %99, !dbg !15
  %101 = and i1 %93, %100, !dbg !15
  br i1 %101, label %assert_end24, label %assert_fail23, !dbg !15, !prof !16

assert_fail23:                                    ; preds = %assert_end22
  %pgocount26 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 24), align 8, !dbg !15
  %102 = add i64 %pgocount26, 1, !dbg !15
  store i64 %102, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 24), align 8, !dbg !15
  %103 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %104 = ptrtoint ptr %103 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %104, ptr @__profd_conv, i32 11), !dbg !15
  tail call void %103(ptr nonnull @.str.1, ptr nonnull @.str.12), !dbg !15
  br label %common.ret, !dbg !15

assert_end24:                                     ; preds = %assert_end22
  %.not78 = icmp eq ptr %conv.var_A.strides, null, !dbg !15
  br i1 %.not78, label %assert_end24.if_end_crit_edge, label %if_then, !dbg !15, !prof !20

assert_end24.if_end_crit_edge:                    ; preds = %assert_end24
  %pgocount27 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 13), align 8, !dbg !15
  %105 = add i64 %pgocount27, 1, !dbg !15
  store i64 %105, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 13), align 8, !dbg !15
  br label %if_end, !dbg !15

if_then:                                          ; preds = %assert_end24
  %106 = mul nsw i32 %W, %H, !dbg !15
  %107 = mul nsw i32 %106, %CI, !dbg !15
  %108 = load i64, ptr %conv.var_A.strides, align 8, !dbg !15, !tbaa !80
  %109 = trunc i64 %108 to i32, !dbg !15
  %110 = icmp eq i32 %107, %109, !dbg !15
  %111 = icmp eq i32 %N, 1, !dbg !15
  %112 = or i1 %111, %110, !dbg !15
  %113 = getelementptr inbounds i8, ptr %conv.var_A.strides, i64 8, !dbg !15
  %114 = load i64, ptr %113, align 8, !dbg !15, !tbaa !90
  %115 = trunc i64 %114 to i32, !dbg !15
  %116 = icmp eq i32 %106, %115, !dbg !15
  %117 = icmp eq i32 %CI, 1, !dbg !15
  %118 = or i1 %117, %116, !dbg !15
  %119 = getelementptr inbounds i8, ptr %conv.var_A.strides, i64 16, !dbg !15
  %120 = load i64, ptr %119, align 8, !dbg !15, !tbaa !92
  %121 = trunc i64 %120 to i32, !dbg !15
  %122 = icmp eq i32 %W, %121, !dbg !15
  %123 = icmp eq i32 %H, 1, !dbg !15
  %124 = or i1 %123, %122, !dbg !15
  %125 = getelementptr inbounds i8, ptr %conv.var_A.strides, i64 24, !dbg !15
  %126 = load i64, ptr %125, align 8, !dbg !15, !tbaa !95
  %127 = and i64 %126, 4294967295, !dbg !15
  %128 = icmp eq i64 %127, 1, !dbg !15
  %129 = icmp eq i32 %W, 1, !dbg !15
  %130 = or i1 %129, %128, !dbg !15
  %131 = and i1 %124, %130, !dbg !15
  %132 = and i1 %118, %131, !dbg !15
  %133 = and i1 %112, %132, !dbg !15
  br i1 %133, label %if_end, label %assert_fail25, !dbg !15, !prof !16

if_end:                                           ; preds = %assert_end24.if_end_crit_edge, %if_then
  %134 = getelementptr inbounds i8, ptr %var_A, i64 40, !dbg !15
  %135 = load i64, ptr %134, align 8, !dbg !15
  %136 = icmp eq i64 %135, 0, !dbg !15
  br i1 %136, label %assert_end28, label %assert_fail27, !dbg !15, !prof !16

assert_fail25:                                    ; preds = %if_then
  %pgocount28 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 25), align 8, !dbg !15
  %137 = add i64 %pgocount28, 1, !dbg !15
  store i64 %137, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 25), align 8, !dbg !15
  %138 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %139 = ptrtoint ptr %138 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %139, ptr @__profd_conv, i32 12), !dbg !15
  tail call void %138(ptr nonnull @.str.1, ptr nonnull @.str.13), !dbg !15
  br label %common.ret, !dbg !15

assert_fail27:                                    ; preds = %if_end
  %pgocount29 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 26), align 8, !dbg !15
  %140 = add i64 %pgocount29, 1, !dbg !15
  store i64 %140, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 26), align 8, !dbg !15
  %141 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %142 = ptrtoint ptr %141 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %142, ptr @__profd_conv, i32 13), !dbg !15
  tail call void %141(ptr nonnull @.str.1, ptr nonnull @.str.14), !dbg !15
  br label %common.ret, !dbg !15

assert_end28:                                     ; preds = %if_end
  %143 = getelementptr inbounds i8, ptr %var_A, i64 8, !dbg !15
  %144 = load i32, ptr %143, align 4, !dbg !15
  %145 = icmp eq i32 %144, 1, !dbg !15
  br i1 %145, label %assert_end30, label %assert_fail29, !dbg !15, !prof !16

assert_fail29:                                    ; preds = %assert_end28
  %pgocount30 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 27), align 8, !dbg !15
  %146 = add i64 %pgocount30, 1, !dbg !15
  store i64 %146, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 27), align 8, !dbg !15
  %147 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %148 = ptrtoint ptr %147 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %148, ptr @__profd_conv, i32 14), !dbg !15
  tail call void %147(ptr nonnull @.str.1, ptr nonnull @.str.15), !dbg !15
  br label %common.ret, !dbg !15

assert_end30:                                     ; preds = %assert_end28
  %149 = icmp ne ptr %A, null, !dbg !15
  %150 = mul i32 %W, %H, !dbg !15
  %151 = mul i32 %150, %N, !dbg !15
  %152 = mul i32 %151, %CI, !dbg !15
  %153 = icmp eq i32 %152, 0, !dbg !15
  %154 = or i1 %153, %149, !dbg !15
  br i1 %154, label %assert_end32, label %assert_fail31, !dbg !15, !prof !16

assert_fail31:                                    ; preds = %assert_end30
  %pgocount31 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 28), align 8, !dbg !15
  %155 = add i64 %pgocount31, 1, !dbg !15
  store i64 %155, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 28), align 8, !dbg !15
  %156 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %157 = ptrtoint ptr %156 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %157, ptr @__profd_conv, i32 15), !dbg !15
  tail call void %156(ptr nonnull @.str.1, ptr nonnull @.str.16), !dbg !15
  br label %common.ret, !dbg !15

assert_end32:                                     ; preds = %assert_end30
  %158 = getelementptr inbounds i8, ptr %var_W, i64 22, !dbg !15
  %159 = load i16, ptr %158, align 2, !dbg !15
  %160 = icmp eq i16 %159, 1, !dbg !15
  %161 = getelementptr inbounds i8, ptr %var_W, i64 21, !dbg !15
  %162 = load i8, ptr %161, align 1, !dbg !15
  %163 = icmp eq i8 %162, 32, !dbg !15
  %164 = getelementptr inbounds i8, ptr %var_W, i64 20, !dbg !15
  %165 = load i8, ptr %164, align 1, !dbg !15
  %166 = icmp eq i8 %165, 2, !dbg !15
  %167 = and i1 %163, %166, !dbg !15
  %168 = and i1 %160, %167, !dbg !15
  br i1 %168, label %assert_end34, label %assert_fail33, !dbg !15, !prof !16

assert_fail33:                                    ; preds = %assert_end32
  %pgocount32 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 29), align 8, !dbg !15
  %169 = add i64 %pgocount32, 1, !dbg !15
  store i64 %169, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 29), align 8, !dbg !15
  %170 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %171 = ptrtoint ptr %170 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %171, ptr @__profd_conv, i32 16), !dbg !15
  tail call void %170(ptr nonnull @.str.1, ptr nonnull @.str.17), !dbg !15
  br label %common.ret, !dbg !15

assert_end34:                                     ; preds = %assert_end32
  %172 = getelementptr inbounds i8, ptr %conv.var_W.shape, i64 8, !dbg !15
  %173 = load i64, ptr %172, align 8, !dbg !15, !tbaa !97
  %174 = trunc i64 %173 to i32, !dbg !15
  %175 = icmp eq i32 %CI, %174, !dbg !15
  br i1 %175, label %assert_end36, label %assert_fail35, !dbg !15, !prof !16

assert_fail35:                                    ; preds = %assert_end34
  %pgocount33 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 30), align 8, !dbg !15
  %176 = add i64 %pgocount33, 1, !dbg !15
  store i64 %176, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 30), align 8, !dbg !15
  %177 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %178 = ptrtoint ptr %177 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %178, ptr @__profd_conv, i32 17), !dbg !15
  tail call void %177(ptr nonnull @.str.1, ptr nonnull @.str.18), !dbg !15
  br label %common.ret, !dbg !15

assert_end36:                                     ; preds = %assert_end34
  %.not79 = icmp eq ptr %conv.var_W.strides, null, !dbg !15
  br i1 %.not79, label %assert_end36.if_end38_crit_edge, label %if_then37, !dbg !15, !prof !20

assert_end36.if_end38_crit_edge:                  ; preds = %assert_end36
  %pgocount34 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 14), align 8, !dbg !15
  %179 = add i64 %pgocount34, 1, !dbg !15
  store i64 %179, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 14), align 8, !dbg !15
  br label %if_end38, !dbg !15

if_then37:                                        ; preds = %assert_end36
  %180 = mul nsw i32 %KW, %KH, !dbg !15
  %181 = mul nsw i32 %180, %CI, !dbg !15
  %182 = load i64, ptr %conv.var_W.strides, align 8, !dbg !15, !tbaa !99
  %183 = trunc i64 %182 to i32, !dbg !15
  %184 = icmp eq i32 %181, %183, !dbg !15
  %185 = icmp eq i32 %CO, 1, !dbg !15
  %186 = or i1 %185, %184, !dbg !15
  %187 = getelementptr inbounds i8, ptr %conv.var_W.strides, i64 8, !dbg !15
  %188 = load i64, ptr %187, align 8, !dbg !15, !tbaa !109
  %189 = trunc i64 %188 to i32, !dbg !15
  %190 = icmp eq i32 %180, %189, !dbg !15
  %191 = icmp eq i32 %CI, 1, !dbg !15
  %192 = or i1 %191, %190, !dbg !15
  %193 = getelementptr inbounds i8, ptr %conv.var_W.strides, i64 16, !dbg !15
  %194 = load i64, ptr %193, align 8, !dbg !15, !tbaa !111
  %195 = trunc i64 %194 to i32, !dbg !15
  %196 = icmp eq i32 %KW, %195, !dbg !15
  %197 = icmp eq i32 %KH, 1, !dbg !15
  %198 = or i1 %197, %196, !dbg !15
  %199 = getelementptr inbounds i8, ptr %conv.var_W.strides, i64 24, !dbg !15
  %200 = load i64, ptr %199, align 8, !dbg !15, !tbaa !114
  %201 = and i64 %200, 4294967295, !dbg !15
  %202 = icmp eq i64 %201, 1, !dbg !15
  %203 = icmp eq i32 %KW, 1, !dbg !15
  %204 = or i1 %203, %202, !dbg !15
  %205 = and i1 %198, %204, !dbg !15
  %206 = and i1 %192, %205, !dbg !15
  %207 = and i1 %186, %206, !dbg !15
  br i1 %207, label %if_end38, label %assert_fail39, !dbg !15, !prof !16

if_end38:                                         ; preds = %assert_end36.if_end38_crit_edge, %if_then37
  %208 = getelementptr inbounds i8, ptr %var_W, i64 40, !dbg !15
  %209 = load i64, ptr %208, align 8, !dbg !15
  %210 = icmp eq i64 %209, 0, !dbg !15
  br i1 %210, label %assert_end42, label %assert_fail41, !dbg !15, !prof !16

assert_fail39:                                    ; preds = %if_then37
  %pgocount35 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 31), align 8, !dbg !15
  %211 = add i64 %pgocount35, 1, !dbg !15
  store i64 %211, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 31), align 8, !dbg !15
  %212 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %213 = ptrtoint ptr %212 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %213, ptr @__profd_conv, i32 18), !dbg !15
  tail call void %212(ptr nonnull @.str.1, ptr nonnull @.str.19), !dbg !15
  br label %common.ret, !dbg !15

assert_fail41:                                    ; preds = %if_end38
  %pgocount36 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 32), align 8, !dbg !15
  %214 = add i64 %pgocount36, 1, !dbg !15
  store i64 %214, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 32), align 8, !dbg !15
  %215 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %216 = ptrtoint ptr %215 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %216, ptr @__profd_conv, i32 19), !dbg !15
  tail call void %215(ptr nonnull @.str.1, ptr nonnull @.str.20), !dbg !15
  br label %common.ret, !dbg !15

assert_end42:                                     ; preds = %if_end38
  %217 = getelementptr inbounds i8, ptr %var_W, i64 8, !dbg !15
  %218 = load i32, ptr %217, align 4, !dbg !15
  %219 = icmp eq i32 %218, 1, !dbg !15
  br i1 %219, label %assert_end44, label %assert_fail43, !dbg !15, !prof !16

assert_fail43:                                    ; preds = %assert_end42
  %pgocount37 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 33), align 8, !dbg !15
  %220 = add i64 %pgocount37, 1, !dbg !15
  store i64 %220, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 33), align 8, !dbg !15
  %221 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %222 = ptrtoint ptr %221 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %222, ptr @__profd_conv, i32 20), !dbg !15
  tail call void %221(ptr nonnull @.str.1, ptr nonnull @.str.21), !dbg !15
  br label %common.ret, !dbg !15

assert_end44:                                     ; preds = %assert_end42
  %223 = getelementptr inbounds i8, ptr %var_W, i64 12, !dbg !15
  %224 = load i32, ptr %223, align 4, !dbg !15
  %225 = icmp eq i32 %dev_id, %224, !dbg !15
  br i1 %225, label %assert_end46, label %assert_fail45, !dbg !15, !prof !16

assert_fail45:                                    ; preds = %assert_end44
  %pgocount38 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 34), align 8, !dbg !15
  %226 = add i64 %pgocount38, 1, !dbg !15
  store i64 %226, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 34), align 8, !dbg !15
  %227 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %228 = ptrtoint ptr %227 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %228, ptr @__profd_conv, i32 21), !dbg !15
  tail call void %227(ptr nonnull @.str.1, ptr nonnull @.str.22), !dbg !15
  br label %common.ret, !dbg !15

assert_end46:                                     ; preds = %assert_end44
  %229 = icmp ne ptr %W71, null, !dbg !15
  %230 = mul i32 %KW, %KH, !dbg !15
  %231 = mul i32 %230, %CI, !dbg !15
  %232 = mul i32 %231, %CO, !dbg !15
  %233 = icmp eq i32 %232, 0, !dbg !15
  %234 = or i1 %233, %229, !dbg !15
  br i1 %234, label %assert_end48, label %assert_fail47, !dbg !15, !prof !16

assert_fail47:                                    ; preds = %assert_end46
  %pgocount39 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 35), align 8, !dbg !15
  %235 = add i64 %pgocount39, 1, !dbg !15
  store i64 %235, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 35), align 8, !dbg !15
  %236 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %237 = ptrtoint ptr %236 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %237, ptr @__profd_conv, i32 22), !dbg !15
  tail call void %236(ptr nonnull @.str.1, ptr nonnull @.str.23), !dbg !15
  br label %common.ret, !dbg !15

assert_end48:                                     ; preds = %assert_end46
  %238 = getelementptr inbounds i8, ptr %var_conv2d_nchw, i64 22, !dbg !15
  %239 = load i16, ptr %238, align 2, !dbg !15
  %240 = icmp eq i16 %239, 1, !dbg !15
  %241 = getelementptr inbounds i8, ptr %var_conv2d_nchw, i64 21, !dbg !15
  %242 = load i8, ptr %241, align 1, !dbg !15
  %243 = icmp eq i8 %242, 32, !dbg !15
  %244 = getelementptr inbounds i8, ptr %var_conv2d_nchw, i64 20, !dbg !15
  %245 = load i8, ptr %244, align 1, !dbg !15
  %246 = icmp eq i8 %245, 2, !dbg !15
  %247 = and i1 %243, %246, !dbg !15
  %248 = and i1 %240, %247, !dbg !15
  br i1 %248, label %assert_end50, label %assert_fail49, !dbg !15, !prof !16

assert_fail49:                                    ; preds = %assert_end48
  %pgocount40 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 36), align 8, !dbg !15
  %249 = add i64 %pgocount40, 1, !dbg !15
  store i64 %249, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 36), align 8, !dbg !15
  %250 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %251 = ptrtoint ptr %250 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %251, ptr @__profd_conv, i32 23), !dbg !15
  tail call void %250(ptr nonnull @.str.1, ptr nonnull @.str.24), !dbg !15
  br label %common.ret, !dbg !15

assert_end50:                                     ; preds = %assert_end48
  %252 = load i64, ptr %conv.var_conv2d_nchw.shape, align 8, !dbg !15, !tbaa !116
  %253 = trunc i64 %252 to i32, !dbg !15
  %254 = icmp eq i32 %N, %253, !dbg !15
  br i1 %254, label %assert_end52, label %assert_fail51, !dbg !15, !prof !16

assert_fail51:                                    ; preds = %assert_end50
  %pgocount41 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 37), align 8, !dbg !15
  %255 = add i64 %pgocount41, 1, !dbg !15
  store i64 %255, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 37), align 8, !dbg !15
  %256 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %257 = ptrtoint ptr %256 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %257, ptr @__profd_conv, i32 24), !dbg !15
  tail call void %256(ptr nonnull @.str.1, ptr nonnull @.str.25), !dbg !15
  br label %common.ret, !dbg !15

assert_end52:                                     ; preds = %assert_end50
  %258 = getelementptr inbounds i8, ptr %conv.var_conv2d_nchw.shape, i64 8, !dbg !15
  %259 = load i64, ptr %258, align 8, !dbg !15, !tbaa !126
  %260 = trunc i64 %259 to i32, !dbg !15
  %261 = icmp eq i32 %CO, %260, !dbg !15
  br i1 %261, label %assert_end54, label %assert_fail53, !dbg !15, !prof !16

assert_fail53:                                    ; preds = %assert_end52
  %pgocount42 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 38), align 8, !dbg !15
  %262 = add i64 %pgocount42, 1, !dbg !15
  store i64 %262, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 38), align 8, !dbg !15
  %263 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %264 = ptrtoint ptr %263 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %264, ptr @__profd_conv, i32 25), !dbg !15
  tail call void %263(ptr nonnull @.str.1, ptr nonnull @.str.26), !dbg !15
  br label %common.ret, !dbg !15

assert_end54:                                     ; preds = %assert_end52
  %265 = add nsw i32 %H, 3, !dbg !15
  %266 = sub i32 %265, %KH, !dbg !15
  %267 = getelementptr inbounds i8, ptr %conv.var_conv2d_nchw.shape, i64 16, !dbg !15
  %268 = load i64, ptr %267, align 8, !dbg !15, !tbaa !128
  %269 = trunc i64 %268 to i32, !dbg !15
  %270 = icmp eq i32 %266, %269, !dbg !15
  br i1 %270, label %assert_end56, label %assert_fail55, !dbg !15, !prof !16

assert_fail55:                                    ; preds = %assert_end54
  %pgocount43 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 39), align 8, !dbg !15
  %271 = add i64 %pgocount43, 1, !dbg !15
  store i64 %271, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 39), align 8, !dbg !15
  %272 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %273 = ptrtoint ptr %272 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %273, ptr @__profd_conv, i32 26), !dbg !15
  tail call void %272(ptr nonnull @.str.1, ptr nonnull @.str.27), !dbg !15
  br label %common.ret, !dbg !15

assert_end56:                                     ; preds = %assert_end54
  %274 = add nsw i32 %W, 3, !dbg !15
  %275 = sub i32 %274, %KW, !dbg !15
  %276 = getelementptr inbounds i8, ptr %conv.var_conv2d_nchw.shape, i64 24, !dbg !15
  %277 = load i64, ptr %276, align 8, !dbg !15, !tbaa !131
  %278 = trunc i64 %277 to i32, !dbg !15
  %279 = icmp eq i32 %275, %278, !dbg !15
  br i1 %279, label %assert_end58, label %assert_fail57, !dbg !15, !prof !16

assert_fail57:                                    ; preds = %assert_end56
  %pgocount44 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 40), align 8, !dbg !15
  %280 = add i64 %pgocount44, 1, !dbg !15
  store i64 %280, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 40), align 8, !dbg !15
  %281 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %282 = ptrtoint ptr %281 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %282, ptr @__profd_conv, i32 27), !dbg !15
  tail call void %281(ptr nonnull @.str.1, ptr nonnull @.str.28), !dbg !15
  br label %common.ret, !dbg !15

assert_end58:                                     ; preds = %assert_end56
  %.not80 = icmp eq ptr %conv.var_conv2d_nchw.strides, null, !dbg !15
  br i1 %.not80, label %assert_end58.if_end60_crit_edge, label %if_then59, !dbg !15, !prof !20

assert_end58.if_end60_crit_edge:                  ; preds = %assert_end58
  %pgocount45 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 15), align 8, !dbg !15
  %283 = add i64 %pgocount45, 1, !dbg !15
  store i64 %283, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 15), align 8, !dbg !15
  br label %if_end60, !dbg !15

if_then59:                                        ; preds = %assert_end58
  %284 = mul nsw i32 %275, %266, !dbg !15
  %285 = mul nsw i32 %284, %CO, !dbg !15
  %286 = load i64, ptr %conv.var_conv2d_nchw.strides, align 8, !dbg !15, !tbaa !133
  %287 = trunc i64 %286 to i32, !dbg !15
  %288 = icmp eq i32 %285, %287, !dbg !15
  %289 = icmp eq i32 %N, 1, !dbg !15
  %290 = or i1 %289, %288, !dbg !15
  %291 = getelementptr inbounds i8, ptr %conv.var_conv2d_nchw.strides, i64 8, !dbg !15
  %292 = load i64, ptr %291, align 8, !dbg !15, !tbaa !143
  %293 = trunc i64 %292 to i32, !dbg !15
  %294 = icmp eq i32 %284, %293, !dbg !15
  %295 = icmp eq i32 %CO, 1, !dbg !15
  %296 = or i1 %295, %294, !dbg !15
  %297 = getelementptr inbounds i8, ptr %conv.var_conv2d_nchw.strides, i64 16, !dbg !15
  %298 = load i64, ptr %297, align 8, !dbg !15, !tbaa !145
  %299 = trunc i64 %298 to i32, !dbg !15
  %300 = icmp eq i32 %275, %299, !dbg !15
  %301 = icmp eq i32 %266, 1, !dbg !15
  %302 = or i1 %301, %300, !dbg !15
  %303 = getelementptr inbounds i8, ptr %conv.var_conv2d_nchw.strides, i64 24, !dbg !15
  %304 = load i64, ptr %303, align 8, !dbg !15, !tbaa !148
  %305 = and i64 %304, 4294967295, !dbg !15
  %306 = icmp eq i64 %305, 1, !dbg !15
  %307 = icmp eq i32 %275, 1, !dbg !15
  %308 = or i1 %307, %306, !dbg !15
  %309 = and i1 %302, %308, !dbg !15
  %310 = and i1 %296, %309, !dbg !15
  %311 = and i1 %290, %310, !dbg !15
  br i1 %311, label %if_end60, label %assert_fail61, !dbg !15, !prof !16

if_end60:                                         ; preds = %assert_end58.if_end60_crit_edge, %if_then59
  %312 = getelementptr inbounds i8, ptr %var_conv2d_nchw, i64 40, !dbg !15
  %313 = load i64, ptr %312, align 8, !dbg !15
  %314 = icmp eq i64 %313, 0, !dbg !15
  br i1 %314, label %assert_end64, label %assert_fail63, !dbg !15, !prof !16

assert_fail61:                                    ; preds = %if_then59
  %pgocount46 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 41), align 8, !dbg !15
  %315 = add i64 %pgocount46, 1, !dbg !15
  store i64 %315, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 41), align 8, !dbg !15
  %316 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %317 = ptrtoint ptr %316 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %317, ptr @__profd_conv, i32 28), !dbg !15
  tail call void %316(ptr nonnull @.str.1, ptr nonnull @.str.29), !dbg !15
  br label %common.ret, !dbg !15

assert_fail63:                                    ; preds = %if_end60
  %pgocount47 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 42), align 8, !dbg !15
  %318 = add i64 %pgocount47, 1, !dbg !15
  store i64 %318, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 42), align 8, !dbg !15
  %319 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %320 = ptrtoint ptr %319 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %320, ptr @__profd_conv, i32 29), !dbg !15
  tail call void %319(ptr nonnull @.str.1, ptr nonnull @.str.30), !dbg !15
  br label %common.ret, !dbg !15

assert_end64:                                     ; preds = %if_end60
  %321 = getelementptr inbounds i8, ptr %var_conv2d_nchw, i64 8, !dbg !15
  %322 = load i32, ptr %321, align 4, !dbg !15
  %323 = icmp eq i32 %322, 1, !dbg !15
  br i1 %323, label %assert_end66, label %assert_fail65, !dbg !15, !prof !16

assert_fail65:                                    ; preds = %assert_end64
  %pgocount48 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 43), align 8, !dbg !15
  %324 = add i64 %pgocount48, 1, !dbg !15
  store i64 %324, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 43), align 8, !dbg !15
  %325 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %326 = ptrtoint ptr %325 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %326, ptr @__profd_conv, i32 30), !dbg !15
  tail call void %325(ptr nonnull @.str.1, ptr nonnull @.str.31), !dbg !15
  br label %common.ret, !dbg !15

assert_end66:                                     ; preds = %assert_end64
  %327 = getelementptr inbounds i8, ptr %var_conv2d_nchw, i64 12, !dbg !15
  %328 = load i32, ptr %327, align 4, !dbg !15
  %329 = icmp eq i32 %dev_id, %328, !dbg !15
  br i1 %329, label %assert_end68, label %assert_fail67, !dbg !15, !prof !16

assert_fail67:                                    ; preds = %assert_end66
  %pgocount49 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 44), align 8, !dbg !15
  %330 = add i64 %pgocount49, 1, !dbg !15
  store i64 %330, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 44), align 8, !dbg !15
  %331 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %332 = ptrtoint ptr %331 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %332, ptr @__profd_conv, i32 31), !dbg !15
  tail call void %331(ptr nonnull @.str.1, ptr nonnull @.str.32), !dbg !15
  br label %common.ret, !dbg !15

assert_end68:                                     ; preds = %assert_end66
  %333 = icmp ne ptr %conv2d_nchw, null, !dbg !15
  %334 = mul nsw i32 %CO, %N, !dbg !15
  %335 = mul nsw i32 %334, %266, !dbg !15
  %336 = mul nsw i32 %335, %275, !dbg !15
  %337 = icmp eq i32 %336, 0, !dbg !15
  %338 = or i1 %337, %333, !dbg !15
  br i1 %338, label %assert_end70, label %assert_fail69, !dbg !15, !prof !16

assert_fail69:                                    ; preds = %assert_end68
  %pgocount50 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 45), align 8, !dbg !15
  %339 = add i64 %pgocount50, 1, !dbg !15
  store i64 %339, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 45), align 8, !dbg !15
  %340 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %341 = ptrtoint ptr %340 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %341, ptr @__profd_conv, i32 32), !dbg !15
  tail call void %340(ptr nonnull @.str.1, ptr nonnull @.str.33), !dbg !15
  br label %common.ret, !dbg !15

assert_end70:                                     ; preds = %assert_end68
  %pgocount51 = load i64, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 6), align 8, !dbg !15
  %342 = add i64 %pgocount51, 1, !dbg !15
  store i64 %342, ptr getelementptr inbounds ([49 x i64], ptr @__profc_conv, i32 0, i32 6), align 8, !dbg !15
  %343 = tail call fastcc i32 @conv_compute_(i32 %dev_id, i32 %N, i32 %CI, i32 %H, i32 %W, ptr %A, i32 %CO, i32 %KH, i32 %KW, ptr %conv2d_nchw, ptr %W71), !dbg !15
  br label %common.ret, !dbg !15
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: noinline
define internal fastcc range(i32 -1, 1) i32 @conv_compute_(i32 %dev_id, i32 %N, i32 %CI, i32 %H, i32 %W, ptr noalias nocapture readonly align 64 %A, i32 %CO, i32 %KH, i32 %KW, ptr noalias nocapture align 64 %conv2d_nchw, ptr noalias nocapture readonly align 64 %W1) unnamed_addr #2 !dbg !150 {
entry:
  %pgocount = load i64, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 7), align 8, !dbg !165
  %0 = add i64 %pgocount, 1, !dbg !165
  store i64 %0, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 7), align 8, !dbg !165
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
  %1 = add i32 %W, 2, !dbg !165
  %2 = add i32 %H, 2, !dbg !165
  %3 = mul nsw i32 %CI, %N, !dbg !165
  %4 = mul nsw i32 %3, %2, !dbg !165
  %5 = mul nsw i32 %4, %1, !dbg !165
  %6 = sext i32 %5 to i64, !dbg !165
  %7 = shl nuw nsw i64 %6, 2, !dbg !165
  %8 = load ptr, ptr @__TVMBackendAllocWorkspace, align 8, !dbg !165, !tbaa !17
  %9 = ptrtoint ptr %8 to i64, !dbg !165
  call void @__llvm_profile_instrument_target(i64 %9, ptr @__profd_TVMMod_conv_compute_, i32 0), !dbg !165
  %pad_temp = tail call ptr %8(i32 1, i32 %dev_id, i64 %7, i32 2, i32 32), !dbg !165
    #dbg_declare(ptr %pad_temp, !166, !DIExpression(), !165)
    #dbg_declare(ptr %pad_temp, !166, !DIExpression(), !165)
  call void @llvm.assume(i1 true) [ "align"(ptr %pad_temp, i64 64) ], !dbg !165
  %10 = icmp eq ptr %pad_temp, null, !dbg !165
  br i1 %10, label %common.ret, label %for_begin_i0.preheader, !dbg !165, !prof !16

for_begin_i0.preheader:                           ; preds = %entry
    #dbg_declare(i32 0, !167, !DIExpression(), !165)
  %11 = icmp sgt i32 %N, 0, !dbg !165
  br i1 %11, label %for_begin_i1.preheader.lr.ph, label %for_end_nn, !dbg !165, !prof !168

for_begin_i1.preheader.lr.ph:                     ; preds = %for_begin_i0.preheader
  %pgocount1 = load i64, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 8), align 8
  %12 = add i64 %pgocount1, 1
  store i64 %12, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 8), align 8
  %13 = icmp slt i32 %CI, 1
  %invariant.gep = getelementptr i8, ptr %A, i64 -4
  %14 = icmp slt i32 %W, -1
  %15 = icmp slt i32 %H, -1
  %16 = zext i1 %13 to i64
  %pgocount2 = load i64, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 26), align 8
  %17 = add i64 %pgocount2, %16
  store i64 %17, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 26), align 8
  %or.cond.not196 = select i1 %13, i1 true, i1 %15
  %18 = zext i1 %or.cond.not196 to i64
  %pgocount3 = load i64, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 27), align 8
  %19 = add i64 %pgocount3, %18
  store i64 %19, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 27), align 8
  %brmerge = select i1 %or.cond.not196, i1 true, i1 %14
  br i1 %brmerge, label %for_begin_ff.preheader.lr.ph, label %for_begin_i1.preheader.us.us.us.preheader, !prof !169

for_begin_i1.preheader.us.us.us.preheader:        ; preds = %for_begin_i1.preheader.lr.ph
  %20 = mul i32 %1, %CI
  %21 = mul i32 %20, %2
  %22 = mul i32 %1, %2
  %smax = tail call i32 @llvm.smax.i32(i32 %1, i32 1), !dbg !165
  %23 = zext nneg i32 %smax to i64, !dbg !165
  %24 = shl nuw nsw i64 %23, 2, !dbg !165
  %25 = sext i32 %W to i64, !dbg !165
  %26 = sext i32 %H to i64, !dbg !165
  %27 = sext i32 %1 to i64, !dbg !165
  %smax121 = tail call i32 @llvm.smax.i32(i32 %2, i32 1), !dbg !165
  %28 = sext i32 %2 to i64, !dbg !165
  %29 = zext nneg i32 %CI to i64, !dbg !165
  %wide.trip.count132 = zext nneg i32 %N to i64, !dbg !165
  %wide.trip.count127 = zext nneg i32 %CI to i64
  %wide.trip.count122 = zext nneg i32 %smax121 to i64
  %exitcond.peel.not = icmp ugt i32 %W, 2147483645
  %30 = add nsw i64 %23, -1, !dbg !165
  %xtraiter = and i64 %30, 1
  %31 = icmp eq i32 %W, 0
  %unroll_iter = and i64 %30, -2
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br label %for_begin_i1.preheader.us.us.us, !dbg !165

for_begin_i1.preheader.us.us.us:                  ; preds = %for_begin_i1.for_end_i1_crit_edge.split.us.split.us.us.us.us, %for_begin_i1.preheader.us.us.us.preheader
  %indvars.iv129 = phi i64 [ 0, %for_begin_i1.preheader.us.us.us.preheader ], [ %indvars.iv.next130, %for_begin_i1.for_end_i1_crit_edge.split.us.split.us.us.us.us ]
  %32 = trunc nuw nsw i64 %indvars.iv129 to i32
  %33 = mul i32 %21, %32
    #dbg_declare(i64 %indvars.iv129, !167, !DIExpression(), !165)
    #dbg_declare(i32 0, !170, !DIExpression(), !165)
  %34 = mul nuw nsw i64 %indvars.iv129, %29
  br label %for_begin_i2.preheader.us.us.us.us.us, !dbg !165

for_begin_i2.preheader.us.us.us.us.us:            ; preds = %for_begin_i2.for_end_i2_crit_edge.split.us.us.us.us.us.us, %for_begin_i1.preheader.us.us.us
  %indvars.iv124 = phi i64 [ %indvars.iv.next125, %for_begin_i2.for_end_i2_crit_edge.split.us.us.us.us.us.us ], [ 0, %for_begin_i1.preheader.us.us.us ]
  %35 = trunc nuw nsw i64 %indvars.iv124 to i32
  %36 = mul i32 %22, %35
  %37 = add i32 %33, %36
    #dbg_declare(i64 %indvars.iv124, !170, !DIExpression(), !165)
    #dbg_declare(i32 0, !171, !DIExpression(), !165)
  %38 = add nuw nsw i64 %indvars.iv124, %34
  %39 = trunc i64 %38 to i32
  %40 = mul i32 %39, %H
  %41 = add i32 %40, -1
  %42 = mul nsw i64 %38, %28
  br label %for_begin_i3.preheader.us.us.us.us.us.us, !dbg !165

for_begin_i3.preheader.us.us.us.us.us.us:         ; preds = %for_begin_i3.for_end_i3_crit_edge.us.us.us.us.us.us, %for_begin_i2.preheader.us.us.us.us.us
  %indvars.iv118 = phi i64 [ %indvars.iv.next119, %for_begin_i3.for_end_i3_crit_edge.us.us.us.us.us.us ], [ 0, %for_begin_i2.preheader.us.us.us.us.us ]
  %43 = trunc nuw nsw i64 %indvars.iv118 to i32
    #dbg_declare(i64 %indvars.iv118, !171, !DIExpression(), !165)
    #dbg_declare(i32 0, !172, !DIExpression(), !165)
  %44 = icmp sle i64 %indvars.iv118, %26
  %45 = icmp ne i64 %indvars.iv118, 0
  %46 = and i1 %45, %44
  %47 = add nsw i64 %indvars.iv118, %42
  %48 = mul nsw i64 %47, %27
  %.fr.us.us.us.us.us.us = freeze i1 %46
  br i1 %.fr.us.us.us.us.us.us, label %if_end3.us.us.us.us.us.us.peel, label %for_body_i3.us.us.us.us.us.us.us.preheader

for_body_i3.us.us.us.us.us.us.us.preheader:       ; preds = %for_begin_i3.preheader.us.us.us.us.us.us
  %pgocount4 = load i64, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 9), align 8
  %49 = add i64 %pgocount4, 1
  store i64 %49, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 9), align 8
  %50 = mul i32 %1, %43
  %51 = add i32 %37, %50
  %52 = sext i32 %51 to i64
  %53 = shl nsw i64 %52, 2
  %scevgep = getelementptr i8, ptr %pad_temp, i64 %53
  call void @__llvm_profile_instrument_memop(i64 %24, ptr @__profd_TVMMod_conv_compute_, i32 2), !dbg !165
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(1) %scevgep, i8 0, i64 %24, i1 false), !dbg !165, !tbaa !173
    #dbg_declare(i64 poison, !172, !DIExpression(), !165)
  br label %for_begin_i3.for_end_i3_crit_edge.us.us.us.us.us.us, !dbg !165

if_end3.us.us.us.us.us.us.peel:                   ; preds = %for_begin_i3.preheader.us.us.us.us.us.us
    #dbg_declare(i64 0, !172, !DIExpression(), !165)
  %54 = getelementptr inbounds float, ptr %pad_temp, i64 %48, !dbg !165
  store float 0.000000e+00, ptr %54, align 4, !dbg !165, !tbaa !173
    #dbg_declare(i64 1, !172, !DIExpression(), !165)
  br i1 %exitcond.peel.not, label %if_end3.us.us.us.us.us.us.peel.for_begin_i3.for_end_i3_crit_edge.us.us.us.us.us.us_crit_edge, label %for_body_i3.us13.us.us.us.us.us.peel.next, !dbg !165, !prof !175

if_end3.us.us.us.us.us.us.peel.for_begin_i3.for_end_i3_crit_edge.us.us.us.us.us.us_crit_edge: ; preds = %if_end3.us.us.us.us.us.us.peel
  %pgocount5 = load i64, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 10), align 8, !dbg !165
  %55 = add i64 %pgocount5, 1, !dbg !165
  store i64 %55, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 10), align 8, !dbg !165
  br label %for_begin_i3.for_end_i3_crit_edge.us.us.us.us.us.us, !dbg !165

for_body_i3.us13.us.us.us.us.us.peel.next:        ; preds = %if_end3.us.us.us.us.us.us.peel
  %pgocount6 = load i64, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 11), align 8
  %56 = add i64 %pgocount6, 1
  store i64 %56, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 11), align 8
  %57 = add i32 %41, %43
  %58 = mul nsw i32 %57, %W
  %59 = sext i32 %58 to i64, !dbg !165
  %invariant.gep171 = getelementptr float, ptr %invariant.gep, i64 %59, !dbg !165
  %invariant.gep172 = getelementptr float, ptr %pad_temp, i64 %48, !dbg !165
  br i1 %31, label %for_begin_i3.for_end_i3_crit_edge.us.us.us.us.us.us.loopexit.unr-lcssa, label %for_body_i3.us13.us.us.us.us.us, !dbg !165, !prof !176

for_body_i3.us13.us.us.us.us.us:                  ; preds = %if_end3.us.us.us.us.us.us.1, %for_body_i3.us13.us.us.us.us.us.peel.next
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %if_end3.us.us.us.us.us.us.1 ], [ 1, %for_body_i3.us13.us.us.us.us.us.peel.next ]
  %niter = phi i64 [ %niter.next.1, %if_end3.us.us.us.us.us.us.1 ], [ 0, %for_body_i3.us13.us.us.us.us.us.peel.next ]
    #dbg_declare(i64 %indvars.iv, !172, !DIExpression(), !165)
  %.not169 = icmp sgt i64 %indvars.iv, %25, !dbg !165
  br i1 %.not169, label %if_end3.us.us.us.us.us.us, label %if_then2.us.us.us.us.us.us, !dbg !165

if_then2.us.us.us.us.us.us:                       ; preds = %for_body_i3.us13.us.us.us.us.us
  %pgocount7 = load i64, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 12), align 8, !dbg !165
  %60 = add i64 %pgocount7, 1, !dbg !165
  store i64 %60, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 12), align 8, !dbg !165
  %gep = getelementptr float, ptr %invariant.gep171, i64 %indvars.iv, !dbg !165
  %61 = load float, ptr %gep, align 4, !dbg !165, !tbaa !177
  br label %if_end3.us.us.us.us.us.us, !dbg !165

if_end3.us.us.us.us.us.us:                        ; preds = %if_then2.us.us.us.us.us.us, %for_body_i3.us13.us.us.us.us.us
  %62 = phi float [ %61, %if_then2.us.us.us.us.us.us ], [ 0.000000e+00, %for_body_i3.us13.us.us.us.us.us ], !dbg !165
  %gep173 = getelementptr float, ptr %invariant.gep172, i64 %indvars.iv, !dbg !165
  store float %62, ptr %gep173, align 4, !dbg !165, !tbaa !173
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !165
    #dbg_declare(i64 %indvars.iv.next, !172, !DIExpression(), !165)
    #dbg_declare(i64 %indvars.iv.next, !172, !DIExpression(), !165)
  %.not169.1.not = icmp slt i64 %indvars.iv, %25, !dbg !165
  br i1 %.not169.1.not, label %if_then2.us.us.us.us.us.us.1, label %if_end3.us.us.us.us.us.us.if_end3.us.us.us.us.us.us.1_crit_edge, !dbg !165

if_end3.us.us.us.us.us.us.if_end3.us.us.us.us.us.us.1_crit_edge: ; preds = %if_end3.us.us.us.us.us.us
  %pgocount8 = load i64, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 5), align 8, !dbg !165
  %63 = add i64 %pgocount8, 1, !dbg !165
  store i64 %63, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 5), align 8, !dbg !165
  br label %if_end3.us.us.us.us.us.us.1, !dbg !165

if_then2.us.us.us.us.us.us.1:                     ; preds = %if_end3.us.us.us.us.us.us
  %pgocount9 = load i64, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 13), align 8, !dbg !165
  %64 = add i64 %pgocount9, 1, !dbg !165
  store i64 %64, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 13), align 8, !dbg !165
  %gep.1 = getelementptr float, ptr %invariant.gep171, i64 %indvars.iv.next, !dbg !165
  %65 = load float, ptr %gep.1, align 4, !dbg !165, !tbaa !177
  br label %if_end3.us.us.us.us.us.us.1, !dbg !165

if_end3.us.us.us.us.us.us.1:                      ; preds = %if_end3.us.us.us.us.us.us.if_end3.us.us.us.us.us.us.1_crit_edge, %if_then2.us.us.us.us.us.us.1
  %66 = phi float [ %65, %if_then2.us.us.us.us.us.us.1 ], [ 0.000000e+00, %if_end3.us.us.us.us.us.us.if_end3.us.us.us.us.us.us.1_crit_edge ], !dbg !165
  %gep173.1 = getelementptr float, ptr %invariant.gep172, i64 %indvars.iv.next, !dbg !165
  store float %66, ptr %gep173.1, align 4, !dbg !165, !tbaa !173
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2, !dbg !165
    #dbg_declare(i64 %indvars.iv.next.1, !172, !DIExpression(), !165)
  %niter.next.1 = add i64 %niter, 2, !dbg !165
  %niter.ncmp.1 = icmp eq i64 %niter.next.1, %unroll_iter, !dbg !165
  br i1 %niter.ncmp.1, label %if_end3.us.us.us.us.us.us.1.for_begin_i3.for_end_i3_crit_edge.us.us.us.us.us.us.loopexit.unr-lcssa_crit_edge, label %for_body_i3.us13.us.us.us.us.us, !dbg !165, !prof !179, !llvm.loop !180

if_end3.us.us.us.us.us.us.1.for_begin_i3.for_end_i3_crit_edge.us.us.us.us.us.us.loopexit.unr-lcssa_crit_edge: ; preds = %if_end3.us.us.us.us.us.us.1
  %pgocount10 = load i64, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 14), align 8, !dbg !165
  %67 = add i64 %pgocount10, 1, !dbg !165
  store i64 %67, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 14), align 8, !dbg !165
  br label %for_begin_i3.for_end_i3_crit_edge.us.us.us.us.us.us.loopexit.unr-lcssa, !dbg !165

for_begin_i3.for_end_i3_crit_edge.us.us.us.us.us.us.loopexit.unr-lcssa: ; preds = %if_end3.us.us.us.us.us.us.1.for_begin_i3.for_end_i3_crit_edge.us.us.us.us.us.us.loopexit.unr-lcssa_crit_edge, %for_body_i3.us13.us.us.us.us.us.peel.next
  %indvars.iv.unr = phi i64 [ 1, %for_body_i3.us13.us.us.us.us.us.peel.next ], [ %indvars.iv.next.1, %if_end3.us.us.us.us.us.us.1.for_begin_i3.for_end_i3_crit_edge.us.us.us.us.us.us.loopexit.unr-lcssa_crit_edge ]
  br i1 %lcmp.mod.not, label %for_begin_i3.for_end_i3_crit_edge.us.us.us.us.us.us, label %for_body_i3.us13.us.us.us.us.us.epil, !dbg !165, !prof !182

for_body_i3.us13.us.us.us.us.us.epil:             ; preds = %for_begin_i3.for_end_i3_crit_edge.us.us.us.us.us.us.loopexit.unr-lcssa
    #dbg_declare(i64 %indvars.iv.unr, !172, !DIExpression(), !165)
  %.not169.epil = icmp sgt i64 %indvars.iv.unr, %25, !dbg !165
  br i1 %.not169.epil, label %if_end3.us.us.us.us.us.us.epil, label %if_then2.us.us.us.us.us.us.epil, !dbg !165

if_then2.us.us.us.us.us.us.epil:                  ; preds = %for_body_i3.us13.us.us.us.us.us.epil
  %pgocount11 = load i64, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 15), align 8, !dbg !165
  %68 = add i64 %pgocount11, 1, !dbg !165
  store i64 %68, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 15), align 8, !dbg !165
  %gep.epil = getelementptr float, ptr %invariant.gep171, i64 %indvars.iv.unr, !dbg !165
  %69 = load float, ptr %gep.epil, align 4, !dbg !165, !tbaa !177
  br label %if_end3.us.us.us.us.us.us.epil, !dbg !165

if_end3.us.us.us.us.us.us.epil:                   ; preds = %if_then2.us.us.us.us.us.us.epil, %for_body_i3.us13.us.us.us.us.us.epil
  %70 = phi float [ %69, %if_then2.us.us.us.us.us.us.epil ], [ 0.000000e+00, %for_body_i3.us13.us.us.us.us.us.epil ], !dbg !165
  %pgocount12 = load i64, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 16), align 8, !dbg !165
  %71 = add i64 %pgocount12, 1, !dbg !165
  store i64 %71, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 16), align 8, !dbg !165
  %gep173.epil = getelementptr float, ptr %invariant.gep172, i64 %indvars.iv.unr, !dbg !165
  store float %70, ptr %gep173.epil, align 4, !dbg !165, !tbaa !173
    #dbg_declare(i64 %indvars.iv.unr, !172, !DIExpression(DW_OP_plus_uconst, 1), !165)
  br label %for_begin_i3.for_end_i3_crit_edge.us.us.us.us.us.us, !dbg !165

for_begin_i3.for_end_i3_crit_edge.us.us.us.us.us.us: ; preds = %if_end3.us.us.us.us.us.us.peel.for_begin_i3.for_end_i3_crit_edge.us.us.us.us.us.us_crit_edge, %if_end3.us.us.us.us.us.us.epil, %for_begin_i3.for_end_i3_crit_edge.us.us.us.us.us.us.loopexit.unr-lcssa, %for_body_i3.us.us.us.us.us.us.us.preheader
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1, !dbg !165
    #dbg_declare(i64 %indvars.iv.next119, !171, !DIExpression(), !165)
  %exitcond123.not = icmp eq i64 %indvars.iv.next119, %wide.trip.count122, !dbg !165
  br i1 %exitcond123.not, label %for_begin_i2.for_end_i2_crit_edge.split.us.us.us.us.us.us, label %for_begin_i3.preheader.us.us.us.us.us.us, !dbg !165, !prof !175

for_begin_i2.for_end_i2_crit_edge.split.us.us.us.us.us.us: ; preds = %for_begin_i3.for_end_i3_crit_edge.us.us.us.us.us.us
  %pgocount13 = load i64, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 17), align 8, !dbg !165
  %72 = add i64 %pgocount13, 1, !dbg !165
  store i64 %72, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 17), align 8, !dbg !165
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1, !dbg !165
    #dbg_declare(i64 %indvars.iv.next125, !170, !DIExpression(), !165)
  %exitcond128.not = icmp eq i64 %indvars.iv.next125, %wide.trip.count127, !dbg !165
  br i1 %exitcond128.not, label %for_begin_i1.for_end_i1_crit_edge.split.us.split.us.us.us.us, label %for_begin_i2.preheader.us.us.us.us.us, !dbg !165, !prof !175

for_begin_i1.for_end_i1_crit_edge.split.us.split.us.us.us.us: ; preds = %for_begin_i2.for_end_i2_crit_edge.split.us.us.us.us.us.us
  %pgocount14 = load i64, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 18), align 8, !dbg !165
  %73 = add i64 %pgocount14, 1, !dbg !165
  store i64 %73, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 18), align 8, !dbg !165
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1, !dbg !165
    #dbg_declare(i64 %indvars.iv.next130, !167, !DIExpression(), !165)
  %exitcond133.not = icmp eq i64 %indvars.iv.next130, %wide.trip.count132, !dbg !165
  br i1 %exitcond133.not, label %for_begin_nn.preheader, label %for_begin_i1.preheader.us.us.us, !dbg !165, !prof !175

common.ret:                                       ; preds = %for_end_nn, %entry
  %common.ret.op = phi i32 [ -1, %entry ], [ %., %for_end_nn ]
  ret i32 %common.ret.op, !dbg !165

for_begin_nn.preheader:                           ; preds = %for_begin_i1.for_end_i1_crit_edge.split.us.split.us.us.us.us
  %pgocount15 = load i64, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 19), align 8, !dbg !165
  %74 = add i64 %pgocount15, 1, !dbg !165
  store i64 %74, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 19), align 8, !dbg !165
    #dbg_declare(i32 0, !183, !DIExpression(), !165)
  br i1 %11, label %for_begin_ff.preheader.lr.ph, label %for_end_nn, !dbg !165, !prof !184

for_begin_ff.preheader.lr.ph:                     ; preds = %for_begin_nn.preheader, %for_begin_i1.preheader.lr.ph
  %75 = icmp slt i32 %CO, 1
  %76 = add i32 %H, 3
  %77 = sub i32 %76, %KH
  %78 = add i32 %W, 3
  %79 = sub i32 %78, %KW
  %80 = icmp slt i32 %79, 1
  %81 = icmp slt i32 %CI, 1
  %82 = icmp slt i32 %KH, 1
  %83 = icmp slt i32 %KW, 1
  %84 = icmp slt i32 %77, 1
  %85 = zext i1 %75 to i64
  %pgocount16 = load i64, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 28), align 8
  %86 = add i64 %pgocount16, %85
  store i64 %86, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 28), align 8
  %or.cond184.not199 = select i1 %75, i1 true, i1 %84
  %87 = zext i1 %or.cond184.not199 to i64
  %pgocount17 = load i64, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 29), align 8
  %88 = add i64 %pgocount17, %87
  store i64 %88, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 29), align 8
  %brmerge186 = select i1 %or.cond184.not199, i1 true, i1 %80
  %89 = zext i1 %brmerge186 to i64
  %pgocount18 = load i64, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 30), align 8
  %90 = add i64 %pgocount18, %89
  store i64 %90, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 30), align 8
  %brmerge188 = select i1 %brmerge186, i1 true, i1 %81
  %91 = zext i1 %brmerge188 to i64
  %pgocount19 = load i64, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 31), align 8
  %92 = add i64 %pgocount19, %91
  store i64 %92, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 31), align 8
  %brmerge190 = select i1 %brmerge188, i1 true, i1 %82
  %93 = zext i1 %brmerge190 to i64
  %pgocount20 = load i64, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 32), align 8
  %94 = add i64 %pgocount20, %93
  store i64 %94, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 32), align 8
  %brmerge192 = select i1 %brmerge190, i1 true, i1 %83
  br i1 %brmerge192, label %for_begin_ff.preheader.lr.ph.for_end_nn_crit_edge, label %for_begin_ff.preheader.us.us.us.us.us.us.preheader, !prof !185

for_begin_ff.preheader.lr.ph.for_end_nn_crit_edge: ; preds = %for_begin_ff.preheader.lr.ph
  %pgocount21 = load i64, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 6), align 8
  %95 = add i64 %pgocount21, 1
  store i64 %95, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 6), align 8
  br label %for_end_nn

for_begin_ff.preheader.us.us.us.us.us.us.preheader: ; preds = %for_begin_ff.preheader.lr.ph
  %96 = sext i32 %1 to i64, !dbg !165
  %97 = zext nneg i32 %KW to i64, !dbg !165
  %98 = sext i32 %2 to i64, !dbg !165
  %99 = zext nneg i32 %KH to i64, !dbg !165
  %100 = zext nneg i32 %79 to i64, !dbg !165
  %101 = zext nneg i32 %77 to i64, !dbg !165
  %102 = zext nneg i32 %CI to i64, !dbg !165
  %103 = zext nneg i32 %CO to i64, !dbg !165
  %wide.trip.count167 = zext nneg i32 %N to i64, !dbg !165
  %wide.trip.count162 = zext nneg i32 %CO to i64
  %wide.trip.count157 = zext nneg i32 %77 to i64
  %wide.trip.count152 = zext nneg i32 %79 to i64
  %wide.trip.count147 = zext nneg i32 %CI to i64
  %wide.trip.count142 = zext nneg i32 %KH to i64
  %wide.trip.count137 = zext nneg i32 %KW to i64
  %xtraiter200 = and i64 %wide.trip.count137, 1
  %104 = icmp eq i32 %KW, 1
  %unroll_iter203 = and i64 %wide.trip.count137, 2147483646
  %lcmp.mod201.not = icmp eq i64 %xtraiter200, 0
  br label %for_begin_ff.preheader.us.us.us.us.us.us, !dbg !165

for_begin_ff.preheader.us.us.us.us.us.us:         ; preds = %for_begin_ff.for_end_ff_crit_edge.split.us.split.us.split.us.split.us.split.us.us.us.us.us.us.us, %for_begin_ff.preheader.us.us.us.us.us.us.preheader
  %indvars.iv164 = phi i64 [ 0, %for_begin_ff.preheader.us.us.us.us.us.us.preheader ], [ %indvars.iv.next165, %for_begin_ff.for_end_ff_crit_edge.split.us.split.us.split.us.split.us.split.us.us.us.us.us.us.us ]
    #dbg_declare(i64 %indvars.iv164, !183, !DIExpression(), !165)
    #dbg_declare(i32 0, !186, !DIExpression(), !165)
  %105 = mul nuw nsw i64 %indvars.iv164, %103
  %106 = mul nuw nsw i64 %indvars.iv164, %102
  br label %for_body_ff.us.us.us.us.us.us.us.us.us.us.us, !dbg !165

for_body_ff.us.us.us.us.us.us.us.us.us.us.us:     ; preds = %for_begin_yy.for_end_yy_crit_edge.split.us.split.us.split.us.split.us.us.us.us.us.us.us.us.us.us.us.us, %for_begin_ff.preheader.us.us.us.us.us.us
  %indvars.iv159 = phi i64 [ %indvars.iv.next160, %for_begin_yy.for_end_yy_crit_edge.split.us.split.us.split.us.split.us.us.us.us.us.us.us.us.us.us.us.us ], [ 0, %for_begin_ff.preheader.us.us.us.us.us.us ]
    #dbg_declare(i64 %indvars.iv159, !186, !DIExpression(), !165)
    #dbg_declare(i32 0, !187, !DIExpression(), !165)
  %107 = add nuw nsw i64 %indvars.iv159, %105
  %108 = mul nuw nsw i64 %107, %101
  %109 = mul nuw nsw i64 %indvars.iv159, %102
  br label %for_body_yy.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, !dbg !165

for_body_yy.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us: ; preds = %for_begin_xx.for_end_xx_crit_edge.split.us.split.us.split.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, %for_body_ff.us.us.us.us.us.us.us.us.us.us.us
  %indvars.iv154 = phi i64 [ %indvars.iv.next155, %for_begin_xx.for_end_xx_crit_edge.split.us.split.us.split.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us ], [ 0, %for_body_ff.us.us.us.us.us.us.us.us.us.us.us ]
    #dbg_declare(i64 %indvars.iv154, !187, !DIExpression(), !165)
    #dbg_declare(i32 0, !188, !DIExpression(), !165)
  %110 = add nuw nsw i64 %indvars.iv154, %108
  %111 = mul nuw nsw i64 %110, %100
  %invariant.gep181 = getelementptr inbounds float, ptr %conv2d_nchw, i64 %111, !dbg !165
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
  %112 = add nuw nsw i64 %indvars.iv144, %106
  %113 = mul nsw i64 %112, %98
  %114 = add nsw i64 %113, %indvars.iv154
  %115 = add nuw nsw i64 %indvars.iv144, %109
  %116 = mul nuw nsw i64 %115, %99
  br label %for_begin_rx.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, !dbg !165

for_begin_rx.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us: ; preds = %for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, %for_begin_ry.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us
  %.lcssa179 = phi float [ %.lcssa, %for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us ], [ %.lcssa.lcssa180, %for_begin_ry.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us ]
  %indvars.iv139 = phi i64 [ %indvars.iv.next140, %for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us ], [ 0, %for_begin_ry.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us ]
    #dbg_declare(i64 %indvars.iv139, !192, !DIExpression(), !165)
    #dbg_declare(i32 0, !193, !DIExpression(), !165)
  %117 = or i64 %indvars.iv139, %indvars.iv144
  %118 = add nsw i64 %114, %indvars.iv139
  %119 = mul nsw i64 %118, %96
  %120 = add nuw nsw i64 %indvars.iv139, %116
  %121 = mul nuw nsw i64 %120, %97
  %gep177 = getelementptr float, ptr %invariant.gep176, i64 %119
  %invariant.gep174 = getelementptr inbounds float, ptr %W1, i64 %121, !dbg !165
  br i1 %104, label %for_begin_rx.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.unr-lcssa_crit_edge, label %for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, !dbg !165, !prof !176

for_begin_rx.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.unr-lcssa_crit_edge: ; preds = %for_begin_rx.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us
  %pgocount22 = load i64, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 2), align 8, !dbg !165
  %122 = add i64 %pgocount22, 1, !dbg !165
  store i64 %122, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 2), align 8, !dbg !165
  br label %for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.unr-lcssa, !dbg !165

for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us: ; preds = %for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us_crit_edge, %for_begin_rx.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us
  %123 = phi float [ %136, %for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us_crit_edge ], [ %.lcssa179, %for_begin_rx.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us ]
  %indvars.iv134 = phi i64 [ %indvars.iv.next135.1, %for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us_crit_edge ], [ 0, %for_begin_rx.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us ]
  %niter204 = phi i64 [ %niter204.next.1, %for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us_crit_edge ], [ 0, %for_begin_rx.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us ]
    #dbg_declare(i64 %indvars.iv134, !193, !DIExpression(), !165)
  %124 = or i64 %117, %indvars.iv134, !dbg !165
  %125 = and i64 %124, 4294967295, !dbg !165
  %126 = icmp eq i64 %125, 0, !dbg !165
  %127 = zext i1 %126 to i64, !dbg !165
  %pgocount23 = load i64, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 33), align 8, !dbg !165
  %128 = add i64 %pgocount23, %127, !dbg !165
  store i64 %128, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 33), align 8, !dbg !165
  %.193 = select i1 %126, float 0.000000e+00, float %123, !dbg !165, !prof !16
  %129 = getelementptr float, ptr %gep177, i64 %indvars.iv134, !dbg !165
  %130 = load float, ptr %129, align 4, !dbg !165, !tbaa !173
  %gep175 = getelementptr inbounds float, ptr %invariant.gep174, i64 %indvars.iv134, !dbg !165
  %131 = load float, ptr %gep175, align 4, !dbg !165, !tbaa !194
  %132 = tail call float @llvm.fmuladd.f32(float %130, float %131, float %.193), !dbg !165
  %indvars.iv.next135 = or disjoint i64 %indvars.iv134, 1, !dbg !165
    #dbg_declare(i64 %indvars.iv.next135, !193, !DIExpression(), !165)
    #dbg_declare(i64 %indvars.iv.next135, !193, !DIExpression(), !165)
  %133 = getelementptr float, ptr %gep177, i64 %indvars.iv.next135, !dbg !165
  %134 = load float, ptr %133, align 4, !dbg !165, !tbaa !173
  %gep175.1 = getelementptr inbounds float, ptr %invariant.gep174, i64 %indvars.iv.next135, !dbg !165
  %135 = load float, ptr %gep175.1, align 4, !dbg !165, !tbaa !194
  %136 = tail call float @llvm.fmuladd.f32(float %134, float %135, float %132), !dbg !165
  %indvars.iv.next135.1 = add nuw nsw i64 %indvars.iv134, 2, !dbg !165
    #dbg_declare(i64 %indvars.iv.next135.1, !193, !DIExpression(), !165)
  %niter204.next.1 = add i64 %niter204, 2, !dbg !165
  %niter204.ncmp.1 = icmp eq i64 %niter204.next.1, %unroll_iter203, !dbg !165
  br i1 %niter204.ncmp.1, label %for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.unr-lcssa, label %for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us_crit_edge, !dbg !165, !prof !179

for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us_crit_edge: ; preds = %for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us
  %pgocount24 = load i64, ptr @__profc_TVMMod_conv_compute_, align 8, !dbg !165
  %137 = add i64 %pgocount24, 1, !dbg !165
  store i64 %137, ptr @__profc_TVMMod_conv_compute_, align 8, !dbg !165
  br label %for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, !dbg !165

for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.unr-lcssa: ; preds = %for_begin_rx.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.unr-lcssa_crit_edge, %for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us
  %.lcssa.ph = phi float [ poison, %for_begin_rx.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.unr-lcssa_crit_edge ], [ %136, %for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us ]
  %.unr = phi float [ %.lcssa179, %for_begin_rx.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.unr-lcssa_crit_edge ], [ %136, %for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us ]
  %indvars.iv134.unr = phi i64 [ 0, %for_begin_rx.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.unr-lcssa_crit_edge ], [ %indvars.iv.next135.1, %for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us ]
  br i1 %lcmp.mod201.not, label %for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.unr-lcssa.for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us_crit_edge, label %for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.epil, !dbg !165, !prof !182

for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.unr-lcssa.for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us_crit_edge: ; preds = %for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.unr-lcssa
  %pgocount25 = load i64, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 1), align 8, !dbg !165
  %138 = add i64 %pgocount25, 1, !dbg !165
  store i64 %138, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 1), align 8, !dbg !165
  br label %for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, !dbg !165

for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.epil: ; preds = %for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.unr-lcssa
  %pgocount26 = load i64, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 3), align 8, !dbg !165
  %139 = add i64 %pgocount26, 1, !dbg !165
  store i64 %139, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 3), align 8, !dbg !165
    #dbg_declare(i64 %indvars.iv134.unr, !193, !DIExpression(), !165)
  %140 = or i64 %117, %indvars.iv134.unr, !dbg !165
  %141 = and i64 %140, 4294967295, !dbg !165
  %142 = icmp eq i64 %141, 0, !dbg !165
  %143 = zext i1 %142 to i64, !dbg !165
  %pgocount27 = load i64, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 34), align 8, !dbg !165
  %144 = add i64 %pgocount27, %143, !dbg !165
  store i64 %144, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 34), align 8, !dbg !165
  %.193.epil = select i1 %142, float 0.000000e+00, float %.unr, !dbg !165, !prof !16
  %145 = getelementptr float, ptr %gep177, i64 %indvars.iv134.unr, !dbg !165
  %146 = load float, ptr %145, align 4, !dbg !165, !tbaa !173
  %gep175.epil = getelementptr inbounds float, ptr %invariant.gep174, i64 %indvars.iv134.unr, !dbg !165
  %147 = load float, ptr %gep175.epil, align 4, !dbg !165, !tbaa !194
  %148 = tail call float @llvm.fmuladd.f32(float %146, float %147, float %.193.epil), !dbg !165
    #dbg_declare(i64 %indvars.iv134.unr, !193, !DIExpression(DW_OP_plus_uconst, 1), !165)
  br label %for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, !dbg !165

for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us: ; preds = %for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.unr-lcssa.for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us_crit_edge, %for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.epil
  %.lcssa = phi float [ %.lcssa.ph, %for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.unr-lcssa.for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us_crit_edge ], [ %148, %for_body_rx.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.epil ], !dbg !165
  %indvars.iv.next140 = add nuw nsw i64 %indvars.iv139, 1, !dbg !165
    #dbg_declare(i64 %indvars.iv.next140, !192, !DIExpression(), !165)
  %exitcond143.not = icmp eq i64 %indvars.iv.next140, %wide.trip.count142, !dbg !165
  br i1 %exitcond143.not, label %for_begin_ry.for_end_ry_crit_edge.split.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, label %for_begin_rx.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, !dbg !165, !prof !175

for_begin_ry.for_end_ry_crit_edge.split.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us: ; preds = %for_begin_rx.for_end_rx_crit_edge.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us
  %pgocount28 = load i64, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 4), align 8, !dbg !165
  %149 = add i64 %pgocount28, 1, !dbg !165
  store i64 %149, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 4), align 8, !dbg !165
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1, !dbg !165
    #dbg_declare(i64 %indvars.iv.next145, !189, !DIExpression(), !165)
  %exitcond148.not = icmp eq i64 %indvars.iv.next145, %wide.trip.count147, !dbg !165
  br i1 %exitcond148.not, label %for_begin_rc.for_end_rc_crit_edge.split.us.split.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, label %for_begin_ry.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, !dbg !165, !prof !175

for_begin_rc.for_end_rc_crit_edge.split.us.split.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us: ; preds = %for_begin_ry.for_end_ry_crit_edge.split.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us
  %pgocount29 = load i64, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 20), align 8
  %150 = add i64 %pgocount29, 1
  store i64 %150, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 20), align 8
  store float %.lcssa, ptr %gep182, align 4, !tbaa !190
  %indvars.iv.next150 = add nuw nsw i64 %indvars.iv149, 1, !dbg !165
    #dbg_declare(i64 %indvars.iv.next150, !188, !DIExpression(), !165)
  %exitcond153.not = icmp eq i64 %indvars.iv.next150, %wide.trip.count152, !dbg !165
  br i1 %exitcond153.not, label %for_begin_xx.for_end_xx_crit_edge.split.us.split.us.split.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, label %for_begin_rc.preheader.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, !dbg !165, !prof !175

for_begin_xx.for_end_xx_crit_edge.split.us.split.us.split.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us: ; preds = %for_begin_rc.for_end_rc_crit_edge.split.us.split.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us
  %pgocount30 = load i64, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 21), align 8, !dbg !165
  %151 = add i64 %pgocount30, 1, !dbg !165
  store i64 %151, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 21), align 8, !dbg !165
  %indvars.iv.next155 = add nuw nsw i64 %indvars.iv154, 1, !dbg !165
    #dbg_declare(i64 %indvars.iv.next155, !187, !DIExpression(), !165)
  %exitcond158.not = icmp eq i64 %indvars.iv.next155, %wide.trip.count157, !dbg !165
  br i1 %exitcond158.not, label %for_begin_yy.for_end_yy_crit_edge.split.us.split.us.split.us.split.us.us.us.us.us.us.us.us.us.us.us.us, label %for_body_yy.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us, !dbg !165, !prof !175

for_begin_yy.for_end_yy_crit_edge.split.us.split.us.split.us.split.us.us.us.us.us.us.us.us.us.us.us.us: ; preds = %for_begin_xx.for_end_xx_crit_edge.split.us.split.us.split.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us.us
  %pgocount31 = load i64, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 22), align 8, !dbg !165
  %152 = add i64 %pgocount31, 1, !dbg !165
  store i64 %152, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 22), align 8, !dbg !165
  %indvars.iv.next160 = add nuw nsw i64 %indvars.iv159, 1, !dbg !165
    #dbg_declare(i64 %indvars.iv.next160, !186, !DIExpression(), !165)
  %exitcond163.not = icmp eq i64 %indvars.iv.next160, %wide.trip.count162, !dbg !165
  br i1 %exitcond163.not, label %for_begin_ff.for_end_ff_crit_edge.split.us.split.us.split.us.split.us.split.us.us.us.us.us.us.us, label %for_body_ff.us.us.us.us.us.us.us.us.us.us.us, !dbg !165, !prof !175

for_begin_ff.for_end_ff_crit_edge.split.us.split.us.split.us.split.us.split.us.us.us.us.us.us.us: ; preds = %for_begin_yy.for_end_yy_crit_edge.split.us.split.us.split.us.split.us.us.us.us.us.us.us.us.us.us.us.us
  %pgocount32 = load i64, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 23), align 8, !dbg !165
  %153 = add i64 %pgocount32, 1, !dbg !165
  store i64 %153, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 23), align 8, !dbg !165
  %indvars.iv.next165 = add nuw nsw i64 %indvars.iv164, 1, !dbg !165
    #dbg_declare(i64 %indvars.iv.next165, !183, !DIExpression(), !165)
  %exitcond168.not = icmp eq i64 %indvars.iv.next165, %wide.trip.count167, !dbg !165
  br i1 %exitcond168.not, label %for_begin_ff.for_end_ff_crit_edge.split.us.split.us.split.us.split.us.split.us.us.us.us.us.us.us.for_end_nn_crit_edge, label %for_begin_ff.preheader.us.us.us.us.us.us, !dbg !165, !prof !175

for_begin_ff.for_end_ff_crit_edge.split.us.split.us.split.us.split.us.split.us.us.us.us.us.us.us.for_end_nn_crit_edge: ; preds = %for_begin_ff.for_end_ff_crit_edge.split.us.split.us.split.us.split.us.split.us.us.us.us.us.us.us
  %pgocount33 = load i64, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 24), align 8, !dbg !165
  %154 = add i64 %pgocount33, 1, !dbg !165
  store i64 %154, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 24), align 8, !dbg !165
  br label %for_end_nn, !dbg !165

for_end_nn:                                       ; preds = %for_begin_ff.for_end_ff_crit_edge.split.us.split.us.split.us.split.us.split.us.us.us.us.us.us.us.for_end_nn_crit_edge, %for_begin_ff.preheader.lr.ph.for_end_nn_crit_edge, %for_begin_nn.preheader, %for_begin_i0.preheader
  %pgocount34 = load i64, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 25), align 8, !dbg !165
  %155 = add i64 %pgocount34, 1, !dbg !165
  store i64 %155, ptr getelementptr inbounds ([35 x i64], ptr @__profc_TVMMod_conv_compute_, i32 0, i32 25), align 8, !dbg !165
  %156 = load ptr, ptr @__TVMBackendFreeWorkspace, align 8, !dbg !165, !tbaa !17
  %157 = ptrtoint ptr %156 to i64, !dbg !165
  call void @__llvm_profile_instrument_target(i64 %157, ptr @__profd_TVMMod_conv_compute_, i32 1), !dbg !165
  %158 = tail call i32 %156(i32 1, i32 %dev_id, ptr nonnull %pad_temp), !dbg !165
  %.not = icmp ne i32 %158, 0, !dbg !165
  %. = sext i1 %.not to i32, !dbg !165
  br label %common.ret, !dbg !165
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
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
  %pgocount = load i64, ptr getelementptr inbounds ([9 x i64], ptr @__profc___truncsfhf2, i32 0, i32 1), align 8
  %1 = add i64 %pgocount, 1
  store i64 %1, ptr getelementptr inbounds ([9 x i64], ptr @__profc___truncsfhf2, i32 0, i32 1), align 8
  %v10 = add nsw i32 %v5, -114687
  br label %b13

b3:                                               ; preds = %b1
  %pgocount1 = load i64, ptr @__profc___truncsfhf2, align 8
  %2 = add i64 %pgocount1, 1
  store i64 %2, ptr @__profc___truncsfhf2, align 8
  %v11 = icmp eq i32 %v8, 4096
  br i1 %v11, label %b4, label %b13

b4:                                               ; preds = %b3
  %pgocount2 = load i64, ptr getelementptr inbounds ([9 x i64], ptr @__profc___truncsfhf2, i32 0, i32 4), align 8
  %3 = add i64 %pgocount2, 1
  store i64 %3, ptr getelementptr inbounds ([9 x i64], ptr @__profc___truncsfhf2, i32 0, i32 4), align 8
  %v13 = and i32 %v5, 1
  %v14 = add nsw i32 %v7, %v13
  br label %b13

b5:                                               ; preds = %b0
  %v15 = icmp ugt i32 %v1, 2139095040
  br i1 %v15, label %b6, label %b7

b6:                                               ; preds = %b5
  %pgocount3 = load i64, ptr getelementptr inbounds ([9 x i64], ptr @__profc___truncsfhf2, i32 0, i32 3), align 8
  %4 = add i64 %pgocount3, 1
  store i64 %4, ptr getelementptr inbounds ([9 x i64], ptr @__profc___truncsfhf2, i32 0, i32 3), align 8
  %v16 = lshr i32 %v0, 13
  %v17 = and i32 %v16, 511
  %v18 = or disjoint i32 %v17, 32256
  br label %b13

b7:                                               ; preds = %b5
  %pgocount4 = load i64, ptr getelementptr inbounds ([9 x i64], ptr @__profc___truncsfhf2, i32 0, i32 2), align 8
  %5 = add i64 %pgocount4, 1
  store i64 %5, ptr getelementptr inbounds ([9 x i64], ptr @__profc___truncsfhf2, i32 0, i32 2), align 8
  %v19 = icmp ugt i32 %v1, 1199570943
  br i1 %v19, label %b13, label %b8

b8:                                               ; preds = %b7
  %pgocount5 = load i64, ptr getelementptr inbounds ([9 x i64], ptr @__profc___truncsfhf2, i32 0, i32 5), align 8
  %6 = add i64 %pgocount5, 1
  store i64 %6, ptr getelementptr inbounds ([9 x i64], ptr @__profc___truncsfhf2, i32 0, i32 5), align 8
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
  %pgocount6 = load i64, ptr getelementptr inbounds ([9 x i64], ptr @__profc___truncsfhf2, i32 0, i32 7), align 8
  %7 = add i64 %pgocount6, 1
  store i64 %7, ptr getelementptr inbounds ([9 x i64], ptr @__profc___truncsfhf2, i32 0, i32 7), align 8
  %v34 = add nuw nsw i32 %v30, 1
  br label %b13

b11:                                              ; preds = %b9
  %pgocount7 = load i64, ptr getelementptr inbounds ([9 x i64], ptr @__profc___truncsfhf2, i32 0, i32 6), align 8
  %8 = add i64 %pgocount7, 1
  store i64 %8, ptr getelementptr inbounds ([9 x i64], ptr @__profc___truncsfhf2, i32 0, i32 6), align 8
  %v35 = icmp eq i32 %v32, 4096
  br i1 %v35, label %b12, label %b13

b12:                                              ; preds = %b11
  %pgocount8 = load i64, ptr getelementptr inbounds ([9 x i64], ptr @__profc___truncsfhf2, i32 0, i32 8), align 8
  %9 = add i64 %pgocount8, 1
  store i64 %9, ptr getelementptr inbounds ([9 x i64], ptr @__profc___truncsfhf2, i32 0, i32 8), align 8
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
  %pgocount = load i64, ptr @__profc___extendhfsf2, align 8
  %1 = add i64 %pgocount, 1
  store i64 %1, ptr @__profc___extendhfsf2, align 8
  %v5 = shl nuw nsw i32 %v2, 13
  %v6 = add nuw nsw i32 %v5, 939524096
  br label %b6

b2:                                               ; preds = %b0
  %v7 = icmp ugt i16 %v1, 31743
  br i1 %v7, label %b3, label %b4

b3:                                               ; preds = %b2
  %pgocount1 = load i64, ptr getelementptr inbounds ([11 x i64], ptr @__profc___extendhfsf2, i32 0, i32 2), align 8
  %2 = add i64 %pgocount1, 1
  store i64 %2, ptr getelementptr inbounds ([11 x i64], ptr @__profc___extendhfsf2, i32 0, i32 2), align 8
  %v8 = shl nuw nsw i32 %v2, 13
  %v9 = or i32 %v8, 2139095040
  br label %b6

b4:                                               ; preds = %b2
  %pgocount2 = load i64, ptr getelementptr inbounds ([11 x i64], ptr @__profc___extendhfsf2, i32 0, i32 1), align 8
  %3 = add i64 %pgocount2, 1
  store i64 %3, ptr getelementptr inbounds ([11 x i64], ptr @__profc___extendhfsf2, i32 0, i32 1), align 8
  %v10 = icmp eq i16 %v1, 0
  br i1 %v10, label %b6, label %b5

b5:                                               ; preds = %b4
  %pgocount3 = load i64, ptr getelementptr inbounds ([11 x i64], ptr @__profc___extendhfsf2, i32 0, i32 3), align 8
  %4 = add i64 %pgocount3, 1
  store i64 %4, ptr getelementptr inbounds ([11 x i64], ptr @__profc___extendhfsf2, i32 0, i32 3), align 8
  %v11 = icmp ult i16 %v1, 256
  %v12 = lshr i32 %v2, 8
  %5 = zext i1 %v11 to i64
  %pgocount4 = load i64, ptr getelementptr inbounds ([11 x i64], ptr @__profc___extendhfsf2, i32 0, i32 4), align 8
  %6 = add i64 %pgocount4, %5
  store i64 %6, ptr getelementptr inbounds ([11 x i64], ptr @__profc___extendhfsf2, i32 0, i32 4), align 8
  %v13 = select i1 %v11, i32 %v2, i32 %v12
  %7 = zext i1 %v11 to i64
  %pgocount5 = load i64, ptr getelementptr inbounds ([11 x i64], ptr @__profc___extendhfsf2, i32 0, i32 5), align 8
  %8 = add i64 %pgocount5, %7
  store i64 %8, ptr getelementptr inbounds ([11 x i64], ptr @__profc___extendhfsf2, i32 0, i32 5), align 8
  %v14 = select i1 %v11, i32 32, i32 24
  %v15 = icmp ult i32 %v13, 16
  %v16 = lshr i32 %v13, 4
  %v17 = add nsw i32 %v14, -4
  %9 = zext i1 %v15 to i64
  %pgocount6 = load i64, ptr getelementptr inbounds ([11 x i64], ptr @__profc___extendhfsf2, i32 0, i32 6), align 8
  %10 = add i64 %pgocount6, %9
  store i64 %10, ptr getelementptr inbounds ([11 x i64], ptr @__profc___extendhfsf2, i32 0, i32 6), align 8
  %v18 = select i1 %v15, i32 %v13, i32 %v16
  %11 = zext i1 %v15 to i64
  %pgocount7 = load i64, ptr getelementptr inbounds ([11 x i64], ptr @__profc___extendhfsf2, i32 0, i32 7), align 8
  %12 = add i64 %pgocount7, %11
  store i64 %12, ptr getelementptr inbounds ([11 x i64], ptr @__profc___extendhfsf2, i32 0, i32 7), align 8
  %v19 = select i1 %v15, i32 %v14, i32 %v17
  %v20 = icmp ult i32 %v18, 4
  %v21 = lshr i32 %v18, 2
  %v22 = add nsw i32 %v19, -2
  %13 = zext i1 %v20 to i64
  %pgocount8 = load i64, ptr getelementptr inbounds ([11 x i64], ptr @__profc___extendhfsf2, i32 0, i32 8), align 8
  %14 = add i64 %pgocount8, %13
  store i64 %14, ptr getelementptr inbounds ([11 x i64], ptr @__profc___extendhfsf2, i32 0, i32 8), align 8
  %v23 = select i1 %v20, i32 %v18, i32 %v21
  %15 = zext i1 %v20 to i64
  %pgocount9 = load i64, ptr getelementptr inbounds ([11 x i64], ptr @__profc___extendhfsf2, i32 0, i32 9), align 8
  %16 = add i64 %pgocount9, %15
  store i64 %16, ptr getelementptr inbounds ([11 x i64], ptr @__profc___extendhfsf2, i32 0, i32 9), align 8
  %v24 = select i1 %v20, i32 %v19, i32 %v22
  %v25 = icmp ult i32 %v23, 2
  %v26 = sub nsw i32 0, %v23
  %17 = zext i1 %v25 to i64
  %pgocount10 = load i64, ptr getelementptr inbounds ([11 x i64], ptr @__profc___extendhfsf2, i32 0, i32 10), align 8
  %18 = add i64 %pgocount10, %17
  store i64 %18, ptr getelementptr inbounds ([11 x i64], ptr @__profc___extendhfsf2, i32 0, i32 10), align 8
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
declare float @llvm.fabs.f32(float) #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare half @llvm.fabs.f16(half) #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(ptr, i64, i32, i32) #6

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(ptr, i64, i32, i32, i64) #6

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(ptr, i64, i64, i32, i32) #6

declare void @__llvm_profile_instrument_target(i64, ptr, i32)

declare void @__llvm_profile_instrument_memop(i64, ptr, i32)

attributes #0 = { "target-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #2 = { noinline "target-cpu"="generic" }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nofree nosync nounwind memory(none) "target-cpu"="generic" "target-features" }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #6 = { nounwind }

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
!31 = !{!"0x19871950.w8.b0", !32, i64 0}
!32 = !{!"0x19871950.w16.b0", !33, i64 0}
!33 = !{!"0x19871950.w32.b0", !34, i64 0}
!34 = !{!"0x19871950.w64.b0", !35, i64 0}
!35 = !{!"0x19871950.w128.b0", !36, i64 0}
!36 = !{!"0x19871950.w256.b0", !37, i64 0}
!37 = !{!"0x19871950.w512.b0", !38, i64 0}
!38 = !{!"0x19871950.w1024.b0", !39, i64 0}
!39 = !{!"0x19871950", !19, i64 0}
!40 = !DILocalVariable(name: "N", scope: !5, file: !1, type: !8)
!41 = !{!42, !42, i64 0}
!42 = !{!"0x19871950.w8.b8", !32, i64 0}
!43 = !DILocalVariable(name: "CI", scope: !5, file: !1, type: !8)
!44 = !{!45, !45, i64 0}
!45 = !{!"0x19871950.w8.b16", !46, i64 0}
!46 = !{!"0x19871950.w16.b16", !33, i64 0}
!47 = !DILocalVariable(name: "H", scope: !5, file: !1, type: !8)
!48 = !{!49, !49, i64 0}
!49 = !{!"0x19871950.w8.b24", !46, i64 0}
!50 = !DILocalVariable(name: "W", scope: !5, file: !1, type: !8)
!51 = !DILocalVariable(name: "conv.var_A.strides", scope: !5, file: !1, type: !28)
!52 = !DILocalVariable(name: "dev_id", scope: !5, file: !1, type: !8)
!53 = !DILocalVariable(name: "A", scope: !5, file: !1, type: !54)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55)
!55 = !DIBasicType(name: "float32", size: 32, encoding: DW_ATE_float)
!56 = !DILocalVariable(name: "conv.var_W.shape", scope: !5, file: !1, type: !28)
!57 = !{!58, !58, i64 0}
!58 = !{!"0x1988ced0.w8.b0", !59, i64 0}
!59 = !{!"0x1988ced0.w16.b0", !60, i64 0}
!60 = !{!"0x1988ced0.w32.b0", !61, i64 0}
!61 = !{!"0x1988ced0.w64.b0", !62, i64 0}
!62 = !{!"0x1988ced0.w128.b0", !63, i64 0}
!63 = !{!"0x1988ced0.w256.b0", !64, i64 0}
!64 = !{!"0x1988ced0.w512.b0", !65, i64 0}
!65 = !{!"0x1988ced0.w1024.b0", !66, i64 0}
!66 = !{!"0x1988ced0", !19, i64 0}
!67 = !DILocalVariable(name: "CO", scope: !5, file: !1, type: !8)
!68 = !{!69, !69, i64 0}
!69 = !{!"0x1988ced0.w8.b16", !70, i64 0}
!70 = !{!"0x1988ced0.w16.b16", !60, i64 0}
!71 = !DILocalVariable(name: "KH", scope: !5, file: !1, type: !8)
!72 = !{!73, !73, i64 0}
!73 = !{!"0x1988ced0.w8.b24", !70, i64 0}
!74 = !DILocalVariable(name: "KW", scope: !5, file: !1, type: !8)
!75 = !DILocalVariable(name: "conv.var_W.strides", scope: !5, file: !1, type: !28)
!76 = !DILocalVariable(name: "W", scope: !5, file: !1, type: !54)
!77 = !DILocalVariable(name: "conv.var_conv2d_nchw.shape", scope: !5, file: !1, type: !28)
!78 = !DILocalVariable(name: "conv.var_conv2d_nchw.strides", scope: !5, file: !1, type: !28)
!79 = !DILocalVariable(name: "conv2d_nchw", scope: !5, file: !1, type: !54)
!80 = !{!81, !81, i64 0}
!81 = !{!"0x198cb140.w8.b0", !82, i64 0}
!82 = !{!"0x198cb140.w16.b0", !83, i64 0}
!83 = !{!"0x198cb140.w32.b0", !84, i64 0}
!84 = !{!"0x198cb140.w64.b0", !85, i64 0}
!85 = !{!"0x198cb140.w128.b0", !86, i64 0}
!86 = !{!"0x198cb140.w256.b0", !87, i64 0}
!87 = !{!"0x198cb140.w512.b0", !88, i64 0}
!88 = !{!"0x198cb140.w1024.b0", !89, i64 0}
!89 = !{!"0x198cb140", !19, i64 0}
!90 = !{!91, !91, i64 0}
!91 = !{!"0x198cb140.w8.b8", !82, i64 0}
!92 = !{!93, !93, i64 0}
!93 = !{!"0x198cb140.w8.b16", !94, i64 0}
!94 = !{!"0x198cb140.w16.b16", !83, i64 0}
!95 = !{!96, !96, i64 0}
!96 = !{!"0x198cb140.w8.b24", !94, i64 0}
!97 = !{!98, !98, i64 0}
!98 = !{!"0x1988ced0.w8.b8", !59, i64 0}
!99 = !{!100, !100, i64 0}
!100 = !{!"0x19820a10.w8.b0", !101, i64 0}
!101 = !{!"0x19820a10.w16.b0", !102, i64 0}
!102 = !{!"0x19820a10.w32.b0", !103, i64 0}
!103 = !{!"0x19820a10.w64.b0", !104, i64 0}
!104 = !{!"0x19820a10.w128.b0", !105, i64 0}
!105 = !{!"0x19820a10.w256.b0", !106, i64 0}
!106 = !{!"0x19820a10.w512.b0", !107, i64 0}
!107 = !{!"0x19820a10.w1024.b0", !108, i64 0}
!108 = !{!"0x19820a10", !19, i64 0}
!109 = !{!110, !110, i64 0}
!110 = !{!"0x19820a10.w8.b8", !101, i64 0}
!111 = !{!112, !112, i64 0}
!112 = !{!"0x19820a10.w8.b16", !113, i64 0}
!113 = !{!"0x19820a10.w16.b16", !102, i64 0}
!114 = !{!115, !115, i64 0}
!115 = !{!"0x19820a10.w8.b24", !113, i64 0}
!116 = !{!117, !117, i64 0}
!117 = !{!"0x198b4710.w8.b0", !118, i64 0}
!118 = !{!"0x198b4710.w16.b0", !119, i64 0}
!119 = !{!"0x198b4710.w32.b0", !120, i64 0}
!120 = !{!"0x198b4710.w64.b0", !121, i64 0}
!121 = !{!"0x198b4710.w128.b0", !122, i64 0}
!122 = !{!"0x198b4710.w256.b0", !123, i64 0}
!123 = !{!"0x198b4710.w512.b0", !124, i64 0}
!124 = !{!"0x198b4710.w1024.b0", !125, i64 0}
!125 = !{!"0x198b4710", !19, i64 0}
!126 = !{!127, !127, i64 0}
!127 = !{!"0x198b4710.w8.b8", !118, i64 0}
!128 = !{!129, !129, i64 0}
!129 = !{!"0x198b4710.w8.b16", !130, i64 0}
!130 = !{!"0x198b4710.w16.b16", !119, i64 0}
!131 = !{!132, !132, i64 0}
!132 = !{!"0x198b4710.w8.b24", !130, i64 0}
!133 = !{!134, !134, i64 0}
!134 = !{!"0x198b4c20.w8.b0", !135, i64 0}
!135 = !{!"0x198b4c20.w16.b0", !136, i64 0}
!136 = !{!"0x198b4c20.w32.b0", !137, i64 0}
!137 = !{!"0x198b4c20.w64.b0", !138, i64 0}
!138 = !{!"0x198b4c20.w128.b0", !139, i64 0}
!139 = !{!"0x198b4c20.w256.b0", !140, i64 0}
!140 = !{!"0x198b4c20.w512.b0", !141, i64 0}
!141 = !{!"0x198b4c20.w1024.b0", !142, i64 0}
!142 = !{!"0x198b4c20", !19, i64 0}
!143 = !{!144, !144, i64 0}
!144 = !{!"0x198b4c20.w8.b8", !135, i64 0}
!145 = !{!146, !146, i64 0}
!146 = !{!"0x198b4c20.w8.b16", !147, i64 0}
!147 = !{!"0x198b4c20.w16.b16", !136, i64 0}
!148 = !{!149, !149, i64 0}
!149 = !{!"0x198b4c20.w8.b24", !147, i64 0}
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
!174 = !{!"0x198bcd00", !19, i64 0}
!175 = !{!"branch_weights", i32 127, i32 134217601}
!176 = !{!"branch_weights", i32 1, i32 127}
!177 = !{!178, !178, i64 0}
!178 = !{!"0x198d28a0", !19, i64 0}
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
!191 = !{!"0x19892550", !19, i64 0}
!192 = !DILocalVariable(name: "ry", scope: !150, file: !1, type: !8)
!193 = !DILocalVariable(name: "rx", scope: !150, file: !1, type: !8)
!194 = !{!195, !195, i64 0}
!195 = !{!"0x1988bd30", !19, i64 0}
