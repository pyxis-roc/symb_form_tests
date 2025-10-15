; ModuleID = 'matmul.ll'
source_filename = "TVMMod"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

$__profc_matmul = comdat nodeduplicate

$__profc_TVMMod_matmul_compute_ = comdat nodeduplicate

$__profc___truncsfhf2 = comdat nodeduplicate

$__profc___extendhfsf2 = comdat nodeduplicate

$__llvm_profile_filename = comdat any

@__TVMFFIErrorSetRaisedByCStr = linkonce dllexport local_unnamed_addr global ptr null, align 8
@.str = private constant [57 x i8] c"Assert fail: num_args == 3, matmul: num_args should be 3\00", align 1
@.str.1 = private constant [13 x i8] c"RuntimeError\00", align 1
@.str.2 = private constant [65 x i8] c"Assert fail: not T.isnullptr(args), matmul: args pointer is NULL\00", align 1
@.str.3 = private constant [148 x i8] c"Assert fail: var_A_type_index == 0 or var_A_type_index == 4 or var_A_type_index == 7 or var_A_type_index >= 64, matmul: Expect arg[0] to be pointer\00", align 1
@.str.4 = private constant [148 x i8] c"Assert fail: var_B_type_index == 0 or var_B_type_index == 4 or var_B_type_index == 7 or var_B_type_index >= 64, matmul: Expect arg[1] to be pointer\00", align 1
@.str.5 = private constant [188 x i8] c"Assert fail: var_T_matmul_NN_type_index == 0 or var_T_matmul_NN_type_index == 4 or var_T_matmul_NN_type_index == 7 or var_T_matmul_NN_type_index >= 64, matmul: Expect arg[2] to be pointer\00", align 1
@.str.6 = private constant [97 x i8] c"Assert fail: not T.isnullptr(var_A), matmul.var_A is expected to have non-NULL DLTensor* pointer\00", align 1
@.str.7 = private constant [99 x i8] c"Assert fail: 2 == T.tvm_struct_get(var_A, 0, 4, \22int32\22), matmul.var_A.ndim is expected to equal 2\00", align 1
@.str.8 = private constant [97 x i8] c"Assert fail: not T.isnullptr(var_B), matmul.var_B is expected to have non-NULL DLTensor* pointer\00", align 1
@.str.9 = private constant [99 x i8] c"Assert fail: 2 == T.tvm_struct_get(var_B, 0, 4, \22int32\22), matmul.var_B.ndim is expected to equal 2\00", align 1
@.str.10 = private constant [117 x i8] c"Assert fail: not T.isnullptr(var_T_matmul_NN), matmul.var_T_matmul_NN is expected to have non-NULL DLTensor* pointer\00", align 1
@.str.11 = private constant [119 x i8] c"Assert fail: 2 == T.tvm_struct_get(var_T_matmul_NN, 0, 4, \22int32\22), matmul.var_T_matmul_NN.ndim is expected to equal 2\00", align 1
@.str.12 = private constant [229 x i8] c"Assert fail: T.tvm_struct_get(var_A, 0, 5, \22uint8\22) == T.uint8(2) and T.tvm_struct_get(var_A, 0, 6, \22uint8\22) == T.uint8(32) and T.tvm_struct_get(var_A, 0, 7, \22uint16\22) == T.uint16(1), matmul.var_A.dtype is expected to be float32\00", align 1
@.str.13 = private constant [185 x i8] c"Assert fail: (K == 1 or 1 == T.Cast(\22int32\22, matmul_var_A_strides[1])) and (M == 1 or K == T.Cast(\22int32\22, matmul_var_A_strides[0])), matmul.var_A.strides: expected to be compact array\00", align 1
@.str.14 = private constant [189 x i8] c"Assert fail: T.uint64(0) == T.tvm_struct_get(var_A, 0, 8, \22uint64\22), Argument matmul.var_A.byte_offset has an unsatisfied constraint: T.uint64(0) == T.tvm_struct_get(var_A, 0, 8, \22uint64\22)\00", align 1
@.str.15 = private constant [169 x i8] c"Assert fail: T.tvm_struct_get(var_A, 0, 10, \22int32\22) == 1, Argument matmul.var_A.device_type has an unsatisfied constraint: 1 == T.tvm_struct_get(var_A, 0, 10, \22int32\22)\00", align 1
@.str.16 = private constant [102 x i8] c"Assert fail: M * K == 0 or not T.isnullptr(A), matmul.var_A is expected to have non-NULL data pointer\00", align 1
@.str.17 = private constant [229 x i8] c"Assert fail: T.tvm_struct_get(var_B, 0, 5, \22uint8\22) == T.uint8(2) and T.tvm_struct_get(var_B, 0, 6, \22uint8\22) == T.uint8(32) and T.tvm_struct_get(var_B, 0, 7, \22uint16\22) == T.uint16(1), matmul.var_B.dtype is expected to be float32\00", align 1
@.str.18 = private constant [164 x i8] c"Assert fail: K == T.Cast(\22int32\22, matmul_var_B_shape[0]), Argument matmul.var_B.shape[0] has an unsatisfied constraint: K == T.Cast(\22int32\22, matmul_var_B_shape[0])\00", align 1
@.str.19 = private constant [185 x i8] c"Assert fail: (N == 1 or 1 == T.Cast(\22int32\22, matmul_var_B_strides[1])) and (K == 1 or N == T.Cast(\22int32\22, matmul_var_B_strides[0])), matmul.var_B.strides: expected to be compact array\00", align 1
@.str.20 = private constant [189 x i8] c"Assert fail: T.uint64(0) == T.tvm_struct_get(var_B, 0, 8, \22uint64\22), Argument matmul.var_B.byte_offset has an unsatisfied constraint: T.uint64(0) == T.tvm_struct_get(var_B, 0, 8, \22uint64\22)\00", align 1
@.str.21 = private constant [169 x i8] c"Assert fail: T.tvm_struct_get(var_B, 0, 10, \22int32\22) == 1, Argument matmul.var_B.device_type has an unsatisfied constraint: 1 == T.tvm_struct_get(var_B, 0, 10, \22int32\22)\00", align 1
@.str.22 = private constant [175 x i8] c"Assert fail: dev_id == T.tvm_struct_get(var_B, 0, 9, \22int32\22), Argument matmul.var_B.device_id has an unsatisfied constraint: dev_id == T.tvm_struct_get(var_B, 0, 9, \22int32\22)\00", align 1
@.str.23 = private constant [102 x i8] c"Assert fail: K * N == 0 or not T.isnullptr(B), matmul.var_B is expected to have non-NULL data pointer\00", align 1
@.str.24 = private constant [269 x i8] c"Assert fail: T.tvm_struct_get(var_T_matmul_NN, 0, 5, \22uint8\22) == T.uint8(2) and T.tvm_struct_get(var_T_matmul_NN, 0, 6, \22uint8\22) == T.uint8(32) and T.tvm_struct_get(var_T_matmul_NN, 0, 7, \22uint16\22) == T.uint16(1), matmul.var_T_matmul_NN.dtype is expected to be float32\00", align 1
@.str.25 = private constant [194 x i8] c"Assert fail: M == T.Cast(\22int32\22, matmul_var_T_matmul_NN_shape[0]), Argument matmul.var_T_matmul_NN.shape[0] has an unsatisfied constraint: M == T.Cast(\22int32\22, matmul_var_T_matmul_NN_shape[0])\00", align 1
@.str.26 = private constant [194 x i8] c"Assert fail: N == T.Cast(\22int32\22, matmul_var_T_matmul_NN_shape[1]), Argument matmul.var_T_matmul_NN.shape[1] has an unsatisfied constraint: N == T.Cast(\22int32\22, matmul_var_T_matmul_NN_shape[1])\00", align 1
@.str.27 = private constant [215 x i8] c"Assert fail: (N == 1 or 1 == T.Cast(\22int32\22, matmul_var_T_matmul_NN_strides[1])) and (M == 1 or N == T.Cast(\22int32\22, matmul_var_T_matmul_NN_strides[0])), matmul.var_T_matmul_NN.strides: expected to be compact array\00", align 1
@.str.28 = private constant [219 x i8] c"Assert fail: T.uint64(0) == T.tvm_struct_get(var_T_matmul_NN, 0, 8, \22uint64\22), Argument matmul.var_T_matmul_NN.byte_offset has an unsatisfied constraint: T.uint64(0) == T.tvm_struct_get(var_T_matmul_NN, 0, 8, \22uint64\22)\00", align 1
@.str.29 = private constant [199 x i8] c"Assert fail: T.tvm_struct_get(var_T_matmul_NN, 0, 10, \22int32\22) == 1, Argument matmul.var_T_matmul_NN.device_type has an unsatisfied constraint: 1 == T.tvm_struct_get(var_T_matmul_NN, 0, 10, \22int32\22)\00", align 1
@.str.30 = private constant [205 x i8] c"Assert fail: dev_id == T.tvm_struct_get(var_T_matmul_NN, 0, 9, \22int32\22), Argument matmul.var_T_matmul_NN.device_id has an unsatisfied constraint: dev_id == T.tvm_struct_get(var_T_matmul_NN, 0, 9, \22int32\22)\00", align 1
@.str.31 = private constant [122 x i8] c"Assert fail: M * N == 0 or not T.isnullptr(T_matmul_NN), matmul.var_T_matmul_NN is expected to have non-NULL data pointer\00", align 1
@__tvm_main__ = weak dllexport local_unnamed_addr constant [7 x i8] c"matmul\00", align 1
@llvm.global_ctors = appending global [0 x { i32, ptr, ptr }] zeroinitializer
@__llvm_profile_raw_version = hidden constant i64 72057594037927946, comdat
@__profc_matmul = private global [47 x i64] zeroinitializer, section "__llvm_prf_cnts", comdat, align 8
@__profvp_matmul = private global [31 x i64] zeroinitializer, section "__llvm_prf_vals", comdat($__profc_matmul), align 8
@__profd_matmul = private global { i64, i64, i64, i64, ptr, ptr, i32, [3 x i16], i32 } { i64 -6752014111240081905, i64 422797474039867649, i64 sub (i64 ptrtoint (ptr @__profc_matmul to i64), i64 ptrtoint (ptr @__profd_matmul to i64)), i64 0, ptr @matmul.local, ptr @__profvp_matmul, i32 47, [3 x i16] [i16 31, i16 0, i16 0], i32 0 }, section "__llvm_prf_data", comdat($__profc_matmul), align 8
@__profc_TVMMod_matmul_compute_ = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", comdat, align 8
@__profd_TVMMod_matmul_compute_ = private global { i64, i64, i64, i64, ptr, ptr, i32, [3 x i16], i32 } { i64 1486072088025155821, i64 1055735127882453892, i64 sub (i64 ptrtoint (ptr @__profc_TVMMod_matmul_compute_ to i64), i64 ptrtoint (ptr @__profd_TVMMod_matmul_compute_ to i64)), i64 0, ptr null, ptr null, i32 11, [3 x i16] zeroinitializer, i32 0 }, section "__llvm_prf_data", comdat($__profc_TVMMod_matmul_compute_), align 8
@__profc___truncsfhf2 = weak hidden global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", comdat, align 8
@__profd___truncsfhf2 = private global { i64, i64, i64, i64, ptr, ptr, i32, [3 x i16], i32 } { i64 -8399318204444975244, i64 650973723264992368, i64 sub (i64 ptrtoint (ptr @__profc___truncsfhf2 to i64), i64 ptrtoint (ptr @__profd___truncsfhf2 to i64)), i64 0, ptr @__truncsfhf2.local, ptr null, i32 9, [3 x i16] zeroinitializer, i32 0 }, section "__llvm_prf_data", comdat($__profc___truncsfhf2), align 8
@__profc___extendhfsf2 = weak hidden global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", comdat, align 8
@__profd___extendhfsf2 = private global { i64, i64, i64, i64, ptr, ptr, i32, [3 x i16], i32 } { i64 4517987130037941523, i64 13698032168178065, i64 sub (i64 ptrtoint (ptr @__profc___extendhfsf2 to i64), i64 ptrtoint (ptr @__profd___extendhfsf2 to i64)), i64 0, ptr @__extendhfsf2.local, ptr null, i32 11, [3 x i16] zeroinitializer, i32 0 }, section "__llvm_prf_data", comdat($__profc___extendhfsf2), align 8
@__llvm_prf_vnodes = private global [31 x { i64, i64, ptr }] zeroinitializer, section "__llvm_prf_vnds", align 8
@__llvm_prf_nm = private constant [61 x i8] c"8;x\DA\CBM,\C9-\CDa\0C\09\F3\F5\CDO\B1\CE\05\F3\E2\93\F3s\0BJKR\E3\19\E3\E3K\8AJ\F3\92\8B\D32\D2\8C\80\9C\D4\8A\92\D4\BC\94\8C\B4\E24#\00X\83\15\13", section "__llvm_prf_names", align 1
@llvm.compiler.used = appending global [4 x ptr] [ptr @__profd_matmul, ptr @__profd_TVMMod_matmul_compute_, ptr @__profd___truncsfhf2, ptr @__profd___extendhfsf2], section "llvm.metadata"
@llvm.used = appending global [2 x ptr] [ptr @__llvm_prf_vnodes, ptr @__llvm_prf_nm], section "llvm.metadata"
@__llvm_profile_filename = hidden constant [19 x i8] c"default_%m.profraw\00", comdat

@matmul.local = private alias i32 (ptr, ptr, i32, ptr), ptr @matmul
@__truncsfhf2.local = private alias half (float), ptr @__truncsfhf2
@__extendhfsf2.local = private alias float (half), ptr @__extendhfsf2

define dllexport range(i32 -1, 1) i32 @matmul(ptr noalias nocapture readnone %self_handle, ptr noalias readonly %args, i32 %num_args, ptr noalias nocapture readnone %result) local_unnamed_addr #0 !dbg !5 {
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
  %pgocount = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 16), align 8, !dbg !15
  %1 = add i64 %pgocount, 1, !dbg !15
  store i64 %1, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 16), align 8, !dbg !15
  %2 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %3 = ptrtoint ptr %2 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %3, ptr @__profd_matmul, i32 0), !dbg !15
  tail call void %2(ptr nonnull @.str.1, ptr nonnull @.str), !dbg !15
  br label %common.ret, !dbg !15

assert_end:                                       ; preds = %entry
  %.not = icmp eq ptr %args, null, !dbg !15
  br i1 %.not, label %assert_fail1, label %assert_end2, !dbg !15, !prof !20

assert_fail1:                                     ; preds = %assert_end
  %pgocount4 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 17), align 8, !dbg !15
  %4 = add i64 %pgocount4, 1, !dbg !15
  store i64 %4, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 17), align 8, !dbg !15
  %5 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %6 = ptrtoint ptr %5 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %6, ptr @__profd_matmul, i32 1), !dbg !15
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
  %pgocount5 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 7), align 8, !dbg !15
  %8 = add i64 %pgocount5, 1, !dbg !15
  store i64 %8, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 7), align 8, !dbg !15
  switch i32 %var_A.type_index.fr, label %assert_fail3 [
    i32 7, label %switch.early.test.assert_end4_crit_edge
    i32 4, label %switch.early.test.assert_end4_crit_edge1
    i32 0, label %assert_end4
  ], !dbg !15

switch.early.test.assert_end4_crit_edge1:         ; preds = %switch.early.test
  %pgocount6 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 1), align 8, !dbg !15
  %9 = add i64 %pgocount6, 1, !dbg !15
  store i64 %9, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 1), align 8, !dbg !15
  br label %assert_end4, !dbg !15

switch.early.test.assert_end4_crit_edge:          ; preds = %switch.early.test
  %pgocount7 = load i64, ptr @__profc_matmul, align 8, !dbg !15
  %10 = add i64 %pgocount7, 1, !dbg !15
  store i64 %10, ptr @__profc_matmul, align 8, !dbg !15
  br label %assert_end4, !dbg !15

assert_fail3:                                     ; preds = %switch.early.test
  %pgocount8 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 10), align 8, !dbg !15
  %11 = add i64 %pgocount8, 1, !dbg !15
  store i64 %11, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 10), align 8, !dbg !15
  %12 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %13 = ptrtoint ptr %12 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %13, ptr @__profd_matmul, i32 2), !dbg !15
  tail call void %12(ptr nonnull @.str.1, ptr nonnull @.str.3), !dbg !15
  br label %common.ret, !dbg !15

assert_end4:                                      ; preds = %switch.early.test.assert_end4_crit_edge1, %switch.early.test.assert_end4_crit_edge, %switch.early.test, %assert_end2
  %14 = getelementptr inbounds i8, ptr %args, i64 16, !dbg !15
  %var_B.type_index = load i32, ptr %14, align 4, !dbg !15
    #dbg_declare(i32 %var_B.type_index, !22, !DIExpression(), !15)
    #dbg_declare(i32 %var_B.type_index, !22, !DIExpression(), !15)
  %var_B.type_index.fr = freeze i32 %var_B.type_index, !dbg !15
  %15 = icmp sgt i32 %var_B.type_index.fr, 63, !dbg !15
  br i1 %15, label %assert_end6, label %switch.early.test65, !dbg !15

switch.early.test65:                              ; preds = %assert_end4
  %pgocount9 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 8), align 8, !dbg !15
  %16 = add i64 %pgocount9, 1, !dbg !15
  store i64 %16, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 8), align 8, !dbg !15
  switch i32 %var_B.type_index.fr, label %assert_fail5 [
    i32 7, label %switch.early.test65.assert_end6_crit_edge
    i32 4, label %switch.early.test65.assert_end6_crit_edge2
    i32 0, label %assert_end6
  ], !dbg !15

switch.early.test65.assert_end6_crit_edge2:       ; preds = %switch.early.test65
  %pgocount10 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 3), align 8, !dbg !15
  %17 = add i64 %pgocount10, 1, !dbg !15
  store i64 %17, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 3), align 8, !dbg !15
  br label %assert_end6, !dbg !15

switch.early.test65.assert_end6_crit_edge:        ; preds = %switch.early.test65
  %pgocount11 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 2), align 8, !dbg !15
  %18 = add i64 %pgocount11, 1, !dbg !15
  store i64 %18, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 2), align 8, !dbg !15
  br label %assert_end6, !dbg !15

assert_fail5:                                     ; preds = %switch.early.test65
  %pgocount12 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 11), align 8, !dbg !15
  %19 = add i64 %pgocount12, 1, !dbg !15
  store i64 %19, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 11), align 8, !dbg !15
  %20 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %21 = ptrtoint ptr %20 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %21, ptr @__profd_matmul, i32 3), !dbg !15
  tail call void %20(ptr nonnull @.str.1, ptr nonnull @.str.4), !dbg !15
  br label %common.ret, !dbg !15

assert_end6:                                      ; preds = %switch.early.test65.assert_end6_crit_edge2, %switch.early.test65.assert_end6_crit_edge, %switch.early.test65, %assert_end4
  %22 = getelementptr inbounds i8, ptr %args, i64 32, !dbg !15
  %var_T_matmul_NN.type_index = load i32, ptr %22, align 4, !dbg !15
    #dbg_declare(i32 %var_T_matmul_NN.type_index, !23, !DIExpression(), !15)
    #dbg_declare(i32 %var_T_matmul_NN.type_index, !23, !DIExpression(), !15)
  %var_T_matmul_NN.type_index.fr = freeze i32 %var_T_matmul_NN.type_index, !dbg !15
  %23 = icmp sgt i32 %var_T_matmul_NN.type_index.fr, 63, !dbg !15
  br i1 %23, label %assert_end8, label %switch.early.test66, !dbg !15

switch.early.test66:                              ; preds = %assert_end6
  %pgocount13 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 9), align 8, !dbg !15
  %24 = add i64 %pgocount13, 1, !dbg !15
  store i64 %24, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 9), align 8, !dbg !15
  switch i32 %var_T_matmul_NN.type_index.fr, label %assert_fail7 [
    i32 7, label %switch.early.test66.assert_end8_crit_edge
    i32 4, label %switch.early.test66.assert_end8_crit_edge3
    i32 0, label %assert_end8
  ], !dbg !15

switch.early.test66.assert_end8_crit_edge3:       ; preds = %switch.early.test66
  %pgocount14 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 5), align 8, !dbg !15
  %25 = add i64 %pgocount14, 1, !dbg !15
  store i64 %25, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 5), align 8, !dbg !15
  br label %assert_end8, !dbg !15

switch.early.test66.assert_end8_crit_edge:        ; preds = %switch.early.test66
  %pgocount15 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 4), align 8, !dbg !15
  %26 = add i64 %pgocount15, 1, !dbg !15
  store i64 %26, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 4), align 8, !dbg !15
  br label %assert_end8, !dbg !15

assert_fail7:                                     ; preds = %switch.early.test66
  %pgocount16 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 12), align 8, !dbg !15
  %27 = add i64 %pgocount16, 1, !dbg !15
  store i64 %27, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 12), align 8, !dbg !15
  %28 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %29 = ptrtoint ptr %28 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %29, ptr @__profd_matmul, i32 4), !dbg !15
  tail call void %28(ptr nonnull @.str.1, ptr nonnull @.str.5), !dbg !15
  br label %common.ret, !dbg !15

assert_end8:                                      ; preds = %switch.early.test66.assert_end8_crit_edge3, %switch.early.test66.assert_end8_crit_edge, %switch.early.test66, %assert_end6
  %30 = getelementptr inbounds i8, ptr %args, i64 8, !dbg !15
  %31 = load ptr, ptr %30, align 8, !dbg !15
  %32 = icmp eq i32 %var_A.type_index.fr, 72, !dbg !15
  %33 = zext i1 %32 to i64, !dbg !15
  %pgocount17 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 44), align 8, !dbg !15
  %34 = add i64 %pgocount17, %33, !dbg !15
  store i64 %34, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 44), align 8, !dbg !15
  %var_A.idx = select i1 %32, i64 16, i64 0, !dbg !15
  %var_A = getelementptr inbounds i8, ptr %31, i64 %var_A.idx, !dbg !15
    #dbg_declare(ptr %var_A, !24, !DIExpression(), !15)
    #dbg_declare(ptr %var_A, !24, !DIExpression(), !15)
  %35 = getelementptr inbounds i8, ptr %args, i64 24, !dbg !15
  %36 = load ptr, ptr %35, align 8, !dbg !15
  %37 = icmp eq i32 %var_B.type_index.fr, 72, !dbg !15
  %38 = zext i1 %37 to i64, !dbg !15
  %pgocount18 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 45), align 8, !dbg !15
  %39 = add i64 %pgocount18, %38, !dbg !15
  store i64 %39, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 45), align 8, !dbg !15
  %var_B.idx = select i1 %37, i64 16, i64 0, !dbg !15
  %var_B = getelementptr inbounds i8, ptr %36, i64 %var_B.idx, !dbg !15
    #dbg_declare(ptr %var_B, !25, !DIExpression(), !15)
    #dbg_declare(ptr %var_B, !25, !DIExpression(), !15)
  %40 = getelementptr inbounds i8, ptr %args, i64 40, !dbg !15
  %41 = load ptr, ptr %40, align 8, !dbg !15
  %42 = icmp eq i32 %var_T_matmul_NN.type_index.fr, 72, !dbg !15
  %43 = zext i1 %42 to i64, !dbg !15
  %pgocount19 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 46), align 8, !dbg !15
  %44 = add i64 %pgocount19, %43, !dbg !15
  store i64 %44, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 46), align 8, !dbg !15
  %var_T_matmul_NN.idx = select i1 %42, i64 16, i64 0, !dbg !15
  %var_T_matmul_NN = getelementptr inbounds i8, ptr %41, i64 %var_T_matmul_NN.idx, !dbg !15
    #dbg_declare(ptr %var_T_matmul_NN, !26, !DIExpression(), !15)
    #dbg_declare(ptr %var_T_matmul_NN, !26, !DIExpression(), !15)
  %.not67 = icmp eq ptr %31, null, !dbg !15
  br i1 %.not67, label %assert_fail9, label %assert_end10, !dbg !15, !prof !20

assert_fail9:                                     ; preds = %assert_end8
  %pgocount20 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 18), align 8, !dbg !15
  %45 = add i64 %pgocount20, 1, !dbg !15
  store i64 %45, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 18), align 8, !dbg !15
  %46 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %47 = ptrtoint ptr %46 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %47, ptr @__profd_matmul, i32 5), !dbg !15
  tail call void %46(ptr nonnull @.str.1, ptr nonnull @.str.6), !dbg !15
  br label %common.ret, !dbg !15

assert_end10:                                     ; preds = %assert_end8
  %48 = getelementptr inbounds i8, ptr %var_A, i64 16, !dbg !15
  %49 = load i32, ptr %48, align 4, !dbg !15
  %50 = icmp eq i32 %49, 2, !dbg !15
  br i1 %50, label %assert_end12, label %assert_fail11, !dbg !15, !prof !16

assert_fail11:                                    ; preds = %assert_end10
  %pgocount21 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 19), align 8, !dbg !15
  %51 = add i64 %pgocount21, 1, !dbg !15
  store i64 %51, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 19), align 8, !dbg !15
  %52 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %53 = ptrtoint ptr %52 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %53, ptr @__profd_matmul, i32 6), !dbg !15
  tail call void %52(ptr nonnull @.str.1, ptr nonnull @.str.7), !dbg !15
  br label %common.ret, !dbg !15

assert_end12:                                     ; preds = %assert_end10
  %54 = getelementptr inbounds i8, ptr %var_A, i64 24, !dbg !15
  %matmul.var_A.shape = load ptr, ptr %54, align 8, !dbg !15
    #dbg_declare(ptr %matmul.var_A.shape, !27, !DIExpression(), !15)
    #dbg_declare(ptr %matmul.var_A.shape, !27, !DIExpression(), !15)
  %55 = load i64, ptr %matmul.var_A.shape, align 8, !dbg !15, !tbaa !30
  %M = trunc i64 %55 to i32, !dbg !15
    #dbg_declare(i32 %M, !40, !DIExpression(), !15)
    #dbg_declare(i32 %M, !40, !DIExpression(), !15)
  %56 = getelementptr inbounds i8, ptr %matmul.var_A.shape, i64 8, !dbg !15
  %57 = load i64, ptr %56, align 8, !dbg !15, !tbaa !41
  %K = trunc i64 %57 to i32, !dbg !15
    #dbg_declare(i32 %K, !43, !DIExpression(), !15)
    #dbg_declare(i32 %K, !43, !DIExpression(), !15)
  %58 = getelementptr inbounds i8, ptr %var_A, i64 32, !dbg !15
  %matmul.var_A.strides = load ptr, ptr %58, align 8, !dbg !15
    #dbg_declare(ptr %matmul.var_A.strides, !44, !DIExpression(), !15)
    #dbg_declare(ptr %matmul.var_A.strides, !44, !DIExpression(), !15)
  %59 = getelementptr inbounds i8, ptr %var_A, i64 12, !dbg !15
  %dev_id = load i32, ptr %59, align 4, !dbg !15
    #dbg_declare(i32 %dev_id, !45, !DIExpression(), !15)
    #dbg_declare(i32 %dev_id, !45, !DIExpression(), !15)
  %A = load ptr, ptr %var_A, align 8, !dbg !15
    #dbg_declare(ptr %A, !46, !DIExpression(), !15)
    #dbg_declare(ptr %A, !46, !DIExpression(), !15)
  call void @llvm.assume(i1 true) [ "align"(ptr %A, i64 64) ], !dbg !15
  %.not68 = icmp eq ptr %36, null, !dbg !15
  br i1 %.not68, label %assert_fail13, label %assert_end14, !dbg !15, !prof !20

assert_fail13:                                    ; preds = %assert_end12
  %pgocount22 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 20), align 8, !dbg !15
  %60 = add i64 %pgocount22, 1, !dbg !15
  store i64 %60, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 20), align 8, !dbg !15
  %61 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %62 = ptrtoint ptr %61 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %62, ptr @__profd_matmul, i32 7), !dbg !15
  tail call void %61(ptr nonnull @.str.1, ptr nonnull @.str.8), !dbg !15
  br label %common.ret, !dbg !15

assert_end14:                                     ; preds = %assert_end12
  %63 = getelementptr inbounds i8, ptr %var_B, i64 16, !dbg !15
  %64 = load i32, ptr %63, align 4, !dbg !15
  %65 = icmp eq i32 %64, 2, !dbg !15
  br i1 %65, label %assert_end16, label %assert_fail15, !dbg !15, !prof !16

assert_fail15:                                    ; preds = %assert_end14
  %pgocount23 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 21), align 8, !dbg !15
  %66 = add i64 %pgocount23, 1, !dbg !15
  store i64 %66, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 21), align 8, !dbg !15
  %67 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %68 = ptrtoint ptr %67 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %68, ptr @__profd_matmul, i32 8), !dbg !15
  tail call void %67(ptr nonnull @.str.1, ptr nonnull @.str.9), !dbg !15
  br label %common.ret, !dbg !15

assert_end16:                                     ; preds = %assert_end14
  %69 = getelementptr inbounds i8, ptr %var_B, i64 24, !dbg !15
  %matmul.var_B.shape = load ptr, ptr %69, align 8, !dbg !15
    #dbg_declare(ptr %matmul.var_B.shape, !49, !DIExpression(), !15)
    #dbg_declare(ptr %matmul.var_B.shape, !49, !DIExpression(), !15)
  %70 = getelementptr inbounds i8, ptr %matmul.var_B.shape, i64 8, !dbg !15
  %71 = load i64, ptr %70, align 8, !dbg !15, !tbaa !50
  %N = trunc i64 %71 to i32, !dbg !15
    #dbg_declare(i32 %N, !60, !DIExpression(), !15)
    #dbg_declare(i32 %N, !60, !DIExpression(), !15)
  %72 = getelementptr inbounds i8, ptr %var_B, i64 32, !dbg !15
  %matmul.var_B.strides = load ptr, ptr %72, align 8, !dbg !15
    #dbg_declare(ptr %matmul.var_B.strides, !61, !DIExpression(), !15)
    #dbg_declare(ptr %matmul.var_B.strides, !61, !DIExpression(), !15)
  %B = load ptr, ptr %var_B, align 8, !dbg !15
    #dbg_declare(ptr %B, !62, !DIExpression(), !15)
    #dbg_declare(ptr %B, !62, !DIExpression(), !15)
  call void @llvm.assume(i1 true) [ "align"(ptr %B, i64 64) ], !dbg !15
  %.not69 = icmp eq ptr %41, null, !dbg !15
  br i1 %.not69, label %assert_fail17, label %assert_end18, !dbg !15, !prof !20

assert_fail17:                                    ; preds = %assert_end16
  %pgocount24 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 22), align 8, !dbg !15
  %73 = add i64 %pgocount24, 1, !dbg !15
  store i64 %73, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 22), align 8, !dbg !15
  %74 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %75 = ptrtoint ptr %74 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %75, ptr @__profd_matmul, i32 9), !dbg !15
  tail call void %74(ptr nonnull @.str.1, ptr nonnull @.str.10), !dbg !15
  br label %common.ret, !dbg !15

assert_end18:                                     ; preds = %assert_end16
  %76 = getelementptr inbounds i8, ptr %var_T_matmul_NN, i64 16, !dbg !15
  %77 = load i32, ptr %76, align 4, !dbg !15
  %78 = icmp eq i32 %77, 2, !dbg !15
  br i1 %78, label %assert_end20, label %assert_fail19, !dbg !15, !prof !16

assert_fail19:                                    ; preds = %assert_end18
  %pgocount25 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 23), align 8, !dbg !15
  %79 = add i64 %pgocount25, 1, !dbg !15
  store i64 %79, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 23), align 8, !dbg !15
  %80 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %81 = ptrtoint ptr %80 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %81, ptr @__profd_matmul, i32 10), !dbg !15
  tail call void %80(ptr nonnull @.str.1, ptr nonnull @.str.11), !dbg !15
  br label %common.ret, !dbg !15

assert_end20:                                     ; preds = %assert_end18
  %82 = getelementptr inbounds i8, ptr %var_T_matmul_NN, i64 24, !dbg !15
  %matmul.var_T_matmul_NN.shape = load ptr, ptr %82, align 8, !dbg !15
    #dbg_declare(ptr %matmul.var_T_matmul_NN.shape, !63, !DIExpression(), !15)
    #dbg_declare(ptr %matmul.var_T_matmul_NN.shape, !63, !DIExpression(), !15)
  %83 = getelementptr inbounds i8, ptr %var_T_matmul_NN, i64 32, !dbg !15
  %matmul.var_T_matmul_NN.strides = load ptr, ptr %83, align 8, !dbg !15
    #dbg_declare(ptr %matmul.var_T_matmul_NN.strides, !64, !DIExpression(), !15)
    #dbg_declare(ptr %matmul.var_T_matmul_NN.strides, !64, !DIExpression(), !15)
  %T_matmul_NN = load ptr, ptr %var_T_matmul_NN, align 8, !dbg !15
    #dbg_declare(ptr %T_matmul_NN, !65, !DIExpression(), !15)
    #dbg_declare(ptr %T_matmul_NN, !65, !DIExpression(), !15)
  call void @llvm.assume(i1 true) [ "align"(ptr %T_matmul_NN, i64 64) ], !dbg !15
  %84 = getelementptr inbounds i8, ptr %var_A, i64 22, !dbg !15
  %85 = load i16, ptr %84, align 2, !dbg !15
  %86 = icmp eq i16 %85, 1, !dbg !15
  %87 = getelementptr inbounds i8, ptr %var_A, i64 21, !dbg !15
  %88 = load i8, ptr %87, align 1, !dbg !15
  %89 = icmp eq i8 %88, 32, !dbg !15
  %90 = getelementptr inbounds i8, ptr %var_A, i64 20, !dbg !15
  %91 = load i8, ptr %90, align 1, !dbg !15
  %92 = icmp eq i8 %91, 2, !dbg !15
  %93 = and i1 %89, %92, !dbg !15
  %94 = and i1 %86, %93, !dbg !15
  br i1 %94, label %assert_end22, label %assert_fail21, !dbg !15, !prof !16

assert_fail21:                                    ; preds = %assert_end20
  %pgocount26 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 24), align 8, !dbg !15
  %95 = add i64 %pgocount26, 1, !dbg !15
  store i64 %95, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 24), align 8, !dbg !15
  %96 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %97 = ptrtoint ptr %96 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %97, ptr @__profd_matmul, i32 11), !dbg !15
  tail call void %96(ptr nonnull @.str.1, ptr nonnull @.str.12), !dbg !15
  br label %common.ret, !dbg !15

assert_end22:                                     ; preds = %assert_end20
  %.not70 = icmp eq ptr %matmul.var_A.strides, null, !dbg !15
  br i1 %.not70, label %assert_end22.if_end_crit_edge, label %if_then, !dbg !15, !prof !20

assert_end22.if_end_crit_edge:                    ; preds = %assert_end22
  %pgocount27 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 13), align 8, !dbg !15
  %98 = add i64 %pgocount27, 1, !dbg !15
  store i64 %98, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 13), align 8, !dbg !15
  br label %if_end, !dbg !15

if_then:                                          ; preds = %assert_end22
  %99 = load i64, ptr %matmul.var_A.strides, align 8, !dbg !15, !tbaa !66
  %100 = trunc i64 %99 to i32, !dbg !15
  %101 = icmp eq i32 %K, %100, !dbg !15
  %102 = icmp eq i32 %M, 1, !dbg !15
  %103 = or i1 %102, %101, !dbg !15
  %104 = getelementptr inbounds i8, ptr %matmul.var_A.strides, i64 8, !dbg !15
  %105 = load i64, ptr %104, align 8, !dbg !15, !tbaa !76
  %106 = and i64 %105, 4294967295, !dbg !15
  %107 = icmp eq i64 %106, 1, !dbg !15
  %108 = icmp eq i32 %K, 1, !dbg !15
  %109 = or i1 %108, %107, !dbg !15
  %110 = and i1 %103, %109, !dbg !15
  br i1 %110, label %if_end, label %assert_fail23, !dbg !15, !prof !16

if_end:                                           ; preds = %assert_end22.if_end_crit_edge, %if_then
  %111 = getelementptr inbounds i8, ptr %var_A, i64 40, !dbg !15
  %112 = load i64, ptr %111, align 8, !dbg !15
  %113 = icmp eq i64 %112, 0, !dbg !15
  br i1 %113, label %assert_end26, label %assert_fail25, !dbg !15, !prof !16

assert_fail23:                                    ; preds = %if_then
  %pgocount28 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 25), align 8, !dbg !15
  %114 = add i64 %pgocount28, 1, !dbg !15
  store i64 %114, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 25), align 8, !dbg !15
  %115 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %116 = ptrtoint ptr %115 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %116, ptr @__profd_matmul, i32 12), !dbg !15
  tail call void %115(ptr nonnull @.str.1, ptr nonnull @.str.13), !dbg !15
  br label %common.ret, !dbg !15

assert_fail25:                                    ; preds = %if_end
  %pgocount29 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 26), align 8, !dbg !15
  %117 = add i64 %pgocount29, 1, !dbg !15
  store i64 %117, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 26), align 8, !dbg !15
  %118 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %119 = ptrtoint ptr %118 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %119, ptr @__profd_matmul, i32 13), !dbg !15
  tail call void %118(ptr nonnull @.str.1, ptr nonnull @.str.14), !dbg !15
  br label %common.ret, !dbg !15

assert_end26:                                     ; preds = %if_end
  %120 = getelementptr inbounds i8, ptr %var_A, i64 8, !dbg !15
  %121 = load i32, ptr %120, align 4, !dbg !15
  %122 = icmp eq i32 %121, 1, !dbg !15
  br i1 %122, label %assert_end28, label %assert_fail27, !dbg !15, !prof !16

assert_fail27:                                    ; preds = %assert_end26
  %pgocount30 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 27), align 8, !dbg !15
  %123 = add i64 %pgocount30, 1, !dbg !15
  store i64 %123, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 27), align 8, !dbg !15
  %124 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %125 = ptrtoint ptr %124 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %125, ptr @__profd_matmul, i32 14), !dbg !15
  tail call void %124(ptr nonnull @.str.1, ptr nonnull @.str.15), !dbg !15
  br label %common.ret, !dbg !15

assert_end28:                                     ; preds = %assert_end26
  %126 = icmp ne ptr %A, null, !dbg !15
  %127 = mul nsw i32 %K, %M, !dbg !15
  %128 = icmp eq i32 %127, 0, !dbg !15
  %129 = or i1 %128, %126, !dbg !15
  br i1 %129, label %assert_end30, label %assert_fail29, !dbg !15, !prof !16

assert_fail29:                                    ; preds = %assert_end28
  %pgocount31 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 28), align 8, !dbg !15
  %130 = add i64 %pgocount31, 1, !dbg !15
  store i64 %130, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 28), align 8, !dbg !15
  %131 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %132 = ptrtoint ptr %131 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %132, ptr @__profd_matmul, i32 15), !dbg !15
  tail call void %131(ptr nonnull @.str.1, ptr nonnull @.str.16), !dbg !15
  br label %common.ret, !dbg !15

assert_end30:                                     ; preds = %assert_end28
  %133 = getelementptr inbounds i8, ptr %var_B, i64 22, !dbg !15
  %134 = load i16, ptr %133, align 2, !dbg !15
  %135 = icmp eq i16 %134, 1, !dbg !15
  %136 = getelementptr inbounds i8, ptr %var_B, i64 21, !dbg !15
  %137 = load i8, ptr %136, align 1, !dbg !15
  %138 = icmp eq i8 %137, 32, !dbg !15
  %139 = getelementptr inbounds i8, ptr %var_B, i64 20, !dbg !15
  %140 = load i8, ptr %139, align 1, !dbg !15
  %141 = icmp eq i8 %140, 2, !dbg !15
  %142 = and i1 %138, %141, !dbg !15
  %143 = and i1 %135, %142, !dbg !15
  br i1 %143, label %assert_end32, label %assert_fail31, !dbg !15, !prof !16

assert_fail31:                                    ; preds = %assert_end30
  %pgocount32 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 29), align 8, !dbg !15
  %144 = add i64 %pgocount32, 1, !dbg !15
  store i64 %144, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 29), align 8, !dbg !15
  %145 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %146 = ptrtoint ptr %145 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %146, ptr @__profd_matmul, i32 16), !dbg !15
  tail call void %145(ptr nonnull @.str.1, ptr nonnull @.str.17), !dbg !15
  br label %common.ret, !dbg !15

assert_end32:                                     ; preds = %assert_end30
  %147 = load i64, ptr %matmul.var_B.shape, align 8, !dbg !15, !tbaa !78
  %148 = trunc i64 %147 to i32, !dbg !15
  %149 = icmp eq i32 %K, %148, !dbg !15
  br i1 %149, label %assert_end34, label %assert_fail33, !dbg !15, !prof !16

assert_fail33:                                    ; preds = %assert_end32
  %pgocount33 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 30), align 8, !dbg !15
  %150 = add i64 %pgocount33, 1, !dbg !15
  store i64 %150, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 30), align 8, !dbg !15
  %151 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %152 = ptrtoint ptr %151 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %152, ptr @__profd_matmul, i32 17), !dbg !15
  tail call void %151(ptr nonnull @.str.1, ptr nonnull @.str.18), !dbg !15
  br label %common.ret, !dbg !15

assert_end34:                                     ; preds = %assert_end32
  %.not71 = icmp eq ptr %matmul.var_B.strides, null, !dbg !15
  br i1 %.not71, label %assert_end34.if_end36_crit_edge, label %if_then35, !dbg !15, !prof !20

assert_end34.if_end36_crit_edge:                  ; preds = %assert_end34
  %pgocount34 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 14), align 8, !dbg !15
  %153 = add i64 %pgocount34, 1, !dbg !15
  store i64 %153, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 14), align 8, !dbg !15
  br label %if_end36, !dbg !15

if_then35:                                        ; preds = %assert_end34
  %154 = load i64, ptr %matmul.var_B.strides, align 8, !dbg !15, !tbaa !80
  %155 = trunc i64 %154 to i32, !dbg !15
  %156 = icmp eq i32 %N, %155, !dbg !15
  %157 = icmp eq i32 %K, 1, !dbg !15
  %158 = or i1 %157, %156, !dbg !15
  %159 = getelementptr inbounds i8, ptr %matmul.var_B.strides, i64 8, !dbg !15
  %160 = load i64, ptr %159, align 8, !dbg !15, !tbaa !90
  %161 = and i64 %160, 4294967295, !dbg !15
  %162 = icmp eq i64 %161, 1, !dbg !15
  %163 = icmp eq i32 %N, 1, !dbg !15
  %164 = or i1 %163, %162, !dbg !15
  %165 = and i1 %158, %164, !dbg !15
  br i1 %165, label %if_end36, label %assert_fail37, !dbg !15, !prof !16

if_end36:                                         ; preds = %assert_end34.if_end36_crit_edge, %if_then35
  %166 = getelementptr inbounds i8, ptr %var_B, i64 40, !dbg !15
  %167 = load i64, ptr %166, align 8, !dbg !15
  %168 = icmp eq i64 %167, 0, !dbg !15
  br i1 %168, label %assert_end40, label %assert_fail39, !dbg !15, !prof !16

assert_fail37:                                    ; preds = %if_then35
  %pgocount35 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 31), align 8, !dbg !15
  %169 = add i64 %pgocount35, 1, !dbg !15
  store i64 %169, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 31), align 8, !dbg !15
  %170 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %171 = ptrtoint ptr %170 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %171, ptr @__profd_matmul, i32 18), !dbg !15
  tail call void %170(ptr nonnull @.str.1, ptr nonnull @.str.19), !dbg !15
  br label %common.ret, !dbg !15

assert_fail39:                                    ; preds = %if_end36
  %pgocount36 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 32), align 8, !dbg !15
  %172 = add i64 %pgocount36, 1, !dbg !15
  store i64 %172, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 32), align 8, !dbg !15
  %173 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %174 = ptrtoint ptr %173 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %174, ptr @__profd_matmul, i32 19), !dbg !15
  tail call void %173(ptr nonnull @.str.1, ptr nonnull @.str.20), !dbg !15
  br label %common.ret, !dbg !15

assert_end40:                                     ; preds = %if_end36
  %175 = getelementptr inbounds i8, ptr %var_B, i64 8, !dbg !15
  %176 = load i32, ptr %175, align 4, !dbg !15
  %177 = icmp eq i32 %176, 1, !dbg !15
  br i1 %177, label %assert_end42, label %assert_fail41, !dbg !15, !prof !16

assert_fail41:                                    ; preds = %assert_end40
  %pgocount37 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 33), align 8, !dbg !15
  %178 = add i64 %pgocount37, 1, !dbg !15
  store i64 %178, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 33), align 8, !dbg !15
  %179 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %180 = ptrtoint ptr %179 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %180, ptr @__profd_matmul, i32 20), !dbg !15
  tail call void %179(ptr nonnull @.str.1, ptr nonnull @.str.21), !dbg !15
  br label %common.ret, !dbg !15

assert_end42:                                     ; preds = %assert_end40
  %181 = getelementptr inbounds i8, ptr %var_B, i64 12, !dbg !15
  %182 = load i32, ptr %181, align 4, !dbg !15
  %183 = icmp eq i32 %dev_id, %182, !dbg !15
  br i1 %183, label %assert_end44, label %assert_fail43, !dbg !15, !prof !16

assert_fail43:                                    ; preds = %assert_end42
  %pgocount38 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 34), align 8, !dbg !15
  %184 = add i64 %pgocount38, 1, !dbg !15
  store i64 %184, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 34), align 8, !dbg !15
  %185 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %186 = ptrtoint ptr %185 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %186, ptr @__profd_matmul, i32 21), !dbg !15
  tail call void %185(ptr nonnull @.str.1, ptr nonnull @.str.22), !dbg !15
  br label %common.ret, !dbg !15

assert_end44:                                     ; preds = %assert_end42
  %187 = icmp ne ptr %B, null, !dbg !15
  %188 = mul nsw i32 %N, %K, !dbg !15
  %189 = icmp eq i32 %188, 0, !dbg !15
  %190 = or i1 %189, %187, !dbg !15
  br i1 %190, label %assert_end46, label %assert_fail45, !dbg !15, !prof !16

assert_fail45:                                    ; preds = %assert_end44
  %pgocount39 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 35), align 8, !dbg !15
  %191 = add i64 %pgocount39, 1, !dbg !15
  store i64 %191, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 35), align 8, !dbg !15
  %192 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %193 = ptrtoint ptr %192 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %193, ptr @__profd_matmul, i32 22), !dbg !15
  tail call void %192(ptr nonnull @.str.1, ptr nonnull @.str.23), !dbg !15
  br label %common.ret, !dbg !15

assert_end46:                                     ; preds = %assert_end44
  %194 = getelementptr inbounds i8, ptr %var_T_matmul_NN, i64 22, !dbg !15
  %195 = load i16, ptr %194, align 2, !dbg !15
  %196 = icmp eq i16 %195, 1, !dbg !15
  %197 = getelementptr inbounds i8, ptr %var_T_matmul_NN, i64 21, !dbg !15
  %198 = load i8, ptr %197, align 1, !dbg !15
  %199 = icmp eq i8 %198, 32, !dbg !15
  %200 = getelementptr inbounds i8, ptr %var_T_matmul_NN, i64 20, !dbg !15
  %201 = load i8, ptr %200, align 1, !dbg !15
  %202 = icmp eq i8 %201, 2, !dbg !15
  %203 = and i1 %199, %202, !dbg !15
  %204 = and i1 %196, %203, !dbg !15
  br i1 %204, label %assert_end48, label %assert_fail47, !dbg !15, !prof !16

assert_fail47:                                    ; preds = %assert_end46
  %pgocount40 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 36), align 8, !dbg !15
  %205 = add i64 %pgocount40, 1, !dbg !15
  store i64 %205, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 36), align 8, !dbg !15
  %206 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %207 = ptrtoint ptr %206 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %207, ptr @__profd_matmul, i32 23), !dbg !15
  tail call void %206(ptr nonnull @.str.1, ptr nonnull @.str.24), !dbg !15
  br label %common.ret, !dbg !15

assert_end48:                                     ; preds = %assert_end46
  %208 = load i64, ptr %matmul.var_T_matmul_NN.shape, align 8, !dbg !15, !tbaa !92
  %209 = trunc i64 %208 to i32, !dbg !15
  %210 = icmp eq i32 %M, %209, !dbg !15
  br i1 %210, label %assert_end50, label %assert_fail49, !dbg !15, !prof !16

assert_fail49:                                    ; preds = %assert_end48
  %pgocount41 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 37), align 8, !dbg !15
  %211 = add i64 %pgocount41, 1, !dbg !15
  store i64 %211, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 37), align 8, !dbg !15
  %212 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %213 = ptrtoint ptr %212 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %213, ptr @__profd_matmul, i32 24), !dbg !15
  tail call void %212(ptr nonnull @.str.1, ptr nonnull @.str.25), !dbg !15
  br label %common.ret, !dbg !15

assert_end50:                                     ; preds = %assert_end48
  %214 = getelementptr inbounds i8, ptr %matmul.var_T_matmul_NN.shape, i64 8, !dbg !15
  %215 = load i64, ptr %214, align 8, !dbg !15, !tbaa !102
  %216 = trunc i64 %215 to i32, !dbg !15
  %217 = icmp eq i32 %N, %216, !dbg !15
  br i1 %217, label %assert_end52, label %assert_fail51, !dbg !15, !prof !16

assert_fail51:                                    ; preds = %assert_end50
  %pgocount42 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 38), align 8, !dbg !15
  %218 = add i64 %pgocount42, 1, !dbg !15
  store i64 %218, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 38), align 8, !dbg !15
  %219 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %220 = ptrtoint ptr %219 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %220, ptr @__profd_matmul, i32 25), !dbg !15
  tail call void %219(ptr nonnull @.str.1, ptr nonnull @.str.26), !dbg !15
  br label %common.ret, !dbg !15

assert_end52:                                     ; preds = %assert_end50
  %.not72 = icmp eq ptr %matmul.var_T_matmul_NN.strides, null, !dbg !15
  br i1 %.not72, label %assert_end52.if_end54_crit_edge, label %if_then53, !dbg !15, !prof !20

assert_end52.if_end54_crit_edge:                  ; preds = %assert_end52
  %pgocount43 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 15), align 8, !dbg !15
  %221 = add i64 %pgocount43, 1, !dbg !15
  store i64 %221, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 15), align 8, !dbg !15
  br label %if_end54, !dbg !15

if_then53:                                        ; preds = %assert_end52
  %222 = load i64, ptr %matmul.var_T_matmul_NN.strides, align 8, !dbg !15, !tbaa !104
  %223 = trunc i64 %222 to i32, !dbg !15
  %224 = icmp eq i32 %N, %223, !dbg !15
  %225 = icmp eq i32 %M, 1, !dbg !15
  %226 = or i1 %225, %224, !dbg !15
  %227 = getelementptr inbounds i8, ptr %matmul.var_T_matmul_NN.strides, i64 8, !dbg !15
  %228 = load i64, ptr %227, align 8, !dbg !15, !tbaa !114
  %229 = and i64 %228, 4294967295, !dbg !15
  %230 = icmp eq i64 %229, 1, !dbg !15
  %231 = icmp eq i32 %N, 1, !dbg !15
  %232 = or i1 %231, %230, !dbg !15
  %233 = and i1 %226, %232, !dbg !15
  br i1 %233, label %if_end54, label %assert_fail55, !dbg !15, !prof !16

if_end54:                                         ; preds = %assert_end52.if_end54_crit_edge, %if_then53
  %234 = getelementptr inbounds i8, ptr %var_T_matmul_NN, i64 40, !dbg !15
  %235 = load i64, ptr %234, align 8, !dbg !15
  %236 = icmp eq i64 %235, 0, !dbg !15
  br i1 %236, label %assert_end58, label %assert_fail57, !dbg !15, !prof !16

assert_fail55:                                    ; preds = %if_then53
  %pgocount44 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 39), align 8, !dbg !15
  %237 = add i64 %pgocount44, 1, !dbg !15
  store i64 %237, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 39), align 8, !dbg !15
  %238 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %239 = ptrtoint ptr %238 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %239, ptr @__profd_matmul, i32 26), !dbg !15
  tail call void %238(ptr nonnull @.str.1, ptr nonnull @.str.27), !dbg !15
  br label %common.ret, !dbg !15

assert_fail57:                                    ; preds = %if_end54
  %pgocount45 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 40), align 8, !dbg !15
  %240 = add i64 %pgocount45, 1, !dbg !15
  store i64 %240, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 40), align 8, !dbg !15
  %241 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %242 = ptrtoint ptr %241 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %242, ptr @__profd_matmul, i32 27), !dbg !15
  tail call void %241(ptr nonnull @.str.1, ptr nonnull @.str.28), !dbg !15
  br label %common.ret, !dbg !15

assert_end58:                                     ; preds = %if_end54
  %243 = getelementptr inbounds i8, ptr %var_T_matmul_NN, i64 8, !dbg !15
  %244 = load i32, ptr %243, align 4, !dbg !15
  %245 = icmp eq i32 %244, 1, !dbg !15
  br i1 %245, label %assert_end60, label %assert_fail59, !dbg !15, !prof !16

assert_fail59:                                    ; preds = %assert_end58
  %pgocount46 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 41), align 8, !dbg !15
  %246 = add i64 %pgocount46, 1, !dbg !15
  store i64 %246, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 41), align 8, !dbg !15
  %247 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %248 = ptrtoint ptr %247 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %248, ptr @__profd_matmul, i32 28), !dbg !15
  tail call void %247(ptr nonnull @.str.1, ptr nonnull @.str.29), !dbg !15
  br label %common.ret, !dbg !15

assert_end60:                                     ; preds = %assert_end58
  %249 = getelementptr inbounds i8, ptr %var_T_matmul_NN, i64 12, !dbg !15
  %250 = load i32, ptr %249, align 4, !dbg !15
  %251 = icmp eq i32 %dev_id, %250, !dbg !15
  br i1 %251, label %assert_end62, label %assert_fail61, !dbg !15, !prof !16

assert_fail61:                                    ; preds = %assert_end60
  %pgocount47 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 42), align 8, !dbg !15
  %252 = add i64 %pgocount47, 1, !dbg !15
  store i64 %252, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 42), align 8, !dbg !15
  %253 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %254 = ptrtoint ptr %253 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %254, ptr @__profd_matmul, i32 29), !dbg !15
  tail call void %253(ptr nonnull @.str.1, ptr nonnull @.str.30), !dbg !15
  br label %common.ret, !dbg !15

assert_end62:                                     ; preds = %assert_end60
  %255 = icmp ne ptr %T_matmul_NN, null, !dbg !15
  %256 = mul nsw i32 %N, %M, !dbg !15
  %257 = icmp eq i32 %256, 0, !dbg !15
  %258 = or i1 %257, %255, !dbg !15
  br i1 %258, label %assert_end64, label %assert_fail63, !dbg !15, !prof !16

assert_fail63:                                    ; preds = %assert_end62
  %pgocount48 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 43), align 8, !dbg !15
  %259 = add i64 %pgocount48, 1, !dbg !15
  store i64 %259, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 43), align 8, !dbg !15
  %260 = load ptr, ptr @__TVMFFIErrorSetRaisedByCStr, align 8, !dbg !15, !tbaa !17
  %261 = ptrtoint ptr %260 to i64, !dbg !15
  call void @__llvm_profile_instrument_target(i64 %261, ptr @__profd_matmul, i32 30), !dbg !15
  tail call void %260(ptr nonnull @.str.1, ptr nonnull @.str.31), !dbg !15
  br label %common.ret, !dbg !15

assert_end64:                                     ; preds = %assert_end62
  %pgocount49 = load i64, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 6), align 8, !dbg !15
  %262 = add i64 %pgocount49, 1, !dbg !15
  store i64 %262, ptr getelementptr inbounds ([47 x i64], ptr @__profc_matmul, i32 0, i32 6), align 8, !dbg !15
  tail call fastcc void @matmul_compute_(i32 %M, i32 %N, i32 %K, ptr %T_matmul_NN, ptr %A, ptr %B), !dbg !15
  br label %common.ret, !dbg !15
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define internal fastcc void @matmul_compute_(i32 %M, i32 %N, i32 %K, ptr noalias nocapture writeonly align 64 %T_matmul_NN, ptr noalias nocapture readonly align 64 %A, ptr noalias nocapture readonly align 64 %B) unnamed_addr #2 !dbg !116 {
entry:
  %pgocount = load i64, ptr getelementptr inbounds ([11 x i64], ptr @__profc_TVMMod_matmul_compute_, i32 0, i32 7), align 8, !dbg !126
  %0 = add i64 %pgocount, 1, !dbg !126
  store i64 %0, ptr getelementptr inbounds ([11 x i64], ptr @__profc_TVMMod_matmul_compute_, i32 0, i32 7), align 8, !dbg !126
    #dbg_value(i32 %M, !120, !DIExpression(), !126)
    #dbg_value(i32 %N, !121, !DIExpression(), !126)
    #dbg_value(i32 %K, !122, !DIExpression(), !126)
    #dbg_value(ptr %T_matmul_NN, !123, !DIExpression(), !126)
    #dbg_value(ptr %A, !124, !DIExpression(), !126)
    #dbg_value(ptr %B, !125, !DIExpression(), !126)
    #dbg_declare(i32 0, !127, !DIExpression(), !126)
  %1 = icmp sgt i32 %M, 0, !dbg !126
  %2 = icmp sgt i32 %N, 0
  %3 = zext i1 %1 to i64, !dbg !126
  %pgocount1 = load i64, ptr getelementptr inbounds ([11 x i64], ptr @__profc_TVMMod_matmul_compute_, i32 0, i32 9), align 8, !dbg !126
  %4 = add i64 %pgocount1, %3, !dbg !126
  store i64 %4, ptr getelementptr inbounds ([11 x i64], ptr @__profc_TVMMod_matmul_compute_, i32 0, i32 9), align 8, !dbg !126
  %or.cond = select i1 %1, i1 %2, i1 false, !dbg !126
  %5 = icmp sgt i32 %K, 0
  %6 = zext i1 %or.cond to i64, !dbg !126
  %pgocount2 = load i64, ptr getelementptr inbounds ([11 x i64], ptr @__profc_TVMMod_matmul_compute_, i32 0, i32 10), align 8, !dbg !126
  %7 = add i64 %pgocount2, %6, !dbg !126
  store i64 %7, ptr getelementptr inbounds ([11 x i64], ptr @__profc_TVMMod_matmul_compute_, i32 0, i32 10), align 8, !dbg !126
  %or.cond26 = select i1 %or.cond, i1 %5, i1 false, !dbg !126
  br i1 %or.cond26, label %for_begin_i1.preheader.us.us.preheader, label %for_end_i0, !dbg !126, !prof !128

for_begin_i1.preheader.us.us.preheader:           ; preds = %entry
  %pgocount3 = load i64, ptr getelementptr inbounds ([11 x i64], ptr @__profc_TVMMod_matmul_compute_, i32 0, i32 8), align 8, !dbg !126
  %8 = add i64 %pgocount3, 1, !dbg !126
  store i64 %8, ptr getelementptr inbounds ([11 x i64], ptr @__profc_TVMMod_matmul_compute_, i32 0, i32 8), align 8, !dbg !126
  %9 = zext nneg i32 %N to i64, !dbg !126
  %10 = zext nneg i32 %K to i64, !dbg !126
  %wide.trip.count20 = zext nneg i32 %M to i64, !dbg !126
  %exitcond.peel.not = icmp eq i32 %K, 1
  %11 = add nsw i64 %10, -1, !dbg !126
  %12 = add nsw i64 %10, -2, !dbg !126
  %xtraiter = and i64 %11, 3
  %13 = icmp ult i64 %12, 3
  %unroll_iter = and i64 %11, -4
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br label %for_begin_i1.preheader.us.us, !dbg !126

for_begin_i1.preheader.us.us:                     ; preds = %for_begin_i1.for_end_i1_crit_edge.split.us.us.us, %for_begin_i1.preheader.us.us.preheader
  %indvars.iv17 = phi i64 [ 0, %for_begin_i1.preheader.us.us.preheader ], [ %indvars.iv.next18, %for_begin_i1.for_end_i1_crit_edge.split.us.us.us ]
    #dbg_declare(i64 %indvars.iv17, !127, !DIExpression(), !126)
    #dbg_declare(i32 0, !129, !DIExpression(), !126)
  %14 = mul nuw nsw i64 %indvars.iv17, %9
  %15 = mul nuw nsw i64 %indvars.iv17, %10
  %invariant.gep24 = getelementptr inbounds float, ptr %T_matmul_NN, i64 %14, !dbg !126
  %16 = getelementptr inbounds float, ptr %A, i64 %15
  %17 = load float, ptr %16, align 4, !tbaa !130
  %invariant.gep = getelementptr inbounds float, ptr %A, i64 %15
  br label %if_end.us.us.us.peel, !dbg !126

if_end.us.us.us.peel:                             ; preds = %for_begin_k.for_end_k_crit_edge.us.us.us, %for_begin_i1.preheader.us.us
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %for_begin_k.for_end_k_crit_edge.us.us.us ], [ 0, %for_begin_i1.preheader.us.us ]
    #dbg_declare(i64 %indvars.iv12, !129, !DIExpression(), !126)
    #dbg_declare(i32 0, !132, !DIExpression(), !126)
  %gep25 = getelementptr inbounds float, ptr %invariant.gep24, i64 %indvars.iv12
    #dbg_declare(i64 0, !132, !DIExpression(), !126)
  %18 = getelementptr inbounds float, ptr %B, i64 %indvars.iv12, !dbg !126
  %19 = load float, ptr %18, align 4, !dbg !126, !tbaa !133
  %20 = tail call float @llvm.fmuladd.f32(float %17, float %19, float 0.000000e+00), !dbg !126
  store float %20, ptr %gep25, align 4, !dbg !126, !tbaa !135
    #dbg_declare(i64 1, !132, !DIExpression(), !126)
  br i1 %exitcond.peel.not, label %if_end.us.us.us.peel.for_begin_k.for_end_k_crit_edge.us.us.us_crit_edge, label %for_body_k.us.us.us.peel.next, !dbg !126, !prof !137

if_end.us.us.us.peel.for_begin_k.for_end_k_crit_edge.us.us.us_crit_edge: ; preds = %if_end.us.us.us.peel
  %pgocount4 = load i64, ptr getelementptr inbounds ([11 x i64], ptr @__profc_TVMMod_matmul_compute_, i32 0, i32 5), align 8, !dbg !126
  %21 = add i64 %pgocount4, 1, !dbg !126
  store i64 %21, ptr getelementptr inbounds ([11 x i64], ptr @__profc_TVMMod_matmul_compute_, i32 0, i32 5), align 8, !dbg !126
  br label %for_begin_k.for_end_k_crit_edge.us.us.us, !dbg !126

for_body_k.us.us.us.peel.next:                    ; preds = %if_end.us.us.us.peel
  %pgocount5 = load i64, ptr getelementptr inbounds ([11 x i64], ptr @__profc_TVMMod_matmul_compute_, i32 0, i32 4), align 8, !dbg !126
  %22 = add i64 %pgocount5, 1, !dbg !126
  store i64 %22, ptr getelementptr inbounds ([11 x i64], ptr @__profc_TVMMod_matmul_compute_, i32 0, i32 4), align 8, !dbg !126
  %invariant.gep22 = getelementptr inbounds float, ptr %B, i64 %indvars.iv12, !dbg !126
  br i1 %13, label %for_body_k.us.us.us.peel.next.for_begin_k.for_end_k_crit_edge.us.us.us.loopexit.unr-lcssa_crit_edge, label %if_end.us.us.us, !dbg !126, !prof !138

for_body_k.us.us.us.peel.next.for_begin_k.for_end_k_crit_edge.us.us.us.loopexit.unr-lcssa_crit_edge: ; preds = %for_body_k.us.us.us.peel.next
  %pgocount6 = load i64, ptr getelementptr inbounds ([11 x i64], ptr @__profc_TVMMod_matmul_compute_, i32 0, i32 3), align 8, !dbg !126
  %23 = add i64 %pgocount6, 1, !dbg !126
  store i64 %23, ptr getelementptr inbounds ([11 x i64], ptr @__profc_TVMMod_matmul_compute_, i32 0, i32 3), align 8, !dbg !126
  br label %for_begin_k.for_end_k_crit_edge.us.us.us.loopexit.unr-lcssa, !dbg !126

if_end.us.us.us:                                  ; preds = %if_end.us.us.us.if_end.us.us.us_crit_edge, %for_body_k.us.us.us.peel.next
  %24 = phi float [ %40, %if_end.us.us.us.if_end.us.us.us_crit_edge ], [ %20, %for_body_k.us.us.us.peel.next ]
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %if_end.us.us.us.if_end.us.us.us_crit_edge ], [ 1, %for_body_k.us.us.us.peel.next ]
  %niter = phi i64 [ %niter.next.3, %if_end.us.us.us.if_end.us.us.us_crit_edge ], [ 0, %for_body_k.us.us.us.peel.next ]
    #dbg_declare(i64 %indvars.iv, !132, !DIExpression(), !126)
  %gep = getelementptr inbounds float, ptr %invariant.gep, i64 %indvars.iv, !dbg !126
  %25 = load float, ptr %gep, align 4, !dbg !126, !tbaa !130
  %26 = mul nuw nsw i64 %indvars.iv, %9, !dbg !126
  %gep23 = getelementptr inbounds float, ptr %invariant.gep22, i64 %26, !dbg !126
  %27 = load float, ptr %gep23, align 4, !dbg !126, !tbaa !133
  %28 = tail call float @llvm.fmuladd.f32(float %25, float %27, float %24), !dbg !126
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !126
    #dbg_declare(i64 %indvars.iv.next, !132, !DIExpression(), !126)
    #dbg_declare(i64 %indvars.iv.next, !132, !DIExpression(), !126)
  %gep.1 = getelementptr inbounds float, ptr %invariant.gep, i64 %indvars.iv.next, !dbg !126
  %29 = load float, ptr %gep.1, align 4, !dbg !126, !tbaa !130
  %30 = mul nuw nsw i64 %indvars.iv.next, %9, !dbg !126
  %gep23.1 = getelementptr inbounds float, ptr %invariant.gep22, i64 %30, !dbg !126
  %31 = load float, ptr %gep23.1, align 4, !dbg !126, !tbaa !133
  %32 = tail call float @llvm.fmuladd.f32(float %29, float %31, float %28), !dbg !126
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2, !dbg !126
    #dbg_declare(i64 %indvars.iv.next.1, !132, !DIExpression(), !126)
    #dbg_declare(i64 %indvars.iv.next.1, !132, !DIExpression(), !126)
  %gep.2 = getelementptr inbounds float, ptr %invariant.gep, i64 %indvars.iv.next.1, !dbg !126
  %33 = load float, ptr %gep.2, align 4, !dbg !126, !tbaa !130
  %34 = mul nuw nsw i64 %indvars.iv.next.1, %9, !dbg !126
  %gep23.2 = getelementptr inbounds float, ptr %invariant.gep22, i64 %34, !dbg !126
  %35 = load float, ptr %gep23.2, align 4, !dbg !126, !tbaa !133
  %36 = tail call float @llvm.fmuladd.f32(float %33, float %35, float %32), !dbg !126
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3, !dbg !126
    #dbg_declare(i64 %indvars.iv.next.2, !132, !DIExpression(), !126)
    #dbg_declare(i64 %indvars.iv.next.2, !132, !DIExpression(), !126)
  %gep.3 = getelementptr inbounds float, ptr %invariant.gep, i64 %indvars.iv.next.2, !dbg !126
  %37 = load float, ptr %gep.3, align 4, !dbg !126, !tbaa !130
  %38 = mul nuw nsw i64 %indvars.iv.next.2, %9, !dbg !126
  %gep23.3 = getelementptr inbounds float, ptr %invariant.gep22, i64 %38, !dbg !126
  %39 = load float, ptr %gep23.3, align 4, !dbg !126, !tbaa !133
  %40 = tail call float @llvm.fmuladd.f32(float %37, float %39, float %36), !dbg !126
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4, !dbg !126
    #dbg_declare(i64 %indvars.iv.next.3, !132, !DIExpression(), !126)
  %niter.next.3 = add i64 %niter, 4, !dbg !126
  %niter.ncmp.3 = icmp eq i64 %niter.next.3, %unroll_iter, !dbg !126
  br i1 %niter.ncmp.3, label %for_begin_k.for_end_k_crit_edge.us.us.us.loopexit.unr-lcssa, label %if_end.us.us.us.if_end.us.us.us_crit_edge, !dbg !126, !prof !139, !llvm.loop !140

if_end.us.us.us.if_end.us.us.us_crit_edge:        ; preds = %if_end.us.us.us
  %pgocount7 = load i64, ptr @__profc_TVMMod_matmul_compute_, align 8, !dbg !126
  %41 = add i64 %pgocount7, 1, !dbg !126
  store i64 %41, ptr @__profc_TVMMod_matmul_compute_, align 8, !dbg !126
  br label %if_end.us.us.us, !dbg !126

for_begin_k.for_end_k_crit_edge.us.us.us.loopexit.unr-lcssa: ; preds = %for_body_k.us.us.us.peel.next.for_begin_k.for_end_k_crit_edge.us.us.us.loopexit.unr-lcssa_crit_edge, %if_end.us.us.us
  %.lcssa.ph = phi float [ poison, %for_body_k.us.us.us.peel.next.for_begin_k.for_end_k_crit_edge.us.us.us.loopexit.unr-lcssa_crit_edge ], [ %40, %if_end.us.us.us ]
  %.unr = phi float [ %20, %for_body_k.us.us.us.peel.next.for_begin_k.for_end_k_crit_edge.us.us.us.loopexit.unr-lcssa_crit_edge ], [ %40, %if_end.us.us.us ]
  %indvars.iv.unr = phi i64 [ 1, %for_body_k.us.us.us.peel.next.for_begin_k.for_end_k_crit_edge.us.us.us.loopexit.unr-lcssa_crit_edge ], [ %indvars.iv.next.3, %if_end.us.us.us ]
  br i1 %lcmp.mod.not, label %for_begin_k.for_end_k_crit_edge.us.us.us.loopexit, label %if_end.us.us.us.epil, !dbg !126, !prof !142

if_end.us.us.us.epil:                             ; preds = %if_end.us.us.us.epil.if_end.us.us.us.epil_crit_edge, %for_begin_k.for_end_k_crit_edge.us.us.us.loopexit.unr-lcssa
  %42 = phi float [ %46, %if_end.us.us.us.epil.if_end.us.us.us.epil_crit_edge ], [ %.unr, %for_begin_k.for_end_k_crit_edge.us.us.us.loopexit.unr-lcssa ]
  %indvars.iv.epil = phi i64 [ %indvars.iv.next.epil, %if_end.us.us.us.epil.if_end.us.us.us.epil_crit_edge ], [ %indvars.iv.unr, %for_begin_k.for_end_k_crit_edge.us.us.us.loopexit.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.next, %if_end.us.us.us.epil.if_end.us.us.us.epil_crit_edge ], [ 0, %for_begin_k.for_end_k_crit_edge.us.us.us.loopexit.unr-lcssa ]
    #dbg_declare(i64 %indvars.iv.epil, !132, !DIExpression(), !126)
  %gep.epil = getelementptr inbounds float, ptr %invariant.gep, i64 %indvars.iv.epil, !dbg !126
  %43 = load float, ptr %gep.epil, align 4, !dbg !126, !tbaa !130
  %44 = mul nuw nsw i64 %indvars.iv.epil, %9, !dbg !126
  %gep23.epil = getelementptr inbounds float, ptr %invariant.gep22, i64 %44, !dbg !126
  %45 = load float, ptr %gep23.epil, align 4, !dbg !126, !tbaa !133
  %46 = tail call float @llvm.fmuladd.f32(float %43, float %45, float %42), !dbg !126
  %indvars.iv.next.epil = add nuw nsw i64 %indvars.iv.epil, 1, !dbg !126
    #dbg_declare(i64 %indvars.iv.next.epil, !132, !DIExpression(), !126)
  %epil.iter.next = add i64 %epil.iter, 1, !dbg !126
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.next, %xtraiter, !dbg !126
  br i1 %epil.iter.cmp.not, label %if_end.us.us.us.epil.for_begin_k.for_end_k_crit_edge.us.us.us.loopexit_crit_edge, label %if_end.us.us.us.epil.if_end.us.us.us.epil_crit_edge, !dbg !126, !prof !143, !llvm.loop !144

if_end.us.us.us.epil.if_end.us.us.us.epil_crit_edge: ; preds = %if_end.us.us.us.epil
  %pgocount8 = load i64, ptr getelementptr inbounds ([11 x i64], ptr @__profc_TVMMod_matmul_compute_, i32 0, i32 2), align 8, !dbg !126
  %47 = add i64 %pgocount8, 1, !dbg !126
  store i64 %47, ptr getelementptr inbounds ([11 x i64], ptr @__profc_TVMMod_matmul_compute_, i32 0, i32 2), align 8, !dbg !126
  br label %if_end.us.us.us.epil, !dbg !126

if_end.us.us.us.epil.for_begin_k.for_end_k_crit_edge.us.us.us.loopexit_crit_edge: ; preds = %if_end.us.us.us.epil
  %pgocount9 = load i64, ptr getelementptr inbounds ([11 x i64], ptr @__profc_TVMMod_matmul_compute_, i32 0, i32 1), align 8, !dbg !126
  %48 = add i64 %pgocount9, 1, !dbg !126
  store i64 %48, ptr getelementptr inbounds ([11 x i64], ptr @__profc_TVMMod_matmul_compute_, i32 0, i32 1), align 8, !dbg !126
  br label %for_begin_k.for_end_k_crit_edge.us.us.us.loopexit, !dbg !126

for_begin_k.for_end_k_crit_edge.us.us.us.loopexit: ; preds = %if_end.us.us.us.epil.for_begin_k.for_end_k_crit_edge.us.us.us.loopexit_crit_edge, %for_begin_k.for_end_k_crit_edge.us.us.us.loopexit.unr-lcssa
  %.lcssa = phi float [ %.lcssa.ph, %for_begin_k.for_end_k_crit_edge.us.us.us.loopexit.unr-lcssa ], [ %46, %if_end.us.us.us.epil.for_begin_k.for_end_k_crit_edge.us.us.us.loopexit_crit_edge ], !dbg !126
  store float %.lcssa, ptr %gep25, align 4, !dbg !126, !tbaa !135
  br label %for_begin_k.for_end_k_crit_edge.us.us.us, !dbg !126

for_begin_k.for_end_k_crit_edge.us.us.us:         ; preds = %if_end.us.us.us.peel.for_begin_k.for_end_k_crit_edge.us.us.us_crit_edge, %for_begin_k.for_end_k_crit_edge.us.us.us.loopexit
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1, !dbg !126
    #dbg_declare(i64 %indvars.iv.next13, !129, !DIExpression(), !126)
  %exitcond16.not = icmp eq i64 %indvars.iv.next13, %9, !dbg !126
  br i1 %exitcond16.not, label %for_begin_i1.for_end_i1_crit_edge.split.us.us.us, label %if_end.us.us.us.peel, !dbg !126, !prof !137

for_begin_i1.for_end_i1_crit_edge.split.us.us.us: ; preds = %for_begin_k.for_end_k_crit_edge.us.us.us
  %pgocount10 = load i64, ptr getelementptr inbounds ([11 x i64], ptr @__profc_TVMMod_matmul_compute_, i32 0, i32 6), align 8, !dbg !126
  %49 = add i64 %pgocount10, 1, !dbg !126
  store i64 %49, ptr getelementptr inbounds ([11 x i64], ptr @__profc_TVMMod_matmul_compute_, i32 0, i32 6), align 8, !dbg !126
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1, !dbg !126
    #dbg_declare(i64 %indvars.iv.next18, !127, !DIExpression(), !126)
  %exitcond21.not = icmp eq i64 %indvars.iv.next18, %wide.trip.count20, !dbg !126
  br i1 %exitcond21.not, label %for_end_i0, label %for_begin_i1.preheader.us.us, !dbg !126, !prof !137

for_end_i0:                                       ; preds = %for_begin_i1.for_end_i1_crit_edge.split.us.us.us, %entry
  ret void, !dbg !126
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

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(ptr, i64, i32, i32) #5

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(ptr, i64, i32, i32, i64) #5

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(ptr, i64, i64, i32, i32) #5

declare void @__llvm_profile_instrument_target(i64, ptr, i32)

attributes #0 = { "target-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #2 = { nofree noinline norecurse nosync nounwind memory(argmem: readwrite) "target-cpu"="generic" }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nofree nosync nounwind memory(none) "target-cpu"="generic" "target-features" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "TVM", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "IRModule.CodeGenLLVM", directory: ".")
!2 = !{i32 2, !"tvm_target", !"llvm -mtriple=x86_64-unknown-linux-gnu"}
!3 = !{i32 4, !"Debug Info Version", i32 3}
!4 = !{i32 4, !"Dwarf Version", i32 4}
!5 = distinct !DISubprogram(name: "matmul", scope: !1, file: !1, type: !6, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !10)
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
!23 = !DILocalVariable(name: "var_T_matmul_NN.type_index", scope: !5, file: !1, type: !8)
!24 = !DILocalVariable(name: "var_A", scope: !5, file: !1, type: !9)
!25 = !DILocalVariable(name: "var_B", scope: !5, file: !1, type: !9)
!26 = !DILocalVariable(name: "var_T_matmul_NN", scope: !5, file: !1, type: !9)
!27 = !DILocalVariable(name: "matmul.var_A.shape", scope: !5, file: !1, type: !28)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29)
!29 = !DIBasicType(name: "int64", size: 64, encoding: DW_ATE_signed)
!30 = !{!31, !31, i64 0}
!31 = !{!"0x198e77c0.w8.b0", !32, i64 0}
!32 = !{!"0x198e77c0.w16.b0", !33, i64 0}
!33 = !{!"0x198e77c0.w32.b0", !34, i64 0}
!34 = !{!"0x198e77c0.w64.b0", !35, i64 0}
!35 = !{!"0x198e77c0.w128.b0", !36, i64 0}
!36 = !{!"0x198e77c0.w256.b0", !37, i64 0}
!37 = !{!"0x198e77c0.w512.b0", !38, i64 0}
!38 = !{!"0x198e77c0.w1024.b0", !39, i64 0}
!39 = !{!"0x198e77c0", !19, i64 0}
!40 = !DILocalVariable(name: "M", scope: !5, file: !1, type: !8)
!41 = !{!42, !42, i64 0}
!42 = !{!"0x198e77c0.w8.b8", !32, i64 0}
!43 = !DILocalVariable(name: "K", scope: !5, file: !1, type: !8)
!44 = !DILocalVariable(name: "matmul.var_A.strides", scope: !5, file: !1, type: !28)
!45 = !DILocalVariable(name: "dev_id", scope: !5, file: !1, type: !8)
!46 = !DILocalVariable(name: "A", scope: !5, file: !1, type: !47)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48)
!48 = !DIBasicType(name: "float32", size: 32, encoding: DW_ATE_float)
!49 = !DILocalVariable(name: "matmul.var_B.shape", scope: !5, file: !1, type: !28)
!50 = !{!51, !51, i64 0}
!51 = !{!"0x192e42f0.w8.b8", !52, i64 0}
!52 = !{!"0x192e42f0.w16.b0", !53, i64 0}
!53 = !{!"0x192e42f0.w32.b0", !54, i64 0}
!54 = !{!"0x192e42f0.w64.b0", !55, i64 0}
!55 = !{!"0x192e42f0.w128.b0", !56, i64 0}
!56 = !{!"0x192e42f0.w256.b0", !57, i64 0}
!57 = !{!"0x192e42f0.w512.b0", !58, i64 0}
!58 = !{!"0x192e42f0.w1024.b0", !59, i64 0}
!59 = !{!"0x192e42f0", !19, i64 0}
!60 = !DILocalVariable(name: "N", scope: !5, file: !1, type: !8)
!61 = !DILocalVariable(name: "matmul.var_B.strides", scope: !5, file: !1, type: !28)
!62 = !DILocalVariable(name: "B", scope: !5, file: !1, type: !47)
!63 = !DILocalVariable(name: "matmul.var_T_matmul_NN.shape", scope: !5, file: !1, type: !28)
!64 = !DILocalVariable(name: "matmul.var_T_matmul_NN.strides", scope: !5, file: !1, type: !28)
!65 = !DILocalVariable(name: "T_matmul_NN", scope: !5, file: !1, type: !47)
!66 = !{!67, !67, i64 0}
!67 = !{!"0x199633a0.w8.b0", !68, i64 0}
!68 = !{!"0x199633a0.w16.b0", !69, i64 0}
!69 = !{!"0x199633a0.w32.b0", !70, i64 0}
!70 = !{!"0x199633a0.w64.b0", !71, i64 0}
!71 = !{!"0x199633a0.w128.b0", !72, i64 0}
!72 = !{!"0x199633a0.w256.b0", !73, i64 0}
!73 = !{!"0x199633a0.w512.b0", !74, i64 0}
!74 = !{!"0x199633a0.w1024.b0", !75, i64 0}
!75 = !{!"0x199633a0", !19, i64 0}
!76 = !{!77, !77, i64 0}
!77 = !{!"0x199633a0.w8.b8", !68, i64 0}
!78 = !{!79, !79, i64 0}
!79 = !{!"0x192e42f0.w8.b0", !52, i64 0}
!80 = !{!81, !81, i64 0}
!81 = !{!"0x19895570.w8.b0", !82, i64 0}
!82 = !{!"0x19895570.w16.b0", !83, i64 0}
!83 = !{!"0x19895570.w32.b0", !84, i64 0}
!84 = !{!"0x19895570.w64.b0", !85, i64 0}
!85 = !{!"0x19895570.w128.b0", !86, i64 0}
!86 = !{!"0x19895570.w256.b0", !87, i64 0}
!87 = !{!"0x19895570.w512.b0", !88, i64 0}
!88 = !{!"0x19895570.w1024.b0", !89, i64 0}
!89 = !{!"0x19895570", !19, i64 0}
!90 = !{!91, !91, i64 0}
!91 = !{!"0x19895570.w8.b8", !82, i64 0}
!92 = !{!93, !93, i64 0}
!93 = !{!"0x1998ab30.w8.b0", !94, i64 0}
!94 = !{!"0x1998ab30.w16.b0", !95, i64 0}
!95 = !{!"0x1998ab30.w32.b0", !96, i64 0}
!96 = !{!"0x1998ab30.w64.b0", !97, i64 0}
!97 = !{!"0x1998ab30.w128.b0", !98, i64 0}
!98 = !{!"0x1998ab30.w256.b0", !99, i64 0}
!99 = !{!"0x1998ab30.w512.b0", !100, i64 0}
!100 = !{!"0x1998ab30.w1024.b0", !101, i64 0}
!101 = !{!"0x1998ab30", !19, i64 0}
!102 = !{!103, !103, i64 0}
!103 = !{!"0x1998ab30.w8.b8", !94, i64 0}
!104 = !{!105, !105, i64 0}
!105 = !{!"0x1994da40.w8.b0", !106, i64 0}
!106 = !{!"0x1994da40.w16.b0", !107, i64 0}
!107 = !{!"0x1994da40.w32.b0", !108, i64 0}
!108 = !{!"0x1994da40.w64.b0", !109, i64 0}
!109 = !{!"0x1994da40.w128.b0", !110, i64 0}
!110 = !{!"0x1994da40.w256.b0", !111, i64 0}
!111 = !{!"0x1994da40.w512.b0", !112, i64 0}
!112 = !{!"0x1994da40.w1024.b0", !113, i64 0}
!113 = !{!"0x1994da40", !19, i64 0}
!114 = !{!115, !115, i64 0}
!115 = !{!"0x1994da40.w8.b8", !106, i64 0}
!116 = distinct !DISubprogram(name: "matmul_compute_", scope: !1, file: !1, type: !117, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !119)
!117 = !DISubroutineType(cc: DW_CC_nocall, types: !118)
!118 = !{!8, !8, !8, !8, !47, !47, !47}
!119 = !{!120, !121, !122, !123, !124, !125}
!120 = !DILocalVariable(name: "M", arg: 1, scope: !116, file: !1, type: !8)
!121 = !DILocalVariable(name: "N", arg: 2, scope: !116, file: !1, type: !8)
!122 = !DILocalVariable(name: "K", arg: 3, scope: !116, file: !1, type: !8)
!123 = !DILocalVariable(name: "T_matmul_NN", arg: 4, scope: !116, file: !1, type: !47)
!124 = !DILocalVariable(name: "A", arg: 5, scope: !116, file: !1, type: !47)
!125 = !DILocalVariable(name: "B", arg: 6, scope: !116, file: !1, type: !47)
!126 = !DILocation(line: 0, scope: !116)
!127 = !DILocalVariable(name: "i0", scope: !116, file: !1, type: !8)
!128 = !{!"branch_weights", i32 2048383, i32 48769}
!129 = !DILocalVariable(name: "i1", scope: !116, file: !1, type: !8)
!130 = !{!131, !131, i64 0}
!131 = !{!"0x1986d100", !19, i64 0}
!132 = !DILocalVariable(name: "k", scope: !116, file: !1, type: !8)
!133 = !{!134, !134, i64 0}
!134 = !{!"0x19892090", !19, i64 0}
!135 = !{!136, !136, i64 0}
!136 = !{!"0x1970d8d0", !19, i64 0}
!137 = !{!"branch_weights", i32 127, i32 134217601}
!138 = !{!"branch_weights", i32 1, i32 127}
!139 = !{!"branch_weights", i32 127, i32 33554289}
!140 = distinct !{!140, !141}
!141 = !{!"llvm.loop.peeled.count", i32 1}
!142 = !{!"branch_weights", i32 3, i32 1}
!143 = !{!"branch_weights", i32 1, i32 1}
!144 = distinct !{!144, !145}
!145 = !{!"llvm.loop.unroll.disable"}
