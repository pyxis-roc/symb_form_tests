from z3 import *

smtlib_str = """
(let ((a!1 (ite (= (ite (bvsgt val_M_10 #x00000000) #b1 #b0) #b1)
                (ite (bvsgt val_N_11 #x00000000) #b1 #b0)
                #b0)))
  (bvmul (bvadd #xffffffffffffffff
                ((_ zero_extend 32) val_M_9)
                #x0000000000000001)
         ((_ zero_extend 63) a!1)
         #x0000000000000001))
"""
val_M_9 = BitVec('val_M_9', 32)
val_M_10 = BitVec('val_M_10', 32)
val_N_11 = BitVec('val_N_11', 32)

expr = parse_smt2_string(smtlib_str)
print(expr)