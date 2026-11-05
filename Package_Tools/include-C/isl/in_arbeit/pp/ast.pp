
unit ast;
interface

{
  Automatically converted by H2Pas 1.0.0 from ast.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ast.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
Pisl_ast_expr  = ^isl_ast_expr;
Pisl_ast_expr_list  = ^isl_ast_expr_list;
Pisl_ast_node  = ^isl_ast_node;
Pisl_ast_node_list  = ^isl_ast_node_list;
Pisl_ast_print_options  = ^isl_ast_print_options;
Pisl_ctx  = ^isl_ctx;
Pisl_id  = ^isl_id;
Pisl_id_to_ast_expr  = ^isl_id_to_ast_expr;
Pisl_printer  = ^isl_printer;
Pisl_val  = ^isl_val;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ISL_AST_H}
{$define ISL_AST_H}
{$include <isl/ctx.h>}
{$include <isl/ast_type.h>}
{$include <isl/id_type.h>}
{$include <isl/id_to_ast_expr.h>}
{$include <isl/val_type.h>}
{$include <isl/list.h>}
{$include <isl/printer.h>}
{$if defined(__cplusplus)}
{$endif}
(* Const before type ignored *)

function isl_options_set_ast_iterator_type(ctx:Pisl_ctx; val:Pchar):Tisl_stat;cdecl;external;
(* Const before type ignored *)
function isl_options_get_ast_iterator_type(ctx:Pisl_ctx):Pchar;cdecl;external;
function isl_options_set_ast_always_print_block(ctx:Pisl_ctx; val:longint):Tisl_stat;cdecl;external;
function isl_options_get_ast_always_print_block(ctx:Pisl_ctx):longint;cdecl;external;
function isl_options_set_ast_print_outermost_block(ctx:Pisl_ctx; val:longint):Tisl_stat;cdecl;external;
function isl_options_get_ast_print_outermost_block(ctx:Pisl_ctx):longint;cdecl;external;
function isl_ast_expr_from_val(v:Pisl_val):Pisl_ast_expr;cdecl;external;
function isl_ast_expr_from_id(id:Pisl_id):Pisl_ast_expr;cdecl;external;
function isl_ast_expr_neg(expr:Pisl_ast_expr):Pisl_ast_expr;cdecl;external;
function isl_ast_expr_add(expr1:Pisl_ast_expr; expr2:Pisl_ast_expr):Pisl_ast_expr;cdecl;external;
function isl_ast_expr_sub(expr1:Pisl_ast_expr; expr2:Pisl_ast_expr):Pisl_ast_expr;cdecl;external;
function isl_ast_expr_mul(expr1:Pisl_ast_expr; expr2:Pisl_ast_expr):Pisl_ast_expr;cdecl;external;
function isl_ast_expr_div(expr1:Pisl_ast_expr; expr2:Pisl_ast_expr):Pisl_ast_expr;cdecl;external;
function isl_ast_expr_pdiv_q(expr1:Pisl_ast_expr; expr2:Pisl_ast_expr):Pisl_ast_expr;cdecl;external;
function isl_ast_expr_pdiv_r(expr1:Pisl_ast_expr; expr2:Pisl_ast_expr):Pisl_ast_expr;cdecl;external;
function isl_ast_expr_and(expr1:Pisl_ast_expr; expr2:Pisl_ast_expr):Pisl_ast_expr;cdecl;external;
function isl_ast_expr_and_then(expr1:Pisl_ast_expr; expr2:Pisl_ast_expr):Pisl_ast_expr;cdecl;external;
function isl_ast_expr_or(expr1:Pisl_ast_expr; expr2:Pisl_ast_expr):Pisl_ast_expr;cdecl;external;
function isl_ast_expr_or_else(expr1:Pisl_ast_expr; expr2:Pisl_ast_expr):Pisl_ast_expr;cdecl;external;
function isl_ast_expr_le(expr1:Pisl_ast_expr; expr2:Pisl_ast_expr):Pisl_ast_expr;cdecl;external;
function isl_ast_expr_lt(expr1:Pisl_ast_expr; expr2:Pisl_ast_expr):Pisl_ast_expr;cdecl;external;
function isl_ast_expr_ge(expr1:Pisl_ast_expr; expr2:Pisl_ast_expr):Pisl_ast_expr;cdecl;external;
function isl_ast_expr_gt(expr1:Pisl_ast_expr; expr2:Pisl_ast_expr):Pisl_ast_expr;cdecl;external;
function isl_ast_expr_eq(expr1:Pisl_ast_expr; expr2:Pisl_ast_expr):Pisl_ast_expr;cdecl;external;
function isl_ast_expr_access(array:Pisl_ast_expr; indices:Pisl_ast_expr_list):Pisl_ast_expr;cdecl;external;
function isl_ast_expr_call(_function:Pisl_ast_expr; arguments:Pisl_ast_expr_list):Pisl_ast_expr;cdecl;external;
function isl_ast_expr_address_of(expr:Pisl_ast_expr):Pisl_ast_expr;cdecl;external;
function isl_ast_expr_copy(expr:Pisl_ast_expr):Pisl_ast_expr;cdecl;external;
function isl_ast_expr_free(expr:Pisl_ast_expr):Pisl_ast_expr;cdecl;external;
function isl_ast_expr_get_ctx(expr:Pisl_ast_expr):Pisl_ctx;cdecl;external;
function isl_ast_expr_get_type(expr:Pisl_ast_expr):Tisl_ast_expr_type;cdecl;external;
function isl_ast_expr_int_get_val(expr:Pisl_ast_expr):Pisl_val;cdecl;external;
function isl_ast_expr_get_val(expr:Pisl_ast_expr):Pisl_val;cdecl;external;
function isl_ast_expr_id_get_id(expr:Pisl_ast_expr):Pisl_id;cdecl;external;
function isl_ast_expr_get_id(expr:Pisl_ast_expr):Pisl_id;cdecl;external;
function isl_ast_expr_op_get_type(expr:Pisl_ast_expr):Tisl_ast_expr_op_type;cdecl;external;
function isl_ast_expr_get_op_type(expr:Pisl_ast_expr):Tisl_ast_expr_op_type;cdecl;external;
function isl_ast_expr_op_get_n_arg(expr:Pisl_ast_expr):Tisl_size;cdecl;external;
function isl_ast_expr_get_op_n_arg(expr:Pisl_ast_expr):Tisl_size;cdecl;external;
function isl_ast_expr_op_get_arg(expr:Pisl_ast_expr; pos:longint):Pisl_ast_expr;cdecl;external;
function isl_ast_expr_get_op_arg(expr:Pisl_ast_expr; pos:longint):Pisl_ast_expr;cdecl;external;
function isl_ast_expr_set_op_arg(expr:Pisl_ast_expr; pos:longint; arg:Pisl_ast_expr):Pisl_ast_expr;cdecl;external;
function isl_ast_expr_is_equal(expr1:Pisl_ast_expr; expr2:Pisl_ast_expr):Tisl_bool;cdecl;external;
function isl_ast_expr_substitute_ids(expr:Pisl_ast_expr; id2expr:Pisl_id_to_ast_expr):Pisl_ast_expr;cdecl;external;
function isl_printer_print_ast_expr(p:Pisl_printer; expr:Pisl_ast_expr):Pisl_printer;cdecl;external;
procedure isl_ast_expr_dump(expr:Pisl_ast_expr);cdecl;external;
function isl_ast_expr_to_str(expr:Pisl_ast_expr):Pchar;cdecl;external;
function isl_ast_expr_to_C_str(expr:Pisl_ast_expr):Pchar;cdecl;external;
function isl_ast_node_user_from_expr(expr:Pisl_ast_expr):Pisl_ast_node;cdecl;external;
function isl_ast_node_alloc_user(expr:Pisl_ast_expr):Pisl_ast_node;cdecl;external;
function isl_ast_node_copy(node:Pisl_ast_node):Pisl_ast_node;cdecl;external;
function isl_ast_node_free(node:Pisl_ast_node):Pisl_ast_node;cdecl;external;
function isl_ast_node_get_ctx(node:Pisl_ast_node):Pisl_ctx;cdecl;external;
function isl_ast_node_get_type(node:Pisl_ast_node):Tisl_ast_node_type;cdecl;external;
function isl_ast_node_set_annotation(node:Pisl_ast_node; annotation:Pisl_id):Pisl_ast_node;cdecl;external;
function isl_ast_node_get_annotation(node:Pisl_ast_node):Pisl_id;cdecl;external;
function isl_ast_node_for_get_iterator(node:Pisl_ast_node):Pisl_ast_expr;cdecl;external;
function isl_ast_node_for_get_init(node:Pisl_ast_node):Pisl_ast_expr;cdecl;external;
function isl_ast_node_for_get_cond(node:Pisl_ast_node):Pisl_ast_expr;cdecl;external;
function isl_ast_node_for_get_inc(node:Pisl_ast_node):Pisl_ast_expr;cdecl;external;
function isl_ast_node_for_get_body(node:Pisl_ast_node):Pisl_ast_node;cdecl;external;
function isl_ast_node_for_is_degenerate(node:Pisl_ast_node):Tisl_bool;cdecl;external;
function isl_ast_node_if_get_cond(node:Pisl_ast_node):Pisl_ast_expr;cdecl;external;
function isl_ast_node_if_get_then_node(node:Pisl_ast_node):Pisl_ast_node;cdecl;external;
function isl_ast_node_if_get_then(node:Pisl_ast_node):Pisl_ast_node;cdecl;external;
function isl_ast_node_if_has_else_node(node:Pisl_ast_node):Tisl_bool;cdecl;external;
function isl_ast_node_if_has_else(node:Pisl_ast_node):Tisl_bool;cdecl;external;
function isl_ast_node_if_get_else_node(node:Pisl_ast_node):Pisl_ast_node;cdecl;external;
function isl_ast_node_if_get_else(node:Pisl_ast_node):Pisl_ast_node;cdecl;external;
function isl_ast_node_block_from_children(list:Pisl_ast_node_list):Pisl_ast_node;cdecl;external;
function isl_ast_node_block_get_children(node:Pisl_ast_node):Pisl_ast_node_list;cdecl;external;
function isl_ast_node_mark_get_id(node:Pisl_ast_node):Pisl_id;cdecl;external;
function isl_ast_node_mark_get_node(node:Pisl_ast_node):Pisl_ast_node;cdecl;external;
function isl_ast_node_user_get_expr(node:Pisl_ast_node):Pisl_ast_expr;cdecl;external;
function isl_ast_node_foreach_descendant_top_down(node:Pisl_ast_node; fn:function (node:Pisl_ast_node; user:pointer):Tisl_bool; user:pointer):Tisl_stat;cdecl;external;
function isl_ast_node_map_descendant_bottom_up(node:Pisl_ast_node; fn:function (node:Pisl_ast_node; user:pointer):Pisl_ast_node; user:pointer):Pisl_ast_node;cdecl;external;
function isl_printer_print_ast_node(p:Pisl_printer; node:Pisl_ast_node):Pisl_printer;cdecl;external;
procedure isl_ast_node_dump(node:Pisl_ast_node);cdecl;external;
function isl_ast_node_to_str(node:Pisl_ast_node):Pchar;cdecl;external;
function isl_ast_print_options_alloc(ctx:Pisl_ctx):Pisl_ast_print_options;cdecl;external;
function isl_ast_print_options_copy(options:Pisl_ast_print_options):Pisl_ast_print_options;cdecl;external;
function isl_ast_print_options_free(options:Pisl_ast_print_options):Pisl_ast_print_options;cdecl;external;
function isl_ast_print_options_get_ctx(options:Pisl_ast_print_options):Pisl_ctx;cdecl;external;
function isl_ast_print_options_set_print_user(options:Pisl_ast_print_options; print_user:function (p:Pisl_printer; options:Pisl_ast_print_options; node:Pisl_ast_node; user:pointer):Pisl_printer; user:pointer):Pisl_ast_print_options;cdecl;external;
function isl_ast_print_options_set_print_for(options:Pisl_ast_print_options; print_for:function (p:Pisl_printer; options:Pisl_ast_print_options; node:Pisl_ast_node; user:pointer):Pisl_printer; user:pointer):Pisl_ast_print_options;cdecl;external;
function isl_options_set_ast_print_macro_once(ctx:Pisl_ctx; val:longint):Tisl_stat;cdecl;external;
function isl_options_get_ast_print_macro_once(ctx:Pisl_ctx):longint;cdecl;external;
function isl_ast_expr_foreach_ast_expr_op_type(expr:Pisl_ast_expr; fn:function (_type:Tisl_ast_expr_op_type; user:pointer):Tisl_stat; user:pointer):Tisl_stat;cdecl;external;
function isl_ast_expr_foreach_ast_op_type(expr:Pisl_ast_expr; fn:function (_type:Tisl_ast_expr_op_type; user:pointer):Tisl_stat; user:pointer):Tisl_stat;cdecl;external;
function isl_ast_node_foreach_ast_expr_op_type(node:Pisl_ast_node; fn:function (_type:Tisl_ast_expr_op_type; user:pointer):Tisl_stat; user:pointer):Tisl_stat;cdecl;external;
function isl_ast_node_foreach_ast_op_type(node:Pisl_ast_node; fn:function (_type:Tisl_ast_expr_op_type; user:pointer):Tisl_stat; user:pointer):Tisl_stat;cdecl;external;
(* Const before type ignored *)
function isl_ast_expr_op_type_set_print_name(p:Pisl_printer; _type:Tisl_ast_expr_op_type; name:Pchar):Pisl_printer;cdecl;external;
(* Const before type ignored *)
function isl_ast_op_type_set_print_name(p:Pisl_printer; _type:Tisl_ast_expr_op_type; name:Pchar):Pisl_printer;cdecl;external;
function isl_ast_expr_op_type_print_macro(_type:Tisl_ast_expr_op_type; p:Pisl_printer):Pisl_printer;cdecl;external;
function isl_ast_op_type_print_macro(_type:Tisl_ast_expr_op_type; p:Pisl_printer):Pisl_printer;cdecl;external;
function isl_ast_expr_print_macros(expr:Pisl_ast_expr; p:Pisl_printer):Pisl_printer;cdecl;external;
function isl_ast_node_print_macros(node:Pisl_ast_node; p:Pisl_printer):Pisl_printer;cdecl;external;
function isl_ast_node_print(node:Pisl_ast_node; p:Pisl_printer; options:Pisl_ast_print_options):Pisl_printer;cdecl;external;
function isl_ast_node_for_print(node:Pisl_ast_node; p:Pisl_printer; options:Pisl_ast_print_options):Pisl_printer;cdecl;external;
function isl_ast_node_if_print(node:Pisl_ast_node; p:Pisl_printer; options:Pisl_ast_print_options):Pisl_printer;cdecl;external;
function isl_ast_node_to_C_str(node:Pisl_ast_node):Pchar;cdecl;external;
function isl_ast_expr_list_get_ctx(list:Pisl_ast_expr_list):Pisl_ctx;cdecl;external;
function isl_ast_expr_to_list(el:Pisl_ast_expr):Pisl_ast_expr_list;cdecl;external;
function isl_ast_expr_list_from_ast_expr(el:Pisl_ast_expr):Pisl_ast_expr_list;cdecl;external;
function isl_ast_expr_list_alloc(ctx:Pisl_ctx; n:longint):Pisl_ast_expr_list;cdecl;external;
function isl_ast_expr_list_copy(list:Pisl_ast_expr_list):Pisl_ast_expr_list;cdecl;external;
function isl_ast_expr_list_free(list:Pisl_ast_expr_list):Pisl_ast_expr_list;cdecl;external;
function isl_ast_expr_list_add(list:Pisl_ast_expr_list; el:Pisl_ast_expr):Pisl_ast_expr_list;cdecl;external;
function isl_ast_expr_list_insert(list:Pisl_ast_expr_list; pos:dword; el:Pisl_ast_expr):Pisl_ast_expr_list;cdecl;external;
function isl_ast_expr_list_drop(list:Pisl_ast_expr_list; first:dword; n:dword):Pisl_ast_expr_list;cdecl;external;
function isl_ast_expr_list_clear(list:Pisl_ast_expr_list):Pisl_ast_expr_list;cdecl;external;
function isl_ast_expr_list_swap(list:Pisl_ast_expr_list; pos1:dword; pos2:dword):Pisl_ast_expr_list;cdecl;external;
function isl_ast_expr_list_reverse(list:Pisl_ast_expr_list):Pisl_ast_expr_list;cdecl;external;
function isl_ast_expr_list_concat(list1:Pisl_ast_expr_list; list2:Pisl_ast_expr_list):Pisl_ast_expr_list;cdecl;external;
function isl_ast_expr_list_size(list:Pisl_ast_expr_list):Tisl_size;cdecl;external;
function isl_ast_expr_list_n_ast_expr(list:Pisl_ast_expr_list):Tisl_size;cdecl;external;
function isl_ast_expr_list_get_at(list:Pisl_ast_expr_list; index:longint):Pisl_ast_expr;cdecl;external;
function isl_ast_expr_list_get_ast_expr(list:Pisl_ast_expr_list; index:longint):Pisl_ast_expr;cdecl;external;
function isl_ast_expr_list_set_at(list:Pisl_ast_expr_list; index:longint; el:Pisl_ast_expr):Pisl_ast_expr_list;cdecl;external;
function isl_ast_expr_list_set_ast_expr(list:Pisl_ast_expr_list; index:longint; el:Pisl_ast_expr):Pisl_ast_expr_list;cdecl;external;
function isl_ast_expr_list_foreach(list:Pisl_ast_expr_list; fn:function (el:Pisl_ast_expr; user:pointer):Tisl_stat; user:pointer):Tisl_stat;cdecl;external;
function isl_ast_expr_list_every(list:Pisl_ast_expr_list; test:function (el:Pisl_ast_expr; user:pointer):Tisl_bool; user:pointer):Tisl_bool;cdecl;external;
function isl_ast_expr_list_map(list:Pisl_ast_expr_list; fn:function (el:Pisl_ast_expr; user:pointer):Pisl_ast_expr; user:pointer):Pisl_ast_expr_list;cdecl;external;
function isl_ast_expr_list_sort(list:Pisl_ast_expr_list; cmp:function (a:Pisl_ast_expr; b:Pisl_ast_expr; user:pointer):longint; user:pointer):Pisl_ast_expr_list;cdecl;external;
function isl_ast_expr_list_foreach_scc(list:Pisl_ast_expr_list; follows:function (a:Pisl_ast_expr; b:Pisl_ast_expr; user:pointer):Tisl_bool; follows_user:pointer; fn:function (scc:Pisl_ast_expr_list; user:pointer):Tisl_stat; fn_user:pointer):Tisl_stat;cdecl;external;
function isl_ast_expr_list_to_str(list:Pisl_ast_expr_list):Pchar;cdecl;external;
function isl_printer_print_ast_expr_list(p:Pisl_printer; list:Pisl_ast_expr_list):Pisl_printer;cdecl;external;
procedure isl_ast_expr_list_dump(list:Pisl_ast_expr_list);cdecl;external;
function isl_ast_node_list_get_ctx(list:Pisl_ast_node_list):Pisl_ctx;cdecl;external;
function isl_ast_node_to_list(el:Pisl_ast_node):Pisl_ast_node_list;cdecl;external;
function isl_ast_node_list_from_ast_node(el:Pisl_ast_node):Pisl_ast_node_list;cdecl;external;
function isl_ast_node_list_alloc(ctx:Pisl_ctx; n:longint):Pisl_ast_node_list;cdecl;external;
function isl_ast_node_list_copy(list:Pisl_ast_node_list):Pisl_ast_node_list;cdecl;external;
function isl_ast_node_list_free(list:Pisl_ast_node_list):Pisl_ast_node_list;cdecl;external;
function isl_ast_node_list_add(list:Pisl_ast_node_list; el:Pisl_ast_node):Pisl_ast_node_list;cdecl;external;
function isl_ast_node_list_insert(list:Pisl_ast_node_list; pos:dword; el:Pisl_ast_node):Pisl_ast_node_list;cdecl;external;
function isl_ast_node_list_drop(list:Pisl_ast_node_list; first:dword; n:dword):Pisl_ast_node_list;cdecl;external;
function isl_ast_node_list_clear(list:Pisl_ast_node_list):Pisl_ast_node_list;cdecl;external;
function isl_ast_node_list_swap(list:Pisl_ast_node_list; pos1:dword; pos2:dword):Pisl_ast_node_list;cdecl;external;
function isl_ast_node_list_reverse(list:Pisl_ast_node_list):Pisl_ast_node_list;cdecl;external;
function isl_ast_node_list_concat(list1:Pisl_ast_node_list; list2:Pisl_ast_node_list):Pisl_ast_node_list;cdecl;external;
function isl_ast_node_list_size(list:Pisl_ast_node_list):Tisl_size;cdecl;external;
function isl_ast_node_list_n_ast_node(list:Pisl_ast_node_list):Tisl_size;cdecl;external;
function isl_ast_node_list_get_at(list:Pisl_ast_node_list; index:longint):Pisl_ast_node;cdecl;external;
function isl_ast_node_list_get_ast_node(list:Pisl_ast_node_list; index:longint):Pisl_ast_node;cdecl;external;
function isl_ast_node_list_set_at(list:Pisl_ast_node_list; index:longint; el:Pisl_ast_node):Pisl_ast_node_list;cdecl;external;
function isl_ast_node_list_set_ast_node(list:Pisl_ast_node_list; index:longint; el:Pisl_ast_node):Pisl_ast_node_list;cdecl;external;
function isl_ast_node_list_foreach(list:Pisl_ast_node_list; fn:function (el:Pisl_ast_node; user:pointer):Tisl_stat; user:pointer):Tisl_stat;cdecl;external;
function isl_ast_node_list_every(list:Pisl_ast_node_list; test:function (el:Pisl_ast_node; user:pointer):Tisl_bool; user:pointer):Tisl_bool;cdecl;external;
function isl_ast_node_list_map(list:Pisl_ast_node_list; fn:function (el:Pisl_ast_node; user:pointer):Pisl_ast_node; user:pointer):Pisl_ast_node_list;cdecl;external;
function isl_ast_node_list_sort(list:Pisl_ast_node_list; cmp:function (a:Pisl_ast_node; b:Pisl_ast_node; user:pointer):longint; user:pointer):Pisl_ast_node_list;cdecl;external;
function isl_ast_node_list_foreach_scc(list:Pisl_ast_node_list; follows:function (a:Pisl_ast_node; b:Pisl_ast_node; user:pointer):Tisl_bool; follows_user:pointer; fn:function (scc:Pisl_ast_node_list; user:pointer):Tisl_stat; fn_user:pointer):Tisl_stat;cdecl;external;
function isl_ast_node_list_to_str(list:Pisl_ast_node_list):Pchar;cdecl;external;
function isl_printer_print_ast_node_list(p:Pisl_printer; list:Pisl_ast_node_list):Pisl_printer;cdecl;external;
procedure isl_ast_node_list_dump(list:Pisl_ast_node_list);cdecl;external;
{$endif}

implementation


end.
