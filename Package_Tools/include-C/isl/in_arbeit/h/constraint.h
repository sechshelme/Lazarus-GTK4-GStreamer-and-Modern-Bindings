/*
 * Copyright 2008-2009 Katholieke Universiteit Leuven
 *
 * Use of this software is governed by the MIT license
 *
 * Written by Sven Verdoolaege, K.U.Leuven, Departement
 * Computerwetenschappen, Celestijnenlaan 200A, B-3001 Leuven, Belgium
 */

#ifndef ISL_CONSTRAINT_H
#define ISL_CONSTRAINT_H

#include <isl/local_space.h>
#include <isl/space_type.h>
#include <isl/aff_type.h>
#include <isl/set_type.h>
#include <isl/list.h>
#include <isl/val_type.h>
#include <isl/printer.h>

#if defined(__cplusplus)

#endif

struct isl_constraint;
typedef struct isl_constraint isl_constraint;

struct isl_constraint;							
struct  isl_constraint_list;					
typedef struct isl_constraint_list isl_constraint_list;			

isl_ctx *isl_constraint_list_get_ctx( isl_constraint_list *list);	
 isl_constraint_list *isl_constraint_to_list( isl_constraint *el);
 isl_constraint_list *isl_constraint_list_from_constraint(			
	 isl_constraint *el);					
 isl_constraint_list *isl_constraint_list_alloc(isl_ctx *ctx, int n);	
 isl_constraint_list *isl_constraint_list_copy(			
	 isl_constraint_list *list);				
 isl_constraint_list *isl_constraint_list_free(			
	 isl_constraint_list *list);				
 isl_constraint_list *isl_constraint_list_add(			
	 isl_constraint_list *list,				
	 isl_constraint *el);					
 isl_constraint_list *isl_constraint_list_insert(			
	 isl_constraint_list *list, unsigned pos,			
	 isl_constraint *el);					
 isl_constraint_list *isl_constraint_list_drop(			
	 isl_constraint_list *list, unsigned first, unsigned n);	
 isl_constraint_list *isl_constraint_list_clear(			
	 isl_constraint_list *list);				
 isl_constraint_list *isl_constraint_list_swap(			
	 isl_constraint_list *list, unsigned pos1,		
	unsigned pos2);							
 isl_constraint_list *isl_constraint_list_reverse(			
	 isl_constraint_list *list);				
 isl_constraint_list *isl_constraint_list_concat(			
	 isl_constraint_list *list1,				
	 isl_constraint_list *list2);				
isl_size isl_constraint_list_size( isl_constraint_list *list);	
isl_size isl_constraint_list_n_constraint( isl_constraint_list *list);	
 isl_constraint *isl_constraint_list_get_at(				
	 isl_constraint_list *list, int index);			
 isl_constraint *isl_constraint_list_get_constraint(			
	 isl_constraint_list *list, int index);			
 isl_constraint_list *isl_constraint_list_set_at(			
	 isl_constraint_list *list, int index,			
	 isl_constraint *el);					
 isl_constraint_list *isl_constraint_list_set_constraint(		
	 struct isl_constraint_list *list, int index,		
	 struct isl_constraint *el);				
isl_stat isl_constraint_list_foreach( isl_constraint_list *list,	
	isl_stat (*fn)( isl_constraint *el, void *user),		
	void *user);							
isl_bool isl_constraint_list_every( isl_constraint_list *list,	
	isl_bool (*test)( isl_constraint *el, void *user),		
	void *user);							
 isl_constraint_list *isl_constraint_list_map(			
	 isl_constraint_list *list,				
	 isl_constraint * (*fn)( isl_constraint *el,		
		void *user),						
	void *user);							
 isl_constraint_list *isl_constraint_list_sort(			
	 isl_constraint_list *list,				
	int (*cmp)( struct isl_constraint *a,			
		 struct isl_constraint *b,				
		void *user), void *user);				
isl_stat isl_constraint_list_foreach_scc( isl_constraint_list *list,	
	isl_bool (*follows)( isl_constraint *a,			
			 isl_constraint *b, void *user),		
	void *follows_user,						
	isl_stat (*fn)( isl_constraint_list *scc, void *user),	
	void *fn_user);							
 char *isl_constraint_list_to_str(				
	 isl_constraint_list *list);				
 isl_printer *isl_printer_print_constraint_list(			
	 isl_printer *p,  isl_constraint_list *list);	
void isl_constraint_list_dump( isl_constraint_list *list);  


isl_ctx *isl_constraint_get_ctx( isl_constraint *c);

 isl_constraint *isl_constraint_alloc_equality(
	 isl_local_space *ls);
 isl_constraint *isl_constraint_alloc_inequality(
	 isl_local_space *ls);
 isl_constraint *isl_equality_alloc( isl_local_space *ls);
 isl_constraint *isl_inequality_alloc( isl_local_space *ls);

 isl_constraint *isl_constraint_copy( isl_constraint *c);
 isl_constraint *isl_constraint_free( isl_constraint *c);

isl_size isl_basic_map_n_constraint( isl_basic_map *bmap);
isl_size isl_basic_set_n_constraint( isl_basic_set *bset);
isl_stat isl_basic_map_foreach_constraint( isl_basic_map *bmap,
	isl_stat (*fn)( isl_constraint *c, void *user), void *user);
isl_stat isl_basic_set_foreach_constraint( isl_basic_set *bset,
	isl_stat (*fn)( isl_constraint *c, void *user), void *user);
 isl_constraint_list *isl_basic_map_get_constraint_list(
	 isl_basic_map *bmap);
 isl_constraint_list *isl_basic_set_get_constraint_list(
	 isl_basic_set *bset);
int isl_constraint_is_equal( isl_constraint *constraint1,
			     isl_constraint *constraint2);

isl_stat isl_basic_set_foreach_bound_pair( isl_basic_set *bset,
	enum isl_dim_type type, unsigned pos,
	isl_stat (*fn)( isl_constraint *lower,
		   isl_constraint *upper,
		   isl_basic_set *bset, void *user), void *user);

 isl_basic_map *isl_basic_map_add_constraint(
	 isl_basic_map *bmap,  isl_constraint *constraint);
 isl_basic_set *isl_basic_set_add_constraint(
	 isl_basic_set *bset,  isl_constraint *constraint);
 isl_map *isl_map_add_constraint( isl_map *map,
	 isl_constraint *constraint);
 isl_set *isl_set_add_constraint( isl_set *set,
	 isl_constraint *constraint);

isl_bool isl_basic_map_has_defining_equality(
	 isl_basic_map *bmap, enum isl_dim_type type, int pos,
	 isl_constraint **c);
isl_bool isl_basic_set_has_defining_equality(
	struct isl_basic_set *bset, enum isl_dim_type type, int pos,
	struct isl_constraint **constraint);
isl_bool isl_basic_set_has_defining_inequalities(
	struct isl_basic_set *bset, enum isl_dim_type type, int pos,
	struct isl_constraint **lower,
	struct isl_constraint **upper);

 isl_space *isl_constraint_get_space(
	 isl_constraint *constraint);
 isl_local_space *isl_constraint_get_local_space(
	 isl_constraint *constraint);
isl_size isl_constraint_dim( isl_constraint *constraint,
	enum isl_dim_type type);

isl_bool isl_constraint_involves_dims( isl_constraint *constraint,
	enum isl_dim_type type, unsigned first, unsigned n);

const char *isl_constraint_get_dim_name( isl_constraint *constraint,
	enum isl_dim_type type, unsigned pos);
 isl_val *isl_constraint_get_constant_val(
	 isl_constraint *constraint);
 isl_val *isl_constraint_get_coefficient_val(
	 isl_constraint *constraint, enum isl_dim_type type, int pos);
 isl_constraint *isl_constraint_set_constant_si(
	 isl_constraint *constraint, int v);
 isl_constraint *isl_constraint_set_constant_val(
	 isl_constraint *constraint,  isl_val *v);
 isl_constraint *isl_constraint_set_coefficient_si(
	 isl_constraint *constraint,
	enum isl_dim_type type, int pos, int v);
 isl_constraint *isl_constraint_set_coefficient_val(
	 isl_constraint *constraint,
	enum isl_dim_type type, int pos,  isl_val *v);

 isl_aff *isl_constraint_get_div( isl_constraint *constraint,
	int pos);

 isl_constraint *isl_constraint_negate(
	 isl_constraint *constraint);

isl_bool isl_constraint_is_equality( isl_constraint *constraint);
isl_bool isl_constraint_is_div_constraint(
	 isl_constraint *constraint);

isl_bool isl_constraint_is_lower_bound( isl_constraint *constraint,
	enum isl_dim_type type, unsigned pos);
isl_bool isl_constraint_is_upper_bound( isl_constraint *constraint,
	enum isl_dim_type type, unsigned pos);

 isl_basic_map *isl_basic_map_from_constraint(
	 isl_constraint *constraint);
 isl_basic_set *isl_basic_set_from_constraint(
	 isl_constraint *constraint);

 isl_aff *isl_constraint_get_bound(
	 isl_constraint *constraint, enum isl_dim_type type, int pos);
 isl_aff *isl_constraint_get_aff(
	 isl_constraint *constraint);
 isl_constraint *isl_equality_from_aff( isl_aff *aff);
 isl_constraint *isl_inequality_from_aff( isl_aff *aff);

int isl_constraint_plain_cmp( isl_constraint *c1,
	 isl_constraint *c2);
int isl_constraint_cmp_last_non_zero( isl_constraint *c1,
	 isl_constraint *c2);

 isl_printer *isl_printer_print_constraint( isl_printer *p,
	 isl_constraint *c);
void isl_constraint_dump( isl_constraint *c);


