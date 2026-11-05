/*
 * Copyright 2008-2009 Katholieke Universiteit Leuven
 *
 * Use of this software is governed by the MIT license
 *
 * Written by Sven Verdoolaege, K.U.Leuven, Departement
 * Computerwetenschappen, Celestijnenlaan 200A, B-3001 Leuven, Belgium
 */

#ifndef ISL_LIST_H
#define ISL_LIST_H

#include <isl/ctx.h>
#include <isl/printer_type.h>

#if defined(__cplusplus)

#endif

#define ISL_DECLARE_LIST_TYPE2(EL,EXPORT)				\
struct isl_##EL;							\
struct EXPORT isl_##EL##_list;						\
typedef struct isl_##EL##_list isl_##EL##_list;
#define ISL_DECLARE_LIST_TYPE(EL)					\
	ISL_DECLARE_LIST_TYPE2(EL,)
#define ISL_DECLARE_EXPORTED_LIST_TYPE(EL)				\
	ISL_DECLARE_LIST_TYPE2(EL,extern)
#define ISL_DECLARE_LIST_FN3(EL,,EXPORT)			\
isl_ctx *isl_##EL##_list_get_ctx( isl_##EL##_list *list);	\

 isl_##EL##_list *isl_##EL##_to_list( isl_##EL *el);\
								\
 isl_##EL##_list *isl_##EL##_list_from_##EL(			\
	 isl_##EL *el);					\
								\
 isl_##EL##_list *isl_##EL##_list_alloc(isl_ctx *ctx, int n);	\
 isl_##EL##_list *isl_##EL##_list_copy(			\
	 isl_##EL##_list *list);				\
 isl_##EL##_list *isl_##EL##_list_free(			\
	 isl_##EL##_list *list);				\

 isl_##EL##_list *isl_##EL##_list_add(			\
	 isl_##EL##_list *list,				\
	 isl_##EL *el);					\

 isl_##EL##_list *isl_##EL##_list_insert(			\
	 isl_##EL##_list *list, unsigned pos,			\
	 isl_##EL *el);					\

 isl_##EL##_list *isl_##EL##_list_drop(			\
	 isl_##EL##_list *list, unsigned first, unsigned n);	\

 isl_##EL##_list *isl_##EL##_list_clear(			\
	 isl_##EL##_list *list);				\
 isl_##EL##_list *isl_##EL##_list_swap(			\
	 isl_##EL##_list *list, unsigned pos1,		\
	unsigned pos2);							\
 isl_##EL##_list *isl_##EL##_list_reverse(			\
	 isl_##EL##_list *list);				\

 isl_##EL##_list *isl_##EL##_list_concat(			\
	 isl_##EL##_list *list1,				\
	 isl_##EL##_list *list2);				\

isl_size isl_##EL##_list_size( isl_##EL##_list *list);	\
isl_size isl_##EL##_list_n_##EL( isl_##EL##_list *list);	\

 isl_##EL *isl_##EL##_list_get_at(				\
	 isl_##EL##_list *list, int index);			\
 isl_##EL *isl_##EL##_list_get_##EL(			\
	 isl_##EL##_list *list, int index);			\

 isl_##EL##_list *isl_##EL##_list_set_at(			\
	 isl_##EL##_list *list, int index,			\
	 isl_##EL *el);					\
 isl_##EL##_list *isl_##EL##_list_set_##EL(		\
	 struct isl_##EL##_list *list, int index,		\
	 struct isl_##EL *el);				\

isl_stat isl_##EL##_list_foreach( isl_##EL##_list *list,	\
	isl_stat (*fn)( isl_##EL *el, void *user),		\
	void *user);							\
isl_bool isl_##EL##_list_every( isl_##EL##_list *list,	\
	isl_bool (*test)( isl_##EL *el, void *user),		\
	void *user);							\
 isl_##EL##_list *isl_##EL##_list_map(			\
	 isl_##EL##_list *list,				\
	 isl_##EL * (*fn)( isl_##EL *el,		\
		void *user),						\
	void *user);							\
 isl_##EL##_list *isl_##EL##_list_sort(			\
	 isl_##EL##_list *list,				\
	int (*cmp)( struct isl_##EL *a,			\
		 struct isl_##EL *b,				\
		void *user), void *user);				\

isl_stat isl_##EL##_list_foreach_scc( isl_##EL##_list *list,	\
	isl_bool (*follows)( isl_##EL *a,			\
			 isl_##EL *b, void *user),		\
	void *follows_user,						\
	isl_stat (*fn)( isl_##EL##_list *scc, void *user),	\
	void *fn_user);							\
 char *isl_##EL##_list_to_str(				\
	 isl_##EL##_list *list);				\
 isl_printer *isl_printer_print_##EL##_list(			\
	 isl_printer *p,  isl_##EL##_list *list);	\
void isl_##EL##_list_dump( isl_##EL##_list *list);
#define ISL_DECLARE_LIST_FN(EL)						\
	ISL_DECLARE_LIST_FN3(EL,,)
#define ISL_DECLARE_EXPORTED_LIST_FN(EL)				\
	ISL_DECLARE_LIST_FN3(EL,,extern)
#define ISL_DECLARE_LIST_FN_READ2(EL,)			\
								\
 isl_##EL##_list *isl_##EL##_list_read_from_str(		\
	isl_ctx *ctx, const char *str);
#define ISL_DECLARE_LIST_FN_READ(EL)					\
	ISL_DECLARE_LIST_FN_READ2(EL,)
#define ISL_DECLARE_EXPORTED_LIST_FN_READ(EL)				\
	ISL_DECLARE_LIST_FN_READ2(EL,)

#define ISL_DECLARE_LIST(EL)						\
	ISL_DECLARE_LIST_TYPE(EL)					\
	ISL_DECLARE_LIST_FN(EL)
#define ISL_DECLARE_EXPORTED_LIST(EL)					\
	ISL_DECLARE_EXPORTED_LIST_TYPE(EL)				\
	ISL_DECLARE_EXPORTED_LIST_FN(EL)

#if defined(__cplusplus)
}
#endif

#endif
