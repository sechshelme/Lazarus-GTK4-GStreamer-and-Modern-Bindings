/*
 * Copyright 2008-2009 Katholieke Universiteit Leuven
 *
 * Use of this software is governed by the MIT license
 *
 * Written by Sven Verdoolaege, K.U.Leuven, Departement
 * Computerwetenschappen, Celestijnenlaan 200A, B-3001 Leuven, Belgium
 */

#ifndef ISL_ILP_H
#define ISL_ILP_H

#include <isl/aff_type.h>
#include <isl/set_type.h>
#include <isl/union_set_type.h>
#include <isl/val_type.h>
#include <isl/vec.h>

#if defined(__cplusplus)

#endif

 isl_val *isl_basic_set_max_val( isl_basic_set *bset,
	 isl_aff *obj);
extern
 isl_val *isl_set_min_val( isl_set *set,
	 isl_aff *obj);
extern
 isl_val *isl_set_max_val( isl_set *set,
	 isl_aff *obj);
 isl_multi_val *isl_union_set_min_multi_union_pw_aff(
	 isl_union_set *uset,  isl_multi_union_pw_aff *obj);

extern
 isl_val *isl_pw_aff_min_val( isl_pw_aff *pa);
extern
 isl_val *isl_pw_aff_max_val( isl_pw_aff *pa);
extern
 isl_multi_val *isl_pw_multi_aff_min_multi_val(
	 isl_pw_multi_aff *pma);
extern
 isl_multi_val *isl_pw_multi_aff_max_multi_val(
	 isl_pw_multi_aff *pma);
extern
 isl_multi_val *isl_multi_pw_aff_min_multi_val(
	 isl_multi_pw_aff *mpa);
extern
 isl_multi_val *isl_multi_pw_aff_max_multi_val(
	 isl_multi_pw_aff *mpa);

 isl_val *isl_union_pw_aff_min_val( isl_union_pw_aff *upa);
 isl_val *isl_union_pw_aff_max_val( isl_union_pw_aff *upa);

 isl_multi_val *isl_multi_union_pw_aff_min_multi_val(
	 isl_multi_union_pw_aff *mupa);
 isl_multi_val *isl_multi_union_pw_aff_max_multi_val(
	 isl_multi_union_pw_aff *mupa);

extern
 isl_val *isl_basic_set_dim_max_val( isl_basic_set *bset,
	int pos);
extern
 isl_val *isl_set_dim_min_val( isl_set *set, int pos);
extern
 isl_val *isl_set_dim_max_val( isl_set *set, int pos);


#endif
