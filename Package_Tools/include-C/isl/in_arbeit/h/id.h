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


isl_ctx *isl_id_list_get_ctx( isl_id_list *list);	
 isl_id_list *isl_id_to_list( isl_id *el);
 isl_id_list *isl_id_list_from_id(			
	 isl_id *el);					
 isl_id_list *isl_id_list_alloc(isl_ctx *ctx, int n);	
 isl_id_list *isl_id_list_copy(			
	 isl_id_list *list);				
 isl_id_list *isl_id_list_free(			
	 isl_id_list *list);				
 isl_id_list *isl_id_list_add(			
	 isl_id_list *list,				
	 isl_id *el);					
 isl_id_list *isl_id_list_insert(			
	 isl_id_list *list, unsigned pos,			
	 isl_id *el);					
 isl_id_list *isl_id_list_drop(			
	 isl_id_list *list, unsigned first, unsigned n);	
 isl_id_list *isl_id_list_clear(			
	 isl_id_list *list);				
 isl_id_list *isl_id_list_swap(			
	 isl_id_list *list, unsigned pos1,		
	unsigned pos2);							
 isl_id_list *isl_id_list_reverse(			
	 isl_id_list *list);				
 isl_id_list *isl_id_list_concat(			
	 isl_id_list *list1,				
	 isl_id_list *list2);				
isl_size isl_id_list_size( isl_id_list *list);	
isl_size isl_id_list_n_id( isl_id_list *list);	
 isl_id *isl_id_list_get_at(				
	 isl_id_list *list, int index);			
 isl_id *isl_id_list_get_id(			
	 isl_id_list *list, int index);			
 isl_id_list *isl_id_list_set_at(			
	 isl_id_list *list, int index,			
	 isl_id *el);					
 isl_id_list *isl_id_list_set_id(		
	 struct isl_id_list *list, int index,		
	 struct isl_id *el);				
isl_stat isl_id_list_foreach( isl_id_list *list,	
	isl_stat (*fn)( isl_id *el, void *user),		
	void *user);							
isl_bool isl_id_list_every( isl_id_list *list,	
	isl_bool (*test)( isl_id *el, void *user),		
	void *user);							
 isl_id_list *isl_id_list_map(			
	 isl_id_list *list,				
	 isl_id * (*fn)( isl_id *el,		
		void *user),						
	void *user);							
 isl_id_list *isl_id_list_sort(			
	 isl_id_list *list,				
	int (*cmp)( struct isl_id *a,			
		 struct isl_id *b,				
		void *user), void *user);				
isl_stat isl_id_list_foreach_scc( isl_id_list *list,	
	isl_bool (*follows)( isl_id *a,			
			 isl_id *b, void *user),		
	void *follows_user,						
	isl_stat (*fn)( isl_id_list *scc, void *user),	
	void *fn_user);							
 char *isl_id_list_to_str(				
	 isl_id_list *list);				
 isl_printer *isl_printer_print_id_list(			
	 isl_printer *p,  isl_id_list *list);	
void isl_id_list_dump( isl_id_list *list);  


isl_id_list *isl_id_list_read_from_str(		
	isl_ctx *ctx, const char *str);



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

#endif
