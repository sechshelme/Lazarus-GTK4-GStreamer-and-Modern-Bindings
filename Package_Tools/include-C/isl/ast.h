#ifndef ISL_AST_H
#define ISL_AST_H

#include <isl/ctx.h>
#include <isl/ast_type.h>
#include <isl/id_type.h>
#include <isl/id_to_ast_expr.h>
#include <isl/val_type.h>
#include <isl/list.h>
#include <isl/printer.h>

#if defined(__cplusplus)

#endif

isl_stat isl_options_set_ast_iterator_type(isl_ctx *ctx, const char *val);
const char *isl_options_get_ast_iterator_type(isl_ctx *ctx);

isl_stat isl_options_set_ast_always_print_block(isl_ctx *ctx, int val);
int isl_options_get_ast_always_print_block(isl_ctx *ctx);

isl_stat isl_options_set_ast_print_outermost_block(isl_ctx *ctx, int val);
int isl_options_get_ast_print_outermost_block(isl_ctx *ctx);

 isl_ast_expr *isl_ast_expr_from_val( isl_val *v);
 isl_ast_expr *isl_ast_expr_from_id( isl_id *id);
 isl_ast_expr *isl_ast_expr_neg( isl_ast_expr *expr);
 isl_ast_expr *isl_ast_expr_add( isl_ast_expr *expr1,
	 isl_ast_expr *expr2);
 isl_ast_expr *isl_ast_expr_sub( isl_ast_expr *expr1,
	 isl_ast_expr *expr2);
 isl_ast_expr *isl_ast_expr_mul( isl_ast_expr *expr1,
	 isl_ast_expr *expr2);
 isl_ast_expr *isl_ast_expr_div( isl_ast_expr *expr1,
	 isl_ast_expr *expr2);
 isl_ast_expr *isl_ast_expr_pdiv_q( isl_ast_expr *expr1,
	 isl_ast_expr *expr2);
 isl_ast_expr *isl_ast_expr_pdiv_r( isl_ast_expr *expr1,
	 isl_ast_expr *expr2);
 isl_ast_expr *isl_ast_expr_and( isl_ast_expr *expr1,
	 isl_ast_expr *expr2);
 isl_ast_expr *isl_ast_expr_and_then( isl_ast_expr *expr1,
	 isl_ast_expr *expr2);
 isl_ast_expr *isl_ast_expr_or( isl_ast_expr *expr1,
	 isl_ast_expr *expr2);
 isl_ast_expr *isl_ast_expr_or_else( isl_ast_expr *expr1,
	 isl_ast_expr *expr2);
 isl_ast_expr *isl_ast_expr_le( isl_ast_expr *expr1,
	 isl_ast_expr *expr2);
 isl_ast_expr *isl_ast_expr_lt( isl_ast_expr *expr1,
	 isl_ast_expr *expr2);
 isl_ast_expr *isl_ast_expr_ge( isl_ast_expr *expr1,
	 isl_ast_expr *expr2);
 isl_ast_expr *isl_ast_expr_gt( isl_ast_expr *expr1,
	 isl_ast_expr *expr2);
 isl_ast_expr *isl_ast_expr_eq( isl_ast_expr *expr1,
	 isl_ast_expr *expr2);
 isl_ast_expr *isl_ast_expr_access( isl_ast_expr *array,
	 isl_ast_expr_list *indices);
 isl_ast_expr *isl_ast_expr_call( isl_ast_expr *function,
	 isl_ast_expr_list *arguments);
 isl_ast_expr *isl_ast_expr_address_of( isl_ast_expr *expr);

 isl_ast_expr *isl_ast_expr_copy( isl_ast_expr *expr);
 isl_ast_expr *isl_ast_expr_free( isl_ast_expr *expr);

isl_ctx *isl_ast_expr_get_ctx( isl_ast_expr *expr);
__isl_subclass(isl_ast_expr)
enum isl_ast_expr_type isl_ast_expr_get_type( isl_ast_expr *expr);
extern
 isl_val *isl_ast_expr_int_get_val( isl_ast_expr *expr);
 isl_val *isl_ast_expr_get_val( isl_ast_expr *expr);
extern
 isl_id *isl_ast_expr_id_get_id( isl_ast_expr *expr);
 isl_id *isl_ast_expr_get_id( isl_ast_expr *expr);

__isl_subclass(isl_ast_expr_op)
enum isl_ast_expr_op_type isl_ast_expr_op_get_type(
	 isl_ast_expr *expr);
enum isl_ast_expr_op_type isl_ast_expr_get_op_type(
	 isl_ast_expr *expr);
extern
isl_size isl_ast_expr_op_get_n_arg( isl_ast_expr *expr);
isl_size isl_ast_expr_get_op_n_arg( isl_ast_expr *expr);
extern
 isl_ast_expr *isl_ast_expr_op_get_arg( isl_ast_expr *expr,
	int pos);
 isl_ast_expr *isl_ast_expr_get_op_arg( isl_ast_expr *expr,
	int pos);
 isl_ast_expr *isl_ast_expr_set_op_arg( isl_ast_expr *expr,
	int pos,  isl_ast_expr *arg);

isl_bool isl_ast_expr_is_equal( isl_ast_expr *expr1,
	 isl_ast_expr *expr2);

 isl_ast_expr *isl_ast_expr_substitute_ids(
	 isl_ast_expr *expr,  isl_id_to_ast_expr *id2expr);

 isl_printer *isl_printer_print_ast_expr( isl_printer *p,
	 isl_ast_expr *expr);
void isl_ast_expr_dump( isl_ast_expr *expr);
 char *isl_ast_expr_to_str( isl_ast_expr *expr);
extern
 char *isl_ast_expr_to_C_str( isl_ast_expr *expr);


 isl_ast_node *isl_ast_node_user_from_expr(
	 isl_ast_expr *expr);
 isl_ast_node *isl_ast_node_alloc_user( isl_ast_expr *expr);
 isl_ast_node *isl_ast_node_copy( isl_ast_node *node);
 isl_ast_node *isl_ast_node_free( isl_ast_node *node);

isl_ctx *isl_ast_node_get_ctx( isl_ast_node *node);
__isl_subclass(isl_ast_node)
enum isl_ast_node_type isl_ast_node_get_type( isl_ast_node *node);

 isl_ast_node *isl_ast_node_set_annotation(
	 isl_ast_node *node,  isl_id *annotation);
 isl_id *isl_ast_node_get_annotation( isl_ast_node *node);

extern
 isl_ast_expr *isl_ast_node_for_get_iterator(
	 isl_ast_node *node);
extern
 isl_ast_expr *isl_ast_node_for_get_init(
	 isl_ast_node *node);
extern
 isl_ast_expr *isl_ast_node_for_get_cond(
	 isl_ast_node *node);
extern
 isl_ast_expr *isl_ast_node_for_get_inc(
	 isl_ast_node *node);
extern
 isl_ast_node *isl_ast_node_for_get_body(
	 isl_ast_node *node);
extern
isl_bool isl_ast_node_for_is_degenerate( isl_ast_node *node);

extern
 isl_ast_expr *isl_ast_node_if_get_cond(
	 isl_ast_node *node);
extern
 isl_ast_node *isl_ast_node_if_get_then_node(
	 isl_ast_node *node);
 isl_ast_node *isl_ast_node_if_get_then(
	 isl_ast_node *node);
extern
isl_bool isl_ast_node_if_has_else_node( isl_ast_node *node);
isl_bool isl_ast_node_if_has_else( isl_ast_node *node);
extern
 isl_ast_node *isl_ast_node_if_get_else_node(
	 isl_ast_node *node);
 isl_ast_node *isl_ast_node_if_get_else(
	 isl_ast_node *node);


 isl_ast_node *isl_ast_node_block_from_children(
	 isl_ast_node_list *list);
extern
 isl_ast_node_list *isl_ast_node_block_get_children(
	 isl_ast_node *node);

extern
 isl_id *isl_ast_node_mark_get_id( isl_ast_node *node);
extern
 isl_ast_node *isl_ast_node_mark_get_node(
	 isl_ast_node *node);

extern
 isl_ast_expr *isl_ast_node_user_get_expr(
	 isl_ast_node *node);

isl_stat isl_ast_node_foreach_descendant_top_down(
	 isl_ast_node *node,
	isl_bool (*fn)( isl_ast_node *node, void *user), void *user);
extern
 isl_ast_node *isl_ast_node_map_descendant_bottom_up(
	 isl_ast_node *node,  isl_ast_node *(*fn)(
		 isl_ast_node *node, void *user), void *user);

 isl_printer *isl_printer_print_ast_node( isl_printer *p,
	 isl_ast_node *node);
void isl_ast_node_dump( isl_ast_node *node);
 char *isl_ast_node_to_str( isl_ast_node *node);

 isl_ast_print_options *isl_ast_print_options_alloc(isl_ctx *ctx);
 isl_ast_print_options *isl_ast_print_options_copy(
	 isl_ast_print_options *options);
 isl_ast_print_options *isl_ast_print_options_free(
	 isl_ast_print_options *options);
isl_ctx *isl_ast_print_options_get_ctx(
	 isl_ast_print_options *options);

 isl_ast_print_options *isl_ast_print_options_set_print_user(
	 isl_ast_print_options *options,
	 isl_printer *(*print_user)( isl_printer *p,
		 isl_ast_print_options *options,
		 isl_ast_node *node, void *user),
	void *user);
 isl_ast_print_options *isl_ast_print_options_set_print_for(
	 isl_ast_print_options *options,
	 isl_printer *(*print_for)( isl_printer *p,
		 isl_ast_print_options *options,
		 isl_ast_node *node, void *user),
	void *user);

isl_stat isl_options_set_ast_print_macro_once(isl_ctx *ctx, int val);
int isl_options_get_ast_print_macro_once(isl_ctx *ctx);

isl_stat isl_ast_expr_foreach_ast_expr_op_type( isl_ast_expr *expr,
	isl_stat (*fn)(enum isl_ast_expr_op_type type, void *user), void *user);
isl_stat isl_ast_expr_foreach_ast_op_type( isl_ast_expr *expr,
	isl_stat (*fn)(enum isl_ast_expr_op_type type, void *user), void *user);
isl_stat isl_ast_node_foreach_ast_expr_op_type( isl_ast_node *node,
	isl_stat (*fn)(enum isl_ast_expr_op_type type, void *user), void *user);
isl_stat isl_ast_node_foreach_ast_op_type( isl_ast_node *node,
	isl_stat (*fn)(enum isl_ast_expr_op_type type, void *user), void *user);
 isl_printer *isl_ast_expr_op_type_set_print_name(
	 isl_printer *p, enum isl_ast_expr_op_type type,
	 const char *name);
 isl_printer *isl_ast_op_type_set_print_name(
	 isl_printer *p, enum isl_ast_expr_op_type type,
	 const char *name);
 isl_printer *isl_ast_expr_op_type_print_macro(
	enum isl_ast_expr_op_type type,  isl_printer *p);
 isl_printer *isl_ast_op_type_print_macro(
	enum isl_ast_expr_op_type type,  isl_printer *p);
 isl_printer *isl_ast_expr_print_macros(
	 isl_ast_expr *expr,  isl_printer *p);
 isl_printer *isl_ast_node_print_macros(
	 isl_ast_node *node,  isl_printer *p);
 isl_printer *isl_ast_node_print( isl_ast_node *node,
	 isl_printer *p,
	 isl_ast_print_options *options);
 isl_printer *isl_ast_node_for_print( isl_ast_node *node,
	 isl_printer *p,
	 isl_ast_print_options *options);
 isl_printer *isl_ast_node_if_print( isl_ast_node *node,
	 isl_printer *p,
	 isl_ast_print_options *options);

extern
 char *isl_ast_node_to_C_str( isl_ast_node *node);

ISL_DECLARE_LIST_FN(ast_expr)
ISL_DECLARE_EXPORTED_LIST_FN(ast_node)

#if defined(__cplusplus)
}
#endif

#endif
