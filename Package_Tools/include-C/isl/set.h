/*
 * Copyright 2008-2009 Katholieke Universiteit Leuven
 *
 * Use of this software is governed by the MIT license
 *
 * Written by Sven Verdoolaege, K.U.Leuven, Departement
 * Computerwetenschappen, Celestijnenlaan 200A, B-3001 Leuven, Belgium
 */

#ifndef ISL_SET_H
#define ISL_SET_H

#include <isl/id_type.h>
#include <isl/map_type.h>
#include <isl/aff_type.h>
#include <isl/list.h>
#include <isl/mat.h>
#include <isl/point.h>
#include <isl/local_space.h>
#include <isl/val_type.h>
#include <isl/stdint.h>
#include <isl/stride_info.h>
#include <isl/fixed_box.h>

#if defined(__cplusplus)

#endif

isl_size isl_basic_set_n_dim( isl_basic_set *bset);
isl_size isl_basic_set_n_param( isl_basic_set *bset);
isl_size isl_basic_set_total_dim( const isl_basic_set *bset);
isl_size isl_basic_set_dim( isl_basic_set *bset,
				enum isl_dim_type type);

isl_size isl_set_n_dim( isl_set *set);
isl_size isl_set_n_param( isl_set *set);
extern
isl_size isl_set_tuple_dim( isl_set *set);
isl_size isl_set_dim( isl_set *set, enum isl_dim_type type);

isl_ctx *isl_basic_set_get_ctx( isl_basic_set *bset);
isl_ctx *isl_set_get_ctx( isl_set *set);
 isl_space *isl_basic_set_get_space( isl_basic_set *bset);
extern
 isl_space *isl_set_get_space( isl_set *set);
 isl_set *isl_set_reset_space( isl_set *set,
	 isl_space *space);

 isl_aff *isl_basic_set_get_div( isl_basic_set *bset,
	int pos);

 isl_local_space *isl_basic_set_get_local_space(
	 isl_basic_set *bset);

const char *isl_basic_set_get_tuple_name( isl_basic_set *bset);
isl_bool isl_set_has_tuple_name( isl_set *set);
const char *isl_set_get_tuple_name( isl_set *set);
 isl_basic_set *isl_basic_set_set_tuple_name(
	 isl_basic_set *set, const char *s);
 isl_set *isl_set_set_tuple_name( isl_set *set,
	const char *s);
const char *isl_basic_set_get_dim_name( isl_basic_set *bset,
	enum isl_dim_type type, unsigned pos);
 isl_basic_set *isl_basic_set_set_dim_name(
	 isl_basic_set *bset,
	enum isl_dim_type type, unsigned pos, const char *s);
isl_bool isl_set_has_dim_name( isl_set *set,
	enum isl_dim_type type, unsigned pos);
const char *isl_set_get_dim_name( isl_set *set,
	enum isl_dim_type type, unsigned pos);
 isl_set *isl_set_set_dim_name( isl_set *set,
	enum isl_dim_type type, unsigned pos, const char *s);

 isl_id *isl_basic_set_get_dim_id( isl_basic_set *bset,
	enum isl_dim_type type, unsigned pos);
 isl_basic_set *isl_basic_set_set_tuple_id(
	 isl_basic_set *bset,  isl_id *id);
 isl_set *isl_set_set_dim_id( isl_set *set,
	enum isl_dim_type type, unsigned pos,  isl_id *id);
isl_bool isl_set_has_dim_id( isl_set *set,
	enum isl_dim_type type, unsigned pos);
 isl_id *isl_set_get_dim_id( isl_set *set,
	enum isl_dim_type type, unsigned pos);
 isl_set *isl_set_set_tuple_id( isl_set *set,
	 isl_id *id);
 isl_set *isl_set_reset_tuple_id( isl_set *set);
isl_bool isl_set_has_tuple_id( isl_set *set);
 isl_id *isl_set_get_tuple_id( isl_set *set);
 isl_set *isl_set_reset_user( isl_set *set);

int isl_set_find_dim_by_id( isl_set *set, enum isl_dim_type type,
	 isl_id *id);
int isl_set_find_dim_by_name( isl_set *set, enum isl_dim_type type,
	const char *name);

int isl_basic_set_is_rational( isl_basic_set *bset);

 isl_basic_set *isl_basic_set_free( isl_basic_set *bset);
 isl_basic_set *isl_basic_set_copy( isl_basic_set *bset);
 isl_basic_set *isl_basic_set_empty( isl_space *space);
 isl_basic_set *isl_basic_set_universe( isl_space *space);
 isl_basic_set *isl_basic_set_nat_universe(
	 isl_space *space);
 isl_basic_set *isl_basic_set_positive_orthant(
	 isl_space *space);
void isl_basic_set_print_internal( isl_basic_set *bset,
				FILE *out, int indent);
extern
 isl_basic_set *isl_basic_set_intersect(
		 isl_basic_set *bset1,
		 isl_basic_set *bset2);
extern
 isl_basic_set *isl_basic_set_intersect_params(
	 isl_basic_set *bset1,  isl_basic_set *bset2);
extern
 isl_basic_set *isl_basic_set_apply(
		 isl_basic_set *bset,
		 isl_basic_map *bmap);
 isl_basic_set *isl_basic_set_preimage_multi_aff(
	 isl_basic_set *bset,  isl_multi_aff *ma);
extern
 isl_basic_set *isl_basic_set_affine_hull(
		 isl_basic_set *bset);
 isl_basic_set *isl_basic_set_remove_dims(
	 isl_basic_set *bset,
	enum isl_dim_type type, unsigned first, unsigned n);
extern
 isl_basic_set *isl_basic_set_sample( isl_basic_set *bset);
extern
 isl_basic_set *isl_basic_set_detect_equalities(
						 isl_basic_set *bset);
 isl_basic_set *isl_basic_set_remove_redundancies(
	 isl_basic_set *bset);
 isl_set *isl_set_remove_redundancies( isl_set *set);
 isl_basic_set *isl_basic_set_list_intersect(
	 struct isl_basic_set_list *list);

 isl_set *isl_set_list_union( isl_set_list *list);

 isl_basic_set *isl_basic_set_read_from_file(isl_ctx *ctx,
	FILE *input);

 isl_basic_set *isl_basic_set_read_from_str(isl_ctx *ctx,
	const char *str);
 isl_set *isl_set_read_from_file(isl_ctx *ctx, FILE *input);

 isl_set *isl_set_read_from_str(isl_ctx *ctx, const char *str);
void isl_basic_set_dump( isl_basic_set *bset);
void isl_set_dump( isl_set *set);
 isl_printer *isl_printer_print_basic_set(
	 isl_printer *printer,  isl_basic_set *bset);
 isl_printer *isl_printer_print_set( isl_printer *printer,
	 isl_set *map);
 isl_basic_set *isl_basic_set_fix_si( isl_basic_set *bset,
		enum isl_dim_type type, unsigned pos, int value);
 isl_basic_set *isl_basic_set_fix_val( isl_basic_set *bset,
	enum isl_dim_type type, unsigned pos,  isl_val *v);
 isl_set *isl_set_fix_si( isl_set *set,
		enum isl_dim_type type, unsigned pos, int value);
 isl_set *isl_set_lower_bound_si( isl_set *set,
		enum isl_dim_type type, unsigned pos, int value);
 isl_basic_set *isl_basic_set_lower_bound_val(
	 isl_basic_set *bset, enum isl_dim_type type, unsigned pos,
	 isl_val *value);
 isl_set *isl_set_lower_bound_val( isl_set *set,
	enum isl_dim_type type, unsigned pos,  isl_val *value);
 isl_set *isl_set_upper_bound_si( isl_set *set,
	enum isl_dim_type type, unsigned pos, int value);
 isl_basic_set *isl_basic_set_upper_bound_val(
	 isl_basic_set *bset, enum isl_dim_type type, unsigned pos,
	 isl_val *value);
 isl_set *isl_set_upper_bound_val( isl_set *set,
	enum isl_dim_type type, unsigned pos,  isl_val *value);

 isl_set *isl_set_lower_bound_multi_val( isl_set *set,
	 isl_multi_val *lower);

 isl_set *isl_set_upper_bound_multi_val( isl_set *set,
	 isl_multi_val *upper);

 isl_set *isl_set_lower_bound_multi_pw_aff( isl_set *set,
	 isl_multi_pw_aff *lower);

 isl_set *isl_set_upper_bound_multi_pw_aff( isl_set *set,
	 isl_multi_pw_aff *upper);

 isl_set *isl_set_equate( isl_set *set,
	enum isl_dim_type type1, int pos1, enum isl_dim_type type2, int pos2);

extern
isl_bool isl_basic_set_is_equal( isl_basic_set *bset1,
	 isl_basic_set *bset2);
isl_bool isl_basic_set_is_disjoint( isl_basic_set *bset1,
	 isl_basic_set *bset2);

 isl_set *isl_basic_set_partial_lexmin(
		 isl_basic_set *bset,  isl_basic_set *dom,
		 isl_set **empty);
 isl_set *isl_basic_set_partial_lexmax(
		 isl_basic_set *bset,  isl_basic_set *dom,
		 isl_set **empty);
 isl_set *isl_set_partial_lexmin(
		 isl_set *set,  isl_set *dom,
		 isl_set **empty);
 isl_set *isl_set_partial_lexmax(
		 isl_set *set,  isl_set *dom,
		 isl_set **empty);
extern
 isl_set *isl_basic_set_lexmin( isl_basic_set *bset);
extern
 isl_set *isl_basic_set_lexmax( isl_basic_set *bset);
extern
 isl_set *isl_set_lexmin( isl_set *set);
extern
 isl_set *isl_set_lexmax( isl_set *set);
 isl_pw_multi_aff *isl_basic_set_partial_lexmin_pw_multi_aff(
	 isl_basic_set *bset,  isl_basic_set *dom,
	 isl_set **empty);
 isl_pw_multi_aff *isl_basic_set_partial_lexmax_pw_multi_aff(
	 isl_basic_set *bset,  isl_basic_set *dom,
	 isl_set **empty);
extern
 isl_pw_multi_aff *isl_set_lexmin_pw_multi_aff(
	 isl_set *set);
extern
 isl_pw_multi_aff *isl_set_lexmax_pw_multi_aff(
	 isl_set *set);
extern
 isl_multi_pw_aff *isl_set_min_multi_pw_aff( isl_set *set);
extern
 isl_multi_pw_aff *isl_set_max_multi_pw_aff( isl_set *set);

extern
 isl_set *isl_basic_set_union(
		 isl_basic_set *bset1,
		 isl_basic_set *bset2);

int isl_basic_set_compare_at( isl_basic_set *bset1,
	 isl_basic_set *bset2, int pos);
int isl_set_follows_at( isl_set *set1,
	 isl_set *set2, int pos);

extern
 isl_basic_set *isl_basic_set_params( isl_basic_set *bset);
 isl_basic_set *isl_basic_set_from_params(
	 isl_basic_set *bset);
extern
 isl_set *isl_set_params( isl_set *set);
 isl_set *isl_set_from_params( isl_set *set);

extern
 isl_set *isl_set_bind( isl_set *set,
	 isl_multi_id *tuple);
extern
 isl_set *isl_set_unbind_params( isl_set *set,
	 isl_multi_id *tuple);
extern
 isl_map *isl_set_unbind_params_insert_domain(
	 isl_set *set,  isl_multi_id *domain);

isl_stat isl_basic_set_dims_get_sign( isl_basic_set *bset,
	enum isl_dim_type type, unsigned pos, unsigned n, int *signs);

isl_bool isl_basic_set_plain_is_universe( isl_basic_set *bset);
isl_bool isl_basic_set_is_universe( isl_basic_set *bset);
isl_bool isl_basic_set_plain_is_empty( isl_basic_set *bset);
extern
isl_bool isl_basic_set_is_empty( isl_basic_set *bset);
isl_bool isl_basic_set_is_bounded( isl_basic_set *bset);
extern
isl_bool isl_basic_set_is_subset( isl_basic_set *bset1,
	 isl_basic_set *bset2);
isl_bool isl_basic_set_plain_is_equal( isl_basic_set *bset1,
	 isl_basic_set *bset2);

extern
 isl_set *isl_set_empty( isl_space *space);
extern
 isl_set *isl_set_universe( isl_space *space);
extern
 isl_set *isl_space_universe_set( isl_space *space);
 isl_set *isl_set_nat_universe( isl_space *space);
 isl_set *isl_set_copy( isl_set *set);
 isl_set *isl_set_free( isl_set *set);
extern
 isl_set *isl_basic_set_to_set( isl_basic_set *bset);

 isl_set *isl_set_from_basic_set( isl_basic_set *bset);
extern
 isl_basic_set *isl_set_sample( isl_set *set);
extern
 isl_point *isl_basic_set_sample_point( isl_basic_set *bset);
extern
 isl_point *isl_set_sample_point( isl_set *set);
extern
 isl_set *isl_set_detect_equalities( isl_set *set);
extern
 isl_basic_set *isl_set_affine_hull( isl_set *set);
 isl_basic_set *isl_set_convex_hull( isl_set *set);
extern
 isl_basic_set *isl_set_polyhedral_hull( isl_set *set);
 isl_basic_set *isl_set_simple_hull( isl_set *set);
extern
 isl_basic_set *isl_set_unshifted_simple_hull(
	 isl_set *set);
 isl_basic_set *isl_set_plain_unshifted_simple_hull(
	 isl_set *set);
 isl_basic_set *isl_set_unshifted_simple_hull_from_set_list(
	 isl_set *set,  isl_set_list *list);
 isl_basic_set *isl_set_bounded_simple_hull( isl_set *set);

extern
 isl_set *isl_set_wrapped_reverse( isl_set *set);
 isl_set *isl_set_union_disjoint(
	 isl_set *set1,  isl_set *set2);
extern
 isl_set *isl_set_union(
		 isl_set *set1,
		 isl_set *set2);
extern
 isl_set *isl_set_product( isl_set *set1,
	 isl_set *set2);
 isl_basic_set *isl_basic_set_flat_product(
	 isl_basic_set *bset1,  isl_basic_set *bset2);
 isl_set *isl_set_flat_product( isl_set *set1,
	 isl_set *set2);
extern
 isl_set *isl_set_intersect(
		 isl_set *set1,
		 isl_set *set2);
extern
 isl_set *isl_set_intersect_params( isl_set *set,
		 isl_set *params);
 isl_set *isl_set_intersect_factor_domain( isl_set *set,
	 isl_set *domain);
 isl_set *isl_set_intersect_factor_range( isl_set *set,
	 isl_set *range);
extern
 isl_set *isl_set_subtract(
		 isl_set *set1,
		 isl_set *set2);
extern
 isl_set *isl_set_complement( isl_set *set);
extern
 isl_set *isl_set_apply(
		 isl_set *set,
		 isl_map *map);

 isl_set *isl_set_preimage_multi_aff( isl_set *set,
	 isl_multi_aff *ma);

 isl_set *isl_set_preimage_pw_multi_aff( isl_set *set,
	 isl_pw_multi_aff *pma);

 isl_set *isl_set_preimage_multi_pw_aff( isl_set *set,
	 isl_multi_pw_aff *mpa);
 isl_set *isl_set_fix_val( isl_set *set,
	enum isl_dim_type type, unsigned pos,  isl_val *v);
 isl_set *isl_set_fix_dim_si( isl_set *set,
		unsigned dim, int value);
 isl_basic_set *isl_basic_set_insert_dims(
	 isl_basic_set *bset,
	enum isl_dim_type type, unsigned pos, unsigned n);
 isl_set *isl_set_insert_dims( isl_set *set,
		enum isl_dim_type type, unsigned pos, unsigned n);
 isl_basic_set *isl_basic_set_add_dims( isl_basic_set *bset,
		enum isl_dim_type type, unsigned n);
 isl_set *isl_set_add_dims( isl_set *set,
		enum isl_dim_type type, unsigned n);
 isl_basic_set *isl_basic_set_move_dims( isl_basic_set *bset,
	enum isl_dim_type dst_type, unsigned dst_pos,
	enum isl_dim_type src_type, unsigned src_pos, unsigned n);
 isl_set *isl_set_move_dims( isl_set *set,
	enum isl_dim_type dst_type, unsigned dst_pos,
	enum isl_dim_type src_type, unsigned src_pos, unsigned n);
 isl_basic_set *isl_basic_set_project_out(
		 isl_basic_set *bset,
		enum isl_dim_type type, unsigned first, unsigned n);

 isl_set *isl_set_project_out_param_id( isl_set *set,
	 isl_id *id);

 isl_set *isl_set_project_out_param_id_list( isl_set *set,
	 isl_id_list *list);
 isl_set *isl_set_project_out( isl_set *set,
		enum isl_dim_type type, unsigned first, unsigned n);
extern
 isl_set *isl_set_project_out_all_params( isl_set *set);
 isl_map *isl_set_project_onto_map( isl_set *set,
	enum isl_dim_type type, unsigned first, unsigned n);
 isl_basic_set *isl_basic_set_remove_divs(
	 isl_basic_set *bset);
 isl_basic_set *isl_basic_set_eliminate(
	 isl_basic_set *bset,
	enum isl_dim_type type, unsigned first, unsigned n);
 isl_set *isl_set_eliminate( isl_set *set,
	enum isl_dim_type type, unsigned first, unsigned n);
 isl_set *isl_set_eliminate_dims( isl_set *set,
		unsigned first, unsigned n);
 isl_set *isl_set_remove_dims( isl_set *bset,
	enum isl_dim_type type, unsigned first, unsigned n);
 isl_basic_set *isl_basic_set_remove_divs_involving_dims(
	 isl_basic_set *bset,
	enum isl_dim_type type, unsigned first, unsigned n);
 isl_set *isl_set_remove_divs_involving_dims( isl_set *set,
	enum isl_dim_type type, unsigned first, unsigned n);
 isl_basic_set *isl_basic_set_remove_unknown_divs(
	 isl_basic_set *bset);
 isl_set *isl_set_remove_unknown_divs( isl_set *set);
 isl_set *isl_set_remove_divs( isl_set *set);
 isl_set *isl_set_split_dims( isl_set *set,
	enum isl_dim_type type, unsigned first, unsigned n);

 isl_basic_set *isl_basic_set_drop_constraints_involving_dims(
	 isl_basic_set *bset,
	enum isl_dim_type type, unsigned first, unsigned n);
 isl_basic_set *isl_basic_set_drop_constraints_not_involving_dims(
	 isl_basic_set *bset,
	enum isl_dim_type type, unsigned first, unsigned n);
 isl_set *isl_set_drop_constraints_involving_dims(
	 isl_set *set,
	enum isl_dim_type type, unsigned first, unsigned n);
 isl_set *isl_set_drop_constraints_not_involving_dims(
	 isl_set *set,
	enum isl_dim_type type, unsigned first, unsigned n);

extern
isl_bool isl_set_involves_locals( isl_set *set);

isl_bool isl_basic_set_involves_dims( isl_basic_set *bset,
	enum isl_dim_type type, unsigned first, unsigned n);
isl_bool isl_set_involves_dims( isl_set *set,
	enum isl_dim_type type, unsigned first, unsigned n);

void isl_set_print_internal( isl_set *set, FILE *out, int indent);
isl_bool isl_set_plain_is_empty( isl_set *set);
isl_bool isl_set_plain_is_universe( isl_set *set);
isl_bool isl_set_is_params( isl_set *set);
extern
isl_bool isl_set_is_empty( isl_set *set);
isl_bool isl_set_is_bounded( isl_set *set);
extern
isl_bool isl_set_is_subset( isl_set *set1,  isl_set *set2);
extern
isl_bool isl_set_is_strict_subset( isl_set *set1,
	 isl_set *set2);
extern
isl_bool isl_set_is_equal( isl_set *set1,  isl_set *set2);
extern
isl_bool isl_set_is_disjoint( isl_set *set1,
	 isl_set *set2);
extern
isl_bool isl_set_is_singleton( isl_set *set);
isl_bool isl_set_is_box( isl_set *set);
isl_bool isl_set_has_equal_space( isl_set *set1,
	 isl_set *set2);

 isl_set *isl_set_sum( isl_set *set1,
	 isl_set *set2);
 isl_basic_set *isl_basic_set_neg( isl_basic_set *bset);
 isl_set *isl_set_neg( isl_set *set);

 isl_set *isl_set_make_disjoint( isl_set *set);
 isl_set *isl_basic_set_compute_divs( isl_basic_set *bset);
 isl_set *isl_set_compute_divs( isl_set *set);
ISL_DEPRECATED
 isl_set *isl_set_align_divs( isl_set *set);

extern
 isl_multi_val *isl_set_get_plain_multi_val_if_fixed(
	 isl_set *set);
 isl_val *isl_set_plain_get_val_if_fixed( isl_set *set,
	enum isl_dim_type type, unsigned pos);
isl_bool isl_set_dim_is_bounded( isl_set *set,
	enum isl_dim_type type, unsigned pos);
isl_bool isl_set_dim_has_lower_bound( isl_set *set,
	enum isl_dim_type type, unsigned pos);
isl_bool isl_set_dim_has_upper_bound( isl_set *set,
	enum isl_dim_type type, unsigned pos);
isl_bool isl_set_dim_has_any_lower_bound( isl_set *set,
	enum isl_dim_type type, unsigned pos);
isl_bool isl_set_dim_has_any_upper_bound( isl_set *set,
	enum isl_dim_type type, unsigned pos);

extern
 isl_basic_set *isl_basic_set_gist( isl_basic_set *bset,
					     isl_basic_set *context);
 isl_set *isl_set_gist_basic_set( isl_set *set,
	 isl_basic_set *context);
extern
 isl_set *isl_set_gist( isl_set *set,
	 isl_set *context);
extern
 isl_set *isl_set_gist_params( isl_set *set,
	 isl_set *context);
isl_stat isl_set_dim_residue_class_val( isl_set *set,
	int pos,  isl_val **modulo,  isl_val **residue);

 isl_stride_info *isl_set_get_stride_info( isl_set *set,
	int pos);
extern
 isl_val *isl_set_get_stride( isl_set *set, int pos);
extern
 isl_fixed_box *isl_set_get_lattice_tile( isl_set *set);
extern
 isl_fixed_box *isl_set_get_simple_fixed_box_hull(
	 isl_set *set);

extern
 isl_set *isl_set_coalesce( isl_set *set);

int isl_set_plain_cmp( isl_set *set1,  isl_set *set2);
isl_bool isl_set_plain_is_equal( isl_set *set1,
	 isl_set *set2);
isl_bool isl_set_plain_is_disjoint( isl_set *set1,
	 isl_set *set2);

uint32_t isl_set_get_hash( isl_set *set);

extern
isl_size isl_set_n_basic_set( isl_set *set);
extern
isl_stat isl_set_foreach_basic_set( isl_set *set,
	isl_stat (*fn)( isl_basic_set *bset, void *user), void *user);
 isl_basic_set_list *isl_set_get_basic_set_list(
	 isl_set *set);

extern
isl_stat isl_set_foreach_point( isl_set *set,
	isl_stat (*fn)( isl_point *pnt, void *user), void *user);
 isl_val *isl_set_count_val( isl_set *set);


 isl_basic_set *isl_basic_set_from_point( isl_point *pnt);
extern
 isl_set *isl_point_to_set( isl_point *pnt);

 isl_set *isl_set_from_point( isl_point *pnt);
 isl_basic_set *isl_basic_set_box_from_points(
	 isl_point *pnt1,  isl_point *pnt2);
 isl_set *isl_set_box_from_points( isl_point *pnt1,
	 isl_point *pnt2);

 isl_basic_set *isl_basic_set_lift( isl_basic_set *bset);
 isl_set *isl_set_lift( isl_set *set);

 isl_map *isl_set_lex_le_set( isl_set *set1,
	 isl_set *set2);
 isl_map *isl_set_lex_lt_set( isl_set *set1,
	 isl_set *set2);
 isl_map *isl_set_lex_ge_set( isl_set *set1,
	 isl_set *set2);
 isl_map *isl_set_lex_gt_set( isl_set *set1,
	 isl_set *set2);

int isl_set_size( isl_set *set);

 isl_basic_set *isl_basic_set_align_params(
	 isl_basic_set *bset,  isl_space *model);
 isl_set *isl_set_align_params( isl_set *set,
	 isl_space *model);
 isl_basic_set *isl_basic_set_drop_unused_params(
	 isl_basic_set *bset);
extern
 isl_set *isl_set_drop_unused_params( isl_set *set);

 isl_mat *isl_basic_set_equalities_matrix(
	 isl_basic_set *bset, enum isl_dim_type c1,
	enum isl_dim_type c2, enum isl_dim_type c3, enum isl_dim_type c4);
 isl_mat *isl_basic_set_inequalities_matrix(
	 isl_basic_set *bset, enum isl_dim_type c1,
	enum isl_dim_type c2, enum isl_dim_type c3, enum isl_dim_type c4);
 isl_basic_set *isl_basic_set_from_constraint_matrices(
	 isl_space *space,
	 isl_mat *eq,  isl_mat *ineq, enum isl_dim_type c1,
	enum isl_dim_type c2, enum isl_dim_type c3, enum isl_dim_type c4);

 isl_basic_set *isl_basic_set_from_multi_aff(
	 isl_multi_aff *ma);

extern
 isl_set *isl_multi_aff_as_set( isl_multi_aff *ma);
 isl_set *isl_set_from_multi_aff( isl_multi_aff *ma);

 isl_mat *isl_basic_set_reduced_basis( isl_basic_set *bset);

 isl_basic_set *isl_basic_set_coefficients(
	 isl_basic_set *bset);
 isl_basic_set_list *isl_basic_set_list_coefficients(
	 isl_basic_set_list *list);
 isl_basic_set *isl_set_coefficients( isl_set *set);
 isl_basic_set *isl_basic_set_solutions(
	 isl_basic_set *bset);
 isl_basic_set *isl_set_solutions( isl_set *set);

 isl_pw_aff *isl_set_dim_max( isl_set *set, int pos);
 isl_pw_aff *isl_set_dim_min( isl_set *set, int pos);

 char *isl_basic_set_to_str( isl_basic_set *bset);
 char *isl_set_to_str( isl_set *set);

#if defined(__cplusplus)
}
#endif

#endif
