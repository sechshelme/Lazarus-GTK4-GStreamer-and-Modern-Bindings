unit ast_type;

interface

uses
  fp_isl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pisl_ast_expr = type Pointer;
  Pisl_ast_node = type Pointer;

type
  Tisl_ast_expr_op_type = longint;
const
  isl_ast_expr_op_error = -(1);
  isl_ast_expr_op_and = (-(1)) + 1;
  isl_ast_expr_op_and_then = (-(1)) + 2;
  isl_ast_expr_op_or = (-(1)) + 3;
  isl_ast_expr_op_or_else = (-(1)) + 4;
  isl_ast_expr_op_max = (-(1)) + 5;
  isl_ast_expr_op_min = (-(1)) + 6;
  isl_ast_expr_op_minus = (-(1)) + 7;
  isl_ast_expr_op_add = (-(1)) + 8;
  isl_ast_expr_op_sub = (-(1)) + 9;
  isl_ast_expr_op_mul = (-(1)) + 10;
  isl_ast_expr_op_div = (-(1)) + 11;
  isl_ast_expr_op_fdiv_q = (-(1)) + 12;
  isl_ast_expr_op_pdiv_q = (-(1)) + 13;
  isl_ast_expr_op_pdiv_r = (-(1)) + 14;
  isl_ast_expr_op_zdiv_r = (-(1)) + 15;
  isl_ast_expr_op_cond = (-(1)) + 16;
  isl_ast_expr_op_select = (-(1)) + 17;
  isl_ast_expr_op_eq = (-(1)) + 18;
  isl_ast_expr_op_le = (-(1)) + 19;
  isl_ast_expr_op_lt = (-(1)) + 20;
  isl_ast_expr_op_ge = (-(1)) + 21;
  isl_ast_expr_op_gt = (-(1)) + 22;
  isl_ast_expr_op_call = (-(1)) + 23;
  isl_ast_expr_op_access = (-(1)) + 24;
  isl_ast_expr_op_member = (-(1)) + 25;
  isl_ast_expr_op_address_of = (-(1)) + 26;

type
  Tisl_ast_op_type = Tisl_ast_expr_op_type;

const
  isl_ast_op_error = isl_ast_expr_op_error;
  isl_ast_op_and = isl_ast_expr_op_and;
  isl_ast_op_and_then = isl_ast_expr_op_and_then;
  isl_ast_op_or = isl_ast_expr_op_or;
  isl_ast_op_or_else = isl_ast_expr_op_or_else;
  isl_ast_op_max = isl_ast_expr_op_max;
  isl_ast_op_min = isl_ast_expr_op_min;
  isl_ast_op_minus = isl_ast_expr_op_minus;
  isl_ast_op_add = isl_ast_expr_op_add;
  isl_ast_op_sub = isl_ast_expr_op_sub;
  isl_ast_op_mul = isl_ast_expr_op_mul;
  isl_ast_op_div = isl_ast_expr_op_div;
  isl_ast_op_fdiv_q = isl_ast_expr_op_fdiv_q;
  isl_ast_op_pdiv_q = isl_ast_expr_op_pdiv_q;
  isl_ast_op_pdiv_r = isl_ast_expr_op_pdiv_r;
  isl_ast_op_zdiv_r = isl_ast_expr_op_zdiv_r;
  isl_ast_op_cond = isl_ast_expr_op_cond;
  isl_ast_op_select = isl_ast_expr_op_select;
  isl_ast_op_eq = isl_ast_expr_op_eq;
  isl_ast_op_le = isl_ast_expr_op_le;
  isl_ast_op_lt = isl_ast_expr_op_lt;
  isl_ast_op_ge = isl_ast_expr_op_ge;
  isl_ast_op_gt = isl_ast_expr_op_gt;
  isl_ast_op_call = isl_ast_expr_op_call;
  isl_ast_op_access = isl_ast_expr_op_access;
  isl_ast_op_member = isl_ast_expr_op_member;
  isl_ast_op_address_of = isl_ast_expr_op_address_of;

type
  Tisl_ast_expr_type = longint;
const
  isl_ast_expr_error = -(1);
  isl_ast_expr_op = (-(1)) + 1;
  isl_ast_expr_id = (-(1)) + 2;
  isl_ast_expr_int = (-(1)) + 3;

type
  Tisl_ast_node_type = longint;
const
  isl_ast_node_error = -(1);
  isl_ast_node_for = 1;
  isl_ast_node_if = 2;
  isl_ast_node_block = 3;
  isl_ast_node_mark = 4;
  isl_ast_node_user = 5;

type
  Tisl_ast_loop_type = longint;
const
  isl_ast_loop_error = -(1);
  isl_ast_loop_default = 0;
  isl_ast_loop_atomic = 1;
  isl_ast_loop_unroll = 2;
  isl_ast_loop_separate = 3;

type
  Pisl_ast_print_options = type Pointer;
  Pisl_ast_expr_list = type Pointer;
  Pisl_ast_node_list = type Pointer;

  // === Konventiert am: 4-11-26 19:46:31 ===


implementation



end.
