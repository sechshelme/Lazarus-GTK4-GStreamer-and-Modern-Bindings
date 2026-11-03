#ifndef ISL_ID_H
#define ISL_ID_H

#include <isl/ctx.h>
#include <isl/id_type.h>
#include <isl/list.h>
#include <isl/multi.h>
#include <isl/printer_type.h>
#include <isl/stdint.h>

#if defined(__cplusplus)

#endif

ISL_DECLARE_EXPORTED_LIST_FN(id)
ISL_DECLARE_EXPORTED_LIST_FN_READ(id)

isl_ctx *isl_multi_id_get_ctx(					
	 isl_multi_id *multi);				
extern								
 isl_space *isl_multi_id_get_space(			
	 isl_multi_id *multi);				
 isl_space *isl_multi_id_get_domain_space(		
	 isl_multi_id *multi);				
extern								
 isl_id_list *isl_multi_id_get_list(		
	 isl_multi_id *multi);				
							
 isl_multi_id *isl_multi_id_from_id_list(	
	 isl_space *space,  isl_id_list *list); 
extern								
 isl_multi_id *isl_space_multi_id(			
	 isl_space *space,  isl_id_list *list); 
 isl_multi_id *isl_multi_id_copy(			
	 isl_multi_id *multi);				
 isl_multi_id *isl_multi_id_free(			
	 isl_multi_id *multi);				
extern								
isl_bool isl_multi_id_plain_is_equal(				
	 isl_multi_id *multi1,				
	 isl_multi_id *multi2);				
 isl_multi_id *isl_multi_id_reset_user(		
	 isl_multi_id *multi);				
extern								
isl_size isl_multi_id_size( isl_multi_id *multi);	
extern								
 isl_id *isl_multi_id_get_at(			
	 isl_multi_id *multi, int pos);			
 isl_id *isl_multi_id_get_id(			
	 isl_multi_id *multi, int pos);			
extern								
 isl_multi_id *isl_multi_id_set_at(			
	 isl_multi_id *multi, int pos,			
	 isl_id *el);					
 isl_multi_id *isl_multi_id_set_id(		
	 isl_multi_id *multi, int pos,			
	 isl_id *el);					
 isl_multi_id *isl_multi_id_range_splice(		
	 isl_multi_id *multi1, unsigned pos,		
	 isl_multi_id *multi2);				
 isl_multi_id *isl_multi_id_flatten_range(		
	 isl_multi_id *multi);				
extern								
 isl_multi_id *isl_multi_id_flat_range_product(	
	 isl_multi_id *multi1,				
	 isl_multi_id *multi2);				
extern								
 isl_multi_id *isl_multi_id_range_product(		
	 isl_multi_id *multi1,				
	 isl_multi_id *multi2);				
 isl_multi_id *isl_multi_id_factor_range(		
	 isl_multi_id *multi);				
isl_bool isl_multi_id_range_is_wrapping(				
	 isl_multi_id *multi);				
 isl_multi_id *isl_multi_id_range_factor_domain(	
	 isl_multi_id *multi);				
 isl_multi_id *isl_multi_id_range_factor_range(	
	 isl_multi_id *multi);				
 isl_multi_id *isl_multi_id_align_params(		
	 isl_multi_id *multi,				
	 isl_space *model);					
 isl_multi_id *isl_multi_id_from_range(		
	 isl_multi_id *multi);               

isl_ctx *isl_id_get_ctx( isl_id *id);
uint32_t isl_id_get_hash( isl_id *id);

 isl_id *isl_id_alloc(isl_ctx *ctx,
	 const char *name, void *user);
 isl_id *isl_id_copy(isl_id *id);
 isl_id *isl_id_free( isl_id *id);

void *isl_id_get_user( isl_id *id);
extern
 const char *isl_id_get_name( isl_id *id);

 isl_id *isl_id_set_free_user( isl_id *id,
	void (*free_user)(void *user));
void (*isl_id_get_free_user( isl_id *id))(void *user);


 isl_id *isl_id_read_from_str(isl_ctx *ctx, const char *str);
 char *isl_id_to_str( isl_id *id);
 isl_printer *isl_printer_print_id( isl_printer *p,
	 isl_id *id);
void isl_id_dump( isl_id *id);


 isl_multi_id *isl_multi_id_read_from_str(isl_ctx *ctx,
	const char *str);
 isl_printer *isl_printer_print_multi_id( isl_printer *p,
	 isl_multi_id *mi);
void isl_multi_id_dump( isl_multi_id *mi);
 char *isl_multi_id_to_str( isl_multi_id *mi);

#if defined(__cplusplus)
}
#endif

#endif
