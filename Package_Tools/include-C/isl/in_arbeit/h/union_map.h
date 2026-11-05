#ifndef ISL_UNION_MAP_H
#define ISL_UNION_MAP_H

#include <isl/stdint.h>
#include <isl/space_type.h>
#include <isl/aff_type.h>
#include <isl/map_type.h>
#include <isl/union_map_type.h>
#include <isl/printer.h>
#include <isl/val_type.h>

#if defined(__cplusplus)

#endif

isl_size isl_union_map_dim( isl_union_map *umap,
	enum isl_dim_type type);
isl_bool isl_union_map_involves_dims( isl_union_map *umap,
	enum isl_dim_type type, unsigned first, unsigned n);
 isl_id *isl_union_map_get_dim_id( isl_union_map *umap,
	enum isl_dim_type type, unsigned pos);


 isl_union_map *isl_union_map_from_basic_map(
	 isl_basic_map *bmap);
extern
 isl_union_map *isl_map_to_union_map( isl_map *map);

 isl_union_map *isl_union_map_from_map( isl_map *map);

 isl_union_map *isl_union_map_empty_ctx(isl_ctx *ctx);
 isl_union_map *isl_union_map_empty_space(
	 isl_space *space);
 isl_union_map *isl_union_map_empty( isl_space *space);
 isl_union_map *isl_union_map_copy( isl_union_map *umap);
 isl_union_map *isl_union_map_free( isl_union_map *umap);

isl_ctx *isl_union_map_get_ctx( isl_union_map *umap);
extern
 isl_space *isl_union_map_get_space( isl_union_map *umap);

 isl_union_map *isl_union_map_reset_user(
	 isl_union_map *umap);

int isl_union_map_find_dim_by_name( isl_union_map *umap,
	enum isl_dim_type type, const char *name);

extern
 isl_union_map *isl_union_map_universe(
	 isl_union_map *umap);
extern
 isl_set *isl_union_map_params( isl_union_map *umap);
extern
 isl_union_set *isl_union_map_domain( isl_union_map *umap);
extern
 isl_union_set *isl_union_map_range( isl_union_map *umap);
extern
 isl_union_map *isl_union_map_domain_map(
	 isl_union_map *umap);
extern
 isl_union_pw_multi_aff *isl_union_map_domain_map_union_pw_multi_aff(
	 isl_union_map *umap);
extern
 isl_union_map *isl_union_map_range_map(
	 isl_union_map *umap);
 isl_union_map *isl_union_set_wrapped_domain_map(
	 isl_union_set *uset);
extern
 isl_union_map *isl_union_map_from_domain(
	 isl_union_set *uset);
extern
 isl_union_map *isl_union_map_from_range(
	 isl_union_set *uset);

extern
 isl_union_map *isl_union_map_affine_hull(
	 isl_union_map *umap);
extern
 isl_union_map *isl_union_map_polyhedral_hull(
	 isl_union_map *umap);
 isl_union_map *isl_union_map_remove_redundancies(
	 isl_union_map *umap);
 isl_union_map *isl_union_map_simple_hull(
	 isl_union_map *umap);
extern
 isl_union_map *isl_union_map_coalesce(
	 isl_union_map *umap);
extern
 isl_union_map *isl_union_map_compute_divs(
	 isl_union_map *umap);
extern
 isl_union_map *isl_union_map_lexmin( isl_union_map *umap);
extern
 isl_union_map *isl_union_map_lexmax( isl_union_map *umap);

 isl_union_map *isl_union_map_add_map( isl_union_map *umap,
	 isl_map *map);
extern
 isl_union_map *isl_union_map_union( isl_union_map *umap1,
	 isl_union_map *umap2);
extern
 isl_union_map *isl_union_map_subtract(
	 isl_union_map *umap1,  isl_union_map *umap2);
extern
 isl_union_map *isl_union_map_intersect(
	 isl_union_map *umap1,  isl_union_map *umap2);
extern
 isl_union_map *isl_union_map_intersect_params(
	 isl_union_map *umap,  isl_set *set);
extern
 isl_union_map *isl_union_map_product( isl_union_map *umap1,
	 isl_union_map *umap2);
extern
 isl_union_map *isl_union_map_domain_product(
	 isl_union_map *umap1,  isl_union_map *umap2);
 isl_union_map *isl_union_map_flat_domain_product(
	 isl_union_map *umap1,  isl_union_map *umap2);
extern
 isl_union_map *isl_union_map_range_product(
	 isl_union_map *umap1,  isl_union_map *umap2);
 isl_union_map *isl_union_map_flat_range_product(
	 isl_union_map *umap1,  isl_union_map *umap2);
extern
 isl_union_map *isl_union_map_domain_factor_domain(
	 isl_union_map *umap);
extern
 isl_union_map *isl_union_map_domain_factor_range(
	 isl_union_map *umap);
extern
 isl_union_map *isl_union_map_range_factor_domain(
	 isl_union_map *umap);
extern
 isl_union_map *isl_union_map_range_factor_range(
	 isl_union_map *umap);
extern
 isl_union_map *isl_union_map_factor_domain(
	 isl_union_map *umap);
extern
 isl_union_map *isl_union_map_factor_range(
	 isl_union_map *umap);
extern
 isl_union_map *isl_union_map_gist( isl_union_map *umap,
	 isl_union_map *context);
extern
 isl_union_map *isl_union_map_gist_params(
	 isl_union_map *umap,  isl_set *set);
extern
 isl_union_map *isl_union_map_gist_domain(
	 isl_union_map *umap,  isl_union_set *uset);
extern
 isl_union_map *isl_union_map_gist_range(
	 isl_union_map *umap,  isl_union_set *uset);


 isl_union_map *isl_union_map_intersect_domain_union_set(
	 isl_union_map *umap,  isl_union_set *uset);

 isl_union_map *isl_union_map_intersect_domain_space(
	 isl_union_map *umap,  isl_space *space);
 isl_union_map *isl_union_map_intersect_domain(
	 isl_union_map *umap,  isl_union_set *uset);

 isl_union_map *isl_union_map_intersect_range_union_set(
	 isl_union_map *umap,  isl_union_set *uset);

 isl_union_map *isl_union_map_intersect_range_space(
	 isl_union_map *umap,  isl_space *space);
 isl_union_map *isl_union_map_intersect_range(
	 isl_union_map *umap,  isl_union_set *uset);
extern
 isl_union_map *isl_union_map_intersect_domain_factor_domain(
	 isl_union_map *umap,  isl_union_map *factor);
extern
 isl_union_map *isl_union_map_intersect_domain_factor_range(
	 isl_union_map *umap,  isl_union_map *factor);
extern
 isl_union_map *isl_union_map_intersect_range_factor_domain(
	 isl_union_map *umap,  isl_union_map *factor);
extern
 isl_union_map *isl_union_map_intersect_range_factor_range(
	 isl_union_map *umap,  isl_union_map *factor);

 isl_union_map *
isl_union_map_intersect_domain_wrapped_domain_union_set(
	 isl_union_map *umap,  isl_union_set *domain);

 isl_union_map *
isl_union_map_intersect_range_wrapped_domain_union_set(
	 isl_union_map *umap,  isl_union_set *domain);

extern
 isl_union_map *isl_union_map_subtract_domain(
	 isl_union_map *umap,  isl_union_set *dom);
extern
 isl_union_map *isl_union_map_subtract_range(
	 isl_union_map *umap,  isl_union_set *dom);

extern
 isl_union_map *isl_union_map_apply_domain(
	 isl_union_map *umap1,  isl_union_map *umap2);
extern
 isl_union_map *isl_union_map_apply_range(
	 isl_union_map *umap1,  isl_union_map *umap2);

 isl_union_map *isl_union_map_preimage_domain_multi_aff(
	 isl_union_map *umap,  isl_multi_aff *ma);

 isl_union_map *isl_union_map_preimage_range_multi_aff(
	 isl_union_map *umap,  isl_multi_aff *ma);

 isl_union_map *isl_union_map_preimage_domain_pw_multi_aff(
	 isl_union_map *umap,  isl_pw_multi_aff *pma);

 isl_union_map *isl_union_map_preimage_range_pw_multi_aff(
	 isl_union_map *umap,  isl_pw_multi_aff *pma);

 isl_union_map *isl_union_map_preimage_domain_multi_pw_aff(
	 isl_union_map *umap,  isl_multi_pw_aff *mpa);

 isl_union_map *isl_union_map_preimage_domain_union_pw_multi_aff(
	 isl_union_map *umap,
	 isl_union_pw_multi_aff *upma);

 isl_union_map *isl_union_map_preimage_range_union_pw_multi_aff(
	 isl_union_map *umap,
	 isl_union_pw_multi_aff *upma);
extern
 isl_union_map *isl_union_map_reverse( isl_union_map *umap);
extern
 isl_union_map *isl_union_map_domain_reverse(
	 isl_union_map *umap);
extern
 isl_union_map *isl_union_map_range_reverse(
	 isl_union_map *umap);
extern
 isl_union_map *isl_union_map_from_domain_and_range(
	 isl_union_set *domain,  isl_union_set *range);

extern
 isl_union_map *isl_union_map_detect_equalities(
	 isl_union_map *umap);
extern
 isl_union_set *isl_union_map_deltas( isl_union_map *umap);
 isl_union_map *isl_union_map_deltas_map(
	 isl_union_map *umap);
extern
 isl_union_map *isl_union_set_identity( isl_union_set *uset);


 isl_union_map *isl_union_map_project_out_param_id(
	 isl_union_map *umap,  isl_id *id);

 isl_union_map *isl_union_map_project_out_param_id_list(
	 isl_union_map *umap,  isl_id_list *list);
 isl_union_map *isl_union_map_project_out(
	 isl_union_map *umap,
	enum isl_dim_type type, unsigned first, unsigned n);
extern
 isl_union_map *isl_union_map_project_out_all_params(
	 isl_union_map *umap);
extern
 isl_union_map *isl_union_map_drop_unused_params(
	 isl_union_map *umap);
 isl_union_map *isl_union_map_remove_divs(
	 isl_union_map *bmap);

extern
 isl_union_set *isl_union_map_bind_range(
	 isl_union_map *umap,  isl_multi_id *tuple);

isl_bool isl_union_map_plain_is_empty( isl_union_map *umap);
extern
isl_bool isl_union_map_is_empty( isl_union_map *umap);
extern
isl_bool isl_union_map_is_single_valued( isl_union_map *umap);
isl_bool isl_union_map_plain_is_injective( isl_union_map *umap);
extern
isl_bool isl_union_map_is_injective( isl_union_map *umap);
extern
isl_bool isl_union_map_is_bijective( isl_union_map *umap);
isl_bool isl_union_map_is_identity( isl_union_map *umap);

extern
isl_bool isl_union_map_is_subset( isl_union_map *umap1,
	 isl_union_map *umap2);
extern
isl_bool isl_union_map_is_equal( isl_union_map *umap1,
	 isl_union_map *umap2);
extern
isl_bool isl_union_map_is_disjoint( isl_union_map *umap1,
	 isl_union_map *umap2);
extern
isl_bool isl_union_map_is_strict_subset( isl_union_map *umap1,
	 isl_union_map *umap2);

uint32_t isl_union_map_get_hash( isl_union_map *umap);

isl_size isl_union_map_n_map( isl_union_map *umap);
extern
isl_stat isl_union_map_foreach_map( isl_union_map *umap,
	isl_stat (*fn)( isl_map *map, void *user), void *user);
extern
 isl_map_list *isl_union_map_get_map_list(
	 isl_union_map *umap);
extern
isl_bool isl_union_map_every_map( isl_union_map *umap,
	isl_bool (*test)( isl_map *map, void *user), void *user);
 isl_union_map *isl_union_map_remove_map_if(
	 isl_union_map *umap,
	isl_bool (*fn)( isl_map *map, void *user), void *user);
isl_bool isl_union_map_contains( isl_union_map *umap,
	 isl_space *space);
extern
 isl_map *isl_union_map_extract_map( isl_union_map *umap,
	 isl_space *space);
extern
isl_bool isl_union_map_isa_map( isl_union_map *umap);
extern
 isl_map *isl_union_map_as_map( isl_union_map *umap);
 isl_map *isl_map_from_union_map( isl_union_map *umap);

 isl_basic_map *isl_union_map_sample( isl_union_map *umap);


 isl_union_map *isl_union_map_fixed_power_val(
	 isl_union_map *umap,  isl_val *exp);
 isl_union_map *isl_union_map_power( isl_union_map *umap,
	isl_bool *exact);
 isl_union_map *isl_union_map_transitive_closure(
	 isl_union_map *umap, isl_bool *exact);

 isl_union_map *isl_union_map_lex_lt_union_map(
	 isl_union_map *umap1,  isl_union_map *umap2);
 isl_union_map *isl_union_map_lex_le_union_map(
	 isl_union_map *umap1,  isl_union_map *umap2);
 isl_union_map *isl_union_map_lex_gt_union_map(
	 isl_union_map *umap1,  isl_union_map *umap2);
 isl_union_map *isl_union_map_lex_ge_union_map(
	 isl_union_map *umap1,  isl_union_map *umap2);


 isl_union_map *isl_union_map_eq_at_multi_union_pw_aff(
	 isl_union_map *umap,
	 isl_multi_union_pw_aff *mupa);
 isl_union_map *isl_union_map_lex_le_at_multi_union_pw_aff(
	 isl_union_map *umap,
	 isl_multi_union_pw_aff *mupa);
 isl_union_map *isl_union_map_lex_lt_at_multi_union_pw_aff(
	 isl_union_map *umap,
	 isl_multi_union_pw_aff *mupa);
 isl_union_map *isl_union_map_lex_ge_at_multi_union_pw_aff(
	 isl_union_map *umap,
	 isl_multi_union_pw_aff *mupa);
 isl_union_map *isl_union_map_lex_gt_at_multi_union_pw_aff(
	 isl_union_map *umap,
	 isl_multi_union_pw_aff *mupa);

 isl_union_map *isl_union_map_read_from_file(isl_ctx *ctx,
	FILE *input);

 isl_union_map *isl_union_map_read_from_str(isl_ctx *ctx,
	const char *str);
 char *isl_union_map_to_str( isl_union_map *umap);
 isl_printer *isl_printer_print_union_map( isl_printer *p,
	 isl_union_map *umap);
void isl_union_map_dump( isl_union_map *umap);

extern
 isl_union_set *isl_union_map_wrap( isl_union_map *umap);
extern
 isl_union_map *isl_union_set_unwrap( isl_union_set *uset);

extern
 isl_union_map *isl_union_map_zip( isl_union_map *umap);
extern
 isl_union_map *isl_union_map_curry( isl_union_map *umap);
 isl_union_map *isl_union_map_range_curry(
	 isl_union_map *umap);
extern
 isl_union_map *isl_union_map_uncurry( isl_union_map *umap);

 isl_union_map *isl_union_map_align_params(
	 isl_union_map *umap,  isl_space *model);
 isl_union_set *isl_union_set_align_params(
	 isl_union_set *uset,  isl_space *model);


isl_ctx *isl_union_map_list_get_ctx( isl_union_map_list *list);	
 isl_union_map_list *isl_union_map_to_list( isl_union_map *el);
 isl_union_map_list *isl_union_map_list_from_union_map(			
	 isl_union_map *el);					
 isl_union_map_list *isl_union_map_list_alloc(isl_ctx *ctx, int n);	
 isl_union_map_list *isl_union_map_list_copy(			
	 isl_union_map_list *list);				
 isl_union_map_list *isl_union_map_list_free(			
	 isl_union_map_list *list);				
 isl_union_map_list *isl_union_map_list_add(			
	 isl_union_map_list *list,				
	 isl_union_map *el);					
 isl_union_map_list *isl_union_map_list_insert(			
	 isl_union_map_list *list, unsigned pos,			
	 isl_union_map *el);					
 isl_union_map_list *isl_union_map_list_drop(			
	 isl_union_map_list *list, unsigned first, unsigned n);	
 isl_union_map_list *isl_union_map_list_clear(			
	 isl_union_map_list *list);				
 isl_union_map_list *isl_union_map_list_swap(			
	 isl_union_map_list *list, unsigned pos1,		
	unsigned pos2);							
 isl_union_map_list *isl_union_map_list_reverse(			
	 isl_union_map_list *list);				
 isl_union_map_list *isl_union_map_list_concat(			
	 isl_union_map_list *list1,				
	 isl_union_map_list *list2);				
isl_size isl_union_map_list_size( isl_union_map_list *list);	
isl_size isl_union_map_list_n_union_map( isl_union_map_list *list);	
 isl_union_map *isl_union_map_list_get_at(				
	 isl_union_map_list *list, int index);			
 isl_union_map *isl_union_map_list_get_union_map(			
	 isl_union_map_list *list, int index);			
 isl_union_map_list *isl_union_map_list_set_at(			
	 isl_union_map_list *list, int index,			
	 isl_union_map *el);					
 isl_union_map_list *isl_union_map_list_set_union_map(		
	 struct isl_union_map_list *list, int index,		
	 struct isl_union_map *el);				
isl_stat isl_union_map_list_foreach( isl_union_map_list *list,	
	isl_stat (*fn)( isl_union_map *el, void *user),		
	void *user);							
isl_bool isl_union_map_list_every( isl_union_map_list *list,	
	isl_bool (*test)( isl_union_map *el, void *user),		
	void *user);							
 isl_union_map_list *isl_union_map_list_map(			
	 isl_union_map_list *list,				
	 isl_union_map * (*fn)( isl_union_map *el,		
		void *user),						
	void *user);							
 isl_union_map_list *isl_union_map_list_sort(			
	 isl_union_map_list *list,				
	int (*cmp)( struct isl_union_map *a,			
		 struct isl_union_map *b,				
		void *user), void *user);				
isl_stat isl_union_map_list_foreach_scc( isl_union_map_list *list,	
	isl_bool (*follows)( isl_union_map *a,			
			 isl_union_map *b, void *user),		
	void *follows_user,						
	isl_stat (*fn)( isl_union_map_list *scc, void *user),	
	void *fn_user);							
 char *isl_union_map_list_to_str(				
	 isl_union_map_list *list);				
 isl_printer *isl_printer_print_union_map_list(			
	 isl_printer *p,  isl_union_map_list *list);	
void isl_union_map_list_dump( isl_union_map_list *list);  



#endif
