#ifndef ISL_MULTI_H
#define ISL_MULTI_H

#include <isl/val_type.h>
#include <isl/space_type.h>
#include <isl/list.h>
#include <isl/set_type.h>

#if defined(__cplusplus)

#endif

#define ISL_DECLARE_MULTI(BASE)						\
isl_ctx *isl_multi_##BASE##_get_ctx(					\
	 isl_multi_##BASE *multi);				\
extern								\
 isl_space *isl_multi_##BASE##_get_space(			\
	 isl_multi_##BASE *multi);				\
 isl_space *isl_multi_##BASE##_get_domain_space(		\
	 isl_multi_##BASE *multi);				\
extern								\
 isl_##BASE##_list *isl_multi_##BASE##_get_list(		\
	 isl_multi_##BASE *multi);				\
							\
 isl_multi_##BASE *isl_multi_##BASE##_from_##BASE##_list(	\
	 isl_space *space,  isl_##BASE##_list *list); \
extern								\
 isl_multi_##BASE *isl_space_multi_##BASE(			\
	 isl_space *space,  isl_##BASE##_list *list); \
 isl_multi_##BASE *isl_multi_##BASE##_copy(			\
	 isl_multi_##BASE *multi);				\
 isl_multi_##BASE *isl_multi_##BASE##_free(			\
	 isl_multi_##BASE *multi);				\
extern								\
isl_bool isl_multi_##BASE##_plain_is_equal(				\
	 isl_multi_##BASE *multi1,				\
	 isl_multi_##BASE *multi2);				\
 isl_multi_##BASE *isl_multi_##BASE##_reset_user(		\
	 isl_multi_##BASE *multi);				\
extern								\
isl_size isl_multi_##BASE##_size( isl_multi_##BASE *multi);	\
extern								\
 isl_##BASE *isl_multi_##BASE##_get_at(			\
	 isl_multi_##BASE *multi, int pos);			\
 isl_##BASE *isl_multi_##BASE##_get_##BASE(			\
	 isl_multi_##BASE *multi, int pos);			\
extern								\
 isl_multi_##BASE *isl_multi_##BASE##_set_at(			\
	 isl_multi_##BASE *multi, int pos,			\
	 isl_##BASE *el);					\
 isl_multi_##BASE *isl_multi_##BASE##_set_##BASE(		\
	 isl_multi_##BASE *multi, int pos,			\
	 isl_##BASE *el);					\
 isl_multi_##BASE *isl_multi_##BASE##_range_splice(		\
	 isl_multi_##BASE *multi1, unsigned pos,		\
	 isl_multi_##BASE *multi2);				\
 isl_multi_##BASE *isl_multi_##BASE##_flatten_range(		\
	 isl_multi_##BASE *multi);				\
extern								\
 isl_multi_##BASE *isl_multi_##BASE##_flat_range_product(	\
	 isl_multi_##BASE *multi1,				\
	 isl_multi_##BASE *multi2);				\
extern								\
 isl_multi_##BASE *isl_multi_##BASE##_range_product(		\
	 isl_multi_##BASE *multi1,				\
	 isl_multi_##BASE *multi2);				\
 isl_multi_##BASE *isl_multi_##BASE##_factor_range(		\
	 isl_multi_##BASE *multi);				\
isl_bool isl_multi_##BASE##_range_is_wrapping(				\
	 isl_multi_##BASE *multi);				\
 isl_multi_##BASE *isl_multi_##BASE##_range_factor_domain(	\
	 isl_multi_##BASE *multi);				\
 isl_multi_##BASE *isl_multi_##BASE##_range_factor_range(	\
	 isl_multi_##BASE *multi);				\
 isl_multi_##BASE *isl_multi_##BASE##_align_params(		\
	 isl_multi_##BASE *multi,				\
	 isl_space *model);					\
 isl_multi_##BASE *isl_multi_##BASE##_from_range(		\
	 isl_multi_##BASE *multi);

#define ISL_DECLARE_MULTI_IDENTITY(BASE)				\
								\
 isl_multi_##BASE *isl_multi_##BASE##_identity_multi_##BASE(	\
	 isl_multi_##BASE *multi);				\
 isl_multi_##BASE *isl_multi_##BASE##_identity(		\
	 isl_space *space);					\
								\
 isl_multi_##BASE *						\
isl_multi_##BASE##_identity_on_domain_space(				\
	 isl_space *space);					\
extern								\
 isl_multi_##BASE *						\
isl_space_identity_multi_##BASE##_on_domain(				\
	 isl_space *space);

#define ISL_DECLARE_MULTI_CMP(BASE)					\
int isl_multi_##BASE##_plain_cmp( isl_multi_##BASE *multi1,	\
	 isl_multi_##BASE *multi2);

#define ISL_DECLARE_MULTI_ARITH(BASE)					\
								\
 isl_multi_##BASE *isl_multi_##BASE##_scale_val(		\
	 isl_multi_##BASE *multi,  isl_val *v);	\
								\
 isl_multi_##BASE *isl_multi_##BASE##_scale_down_val(		\
	 isl_multi_##BASE *multi,  isl_val *v);	\
								\
 isl_multi_##BASE *isl_multi_##BASE##_scale_multi_val(	\
	 isl_multi_##BASE *multi,				\
	 isl_multi_val *mv);					\
								\
 isl_multi_##BASE *isl_multi_##BASE##_scale_down_multi_val(	\
	 isl_multi_##BASE *multi,				\
	 isl_multi_val *mv);					\
 isl_multi_##BASE *isl_multi_##BASE##_mod_multi_val(		\
	 isl_multi_##BASE *multi,				\
	 isl_multi_val *mv);					\
extern								\
 isl_multi_##BASE *isl_multi_##BASE##_add(			\
	 isl_multi_##BASE *multi1,				\
	 isl_multi_##BASE *multi2);				\
extern								\
 isl_multi_##BASE *isl_multi_##BASE##_sub(			\
	 isl_multi_##BASE *multi1,				\
	 isl_multi_##BASE *multi2);				\
extern								\
 isl_multi_##BASE *isl_multi_##BASE##_neg(		 	\
	 isl_multi_##BASE *multi);

#define ISL_DECLARE_MULTI_MIN_MAX(BASE)					\
extern								\
 isl_multi_##BASE *isl_multi_##BASE##_min(			\
	 isl_multi_##BASE *multi1,				\
	 isl_multi_##BASE *multi2);				\
extern								\
 isl_multi_##BASE *isl_multi_##BASE##_max(			\
	 isl_multi_##BASE *multi1,				\
	 isl_multi_##BASE *multi2);

#define ISL_DECLARE_MULTI_ADD_CONSTANT(BASE)				\
								\
 isl_multi_##BASE *isl_multi_##BASE##_add_constant_val(	\
	 isl_multi_##BASE *mpa,  isl_val *v);	\
								\
 isl_multi_##BASE *isl_multi_##BASE##_add_constant_multi_val(	\
	 isl_multi_##BASE *mpa,  isl_multi_val *mv);

#define ISL_DECLARE_MULTI_ZERO(BASE)					\
extern								\
 isl_multi_##BASE *isl_multi_##BASE##_zero(			\
	 isl_space *space);					\
extern								\
 isl_multi_##BASE *isl_space_zero_multi_##BASE(		\
	 isl_space *space);

#define ISL_DECLARE_MULTI_NAN(BASE)					\
extern								\
isl_bool isl_multi_##BASE##_involves_nan(				\
	 isl_multi_##BASE *multi);

#define ISL_DECLARE_MULTI_DROP_DIMS(BASE)				\
isl_size isl_multi_##BASE##_dim( isl_multi_##BASE *multi,	\
	enum isl_dim_type type);					\
 isl_multi_##BASE *isl_multi_##BASE##_drop_dims(		\
	 isl_multi_##BASE *multi, enum isl_dim_type type,	\
	unsigned first, unsigned n);
#define ISL_DECLARE_MULTI_DIMS(BASE)					\

isl_size isl_multi_BASE_dim( isl_multi_BASE *multi,	
	enum isl_dim_type type);					
 isl_multi_BASE *isl_multi_BASE_drop_dims(		
	 isl_multi_BASE *multi, enum isl_dim_type type,	
	unsigned first, unsigned n);

isl_bool isl_multi_##BASE##_involves_dims(				\
	 isl_multi_##BASE *multi, enum isl_dim_type type,	\
	unsigned first, unsigned n);					\
 isl_multi_##BASE *isl_multi_##BASE##_insert_dims(		\
	 isl_multi_##BASE *multi, enum isl_dim_type type,	\
	unsigned first, unsigned n);					\
 isl_multi_##BASE *isl_multi_##BASE##_add_dims(		\
	 isl_multi_##BASE *multi, enum isl_dim_type type,	\
	unsigned n);							\
 isl_multi_##BASE *						\
isl_multi_##BASE##_project_domain_on_params(				\
	 isl_multi_##BASE *multi);

#define ISL_DECLARE_MULTI_INSERT_DOMAIN(BASE)				\
extern								\
 isl_multi_##BASE *						\
isl_multi_##BASE##_insert_domain( isl_multi_##BASE *multi,	\
	 isl_space *domain);

#define ISL_DECLARE_MULTI_LOCALS(BASE)					\
extern								\
isl_bool isl_multi_##BASE##_involves_locals(				\
	 isl_multi_##BASE *multi);

#define ISL_DECLARE_MULTI_DIM_ID(BASE)					\
int isl_multi_##BASE##_find_dim_by_name(				\
	 isl_multi_##BASE *multi,				\
	enum isl_dim_type type, const char *name);			\
int isl_multi_##BASE##_find_dim_by_id(					\
	 isl_multi_##BASE *multi, enum isl_dim_type type,	\
	 isl_id *id);						\
 isl_id *isl_multi_##BASE##_get_dim_id(			\
	 isl_multi_##BASE *multi,				\
	enum isl_dim_type type, unsigned pos);				\
 isl_multi_##BASE *isl_multi_##BASE##_set_dim_name(		\
	 isl_multi_##BASE *multi,				\
	enum isl_dim_type type, unsigned pos, const char *s);		\
 isl_multi_##BASE *isl_multi_##BASE##_set_dim_id(		\
	 isl_multi_##BASE *multi,				\
	enum isl_dim_type type, unsigned pos,  isl_id *id);

#define ISL_DECLARE_MULTI_TUPLE_ID(BASE)				\
const char *isl_multi_##BASE##_get_tuple_name(				\
	 isl_multi_##BASE *multi, enum isl_dim_type type);	\
extern								\
isl_bool isl_multi_##BASE##_has_range_tuple_id(				\
	 isl_multi_##BASE *multi);				\
isl_bool isl_multi_##BASE##_has_tuple_id(				\
	 isl_multi_##BASE *multi, enum isl_dim_type type);	\
extern								\
 isl_id *isl_multi_##BASE##_get_range_tuple_id(		\
	 isl_multi_##BASE *multi);				\
 isl_id *isl_multi_##BASE##_get_tuple_id(			\
	 isl_multi_##BASE *multi, enum isl_dim_type type);	\
 isl_multi_##BASE *isl_multi_##BASE##_set_tuple_name(		\
	 isl_multi_##BASE *multi,				\
	enum isl_dim_type type, const char *s);				\
								\
 isl_multi_##BASE *isl_multi_##BASE##_set_range_tuple_id(	\
	 isl_multi_##BASE *multi,   isl_id *id);	\
 isl_multi_##BASE *isl_multi_##BASE##_set_tuple_id(		\
	 isl_multi_##BASE *multi,				\
	enum isl_dim_type type,  isl_id *id);			\
extern								\
 isl_multi_##BASE *isl_multi_##BASE##_reset_range_tuple_id(	\
	 isl_multi_##BASE *multi);				\
 isl_multi_##BASE *isl_multi_##BASE##_reset_tuple_id(		\
	 isl_multi_##BASE *multi, enum isl_dim_type type);

#define ISL_DECLARE_MULTI_WITH_DOMAIN(BASE)				\
extern								\
 isl_multi_##BASE *isl_multi_##BASE##_product(		\
	 isl_multi_##BASE *multi1,				\
	 isl_multi_##BASE *multi2);				\
 isl_multi_##BASE *isl_multi_##BASE##_splice(			\
	 isl_multi_##BASE *multi1, unsigned in_pos,		\
	unsigned out_pos,  isl_multi_##BASE *multi2);

#define ISL_DECLARE_MULTI_BIND_DOMAIN(BASE)				\
extern								\
 isl_multi_##BASE *isl_multi_##BASE##_bind_domain(		\
	 isl_multi_##BASE *multi,				\
	 isl_multi_id *tuple);				\
extern								\
 isl_multi_##BASE *						\
isl_multi_##BASE##_bind_domain_wrapped_domain(				\
	 isl_multi_##BASE *multi,				\
	 isl_multi_id *tuple);

#define ISL_DECLARE_MULTI_UNBIND_PARAMS(BASE)				\
extern								\
 isl_multi_##BASE *						\
isl_multi_##BASE##_unbind_params_insert_domain(				\
	 isl_multi_##BASE *multi,				\
	 isl_multi_id *domain);

#define ISL_DECLARE_MULTI_PARAM(BASE)					\
								\
isl_bool isl_multi_##BASE##_involves_param_id(				\
	 isl_multi_##BASE *multi,  isl_id *id);	\
								\
isl_bool isl_multi_##BASE##_involves_param_id_list(			\
	 isl_multi_##BASE *multi,				\
	 isl_id_list *list);

#define ISL_DECLARE_MULTI_DOMAIN_REVERSE(BASE)				\
extern								\
 isl_multi_##BASE *isl_multi_##BASE##_domain_reverse(		\
	 isl_multi_##BASE *multi);

#if defined(__cplusplus)
}
#endif

#endif
