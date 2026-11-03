/*
 * Copyright 2008-2009 Katholieke Universiteit Leuven
 *
 * Use of this software is governed by the MIT license
 *
 * Written by Sven Verdoolaege, K.U.Leuven, Departement
 * Computerwetenschappen, Celestijnenlaan 200A, B-3001 Leuven, Belgium
 */

#ifndef ISL_MAP_H
#define ISL_MAP_H

#include <stdio.h>

#include <isl/ctx.h>
#include <isl/space_type.h>
#include <isl/vec.h>
#include <isl/mat.h>
#include <isl/printer.h>
#include <isl/local_space.h>
#include <isl/aff_type.h>
#include <isl/list.h>
#include <isl/map_type.h>
#include <isl/val_type.h>
#include <isl/stdint.h>
#include <isl/stride_info.h>
#include <isl/fixed_box.h>

#if defined(__cplusplus)

#endif

isl_size isl_basic_map_total_dim( const isl_basic_map *bmap);
isl_size isl_basic_map_dim( isl_basic_map *bmap,
				enum isl_dim_type type);

extern
isl_size isl_map_domain_tuple_dim( isl_map *map);
extern
isl_size isl_map_range_tuple_dim( isl_map *map);
isl_size isl_map_dim( isl_map *map, enum isl_dim_type type);

isl_ctx *isl_basic_map_get_ctx( isl_basic_map *bmap);
isl_ctx *isl_map_get_ctx( isl_map *map);
 isl_space *isl_basic_map_get_space( isl_basic_map *bmap);
extern
 isl_space *isl_map_get_space( isl_map *map);

 isl_aff *isl_basic_map_get_div( isl_basic_map *bmap,
	int pos);

 isl_local_space *isl_basic_map_get_local_space(
	 isl_basic_map *bmap);

 isl_basic_map *isl_basic_map_set_tuple_name(
	 isl_basic_map *bmap, enum isl_dim_type type, const char *s);
const char *isl_basic_map_get_tuple_name( isl_basic_map *bmap,
	enum isl_dim_type type);
isl_bool isl_map_has_tuple_name( isl_map *map,
	enum isl_dim_type type);
const char *isl_map_get_tuple_name( isl_map *map,
	enum isl_dim_type type);
 isl_map *isl_map_set_tuple_name( isl_map *map,
	enum isl_dim_type type, const char *s);
const char *isl_basic_map_get_dim_name( isl_basic_map *bmap,
	enum isl_dim_type type, unsigned pos);
isl_bool isl_map_has_dim_name( isl_map *map,
	enum isl_dim_type type, unsigned pos);
const char *isl_map_get_dim_name( isl_map *map,
	enum isl_dim_type type, unsigned pos);
 isl_basic_map *isl_basic_map_set_dim_name(
	 isl_basic_map *bmap,
	enum isl_dim_type type, unsigned pos, const char *s);
 isl_map *isl_map_set_dim_name( isl_map *map,
	enum isl_dim_type type, unsigned pos, const char *s);

 isl_basic_map *isl_basic_map_set_tuple_id(
	 isl_basic_map *bmap,
	enum isl_dim_type type,  isl_id *id);
 isl_map *isl_map_set_dim_id( isl_map *map,
	enum isl_dim_type type, unsigned pos,  isl_id *id);
isl_bool isl_basic_map_has_dim_id( isl_basic_map *bmap,
	enum isl_dim_type type, unsigned pos);
isl_bool isl_map_has_dim_id( isl_map *map,
	enum isl_dim_type type, unsigned pos);
 isl_id *isl_map_get_dim_id( isl_map *map,
	enum isl_dim_type type, unsigned pos);

 isl_map *isl_map_set_domain_tuple_id( isl_map *map,
	 isl_id *id);

 isl_map *isl_map_set_range_tuple_id( isl_map *map,
	 isl_id *id);
 isl_map *isl_map_set_tuple_id( isl_map *map,
	enum isl_dim_type type,  isl_id *id);
 isl_map *isl_map_reset_tuple_id( isl_map *map,
	enum isl_dim_type type);
extern
isl_bool isl_map_has_domain_tuple_id( isl_map *map);
extern
isl_bool isl_map_has_range_tuple_id( isl_map *map);
isl_bool isl_map_has_tuple_id( isl_map *map, enum isl_dim_type type);
extern
 isl_id *isl_map_get_domain_tuple_id( isl_map *map);
extern
 isl_id *isl_map_get_range_tuple_id( isl_map *map);
 isl_id *isl_map_get_tuple_id( isl_map *map,
	enum isl_dim_type type);
 isl_map *isl_map_reset_user( isl_map *map);

int isl_basic_map_find_dim_by_name( isl_basic_map *bmap,
	enum isl_dim_type type, const char *name);
int isl_map_find_dim_by_id( isl_map *map, enum isl_dim_type type,
	 isl_id *id);
int isl_map_find_dim_by_name( isl_map *map, enum isl_dim_type type,
	const char *name);

isl_bool isl_basic_map_is_rational( isl_basic_map *bmap);

 isl_basic_map *isl_basic_map_identity( isl_space *space);
 isl_basic_map *isl_basic_map_free( isl_basic_map *bmap);
 isl_basic_map *isl_basic_map_copy( isl_basic_map *bmap);
 isl_basic_map *isl_basic_map_equal(
	 isl_space *space, unsigned n_equal);
 isl_basic_map *isl_basic_map_less_at( isl_space *space,
	unsigned pos);
 isl_basic_map *isl_basic_map_more_at( isl_space *space,
	unsigned pos);
 isl_basic_map *isl_basic_map_empty( isl_space *space);
 isl_basic_map *isl_basic_map_universe( isl_space *space);
 isl_basic_map *isl_basic_map_nat_universe(
	 isl_space *space);
 isl_basic_map *isl_basic_map_remove_redundancies(
	 isl_basic_map *bmap);
 isl_map *isl_map_remove_redundancies( isl_map *map);
 isl_basic_map *isl_map_simple_hull( isl_map *map);
extern
 isl_basic_map *isl_map_unshifted_simple_hull(
	 isl_map *map);
 isl_basic_map *isl_map_plain_unshifted_simple_hull(
	 isl_map *map);
 isl_basic_map *isl_map_unshifted_simple_hull_from_map_list(
	 isl_map *map,  isl_map_list *list);

extern
 isl_basic_map *isl_basic_map_intersect_domain(
		 isl_basic_map *bmap,
		 isl_basic_set *bset);
extern
 isl_basic_map *isl_basic_map_intersect_range(
		 isl_basic_map *bmap,
		 isl_basic_set *bset);
extern
 isl_basic_map *isl_basic_map_intersect(
		 isl_basic_map *bmap1,
		 isl_basic_map *bmap2);
 isl_basic_map *isl_basic_map_list_intersect(
	 isl_basic_map_list *list);
extern
 isl_map *isl_basic_map_union(
		 isl_basic_map *bmap1,
		 isl_basic_map *bmap2);
extern
 isl_basic_map *isl_basic_map_apply_domain(
		 isl_basic_map *bmap1,
		 isl_basic_map *bmap2);
extern
 isl_basic_map *isl_basic_map_apply_range(
		 isl_basic_map *bmap1,
		 isl_basic_map *bmap2);
extern
 isl_basic_map *isl_basic_map_affine_hull(
		 isl_basic_map *bmap);
 isl_basic_map *isl_basic_map_preimage_domain_multi_aff(
	 isl_basic_map *bmap,  isl_multi_aff *ma);
 isl_basic_map *isl_basic_map_preimage_range_multi_aff(
	 isl_basic_map *bmap,  isl_multi_aff *ma);
extern
 isl_basic_map *isl_basic_map_reverse( isl_basic_map *bmap);
 isl_basic_set *isl_basic_map_domain( isl_basic_map *bmap);
 isl_basic_set *isl_basic_map_range( isl_basic_map *bmap);
 isl_basic_map *isl_basic_map_domain_map(
	 isl_basic_map *bmap);
 isl_basic_map *isl_basic_map_range_map(
	 isl_basic_map *bmap);
 isl_basic_map *isl_basic_map_remove_dims(
	 isl_basic_map *bmap,
	enum isl_dim_type type, unsigned first, unsigned n);
 isl_basic_map *isl_basic_map_eliminate(
	 isl_basic_map *bmap,
	enum isl_dim_type type, unsigned first, unsigned n);
extern
 isl_basic_map *isl_basic_map_sample( isl_basic_map *bmap);
extern
 isl_basic_map *isl_basic_map_detect_equalities(
						 isl_basic_map *bmap);
 isl_basic_map *isl_basic_map_read_from_file(isl_ctx *ctx,
	FILE *input);

 isl_basic_map *isl_basic_map_read_from_str(isl_ctx *ctx,
	const char *str);
 isl_map *isl_map_read_from_file(isl_ctx *ctx, FILE *input);

 isl_map *isl_map_read_from_str(isl_ctx *ctx, const char *str);
void isl_basic_map_dump( isl_basic_map *bmap);
void isl_map_dump( isl_map *map);
 char *isl_basic_map_to_str( isl_basic_map *bmap);
 isl_printer *isl_printer_print_basic_map(
	 isl_printer *printer,  isl_basic_map *bmap);
 char *isl_map_to_str( isl_map *map);
 isl_printer *isl_printer_print_map( isl_printer *printer,
	 isl_map *map);
 isl_basic_map *isl_basic_map_fix_si( isl_basic_map *bmap,
		enum isl_dim_type type, unsigned pos, int value);
 isl_basic_map *isl_basic_map_fix_val( isl_basic_map *bmap,
	enum isl_dim_type type, unsigned pos,  isl_val *v);
 isl_basic_map *isl_basic_map_lower_bound_si(
		 isl_basic_map *bmap,
		enum isl_dim_type type, unsigned pos, int value);
 isl_basic_map *isl_basic_map_upper_bound_si(
	 isl_basic_map *bmap,
	enum isl_dim_type type, unsigned pos, int value);

 isl_map *isl_map_lower_bound_multi_pw_aff( isl_map *map,
	 isl_multi_pw_aff *lower);

 isl_map *isl_map_upper_bound_multi_pw_aff( isl_map *map,
	 isl_multi_pw_aff *upper);

 isl_basic_map *isl_basic_map_sum( isl_basic_map *bmap1,
	 isl_basic_map *bmap2);
 isl_basic_map *isl_basic_map_neg( isl_basic_map *bmap);

 isl_map *isl_map_sum( isl_map *map1,
	 isl_map *map2);
 isl_map *isl_map_neg( isl_map *map);
 isl_map *isl_map_floordiv_val( isl_map *map,
	 isl_val *d);

extern
isl_bool isl_basic_map_is_equal( isl_basic_map *bmap1,
	 isl_basic_map *bmap2);
isl_bool isl_basic_map_is_disjoint( isl_basic_map *bmap1,
	 isl_basic_map *bmap2);

 isl_map *isl_basic_map_partial_lexmax(
		 isl_basic_map *bmap,  isl_basic_set *dom,
		 isl_set **empty);
 isl_map *isl_basic_map_partial_lexmin(
		 isl_basic_map *bmap,  isl_basic_set *dom,
		 isl_set **empty);
 isl_map *isl_map_partial_lexmax(
		 isl_map *map,  isl_set *dom,
		 isl_set **empty);
 isl_map *isl_map_partial_lexmin(
		 isl_map *map,  isl_set *dom,
		 isl_set **empty);
extern
 isl_map *isl_basic_map_lexmin( isl_basic_map *bmap);
extern
 isl_map *isl_basic_map_lexmax( isl_basic_map *bmap);
extern
 isl_map *isl_map_lexmin( isl_map *map);
extern
 isl_map *isl_map_lexmax( isl_map *map);
 isl_pw_multi_aff *isl_basic_map_partial_lexmin_pw_multi_aff(
	 isl_basic_map *bmap,  isl_basic_set *dom,
	 isl_set **empty);
 isl_pw_multi_aff *isl_basic_map_partial_lexmax_pw_multi_aff(
	 isl_basic_map *bmap,  isl_basic_set *dom,
	 isl_set **empty);
 isl_pw_multi_aff *isl_basic_map_lexmin_pw_multi_aff(
	 isl_basic_map *bmap);
extern
 isl_pw_multi_aff *isl_map_lexmin_pw_multi_aff(
	 isl_map *map);
extern
 isl_pw_multi_aff *isl_map_lexmax_pw_multi_aff(
	 isl_map *map);
extern
 isl_multi_pw_aff *isl_map_min_multi_pw_aff( isl_map *map);
extern
 isl_multi_pw_aff *isl_map_max_multi_pw_aff( isl_map *map);

void isl_basic_map_print_internal( isl_basic_map *bmap,
	FILE *out, int indent);

 isl_val *isl_basic_map_plain_get_val_if_fixed(
	 isl_basic_map *bmap,
	enum isl_dim_type type, unsigned pos);

isl_bool isl_basic_map_image_is_bounded( isl_basic_map *bmap);
isl_bool isl_basic_map_plain_is_universe( isl_basic_map *bmap);
isl_bool isl_basic_map_is_universe( isl_basic_map *bmap);
isl_bool isl_basic_map_plain_is_empty( isl_basic_map *bmap);
extern
isl_bool isl_basic_map_is_empty( isl_basic_map *bmap);
extern
isl_bool isl_basic_map_is_subset( isl_basic_map *bmap1,
		 isl_basic_map *bmap2);
isl_bool isl_basic_map_is_strict_subset( isl_basic_map *bmap1,
		 isl_basic_map *bmap2);

extern
 isl_map *isl_map_universe( isl_space *space);
extern
 isl_map *isl_space_universe_map( isl_space *space);
 isl_map *isl_map_nat_universe( isl_space *space);
extern
 isl_map *isl_map_empty( isl_space *space);
 isl_map *isl_map_identity( isl_space *space);
 isl_map *isl_map_lex_lt_first( isl_space *space,
	unsigned n);
 isl_map *isl_map_lex_le_first( isl_space *space,
	unsigned n);
 isl_map *isl_map_lex_lt( isl_space *set_space);
 isl_map *isl_map_lex_le( isl_space *set_space);
 isl_map *isl_map_lex_gt_first( isl_space *space,
	unsigned n);
 isl_map *isl_map_lex_ge_first( isl_space *space,
	unsigned n);
 isl_map *isl_map_lex_gt( isl_space *set_space);
 isl_map *isl_map_lex_ge( isl_space *set_space);
 isl_map *isl_map_free( isl_map *map);
 isl_map *isl_map_copy( isl_map *map);
extern
 isl_map *isl_map_reverse( isl_map *map);
extern
 isl_map *isl_map_domain_reverse( isl_map *map);
extern
 isl_map *isl_map_range_reverse( isl_map *map);
extern
 isl_map *isl_map_union(
		 isl_map *map1,
		 isl_map *map2);
 isl_map *isl_map_union_disjoint(
		 isl_map *map1,  isl_map *map2);
extern
 isl_map *isl_map_intersect_domain(
		 isl_map *map,
		 isl_set *set);
extern
 isl_map *isl_map_intersect_range(
		 isl_map *map,
		 isl_set *set);
extern
 isl_map *isl_map_intersect_domain_factor_domain(
	 isl_map *map,  isl_map *factor);
extern
 isl_map *isl_map_intersect_domain_factor_range(
	 isl_map *map,  isl_map *factor);
extern
 isl_map *isl_map_intersect_range_factor_domain(
	 isl_map *map,  isl_map *factor);
extern
 isl_map *isl_map_intersect_range_factor_range(
	 isl_map *map,  isl_map *factor);
extern
 isl_map *isl_map_intersect_domain_wrapped_domain(
	 isl_map *map,  isl_set *domain);
extern
 isl_map *isl_map_intersect_range_wrapped_domain(
	 isl_map *map,  isl_set *domain);
extern
 isl_map *isl_map_apply_domain(
		 isl_map *map1,
		 isl_map *map2);
extern
 isl_map *isl_map_apply_range(
		 isl_map *map1,
		 isl_map *map2);

 isl_map *isl_map_preimage_domain_multi_aff( isl_map *map,
	 isl_multi_aff *ma);

 isl_map *isl_map_preimage_range_multi_aff( isl_map *map,
	 isl_multi_aff *ma);

 isl_map *isl_map_preimage_domain_pw_multi_aff(
	 isl_map *map,  isl_pw_multi_aff *pma);

 isl_map *isl_map_preimage_range_pw_multi_aff(
	 isl_map *map,  isl_pw_multi_aff *pma);

 isl_map *isl_map_preimage_domain_multi_pw_aff(
	 isl_map *map,  isl_multi_pw_aff *mpa);
 isl_basic_map *isl_basic_map_product(
	 isl_basic_map *bmap1,  isl_basic_map *bmap2);
extern
 isl_map *isl_map_product( isl_map *map1,
	 isl_map *map2);
 isl_basic_map *isl_basic_map_domain_product(
	 isl_basic_map *bmap1,  isl_basic_map *bmap2);
 isl_basic_map *isl_basic_map_range_product(
	 isl_basic_map *bmap1,  isl_basic_map *bmap2);
extern
 isl_map *isl_map_domain_product( isl_map *map1,
	 isl_map *map2);
extern
 isl_map *isl_map_range_product( isl_map *map1,
	 isl_map *map2);
 isl_basic_map *isl_basic_map_flat_product(
	 isl_basic_map *bmap1,  isl_basic_map *bmap2);
 isl_map *isl_map_flat_product( isl_map *map1,
	 isl_map *map2);
 isl_basic_map *isl_basic_map_flat_range_product(
	 isl_basic_map *bmap1,  isl_basic_map *bmap2);
 isl_map *isl_map_flat_domain_product( isl_map *map1,
	 isl_map *map2);
 isl_map *isl_map_flat_range_product( isl_map *map1,
	 isl_map *map2);
isl_bool isl_map_domain_is_wrapping( isl_map *map);
isl_bool isl_map_range_is_wrapping( isl_map *map);
isl_bool isl_map_is_product( isl_map *map);
extern
 isl_map *isl_map_factor_domain( isl_map *map);
extern
 isl_map *isl_map_factor_range( isl_map *map);
extern
 isl_map *isl_map_domain_factor_domain( isl_map *map);
extern
 isl_map *isl_map_domain_factor_range( isl_map *map);
extern
 isl_map *isl_map_range_factor_domain( isl_map *map);
extern
 isl_map *isl_map_range_factor_range( isl_map *map);
extern
 isl_map *isl_map_intersect( isl_map *map1,
				       isl_map *map2);
extern
 isl_map *isl_map_intersect_params( isl_map *map,
		 isl_set *params);
extern
 isl_map *isl_map_subtract(
		 isl_map *map1,
		 isl_map *map2);
 isl_map *isl_map_subtract_domain( isl_map *map,
	 isl_set *dom);
 isl_map *isl_map_subtract_range( isl_map *map,
	 isl_set *dom);
extern
 isl_map *isl_map_complement( isl_map *map);
 isl_map *isl_map_fix_input_si( isl_map *map,
		unsigned input, int value);
 isl_map *isl_map_fix_si( isl_map *map,
		enum isl_dim_type type, unsigned pos, int value);
 isl_map *isl_map_fix_val( isl_map *map,
	enum isl_dim_type type, unsigned pos,  isl_val *v);
 isl_map *isl_map_lower_bound_si( isl_map *map,
		enum isl_dim_type type, unsigned pos, int value);
 isl_map *isl_map_lower_bound_val( isl_map *map,
	enum isl_dim_type type, unsigned pos,  isl_val *value);
 isl_map *isl_map_upper_bound_si( isl_map *map,
	enum isl_dim_type type, unsigned pos, int value);
 isl_map *isl_map_upper_bound_val( isl_map *map,
	enum isl_dim_type type, unsigned pos,  isl_val *value);
extern
 isl_basic_set *isl_basic_map_deltas( isl_basic_map *bmap);
extern
 isl_set *isl_map_deltas( isl_map *map);
 isl_basic_map *isl_basic_map_deltas_map(
	 isl_basic_map *bmap);
 isl_map *isl_map_deltas_map( isl_map *map);
extern
 isl_map *isl_map_detect_equalities( isl_map *map);
extern
 isl_basic_map *isl_map_affine_hull( isl_map *map);
 isl_basic_map *isl_map_convex_hull( isl_map *map);
extern
 isl_basic_map *isl_map_polyhedral_hull( isl_map *map);
 isl_basic_map *isl_basic_map_add_dims( isl_basic_map *bmap,
		enum isl_dim_type type, unsigned n);
 isl_map *isl_map_add_dims( isl_map *map,
		enum isl_dim_type type, unsigned n);
 isl_basic_map *isl_basic_map_insert_dims(
	 isl_basic_map *bmap, enum isl_dim_type type,
	unsigned pos, unsigned n);
 isl_map *isl_map_insert_dims( isl_map *map,
		enum isl_dim_type type, unsigned pos, unsigned n);
 isl_basic_map *isl_basic_map_move_dims(
	 isl_basic_map *bmap,
	enum isl_dim_type dst_type, unsigned dst_pos,
	enum isl_dim_type src_type, unsigned src_pos, unsigned n);
 isl_map *isl_map_move_dims( isl_map *map,
	enum isl_dim_type dst_type, unsigned dst_pos,
	enum isl_dim_type src_type, unsigned src_pos, unsigned n);
 isl_basic_map *isl_basic_map_project_out(
		 isl_basic_map *bmap,
		enum isl_dim_type type, unsigned first, unsigned n);

 isl_map *isl_map_project_out_param_id( isl_map *map,
	 isl_id *id);

 isl_map *isl_map_project_out_param_id_list( isl_map *map,
	 isl_id_list *list);
 isl_map *isl_map_project_out( isl_map *map,
		enum isl_dim_type type, unsigned first, unsigned n);
extern
 isl_map *isl_map_project_out_all_params( isl_map *map);
 isl_basic_map *isl_basic_map_remove_divs(
	 isl_basic_map *bmap);
 isl_map *isl_map_remove_unknown_divs( isl_map *map);
 isl_map *isl_map_remove_divs( isl_map *map);
 isl_map *isl_map_eliminate( isl_map *map,
	enum isl_dim_type type, unsigned first, unsigned n);
 isl_map *isl_map_remove_dims( isl_map *map,
	enum isl_dim_type type, unsigned first, unsigned n);
 isl_basic_map *isl_basic_map_remove_divs_involving_dims(
	 isl_basic_map *bmap,
	enum isl_dim_type type, unsigned first, unsigned n);
 isl_map *isl_map_remove_divs_involving_dims( isl_map *map,
	enum isl_dim_type type, unsigned first, unsigned n);
 isl_map *isl_map_remove_inputs( isl_map *map,
	unsigned first, unsigned n);

 isl_basic_map *isl_basic_map_equate( isl_basic_map *bmap,
	enum isl_dim_type type1, int pos1, enum isl_dim_type type2, int pos2);
 isl_basic_map *isl_basic_map_order_ge( isl_basic_map *bmap,
	enum isl_dim_type type1, int pos1, enum isl_dim_type type2, int pos2);
 isl_map *isl_map_order_ge( isl_map *map,
	enum isl_dim_type type1, int pos1, enum isl_dim_type type2, int pos2);
 isl_map *isl_map_order_le( isl_map *map,
	enum isl_dim_type type1, int pos1, enum isl_dim_type type2, int pos2);
 isl_map *isl_map_equate( isl_map *map,
	enum isl_dim_type type1, int pos1, enum isl_dim_type type2, int pos2);
 isl_map *isl_map_oppose( isl_map *map,
	enum isl_dim_type type1, int pos1, enum isl_dim_type type2, int pos2);
 isl_map *isl_map_order_lt( isl_map *map,
	enum isl_dim_type type1, int pos1, enum isl_dim_type type2, int pos2);
 isl_basic_map *isl_basic_map_order_gt( isl_basic_map *bmap,
	enum isl_dim_type type1, int pos1, enum isl_dim_type type2, int pos2);
 isl_map *isl_map_order_gt( isl_map *map,
	enum isl_dim_type type1, int pos1, enum isl_dim_type type2, int pos2);

extern
 isl_map *isl_set_translation( isl_set *deltas);
extern
 isl_map *isl_set_identity( isl_set *set);

extern
isl_bool isl_basic_set_is_wrapping( isl_basic_set *bset);
extern
isl_bool isl_set_is_wrapping( isl_set *set);
 isl_basic_set *isl_basic_map_wrap( isl_basic_map *bmap);
extern
 isl_set *isl_map_wrap( isl_map *map);
 isl_basic_map *isl_basic_set_unwrap( isl_basic_set *bset);
extern
 isl_map *isl_set_unwrap( isl_set *set);
extern
 isl_basic_map *isl_basic_map_flatten( isl_basic_map *bmap);
extern
 isl_map *isl_map_flatten( isl_map *map);
extern
 isl_basic_map *isl_basic_map_flatten_domain(
	 isl_basic_map *bmap);
extern
 isl_basic_map *isl_basic_map_flatten_range(
	 isl_basic_map *bmap);
extern
 isl_map *isl_map_flatten_domain( isl_map *map);
extern
 isl_map *isl_map_flatten_range( isl_map *map);
extern
 isl_basic_set *isl_basic_set_flatten( isl_basic_set *bset);
extern
 isl_set *isl_set_flatten( isl_set *set);
 isl_map *isl_set_flatten_map( isl_set *set);
extern
 isl_set *isl_map_params( isl_map *map);
extern
 isl_set *isl_map_domain( isl_map *bmap);
extern
 isl_set *isl_map_range( isl_map *map);
extern
 isl_map *isl_set_insert_domain( isl_set *set,
	 isl_space *domain);
 isl_map *isl_map_domain_map( isl_map *map);
 isl_map *isl_map_range_map( isl_map *map);
 isl_map *isl_set_wrapped_domain_map( isl_set *set);

 isl_map *isl_map_from_basic_map( isl_basic_map *bmap);
 isl_map *isl_map_from_domain( isl_set *set);
 isl_basic_map *isl_basic_map_from_domain(
	 isl_basic_set *bset);
 isl_basic_map *isl_basic_map_from_range(
	 isl_basic_set *bset);
 isl_map *isl_map_from_range( isl_set *set);
 isl_basic_map *isl_basic_map_from_domain_and_range(
	 isl_basic_set *domain,  isl_basic_set *range);
 isl_map *isl_map_from_domain_and_range( isl_set *domain,
	 isl_set *range);
extern
 isl_basic_map *isl_map_sample( isl_map *map);

extern
 isl_set *isl_map_bind_domain( isl_map *map,
	 isl_multi_id *tuple);
extern
 isl_set *isl_map_bind_range( isl_map *map,
	 isl_multi_id *tuple);

isl_bool isl_map_plain_is_empty( isl_map *map);
isl_bool isl_map_plain_is_universe( isl_map *map);
extern
isl_bool isl_map_is_empty( isl_map *map);
extern
isl_bool isl_map_is_subset( isl_map *map1,  isl_map *map2);
extern
isl_bool isl_map_is_strict_subset( isl_map *map1,
	 isl_map *map2);
extern
isl_bool isl_map_is_equal( isl_map *map1,  isl_map *map2);
extern
isl_bool isl_map_is_disjoint( isl_map *map1,
	 isl_map *map2);
isl_bool isl_basic_map_is_single_valued( isl_basic_map *bmap);
isl_bool isl_map_plain_is_single_valued( isl_map *map);
extern
isl_bool isl_map_is_single_valued( isl_map *map);
isl_bool isl_map_plain_is_injective( isl_map *map);
extern
isl_bool isl_map_is_injective( isl_map *map);
extern
isl_bool isl_map_is_bijective( isl_map *map);
isl_bool isl_map_is_identity( isl_map *map);
int isl_map_is_translation( isl_map *map);
isl_bool isl_map_has_equal_space( isl_map *map1,
	 isl_map *map2);

isl_bool isl_basic_map_can_zip( isl_basic_map *bmap);
isl_bool isl_map_can_zip( isl_map *map);
 isl_basic_map *isl_basic_map_zip( isl_basic_map *bmap);
extern
 isl_map *isl_map_zip( isl_map *map);

isl_bool isl_basic_map_can_curry( isl_basic_map *bmap);
isl_bool isl_map_can_curry( isl_map *map);
 isl_basic_map *isl_basic_map_curry( isl_basic_map *bmap);
extern
 isl_map *isl_map_curry( isl_map *map);

isl_bool isl_map_can_range_curry( isl_map *map);
 isl_map *isl_map_range_curry( isl_map *map);

isl_bool isl_basic_map_can_uncurry( isl_basic_map *bmap);
isl_bool isl_map_can_uncurry( isl_map *map);
 isl_basic_map *isl_basic_map_uncurry( isl_basic_map *bmap);
extern
 isl_map *isl_map_uncurry( isl_map *map);

 isl_map *isl_map_make_disjoint( isl_map *map);
 isl_map *isl_basic_map_compute_divs( isl_basic_map *bmap);
 isl_map *isl_map_compute_divs( isl_map *map);
ISL_DEPRECATED
 isl_map *isl_map_align_divs( isl_map *map);

 isl_basic_map *isl_basic_map_drop_constraints_involving_dims(
	 isl_basic_map *bmap,
	enum isl_dim_type type, unsigned first, unsigned n);
 isl_basic_map *isl_basic_map_drop_constraints_not_involving_dims(
	 isl_basic_map *bmap,
	enum isl_dim_type type, unsigned first, unsigned n);
 isl_map *isl_map_drop_constraints_involving_dims(
	 isl_map *map,
	enum isl_dim_type type, unsigned first, unsigned n);
 isl_map *isl_map_drop_constraints_not_involving_dims(
	 isl_map *map,
	enum isl_dim_type type, unsigned first, unsigned n);

isl_bool isl_basic_map_involves_dims( isl_basic_map *bmap,
	enum isl_dim_type type, unsigned first, unsigned n);
isl_bool isl_map_involves_dims( isl_map *map,
	enum isl_dim_type type, unsigned first, unsigned n);

void isl_map_print_internal( isl_map *map, FILE *out, int indent);

 isl_val *isl_map_plain_get_val_if_fixed( isl_map *map,
	enum isl_dim_type type, unsigned pos);

 isl_basic_map *isl_basic_map_gist_domain(
	 isl_basic_map *bmap,  isl_basic_set *context);
extern
 isl_basic_map *isl_basic_map_gist( isl_basic_map *bmap,
	 isl_basic_map *context);
extern
 isl_map *isl_map_gist( isl_map *map,
	 isl_map *context);
extern
 isl_map *isl_map_gist_domain( isl_map *map,
	 isl_set *context);
 isl_map *isl_map_gist_range( isl_map *map,
	 isl_set *context);
extern
 isl_map *isl_map_gist_params( isl_map *map,
	 isl_set *context);
 isl_map *isl_map_gist_basic_map( isl_map *map,
	 isl_basic_map *context);

 isl_stride_info *isl_map_get_range_stride_info(
	 isl_map *map, int pos);
extern
 isl_fixed_box *isl_map_get_range_lattice_tile(
	 isl_map *map);
extern
 isl_fixed_box *isl_map_get_range_simple_fixed_box_hull(
	 isl_map *map);

extern
 isl_map *isl_map_coalesce( isl_map *map);

isl_bool isl_map_plain_is_equal( isl_map *map1,
	 isl_map *map2);

uint32_t isl_map_get_hash( isl_map *map);

extern
isl_size isl_map_n_basic_map( isl_map *map);
extern
isl_stat isl_map_foreach_basic_map( isl_map *map,
	isl_stat (*fn)( isl_basic_map *bmap, void *user), void *user);
 isl_basic_map_list *isl_map_get_basic_map_list(
	 isl_map *map);


 isl_map *isl_map_fixed_power_val( isl_map *map,
	 isl_val *exp);
 isl_map *isl_map_power( isl_map *map, isl_bool *exact);
 isl_map *isl_map_reaching_path_lengths( isl_map *map,
	isl_bool *exact);
 isl_map *isl_map_transitive_closure( isl_map *map,
	isl_bool *exact);

 isl_map *isl_map_lex_le_map( isl_map *map1,
	 isl_map *map2);
 isl_map *isl_map_lex_lt_map( isl_map *map1,
	 isl_map *map2);
 isl_map *isl_map_lex_ge_map( isl_map *map1,
	 isl_map *map2);
 isl_map *isl_map_lex_gt_map( isl_map *map1,
	 isl_map *map2);


 isl_map *isl_map_eq_at_multi_pw_aff( isl_map *map,
	 isl_multi_pw_aff *mpa);

 isl_map *isl_map_lex_lt_at_multi_pw_aff( isl_map *map,
	 isl_multi_pw_aff *mpa);

 isl_map *isl_map_lex_le_at_multi_pw_aff( isl_map *map,
	 isl_multi_pw_aff *mpa);

 isl_map *isl_map_lex_gt_at_multi_pw_aff( isl_map *map,
	 isl_multi_pw_aff *mpa);

 isl_map *isl_map_lex_ge_at_multi_pw_aff( isl_map *map,
	 isl_multi_pw_aff *mpa);

 isl_basic_map *isl_basic_map_align_params(
	 isl_basic_map *bmap,  isl_space *model);
 isl_map *isl_map_align_params( isl_map *map,
	 isl_space *model);
 isl_basic_map *isl_basic_map_drop_unused_params(
	 isl_basic_map *bmap);
extern
 isl_map *isl_map_drop_unused_params( isl_map *map);

 isl_mat *isl_basic_map_equalities_matrix(
		 isl_basic_map *bmap, enum isl_dim_type c1,
		enum isl_dim_type c2, enum isl_dim_type c3,
		enum isl_dim_type c4, enum isl_dim_type c5);
 isl_mat *isl_basic_map_inequalities_matrix(
		 isl_basic_map *bmap, enum isl_dim_type c1,
		enum isl_dim_type c2, enum isl_dim_type c3,
		enum isl_dim_type c4, enum isl_dim_type c5);
 isl_basic_map *isl_basic_map_from_constraint_matrices(
	 isl_space *space,
	 isl_mat *eq,  isl_mat *ineq, enum isl_dim_type c1,
	enum isl_dim_type c2, enum isl_dim_type c3,
	enum isl_dim_type c4, enum isl_dim_type c5);

 isl_basic_map *isl_basic_map_from_aff( isl_aff *aff);
 isl_basic_map *isl_basic_map_from_multi_aff(
	 isl_multi_aff *maff);
 isl_basic_map *isl_basic_map_from_aff_list(
	 isl_space *domain_space,  isl_aff_list *list);

 isl_map *isl_map_from_aff( isl_aff *aff);
extern
 isl_map *isl_multi_aff_as_map( isl_multi_aff *ma);
 isl_map *isl_map_from_multi_aff( isl_multi_aff *maff);

 isl_pw_aff *isl_map_dim_min( isl_map *map, int pos);
 isl_pw_aff *isl_map_dim_max( isl_map *map, int pos);

ISL_DECLARE_LIST_FN(basic_map)
ISL_DECLARE_EXPORTED_LIST_FN(map)
ISL_DECLARE_EXPORTED_LIST_FN_READ(map)

#if defined(__cplusplus)
}
#endif

#endif
