#ifndef ISL_UNION_SET_H
#define ISL_UNION_SET_H

#include <isl/point.h>
#include <isl/union_map.h>

#if defined(__cplusplus)

#endif

isl_size isl_union_set_dim( isl_union_set *uset,
	enum isl_dim_type type);


 isl_union_set *isl_union_set_from_basic_set(
	 isl_basic_set *bset);
extern
 isl_union_set *isl_set_to_union_set( isl_set *set);

 isl_union_set *isl_union_set_from_set( isl_set *set);

 isl_union_set *isl_union_set_empty_ctx(isl_ctx *ctx);
 isl_union_set *isl_union_set_empty_space(
	 isl_space *space);
 isl_union_set *isl_union_set_empty( isl_space *space);
 isl_union_set *isl_union_set_copy( isl_union_set *uset);
 isl_union_set *isl_union_set_free( isl_union_set *uset);

isl_ctx *isl_union_set_get_ctx( isl_union_set *uset);
extern
 isl_space *isl_union_set_get_space( isl_union_set *uset);

 isl_union_set *isl_union_set_reset_user(
	 isl_union_set *uset);

extern
 isl_union_set *isl_union_set_universe(
	 isl_union_set *uset);
extern
 isl_set *isl_union_set_params( isl_union_set *uset);

extern
 isl_union_set *isl_union_set_detect_equalities(
	 isl_union_set *uset);
extern
 isl_union_set *isl_union_set_affine_hull(
	 isl_union_set *uset);
extern
 isl_union_set *isl_union_set_polyhedral_hull(
	 isl_union_set *uset);
 isl_union_set *isl_union_set_remove_redundancies(
	 isl_union_set *uset);
 isl_union_set *isl_union_set_simple_hull(
	 isl_union_set *uset);
extern
 isl_union_set *isl_union_set_coalesce(
	 isl_union_set *uset);
extern
 isl_union_set *isl_union_set_compute_divs(
	 isl_union_set *uset);
extern
 isl_union_set *isl_union_set_lexmin( isl_union_set *uset);
extern
 isl_union_set *isl_union_set_lexmax( isl_union_set *uset);

 isl_union_set *isl_union_set_add_set( isl_union_set *uset,
	 isl_set *set);
extern
 isl_union_set *isl_union_set_union( isl_union_set *uset1,
	 isl_union_set *uset2);
extern
 isl_union_set *isl_union_set_subtract(
	 isl_union_set *uset1,  isl_union_set *uset2);
extern
 isl_union_set *isl_union_set_intersect(
	 isl_union_set *uset1,  isl_union_set *uset2);
extern
 isl_union_set *isl_union_set_intersect_params(
	 isl_union_set *uset,  isl_set *set);
 isl_union_set *isl_union_set_product( isl_union_set *uset1,
	 isl_union_set *uset2);
extern
 isl_union_set *isl_union_set_gist( isl_union_set *uset,
	 isl_union_set *context);
extern
 isl_union_set *isl_union_set_gist_params(
	 isl_union_set *uset,  isl_set *set);

extern
 isl_union_set *isl_union_set_apply(
	 isl_union_set *uset,  isl_union_map *umap);

 isl_union_set *isl_union_set_preimage_multi_aff(
	 isl_union_set *uset,  isl_multi_aff *ma);

 isl_union_set *isl_union_set_preimage_pw_multi_aff(
	 isl_union_set *uset,  isl_pw_multi_aff *pma);

 isl_union_set *isl_union_set_preimage_union_pw_multi_aff(
	 isl_union_set *uset,
	 isl_union_pw_multi_aff *upma);

 isl_union_set *isl_union_set_project_out(
	 isl_union_set *uset,
	enum isl_dim_type type, unsigned first, unsigned n);
extern
 isl_union_set *isl_union_set_project_out_all_params(
	 isl_union_set *uset);
extern
 isl_union_set *isl_union_set_drop_unused_params(
	 isl_union_set *uset);
 isl_union_set *isl_union_set_remove_divs(
	 isl_union_set *bset);

isl_bool isl_union_set_is_params( isl_union_set *uset);
extern
isl_bool isl_union_set_is_empty( isl_union_set *uset);

extern
isl_bool isl_union_set_is_subset( isl_union_set *uset1,
	 isl_union_set *uset2);
extern
isl_bool isl_union_set_is_equal( isl_union_set *uset1,
	 isl_union_set *uset2);
extern
isl_bool isl_union_set_is_disjoint( isl_union_set *uset1,
	 isl_union_set *uset2);
extern
isl_bool isl_union_set_is_strict_subset( isl_union_set *uset1,
	 isl_union_set *uset2);

uint32_t isl_union_set_get_hash( isl_union_set *uset);

isl_size isl_union_set_n_set( isl_union_set *uset);
extern
isl_stat isl_union_set_foreach_set( isl_union_set *uset,
	isl_stat (*fn)( isl_set *set, void *user), void *user);
extern
isl_bool isl_union_set_every_set( isl_union_set *uset,
	isl_bool (*test)( isl_set *set, void *user), void *user);
 isl_basic_set_list *isl_union_set_get_basic_set_list(
	 isl_union_set *uset);
extern
 isl_set_list *isl_union_set_get_set_list(
	 isl_union_set *uset);
isl_bool isl_union_set_contains( isl_union_set *uset,
	 isl_space *space);
extern
 isl_set *isl_union_set_extract_set( isl_union_set *uset,
	 isl_space *space);
extern
isl_bool isl_union_set_isa_set( isl_union_set *uset);
extern
 isl_set *isl_union_set_as_set( isl_union_set *uset);
 isl_set *isl_set_from_union_set( isl_union_set *uset);
extern
isl_stat isl_union_set_foreach_point( isl_union_set *uset,
	isl_stat (*fn)( isl_point *pnt, void *user), void *user);

 isl_basic_set *isl_union_set_sample( isl_union_set *uset);
extern
 isl_point *isl_union_set_sample_point(
	 isl_union_set *uset);


 isl_union_set *isl_union_set_from_point( isl_point *pnt);

 isl_union_set *isl_union_set_lift( isl_union_set *uset);

 isl_union_map *isl_union_set_lex_lt_union_set(
	 isl_union_set *uset1,  isl_union_set *uset2);
 isl_union_map *isl_union_set_lex_le_union_set(
	 isl_union_set *uset1,  isl_union_set *uset2);
 isl_union_map *isl_union_set_lex_gt_union_set(
	 isl_union_set *uset1,  isl_union_set *uset2);
 isl_union_map *isl_union_set_lex_ge_union_set(
	 isl_union_set *uset1,  isl_union_set *uset2);

 isl_union_set *isl_union_set_coefficients(
	 isl_union_set *bset);
 isl_union_set *isl_union_set_solutions(
	 isl_union_set *bset);

 isl_union_set *isl_union_set_read_from_file(isl_ctx *ctx,
	FILE *input);

 isl_union_set *isl_union_set_read_from_str(isl_ctx *ctx,
	const char *str);
 char *isl_union_set_to_str( isl_union_set *uset);
 isl_printer *isl_printer_print_union_set( isl_printer *p,
	 isl_union_set *uset);
void isl_union_set_dump( isl_union_set *uset);

isl_ctx *isl_union_set_list_get_ctx( isl_union_set_list *list);	
 isl_union_set_list *isl_union_set_to_list( isl_union_set *el);
 isl_union_set_list *isl_union_set_list_from_union_set(			
	 isl_union_set *el);					
 isl_union_set_list *isl_union_set_list_alloc(isl_ctx *ctx, int n);	
 isl_union_set_list *isl_union_set_list_copy(			
	 isl_union_set_list *list);				
 isl_union_set_list *isl_union_set_list_free(			
	 isl_union_set_list *list);				
 isl_union_set_list *isl_union_set_list_add(			
	 isl_union_set_list *list,				
	 isl_union_set *el);					
 isl_union_set_list *isl_union_set_list_insert(			
	 isl_union_set_list *list, unsigned pos,			
	 isl_union_set *el);					
 isl_union_set_list *isl_union_set_list_drop(			
	 isl_union_set_list *list, unsigned first, unsigned n);	
 isl_union_set_list *isl_union_set_list_clear(			
	 isl_union_set_list *list);				
 isl_union_set_list *isl_union_set_list_swap(			
	 isl_union_set_list *list, unsigned pos1,		
	unsigned pos2);							
 isl_union_set_list *isl_union_set_list_reverse(			
	 isl_union_set_list *list);				
 isl_union_set_list *isl_union_set_list_concat(			
	 isl_union_set_list *list1,				
	 isl_union_set_list *list2);				
isl_size isl_union_set_list_size( isl_union_set_list *list);	
isl_size isl_union_set_list_n_union_set( isl_union_set_list *list);	
 isl_union_set *isl_union_set_list_get_at(				
	 isl_union_set_list *list, int index);			
  isl_union_set *isl_union_set_list_get_union_set(			
	 isl_union_set_list *list, int index);			
 isl_union_set_list *isl_union_set_list_set_at(			
	 isl_union_set_list *list, int index,			
	 isl_union_set *el);					
  isl_union_set_list *isl_union_set_list_set_union_set(		
	 struct isl_union_set_list *list, int index,		
	 struct isl_union_set *el);				
isl_stat isl_union_set_list_foreach( isl_union_set_list *list,	
	isl_stat (*fn)( isl_union_set *el, void *user),		
	void *user);							
isl_bool isl_union_set_list_every( isl_union_set_list *list,	
	isl_bool (*test)( isl_union_set *el, void *user),		
	void *user);							
 isl_union_set_list *isl_union_set_list_map(			
	 isl_union_set_list *list,				
	 isl_union_set * (*fn)( isl_union_set *el,		
		void *user),						
	void *user);							
 isl_union_set_list *isl_union_set_list_sort(			
	 isl_union_set_list *list,				
	int (*cmp)( struct isl_union_set *a,			
		 struct isl_union_set *b,				
		void *user), void *user);				
isl_stat isl_union_set_list_foreach_scc( isl_union_set_list *list,	
	isl_bool (*follows)( isl_union_set *a,			
			 isl_union_set *b, void *user),		
	void *follows_user,						
	isl_stat (*fn)( isl_union_set_list *scc, void *user),	
	void *fn_user);							
 char *isl_union_set_list_to_str(				
	 isl_union_set_list *list);				
 isl_printer *isl_printer_print_union_set_list(			
	 isl_printer *p,  isl_union_set_list *list);	
void isl_union_set_list_dump( isl_union_set_list *list);  
isl_union_set_list *isl_union_set_list_read_from_str(		
	isl_ctx *ctx, const char *str);

 isl_union_set *isl_union_set_list_union(
	 isl_union_set_list *list);

#if defined(__cplusplus)
}
#endif

#endif
