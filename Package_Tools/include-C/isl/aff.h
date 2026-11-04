#ifndef ISL_AFF_H
#define ISL_AFF_H

#include <isl/stdint.h>
#include <isl/local_space.h>
#include <isl/printer.h>
#include <isl/id_type.h>
#include <isl/set_type.h>
#include <isl/aff_type.h>
#include <isl/list.h>
#include <isl/multi.h>
#include <isl/union_set_type.h>
#include <isl/val_type.h>
#include <isl/point.h>

#if defined(__cplusplus)

#endif


 isl_aff *isl_aff_zero_on_domain_space( isl_space *space);
extern
 isl_aff *isl_space_zero_aff_on_domain( isl_space *space);
 isl_aff *isl_aff_zero_on_domain( isl_local_space *ls);
 isl_aff *isl_aff_val_on_domain_space( isl_space *space,
	 isl_val *val);
 isl_aff *isl_aff_val_on_domain( isl_local_space *ls,
	 isl_val *val);
 isl_aff *isl_aff_var_on_domain( isl_local_space *ls,
	enum isl_dim_type type, unsigned pos);
 isl_aff *isl_aff_nan_on_domain_space( isl_space *space);
 isl_aff *isl_aff_nan_on_domain( isl_local_space *ls);
 isl_aff *isl_aff_param_on_domain_space_id(
	 isl_space *space,  isl_id *id);

 isl_aff *isl_space_param_aff_on_domain_id(
	 isl_space *space,  isl_id *id);

 isl_aff *isl_aff_copy( isl_aff *aff);
 isl_aff *isl_aff_free( isl_aff *aff);

isl_ctx *isl_aff_get_ctx( isl_aff *aff);
uint32_t isl_aff_get_hash( isl_aff *aff);

isl_bool isl_aff_involves_locals( isl_aff *aff);

isl_size isl_aff_dim( isl_aff *aff, enum isl_dim_type type);
isl_bool isl_aff_involves_dims( isl_aff *aff,
	enum isl_dim_type type, unsigned first, unsigned n);

 isl_space *isl_aff_get_domain_space( isl_aff *aff);
 isl_space *isl_aff_get_space( isl_aff *aff);
 isl_local_space *isl_aff_get_domain_local_space(
	 isl_aff *aff);
 isl_local_space *isl_aff_get_local_space( isl_aff *aff);

const char *isl_aff_get_dim_name( isl_aff *aff,
	enum isl_dim_type type, unsigned pos);
extern
 isl_val *isl_aff_get_constant_val( isl_aff *aff);
 isl_val *isl_aff_get_coefficient_val( isl_aff *aff,
	enum isl_dim_type type, int pos);
int isl_aff_coefficient_sgn( isl_aff *aff,
	enum isl_dim_type type, int pos);
 isl_val *isl_aff_get_denominator_val( isl_aff *aff);
 isl_aff *isl_aff_set_constant_si( isl_aff *aff, int v);
 isl_aff *isl_aff_set_constant_val( isl_aff *aff,
	 isl_val *v);
 isl_aff *isl_aff_set_coefficient_si( isl_aff *aff,
	enum isl_dim_type type, int pos, int v);
 isl_aff *isl_aff_set_coefficient_val( isl_aff *aff,
	enum isl_dim_type type, int pos,  isl_val *v);
 isl_aff *isl_aff_add_constant_si( isl_aff *aff, int v);

 isl_aff *isl_aff_add_constant_val( isl_aff *aff,
	 isl_val *v);
 isl_aff *isl_aff_add_constant_num_si( isl_aff *aff, int v);
 isl_aff *isl_aff_add_coefficient_si( isl_aff *aff,
	enum isl_dim_type type, int pos, int v);
 isl_aff *isl_aff_add_coefficient_val( isl_aff *aff,
	enum isl_dim_type type, int pos,  isl_val *v);

extern
isl_bool isl_aff_is_cst( isl_aff *aff);

 isl_aff *isl_aff_set_tuple_id( isl_aff *aff,
	enum isl_dim_type type,  isl_id *id);
 isl_aff *isl_aff_set_dim_name( isl_aff *aff,
	enum isl_dim_type type, unsigned pos, const char *s);
 isl_aff *isl_aff_set_dim_id( isl_aff *aff,
	enum isl_dim_type type, unsigned pos,  isl_id *id);

int isl_aff_find_dim_by_name( isl_aff *aff, enum isl_dim_type type,
	const char *name);

extern
isl_bool isl_aff_plain_is_equal( isl_aff *aff1,
	 isl_aff *aff2);
isl_bool isl_aff_plain_is_zero( isl_aff *aff);
isl_bool isl_aff_is_nan( isl_aff *aff);

 isl_aff *isl_aff_get_div( isl_aff *aff, int pos);

 isl_aff *isl_aff_from_range( isl_aff *aff);

extern
 isl_aff *isl_aff_neg( isl_aff *aff);
extern
 isl_aff *isl_aff_ceil( isl_aff *aff);
extern
 isl_aff *isl_aff_floor( isl_aff *aff);

 isl_aff *isl_aff_mod_val( isl_aff *aff,
	 isl_val *mod);

extern
 isl_aff *isl_aff_mul( isl_aff *aff1,
	 isl_aff *aff2);
extern
 isl_aff *isl_aff_div( isl_aff *aff1,
	 isl_aff *aff2);
extern
 isl_aff *isl_aff_add( isl_aff *aff1,
	 isl_aff *aff2);
extern
 isl_aff *isl_aff_sub( isl_aff *aff1,
	 isl_aff *aff2);


 isl_aff *isl_aff_scale_val( isl_aff *aff,
	 isl_val *v);
 isl_aff *isl_aff_scale_down_ui( isl_aff *aff, unsigned f);

 isl_aff *isl_aff_scale_down_val( isl_aff *aff,
	 isl_val *v);

extern
 isl_aff *isl_aff_domain_reverse( isl_aff *aff);
 isl_aff *isl_aff_insert_dims( isl_aff *aff,
	enum isl_dim_type type, unsigned first, unsigned n);
 isl_aff *isl_aff_add_dims( isl_aff *aff,
	enum isl_dim_type type, unsigned n);
 isl_aff *isl_aff_move_dims( isl_aff *aff,
	enum isl_dim_type dst_type, unsigned dst_pos,
	enum isl_dim_type src_type, unsigned src_pos, unsigned n);
 isl_aff *isl_aff_drop_dims( isl_aff *aff,
	enum isl_dim_type type, unsigned first, unsigned n);
 isl_aff *isl_aff_project_domain_on_params( isl_aff *aff);
extern
 isl_aff *isl_aff_unbind_params_insert_domain(
	 isl_aff *aff,  isl_multi_id *domain);

 isl_aff *isl_aff_align_params( isl_aff *aff,
	 isl_space *model);

extern
 isl_aff *isl_aff_gist( isl_aff *aff,
	 isl_set *context);
extern
 isl_aff *isl_aff_gist_params( isl_aff *aff,
	 isl_set *context);

extern
 isl_val *isl_aff_eval( isl_aff *aff,
	 isl_point *pnt);

 isl_aff *isl_aff_pullback_aff( isl_aff *aff1,
	 isl_aff *aff2);

 isl_aff *isl_aff_pullback_multi_aff( isl_aff *aff,
	 isl_multi_aff *ma);

 isl_basic_set *isl_aff_zero_basic_set( isl_aff *aff);
 isl_basic_set *isl_aff_neg_basic_set( isl_aff *aff);

 isl_basic_set *isl_aff_eq_basic_set( isl_aff *aff1,
	 isl_aff *aff2);
extern
 isl_set *isl_aff_eq_set( isl_aff *aff1,
	 isl_aff *aff2);
extern
 isl_set *isl_aff_ne_set( isl_aff *aff1,
	 isl_aff *aff2);
 isl_basic_set *isl_aff_le_basic_set( isl_aff *aff1,
	 isl_aff *aff2);
extern
 isl_set *isl_aff_le_set( isl_aff *aff1,
	 isl_aff *aff2);
 isl_basic_set *isl_aff_lt_basic_set( isl_aff *aff1,
	 isl_aff *aff2);
extern
 isl_set *isl_aff_lt_set( isl_aff *aff1,
	 isl_aff *aff2);
 isl_basic_set *isl_aff_ge_basic_set( isl_aff *aff1,
	 isl_aff *aff2);
extern
 isl_set *isl_aff_ge_set( isl_aff *aff1,
	 isl_aff *aff2);
 isl_basic_set *isl_aff_gt_basic_set( isl_aff *aff1,
	 isl_aff *aff2);
extern
 isl_set *isl_aff_gt_set( isl_aff *aff1,
	 isl_aff *aff2);


 isl_basic_set *isl_aff_bind_id( isl_aff *aff,
	 isl_id *id);


 isl_aff *isl_aff_read_from_str(isl_ctx *ctx, const char *str);
 char *isl_aff_to_str( isl_aff *aff);
 isl_printer *isl_printer_print_aff( isl_printer *p,
	 isl_aff *aff);
void isl_aff_dump( isl_aff *aff);

isl_ctx *isl_pw_aff_get_ctx( isl_pw_aff *pwaff);
uint32_t isl_pw_aff_get_hash( isl_pw_aff *pa);
 isl_space *isl_pw_aff_get_domain_space( isl_pw_aff *pwaff);
extern
 isl_space *isl_pw_aff_get_space( isl_pw_aff *pwaff);


 isl_pw_aff *isl_pw_aff_from_aff( isl_aff *aff);
 isl_pw_aff *isl_pw_aff_empty( isl_space *space);
 isl_pw_aff *isl_pw_aff_alloc( isl_set *set,
	 isl_aff *aff);
 isl_pw_aff *isl_pw_aff_zero_on_domain(
	 isl_local_space *ls);
 isl_pw_aff *isl_pw_aff_var_on_domain( isl_local_space *ls,
	enum isl_dim_type type, unsigned pos);
 isl_pw_aff *isl_pw_aff_nan_on_domain_space(
	 isl_space *space);
 isl_pw_aff *isl_pw_aff_nan_on_domain( isl_local_space *ls);
 isl_pw_aff *isl_pw_aff_val_on_domain( isl_set *domain,
	 isl_val *v);

 isl_pw_aff *isl_set_pw_aff_on_domain_val( isl_set *domain,
	 isl_val *v);

 isl_pw_aff *isl_pw_aff_param_on_domain_id(
	 isl_set *domain,  isl_id *id);

 isl_pw_aff *isl_set_param_pw_aff_on_domain_id(
	 isl_set *domain,  isl_id *id);

extern
 isl_pw_aff *isl_set_indicator_function( isl_set *set);

const char *isl_pw_aff_get_dim_name( isl_pw_aff *pa,
	enum isl_dim_type type, unsigned pos);
isl_bool isl_pw_aff_has_dim_id( isl_pw_aff *pa,
	enum isl_dim_type type, unsigned pos);
 isl_id *isl_pw_aff_get_dim_id( isl_pw_aff *pa,
	enum isl_dim_type type, unsigned pos);
 isl_pw_aff *isl_pw_aff_set_dim_id( isl_pw_aff *pma,
	enum isl_dim_type type, unsigned pos,  isl_id *id);

int isl_pw_aff_find_dim_by_name( isl_pw_aff *pa,
	enum isl_dim_type type, const char *name);

isl_bool isl_pw_aff_is_empty( isl_pw_aff *pwaff);
isl_bool isl_pw_aff_involves_nan( isl_pw_aff *pa);
int isl_pw_aff_plain_cmp( isl_pw_aff *pa1,
	 isl_pw_aff *pa2);
extern
isl_bool isl_pw_aff_plain_is_equal( isl_pw_aff *pwaff1,
	 isl_pw_aff *pwaff2);
isl_bool isl_pw_aff_is_equal( isl_pw_aff *pa1,
	 isl_pw_aff *pa2);

 isl_pw_aff *isl_pw_aff_union_min( isl_pw_aff *pwaff1,
	 isl_pw_aff *pwaff2);
 isl_pw_aff *isl_pw_aff_union_max( isl_pw_aff *pwaff1,
	 isl_pw_aff *pwaff2);
extern
 isl_pw_aff *isl_pw_aff_union_add( isl_pw_aff *pwaff1,
	 isl_pw_aff *pwaff2);

 isl_pw_aff *isl_pw_aff_copy( isl_pw_aff *pwaff);
 isl_pw_aff *isl_pw_aff_free( isl_pw_aff *pwaff);

isl_size isl_pw_aff_dim( isl_pw_aff *pwaff, enum isl_dim_type type);
isl_bool isl_pw_aff_involves_param_id( isl_pw_aff *pa,
	 isl_id *id);
isl_bool isl_pw_aff_involves_dims( isl_pw_aff *pwaff,
	enum isl_dim_type type, unsigned first, unsigned n);

isl_bool isl_pw_aff_is_cst( isl_pw_aff *pwaff);

extern
 isl_pw_aff *isl_pw_aff_insert_domain( isl_pw_aff *pa,
	 isl_space *domain);
 isl_pw_aff *isl_pw_aff_project_domain_on_params(
	 isl_pw_aff *pa);

 isl_pw_aff *isl_pw_aff_align_params( isl_pw_aff *pwaff,
	 isl_space *model);
extern
 isl_pw_aff *isl_pw_aff_drop_unused_params(
	 isl_pw_aff *pa);

isl_bool isl_pw_aff_has_tuple_id( isl_pw_aff *pa,
	enum isl_dim_type type);
 isl_id *isl_pw_aff_get_tuple_id( isl_pw_aff *pa,
	enum isl_dim_type type);
 isl_pw_aff *isl_pw_aff_set_tuple_id( isl_pw_aff *pwaff,
	enum isl_dim_type type,  isl_id *id);
 isl_pw_aff *isl_pw_aff_reset_tuple_id( isl_pw_aff *pa,
	enum isl_dim_type type);
 isl_pw_aff *isl_pw_aff_reset_user( isl_pw_aff *pa);

extern
 isl_set *isl_pw_aff_params( isl_pw_aff *pwa);
extern
 isl_set *isl_pw_aff_domain( isl_pw_aff *pwaff);
 isl_pw_aff *isl_pw_aff_from_range( isl_pw_aff *pwa);

extern
 isl_pw_aff *isl_pw_aff_min( isl_pw_aff *pwaff1,
	 isl_pw_aff *pwaff2);
extern
 isl_pw_aff *isl_pw_aff_max( isl_pw_aff *pwaff1,
	 isl_pw_aff *pwaff2);
extern
 isl_pw_aff *isl_pw_aff_mul( isl_pw_aff *pwaff1,
	 isl_pw_aff *pwaff2);
extern
 isl_pw_aff *isl_pw_aff_div( isl_pw_aff *pa1,
	 isl_pw_aff *pa2);
extern
 isl_pw_aff *isl_pw_aff_add( isl_pw_aff *pwaff1,
	 isl_pw_aff *pwaff2);
extern
 isl_pw_aff *isl_pw_aff_sub( isl_pw_aff *pwaff1,
	 isl_pw_aff *pwaff2);
extern
 isl_pw_aff *isl_pw_aff_neg( isl_pw_aff *pwaff);
extern
 isl_pw_aff *isl_pw_aff_ceil( isl_pw_aff *pwaff);
extern
 isl_pw_aff *isl_pw_aff_floor( isl_pw_aff *pwaff);

 isl_pw_aff *isl_pw_aff_mod_val( isl_pw_aff *pa,
	 isl_val *mod);
extern
 isl_pw_aff *isl_pw_aff_tdiv_q( isl_pw_aff *pa1,
	 isl_pw_aff *pa2);
extern
 isl_pw_aff *isl_pw_aff_tdiv_r( isl_pw_aff *pa1,
	 isl_pw_aff *pa2);

extern
 isl_pw_aff *isl_pw_aff_intersect_params( isl_pw_aff *pa,
	 isl_set *set);
extern
 isl_pw_aff *isl_pw_aff_intersect_domain( isl_pw_aff *pa,
	 isl_set *set);
 isl_pw_aff *isl_pw_aff_intersect_domain_wrapped_domain(
	 isl_pw_aff *pa,  isl_set *set);
 isl_pw_aff *isl_pw_aff_intersect_domain_wrapped_range(
	 isl_pw_aff *pa,  isl_set *set);
extern
 isl_pw_aff *isl_pw_aff_subtract_domain( isl_pw_aff *pa,
	 isl_set *set);

extern
 isl_pw_aff *isl_pw_aff_cond( isl_pw_aff *cond,
	 isl_pw_aff *pwaff_true,  isl_pw_aff *pwaff_false);


 isl_pw_aff *isl_pw_aff_add_constant_val( isl_pw_aff *pa,
	 isl_val *v);

 isl_pw_aff *isl_pw_aff_scale_val( isl_pw_aff *pa,
	 isl_val *v);

 isl_pw_aff *isl_pw_aff_scale_down_val( isl_pw_aff *pa,
	 isl_val *f);

extern
 isl_pw_aff *isl_pw_aff_domain_reverse( isl_pw_aff *pa);
 isl_pw_aff *isl_pw_aff_insert_dims( isl_pw_aff *pwaff,
	enum isl_dim_type type, unsigned first, unsigned n);
 isl_pw_aff *isl_pw_aff_add_dims( isl_pw_aff *pwaff,
	enum isl_dim_type type, unsigned n);
 isl_pw_aff *isl_pw_aff_move_dims( isl_pw_aff *pa,
	enum isl_dim_type dst_type, unsigned dst_pos,
	enum isl_dim_type src_type, unsigned src_pos, unsigned n);
 isl_pw_aff *isl_pw_aff_drop_dims( isl_pw_aff *pwaff,
	enum isl_dim_type type, unsigned first, unsigned n);

extern
 isl_pw_aff *isl_pw_aff_coalesce( isl_pw_aff *pa);
extern
 isl_pw_aff *isl_pw_aff_gist( isl_pw_aff *pwaff,
	 isl_set *context);
extern
 isl_pw_aff *isl_pw_aff_gist_params( isl_pw_aff *pwaff,
	 isl_set *context);

extern
 isl_val *isl_pw_aff_eval( isl_pw_aff *pa,
	 isl_point *pnt);


 isl_pw_aff *isl_pw_aff_pullback_multi_aff(
	 isl_pw_aff *pa,  isl_multi_aff *ma);

 isl_pw_aff *isl_pw_aff_pullback_pw_multi_aff(
	 isl_pw_aff *pa,  isl_pw_multi_aff *pma);

 isl_pw_aff *isl_pw_aff_pullback_multi_pw_aff(
	 isl_pw_aff *pa,  isl_multi_pw_aff *mpa);

isl_size isl_pw_aff_n_piece( isl_pw_aff *pwaff);
isl_stat isl_pw_aff_foreach_piece( isl_pw_aff *pwaff,
	isl_stat (*fn)( isl_set *set,  isl_aff *aff,
		    void *user), void *user);
isl_bool isl_pw_aff_every_piece( isl_pw_aff *pa,
	isl_bool (*test)( isl_set *set,  isl_aff *aff,
		void *user), void *user);
extern
isl_bool isl_pw_aff_isa_aff( isl_pw_aff *pa);
extern
 isl_aff *isl_pw_aff_as_aff( isl_pw_aff *pa);

extern
 isl_map *isl_pw_aff_as_map( isl_pw_aff *pa);
 isl_set *isl_set_from_pw_aff( isl_pw_aff *pwaff);
 isl_map *isl_map_from_pw_aff( isl_pw_aff *pwaff);

 isl_set *isl_pw_aff_pos_set( isl_pw_aff *pa);
 isl_set *isl_pw_aff_nonneg_set( isl_pw_aff *pwaff);
 isl_set *isl_pw_aff_zero_set( isl_pw_aff *pwaff);
 isl_set *isl_pw_aff_non_zero_set( isl_pw_aff *pwaff);

extern
 isl_set *isl_pw_aff_eq_set( isl_pw_aff *pwaff1,
	 isl_pw_aff *pwaff2);
extern
 isl_set *isl_pw_aff_ne_set( isl_pw_aff *pwaff1,
	 isl_pw_aff *pwaff2);
extern
 isl_set *isl_pw_aff_le_set( isl_pw_aff *pwaff1,
	 isl_pw_aff *pwaff2);
extern
 isl_set *isl_pw_aff_lt_set( isl_pw_aff *pwaff1,
	 isl_pw_aff *pwaff2);
extern
 isl_set *isl_pw_aff_ge_set( isl_pw_aff *pwaff1,
	 isl_pw_aff *pwaff2);
extern
 isl_set *isl_pw_aff_gt_set( isl_pw_aff *pwaff1,
	 isl_pw_aff *pwaff2);

 isl_map *isl_pw_aff_eq_map( isl_pw_aff *pa1,
	 isl_pw_aff *pa2);
 isl_map *isl_pw_aff_le_map( isl_pw_aff *pa1,
	 isl_pw_aff *pa2);
 isl_map *isl_pw_aff_lt_map( isl_pw_aff *pa1,
	 isl_pw_aff *pa2);
 isl_map *isl_pw_aff_ge_map( isl_pw_aff *pa1,
	 isl_pw_aff *pa2);
 isl_map *isl_pw_aff_gt_map( isl_pw_aff *pa1,
	 isl_pw_aff *pa2);

extern
 isl_pw_aff *isl_pw_aff_bind_domain( isl_pw_aff *pa,
	 isl_multi_id *tuple);
extern
 isl_pw_aff *isl_pw_aff_bind_domain_wrapped_domain(
	 isl_pw_aff *pa,  isl_multi_id *tuple);

 isl_set *isl_pw_aff_bind_id( isl_pw_aff *pa,
	 isl_id *id);


 isl_pw_aff *isl_pw_aff_read_from_str(isl_ctx *ctx, const char *str);
 char *isl_pw_aff_to_str( isl_pw_aff *pa);
 isl_printer *isl_printer_print_pw_aff( isl_printer *p,
	 isl_pw_aff *pwaff);
void isl_pw_aff_dump( isl_pw_aff *pwaff);

 isl_pw_aff *isl_pw_aff_list_min( isl_pw_aff_list *list);
 isl_pw_aff *isl_pw_aff_list_max( isl_pw_aff_list *list);

 isl_set *isl_pw_aff_list_eq_set( isl_pw_aff_list *list1,
	 isl_pw_aff_list *list2);
 isl_set *isl_pw_aff_list_ne_set( isl_pw_aff_list *list1,
	 isl_pw_aff_list *list2);
 isl_set *isl_pw_aff_list_le_set( isl_pw_aff_list *list1,
	 isl_pw_aff_list *list2);
 isl_set *isl_pw_aff_list_lt_set( isl_pw_aff_list *list1,
	 isl_pw_aff_list *list2);
 isl_set *isl_pw_aff_list_ge_set( isl_pw_aff_list *list1,
	 isl_pw_aff_list *list2);
 isl_set *isl_pw_aff_list_gt_set( isl_pw_aff_list *list1,
	 isl_pw_aff_list *list2);

isl_ctx *isl_multi_aff_get_ctx(					
	 isl_multi_aff *multi);				
extern								
 isl_space *isl_multi_aff_get_space(			
	 isl_multi_aff *multi);				
 isl_space *isl_multi_aff_get_domain_space(		
	 isl_multi_aff *multi);				
extern								
 isl_aff_list *isl_multi_aff_get_list(		
	 isl_multi_aff *multi);				
							
 isl_multi_aff *isl_multi_aff_from_aff_list(	
	 isl_space *space,  isl_aff_list *list); 
extern								
 isl_multi_aff *isl_space_multi_aff(			
	 isl_space *space,  isl_aff_list *list); 
 isl_multi_aff *isl_multi_aff_copy(			
	 isl_multi_aff *multi);				
 isl_multi_aff *isl_multi_aff_free(			
	 isl_multi_aff *multi);				
extern								
isl_bool isl_multi_aff_plain_is_equal(				
	 isl_multi_aff *multi1,				
	 isl_multi_aff *multi2);				
 isl_multi_aff *isl_multi_aff_reset_user(		
	 isl_multi_aff *multi);				
extern								
isl_size isl_multi_aff_size( isl_multi_aff *multi);	
extern								
 isl_aff *isl_multi_aff_get_at(			
	 isl_multi_aff *multi, int pos);			
 isl_aff *isl_multi_aff_get_aff(			
	 isl_multi_aff *multi, int pos);			
extern								
 isl_multi_aff *isl_multi_aff_set_at(			
	 isl_multi_aff *multi, int pos,			
	 isl_aff *el);					
 isl_multi_aff *isl_multi_aff_set_aff(		
	 isl_multi_aff *multi, int pos,			
	 isl_aff *el);					
 isl_multi_aff *isl_multi_aff_range_splice(		
	 isl_multi_aff *multi1, unsigned pos,		
	 isl_multi_aff *multi2);				
 isl_multi_aff *isl_multi_aff_flatten_range(		
	 isl_multi_aff *multi);				
extern								
 isl_multi_aff *isl_multi_aff_flat_range_product(	
	 isl_multi_aff *multi1,				
	 isl_multi_aff *multi2);				
extern								
 isl_multi_aff *isl_multi_aff_range_product(		
	 isl_multi_aff *multi1,				
	 isl_multi_aff *multi2);				
 isl_multi_aff *isl_multi_aff_factor_range(		
	 isl_multi_aff *multi);				
isl_bool isl_multi_aff_range_is_wrapping(				
	 isl_multi_aff *multi);				
 isl_multi_aff *isl_multi_aff_range_factor_domain(	
	 isl_multi_aff *multi);				
 isl_multi_aff *isl_multi_aff_range_factor_range(	
	 isl_multi_aff *multi);				
 isl_multi_aff *isl_multi_aff_align_params(		
	 isl_multi_aff *multi,				
	 isl_space *model);					
 isl_multi_aff *isl_multi_aff_from_range(		
	 isl_multi_aff *multi);               
 isl_multi_aff *isl_multi_aff_identity_multi_aff(	
	 isl_multi_aff *multi);				
 isl_multi_aff *isl_multi_aff_identity(		
	 isl_space *space);					
								
 isl_multi_aff *						
isl_multi_aff_identity_on_domain_space(				
	 isl_space *space);					
extern								
 isl_multi_aff *						
isl_space_identity_multi_aff_on_domain(				
	 isl_space *space);   
int isl_multi_aff_plain_cmp( isl_multi_aff *multi1,	
	 isl_multi_aff *multi2);
 isl_multi_aff *isl_multi_aff_scale_val(		
	 isl_multi_aff *multi,  isl_val *v);	
								
 isl_multi_aff *isl_multi_aff_scale_down_val(		
	 isl_multi_aff *multi,  isl_val *v);	
								
 isl_multi_aff *isl_multi_aff_scale_multi_val(	
	 isl_multi_aff *multi,				
	 isl_multi_val *mv);					
								
 isl_multi_aff *isl_multi_aff_scale_down_multi_val(	
	 isl_multi_aff *multi,				
	 isl_multi_val *mv);					
 isl_multi_aff *isl_multi_aff_mod_multi_val(		
	 isl_multi_aff *multi,				
	 isl_multi_val *mv);					
extern								
 isl_multi_aff *isl_multi_aff_add(			
	 isl_multi_aff *multi1,				
	 isl_multi_aff *multi2);				
extern								
 isl_multi_aff *isl_multi_aff_sub(			
	 isl_multi_aff *multi1,				
	 isl_multi_aff *multi2);				
extern								
 isl_multi_aff *isl_multi_aff_neg(		 	
	 isl_multi_aff *multi);      
isl_multi_aff *isl_multi_aff_add_constant_val(	
	 isl_multi_aff *mpa,  isl_val *v);	
								
isl_multi_aff *isl_multi_aff_add_constant_multi_val(	
	 isl_multi_aff *mpa,  isl_multi_val *mv);
extern								
 isl_multi_aff *isl_multi_aff_zero(			
	 isl_space *space);					
extern								
 isl_multi_aff *isl_space_zero_multi_aff(		
	 isl_space *space);
extern								
isl_bool isl_multi_aff_involves_nan(				
	 isl_multi_aff *multi);       
isl_size isl_multi_aff_dim( isl_multi_aff *multi,	
	enum isl_dim_type type);					
 isl_multi_aff *isl_multi_aff_drop_dims(		
	 isl_multi_aff *multi, enum isl_dim_type type,	
	unsigned first, unsigned n);
isl_bool isl_multi_aff_involves_dims(				
	 isl_multi_aff *multi, enum isl_dim_type type,	
	unsigned first, unsigned n);					
 isl_multi_aff *isl_multi_aff_insert_dims(		
	 isl_multi_aff *multi, enum isl_dim_type type,	
	unsigned first, unsigned n);					
 isl_multi_aff *isl_multi_aff_add_dims(		
	 isl_multi_aff *multi, enum isl_dim_type type,	
	unsigned n);							
 isl_multi_aff *						
isl_multi_aff_project_domain_on_params(				
	 isl_multi_aff *multi);           
extern								
 isl_multi_aff *						
isl_multi_aff_insert_domain( isl_multi_aff *multi,	
	 isl_space *domain);     
extern								
isl_bool isl_multi_aff_involves_locals(				
	 isl_multi_aff *multi); 
int isl_multi_aff_find_dim_by_name(				
	 isl_multi_aff *multi,				
	enum isl_dim_type type, const char *name);			
int isl_multi_aff_find_dim_by_id(					
	 isl_multi_aff *multi, enum isl_dim_type type,	
	 isl_id *id);						
 isl_id *isl_multi_aff_get_dim_id(			
	 isl_multi_aff *multi,				
	enum isl_dim_type type, unsigned pos);				
 isl_multi_aff *isl_multi_aff_set_dim_name(		
	 isl_multi_aff *multi,				
	enum isl_dim_type type, unsigned pos, const char *s);		
 isl_multi_aff *isl_multi_aff_set_dim_id(		
	 isl_multi_aff *multi,				
	enum isl_dim_type type, unsigned pos,  isl_id *id);   
const char *isl_multi_aff_get_tuple_name(				
	 isl_multi_aff *multi, enum isl_dim_type type);	
extern								
isl_bool isl_multi_aff_has_range_tuple_id(				
	 isl_multi_aff *multi);				
isl_bool isl_multi_aff_has_tuple_id(				
	 isl_multi_aff *multi, enum isl_dim_type type);	
extern								
 isl_id *isl_multi_aff_get_range_tuple_id(		
	 isl_multi_aff *multi);				
 isl_id *isl_multi_aff_get_tuple_id(			
	 isl_multi_aff *multi, enum isl_dim_type type);	
 isl_multi_aff *isl_multi_aff_set_tuple_name(		
	 isl_multi_aff *multi,				
	enum isl_dim_type type, const char *s);				
								
 isl_multi_aff *isl_multi_aff_set_range_tuple_id(	
	 isl_multi_aff *multi,   isl_id *id);	
 isl_multi_aff *isl_multi_aff_set_tuple_id(		
	 isl_multi_aff *multi,				
	enum isl_dim_type type,  isl_id *id);			
extern								
 isl_multi_aff *isl_multi_aff_reset_range_tuple_id(	
	 isl_multi_aff *multi);				
 isl_multi_aff *isl_multi_aff_reset_tuple_id(		
	 isl_multi_aff *multi, enum isl_dim_type type);    
extern								
 isl_multi_aff *isl_multi_aff_product(		
	 isl_multi_aff *multi1,				
	 isl_multi_aff *multi2);				
 isl_multi_aff *isl_multi_aff_splice(			
	 isl_multi_aff *multi1, unsigned in_pos,		
	unsigned out_pos,  isl_multi_aff *multi2);  
extern								
 isl_multi_aff *isl_multi_aff_bind_domain(		
	 isl_multi_aff *multi,				
	 isl_multi_id *tuple);				
extern								
 isl_multi_aff *						
isl_multi_aff_bind_domain_wrapped_domain(				
	 isl_multi_aff *multi,				
	 isl_multi_id *tuple);     
extern								
 isl_multi_aff *						
isl_multi_aff_unbind_params_insert_domain(				
	 isl_multi_aff *multi,				
	 isl_multi_id *domain);
extern								
 isl_multi_aff *isl_multi_aff_domain_reverse(		
	 isl_multi_aff *multi);


 isl_multi_aff *isl_multi_aff_from_aff( isl_aff *aff);
extern
 isl_multi_aff *isl_multi_aff_domain_map( isl_space *space);
extern
 isl_multi_aff *isl_space_domain_map_multi_aff(
	 isl_space *space);
extern
 isl_multi_aff *isl_multi_aff_range_map( isl_space *space);
extern
 isl_multi_aff *isl_space_range_map_multi_aff(
	 isl_space *space);
 isl_multi_aff *isl_multi_aff_project_out_map(
	 isl_space *space, enum isl_dim_type type,
	unsigned first, unsigned n);


 isl_multi_aff *isl_multi_aff_multi_val_on_domain_space(
	 isl_space *space,  isl_multi_val *mv);

 isl_multi_aff *isl_space_multi_aff_on_domain_multi_val(
	 isl_space *space,  isl_multi_val *mv);
 isl_multi_aff *isl_multi_aff_multi_val_on_space(
	 isl_space *space,  isl_multi_val *mv);

extern
 isl_multi_val *isl_multi_aff_get_constant_multi_val(
	 isl_multi_aff *ma);

extern
 isl_multi_aff *isl_multi_aff_floor( isl_multi_aff *ma);

extern
 isl_multi_aff *isl_multi_aff_gist_params(
	 isl_multi_aff *maff,  isl_set *context);
extern
 isl_multi_aff *isl_multi_aff_gist( isl_multi_aff *maff,
	 isl_set *context);

 isl_multi_aff *isl_multi_aff_lift( isl_multi_aff *maff,
	 isl_local_space **ls);


 isl_multi_aff *isl_multi_aff_pullback_multi_aff(
	 isl_multi_aff *ma1,  isl_multi_aff *ma2);

 isl_multi_aff *isl_multi_aff_move_dims( isl_multi_aff *ma,
	enum isl_dim_type dst_type, unsigned dst_pos,
	enum isl_dim_type src_type, unsigned src_pos, unsigned n);

 isl_set *isl_multi_aff_lex_lt_set( isl_multi_aff *ma1,
	 isl_multi_aff *ma2);
 isl_set *isl_multi_aff_lex_le_set( isl_multi_aff *ma1,
	 isl_multi_aff *ma2);
 isl_set *isl_multi_aff_lex_gt_set( isl_multi_aff *ma1,
	 isl_multi_aff *ma2);
 isl_set *isl_multi_aff_lex_ge_set( isl_multi_aff *ma1,
	 isl_multi_aff *ma2);

extern
 isl_basic_set *isl_multi_aff_bind( isl_multi_aff *ma,
	 isl_multi_id *tuple);

 char *isl_multi_aff_to_str( isl_multi_aff *ma);
 isl_printer *isl_printer_print_multi_aff( isl_printer *p,
	 isl_multi_aff *maff);


 isl_multi_aff *isl_multi_aff_read_from_str(isl_ctx *ctx,
		const char *str);
void isl_multi_aff_dump( isl_multi_aff *maff);

isl_ctx *isl_multi_pw_aff_get_ctx(					
	 isl_multi_pw_aff *multi);				
extern								
 isl_space *isl_multi_pw_aff_get_space(			
	 isl_multi_pw_aff *multi);				
 isl_space *isl_multi_pw_aff_get_domain_space(		
	 isl_multi_pw_aff *multi);				
extern								
 isl_pw_aff_list *isl_multi_pw_aff_get_list(		
	 isl_multi_pw_aff *multi);				
							
 isl_multi_pw_aff *isl_multi_pw_aff_from_pw_aff_list(	
	 isl_space *space,  isl_pw_aff_list *list); 
extern								
 isl_multi_pw_aff *isl_space_multi_pw_aff(			
	 isl_space *space,  isl_pw_aff_list *list); 
 isl_multi_pw_aff *isl_multi_pw_aff_copy(			
	 isl_multi_pw_aff *multi);				
 isl_multi_pw_aff *isl_multi_pw_aff_free(			
	 isl_multi_pw_aff *multi);				
extern								
isl_bool isl_multi_pw_aff_plain_is_equal(				
	 isl_multi_pw_aff *multi1,				
	 isl_multi_pw_aff *multi2);				
 isl_multi_pw_aff *isl_multi_pw_aff_reset_user(		
	 isl_multi_pw_aff *multi);				
extern								
isl_size isl_multi_pw_aff_size( isl_multi_pw_aff *multi);	
extern								
 isl_pw_aff *isl_multi_pw_aff_get_at(			
	 isl_multi_pw_aff *multi, int pos);			
 isl_pw_aff *isl_multi_pw_aff_get_pw_aff(			
	 isl_multi_pw_aff *multi, int pos);			
extern								
 isl_multi_pw_aff *isl_multi_pw_aff_set_at(			
	 isl_multi_pw_aff *multi, int pos,			
	 isl_pw_aff *el);					
 isl_multi_pw_aff *isl_multi_pw_aff_set_pw_aff(		
	 isl_multi_pw_aff *multi, int pos,			
	 isl_pw_aff *el);					
 isl_multi_pw_aff *isl_multi_pw_aff_range_splice(		
	 isl_multi_pw_aff *multi1, unsigned pos,		
	 isl_multi_pw_aff *multi2);				
 isl_multi_pw_aff *isl_multi_pw_aff_flatten_range(		
	 isl_multi_pw_aff *multi);				
extern								
 isl_multi_pw_aff *isl_multi_pw_aff_flat_range_product(	
	 isl_multi_pw_aff *multi1,				
	 isl_multi_pw_aff *multi2);				
extern								
 isl_multi_pw_aff *isl_multi_pw_aff_range_product(		
	 isl_multi_pw_aff *multi1,				
	 isl_multi_pw_aff *multi2);				
 isl_multi_pw_aff *isl_multi_pw_aff_factor_range(		
	 isl_multi_pw_aff *multi);				
isl_bool isl_multi_pw_aff_range_is_wrapping(				
	 isl_multi_pw_aff *multi);				
 isl_multi_pw_aff *isl_multi_pw_aff_range_factor_domain(	
	 isl_multi_pw_aff *multi);				
 isl_multi_pw_aff *isl_multi_pw_aff_range_factor_range(	
	 isl_multi_pw_aff *multi);				
 isl_multi_pw_aff *isl_multi_pw_aff_align_params(		
	 isl_multi_pw_aff *multi,				
	 isl_space *model);					
 isl_multi_pw_aff *isl_multi_pw_aff_from_range(		
	 isl_multi_pw_aff *multi);               
 isl_multi_pw_aff *isl_multi_pw_aff_identity_multi_pw_aff(	
	 isl_multi_pw_aff *multi);				
 isl_multi_pw_aff *isl_multi_pw_aff_identity(		
	 isl_space *space);					
								
 isl_multi_pw_aff *						
isl_multi_pw_aff_identity_on_domain_space(				
	 isl_space *space);					
extern								
 isl_multi_pw_aff *						
isl_space_identity_multi_pw_aff_on_domain(				
	 isl_space *space);   
 isl_multi_pw_aff *isl_multi_pw_aff_scale_val(		
	 isl_multi_pw_aff *multi,  isl_val *v);	
								
 isl_multi_pw_aff *isl_multi_pw_aff_scale_down_val(		
	 isl_multi_pw_aff *multi,  isl_val *v);	
								
 isl_multi_pw_aff *isl_multi_pw_aff_scale_multi_val(	
	 isl_multi_pw_aff *multi,				
	 isl_multi_val *mv);					
								
 isl_multi_pw_aff *isl_multi_pw_aff_scale_down_multi_val(	
	 isl_multi_pw_aff *multi,				
	 isl_multi_val *mv);					
 isl_multi_pw_aff *isl_multi_pw_aff_mod_multi_val(		
	 isl_multi_pw_aff *multi,				
	 isl_multi_val *mv);					
extern								
 isl_multi_pw_aff *isl_multi_pw_aff_add(			
	 isl_multi_pw_aff *multi1,				
	 isl_multi_pw_aff *multi2);				
extern								
 isl_multi_pw_aff *isl_multi_pw_aff_sub(			
	 isl_multi_pw_aff *multi1,				
	 isl_multi_pw_aff *multi2);				
extern								
 isl_multi_pw_aff *isl_multi_pw_aff_neg(		 	
	 isl_multi_pw_aff *multi);      
extern								
 isl_multi_pw_aff *isl_multi_pw_aff_min(			
	 isl_multi_pw_aff *multi1,				
	 isl_multi_pw_aff *multi2);				
extern								
 isl_multi_pw_aff *isl_multi_pw_aff_max(			
	 isl_multi_pw_aff *multi1,				
	 isl_multi_pw_aff *multi2);  
isl_multi_pw_aff *isl_multi_pw_aff_add_constant_val(	
	 isl_multi_pw_aff *mpa,  isl_val *v);	
								
isl_multi_pw_aff *isl_multi_pw_aff_add_constant_multi_val(	
	 isl_multi_pw_aff *mpa,  isl_multi_val *mv);
extern								
 isl_multi_pw_aff *isl_multi_pw_aff_zero(			
	 isl_space *space);					
extern								
 isl_multi_pw_aff *isl_space_zero_multi_pw_aff(		
	 isl_space *space);
extern								
isl_bool isl_multi_pw_aff_involves_nan(				
	 isl_multi_pw_aff *multi);       
isl_size isl_multi_pw_aff_dim( isl_multi_pw_aff *multi,	
	enum isl_dim_type type);					
 isl_multi_pw_aff *isl_multi_pw_aff_drop_dims(		
	 isl_multi_pw_aff *multi, enum isl_dim_type type,	
	unsigned first, unsigned n);
isl_bool isl_multi_pw_aff_involves_dims(				
	 isl_multi_pw_aff *multi, enum isl_dim_type type,	
	unsigned first, unsigned n);					
 isl_multi_pw_aff *isl_multi_pw_aff_insert_dims(		
	 isl_multi_pw_aff *multi, enum isl_dim_type type,	
	unsigned first, unsigned n);					
 isl_multi_pw_aff *isl_multi_pw_aff_add_dims(		
	 isl_multi_pw_aff *multi, enum isl_dim_type type,	
	unsigned n);							
 isl_multi_pw_aff *						
isl_multi_pw_aff_project_domain_on_params(				
	 isl_multi_pw_aff *multi);           
int isl_multi_pw_aff_find_dim_by_name(				
	 isl_multi_pw_aff *multi,				
	enum isl_dim_type type, const char *name);			
int isl_multi_pw_aff_find_dim_by_id(					
	 isl_multi_pw_aff *multi, enum isl_dim_type type,	
	 isl_id *id);						
 isl_id *isl_multi_pw_aff_get_dim_id(			
	 isl_multi_pw_aff *multi,				
	enum isl_dim_type type, unsigned pos);				
 isl_multi_pw_aff *isl_multi_pw_aff_set_dim_name(		
	 isl_multi_pw_aff *multi,				
	enum isl_dim_type type, unsigned pos, const char *s);		
 isl_multi_pw_aff *isl_multi_pw_aff_set_dim_id(		
	 isl_multi_pw_aff *multi,				
	enum isl_dim_type type, unsigned pos,  isl_id *id);   
extern								
 isl_multi_pw_aff *						
isl_multi_pw_aff_insert_domain( isl_multi_pw_aff *multi,	
	 isl_space *domain);     
const char *isl_multi_pw_aff_get_tuple_name(				
	 isl_multi_pw_aff *multi, enum isl_dim_type type);	
extern								
isl_bool isl_multi_pw_aff_has_range_tuple_id(				
	 isl_multi_pw_aff *multi);				
isl_bool isl_multi_pw_aff_has_tuple_id(				
	 isl_multi_pw_aff *multi, enum isl_dim_type type);	
extern								
 isl_id *isl_multi_pw_aff_get_range_tuple_id(		
	 isl_multi_pw_aff *multi);				
 isl_id *isl_multi_pw_aff_get_tuple_id(			
	 isl_multi_pw_aff *multi, enum isl_dim_type type);	
 isl_multi_pw_aff *isl_multi_pw_aff_set_tuple_name(		
	 isl_multi_pw_aff *multi,				
	enum isl_dim_type type, const char *s);				
								
 isl_multi_pw_aff *isl_multi_pw_aff_set_range_tuple_id(	
	 isl_multi_pw_aff *multi,   isl_id *id);	
 isl_multi_pw_aff *isl_multi_pw_aff_set_tuple_id(		
	 isl_multi_pw_aff *multi,				
	enum isl_dim_type type,  isl_id *id);			
extern								
 isl_multi_pw_aff *isl_multi_pw_aff_reset_range_tuple_id(	
	 isl_multi_pw_aff *multi);				
 isl_multi_pw_aff *isl_multi_pw_aff_reset_tuple_id(		
	 isl_multi_pw_aff *multi, enum isl_dim_type type);    
extern								
 isl_multi_pw_aff *isl_multi_pw_aff_product(		
	 isl_multi_pw_aff *multi1,				
	 isl_multi_pw_aff *multi2);				
 isl_multi_pw_aff *isl_multi_pw_aff_splice(			
	 isl_multi_pw_aff *multi1, unsigned in_pos,		
	unsigned out_pos,  isl_multi_pw_aff *multi2);  
extern								
 isl_multi_pw_aff *isl_multi_pw_aff_bind_domain(		
	 isl_multi_pw_aff *multi,				
	 isl_multi_id *tuple);				
extern								
 isl_multi_pw_aff *						
isl_multi_pw_aff_bind_domain_wrapped_domain(				
	 isl_multi_pw_aff *multi,				
	 isl_multi_id *tuple);     
isl_bool isl_multi_pw_aff_involves_param_id(				
	 isl_multi_pw_aff *multi,  isl_id *id);	
								
isl_bool isl_multi_pw_aff_involves_param_id_list(			
	 isl_multi_pw_aff *multi,				
	 isl_id_list *list);    
extern								
 isl_multi_pw_aff *						
isl_multi_pw_aff_unbind_params_insert_domain(				
	 isl_multi_pw_aff *multi,				
	 isl_multi_id *domain);
extern								
 isl_multi_pw_aff *isl_multi_pw_aff_domain_reverse(		
	 isl_multi_pw_aff *multi);

extern
 isl_pw_multi_aff *isl_pw_multi_aff_zero( isl_space *space);

 isl_pw_multi_aff *isl_pw_multi_aff_identity_on_domain_space(
	 isl_space *space);
extern
 isl_pw_multi_aff *isl_space_identity_pw_multi_aff_on_domain(
	 isl_space *space);
 isl_pw_multi_aff *isl_pw_multi_aff_identity(
	 isl_space *space);
extern
 isl_pw_multi_aff *isl_pw_multi_aff_domain_map(
	 isl_space *space);
extern
 isl_pw_multi_aff *isl_space_domain_map_pw_multi_aff(
	 isl_space *space);
extern
 isl_pw_multi_aff *isl_pw_multi_aff_range_map(
	 isl_space *space);
extern
 isl_pw_multi_aff *isl_space_range_map_pw_multi_aff(
	 isl_space *space);
 isl_pw_multi_aff *isl_pw_multi_aff_project_out_map(
	 isl_space *space, enum isl_dim_type type,
	unsigned first, unsigned n);
extern
 isl_pw_multi_aff *isl_multi_aff_to_pw_multi_aff(
	 isl_multi_aff *ma);

 isl_pw_multi_aff *isl_pw_multi_aff_from_multi_aff(
	 isl_multi_aff *ma);

 isl_pw_multi_aff *isl_pw_multi_aff_from_pw_aff(
	 isl_pw_aff *pa);
 isl_pw_multi_aff *isl_pw_multi_aff_alloc( isl_set *set,
	 isl_multi_aff *maff);
 isl_pw_multi_aff *isl_pw_multi_aff_copy(
	 isl_pw_multi_aff *pma);
 isl_pw_multi_aff *isl_pw_multi_aff_free(
	 isl_pw_multi_aff *pma);

isl_size isl_pw_multi_aff_dim( isl_pw_multi_aff *pma,
	enum isl_dim_type type);
extern
isl_bool isl_pw_multi_aff_involves_locals( isl_pw_multi_aff *pma);
isl_bool isl_pw_multi_aff_involves_param_id( isl_pw_multi_aff *pma,
	 isl_id *id);
isl_bool isl_pw_multi_aff_involves_dims( isl_pw_multi_aff *pma,
	enum isl_dim_type type, unsigned first, unsigned n);
extern
 isl_pw_aff *isl_pw_multi_aff_get_at(
	 isl_pw_multi_aff *pma, int pos);
 isl_pw_aff *isl_pw_multi_aff_get_pw_aff(
	 isl_pw_multi_aff *pma, int pos);
 isl_pw_multi_aff *isl_pw_multi_aff_set_pw_aff(
	 isl_pw_multi_aff *pma, unsigned pos,
	 isl_pw_aff *pa);

isl_ctx *isl_pw_multi_aff_get_ctx( isl_pw_multi_aff *pma);
 isl_space *isl_pw_multi_aff_get_domain_space(
	 isl_pw_multi_aff *pma);
extern
 isl_space *isl_pw_multi_aff_get_space(
	 isl_pw_multi_aff *pma);
isl_bool isl_pw_multi_aff_has_tuple_name( isl_pw_multi_aff *pma,
	enum isl_dim_type type);
const char *isl_pw_multi_aff_get_tuple_name( isl_pw_multi_aff *pma,
	enum isl_dim_type type);
extern
 isl_id *isl_pw_multi_aff_get_range_tuple_id(
	 isl_pw_multi_aff *pma);
 isl_id *isl_pw_multi_aff_get_tuple_id(
	 isl_pw_multi_aff *pma, enum isl_dim_type type);
extern
isl_bool isl_pw_multi_aff_has_range_tuple_id( isl_pw_multi_aff *pma);
isl_bool isl_pw_multi_aff_has_tuple_id( isl_pw_multi_aff *pma,
	enum isl_dim_type type);
 isl_pw_multi_aff *isl_pw_multi_aff_set_tuple_id(
	 isl_pw_multi_aff *pma,
	enum isl_dim_type type,  isl_id *id);

 isl_pw_multi_aff *isl_pw_multi_aff_set_range_tuple_id(
	 isl_pw_multi_aff *pma,  isl_id *id);
 isl_pw_multi_aff *isl_pw_multi_aff_reset_tuple_id(
	 isl_pw_multi_aff *pma, enum isl_dim_type type);
 isl_pw_multi_aff *isl_pw_multi_aff_reset_user(
	 isl_pw_multi_aff *pma);

int isl_pw_multi_aff_find_dim_by_name( isl_pw_multi_aff *pma,
	enum isl_dim_type type, const char *name);

 isl_pw_multi_aff *isl_pw_multi_aff_drop_dims(
	 isl_pw_multi_aff *pma,
	enum isl_dim_type type, unsigned first, unsigned n);

extern
 isl_set *isl_pw_multi_aff_domain( isl_pw_multi_aff *pma);

 isl_pw_multi_aff *isl_pw_multi_aff_empty( isl_space *space);
 isl_pw_multi_aff *isl_pw_multi_aff_from_domain(
	 isl_set *set);

extern
 isl_pw_multi_aff *isl_pw_multi_aff_multi_val_on_domain(
	 isl_set *domain,  isl_multi_val *mv);

 isl_pw_multi_aff *isl_set_pw_multi_aff_on_domain_multi_val(
	 isl_set *domain,  isl_multi_val *mv);

const char *isl_pw_multi_aff_get_dim_name( isl_pw_multi_aff *pma,
	enum isl_dim_type type, unsigned pos);
 isl_id *isl_pw_multi_aff_get_dim_id(
	 isl_pw_multi_aff *pma, enum isl_dim_type type,
	unsigned pos);
 isl_pw_multi_aff *isl_pw_multi_aff_set_dim_id(
	 isl_pw_multi_aff *pma,
	enum isl_dim_type type, unsigned pos,  isl_id *id);

isl_bool isl_pw_multi_aff_involves_nan( isl_pw_multi_aff *pma);
extern
isl_bool isl_pw_multi_aff_plain_is_equal( isl_pw_multi_aff *pma1,
	 isl_pw_multi_aff *pma2);
isl_bool isl_pw_multi_aff_is_equal( isl_pw_multi_aff *pma1,
	 isl_pw_multi_aff *pma2);

 isl_pw_multi_aff *isl_pw_multi_aff_fix_si(
	 isl_pw_multi_aff *pma, enum isl_dim_type type,
	unsigned pos, int value);

extern
 isl_pw_multi_aff *isl_pw_multi_aff_union_add(
	 isl_pw_multi_aff *pma1,  isl_pw_multi_aff *pma2);

extern
 isl_pw_multi_aff *isl_pw_multi_aff_domain_reverse(
	 isl_pw_multi_aff *pma);

 isl_pw_multi_aff *isl_pw_multi_aff_neg(
	 isl_pw_multi_aff *pma);

extern
 isl_pw_multi_aff *isl_pw_multi_aff_add(
	 isl_pw_multi_aff *pma1,  isl_pw_multi_aff *pma2);
extern
 isl_pw_multi_aff *isl_pw_multi_aff_sub(
	 isl_pw_multi_aff *pma1,  isl_pw_multi_aff *pma2);


 isl_pw_multi_aff *isl_pw_multi_aff_add_constant_val(
	 isl_pw_multi_aff *pma,  isl_val *v);

 isl_pw_multi_aff *isl_pw_multi_aff_add_constant_multi_val(
	 isl_pw_multi_aff *pma,  isl_multi_val *mv);

 isl_pw_multi_aff *isl_pw_multi_aff_scale_val(
	 isl_pw_multi_aff *pma,  isl_val *v);

 isl_pw_multi_aff *isl_pw_multi_aff_scale_down_val(
	 isl_pw_multi_aff *pma,  isl_val *v);

 isl_pw_multi_aff *isl_pw_multi_aff_scale_multi_val(
	 isl_pw_multi_aff *pma,  isl_multi_val *mv);

 isl_pw_multi_aff *isl_pw_multi_aff_scale_down_multi_val(
	 isl_pw_multi_aff *pma,  isl_multi_val *mv);

 isl_pw_multi_aff *isl_pw_multi_aff_union_lexmin(
	 isl_pw_multi_aff *pma1,
	 isl_pw_multi_aff *pma2);
 isl_pw_multi_aff *isl_pw_multi_aff_union_lexmax(
	 isl_pw_multi_aff *pma1,
	 isl_pw_multi_aff *pma2);

 isl_multi_aff *isl_multi_aff_flatten_domain(
	 isl_multi_aff *ma);

extern
 isl_pw_multi_aff *isl_pw_multi_aff_range_product(
	 isl_pw_multi_aff *pma1,  isl_pw_multi_aff *pma2);
extern
 isl_pw_multi_aff *isl_pw_multi_aff_flat_range_product(
	 isl_pw_multi_aff *pma1,  isl_pw_multi_aff *pma2);
extern
 isl_pw_multi_aff *isl_pw_multi_aff_product(
	 isl_pw_multi_aff *pma1,  isl_pw_multi_aff *pma2);
extern
 isl_pw_multi_aff *isl_pw_multi_aff_range_factor_domain(
	 isl_pw_multi_aff *pma);
extern
 isl_pw_multi_aff *isl_pw_multi_aff_range_factor_range(
	 isl_pw_multi_aff *pma);

extern
 isl_pw_multi_aff *isl_pw_multi_aff_intersect_params(
	 isl_pw_multi_aff *pma,  isl_set *set);
extern
 isl_pw_multi_aff *isl_pw_multi_aff_intersect_domain(
	 isl_pw_multi_aff *pma,  isl_set *set);
 isl_pw_multi_aff *isl_pw_multi_aff_intersect_domain_wrapped_domain(
	 isl_pw_multi_aff *pma,  isl_set *set);
 isl_pw_multi_aff *isl_pw_multi_aff_intersect_domain_wrapped_range(
	 isl_pw_multi_aff *pma,  isl_set *set);
extern
 isl_pw_multi_aff *isl_pw_multi_aff_subtract_domain(
	 isl_pw_multi_aff *pma,  isl_set *set);

extern
 isl_pw_multi_aff *isl_pw_multi_aff_insert_domain(
	 isl_pw_multi_aff *pma,  isl_space *domain);
 isl_pw_multi_aff *isl_pw_multi_aff_project_domain_on_params(
	 isl_pw_multi_aff *pma);

 isl_pw_multi_aff *isl_pw_multi_aff_align_params(
	 isl_pw_multi_aff *pma,  isl_space *model);
extern
 isl_pw_multi_aff *isl_pw_multi_aff_drop_unused_params(
	 isl_pw_multi_aff *pma);

extern
 isl_pw_multi_aff *isl_pw_multi_aff_coalesce(
	 isl_pw_multi_aff *pma);
extern
 isl_pw_multi_aff *isl_pw_multi_aff_gist_params(
	 isl_pw_multi_aff *pma,  isl_set *set);
extern
 isl_pw_multi_aff *isl_pw_multi_aff_gist(
	 isl_pw_multi_aff *pma,  isl_set *set);


 isl_pw_multi_aff *isl_pw_multi_aff_pullback_multi_aff(
	 isl_pw_multi_aff *pma,  isl_multi_aff *ma);

 isl_pw_multi_aff *isl_pw_multi_aff_pullback_pw_multi_aff(
	 isl_pw_multi_aff *pma1,  isl_pw_multi_aff *pma2);

 isl_pw_multi_aff *
isl_pw_multi_aff_preimage_domain_wrapped_domain_pw_multi_aff(
	 isl_pw_multi_aff *pma1,  isl_pw_multi_aff *pma2);

extern
isl_size isl_pw_multi_aff_n_piece( isl_pw_multi_aff *pma);
extern
isl_stat isl_pw_multi_aff_foreach_piece( isl_pw_multi_aff *pma,
	isl_stat (*fn)( isl_set *set,  isl_multi_aff *maff,
		    void *user), void *user);
isl_bool isl_pw_multi_aff_every_piece( isl_pw_multi_aff *pma,
	isl_bool (*test)( isl_set *set,  isl_multi_aff *ma,
		void *user), void *user);
extern
isl_bool isl_pw_multi_aff_isa_multi_aff( isl_pw_multi_aff *pma);
extern
 isl_multi_aff *isl_pw_multi_aff_as_multi_aff(
	 isl_pw_multi_aff *pma);

extern
 isl_map *isl_pw_multi_aff_as_map( isl_pw_multi_aff *pma);
 isl_map *isl_map_from_pw_multi_aff( isl_pw_multi_aff *pma);
extern
 isl_set *isl_pw_multi_aff_as_set( isl_pw_multi_aff *pma);
 isl_set *isl_set_from_pw_multi_aff( isl_pw_multi_aff *pma);

 char *isl_pw_multi_aff_to_str( isl_pw_multi_aff *pma);
 isl_printer *isl_printer_print_pw_multi_aff( isl_printer *p,
	 isl_pw_multi_aff *pma);

extern
 isl_pw_multi_aff *isl_set_as_pw_multi_aff( isl_set *set);
 isl_pw_multi_aff *isl_pw_multi_aff_from_set( isl_set *set);
extern
 isl_pw_multi_aff *isl_map_as_pw_multi_aff( isl_map *map);
 isl_pw_multi_aff *isl_pw_multi_aff_from_map( isl_map *map);

extern
 isl_pw_multi_aff *isl_pw_multi_aff_bind_domain(
	 isl_pw_multi_aff *pma,  isl_multi_id *tuple);
extern
 isl_pw_multi_aff *isl_pw_multi_aff_bind_domain_wrapped_domain(
	 isl_pw_multi_aff *pma,  isl_multi_id *tuple);


 isl_pw_multi_aff *isl_pw_multi_aff_read_from_str(isl_ctx *ctx,
	const char *str);
void isl_pw_multi_aff_dump( isl_pw_multi_aff *pma);



 isl_union_pw_multi_aff *isl_union_pw_multi_aff_empty_ctx(
	isl_ctx *ctx);
 isl_union_pw_multi_aff *isl_union_pw_multi_aff_empty_space(
	 isl_space *space);
 isl_union_pw_multi_aff *isl_union_pw_multi_aff_empty(
	 isl_space *space);
 isl_union_pw_multi_aff *isl_union_pw_multi_aff_from_aff(
	 isl_aff *aff);

 isl_union_pw_multi_aff *isl_union_pw_multi_aff_from_multi_aff(
	 isl_multi_aff *ma);
extern
 isl_union_pw_multi_aff *isl_pw_multi_aff_to_union_pw_multi_aff(
	 isl_pw_multi_aff *pma);

 isl_union_pw_multi_aff *isl_union_pw_multi_aff_from_pw_multi_aff(
	 isl_pw_multi_aff *pma);
 isl_union_pw_multi_aff *isl_union_pw_multi_aff_from_domain(
	 isl_union_set *uset);
 isl_union_pw_multi_aff *isl_union_pw_multi_aff_multi_val_on_domain(
	 isl_union_set *domain,  isl_multi_val *mv);
 isl_union_pw_aff *isl_union_pw_aff_param_on_domain_id(
	 isl_union_set *domain,  isl_id *id);
 isl_union_pw_multi_aff *isl_union_pw_multi_aff_copy(
	 isl_union_pw_multi_aff *upma);
 isl_union_pw_multi_aff *isl_union_pw_multi_aff_free(
	 isl_union_pw_multi_aff *upma);

 isl_union_pw_multi_aff *isl_union_set_identity_union_pw_multi_aff(
	 isl_union_set *uset);

 isl_union_pw_aff *isl_union_pw_multi_aff_get_union_pw_aff(
	 isl_union_pw_multi_aff *upma, int pos);

 isl_union_pw_multi_aff *isl_union_pw_multi_aff_add_pw_multi_aff(
	 isl_union_pw_multi_aff *upma,
	 isl_pw_multi_aff *pma);

isl_ctx *isl_union_pw_multi_aff_get_ctx(
	 isl_union_pw_multi_aff *upma);
extern
 isl_space *isl_union_pw_multi_aff_get_space(
	 isl_union_pw_multi_aff *upma);
extern
 isl_pw_multi_aff_list *isl_union_pw_multi_aff_get_pw_multi_aff_list(
	 isl_union_pw_multi_aff *upma);

isl_size isl_union_pw_multi_aff_dim( isl_union_pw_multi_aff *upma,
	enum isl_dim_type type);
 isl_union_pw_multi_aff *isl_union_pw_multi_aff_set_dim_name(
	 isl_union_pw_multi_aff *upma,
	enum isl_dim_type type, unsigned pos, const char *s);

int isl_union_pw_multi_aff_find_dim_by_name(
	 isl_union_pw_multi_aff *upma, enum isl_dim_type type,
	const char *name);

 isl_union_pw_multi_aff *isl_union_pw_multi_aff_drop_dims(
	 isl_union_pw_multi_aff *upma,
	enum isl_dim_type type, unsigned first, unsigned n);
 isl_union_pw_multi_aff *isl_union_pw_multi_aff_reset_user(
	 isl_union_pw_multi_aff *upma);

extern
 isl_union_pw_multi_aff *isl_union_pw_multi_aff_coalesce(
	 isl_union_pw_multi_aff *upma);
 isl_union_pw_multi_aff *isl_union_pw_multi_aff_gist_params(
	 isl_union_pw_multi_aff *upma,  isl_set *context);
extern
 isl_union_pw_multi_aff *isl_union_pw_multi_aff_gist(
	 isl_union_pw_multi_aff *upma,
	 isl_union_set *context);


 isl_union_pw_multi_aff *
isl_union_pw_multi_aff_pullback_union_pw_multi_aff(
	 isl_union_pw_multi_aff *upma1,
	 isl_union_pw_multi_aff *upma2);

 isl_union_pw_multi_aff *
isl_union_pw_multi_aff_apply_union_pw_multi_aff(
	 isl_union_pw_multi_aff *upma1,
	 isl_union_pw_multi_aff *upma2);

 isl_union_pw_multi_aff *
isl_union_pw_multi_aff_preimage_domain_wrapped_domain_union_pw_multi_aff(
	 isl_union_pw_multi_aff *upma1,
	 isl_union_pw_multi_aff *upma2);

 isl_union_pw_multi_aff *isl_union_pw_multi_aff_align_params(
	 isl_union_pw_multi_aff *upma,  isl_space *model);
extern
 isl_union_pw_multi_aff *isl_union_pw_multi_aff_drop_unused_params(
	 isl_union_pw_multi_aff *upma);

isl_size isl_union_pw_multi_aff_n_pw_multi_aff(
	 isl_union_pw_multi_aff *upma);

isl_stat isl_union_pw_multi_aff_foreach_pw_multi_aff(
	 isl_union_pw_multi_aff *upma,
	isl_stat (*fn)( isl_pw_multi_aff *pma, void *user),
	void *user);
isl_bool isl_union_pw_multi_aff_every_pw_multi_aff(
	 isl_union_pw_multi_aff *upma,
	isl_bool (*test)( isl_pw_multi_aff *pma, void *user),
	void *user);
extern
 isl_pw_multi_aff *isl_union_pw_multi_aff_extract_pw_multi_aff(
	 isl_union_pw_multi_aff *upma,  isl_space *space);
extern
isl_bool isl_union_pw_multi_aff_isa_pw_multi_aff(
	 isl_union_pw_multi_aff *upma);
extern
 isl_pw_multi_aff *isl_union_pw_multi_aff_as_pw_multi_aff(
	 isl_union_pw_multi_aff *upma);

extern
isl_bool isl_union_pw_multi_aff_plain_is_empty(
	 isl_union_pw_multi_aff *upma);
extern
isl_bool isl_union_pw_multi_aff_involves_locals(
	 isl_union_pw_multi_aff *upma);
isl_bool isl_union_pw_multi_aff_involves_nan(
	 isl_union_pw_multi_aff *upma);
extern
isl_bool isl_union_pw_multi_aff_plain_is_equal(
	 isl_union_pw_multi_aff *upma1,
	 isl_union_pw_multi_aff *upma2);

extern
 isl_union_set *isl_union_pw_multi_aff_domain(
	 isl_union_pw_multi_aff *upma);

 isl_union_pw_multi_aff *isl_union_pw_multi_aff_neg(
	 isl_union_pw_multi_aff *upma);

extern
 isl_union_pw_multi_aff *isl_union_pw_multi_aff_add(
	 isl_union_pw_multi_aff *upma1,
	 isl_union_pw_multi_aff *upma2);
extern
 isl_union_pw_multi_aff *isl_union_pw_multi_aff_union_add(
	 isl_union_pw_multi_aff *upma1,
	 isl_union_pw_multi_aff *upma2);
extern
 isl_union_pw_multi_aff *isl_union_pw_multi_aff_sub(
	 isl_union_pw_multi_aff *upma1,
	 isl_union_pw_multi_aff *upma2);

 isl_union_pw_multi_aff *isl_union_pw_multi_aff_scale_val(
	 isl_union_pw_multi_aff *upma,  isl_val *val);
 isl_union_pw_multi_aff *isl_union_pw_multi_aff_scale_down_val(
	 isl_union_pw_multi_aff *upma,  isl_val *val);
 isl_union_pw_multi_aff *isl_union_pw_multi_aff_scale_multi_val(
	 isl_union_pw_multi_aff *upma,  isl_multi_val *mv);

extern
 isl_union_pw_multi_aff *isl_union_pw_multi_aff_range_product(
	 isl_union_pw_multi_aff *upma1,
	 isl_union_pw_multi_aff *upma2);
extern
 isl_union_pw_multi_aff *isl_union_pw_multi_aff_flat_range_product(
	 isl_union_pw_multi_aff *upma1,
	 isl_union_pw_multi_aff *upma2);
extern
 isl_union_pw_multi_aff *isl_union_pw_multi_aff_range_factor_domain(
	 isl_union_pw_multi_aff *upma);
extern
 isl_union_pw_multi_aff *isl_union_pw_multi_aff_range_factor_range(
	 isl_union_pw_multi_aff *upma);

extern
 isl_union_pw_multi_aff *isl_union_pw_multi_aff_intersect_params(
	 isl_union_pw_multi_aff *upma,  isl_set *set);

 isl_union_pw_multi_aff *
isl_union_pw_multi_aff_intersect_domain_union_set(
	 isl_union_pw_multi_aff *upma,
	 isl_union_set *uset);
 isl_union_pw_multi_aff *isl_union_pw_multi_aff_intersect_domain(
	 isl_union_pw_multi_aff *upma,
	 isl_union_set *uset);

 isl_union_pw_multi_aff *
isl_union_pw_multi_aff_intersect_domain_space(
	 isl_union_pw_multi_aff *upma,  isl_space *space);
extern
 isl_union_pw_multi_aff *
isl_union_pw_multi_aff_intersect_domain_wrapped_domain(
	 isl_union_pw_multi_aff *upma,
	 isl_union_set *uset);
extern
 isl_union_pw_multi_aff *
isl_union_pw_multi_aff_intersect_domain_wrapped_range(
	 isl_union_pw_multi_aff *upma,
	 isl_union_set *uset);

 isl_union_pw_multi_aff *
isl_union_pw_multi_aff_subtract_domain_union_set(
	 isl_union_pw_multi_aff *upma,
	 isl_union_set *uset);

 isl_union_pw_multi_aff *isl_union_pw_multi_aff_subtract_domain_space(
	 isl_union_pw_multi_aff *upma,  isl_space *space);
 isl_union_pw_multi_aff *isl_union_pw_multi_aff_subtract_domain(
	 isl_union_pw_multi_aff *upma,
	 isl_union_set *uset);

extern
 isl_union_map *isl_union_pw_multi_aff_as_union_map(
	 isl_union_pw_multi_aff *upma);

 isl_union_map *isl_union_map_from_union_pw_multi_aff(
	 isl_union_pw_multi_aff *upma);

 isl_printer *isl_printer_print_union_pw_multi_aff(
	 isl_printer *p,  isl_union_pw_multi_aff *upma);

 isl_union_pw_multi_aff *isl_union_pw_multi_aff_from_union_set(
	 isl_union_set *uset);
extern
 isl_union_pw_multi_aff *isl_union_map_as_union_pw_multi_aff(
	 isl_union_map *umap);
 isl_union_pw_multi_aff *isl_union_pw_multi_aff_from_union_map(
	 isl_union_map *umap);


 isl_union_pw_multi_aff *isl_union_pw_multi_aff_read_from_str(
	isl_ctx *ctx, const char *str);
void isl_union_pw_multi_aff_dump( isl_union_pw_multi_aff *upma);
 char *isl_union_pw_multi_aff_to_str(
	 isl_union_pw_multi_aff *upma);

uint32_t isl_multi_pw_aff_get_hash( isl_multi_pw_aff *mpa);


 isl_multi_pw_aff *isl_multi_pw_aff_from_aff( isl_aff *aff);
extern
 isl_multi_pw_aff *isl_multi_aff_to_multi_pw_aff(
	 isl_multi_aff *ma);

 isl_multi_pw_aff *isl_multi_pw_aff_from_multi_aff(
	 isl_multi_aff *ma);

 isl_multi_pw_aff *isl_multi_pw_aff_from_pw_aff(
	 isl_pw_aff *pa);
extern
 isl_set *isl_multi_pw_aff_domain( isl_multi_pw_aff *mpa);
extern
 isl_multi_pw_aff *isl_multi_pw_aff_intersect_params(
	 isl_multi_pw_aff *mpa,  isl_set *set);
extern
 isl_multi_pw_aff *isl_multi_pw_aff_intersect_domain(
	 isl_multi_pw_aff *mpa,  isl_set *domain);

extern
 isl_multi_pw_aff *isl_multi_pw_aff_coalesce(
	 isl_multi_pw_aff *mpa);
extern
 isl_multi_pw_aff *isl_multi_pw_aff_gist(
	 isl_multi_pw_aff *mpa,  isl_set *set);
extern
 isl_multi_pw_aff *isl_multi_pw_aff_gist_params(
	 isl_multi_pw_aff *mpa,  isl_set *set);

isl_bool isl_multi_pw_aff_is_cst( isl_multi_pw_aff *mpa);
isl_bool isl_multi_pw_aff_is_equal( isl_multi_pw_aff *mpa1,
	 isl_multi_pw_aff *mpa2);


 isl_multi_pw_aff *isl_multi_pw_aff_pullback_multi_aff(
	 isl_multi_pw_aff *mpa,  isl_multi_aff *ma);

 isl_multi_pw_aff *isl_multi_pw_aff_pullback_pw_multi_aff(
	 isl_multi_pw_aff *mpa,  isl_pw_multi_aff *pma);

 isl_multi_pw_aff *isl_multi_pw_aff_pullback_multi_pw_aff(
	 isl_multi_pw_aff *mpa1,  isl_multi_pw_aff *mpa2);

extern
 isl_multi_pw_aff *isl_multi_pw_aff_union_add(
	 isl_multi_pw_aff *mpa1,  isl_multi_pw_aff *mpa2);

 isl_multi_pw_aff *isl_multi_pw_aff_move_dims(
	 isl_multi_pw_aff *pma,
	enum isl_dim_type dst_type, unsigned dst_pos,
	enum isl_dim_type src_type, unsigned src_pos, unsigned n);

extern
isl_bool isl_multi_pw_aff_isa_multi_aff( isl_multi_pw_aff *mpa);
extern
 isl_multi_aff *isl_multi_pw_aff_as_multi_aff(
	 isl_multi_pw_aff *mpa);

extern
 isl_set *isl_multi_pw_aff_as_set( isl_multi_pw_aff *mpa);
 isl_set *isl_set_from_multi_pw_aff( isl_multi_pw_aff *mpa);
extern
 isl_map *isl_multi_pw_aff_as_map( isl_multi_pw_aff *mpa);
 isl_map *isl_map_from_multi_pw_aff( isl_multi_pw_aff *mpa);
 isl_pw_multi_aff *isl_pw_multi_aff_from_multi_pw_aff(
	 isl_multi_pw_aff *mpa);
extern
 isl_multi_pw_aff *isl_pw_multi_aff_to_multi_pw_aff(
	 isl_pw_multi_aff *pma);

 isl_multi_pw_aff *isl_multi_pw_aff_from_pw_multi_aff(
	 isl_pw_multi_aff *pma);

 isl_map *isl_multi_pw_aff_eq_map( isl_multi_pw_aff *mpa1,
	 isl_multi_pw_aff *mpa2);
 isl_map *isl_multi_pw_aff_lex_le_map(
	 isl_multi_pw_aff *mpa1,  isl_multi_pw_aff *mpa2);
 isl_map *isl_multi_pw_aff_lex_lt_map(
	 isl_multi_pw_aff *mpa1,  isl_multi_pw_aff *mpa2);
 isl_map *isl_multi_pw_aff_lex_ge_map(
	 isl_multi_pw_aff *mpa1,  isl_multi_pw_aff *mpa2);
 isl_map *isl_multi_pw_aff_lex_gt_map(
	 isl_multi_pw_aff *mpa1,  isl_multi_pw_aff *mpa2);

extern
 isl_set *isl_multi_pw_aff_bind( isl_multi_pw_aff *mpa,
	 isl_multi_id *tuple);


 isl_multi_pw_aff *isl_multi_pw_aff_read_from_str(isl_ctx *ctx,
	const char *str);
 char *isl_multi_pw_aff_to_str( isl_multi_pw_aff *mpa);
 isl_printer *isl_printer_print_multi_pw_aff(
	 isl_printer *p,  isl_multi_pw_aff *mpa);
void isl_multi_pw_aff_dump( isl_multi_pw_aff *mpa);

 isl_union_pw_aff *isl_union_pw_aff_copy(
	 isl_union_pw_aff *upa);
 isl_union_pw_aff *isl_union_pw_aff_free(
	 isl_union_pw_aff *upa);

isl_ctx *isl_union_pw_aff_get_ctx( isl_union_pw_aff *upa);
extern
 isl_space *isl_union_pw_aff_get_space(
	 isl_union_pw_aff *upa);
 isl_pw_aff_list *isl_union_pw_aff_get_pw_aff_list(
	 isl_union_pw_aff *upa);

isl_size isl_union_pw_aff_dim( isl_union_pw_aff *upa,
	enum isl_dim_type type);
 isl_union_pw_aff *isl_union_pw_aff_set_dim_name(
	 isl_union_pw_aff *upa, enum isl_dim_type type,
	unsigned pos, const char *s);

int isl_union_pw_aff_find_dim_by_name( isl_union_pw_aff *upa,
	enum isl_dim_type type, const char *name);

 isl_union_pw_aff *isl_union_pw_aff_drop_dims(
	 isl_union_pw_aff *upa,
	enum isl_dim_type type, unsigned first, unsigned n);
 isl_union_pw_aff *isl_union_pw_aff_reset_user(
	 isl_union_pw_aff *upa);

 isl_union_pw_aff *isl_union_pw_aff_empty_ctx(isl_ctx *ctx);
 isl_union_pw_aff *isl_union_pw_aff_empty_space(
	 isl_space *space);
 isl_union_pw_aff *isl_union_pw_aff_empty(
	 isl_space *space);

 isl_union_pw_aff *isl_union_pw_aff_from_aff( isl_aff *aff);
extern
 isl_union_pw_aff *isl_pw_aff_to_union_pw_aff(
	 isl_pw_aff *pa);

 isl_union_pw_aff *isl_union_pw_aff_from_pw_aff(
	 isl_pw_aff *pa);
 isl_union_pw_aff *isl_union_pw_aff_val_on_domain(
	 isl_union_set *domain,  isl_val *v);
 isl_union_pw_aff *isl_union_pw_aff_aff_on_domain(
	 isl_union_set *domain,  isl_aff *aff);
 isl_union_pw_aff *isl_union_pw_aff_pw_aff_on_domain(
	 isl_union_set *domain,  isl_pw_aff *pa);
 isl_union_pw_aff *isl_union_pw_aff_add_pw_aff(
	 isl_union_pw_aff *upa,  isl_pw_aff *pa);


 isl_union_pw_multi_aff *isl_union_pw_multi_aff_from_union_pw_aff(
	 isl_union_pw_aff *upa);

isl_size isl_union_pw_aff_n_pw_aff( isl_union_pw_aff *upa);

isl_stat isl_union_pw_aff_foreach_pw_aff( isl_union_pw_aff *upa,
	isl_stat (*fn)( isl_pw_aff *pa, void *user), void *user);
isl_bool isl_union_pw_aff_every_pw_aff( isl_union_pw_aff *upa,
	isl_bool (*test)( isl_pw_aff *pa, void *user), void *user);
 isl_pw_aff *isl_union_pw_aff_extract_pw_aff(
	 isl_union_pw_aff *upa,  isl_space *space);

isl_bool isl_union_pw_aff_involves_nan( isl_union_pw_aff *upa);
extern
isl_bool isl_union_pw_aff_plain_is_equal( isl_union_pw_aff *upa1,
	 isl_union_pw_aff *upa2);

extern
 isl_union_set *isl_union_pw_aff_domain(
	 isl_union_pw_aff *upa);

 isl_union_pw_aff *isl_union_pw_aff_neg(
	 isl_union_pw_aff *upa);

extern
 isl_union_pw_aff *isl_union_pw_aff_add(
	 isl_union_pw_aff *upa1,  isl_union_pw_aff *upa2);
extern
 isl_union_pw_aff *isl_union_pw_aff_union_add(
	 isl_union_pw_aff *upa1,  isl_union_pw_aff *upa2);
extern
 isl_union_pw_aff *isl_union_pw_aff_sub(
	 isl_union_pw_aff *upa1,  isl_union_pw_aff *upa2);

extern
 isl_union_pw_aff *isl_union_pw_aff_coalesce(
	 isl_union_pw_aff *upa);
extern
 isl_union_pw_aff *isl_union_pw_aff_gist(
	 isl_union_pw_aff *upa,  isl_union_set *context);
 isl_union_pw_aff *isl_union_pw_aff_gist_params(
	 isl_union_pw_aff *upa,  isl_set *context);


 isl_union_pw_aff *isl_union_pw_aff_pullback_union_pw_multi_aff(
	 isl_union_pw_aff *upa,
	 isl_union_pw_multi_aff *upma);

 isl_union_pw_aff *isl_union_pw_aff_floor(
	 isl_union_pw_aff *upa);

 isl_union_pw_aff *isl_union_pw_aff_scale_val(
	 isl_union_pw_aff *upa,  isl_val *v);
 isl_union_pw_aff *isl_union_pw_aff_scale_down_val(
	 isl_union_pw_aff *upa,  isl_val *v);
 isl_union_pw_aff *isl_union_pw_aff_mod_val(
	 isl_union_pw_aff *upa,  isl_val *f);

 isl_union_pw_aff *isl_union_pw_aff_align_params(
	 isl_union_pw_aff *upa,  isl_space *model);
extern
 isl_union_pw_aff *isl_union_pw_aff_drop_unused_params(
	 isl_union_pw_aff *upa);

extern
 isl_union_pw_aff *isl_union_pw_aff_intersect_params(
	 isl_union_pw_aff *upa,  isl_set *set);

 isl_union_pw_aff *isl_union_pw_aff_intersect_domain_space(
	 isl_union_pw_aff *upa,  isl_space *space);

 isl_union_pw_aff *isl_union_pw_aff_intersect_domain_union_set(
	 isl_union_pw_aff *upa,  isl_union_set *uset);
 isl_union_pw_aff *isl_union_pw_aff_intersect_domain(
	 isl_union_pw_aff *upa,  isl_union_set *uset);
extern
 isl_union_pw_aff *isl_union_pw_aff_intersect_domain_wrapped_domain(
	 isl_union_pw_aff *upa,  isl_union_set *uset);
extern
 isl_union_pw_aff *isl_union_pw_aff_intersect_domain_wrapped_range(
	 isl_union_pw_aff *upa,  isl_union_set *uset);

 isl_union_pw_aff *isl_union_pw_aff_subtract_domain_union_set(
	 isl_union_pw_aff *upa,  isl_union_set *uset);

 isl_union_pw_aff *isl_union_pw_aff_subtract_domain_space(
	 isl_union_pw_aff *upa,  isl_space *space);
 isl_union_pw_aff *isl_union_pw_aff_subtract_domain(
	 isl_union_pw_aff *upa,  isl_union_set *uset);

 isl_union_pw_aff *isl_union_pw_aff_set_dim_name(
	 isl_union_pw_aff *upa,
	enum isl_dim_type type, unsigned pos, const char *s);

 isl_union_set *isl_union_pw_aff_zero_union_set(
	 isl_union_pw_aff *upa);

 isl_union_map *isl_union_map_from_union_pw_aff(
	 isl_union_pw_aff *upa);


 isl_union_set *isl_union_pw_aff_bind_id(
	 isl_union_pw_aff *upa,  isl_id *id);


 isl_union_pw_aff *isl_union_pw_aff_read_from_str(isl_ctx *ctx,
	const char *str);
 char *isl_union_pw_aff_to_str( isl_union_pw_aff *upa);
 isl_printer *isl_printer_print_union_pw_aff(
	 isl_printer *p,  isl_union_pw_aff *upa);
void isl_union_pw_aff_dump( isl_union_pw_aff *upa);

isl_ctx *isl_multi_union_pw_aff_get_ctx(					
	 isl_multi_union_pw_aff *multi);				
extern								
 isl_space *isl_multi_union_pw_aff_get_space(			
	 isl_multi_union_pw_aff *multi);				
 isl_space *isl_multi_union_pw_aff_get_domain_space(		
	 isl_multi_union_pw_aff *multi);				
extern								
 isl_union_pw_aff_list *isl_multi_union_pw_aff_get_list(		
	 isl_multi_union_pw_aff *multi);				
							
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_from_union_pw_aff_list(	
	 isl_space *space,  isl_union_pw_aff_list *list); 
extern								
 isl_multi_union_pw_aff *isl_space_multi_union_pw_aff(			
	 isl_space *space,  isl_union_pw_aff_list *list); 
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_copy(			
	 isl_multi_union_pw_aff *multi);				
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_free(			
	 isl_multi_union_pw_aff *multi);				
extern								
isl_bool isl_multi_union_pw_aff_plain_is_equal(				
	 isl_multi_union_pw_aff *multi1,				
	 isl_multi_union_pw_aff *multi2);				
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_reset_user(		
	 isl_multi_union_pw_aff *multi);				
extern								
isl_size isl_multi_union_pw_aff_size( isl_multi_union_pw_aff *multi);	
extern								
 isl_union_pw_aff *isl_multi_union_pw_aff_get_at(			
	 isl_multi_union_pw_aff *multi, int pos);			
 isl_union_pw_aff *isl_multi_union_pw_aff_get_union_pw_aff(			
	 isl_multi_union_pw_aff *multi, int pos);			
extern								
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_set_at(			
	 isl_multi_union_pw_aff *multi, int pos,			
	 isl_union_pw_aff *el);					
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_set_union_pw_aff(		
	 isl_multi_union_pw_aff *multi, int pos,			
	 isl_union_pw_aff *el);					
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_range_splice(		
	 isl_multi_union_pw_aff *multi1, unsigned pos,		
	 isl_multi_union_pw_aff *multi2);				
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_flatten_range(		
	 isl_multi_union_pw_aff *multi);				
extern								
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_flat_range_product(	
	 isl_multi_union_pw_aff *multi1,				
	 isl_multi_union_pw_aff *multi2);				
extern								
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_range_product(		
	 isl_multi_union_pw_aff *multi1,				
	 isl_multi_union_pw_aff *multi2);				
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_factor_range(		
	 isl_multi_union_pw_aff *multi);				
isl_bool isl_multi_union_pw_aff_range_is_wrapping(				
	 isl_multi_union_pw_aff *multi);				
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_range_factor_domain(	
	 isl_multi_union_pw_aff *multi);				
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_range_factor_range(	
	 isl_multi_union_pw_aff *multi);				
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_align_params(		
	 isl_multi_union_pw_aff *multi,				
	 isl_space *model);					
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_from_range(		
	 isl_multi_union_pw_aff *multi);               
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_scale_val(		
	 isl_multi_union_pw_aff *multi,  isl_val *v);	
								
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_scale_down_val(		
	 isl_multi_union_pw_aff *multi,  isl_val *v);	
								
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_scale_multi_val(	
	 isl_multi_union_pw_aff *multi,				
	 isl_multi_val *mv);					
								
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_scale_down_multi_val(	
	 isl_multi_union_pw_aff *multi,				
	 isl_multi_val *mv);					
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_mod_multi_val(		
	 isl_multi_union_pw_aff *multi,				
	 isl_multi_val *mv);					
extern								
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_add(			
	 isl_multi_union_pw_aff *multi1,				
	 isl_multi_union_pw_aff *multi2);				
extern								
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_sub(			
	 isl_multi_union_pw_aff *multi1,				
	 isl_multi_union_pw_aff *multi2);				
extern								
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_neg(		 	
	 isl_multi_union_pw_aff *multi);      
extern								
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_zero(			
	 isl_space *space);					
extern								
 isl_multi_union_pw_aff *isl_space_zero_multi_union_pw_aff(		
	 isl_space *space);
extern								
isl_bool isl_multi_union_pw_aff_involves_nan(				
	 isl_multi_union_pw_aff *multi);       
isl_size isl_multi_union_pw_aff_dim( isl_multi_union_pw_aff *multi,	
	enum isl_dim_type type);					
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_drop_dims(		
	 isl_multi_union_pw_aff *multi, enum isl_dim_type type,	
	unsigned first, unsigned n);
int isl_multi_union_pw_aff_find_dim_by_name(				
	 isl_multi_union_pw_aff *multi,				
	enum isl_dim_type type, const char *name);			
int isl_multi_union_pw_aff_find_dim_by_id(					
	 isl_multi_union_pw_aff *multi, enum isl_dim_type type,	
	 isl_id *id);						
 isl_id *isl_multi_union_pw_aff_get_dim_id(			
	 isl_multi_union_pw_aff *multi,				
	enum isl_dim_type type, unsigned pos);				
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_set_dim_name(		
	 isl_multi_union_pw_aff *multi,				
	enum isl_dim_type type, unsigned pos, const char *s);		
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_set_dim_id(		
	 isl_multi_union_pw_aff *multi,				
	enum isl_dim_type type, unsigned pos,  isl_id *id);   
const char *isl_multi_union_pw_aff_get_tuple_name(				
	 isl_multi_union_pw_aff *multi, enum isl_dim_type type);	
extern								
isl_bool isl_multi_union_pw_aff_has_range_tuple_id(				
	 isl_multi_union_pw_aff *multi);				
isl_bool isl_multi_union_pw_aff_has_tuple_id(				
	 isl_multi_union_pw_aff *multi, enum isl_dim_type type);	
extern								
 isl_id *isl_multi_union_pw_aff_get_range_tuple_id(		
	 isl_multi_union_pw_aff *multi);				
 isl_id *isl_multi_union_pw_aff_get_tuple_id(			
	 isl_multi_union_pw_aff *multi, enum isl_dim_type type);	
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_set_tuple_name(		
	 isl_multi_union_pw_aff *multi,				
	enum isl_dim_type type, const char *s);				
								
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_set_range_tuple_id(	
	 isl_multi_union_pw_aff *multi,   isl_id *id);	
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_set_tuple_id(		
	 isl_multi_union_pw_aff *multi,				
	enum isl_dim_type type,  isl_id *id);			
extern								
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_reset_range_tuple_id(	
	 isl_multi_union_pw_aff *multi);				
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_reset_tuple_id(		
	 isl_multi_union_pw_aff *multi, enum isl_dim_type type);    

extern
 isl_multi_union_pw_aff *isl_multi_aff_to_multi_union_pw_aff(
         isl_multi_aff *ma);
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_from_multi_aff(
	 isl_multi_aff *ma);

 isl_multi_union_pw_aff *isl_multi_union_pw_aff_from_union_pw_aff(
	 isl_union_pw_aff *upa);

 isl_multi_union_pw_aff *isl_multi_union_pw_aff_from_multi_pw_aff(
	 isl_multi_pw_aff *mpa);
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_multi_val_on_domain(
	 isl_union_set *domain,  isl_multi_val *mv);
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_multi_aff_on_domain(
	 isl_union_set *domain,  isl_multi_aff *ma);
 isl_multi_union_pw_aff *
isl_multi_union_pw_aff_pw_multi_aff_on_domain( isl_union_set *domain,
	 isl_pw_multi_aff *pma);

 isl_multi_union_pw_aff *isl_multi_union_pw_aff_floor(
	 isl_multi_union_pw_aff *mupa);

extern
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_intersect_domain(
	 isl_multi_union_pw_aff *mupa,
	 isl_union_set *uset);
extern
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_intersect_params(
	 isl_multi_union_pw_aff *mupa,  isl_set *params);
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_intersect_range(
	 isl_multi_union_pw_aff *mupa,  isl_set *set);

extern
 isl_union_set *isl_multi_union_pw_aff_domain(
	 isl_multi_union_pw_aff *mupa);

extern
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_coalesce(
	 isl_multi_union_pw_aff *mupa);
extern
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_gist(
	 isl_multi_union_pw_aff *mupa,
	 isl_union_set *context);
extern
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_gist_params(
	 isl_multi_union_pw_aff *mupa,  isl_set *context);

 isl_union_pw_aff *isl_multi_union_pw_aff_apply_aff(
	 isl_multi_union_pw_aff *mupa,  isl_aff *aff);
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_apply_multi_aff(
	 isl_multi_union_pw_aff *mupa,  isl_multi_aff *ma);
 isl_union_pw_aff *isl_multi_union_pw_aff_apply_pw_aff(
	 isl_multi_union_pw_aff *mupa,  isl_pw_aff *pa);
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_apply_pw_multi_aff(
	 isl_multi_union_pw_aff *mupa,
	 isl_pw_multi_aff *pma);


 isl_multi_union_pw_aff *
isl_multi_union_pw_aff_pullback_union_pw_multi_aff(
	 isl_multi_union_pw_aff *mupa,
	 isl_union_pw_multi_aff *upma);

 isl_union_pw_multi_aff *
isl_union_pw_multi_aff_from_multi_union_pw_aff(
	 isl_multi_union_pw_aff *mupa);

extern
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_union_add(
	 isl_multi_union_pw_aff *mupa1,
	 isl_multi_union_pw_aff *mupa2);

extern
 isl_multi_union_pw_aff *
isl_union_pw_multi_aff_as_multi_union_pw_aff(
	 isl_union_pw_multi_aff *upma);
 isl_multi_union_pw_aff *
isl_multi_union_pw_aff_from_union_pw_multi_aff(
	 isl_union_pw_multi_aff *upma);

extern
 isl_multi_union_pw_aff *isl_union_map_as_multi_union_pw_aff(
	 isl_union_map *umap);
 isl_multi_union_pw_aff *isl_multi_union_pw_aff_from_union_map(
	 isl_union_map *umap);

 isl_union_map *isl_union_map_from_multi_union_pw_aff(
	 isl_multi_union_pw_aff *mupa);

 isl_union_set *isl_multi_union_pw_aff_zero_union_set(
	 isl_multi_union_pw_aff *mupa);
extern
 isl_union_set *isl_multi_union_pw_aff_bind(
	 isl_multi_union_pw_aff *mupa,
	 isl_multi_id *tuple);

 isl_multi_pw_aff *isl_multi_union_pw_aff_extract_multi_pw_aff(
	 isl_multi_union_pw_aff *mupa,  isl_space *space);


 isl_multi_union_pw_aff *isl_multi_union_pw_aff_read_from_str(
	isl_ctx *ctx, const char *str);
 char *isl_multi_union_pw_aff_to_str(
	 isl_multi_union_pw_aff *mupa);
 isl_printer *isl_printer_print_multi_union_pw_aff(
	 isl_printer *p,  isl_multi_union_pw_aff *mupa);
void isl_multi_union_pw_aff_dump( isl_multi_union_pw_aff *mupa);

isl_ctx *isl_aff_list_get_ctx( isl_aff_list *list);	
 isl_aff_list *isl_aff_to_list( isl_aff *el);
 isl_aff_list *isl_aff_list_from_aff(			
	 isl_aff *el);					
 isl_aff_list *isl_aff_list_alloc(isl_ctx *ctx, int n);	
 isl_aff_list *isl_aff_list_copy(			
	 isl_aff_list *list);				
 isl_aff_list *isl_aff_list_free(			
	 isl_aff_list *list);				
 isl_aff_list *isl_aff_list_add(			
	 isl_aff_list *list,				
	 isl_aff *el);					
 isl_aff_list *isl_aff_list_insert(			
	 isl_aff_list *list, unsigned pos,			
	 isl_aff *el);					
 isl_aff_list *isl_aff_list_drop(			
	 isl_aff_list *list, unsigned first, unsigned n);	
 isl_aff_list *isl_aff_list_clear(			
	 isl_aff_list *list);				
 isl_aff_list *isl_aff_list_swap(			
	 isl_aff_list *list, unsigned pos1,		
	unsigned pos2);							
 isl_aff_list *isl_aff_list_reverse(			
	 isl_aff_list *list);				
 isl_aff_list *isl_aff_list_concat(			
	 isl_aff_list *list1,				
	 isl_aff_list *list2);				
isl_size isl_aff_list_size( isl_aff_list *list);	
isl_size isl_aff_list_n_aff( isl_aff_list *list);	
 isl_aff *isl_aff_list_get_at(				
	 isl_aff_list *list, int index);			
  isl_aff *isl_aff_list_get_aff(			
	 isl_aff_list *list, int index);			
 isl_aff_list *isl_aff_list_set_at(			
	 isl_aff_list *list, int index,			
	 isl_aff *el);					
  isl_aff_list *isl_aff_list_set_aff(		
	 struct isl_aff_list *list, int index,		
	 struct isl_aff *el);				
isl_stat isl_aff_list_foreach( isl_aff_list *list,	
	isl_stat (*fn)( isl_aff *el, void *user),		
	void *user);							
isl_bool isl_aff_list_every( isl_aff_list *list,	
	isl_bool (*test)( isl_aff *el, void *user),		
	void *user);							
 isl_aff_list *isl_aff_list_map(			
	 isl_aff_list *list,				
	 isl_aff * (*fn)( isl_aff *el,		
		void *user),						
	void *user);							
 isl_aff_list *isl_aff_list_sort(			
	 isl_aff_list *list,				
	int (*cmp)( struct isl_aff *a,			
		 struct isl_aff *b,				
		void *user), void *user);				
isl_stat isl_aff_list_foreach_scc( isl_aff_list *list,	
	isl_bool (*follows)( isl_aff *a,			
			 isl_aff *b, void *user),		
	void *follows_user,						
	isl_stat (*fn)( isl_aff_list *scc, void *user),	
	void *fn_user);							
 char *isl_aff_list_to_str(				
	 isl_aff_list *list);				
 isl_printer *isl_printer_print_aff_list(			
	 isl_printer *p,  isl_aff_list *list);	
void isl_aff_list_dump( isl_aff_list *list);  
isl_aff_list *isl_aff_list_read_from_str(		
	isl_ctx *ctx, const char *str);
isl_ctx *isl_pw_aff_list_get_ctx( isl_pw_aff_list *list);	
 isl_pw_aff_list *isl_pw_aff_to_list( isl_pw_aff *el);
 isl_pw_aff_list *isl_pw_aff_list_from_pw_aff(			
	 isl_pw_aff *el);					
 isl_pw_aff_list *isl_pw_aff_list_alloc(isl_ctx *ctx, int n);	
 isl_pw_aff_list *isl_pw_aff_list_copy(			
	 isl_pw_aff_list *list);				
 isl_pw_aff_list *isl_pw_aff_list_free(			
	 isl_pw_aff_list *list);				
 isl_pw_aff_list *isl_pw_aff_list_add(			
	 isl_pw_aff_list *list,				
	 isl_pw_aff *el);					
 isl_pw_aff_list *isl_pw_aff_list_insert(			
	 isl_pw_aff_list *list, unsigned pos,			
	 isl_pw_aff *el);					
 isl_pw_aff_list *isl_pw_aff_list_drop(			
	 isl_pw_aff_list *list, unsigned first, unsigned n);	
 isl_pw_aff_list *isl_pw_aff_list_clear(			
	 isl_pw_aff_list *list);				
 isl_pw_aff_list *isl_pw_aff_list_swap(			
	 isl_pw_aff_list *list, unsigned pos1,		
	unsigned pos2);							
 isl_pw_aff_list *isl_pw_aff_list_reverse(			
	 isl_pw_aff_list *list);				
 isl_pw_aff_list *isl_pw_aff_list_concat(			
	 isl_pw_aff_list *list1,				
	 isl_pw_aff_list *list2);				
isl_size isl_pw_aff_list_size( isl_pw_aff_list *list);	
isl_size isl_pw_aff_list_n_pw_aff( isl_pw_aff_list *list);	
 isl_pw_aff *isl_pw_aff_list_get_at(				
	 isl_pw_aff_list *list, int index);			
  isl_pw_aff *isl_pw_aff_list_get_pw_aff(			
	 isl_pw_aff_list *list, int index);			
 isl_pw_aff_list *isl_pw_aff_list_set_at(			
	 isl_pw_aff_list *list, int index,			
	 isl_pw_aff *el);					
  isl_pw_aff_list *isl_pw_aff_list_set_pw_aff(		
	 struct isl_pw_aff_list *list, int index,		
	 struct isl_pw_aff *el);				
isl_stat isl_pw_aff_list_foreach( isl_pw_aff_list *list,	
	isl_stat (*fn)( isl_pw_aff *el, void *user),		
	void *user);							
isl_bool isl_pw_aff_list_every( isl_pw_aff_list *list,	
	isl_bool (*test)( isl_pw_aff *el, void *user),		
	void *user);							
 isl_pw_aff_list *isl_pw_aff_list_map(			
	 isl_pw_aff_list *list,				
	 isl_pw_aff * (*fn)( isl_pw_aff *el,		
		void *user),						
	void *user);							
 isl_pw_aff_list *isl_pw_aff_list_sort(			
	 isl_pw_aff_list *list,				
	int (*cmp)( struct isl_pw_aff *a,			
		 struct isl_pw_aff *b,				
		void *user), void *user);				
isl_stat isl_pw_aff_list_foreach_scc( isl_pw_aff_list *list,	
	isl_bool (*follows)( isl_pw_aff *a,			
			 isl_pw_aff *b, void *user),		
	void *follows_user,						
	isl_stat (*fn)( isl_pw_aff_list *scc, void *user),	
	void *fn_user);							
 char *isl_pw_aff_list_to_str(				
	 isl_pw_aff_list *list);				
 isl_printer *isl_printer_print_pw_aff_list(			
	 isl_printer *p,  isl_pw_aff_list *list);	
void isl_pw_aff_list_dump( isl_pw_aff_list *list);  
isl_pw_aff_list *isl_pw_aff_list_read_from_str(		
	isl_ctx *ctx, const char *str);
isl_ctx *isl_pw_multi_aff_list_get_ctx( isl_pw_multi_aff_list *list);	
 isl_pw_multi_aff_list *isl_pw_multi_aff_to_list( isl_pw_multi_aff *el);
 isl_pw_multi_aff_list *isl_pw_multi_aff_list_from_pw_multi_aff(			
	 isl_pw_multi_aff *el);					
 isl_pw_multi_aff_list *isl_pw_multi_aff_list_alloc(isl_ctx *ctx, int n);	
 isl_pw_multi_aff_list *isl_pw_multi_aff_list_copy(			
	 isl_pw_multi_aff_list *list);				
 isl_pw_multi_aff_list *isl_pw_multi_aff_list_free(			
	 isl_pw_multi_aff_list *list);				
 isl_pw_multi_aff_list *isl_pw_multi_aff_list_add(			
	 isl_pw_multi_aff_list *list,				
	 isl_pw_multi_aff *el);					
 isl_pw_multi_aff_list *isl_pw_multi_aff_list_insert(			
	 isl_pw_multi_aff_list *list, unsigned pos,			
	 isl_pw_multi_aff *el);					
 isl_pw_multi_aff_list *isl_pw_multi_aff_list_drop(			
	 isl_pw_multi_aff_list *list, unsigned first, unsigned n);	
 isl_pw_multi_aff_list *isl_pw_multi_aff_list_clear(			
	 isl_pw_multi_aff_list *list);				
 isl_pw_multi_aff_list *isl_pw_multi_aff_list_swap(			
	 isl_pw_multi_aff_list *list, unsigned pos1,		
	unsigned pos2);							
 isl_pw_multi_aff_list *isl_pw_multi_aff_list_reverse(			
	 isl_pw_multi_aff_list *list);				
 isl_pw_multi_aff_list *isl_pw_multi_aff_list_concat(			
	 isl_pw_multi_aff_list *list1,				
	 isl_pw_multi_aff_list *list2);				
isl_size isl_pw_multi_aff_list_size( isl_pw_multi_aff_list *list);	
isl_size isl_pw_multi_aff_list_n_pw_multi_aff( isl_pw_multi_aff_list *list);	
 isl_pw_multi_aff *isl_pw_multi_aff_list_get_at(				
	 isl_pw_multi_aff_list *list, int index);			
  isl_pw_multi_aff *isl_pw_multi_aff_list_get_pw_multi_aff(			
	 isl_pw_multi_aff_list *list, int index);			
 isl_pw_multi_aff_list *isl_pw_multi_aff_list_set_at(			
	 isl_pw_multi_aff_list *list, int index,			
	 isl_pw_multi_aff *el);					
  isl_pw_multi_aff_list *isl_pw_multi_aff_list_set_pw_multi_aff(		
	 struct isl_pw_multi_aff_list *list, int index,		
	 struct isl_pw_multi_aff *el);				
isl_stat isl_pw_multi_aff_list_foreach( isl_pw_multi_aff_list *list,	
	isl_stat (*fn)( isl_pw_multi_aff *el, void *user),		
	void *user);							
isl_bool isl_pw_multi_aff_list_every( isl_pw_multi_aff_list *list,	
	isl_bool (*test)( isl_pw_multi_aff *el, void *user),		
	void *user);							
 isl_pw_multi_aff_list *isl_pw_multi_aff_list_map(			
	 isl_pw_multi_aff_list *list,				
	 isl_pw_multi_aff * (*fn)( isl_pw_multi_aff *el,		
		void *user),						
	void *user);							
 isl_pw_multi_aff_list *isl_pw_multi_aff_list_sort(			
	 isl_pw_multi_aff_list *list,				
	int (*cmp)( struct isl_pw_multi_aff *a,			
		 struct isl_pw_multi_aff *b,				
		void *user), void *user);				
isl_stat isl_pw_multi_aff_list_foreach_scc( isl_pw_multi_aff_list *list,	
	isl_bool (*follows)( isl_pw_multi_aff *a,			
			 isl_pw_multi_aff *b, void *user),		
	void *follows_user,						
	isl_stat (*fn)( isl_pw_multi_aff_list *scc, void *user),	
	void *fn_user);							
 char *isl_pw_multi_aff_list_to_str(				
	 isl_pw_multi_aff_list *list);				
 isl_printer *isl_printer_print_pw_multi_aff_list(			
	 isl_printer *p,  isl_pw_multi_aff_list *list);	
void isl_pw_multi_aff_list_dump( isl_pw_multi_aff_list *list);  
isl_pw_multi_aff_list *isl_pw_multi_aff_list_read_from_str(		
	isl_ctx *ctx, const char *str);
isl_ctx *isl_union_pw_aff_list_get_ctx( isl_union_pw_aff_list *list);	
 isl_union_pw_aff_list *isl_union_pw_aff_to_list( isl_union_pw_aff *el);
 isl_union_pw_aff_list *isl_union_pw_aff_list_from_union_pw_aff(			
	 isl_union_pw_aff *el);					
 isl_union_pw_aff_list *isl_union_pw_aff_list_alloc(isl_ctx *ctx, int n);	
 isl_union_pw_aff_list *isl_union_pw_aff_list_copy(			
	 isl_union_pw_aff_list *list);				
 isl_union_pw_aff_list *isl_union_pw_aff_list_free(			
	 isl_union_pw_aff_list *list);				
 isl_union_pw_aff_list *isl_union_pw_aff_list_add(			
	 isl_union_pw_aff_list *list,				
	 isl_union_pw_aff *el);					
 isl_union_pw_aff_list *isl_union_pw_aff_list_insert(			
	 isl_union_pw_aff_list *list, unsigned pos,			
	 isl_union_pw_aff *el);					
 isl_union_pw_aff_list *isl_union_pw_aff_list_drop(			
	 isl_union_pw_aff_list *list, unsigned first, unsigned n);	
 isl_union_pw_aff_list *isl_union_pw_aff_list_clear(			
	 isl_union_pw_aff_list *list);				
 isl_union_pw_aff_list *isl_union_pw_aff_list_swap(			
	 isl_union_pw_aff_list *list, unsigned pos1,		
	unsigned pos2);							
 isl_union_pw_aff_list *isl_union_pw_aff_list_reverse(			
	 isl_union_pw_aff_list *list);				
 isl_union_pw_aff_list *isl_union_pw_aff_list_concat(			
	 isl_union_pw_aff_list *list1,				
	 isl_union_pw_aff_list *list2);				
isl_size isl_union_pw_aff_list_size( isl_union_pw_aff_list *list);	
isl_size isl_union_pw_aff_list_n_union_pw_aff( isl_union_pw_aff_list *list);	
 isl_union_pw_aff *isl_union_pw_aff_list_get_at(				
	 isl_union_pw_aff_list *list, int index);			
  isl_union_pw_aff *isl_union_pw_aff_list_get_union_pw_aff(			
	 isl_union_pw_aff_list *list, int index);			
 isl_union_pw_aff_list *isl_union_pw_aff_list_set_at(			
	 isl_union_pw_aff_list *list, int index,			
	 isl_union_pw_aff *el);					
  isl_union_pw_aff_list *isl_union_pw_aff_list_set_union_pw_aff(		
	 struct isl_union_pw_aff_list *list, int index,		
	 struct isl_union_pw_aff *el);				
isl_stat isl_union_pw_aff_list_foreach( isl_union_pw_aff_list *list,	
	isl_stat (*fn)( isl_union_pw_aff *el, void *user),		
	void *user);							
isl_bool isl_union_pw_aff_list_every( isl_union_pw_aff_list *list,	
	isl_bool (*test)( isl_union_pw_aff *el, void *user),		
	void *user);							
 isl_union_pw_aff_list *isl_union_pw_aff_list_map(			
	 isl_union_pw_aff_list *list,				
	 isl_union_pw_aff * (*fn)( isl_union_pw_aff *el,		
		void *user),						
	void *user);							
 isl_union_pw_aff_list *isl_union_pw_aff_list_sort(			
	 isl_union_pw_aff_list *list,				
	int (*cmp)( struct isl_union_pw_aff *a,			
		 struct isl_union_pw_aff *b,				
		void *user), void *user);				
isl_stat isl_union_pw_aff_list_foreach_scc( isl_union_pw_aff_list *list,	
	isl_bool (*follows)( isl_union_pw_aff *a,			
			 isl_union_pw_aff *b, void *user),		
	void *follows_user,						
	isl_stat (*fn)( isl_union_pw_aff_list *scc, void *user),	
	void *fn_user);							
 char *isl_union_pw_aff_list_to_str(				
	 isl_union_pw_aff_list *list);				
 isl_printer *isl_printer_print_union_pw_aff_list(			
	 isl_printer *p,  isl_union_pw_aff_list *list);	
void isl_union_pw_aff_list_dump( isl_union_pw_aff_list *list);  
isl_union_pw_aff_list *isl_union_pw_aff_list_read_from_str(		
	isl_ctx *ctx, const char *str);
isl_ctx *isl_union_pw_multi_aff_list_get_ctx( isl_union_pw_multi_aff_list *list);	
 isl_union_pw_multi_aff_list *isl_union_pw_multi_aff_to_list( isl_union_pw_multi_aff *el);
 isl_union_pw_multi_aff_list *isl_union_pw_multi_aff_list_from_union_pw_multi_aff(			
	 isl_union_pw_multi_aff *el);					
 isl_union_pw_multi_aff_list *isl_union_pw_multi_aff_list_alloc(isl_ctx *ctx, int n);	
 isl_union_pw_multi_aff_list *isl_union_pw_multi_aff_list_copy(			
	 isl_union_pw_multi_aff_list *list);				
 isl_union_pw_multi_aff_list *isl_union_pw_multi_aff_list_free(			
	 isl_union_pw_multi_aff_list *list);				
 isl_union_pw_multi_aff_list *isl_union_pw_multi_aff_list_add(			
	 isl_union_pw_multi_aff_list *list,				
	 isl_union_pw_multi_aff *el);					
 isl_union_pw_multi_aff_list *isl_union_pw_multi_aff_list_insert(			
	 isl_union_pw_multi_aff_list *list, unsigned pos,			
	 isl_union_pw_multi_aff *el);					
 isl_union_pw_multi_aff_list *isl_union_pw_multi_aff_list_drop(			
	 isl_union_pw_multi_aff_list *list, unsigned first, unsigned n);	
 isl_union_pw_multi_aff_list *isl_union_pw_multi_aff_list_clear(			
	 isl_union_pw_multi_aff_list *list);				
 isl_union_pw_multi_aff_list *isl_union_pw_multi_aff_list_swap(			
	 isl_union_pw_multi_aff_list *list, unsigned pos1,		
	unsigned pos2);							
 isl_union_pw_multi_aff_list *isl_union_pw_multi_aff_list_reverse(			
	 isl_union_pw_multi_aff_list *list);				
 isl_union_pw_multi_aff_list *isl_union_pw_multi_aff_list_concat(			
	 isl_union_pw_multi_aff_list *list1,				
	 isl_union_pw_multi_aff_list *list2);				
isl_size isl_union_pw_multi_aff_list_size( isl_union_pw_multi_aff_list *list);	
isl_size isl_union_pw_multi_aff_list_n_union_pw_multi_aff( isl_union_pw_multi_aff_list *list);	
 isl_union_pw_multi_aff *isl_union_pw_multi_aff_list_get_at(				
	 isl_union_pw_multi_aff_list *list, int index);			
  isl_union_pw_multi_aff *isl_union_pw_multi_aff_list_get_union_pw_multi_aff(			
	 isl_union_pw_multi_aff_list *list, int index);			
 isl_union_pw_multi_aff_list *isl_union_pw_multi_aff_list_set_at(			
	 isl_union_pw_multi_aff_list *list, int index,			
	 isl_union_pw_multi_aff *el);					
  isl_union_pw_multi_aff_list *isl_union_pw_multi_aff_list_set_union_pw_multi_aff(		
	 struct isl_union_pw_multi_aff_list *list, int index,		
	 struct isl_union_pw_multi_aff *el);				
isl_stat isl_union_pw_multi_aff_list_foreach( isl_union_pw_multi_aff_list *list,	
	isl_stat (*fn)( isl_union_pw_multi_aff *el, void *user),		
	void *user);							
isl_bool isl_union_pw_multi_aff_list_every( isl_union_pw_multi_aff_list *list,	
	isl_bool (*test)( isl_union_pw_multi_aff *el, void *user),		
	void *user);							
 isl_union_pw_multi_aff_list *isl_union_pw_multi_aff_list_map(			
	 isl_union_pw_multi_aff_list *list,				
	 isl_union_pw_multi_aff * (*fn)( isl_union_pw_multi_aff *el,		
		void *user),						
	void *user);							
 isl_union_pw_multi_aff_list *isl_union_pw_multi_aff_list_sort(			
	 isl_union_pw_multi_aff_list *list,				
	int (*cmp)( struct isl_union_pw_multi_aff *a,			
		 struct isl_union_pw_multi_aff *b,				
		void *user), void *user);				
isl_stat isl_union_pw_multi_aff_list_foreach_scc( isl_union_pw_multi_aff_list *list,	
	isl_bool (*follows)( isl_union_pw_multi_aff *a,			
			 isl_union_pw_multi_aff *b, void *user),		
	void *follows_user,						
	isl_stat (*fn)( isl_union_pw_multi_aff_list *scc, void *user),	
	void *fn_user);							
 char *isl_union_pw_multi_aff_list_to_str(				
	 isl_union_pw_multi_aff_list *list);				
 isl_printer *isl_printer_print_union_pw_multi_aff_list(			
	 isl_printer *p,  isl_union_pw_multi_aff_list *list);	
void isl_union_pw_multi_aff_list_dump( isl_union_pw_multi_aff_list *list);  



#endif
