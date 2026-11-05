/*
 * Copyright 2008-2009 Katholieke Universiteit Leuven
 *
 * Use of this software is governed by the MIT license
 *
 * Written by Sven Verdoolaege, K.U.Leuven, Departement
 * Computerwetenschappen, Celestijnenlaan 200A, B-3001 Leuven, Belgium
 */

#ifndef ISL_SPACE_H
#define ISL_SPACE_H

#include <isl/ctx.h>
#include <isl/space_type.h>
#include <isl/id_type.h>
#include <isl/printer.h>

#if defined(__cplusplus)

#endif

isl_ctx *isl_space_get_ctx( isl_space *space);
extern
 isl_space *isl_space_unit(isl_ctx *ctx);
 isl_space *isl_space_alloc(isl_ctx *ctx,
			unsigned nparam, unsigned n_in, unsigned n_out);
 isl_space *isl_space_set_alloc(isl_ctx *ctx,
			unsigned nparam, unsigned dim);
 isl_space *isl_space_params_alloc(isl_ctx *ctx, unsigned nparam);
 isl_space *isl_space_copy( isl_space *space);
 isl_space *isl_space_free( isl_space *space);

isl_bool isl_space_is_params( isl_space *space);
isl_bool isl_space_is_set( isl_space *space);
isl_bool isl_space_is_map( isl_space *space);


 isl_space *isl_space_add_param_id( isl_space *space,
	 isl_id *id);

 isl_space *isl_space_set_tuple_name( isl_space *space,
	enum isl_dim_type type, const char *s);
isl_bool isl_space_has_tuple_name( isl_space *space,
	enum isl_dim_type type);
 const char *isl_space_get_tuple_name( isl_space *space,
				 enum isl_dim_type type);

 isl_space *isl_space_set_domain_tuple_id(
	 isl_space *space,  isl_id *id);

 isl_space *isl_space_set_range_tuple_id(
	 isl_space *space,  isl_id *id);
 isl_space *isl_space_set_tuple_id( isl_space *space,
	enum isl_dim_type type,  isl_id *id);
 isl_space *isl_space_reset_tuple_id( isl_space *space,
	enum isl_dim_type type);
extern
isl_bool isl_space_has_domain_tuple_id( isl_space *space);
extern
isl_bool isl_space_has_range_tuple_id( isl_space *space);
isl_bool isl_space_has_tuple_id( isl_space *space,
	enum isl_dim_type type);
extern
 isl_id *isl_space_get_domain_tuple_id(
	 isl_space *space);
extern
 isl_id *isl_space_get_range_tuple_id(
	 isl_space *space);
 isl_id *isl_space_get_tuple_id( isl_space *space,
	enum isl_dim_type type);
 isl_space *isl_space_reset_user( isl_space *space);

 isl_space *isl_space_set_dim_id( isl_space *space,
	enum isl_dim_type type, unsigned pos,  isl_id *id);
isl_bool isl_space_has_dim_id( isl_space *space,
	enum isl_dim_type type, unsigned pos);
 isl_id *isl_space_get_dim_id( isl_space *space,
	enum isl_dim_type type, unsigned pos);

int isl_space_find_dim_by_id( isl_space *space,
	enum isl_dim_type type,  isl_id *id);
int isl_space_find_dim_by_name( isl_space *space,
	enum isl_dim_type type, const char *name);

isl_bool isl_space_has_dim_name( isl_space *space,
	enum isl_dim_type type, unsigned pos);
 isl_space *isl_space_set_dim_name( isl_space *space,
				 enum isl_dim_type type, unsigned pos,
				  const char *name);
 const char *isl_space_get_dim_name( isl_space *space,
				 enum isl_dim_type type, unsigned pos);

// xxxxxxxx ISL_DEPRECATED
 isl_space *isl_space_extend( isl_space *space,
			unsigned nparam, unsigned n_in, unsigned n_out);
 isl_space *isl_space_add_dims( isl_space *space,
	enum isl_dim_type type, unsigned n);
 isl_space *isl_space_move_dims( isl_space *space,
	enum isl_dim_type dst_type, unsigned dst_pos,
	enum isl_dim_type src_type, unsigned src_pos, unsigned n);
 isl_space *isl_space_insert_dims( isl_space *space,
	enum isl_dim_type type, unsigned pos, unsigned n);
 isl_space *isl_space_join( isl_space *left,
	 isl_space *right);
extern
 isl_space *isl_space_product( isl_space *left,
	 isl_space *right);
 isl_space *isl_space_domain_product( isl_space *left,
	 isl_space *right);
 isl_space *isl_space_range_product( isl_space *left,
	 isl_space *right);
 isl_space *isl_space_factor_domain( isl_space *space);
 isl_space *isl_space_factor_range( isl_space *space);
 isl_space *isl_space_domain_factor_domain(
	 isl_space *space);
 isl_space *isl_space_domain_factor_range(
	 isl_space *space);
 isl_space *isl_space_range_factor_domain(
	 isl_space *space);
 isl_space *isl_space_range_factor_range(
	 isl_space *space);
 isl_space *isl_space_domain_wrapped_domain(
	 isl_space *space);
 isl_space *isl_space_domain_wrapped_range(
	 isl_space *space);
 isl_space *isl_space_range_wrapped_domain(
	 isl_space *space);
 isl_space *isl_space_range_wrapped_range(
	 isl_space *space);
extern
 isl_space *isl_space_map_from_set( isl_space *space);
 isl_space *isl_space_map_from_domain_and_range(
	 isl_space *domain,  isl_space *range);
extern
 isl_space *isl_space_reverse( isl_space *space);
extern
 isl_space *isl_space_wrapped_reverse( isl_space *space);
extern
 isl_space *isl_space_domain_reverse( isl_space *space);
extern
 isl_space *isl_space_range_reverse( isl_space *space);
 isl_space *isl_space_drop_dims( isl_space *space,
	enum isl_dim_type type, unsigned first, unsigned num);
// xxxxxxx ISL_DEPRECATED
 isl_space *isl_space_drop_inputs( isl_space *space,
		unsigned first, unsigned n);
// xxxxxxxx ISL_DEPRECATED
 isl_space *isl_space_drop_outputs( isl_space *space,
		unsigned first, unsigned n);
extern
 isl_space *isl_space_drop_all_params( isl_space *space);
extern
 isl_space *isl_space_domain( isl_space *space);
 isl_space *isl_space_from_domain( isl_space *space);
extern
 isl_space *isl_space_range( isl_space *space);
 isl_space *isl_space_from_range( isl_space *space);
 isl_space *isl_space_domain_map( isl_space *space);
 isl_space *isl_space_range_map( isl_space *space);
extern
 isl_space *isl_space_params( isl_space *space);

 isl_space *isl_space_add_unnamed_tuple_ui(
	 isl_space *space, unsigned dim);

 isl_space *isl_space_add_named_tuple_id_ui(
	 isl_space *space,  isl_id *tuple_id, unsigned dim);
 isl_space *isl_space_set_from_params( isl_space *space);

 isl_space *isl_space_align_params( isl_space *space1,
	 isl_space *space2);

extern
isl_bool isl_space_is_wrapping( isl_space *space);
isl_bool isl_space_domain_is_wrapping( isl_space *space);
isl_bool isl_space_range_is_wrapping( isl_space *space);
isl_bool isl_space_is_product( isl_space *space);
extern
 isl_space *isl_space_wrap( isl_space *space);
extern
 isl_space *isl_space_unwrap( isl_space *space);

isl_bool isl_space_can_zip( isl_space *space);
 isl_space *isl_space_zip( isl_space *space);

isl_bool isl_space_can_curry( isl_space *space);
extern
 isl_space *isl_space_curry( isl_space *space);

isl_bool isl_space_can_range_curry( isl_space *space);
 isl_space *isl_space_range_curry( isl_space *space);

isl_bool isl_space_can_uncurry( isl_space *space);
extern
 isl_space *isl_space_uncurry( isl_space *space);

isl_bool isl_space_is_domain( isl_space *space1,
	 isl_space *space2);
isl_bool isl_space_is_range( isl_space *space1,
	 isl_space *space2);
extern
isl_bool isl_space_is_equal( isl_space *space1,
	 isl_space *space2);
isl_bool isl_space_has_equal_params( isl_space *space1,
	 isl_space *space2);
isl_bool isl_space_has_equal_tuples( isl_space *space1,
	 isl_space *space2);
isl_bool isl_space_tuple_is_equal( isl_space *space1,
	enum isl_dim_type type1,  isl_space *space2,
	enum isl_dim_type type2);
// xxxxxxxxxx ISL_DEPRECATED
isl_bool isl_space_match( isl_space *space1, enum isl_dim_type type1,
	 isl_space *space2, enum isl_dim_type type2);
isl_size isl_space_dim( isl_space *space, enum isl_dim_type type);

extern
 isl_space *isl_space_flatten_domain( isl_space *space);
extern
 isl_space *isl_space_flatten_range( isl_space *space);


 isl_space *isl_space_read_from_str(isl_ctx *ctx,
	const char *str);
 char *isl_space_to_str( isl_space *space);
 isl_printer *isl_printer_print_space( isl_printer *p,
	 isl_space *space);
void isl_space_dump( isl_space *space);



#endif
