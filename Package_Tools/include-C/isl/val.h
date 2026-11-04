#ifndef ISL_VAL_H
#define ISL_VAL_H

#include <isl/stdint.h>
#include <isl/ctx.h>
#include <isl/list.h>
#include <isl/multi.h>
#include <isl/printer.h>
#include <isl/val_type.h>

#if defined(__cplusplus)

#endif

isl_ctx *isl_multi_val_get_ctx(					
	 isl_multi_val *multi);				
extern								
 isl_space *isl_multi_val_get_space(			
	 isl_multi_val *multi);				
 isl_space *isl_multi_val_get_domain_space(		
	 isl_multi_val *multi);				
extern								
 isl_val_list *isl_multi_val_get_list(		
	 isl_multi_val *multi);				
							
 isl_multi_val *isl_multi_val_from_val_list(	
	 isl_space *space,  isl_val_list *list); 
extern								
 isl_multi_val *isl_space_multi_val(			
	 isl_space *space,  isl_val_list *list); 
 isl_multi_val *isl_multi_val_copy(			
	 isl_multi_val *multi);				
 isl_multi_val *isl_multi_val_free(			
	 isl_multi_val *multi);				
extern								
isl_bool isl_multi_val_plain_is_equal(				
	 isl_multi_val *multi1,				
	 isl_multi_val *multi2);				
 isl_multi_val *isl_multi_val_reset_user(		
	 isl_multi_val *multi);				
extern								
isl_size isl_multi_val_size( isl_multi_val *multi);	
extern								
 isl_val *isl_multi_val_get_at(			
	 isl_multi_val *multi, int pos);			
 isl_val *isl_multi_val_get_val(			
	 isl_multi_val *multi, int pos);			
extern								
 isl_multi_val *isl_multi_val_set_at(			
	 isl_multi_val *multi, int pos,			
	 isl_val *el);					
 isl_multi_val *isl_multi_val_set_val(		
	 isl_multi_val *multi, int pos,			
	 isl_val *el);					
 isl_multi_val *isl_multi_val_range_splice(		
	 isl_multi_val *multi1, unsigned pos,		
	 isl_multi_val *multi2);				
 isl_multi_val *isl_multi_val_flatten_range(		
	 isl_multi_val *multi);				
extern								
 isl_multi_val *isl_multi_val_flat_range_product(	
	 isl_multi_val *multi1,				
	 isl_multi_val *multi2);				
extern								
 isl_multi_val *isl_multi_val_range_product(		
	 isl_multi_val *multi1,				
	 isl_multi_val *multi2);				
 isl_multi_val *isl_multi_val_factor_range(		
	 isl_multi_val *multi);				
isl_bool isl_multi_val_range_is_wrapping(				
	 isl_multi_val *multi);				
 isl_multi_val *isl_multi_val_range_factor_domain(	
	 isl_multi_val *multi);				
 isl_multi_val *isl_multi_val_range_factor_range(	
	 isl_multi_val *multi);				
 isl_multi_val *isl_multi_val_align_params(		
	 isl_multi_val *multi,				
	 isl_space *model);					
 isl_multi_val *isl_multi_val_from_range(		
	 isl_multi_val *multi);               
 isl_multi_val *isl_multi_val_scale_val(		
	 isl_multi_val *multi,  isl_val *v);	
								
 isl_multi_val *isl_multi_val_scale_down_val(		
	 isl_multi_val *multi,  isl_val *v);	
								
 isl_multi_val *isl_multi_val_scale_multi_val(	
	 isl_multi_val *multi,				
	 isl_multi_val *mv);					
								
 isl_multi_val *isl_multi_val_scale_down_multi_val(	
	 isl_multi_val *multi,				
	 isl_multi_val *mv);					
 isl_multi_val *isl_multi_val_mod_multi_val(		
	 isl_multi_val *multi,				
	 isl_multi_val *mv);					
extern								
 isl_multi_val *isl_multi_val_add(			
	 isl_multi_val *multi1,				
	 isl_multi_val *multi2);				
extern								
 isl_multi_val *isl_multi_val_sub(			
	 isl_multi_val *multi1,				
	 isl_multi_val *multi2);				
extern								
 isl_multi_val *isl_multi_val_neg(		 	
	 isl_multi_val *multi);      
extern								
 isl_multi_val *isl_multi_val_min(			
	 isl_multi_val *multi1,				
	 isl_multi_val *multi2);				
extern								
 isl_multi_val *isl_multi_val_max(			
	 isl_multi_val *multi1,				
	 isl_multi_val *multi2);  
extern								
 isl_multi_val *isl_multi_val_zero(			
	 isl_space *space);					
extern								
 isl_multi_val *isl_space_zero_multi_val(		
	 isl_space *space);
extern								
isl_bool isl_multi_val_involves_nan(				
	 isl_multi_val *multi);       
isl_size isl_multi_val_dim( isl_multi_val *multi,	
	enum isl_dim_type type);					
 isl_multi_val *isl_multi_val_drop_dims(		
	 isl_multi_val *multi, enum isl_dim_type type,	
	unsigned first, unsigned n);
isl_bool isl_multi_val_involves_dims(				
	 isl_multi_val *multi, enum isl_dim_type type,	
	unsigned first, unsigned n);					
 isl_multi_val *isl_multi_val_insert_dims(		
	 isl_multi_val *multi, enum isl_dim_type type,	
	unsigned first, unsigned n);					
 isl_multi_val *isl_multi_val_add_dims(		
	 isl_multi_val *multi, enum isl_dim_type type,	
	unsigned n);							
 isl_multi_val *						
isl_multi_val_project_domain_on_params(				
	 isl_multi_val *multi);           
int isl_multi_val_find_dim_by_name(				
	 isl_multi_val *multi,				
	enum isl_dim_type type, const char *name);			
int isl_multi_val_find_dim_by_id(					
	 isl_multi_val *multi, enum isl_dim_type type,	
	 isl_id *id);						
 isl_id *isl_multi_val_get_dim_id(			
	 isl_multi_val *multi,				
	enum isl_dim_type type, unsigned pos);				
 isl_multi_val *isl_multi_val_set_dim_name(		
	 isl_multi_val *multi,				
	enum isl_dim_type type, unsigned pos, const char *s);		
 isl_multi_val *isl_multi_val_set_dim_id(		
	 isl_multi_val *multi,				
	enum isl_dim_type type, unsigned pos,  isl_id *id);   
const char *isl_multi_val_get_tuple_name(				
	 isl_multi_val *multi, enum isl_dim_type type);	
extern								
isl_bool isl_multi_val_has_range_tuple_id(				
	 isl_multi_val *multi);				
isl_bool isl_multi_val_has_tuple_id(				
	 isl_multi_val *multi, enum isl_dim_type type);	
extern								
 isl_id *isl_multi_val_get_range_tuple_id(		
	 isl_multi_val *multi);				
 isl_id *isl_multi_val_get_tuple_id(			
	 isl_multi_val *multi, enum isl_dim_type type);	
 isl_multi_val *isl_multi_val_set_tuple_name(		
	 isl_multi_val *multi,				
	enum isl_dim_type type, const char *s);				
								
 isl_multi_val *isl_multi_val_set_range_tuple_id(	
	 isl_multi_val *multi,   isl_id *id);	
 isl_multi_val *isl_multi_val_set_tuple_id(		
	 isl_multi_val *multi,				
	enum isl_dim_type type,  isl_id *id);			
extern								
 isl_multi_val *isl_multi_val_reset_range_tuple_id(	
	 isl_multi_val *multi);				
 isl_multi_val *isl_multi_val_reset_tuple_id(		
	 isl_multi_val *multi, enum isl_dim_type type);    
extern								
 isl_multi_val *isl_multi_val_product(		
	 isl_multi_val *multi1,				
	 isl_multi_val *multi2);				
 isl_multi_val *isl_multi_val_splice(			
	 isl_multi_val *multi1, unsigned in_pos,		
	unsigned out_pos,  isl_multi_val *multi2);  

extern
 isl_val *isl_val_zero(isl_ctx *ctx);
extern
 isl_val *isl_val_one(isl_ctx *ctx);
extern
 isl_val *isl_val_negone(isl_ctx *ctx);
extern
 isl_val *isl_val_nan(isl_ctx *ctx);
extern
 isl_val *isl_val_infty(isl_ctx *ctx);
extern
 isl_val *isl_val_neginfty(isl_ctx *ctx);

 isl_val *isl_val_int_from_si(isl_ctx *ctx, long i);
 isl_val *isl_val_int_from_ui(isl_ctx *ctx, unsigned long u);
 isl_val *isl_val_int_from_chunks(isl_ctx *ctx, size_t n,
	size_t size, const void *chunks);

 isl_val *isl_val_copy( isl_val *v);
 isl_val *isl_val_free( isl_val *v);

isl_ctx *isl_val_get_ctx( isl_val *val);
uint32_t isl_val_get_hash( isl_val *val);
extern
long isl_val_get_num_si( isl_val *v);
extern
long isl_val_get_den_si( isl_val *v);
 isl_val *isl_val_get_den_val( isl_val *v);
double isl_val_get_d( isl_val *v);
isl_size isl_val_n_abs_num_chunks( isl_val *v, size_t size);
isl_stat isl_val_get_abs_num_chunks( isl_val *v, size_t size,
	void *chunks);

 isl_val *isl_val_set_si( isl_val *v, long i);

extern
 isl_val *isl_val_abs( isl_val *v);
extern
 isl_val *isl_val_neg( isl_val *v);
extern
 isl_val *isl_val_inv( isl_val *v);
extern
 isl_val *isl_val_floor( isl_val *v);
extern
 isl_val *isl_val_ceil( isl_val *v);
extern
 isl_val *isl_val_trunc( isl_val *v);
 isl_val *isl_val_2exp( isl_val *v);
extern
 isl_val *isl_val_pow2( isl_val *v);
extern
 isl_val *isl_val_min( isl_val *v1,  isl_val *v2);
extern
 isl_val *isl_val_max( isl_val *v1,  isl_val *v2);
extern
 isl_val *isl_val_add( isl_val *v1,  isl_val *v2);
 isl_val *isl_val_add_ui( isl_val *v1, unsigned long v2);
extern
 isl_val *isl_val_sub( isl_val *v1,  isl_val *v2);
 isl_val *isl_val_sub_ui( isl_val *v1, unsigned long v2);
extern
 isl_val *isl_val_mul( isl_val *v1,  isl_val *v2);
 isl_val *isl_val_mul_ui( isl_val *v1, unsigned long v2);
extern
 isl_val *isl_val_div( isl_val *v1,  isl_val *v2);
 isl_val *isl_val_div_ui( isl_val *v1, unsigned long v2);
extern
 isl_val *isl_val_mod( isl_val *v1,  isl_val *v2);
extern
 isl_val *isl_val_gcd( isl_val *v1,  isl_val *v2);
 isl_val *isl_val_gcdext( isl_val *v1,
	 isl_val *v2,  isl_val **x,  isl_val **y);

extern
int isl_val_sgn( isl_val *v);
extern
isl_bool isl_val_is_zero( isl_val *v);
extern
isl_bool isl_val_is_one( isl_val *v);
extern
isl_bool isl_val_is_negone( isl_val *v);
extern
isl_bool isl_val_is_nonneg( isl_val *v);
extern
isl_bool isl_val_is_nonpos( isl_val *v);
extern
isl_bool isl_val_is_pos( isl_val *v);
extern
isl_bool isl_val_is_neg( isl_val *v);
extern
isl_bool isl_val_is_int( isl_val *v);
extern
isl_bool isl_val_is_rat( isl_val *v);
extern
isl_bool isl_val_is_nan( isl_val *v);
extern
isl_bool isl_val_is_infty( isl_val *v);
extern
isl_bool isl_val_is_neginfty( isl_val *v);

extern
int isl_val_cmp_si( isl_val *v, long i);

extern
isl_bool isl_val_lt( isl_val *v1,  isl_val *v2);
extern
isl_bool isl_val_le( isl_val *v1,  isl_val *v2);
extern
isl_bool isl_val_gt( isl_val *v1,  isl_val *v2);
isl_bool isl_val_gt_si( isl_val *v, long i);
extern
isl_bool isl_val_ge( isl_val *v1,  isl_val *v2);
extern
isl_bool isl_val_eq( isl_val *v1,  isl_val *v2);
isl_bool isl_val_eq_si( isl_val *v, long i);
extern
isl_bool isl_val_ne( isl_val *v1,  isl_val *v2);
extern
isl_bool isl_val_abs_eq( isl_val *v1,  isl_val *v2);

extern
isl_bool isl_val_is_divisible_by( isl_val *v1,
	 isl_val *v2);


 isl_val *isl_val_read_from_str(isl_ctx *ctx, const char *str);
 isl_printer *isl_printer_print_val( isl_printer *p,
	 isl_val *v);
void isl_val_dump( isl_val *v);
 char *isl_val_to_str( isl_val *v);

isl_bool isl_multi_val_is_zero( isl_multi_val *mv);


 isl_multi_val *isl_multi_val_add_val( isl_multi_val *mv,
	 isl_val *v);
 isl_multi_val *isl_multi_val_mod_val( isl_multi_val *mv,
	 isl_val *v);


 isl_multi_val *isl_multi_val_read_from_str(isl_ctx *ctx,
	const char *str);
 isl_printer *isl_printer_print_multi_val( isl_printer *p,
	 isl_multi_val *mv);
void isl_multi_val_dump( isl_multi_val *mv);
 char *isl_multi_val_to_str( isl_multi_val *mv);

isl_ctx *isl_val_list_get_ctx( isl_val_list *list);	
 isl_val_list *isl_val_to_list( isl_val *el);
 isl_val_list *isl_val_list_from_val(			
	 isl_val *el);					
 isl_val_list *isl_val_list_alloc(isl_ctx *ctx, int n);	
 isl_val_list *isl_val_list_copy(			
	 isl_val_list *list);				
 isl_val_list *isl_val_list_free(			
	 isl_val_list *list);				
 isl_val_list *isl_val_list_add(			
	 isl_val_list *list,				
	 isl_val *el);					
 isl_val_list *isl_val_list_insert(			
	 isl_val_list *list, unsigned pos,			
	 isl_val *el);					
 isl_val_list *isl_val_list_drop(			
	 isl_val_list *list, unsigned first, unsigned n);	
 isl_val_list *isl_val_list_clear(			
	 isl_val_list *list);				
 isl_val_list *isl_val_list_swap(			
	 isl_val_list *list, unsigned pos1,		
	unsigned pos2);							
 isl_val_list *isl_val_list_reverse(			
	 isl_val_list *list);				
 isl_val_list *isl_val_list_concat(			
	 isl_val_list *list1,				
	 isl_val_list *list2);				
isl_size isl_val_list_size( isl_val_list *list);	
isl_size isl_val_list_n_val( isl_val_list *list);	
 isl_val *isl_val_list_get_at(				
	 isl_val_list *list, int index);			
  isl_val *isl_val_list_get_val(			
	 isl_val_list *list, int index);			
 isl_val_list *isl_val_list_set_at(			
	 isl_val_list *list, int index,			
	 isl_val *el);					
  isl_val_list *isl_val_list_set_val(		
	 struct isl_val_list *list, int index,		
	 struct isl_val *el);				
isl_stat isl_val_list_foreach( isl_val_list *list,	
	isl_stat (*fn)( isl_val *el, void *user),		
	void *user);							
isl_bool isl_val_list_every( isl_val_list *list,	
	isl_bool (*test)( isl_val *el, void *user),		
	void *user);							
 isl_val_list *isl_val_list_map(			
	 isl_val_list *list,				
	 isl_val * (*fn)( isl_val *el,		
		void *user),						
	void *user);							
 isl_val_list *isl_val_list_sort(			
	 isl_val_list *list,				
	int (*cmp)( struct isl_val *a,			
		 struct isl_val *b,				
		void *user), void *user);				
isl_stat isl_val_list_foreach_scc( isl_val_list *list,	
	isl_bool (*follows)( isl_val *a,			
			 isl_val *b, void *user),		
	void *follows_user,						
	isl_stat (*fn)( isl_val_list *scc, void *user),	
	void *fn_user);							
 char *isl_val_list_to_str(				
	 isl_val_list *list);				
 isl_printer *isl_printer_print_val_list(			
	 isl_printer *p,  isl_val_list *list);	
void isl_val_list_dump( isl_val_list *list);  
isl_val_list *isl_val_list_read_from_str(		
	isl_ctx *ctx, const char *str);

#if defined(__cplusplus)
}
#endif

#endif
