#ifndef ISL_POLYNOMIAL_H
#define ISL_POLYNOMIAL_H

#include <isl/ctx.h>
#include <isl/constraint.h>
#include <isl/space_type.h>
#include <isl/set_type.h>
#include <isl/point.h>
#include <isl/printer.h>
#include <isl/union_set_type.h>
#include <isl/aff_type.h>
#include <isl/polynomial_type.h>
#include <isl/val_type.h>

#if defined(__cplusplus)

#endif

isl_ctx *isl_qpolynomial_get_ctx( isl_qpolynomial *qp);
 isl_space *isl_qpolynomial_get_domain_space(
	 isl_qpolynomial *qp);
 isl_space *isl_qpolynomial_get_space( isl_qpolynomial *qp);
isl_size isl_qpolynomial_dim( isl_qpolynomial *qp,
	enum isl_dim_type type);
isl_bool isl_qpolynomial_involves_dims( isl_qpolynomial *qp,
	enum isl_dim_type type, unsigned first, unsigned n);

 isl_val *isl_qpolynomial_get_constant_val(
	 isl_qpolynomial *qp);

 isl_qpolynomial *isl_qpolynomial_set_dim_name(
	 isl_qpolynomial *qp,
	enum isl_dim_type type, unsigned pos, const char *s);

 isl_qpolynomial *isl_qpolynomial_zero_on_domain(
	 isl_space *domain);
 isl_qpolynomial *isl_qpolynomial_one_on_domain(
	 isl_space *domain);
 isl_qpolynomial *isl_qpolynomial_infty_on_domain(
	 isl_space *domain);
 isl_qpolynomial *isl_qpolynomial_neginfty_on_domain(
	 isl_space *domain);
 isl_qpolynomial *isl_qpolynomial_nan_on_domain(
	 isl_space *domain);
 isl_qpolynomial *isl_qpolynomial_val_on_domain(
	 isl_space *space,  isl_val *val);
 isl_qpolynomial *isl_qpolynomial_var_on_domain(
	 isl_space *domain,
	enum isl_dim_type type, unsigned pos);
 isl_qpolynomial *isl_qpolynomial_copy( isl_qpolynomial *qp);
 isl_qpolynomial *isl_qpolynomial_free(
	 isl_qpolynomial *qp);

isl_bool isl_qpolynomial_plain_is_equal( isl_qpolynomial *qp1,
	 isl_qpolynomial *qp2);
isl_bool isl_qpolynomial_is_zero( isl_qpolynomial *qp);
isl_bool isl_qpolynomial_is_nan( isl_qpolynomial *qp);
isl_bool isl_qpolynomial_is_infty( isl_qpolynomial *qp);
isl_bool isl_qpolynomial_is_neginfty( isl_qpolynomial *qp);
int isl_qpolynomial_sgn( isl_qpolynomial *qp);

 isl_qpolynomial *isl_qpolynomial_neg( isl_qpolynomial *qp);
 isl_qpolynomial *isl_qpolynomial_add( isl_qpolynomial *qp1,
	 isl_qpolynomial *qp2);
 isl_qpolynomial *isl_qpolynomial_sub( isl_qpolynomial *qp1,
	 isl_qpolynomial *qp2);
 isl_qpolynomial *isl_qpolynomial_mul( isl_qpolynomial *qp1,
	 isl_qpolynomial *qp2);
 isl_qpolynomial *isl_qpolynomial_pow( isl_qpolynomial *qp,
	unsigned power);
 isl_qpolynomial *isl_qpolynomial_scale_val(
	 isl_qpolynomial *qp,  isl_val *v);
 isl_qpolynomial *isl_qpolynomial_scale_down_val(
	 isl_qpolynomial *qp,  isl_val *v);

 isl_qpolynomial *isl_qpolynomial_domain_reverse(
	 isl_qpolynomial *qp);
 isl_qpolynomial *isl_qpolynomial_insert_dims(
	 isl_qpolynomial *qp, enum isl_dim_type type,
	unsigned first, unsigned n);
 isl_qpolynomial *isl_qpolynomial_add_dims(
	 isl_qpolynomial *qp, enum isl_dim_type type, unsigned n);
 isl_qpolynomial *isl_qpolynomial_move_dims(
	 isl_qpolynomial *qp,
	enum isl_dim_type dst_type, unsigned dst_pos,
	enum isl_dim_type src_type, unsigned src_pos, unsigned n);
 isl_qpolynomial *isl_qpolynomial_project_domain_on_params(
	 isl_qpolynomial *qp);
 isl_qpolynomial *isl_qpolynomial_drop_dims(
	 isl_qpolynomial *qp,
	enum isl_dim_type type, unsigned first, unsigned n);

 isl_qpolynomial *isl_qpolynomial_substitute(
	 isl_qpolynomial *qp,
	enum isl_dim_type type, unsigned first, unsigned n,
	 isl_qpolynomial **subs);

isl_stat isl_qpolynomial_as_polynomial_on_domain( isl_qpolynomial *qp,
	 isl_basic_set *bset,
	isl_stat (*fn)( isl_basic_set *bset,
		   isl_qpolynomial *poly, void *user), void *user);

 isl_qpolynomial *isl_qpolynomial_homogenize(
	 isl_qpolynomial *poly);

 isl_qpolynomial *isl_qpolynomial_align_params(
	 isl_qpolynomial *qp,  isl_space *model);

isl_ctx *isl_term_get_ctx( isl_term *term);

 isl_term *isl_term_copy( isl_term *term);
 isl_term *isl_term_free( isl_term *term);

isl_size isl_term_dim( isl_term *term, enum isl_dim_type type);
 isl_val *isl_term_get_coefficient_val( isl_term *term);
isl_size isl_term_get_exp( isl_term *term,
	enum isl_dim_type type, unsigned pos);
 isl_aff *isl_term_get_div( isl_term *term, unsigned pos);

isl_stat isl_qpolynomial_foreach_term( isl_qpolynomial *qp,
	isl_stat (*fn)( isl_term *term, void *user), void *user);

 isl_val *isl_qpolynomial_eval( isl_qpolynomial *qp,
	 isl_point *pnt);

 isl_qpolynomial *isl_qpolynomial_gist_params(
	 isl_qpolynomial *qp,  isl_set *context);
 isl_qpolynomial *isl_qpolynomial_gist(
	 isl_qpolynomial *qp,  isl_set *context);

 isl_qpolynomial *isl_qpolynomial_from_constraint(
	 isl_constraint *c, enum isl_dim_type type, unsigned pos);
 isl_qpolynomial *isl_qpolynomial_from_term( isl_term *term);
 isl_qpolynomial *isl_qpolynomial_from_aff( isl_aff *aff);
 isl_basic_map *isl_basic_map_from_qpolynomial(
	 isl_qpolynomial *qp);

 isl_printer *isl_printer_print_qpolynomial(
	 isl_printer *p,  isl_qpolynomial *qp);
void isl_qpolynomial_print( isl_qpolynomial *qp, FILE *out,
	unsigned output_format);
void isl_qpolynomial_dump( isl_qpolynomial *qp);

isl_ctx *isl_pw_qpolynomial_get_ctx( isl_pw_qpolynomial *pwqp);

isl_bool isl_pw_qpolynomial_involves_nan( isl_pw_qpolynomial *pwqp);
isl_bool isl_pw_qpolynomial_plain_is_equal( isl_pw_qpolynomial *pwqp1,
	 isl_pw_qpolynomial *pwqp2);

 isl_pw_qpolynomial *isl_pw_qpolynomial_zero(
	 isl_space *space);
 isl_pw_qpolynomial *isl_pw_qpolynomial_alloc( isl_set *set,
	 isl_qpolynomial *qp);
 isl_pw_qpolynomial *isl_pw_qpolynomial_from_qpolynomial(
	 isl_qpolynomial *qp);
 isl_pw_qpolynomial *isl_pw_qpolynomial_copy(
	 isl_pw_qpolynomial *pwqp);
 isl_pw_qpolynomial *isl_pw_qpolynomial_free(
	 isl_pw_qpolynomial *pwqp);

isl_bool isl_pw_qpolynomial_is_zero( isl_pw_qpolynomial *pwqp);

 isl_space *isl_pw_qpolynomial_get_domain_space(
	 isl_pw_qpolynomial *pwqp);
 isl_space *isl_pw_qpolynomial_get_space(
	 isl_pw_qpolynomial *pwqp);
 isl_pw_qpolynomial *isl_pw_qpolynomial_reset_domain_space(
	 isl_pw_qpolynomial *pwqp,  isl_space *space);
isl_size isl_pw_qpolynomial_dim( isl_pw_qpolynomial *pwqp,
	enum isl_dim_type type);
isl_bool isl_pw_qpolynomial_involves_param_id(
	 isl_pw_qpolynomial *pwqp,  isl_id *id);
isl_bool isl_pw_qpolynomial_involves_dims( isl_pw_qpolynomial *pwqp,
	enum isl_dim_type type, unsigned first, unsigned n);
isl_bool isl_pw_qpolynomial_has_equal_space(
	 isl_pw_qpolynomial *pwqp1,
	 isl_pw_qpolynomial *pwqp2);

 isl_pw_qpolynomial *isl_pw_qpolynomial_set_dim_name(
	 isl_pw_qpolynomial *pwqp,
	enum isl_dim_type type, unsigned pos, const char *s);

int isl_pw_qpolynomial_find_dim_by_name( isl_pw_qpolynomial *pwqp,
	enum isl_dim_type type, const char *name);

 isl_pw_qpolynomial *isl_pw_qpolynomial_reset_user(
	 isl_pw_qpolynomial *pwqp);

extern
 isl_set *isl_pw_qpolynomial_domain( isl_pw_qpolynomial *pwqp);
 isl_pw_qpolynomial *isl_pw_qpolynomial_intersect_domain(
	 isl_pw_qpolynomial *pwpq,  isl_set *set);
 isl_pw_qpolynomial *
isl_pw_qpolynomial_intersect_domain_wrapped_domain(
	 isl_pw_qpolynomial *pwpq,  isl_set *set);
 isl_pw_qpolynomial *
isl_pw_qpolynomial_intersect_domain_wrapped_range(
	 isl_pw_qpolynomial *pwpq,  isl_set *set);
 isl_pw_qpolynomial *isl_pw_qpolynomial_intersect_params(
	 isl_pw_qpolynomial *pwpq,  isl_set *set);
 isl_pw_qpolynomial *isl_pw_qpolynomial_subtract_domain(
	 isl_pw_qpolynomial *pwpq,  isl_set *set);

 isl_pw_qpolynomial *isl_pw_qpolynomial_project_domain_on_params(
	 isl_pw_qpolynomial *pwqp);
 isl_pw_qpolynomial *isl_pw_qpolynomial_from_range(
	 isl_pw_qpolynomial *pwqp);
 isl_pw_qpolynomial *isl_pw_qpolynomial_drop_dims(
	 isl_pw_qpolynomial *pwqp,
	enum isl_dim_type type, unsigned first, unsigned n);
 isl_pw_qpolynomial *isl_pw_qpolynomial_split_dims(
	 isl_pw_qpolynomial *pwqp,
	enum isl_dim_type type, unsigned first, unsigned n);

 isl_pw_qpolynomial *isl_pw_qpolynomial_drop_unused_params(
	 isl_pw_qpolynomial *pwqp);

 isl_pw_qpolynomial *isl_pw_qpolynomial_add(
	 isl_pw_qpolynomial *pwqp1,
	 isl_pw_qpolynomial *pwqp2);
 isl_pw_qpolynomial *isl_pw_qpolynomial_sub(
	 isl_pw_qpolynomial *pwqp1,
	 isl_pw_qpolynomial *pwqp2);
 isl_pw_qpolynomial *isl_pw_qpolynomial_add_disjoint(
	 isl_pw_qpolynomial *pwqp1,
	 isl_pw_qpolynomial *pwqp2);
 isl_pw_qpolynomial *isl_pw_qpolynomial_neg(
	 isl_pw_qpolynomial *pwqp);
 isl_pw_qpolynomial *isl_pw_qpolynomial_mul(
	 isl_pw_qpolynomial *pwqp1,
	 isl_pw_qpolynomial *pwqp2);
 isl_pw_qpolynomial *isl_pw_qpolynomial_scale_val(
	 isl_pw_qpolynomial *pwqp,  isl_val *v);
 isl_pw_qpolynomial *isl_pw_qpolynomial_scale_down_val(
	 isl_pw_qpolynomial *pwqp,  isl_val *v);
 isl_pw_qpolynomial *isl_pw_qpolynomial_pow(
	 isl_pw_qpolynomial *pwqp, unsigned exponent);

 isl_pw_qpolynomial *isl_pw_qpolynomial_domain_reverse(
	 isl_pw_qpolynomial *pwqp);
 isl_pw_qpolynomial *isl_pw_qpolynomial_insert_dims(
	 isl_pw_qpolynomial *pwqp, enum isl_dim_type type,
	unsigned first, unsigned n);
 isl_pw_qpolynomial *isl_pw_qpolynomial_add_dims(
	 isl_pw_qpolynomial *pwqp,
	enum isl_dim_type type, unsigned n);
 isl_pw_qpolynomial *isl_pw_qpolynomial_move_dims(
	 isl_pw_qpolynomial *pwqp,
	enum isl_dim_type dst_type, unsigned dst_pos,
	enum isl_dim_type src_type, unsigned src_pos, unsigned n);

 isl_pw_qpolynomial *isl_pw_qpolynomial_fix_val(
	 isl_pw_qpolynomial *pwqp,
	enum isl_dim_type type, unsigned n,  isl_val *v);

extern
 isl_val *isl_pw_qpolynomial_eval(
	 isl_pw_qpolynomial *pwqp,  isl_point *pnt);

 isl_val *isl_pw_qpolynomial_max( isl_pw_qpolynomial *pwqp);
 isl_val *isl_pw_qpolynomial_min( isl_pw_qpolynomial *pwqp);

isl_size isl_pw_qpolynomial_n_piece( isl_pw_qpolynomial *pwqp);
isl_stat isl_pw_qpolynomial_foreach_piece( isl_pw_qpolynomial *pwqp,
	isl_stat (*fn)( isl_set *set,  isl_qpolynomial *qp,
		    void *user), void *user);
isl_bool isl_pw_qpolynomial_every_piece( isl_pw_qpolynomial *pwqp,
	isl_bool (*test)( isl_set *set,
		 isl_qpolynomial *qp, void *user), void *user);
isl_stat isl_pw_qpolynomial_foreach_lifted_piece(
	 isl_pw_qpolynomial *pwqp,
	isl_stat (*fn)( isl_set *set,  isl_qpolynomial *qp,
		    void *user), void *user);
isl_bool isl_pw_qpolynomial_isa_qpolynomial(
	 isl_pw_qpolynomial *pwqp);
 isl_qpolynomial *isl_pw_qpolynomial_as_qpolynomial(
	 isl_pw_qpolynomial *pwqp);

 isl_pw_qpolynomial *isl_pw_qpolynomial_from_pw_aff(
	 isl_pw_aff *pwaff);


 isl_pw_qpolynomial *isl_pw_qpolynomial_read_from_str(isl_ctx *ctx,
		const char *str);
 isl_pw_qpolynomial *isl_pw_qpolynomial_read_from_file(isl_ctx *ctx,
		FILE *input);
 char *isl_pw_qpolynomial_to_str( isl_pw_qpolynomial *pwqp);
 isl_printer *isl_printer_print_pw_qpolynomial(
	 isl_printer *p,  isl_pw_qpolynomial *pwqp);
void isl_pw_qpolynomial_print( isl_pw_qpolynomial *pwqp, FILE *out,
	unsigned output_format);
void isl_pw_qpolynomial_dump( isl_pw_qpolynomial *pwqp);

 isl_pw_qpolynomial *isl_pw_qpolynomial_coalesce(
	 isl_pw_qpolynomial *pwqp);
 isl_pw_qpolynomial *isl_pw_qpolynomial_gist(
	 isl_pw_qpolynomial *pwqp,  isl_set *context);
 isl_pw_qpolynomial *isl_pw_qpolynomial_gist_params(
	 isl_pw_qpolynomial *pwqp,  isl_set *context);

 isl_pw_qpolynomial *isl_pw_qpolynomial_split_periods(
	 isl_pw_qpolynomial *pwqp, int max_periods);

 isl_pw_qpolynomial *isl_basic_set_multiplicative_call(
	 isl_basic_set *bset,
	 isl_pw_qpolynomial *(*fn)( isl_basic_set *bset));

isl_ctx *isl_qpolynomial_fold_get_ctx( isl_qpolynomial_fold *fold);
enum isl_fold isl_qpolynomial_fold_get_type( isl_qpolynomial_fold *fold);

 isl_qpolynomial_fold *isl_qpolynomial_fold_empty(enum isl_fold type,
	 isl_space *space);
 isl_qpolynomial_fold *isl_qpolynomial_fold_alloc(
	enum isl_fold type,  isl_qpolynomial *qp);
 isl_qpolynomial_fold *isl_qpolynomial_fold_copy(
	 isl_qpolynomial_fold *fold);
 isl_qpolynomial_fold *isl_qpolynomial_fold_free(
	 isl_qpolynomial_fold *fold);

isl_bool isl_qpolynomial_fold_is_empty( isl_qpolynomial_fold *fold);
isl_bool isl_qpolynomial_fold_is_nan( isl_qpolynomial_fold *fold);
isl_bool isl_qpolynomial_fold_plain_is_equal(
	 isl_qpolynomial_fold *fold1,
	 isl_qpolynomial_fold *fold2);

 isl_space *isl_qpolynomial_fold_get_domain_space(
	 isl_qpolynomial_fold *fold);
 isl_space *isl_qpolynomial_fold_get_space(
	 isl_qpolynomial_fold *fold);

 isl_qpolynomial_fold *isl_qpolynomial_fold_fold(
	 isl_qpolynomial_fold *fold1,
	 isl_qpolynomial_fold *fold2);

 isl_qpolynomial_fold *isl_qpolynomial_fold_scale_val(
	 isl_qpolynomial_fold *fold,  isl_val *v);
 isl_qpolynomial_fold *isl_qpolynomial_fold_scale_down_val(
	 isl_qpolynomial_fold *fold,  isl_val *v);

 isl_qpolynomial_fold *isl_qpolynomial_fold_move_dims(
	 isl_qpolynomial_fold *fold,
	enum isl_dim_type dst_type, unsigned dst_pos,
	enum isl_dim_type src_type, unsigned src_pos, unsigned n);

 isl_qpolynomial_fold *isl_qpolynomial_fold_substitute(
	 isl_qpolynomial_fold *fold,
	enum isl_dim_type type, unsigned first, unsigned n,
	 isl_qpolynomial **subs);

 isl_pw_qpolynomial_fold *isl_pw_qpolynomial_fold_fix_val(
	 isl_pw_qpolynomial_fold *pwf,
	enum isl_dim_type type, unsigned n,  isl_val *v);

 isl_val *isl_qpolynomial_fold_eval(
	 isl_qpolynomial_fold *fold,  isl_point *pnt);

 isl_qpolynomial_fold *isl_qpolynomial_fold_gist_params(
	 isl_qpolynomial_fold *fold,  isl_set *context);
 isl_qpolynomial_fold *isl_qpolynomial_fold_gist(
	 isl_qpolynomial_fold *fold,  isl_set *context);

isl_stat isl_qpolynomial_fold_foreach_qpolynomial(
	 isl_qpolynomial_fold *fold,
	isl_stat (*fn)( isl_qpolynomial *qp, void *user), void *user);

 isl_printer *isl_printer_print_qpolynomial_fold(
	 isl_printer *p,  isl_qpolynomial_fold *fold);
void isl_qpolynomial_fold_print( isl_qpolynomial_fold *fold, FILE *out,
	unsigned output_format);
void isl_qpolynomial_fold_dump( isl_qpolynomial_fold *fold);

isl_ctx *isl_pw_qpolynomial_fold_get_ctx( isl_pw_qpolynomial_fold *pwf);
enum isl_fold isl_pw_qpolynomial_fold_get_type(
	 isl_pw_qpolynomial_fold *pwf);

isl_bool isl_pw_qpolynomial_fold_involves_nan(
	 isl_pw_qpolynomial_fold *pwf);
isl_bool isl_pw_qpolynomial_fold_plain_is_equal(
	 isl_pw_qpolynomial_fold *pwf1,
	 isl_pw_qpolynomial_fold *pwf2);

 isl_pw_qpolynomial_fold *isl_pw_qpolynomial_fold_from_pw_qpolynomial(
	enum isl_fold type,  isl_pw_qpolynomial *pwqp);

 isl_pw_qpolynomial_fold *isl_pw_qpolynomial_fold_alloc(
	enum isl_fold type,
	 isl_set *set,  isl_qpolynomial_fold *fold);
 isl_pw_qpolynomial_fold *
isl_pw_qpolynomial_fold_from_qpolynomial_fold(
	 isl_qpolynomial_fold *fold);
 isl_pw_qpolynomial_fold *isl_pw_qpolynomial_fold_copy(
	 isl_pw_qpolynomial_fold *pwf);
 isl_pw_qpolynomial_fold *isl_pw_qpolynomial_fold_free(
	 isl_pw_qpolynomial_fold *pwf);

isl_bool isl_pw_qpolynomial_fold_is_zero(
	 isl_pw_qpolynomial_fold *pwf);

 isl_space *isl_pw_qpolynomial_fold_get_domain_space(
	 isl_pw_qpolynomial_fold *pwf);
 isl_space *isl_pw_qpolynomial_fold_get_space(
	 isl_pw_qpolynomial_fold *pwf);
 isl_pw_qpolynomial_fold *isl_pw_qpolynomial_fold_reset_space(
	 isl_pw_qpolynomial_fold *pwf,  isl_space *space);
isl_size isl_pw_qpolynomial_fold_dim( isl_pw_qpolynomial_fold *pwf,
	enum isl_dim_type type);
isl_bool isl_pw_qpolynomial_fold_involves_param_id(
	 isl_pw_qpolynomial_fold *pwf,  isl_id *id);
isl_bool isl_pw_qpolynomial_fold_has_equal_space(
	 isl_pw_qpolynomial_fold *pwf1,
	 isl_pw_qpolynomial_fold *pwf2);

size_t isl_pw_qpolynomial_fold_size( isl_pw_qpolynomial_fold *pwf);

 isl_pw_qpolynomial_fold *isl_pw_qpolynomial_fold_zero(
	 isl_space *space, enum isl_fold type);

 isl_pw_qpolynomial_fold *isl_pw_qpolynomial_fold_set_dim_name(
	 isl_pw_qpolynomial_fold *pwf,
	enum isl_dim_type type, unsigned pos, const char *s);

int isl_pw_qpolynomial_fold_find_dim_by_name(
	 isl_pw_qpolynomial_fold *pwf,
	enum isl_dim_type type, const char *name);

 isl_pw_qpolynomial_fold *isl_pw_qpolynomial_fold_reset_user(
	 isl_pw_qpolynomial_fold *pwf);

 isl_set *isl_pw_qpolynomial_fold_domain(
	 isl_pw_qpolynomial_fold *pwf);
 isl_pw_qpolynomial_fold *isl_pw_qpolynomial_fold_intersect_domain(
	 isl_pw_qpolynomial_fold *pwf,  isl_set *set);
 isl_pw_qpolynomial_fold *
isl_pw_qpolynomial_fold_intersect_domain_wrapped_domain(
	 isl_pw_qpolynomial_fold *pwf,  isl_set *set);
 isl_pw_qpolynomial_fold *
isl_pw_qpolynomial_fold_intersect_domain_wrapped_range(
	 isl_pw_qpolynomial_fold *pwf,  isl_set *set);
 isl_pw_qpolynomial_fold *isl_pw_qpolynomial_fold_intersect_params(
	 isl_pw_qpolynomial_fold *pwf,  isl_set *set);
 isl_pw_qpolynomial_fold *isl_pw_qpolynomial_fold_subtract_domain(
	 isl_pw_qpolynomial_fold *pwf,  isl_set *set);

 isl_pw_qpolynomial_fold *isl_pw_qpolynomial_fold_add(
	 isl_pw_qpolynomial_fold *pwf1,
	 isl_pw_qpolynomial_fold *pwf2);
 isl_pw_qpolynomial_fold *isl_pw_qpolynomial_fold_fold(
	 isl_pw_qpolynomial_fold *pwf1,
	 isl_pw_qpolynomial_fold *pwf2);
 isl_pw_qpolynomial_fold *isl_pw_qpolynomial_fold_add_disjoint(
	 isl_pw_qpolynomial_fold *pwf1,
	 isl_pw_qpolynomial_fold *pwf2);
 isl_pw_qpolynomial_fold *isl_pw_qpolynomial_fold_scale_val(
	 isl_pw_qpolynomial_fold *pwf,  isl_val *v);
 isl_pw_qpolynomial_fold *isl_pw_qpolynomial_fold_scale_down_val(
	 isl_pw_qpolynomial_fold *pwf,  isl_val *v);

 isl_pw_qpolynomial_fold *isl_pw_qpolynomial_fold_project_domain_on_params(
	 isl_pw_qpolynomial_fold *pwf);
 isl_pw_qpolynomial_fold *isl_pw_qpolynomial_fold_from_range(
	 isl_pw_qpolynomial_fold *pwf);
 isl_pw_qpolynomial_fold *isl_pw_qpolynomial_fold_drop_dims(
	 isl_pw_qpolynomial_fold *pwf,
	enum isl_dim_type type, unsigned first, unsigned n);
 isl_pw_qpolynomial_fold *isl_pw_qpolynomial_fold_move_dims(
	 isl_pw_qpolynomial_fold *pwf,
	enum isl_dim_type dst_type, unsigned dst_pos,
	enum isl_dim_type src_type, unsigned src_pos, unsigned n);

 isl_pw_qpolynomial_fold *isl_pw_qpolynomial_fold_drop_unused_params(
	 isl_pw_qpolynomial_fold *pwf);

 isl_val *isl_pw_qpolynomial_fold_eval(
	 isl_pw_qpolynomial_fold *pwf,  isl_point *pnt);

isl_size isl_pw_qpolynomial_fold_n_piece(
	 isl_pw_qpolynomial_fold *pwf);
isl_stat isl_pw_qpolynomial_fold_foreach_piece(
	 isl_pw_qpolynomial_fold *pwf,
	isl_stat (*fn)( isl_set *set,
		 isl_qpolynomial_fold *fold, void *user), void *user);
isl_bool isl_pw_qpolynomial_fold_every_piece(
	 isl_pw_qpolynomial_fold *pwf,
	isl_bool (*test)( isl_set *set,
		 isl_qpolynomial_fold *fold, void *user), void *user);
isl_stat isl_pw_qpolynomial_fold_foreach_lifted_piece(
	 isl_pw_qpolynomial_fold *pwf,
	isl_stat (*fn)( isl_set *set,
		 isl_qpolynomial_fold *fold, void *user), void *user);
isl_bool isl_pw_qpolynomial_fold_isa_qpolynomial_fold(
	 isl_pw_qpolynomial_fold *pwf);
 isl_qpolynomial_fold *isl_pw_qpolynomial_fold_as_qpolynomial_fold(
	 isl_pw_qpolynomial_fold *pwf);

 isl_pw_qpolynomial_fold *isl_pw_qpolynomial_fold_read_from_str(
	isl_ctx *ctx, const char *str);
 isl_printer *isl_printer_print_pw_qpolynomial_fold(
	 isl_printer *p,  isl_pw_qpolynomial_fold *pwf);
void isl_pw_qpolynomial_fold_print( isl_pw_qpolynomial_fold *pwf,
	FILE *out, unsigned output_format);
void isl_pw_qpolynomial_fold_dump( isl_pw_qpolynomial_fold *pwf);

 isl_pw_qpolynomial_fold *isl_pw_qpolynomial_fold_coalesce(
	 isl_pw_qpolynomial_fold *pwf);
 isl_pw_qpolynomial_fold *isl_pw_qpolynomial_fold_gist(
	 isl_pw_qpolynomial_fold *pwf,  isl_set *context);
 isl_pw_qpolynomial_fold *isl_pw_qpolynomial_fold_gist_params(
	 isl_pw_qpolynomial_fold *pwf,  isl_set *context);

 isl_val *isl_pw_qpolynomial_fold_max(
	 isl_pw_qpolynomial_fold *pwf);
 isl_val *isl_pw_qpolynomial_fold_min(
	 isl_pw_qpolynomial_fold *pwf);

 isl_pw_qpolynomial_fold *isl_pw_qpolynomial_bound(
	 isl_pw_qpolynomial *pwqp, enum isl_fold type,
	isl_bool *tight);
 isl_pw_qpolynomial_fold *isl_pw_qpolynomial_fold_bound(
	 isl_pw_qpolynomial_fold *pwf, isl_bool *tight);
 isl_pw_qpolynomial_fold *isl_set_apply_pw_qpolynomial_fold(
	 isl_set *set,  isl_pw_qpolynomial_fold *pwf,
	isl_bool *tight);
 isl_pw_qpolynomial_fold *isl_map_apply_pw_qpolynomial_fold(
	 isl_map *map,  isl_pw_qpolynomial_fold *pwf,
	isl_bool *tight);

 isl_pw_qpolynomial *isl_pw_qpolynomial_to_polynomial(
	 isl_pw_qpolynomial *pwqp, int sign);

isl_ctx *isl_union_pw_qpolynomial_get_ctx(
	 isl_union_pw_qpolynomial *upwqp);

isl_size isl_union_pw_qpolynomial_dim(
	 isl_union_pw_qpolynomial *upwqp, enum isl_dim_type type);

isl_bool isl_union_pw_qpolynomial_involves_nan(
	 isl_union_pw_qpolynomial *upwqp);
isl_bool isl_union_pw_qpolynomial_plain_is_equal(
	 isl_union_pw_qpolynomial *upwqp1,
	 isl_union_pw_qpolynomial *upwqp2);

 isl_union_pw_qpolynomial *isl_pw_qpolynomial_to_union_pw_qpolynomial(
	 isl_pw_qpolynomial *pwqp);
 isl_union_pw_qpolynomial *isl_union_pw_qpolynomial_from_pw_qpolynomial( isl_pw_qpolynomial *pwqp);
 isl_union_pw_qpolynomial *isl_union_pw_qpolynomial_zero_ctx(
	isl_ctx *ctx);
 isl_union_pw_qpolynomial *isl_union_pw_qpolynomial_zero_space(
	 isl_space *space);
 isl_union_pw_qpolynomial *isl_union_pw_qpolynomial_zero(
	 isl_space *space);
 isl_union_pw_qpolynomial *isl_union_pw_qpolynomial_add_pw_qpolynomial(
	 isl_union_pw_qpolynomial *upwqp,
	 isl_pw_qpolynomial *pwqp);
 isl_union_pw_qpolynomial *isl_union_pw_qpolynomial_copy(
	 isl_union_pw_qpolynomial *upwqp);
 isl_union_pw_qpolynomial *isl_union_pw_qpolynomial_free(
	 isl_union_pw_qpolynomial *upwqp);


 isl_union_pw_qpolynomial *isl_union_pw_qpolynomial_read_from_str(
	isl_ctx *ctx, const char *str);
 char *isl_union_pw_qpolynomial_to_str(
	 isl_union_pw_qpolynomial *upwqp);

 isl_union_pw_qpolynomial *isl_union_pw_qpolynomial_neg(
	 isl_union_pw_qpolynomial *upwqp);

 isl_union_pw_qpolynomial *isl_union_pw_qpolynomial_add(
	 isl_union_pw_qpolynomial *upwqp1,
	 isl_union_pw_qpolynomial *upwqp2);
 isl_union_pw_qpolynomial *isl_union_pw_qpolynomial_sub(
	 isl_union_pw_qpolynomial *upwqp1,
	 isl_union_pw_qpolynomial *upwqp2);
 isl_union_pw_qpolynomial *isl_union_pw_qpolynomial_mul(
	 isl_union_pw_qpolynomial *upwqp1,
	 isl_union_pw_qpolynomial *upwqp2);
 isl_union_pw_qpolynomial *isl_union_pw_qpolynomial_scale_val(
	 isl_union_pw_qpolynomial *upwqp,  isl_val *v);
 isl_union_pw_qpolynomial *isl_union_pw_qpolynomial_scale_down_val(
	 isl_union_pw_qpolynomial *upwqp,  isl_val *v);

extern
 isl_union_set *isl_union_pw_qpolynomial_domain(
	 isl_union_pw_qpolynomial *upwqp);
 isl_union_pw_qpolynomial *
isl_union_pw_qpolynomial_intersect_domain_space(
	 isl_union_pw_qpolynomial *upwpq,
	 isl_space *space);
 isl_union_pw_qpolynomial *
isl_union_pw_qpolynomial_intersect_domain_union_set(
	 isl_union_pw_qpolynomial *upwpq,
	 isl_union_set *uset);
 isl_union_pw_qpolynomial *isl_union_pw_qpolynomial_intersect_domain(
	 isl_union_pw_qpolynomial *upwpq,
	 isl_union_set *uset);
 isl_union_pw_qpolynomial *
isl_union_pw_qpolynomial_intersect_domain_wrapped_domain(
	 isl_union_pw_qpolynomial *upwpq,
	 isl_union_set *uset);
 isl_union_pw_qpolynomial *
isl_union_pw_qpolynomial_intersect_domain_wrapped_range(
	 isl_union_pw_qpolynomial *upwpq,
	 isl_union_set *uset);
 isl_union_pw_qpolynomial *isl_union_pw_qpolynomial_intersect_params(
	 isl_union_pw_qpolynomial *upwpq,
	 isl_set *set);
 isl_union_pw_qpolynomial *
isl_union_pw_qpolynomial_subtract_domain_union_set(
	 isl_union_pw_qpolynomial *upwpq,
	 isl_union_set *uset);
 isl_union_pw_qpolynomial *
isl_union_pw_qpolynomial_subtract_domain_space(
	 isl_union_pw_qpolynomial *upwpq,
	 isl_space *space);
 isl_union_pw_qpolynomial *isl_union_pw_qpolynomial_subtract_domain(
	 isl_union_pw_qpolynomial *upwpq,
	 isl_union_set *uset);

 isl_space *isl_union_pw_qpolynomial_get_space(
	 isl_union_pw_qpolynomial *upwqp);
 isl_pw_qpolynomial_list *
isl_union_pw_qpolynomial_get_pw_qpolynomial_list(
	 isl_union_pw_qpolynomial *upwqp);

 isl_union_pw_qpolynomial *isl_union_pw_qpolynomial_set_dim_name(
	 isl_union_pw_qpolynomial *upwqp,
	enum isl_dim_type type, unsigned pos, const char *s);

int isl_union_pw_qpolynomial_find_dim_by_name(
	 isl_union_pw_qpolynomial *upwqp,
	enum isl_dim_type type, const char *name);

 isl_union_pw_qpolynomial *isl_union_pw_qpolynomial_domain_reverse(
	 isl_union_pw_qpolynomial *upwqp);
 isl_union_pw_qpolynomial *isl_union_pw_qpolynomial_drop_dims(
	 isl_union_pw_qpolynomial *upwqp,
	enum isl_dim_type type, unsigned first, unsigned n);
 isl_union_pw_qpolynomial *isl_union_pw_qpolynomial_reset_user(
	 isl_union_pw_qpolynomial *upwqp);

extern
 isl_val *isl_union_pw_qpolynomial_eval(
	 isl_union_pw_qpolynomial *upwqp,  isl_point *pnt);

 isl_union_pw_qpolynomial *isl_union_pw_qpolynomial_coalesce(
	 isl_union_pw_qpolynomial *upwqp);
 isl_union_pw_qpolynomial *isl_union_pw_qpolynomial_gist(
	 isl_union_pw_qpolynomial *upwqp,
	 isl_union_set *context);
 isl_union_pw_qpolynomial *isl_union_pw_qpolynomial_gist_params(
	 isl_union_pw_qpolynomial *upwqp,
	 isl_set *context);

 isl_union_pw_qpolynomial *isl_union_pw_qpolynomial_align_params(
	 isl_union_pw_qpolynomial *upwqp,
	 isl_space *model);
 isl_union_pw_qpolynomial *
isl_union_pw_qpolynomial_drop_unused_params(
	 isl_union_pw_qpolynomial *upwqp);

isl_size isl_union_pw_qpolynomial_n_pw_qpolynomial(
	 isl_union_pw_qpolynomial *upwqp);
isl_stat isl_union_pw_qpolynomial_foreach_pw_qpolynomial(
	 isl_union_pw_qpolynomial *upwqp,
	isl_stat (*fn)( isl_pw_qpolynomial *pwqp, void *user),
	void *user);
isl_bool isl_union_pw_qpolynomial_every_pw_qpolynomial(
	 isl_union_pw_qpolynomial *upwqp,
	isl_bool (*test)( isl_pw_qpolynomial *pwqp, void *user),
	void *user);
 isl_pw_qpolynomial *isl_union_pw_qpolynomial_extract_pw_qpolynomial(
	 isl_union_pw_qpolynomial *upwqp,
	 isl_space *space);

 isl_printer *isl_printer_print_union_pw_qpolynomial(
	 isl_printer *p,  isl_union_pw_qpolynomial *upwqp);

isl_ctx *isl_union_pw_qpolynomial_fold_get_ctx(
	 isl_union_pw_qpolynomial_fold *upwf);

isl_size isl_union_pw_qpolynomial_fold_dim(
	 isl_union_pw_qpolynomial_fold *upwf, enum isl_dim_type type);

isl_bool isl_union_pw_qpolynomial_fold_involves_nan(
	 isl_union_pw_qpolynomial_fold *upwf);
isl_bool isl_union_pw_qpolynomial_fold_plain_is_equal(
	 isl_union_pw_qpolynomial_fold *upwf1,
	 isl_union_pw_qpolynomial_fold *upwf2);

 isl_union_pw_qpolynomial_fold *
isl_pw_qpolynomial_fold_to_union_pw_qpolynomial_fold(
	 isl_pw_qpolynomial_fold *pwf);
 isl_union_pw_qpolynomial_fold *isl_union_pw_qpolynomial_fold_from_pw_qpolynomial_fold( isl_pw_qpolynomial_fold *pwf);
 isl_union_pw_qpolynomial_fold *
isl_union_pw_qpolynomial_fold_zero_ctx(isl_ctx *ctx, enum isl_fold type);
 isl_union_pw_qpolynomial_fold *
isl_union_pw_qpolynomial_fold_zero_space( isl_space *space,
	enum isl_fold type);
 isl_union_pw_qpolynomial_fold *isl_union_pw_qpolynomial_fold_zero(
	 isl_space *space, enum isl_fold type);
 isl_union_pw_qpolynomial_fold *isl_union_pw_qpolynomial_fold_fold_pw_qpolynomial_fold(
	 isl_union_pw_qpolynomial_fold *upwqp,
	 isl_pw_qpolynomial_fold *pwqp);
 isl_union_pw_qpolynomial_fold *isl_union_pw_qpolynomial_fold_free(
	 isl_union_pw_qpolynomial_fold *upwf);
 isl_union_pw_qpolynomial_fold *isl_union_pw_qpolynomial_fold_copy(
	 isl_union_pw_qpolynomial_fold *upwf);

 isl_union_pw_qpolynomial_fold *isl_union_pw_qpolynomial_fold_fold(
	 isl_union_pw_qpolynomial_fold *upwf1,
	 isl_union_pw_qpolynomial_fold *upwf2);
 isl_union_pw_qpolynomial_fold *isl_union_pw_qpolynomial_fold_add_union_pw_qpolynomial(
	 isl_union_pw_qpolynomial_fold *upwf,
	 isl_union_pw_qpolynomial *upwqp);
 isl_union_pw_qpolynomial_fold *
isl_union_pw_qpolynomial_fold_scale_val(
	 isl_union_pw_qpolynomial_fold *upwf,  isl_val *v);
 isl_union_pw_qpolynomial_fold *
isl_union_pw_qpolynomial_fold_scale_down_val(
	 isl_union_pw_qpolynomial_fold *upwf,  isl_val *v);

 isl_union_set *isl_union_pw_qpolynomial_fold_domain(
	 isl_union_pw_qpolynomial_fold *upwf);
 isl_union_pw_qpolynomial_fold *
isl_union_pw_qpolynomial_fold_intersect_domain_space(
	 isl_union_pw_qpolynomial_fold *upwf,
	 isl_space *space);
 isl_union_pw_qpolynomial_fold *
isl_union_pw_qpolynomial_fold_intersect_domain_union_set(
	 isl_union_pw_qpolynomial_fold *upwf,
	 isl_union_set *uset);
 isl_union_pw_qpolynomial_fold *isl_union_pw_qpolynomial_fold_intersect_domain(
	 isl_union_pw_qpolynomial_fold *upwf,
	 isl_union_set *uset);
 isl_union_pw_qpolynomial_fold *
isl_union_pw_qpolynomial_fold_intersect_domain_wrapped_domain(
	 isl_union_pw_qpolynomial_fold *upwf,
	 isl_union_set *uset);
 isl_union_pw_qpolynomial_fold *
isl_union_pw_qpolynomial_fold_intersect_domain_wrapped_range(
	 isl_union_pw_qpolynomial_fold *upwf,
	 isl_union_set *uset);
 isl_union_pw_qpolynomial_fold *
isl_union_pw_qpolynomial_fold_intersect_params(
	 isl_union_pw_qpolynomial_fold *upwf,
	 isl_set *set);
 isl_union_pw_qpolynomial_fold *
isl_union_pw_qpolynomial_fold_subtract_domain_union_set(
	 isl_union_pw_qpolynomial_fold *upwf,
	 isl_union_set *uset);
 isl_union_pw_qpolynomial_fold *
isl_union_pw_qpolynomial_fold_subtract_domain_space(
	 isl_union_pw_qpolynomial_fold *upwf,
	 isl_space *space);
 isl_union_pw_qpolynomial_fold *
isl_union_pw_qpolynomial_fold_subtract_domain(
	 isl_union_pw_qpolynomial_fold *upwf,
	 isl_union_set *uset);

enum isl_fold isl_union_pw_qpolynomial_fold_get_type(
	 isl_union_pw_qpolynomial_fold *upwf);
 isl_space *isl_union_pw_qpolynomial_fold_get_space(
	 isl_union_pw_qpolynomial_fold *upwf);
 isl_pw_qpolynomial_fold_list *
isl_union_pw_qpolynomial_fold_get_pw_qpolynomial_fold_list(
	 isl_union_pw_qpolynomial_fold *upwf);

 isl_union_pw_qpolynomial_fold *
isl_union_pw_qpolynomial_fold_set_dim_name(
	 isl_union_pw_qpolynomial_fold *upwf,
	enum isl_dim_type type, unsigned pos, const char *s);

int isl_union_pw_qpolynomial_fold_find_dim_by_name(
	 isl_union_pw_qpolynomial_fold *upwf,
	enum isl_dim_type type, const char *name);

 isl_union_pw_qpolynomial_fold *
	isl_union_pw_qpolynomial_fold_drop_dims(
	 isl_union_pw_qpolynomial_fold *upwf,
	enum isl_dim_type type, unsigned first, unsigned n);
 isl_union_pw_qpolynomial_fold *
isl_union_pw_qpolynomial_fold_reset_user(
	 isl_union_pw_qpolynomial_fold *upwf);

 isl_val *isl_union_pw_qpolynomial_fold_eval(
	 isl_union_pw_qpolynomial_fold *upwf,
	 isl_point *pnt);

 isl_union_pw_qpolynomial_fold *isl_union_pw_qpolynomial_fold_coalesce(
	 isl_union_pw_qpolynomial_fold *upwf);
 isl_union_pw_qpolynomial_fold *isl_union_pw_qpolynomial_fold_gist(
	 isl_union_pw_qpolynomial_fold *upwf,
	 isl_union_set *context);
 isl_union_pw_qpolynomial_fold *
isl_union_pw_qpolynomial_fold_gist_params(
	 isl_union_pw_qpolynomial_fold *upwf,
	 isl_set *context);

 isl_union_pw_qpolynomial_fold *isl_union_pw_qpolynomial_fold_align_params(
	 isl_union_pw_qpolynomial_fold *upwf,
	 isl_space *model);
 isl_union_pw_qpolynomial_fold *
isl_union_pw_qpolynomial_fold_drop_unused_params(
	 isl_union_pw_qpolynomial_fold *upwf);

isl_size isl_union_pw_qpolynomial_fold_n_pw_qpolynomial_fold(
	 isl_union_pw_qpolynomial_fold *upwf);
isl_stat isl_union_pw_qpolynomial_fold_foreach_pw_qpolynomial_fold(
	 isl_union_pw_qpolynomial_fold *upwf,
	isl_stat (*fn)( isl_pw_qpolynomial_fold *pwf,
		    void *user), void *user);
isl_bool isl_union_pw_qpolynomial_fold_every_pw_qpolynomial_fold(
	 isl_union_pw_qpolynomial_fold *upwf,
	isl_bool (*test)( isl_pw_qpolynomial_fold *pwf,
		void *user), void *user);
 isl_pw_qpolynomial_fold *isl_union_pw_qpolynomial_fold_extract_pw_qpolynomial_fold(
	 isl_union_pw_qpolynomial_fold *upwf,
	 isl_space *space);

 isl_printer *isl_printer_print_union_pw_qpolynomial_fold(
	 isl_printer *p,
	 isl_union_pw_qpolynomial_fold *upwf);

 isl_union_pw_qpolynomial_fold *isl_union_pw_qpolynomial_bound(
	 isl_union_pw_qpolynomial *upwqp,
	enum isl_fold type, isl_bool *tight);
 isl_union_pw_qpolynomial_fold *isl_union_set_apply_union_pw_qpolynomial_fold(
	 isl_union_set *uset,
	 isl_union_pw_qpolynomial_fold *upwf, isl_bool *tight);
 isl_union_pw_qpolynomial_fold *isl_union_map_apply_union_pw_qpolynomial_fold(
	 isl_union_map *umap,
	 isl_union_pw_qpolynomial_fold *upwf, isl_bool *tight);

 isl_union_pw_qpolynomial *isl_union_pw_qpolynomial_to_polynomial(
	 isl_union_pw_qpolynomial *upwqp, int sign);

isl_ctx *isl_qpolynomial_list_get_ctx( isl_qpolynomial_list *list);	
 isl_qpolynomial_list *isl_qpolynomial_to_list( isl_qpolynomial *el);
 isl_qpolynomial_list *isl_qpolynomial_list_from_qpolynomial(			
	 isl_qpolynomial *el);					
 isl_qpolynomial_list *isl_qpolynomial_list_alloc(isl_ctx *ctx, int n);	
 isl_qpolynomial_list *isl_qpolynomial_list_copy(			
	 isl_qpolynomial_list *list);				
 isl_qpolynomial_list *isl_qpolynomial_list_free(			
	 isl_qpolynomial_list *list);				
 isl_qpolynomial_list *isl_qpolynomial_list_add(			
	 isl_qpolynomial_list *list,				
	 isl_qpolynomial *el);					
 isl_qpolynomial_list *isl_qpolynomial_list_insert(			
	 isl_qpolynomial_list *list, unsigned pos,			
	 isl_qpolynomial *el);					
 isl_qpolynomial_list *isl_qpolynomial_list_drop(			
	 isl_qpolynomial_list *list, unsigned first, unsigned n);	
 isl_qpolynomial_list *isl_qpolynomial_list_clear(			
	 isl_qpolynomial_list *list);				
 isl_qpolynomial_list *isl_qpolynomial_list_swap(			
	 isl_qpolynomial_list *list, unsigned pos1,		
	unsigned pos2);							
 isl_qpolynomial_list *isl_qpolynomial_list_reverse(			
	 isl_qpolynomial_list *list);				
 isl_qpolynomial_list *isl_qpolynomial_list_concat(			
	 isl_qpolynomial_list *list1,				
	 isl_qpolynomial_list *list2);				
isl_size isl_qpolynomial_list_size( isl_qpolynomial_list *list);	
isl_size isl_qpolynomial_list_n_qpolynomial( isl_qpolynomial_list *list);	
 isl_qpolynomial *isl_qpolynomial_list_get_at(				
	 isl_qpolynomial_list *list, int index);			
  isl_qpolynomial *isl_qpolynomial_list_get_qpolynomial(			
	 isl_qpolynomial_list *list, int index);			
 isl_qpolynomial_list *isl_qpolynomial_list_set_at(			
	 isl_qpolynomial_list *list, int index,			
	 isl_qpolynomial *el);					
  isl_qpolynomial_list *isl_qpolynomial_list_set_qpolynomial(		
	 struct isl_qpolynomial_list *list, int index,		
	 struct isl_qpolynomial *el);				
isl_stat isl_qpolynomial_list_foreach( isl_qpolynomial_list *list,	
	isl_stat (*fn)( isl_qpolynomial *el, void *user),		
	void *user);							
isl_bool isl_qpolynomial_list_every( isl_qpolynomial_list *list,	
	isl_bool (*test)( isl_qpolynomial *el, void *user),		
	void *user);							
 isl_qpolynomial_list *isl_qpolynomial_list_map(			
	 isl_qpolynomial_list *list,				
	 isl_qpolynomial * (*fn)( isl_qpolynomial *el,		
		void *user),						
	void *user);							
 isl_qpolynomial_list *isl_qpolynomial_list_sort(			
	 isl_qpolynomial_list *list,				
	int (*cmp)( struct isl_qpolynomial *a,			
		 struct isl_qpolynomial *b,				
		void *user), void *user);				
isl_stat isl_qpolynomial_list_foreach_scc( isl_qpolynomial_list *list,	
	isl_bool (*follows)( isl_qpolynomial *a,			
			 isl_qpolynomial *b, void *user),		
	void *follows_user,						
	isl_stat (*fn)( isl_qpolynomial_list *scc, void *user),	
	void *fn_user);							
 char *isl_qpolynomial_list_to_str(				
	 isl_qpolynomial_list *list);				
 isl_printer *isl_printer_print_qpolynomial_list(			
	 isl_printer *p,  isl_qpolynomial_list *list);	
void isl_qpolynomial_list_dump( isl_qpolynomial_list *list);  
isl_ctx *isl_pw_qpolynomial_list_get_ctx( isl_pw_qpolynomial_list *list);	
 isl_pw_qpolynomial_list *isl_pw_qpolynomial_to_list( isl_pw_qpolynomial *el);
 isl_pw_qpolynomial_list *isl_pw_qpolynomial_list_from_pw_qpolynomial(			
	 isl_pw_qpolynomial *el);					
 isl_pw_qpolynomial_list *isl_pw_qpolynomial_list_alloc(isl_ctx *ctx, int n);	
 isl_pw_qpolynomial_list *isl_pw_qpolynomial_list_copy(			
	 isl_pw_qpolynomial_list *list);				
 isl_pw_qpolynomial_list *isl_pw_qpolynomial_list_free(			
	 isl_pw_qpolynomial_list *list);				
 isl_pw_qpolynomial_list *isl_pw_qpolynomial_list_add(			
	 isl_pw_qpolynomial_list *list,				
	 isl_pw_qpolynomial *el);					
 isl_pw_qpolynomial_list *isl_pw_qpolynomial_list_insert(			
	 isl_pw_qpolynomial_list *list, unsigned pos,			
	 isl_pw_qpolynomial *el);					
 isl_pw_qpolynomial_list *isl_pw_qpolynomial_list_drop(			
	 isl_pw_qpolynomial_list *list, unsigned first, unsigned n);	
 isl_pw_qpolynomial_list *isl_pw_qpolynomial_list_clear(			
	 isl_pw_qpolynomial_list *list);				
 isl_pw_qpolynomial_list *isl_pw_qpolynomial_list_swap(			
	 isl_pw_qpolynomial_list *list, unsigned pos1,		
	unsigned pos2);							
 isl_pw_qpolynomial_list *isl_pw_qpolynomial_list_reverse(			
	 isl_pw_qpolynomial_list *list);				
 isl_pw_qpolynomial_list *isl_pw_qpolynomial_list_concat(			
	 isl_pw_qpolynomial_list *list1,				
	 isl_pw_qpolynomial_list *list2);				
isl_size isl_pw_qpolynomial_list_size( isl_pw_qpolynomial_list *list);	
isl_size isl_pw_qpolynomial_list_n_pw_qpolynomial( isl_pw_qpolynomial_list *list);	
 isl_pw_qpolynomial *isl_pw_qpolynomial_list_get_at(				
	 isl_pw_qpolynomial_list *list, int index);			
  isl_pw_qpolynomial *isl_pw_qpolynomial_list_get_pw_qpolynomial(			
	 isl_pw_qpolynomial_list *list, int index);			
 isl_pw_qpolynomial_list *isl_pw_qpolynomial_list_set_at(			
	 isl_pw_qpolynomial_list *list, int index,			
	 isl_pw_qpolynomial *el);					
  isl_pw_qpolynomial_list *isl_pw_qpolynomial_list_set_pw_qpolynomial(		
	 struct isl_pw_qpolynomial_list *list, int index,		
	 struct isl_pw_qpolynomial *el);				
isl_stat isl_pw_qpolynomial_list_foreach( isl_pw_qpolynomial_list *list,	
	isl_stat (*fn)( isl_pw_qpolynomial *el, void *user),		
	void *user);							
isl_bool isl_pw_qpolynomial_list_every( isl_pw_qpolynomial_list *list,	
	isl_bool (*test)( isl_pw_qpolynomial *el, void *user),		
	void *user);							
 isl_pw_qpolynomial_list *isl_pw_qpolynomial_list_map(			
	 isl_pw_qpolynomial_list *list,				
	 isl_pw_qpolynomial * (*fn)( isl_pw_qpolynomial *el,		
		void *user),						
	void *user);							
 isl_pw_qpolynomial_list *isl_pw_qpolynomial_list_sort(			
	 isl_pw_qpolynomial_list *list,				
	int (*cmp)( struct isl_pw_qpolynomial *a,			
		 struct isl_pw_qpolynomial *b,				
		void *user), void *user);				
isl_stat isl_pw_qpolynomial_list_foreach_scc( isl_pw_qpolynomial_list *list,	
	isl_bool (*follows)( isl_pw_qpolynomial *a,			
			 isl_pw_qpolynomial *b, void *user),		
	void *follows_user,						
	isl_stat (*fn)( isl_pw_qpolynomial_list *scc, void *user),	
	void *fn_user);							
 char *isl_pw_qpolynomial_list_to_str(				
	 isl_pw_qpolynomial_list *list);				
 isl_printer *isl_printer_print_pw_qpolynomial_list(			
	 isl_printer *p,  isl_pw_qpolynomial_list *list);	
void isl_pw_qpolynomial_list_dump( isl_pw_qpolynomial_list *list);  
isl_ctx *isl_pw_qpolynomial_fold_list_get_ctx( isl_pw_qpolynomial_fold_list *list);	
 isl_pw_qpolynomial_fold_list *isl_pw_qpolynomial_fold_to_list( isl_pw_qpolynomial_fold *el);
 isl_pw_qpolynomial_fold_list *isl_pw_qpolynomial_fold_list_from_pw_qpolynomial_fold(			
	 isl_pw_qpolynomial_fold *el);					
 isl_pw_qpolynomial_fold_list *isl_pw_qpolynomial_fold_list_alloc(isl_ctx *ctx, int n);	
 isl_pw_qpolynomial_fold_list *isl_pw_qpolynomial_fold_list_copy(			
	 isl_pw_qpolynomial_fold_list *list);				
 isl_pw_qpolynomial_fold_list *isl_pw_qpolynomial_fold_list_free(			
	 isl_pw_qpolynomial_fold_list *list);				
 isl_pw_qpolynomial_fold_list *isl_pw_qpolynomial_fold_list_add(			
	 isl_pw_qpolynomial_fold_list *list,				
	 isl_pw_qpolynomial_fold *el);					
 isl_pw_qpolynomial_fold_list *isl_pw_qpolynomial_fold_list_insert(			
	 isl_pw_qpolynomial_fold_list *list, unsigned pos,			
	 isl_pw_qpolynomial_fold *el);					
 isl_pw_qpolynomial_fold_list *isl_pw_qpolynomial_fold_list_drop(			
	 isl_pw_qpolynomial_fold_list *list, unsigned first, unsigned n);	
 isl_pw_qpolynomial_fold_list *isl_pw_qpolynomial_fold_list_clear(			
	 isl_pw_qpolynomial_fold_list *list);				
 isl_pw_qpolynomial_fold_list *isl_pw_qpolynomial_fold_list_swap(			
	 isl_pw_qpolynomial_fold_list *list, unsigned pos1,		
	unsigned pos2);							
 isl_pw_qpolynomial_fold_list *isl_pw_qpolynomial_fold_list_reverse(			
	 isl_pw_qpolynomial_fold_list *list);				
 isl_pw_qpolynomial_fold_list *isl_pw_qpolynomial_fold_list_concat(			
	 isl_pw_qpolynomial_fold_list *list1,				
	 isl_pw_qpolynomial_fold_list *list2);				
isl_size isl_pw_qpolynomial_fold_list_size( isl_pw_qpolynomial_fold_list *list);	
isl_size isl_pw_qpolynomial_fold_list_n_pw_qpolynomial_fold( isl_pw_qpolynomial_fold_list *list);	
 isl_pw_qpolynomial_fold *isl_pw_qpolynomial_fold_list_get_at(				
	 isl_pw_qpolynomial_fold_list *list, int index);			
  isl_pw_qpolynomial_fold *isl_pw_qpolynomial_fold_list_get_pw_qpolynomial_fold(			
	 isl_pw_qpolynomial_fold_list *list, int index);			
 isl_pw_qpolynomial_fold_list *isl_pw_qpolynomial_fold_list_set_at(			
	 isl_pw_qpolynomial_fold_list *list, int index,			
	 isl_pw_qpolynomial_fold *el);					
  isl_pw_qpolynomial_fold_list *isl_pw_qpolynomial_fold_list_set_pw_qpolynomial_fold(		
	 struct isl_pw_qpolynomial_fold_list *list, int index,		
	 struct isl_pw_qpolynomial_fold *el);				
isl_stat isl_pw_qpolynomial_fold_list_foreach( isl_pw_qpolynomial_fold_list *list,	
	isl_stat (*fn)( isl_pw_qpolynomial_fold *el, void *user),		
	void *user);							
isl_bool isl_pw_qpolynomial_fold_list_every( isl_pw_qpolynomial_fold_list *list,	
	isl_bool (*test)( isl_pw_qpolynomial_fold *el, void *user),		
	void *user);							
 isl_pw_qpolynomial_fold_list *isl_pw_qpolynomial_fold_list_map(			
	 isl_pw_qpolynomial_fold_list *list,				
	 isl_pw_qpolynomial_fold * (*fn)( isl_pw_qpolynomial_fold *el,		
		void *user),						
	void *user);							
 isl_pw_qpolynomial_fold_list *isl_pw_qpolynomial_fold_list_sort(			
	 isl_pw_qpolynomial_fold_list *list,				
	int (*cmp)( struct isl_pw_qpolynomial_fold *a,			
		 struct isl_pw_qpolynomial_fold *b,				
		void *user), void *user);				
isl_stat isl_pw_qpolynomial_fold_list_foreach_scc( isl_pw_qpolynomial_fold_list *list,	
	isl_bool (*follows)( isl_pw_qpolynomial_fold *a,			
			 isl_pw_qpolynomial_fold *b, void *user),		
	void *follows_user,						
	isl_stat (*fn)( isl_pw_qpolynomial_fold_list *scc, void *user),	
	void *fn_user);							
 char *isl_pw_qpolynomial_fold_list_to_str(				
	 isl_pw_qpolynomial_fold_list *list);				
 isl_printer *isl_printer_print_pw_qpolynomial_fold_list(			
	 isl_printer *p,  isl_pw_qpolynomial_fold_list *list);	
void isl_pw_qpolynomial_fold_list_dump( isl_pw_qpolynomial_fold_list *list);  

#if defined(__cplusplus)
}
#endif

#endif
