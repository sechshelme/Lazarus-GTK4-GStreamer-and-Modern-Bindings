#ifndef ISL_MAP_TYPE_H
#define ISL_MAP_TYPE_H

#include <isl/ctx.h>
#include <isl/list.h>

#if defined(__cplusplus)

#endif

struct  isl_basic_map;
typedef struct isl_basic_map isl_basic_map;
struct isl_basic_map;							
struct isl_basic_map_list;					
typedef struct isl_basic_map_list isl_basic_map_list;
struct  isl_map;
typedef struct isl_map isl_map;
struct isl_map;							
struct isl_map_list;					
typedef struct isl_map_list isl_map_list;

#ifndef isl_basic_set
struct isl_basic_set;
typedef struct isl_basic_set isl_basic_set;
struct isl_basic_set;							
struct isl_basic_set_list;					
typedef struct isl_basic_set_list isl_basic_set_list;
#endif

#ifndef isl_set
struct  isl_set;
typedef struct isl_set isl_set;
struct isl_set;							
struct isl_set_list;					
typedef struct isl_set_list isl_set_list;
#endif


isl_ctx *isl_basic_set_list_get_ctx( isl_basic_set_list *list);	
 isl_basic_set_list *isl_basic_set_to_list( isl_basic_set *el);
 isl_basic_set_list *isl_basic_set_list_from_basic_set(			
	 isl_basic_set *el);					
 isl_basic_set_list *isl_basic_set_list_alloc(isl_ctx *ctx, int n);	
 isl_basic_set_list *isl_basic_set_list_copy(			
	 isl_basic_set_list *list);				
 isl_basic_set_list *isl_basic_set_list_free(			
	 isl_basic_set_list *list);				
 isl_basic_set_list *isl_basic_set_list_add(			
	 isl_basic_set_list *list,				
	 isl_basic_set *el);					
 isl_basic_set_list *isl_basic_set_list_insert(			
	 isl_basic_set_list *list, unsigned pos,			
	 isl_basic_set *el);					
 isl_basic_set_list *isl_basic_set_list_drop(			
	 isl_basic_set_list *list, unsigned first, unsigned n);	
 isl_basic_set_list *isl_basic_set_list_clear(			
	 isl_basic_set_list *list);				
 isl_basic_set_list *isl_basic_set_list_swap(			
	 isl_basic_set_list *list, unsigned pos1,		
	unsigned pos2);							
 isl_basic_set_list *isl_basic_set_list_reverse(			
	 isl_basic_set_list *list);				
 isl_basic_set_list *isl_basic_set_list_concat(			
	 isl_basic_set_list *list1,				
	 isl_basic_set_list *list2);				
isl_size isl_basic_set_list_size( isl_basic_set_list *list);	
isl_size isl_basic_set_list_n_basic_set( isl_basic_set_list *list);	
 isl_basic_set *isl_basic_set_list_get_at(				
	 isl_basic_set_list *list, int index);			
 isl_basic_set *isl_basic_set_list_get_basic_set(			
	 isl_basic_set_list *list, int index);			
 isl_basic_set_list *isl_basic_set_list_set_at(			
	 isl_basic_set_list *list, int index,			
	 isl_basic_set *el);					
 isl_basic_set_list *isl_basic_set_list_set_basic_set(		
	 struct isl_basic_set_list *list, int index,		
	 struct isl_basic_set *el);				
isl_stat isl_basic_set_list_foreach( isl_basic_set_list *list,	
	isl_stat (*fn)( isl_basic_set *el, void *user),		
	void *user);							
isl_bool isl_basic_set_list_every( isl_basic_set_list *list,	
	isl_bool (*test)( isl_basic_set *el, void *user),		
	void *user);							
 isl_basic_set_list *isl_basic_set_list_map(			
	 isl_basic_set_list *list,				
	 isl_basic_set * (*fn)( isl_basic_set *el,		
		void *user),						
	void *user);							
 isl_basic_set_list *isl_basic_set_list_sort(			
	 isl_basic_set_list *list,				
	int (*cmp)( struct isl_basic_set *a,			
		 struct isl_basic_set *b,				
		void *user), void *user);				
isl_stat isl_basic_set_list_foreach_scc( isl_basic_set_list *list,	
	isl_bool (*follows)( isl_basic_set *a,			
			 isl_basic_set *b, void *user),		
	void *follows_user,						
	isl_stat (*fn)( isl_basic_set_list *scc, void *user),	
	void *fn_user);							
 char *isl_basic_set_list_to_str(				
	 isl_basic_set_list *list);				
 isl_printer *isl_printer_print_basic_set_list(			
	 isl_printer *p,  isl_basic_set_list *list);	
void isl_basic_set_list_dump( isl_basic_set_list *list);  


isl_ctx *isl_set_list_get_ctx( isl_set_list *list);	
 isl_set_list *isl_set_to_list( isl_set *el);
 isl_set_list *isl_set_list_from_set(			
	 isl_set *el);					
 isl_set_list *isl_set_list_alloc(isl_ctx *ctx, int n);	
 isl_set_list *isl_set_list_copy(			
	 isl_set_list *list);				
 isl_set_list *isl_set_list_free(			
	 isl_set_list *list);				
 isl_set_list *isl_set_list_add(			
	 isl_set_list *list,				
	 isl_set *el);					
 isl_set_list *isl_set_list_insert(			
	 isl_set_list *list, unsigned pos,			
	 isl_set *el);					
 isl_set_list *isl_set_list_drop(			
	 isl_set_list *list, unsigned first, unsigned n);	
 isl_set_list *isl_set_list_clear(			
	 isl_set_list *list);				
 isl_set_list *isl_set_list_swap(			
	 isl_set_list *list, unsigned pos1,		
	unsigned pos2);							
 isl_set_list *isl_set_list_reverse(			
	 isl_set_list *list);				
 isl_set_list *isl_set_list_concat(			
	 isl_set_list *list1,				
	 isl_set_list *list2);				
isl_size isl_set_list_size( isl_set_list *list);	
isl_size isl_set_list_n_set( isl_set_list *list);	
 isl_set *isl_set_list_get_at(				
	 isl_set_list *list, int index);			
 isl_set *isl_set_list_get_set(			
	 isl_set_list *list, int index);			
 isl_set_list *isl_set_list_set_at(			
	 isl_set_list *list, int index,			
	 isl_set *el);					
 isl_set_list *isl_set_list_set_set(		
	 struct isl_set_list *list, int index,		
	 struct isl_set *el);				
isl_stat isl_set_list_foreach( isl_set_list *list,	
	isl_stat (*fn)( isl_set *el, void *user),		
	void *user);							
isl_bool isl_set_list_every( isl_set_list *list,	
	isl_bool (*test)( isl_set *el, void *user),		
	void *user);							
 isl_set_list *isl_set_list_map(			
	 isl_set_list *list,				
	 isl_set * (*fn)( isl_set *el,		
		void *user),						
	void *user);							
 isl_set_list *isl_set_list_sort(			
	 isl_set_list *list,				
	int (*cmp)( struct isl_set *a,			
		 struct isl_set *b,				
		void *user), void *user);				
isl_stat isl_set_list_foreach_scc( isl_set_list *list,	
	isl_bool (*follows)( isl_set *a,			
			 isl_set *b, void *user),		
	void *follows_user,						
	isl_stat (*fn)( isl_set_list *scc, void *user),	
	void *fn_user);							
 char *isl_set_list_to_str(				
	 isl_set_list *list);				
 isl_printer *isl_printer_print_set_list(			
	 isl_printer *p,  isl_set_list *list);	
void isl_set_list_dump( isl_set_list *list);  


isl_set_list *isl_set_list_read_from_str(		
	isl_ctx *ctx, const char *str);



#endif
