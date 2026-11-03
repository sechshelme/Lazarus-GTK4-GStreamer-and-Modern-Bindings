/*
 * Copyright 2008-2009 Katholieke Universiteit Leuven
 *
 * Use of this software is governed by the MIT license
 *
 * Written by Sven Verdoolaege, K.U.Leuven, Departement
 * Computerwetenschappen, Celestijnenlaan 200A, B-3001 Leuven, Belgium
 */

#ifndef ISL_VEC_H
#define ISL_VEC_H

#include <stdio.h>

#include <isl/ctx.h>
#include <isl/val_type.h>
#include <isl/printer.h>

#if defined(__cplusplus)

#endif

struct isl_vec;
typedef struct isl_vec isl_vec;

 isl_vec *isl_vec_alloc(isl_ctx *ctx, unsigned size);
 isl_vec *isl_vec_zero(isl_ctx *ctx, unsigned size);
 isl_vec *isl_vec_copy( isl_vec *vec);
 isl_vec *isl_vec_free( isl_vec *vec);

isl_ctx *isl_vec_get_ctx( isl_vec *vec);

isl_size isl_vec_size( isl_vec *vec);
 isl_val *isl_vec_get_element_val( isl_vec *vec, int pos);
 isl_vec *isl_vec_set_element_si( isl_vec *vec,
	int pos, int v);
 isl_vec *isl_vec_set_element_val( isl_vec *vec,
	int pos,  isl_val *v);

isl_bool isl_vec_is_equal( isl_vec *vec1,  isl_vec *vec2);
int isl_vec_cmp_element( isl_vec *vec1,  isl_vec *vec2,
	int pos);

void isl_vec_dump( isl_vec *vec);
 isl_printer *isl_printer_print_vec( isl_printer *printer,
	 isl_vec *vec);

 isl_vec *isl_vec_ceil( isl_vec *vec);
 isl_vec *isl_vec_normalize( isl_vec *vec);
 isl_vec *isl_vec_set_si( isl_vec *vec, int v);
 isl_vec *isl_vec_set_val( isl_vec *vec,
	 isl_val *v);
 isl_vec *isl_vec_clr( isl_vec *vec);
 isl_vec *isl_vec_neg( isl_vec *vec);
 isl_vec *isl_vec_add( isl_vec *vec1,
	 isl_vec *vec2);
 isl_vec *isl_vec_extend( isl_vec *vec, unsigned size);
 isl_vec *isl_vec_zero_extend( isl_vec *vec, unsigned size);
 isl_vec *isl_vec_concat( isl_vec *vec1,
	 isl_vec *vec2);

 isl_vec *isl_vec_sort( isl_vec *vec);

 isl_vec *isl_vec_read_from_file(isl_ctx *ctx, FILE *input);

 isl_vec *isl_vec_drop_els( isl_vec *vec,
	unsigned pos, unsigned n);
 isl_vec *isl_vec_add_els( isl_vec *vec, unsigned n);
 isl_vec *isl_vec_insert_els( isl_vec *vec,
	unsigned pos, unsigned n);
 isl_vec *isl_vec_insert_zero_els( isl_vec *vec,
	unsigned pos, unsigned n);
 isl_vec *isl_vec_move_els( isl_vec *vec,
	unsigned dst_col, unsigned src_col, unsigned n);

#if defined(__cplusplus)
}
#endif

#endif
