/*
 * Copyright 2008-2009 Katholieke Universiteit Leuven
 *
 * Use of this software is governed by the MIT license
 *
 * Written by Sven Verdoolaege, K.U.Leuven, Departement
 * Computerwetenschappen, Celestijnenlaan 200A, B-3001 Leuven, Belgium
 */

#ifndef ISL_MAT_H
#define ISL_MAT_H

#include <stdio.h>

#include <isl/ctx.h>
#include <isl/vec.h>
#include <isl/val_type.h>

#if defined(__cplusplus)

#endif

struct isl_mat;
typedef struct isl_mat	isl_mat;

isl_ctx *isl_mat_get_ctx( isl_mat *mat);

 isl_mat *isl_mat_alloc(isl_ctx *ctx,
	unsigned n_row, unsigned n_col);
 isl_mat *isl_mat_extend( isl_mat *mat,
	unsigned n_row, unsigned n_col);
 isl_mat *isl_mat_identity(isl_ctx *ctx, unsigned n_row);
 isl_mat *isl_mat_copy( isl_mat *mat);
 isl_mat *isl_mat_free( isl_mat *mat);

isl_size isl_mat_rows( isl_mat *mat);
isl_size isl_mat_cols( isl_mat *mat);
 isl_val *isl_mat_get_element_val( isl_mat *mat,
	int row, int col);
 isl_mat *isl_mat_set_element_si( isl_mat *mat,
	int row, int col, int v);
 isl_mat *isl_mat_set_element_val( isl_mat *mat,
	int row, int col,  isl_val *v);

 isl_mat *isl_mat_swap_cols( isl_mat *mat,
	unsigned i, unsigned j);
 isl_mat *isl_mat_swap_rows( isl_mat *mat,
	unsigned i, unsigned j);

 isl_vec *isl_mat_vec_product( isl_mat *mat,
	 isl_vec *vec);
 isl_vec *isl_vec_mat_product( isl_vec *vec,
	 isl_mat *mat);
 isl_vec *isl_mat_vec_inverse_product( isl_mat *mat,
						 isl_vec *vec);
 isl_mat *isl_mat_aff_direct_sum( isl_mat *left,
	 isl_mat *right);
 isl_mat *isl_mat_diagonal( isl_mat *mat1,
	 isl_mat *mat2);
 isl_mat *isl_mat_left_hermite( isl_mat *M, int neg,
	 isl_mat **U,  isl_mat **Q);
 isl_mat *isl_mat_lin_to_aff( isl_mat *mat);
 isl_mat *isl_mat_inverse_product( isl_mat *left,
	 isl_mat *right);
 isl_mat *isl_mat_product( isl_mat *left,
	 isl_mat *right);
 isl_mat *isl_mat_transpose( isl_mat *mat);
 isl_mat *isl_mat_right_inverse( isl_mat *mat);
 isl_mat *isl_mat_right_kernel( isl_mat *mat);

 isl_mat *isl_mat_normalize( isl_mat *mat);
 isl_mat *isl_mat_normalize_row( isl_mat *mat, int row);

 isl_mat *isl_mat_drop_cols( isl_mat *mat,
	unsigned col, unsigned n);
 isl_mat *isl_mat_drop_rows( isl_mat *mat,
				unsigned row, unsigned n);
 isl_mat *isl_mat_insert_cols( isl_mat *mat,
				unsigned col, unsigned n);
 isl_mat *isl_mat_insert_rows( isl_mat *mat,
				unsigned row, unsigned n);
 isl_mat *isl_mat_move_cols( isl_mat *mat,
	unsigned dst_col, unsigned src_col, unsigned n);
 isl_mat *isl_mat_add_rows( isl_mat *mat, unsigned n);
 isl_mat *isl_mat_insert_zero_cols( isl_mat *mat,
	unsigned first, unsigned n);
 isl_mat *isl_mat_add_zero_cols( isl_mat *mat, unsigned n);
 isl_mat *isl_mat_insert_zero_rows( isl_mat *mat,
	unsigned row, unsigned n);
 isl_mat *isl_mat_add_zero_rows( isl_mat *mat, unsigned n);

void isl_mat_col_add( isl_mat *mat, int dst_col, int src_col);

 isl_mat *isl_mat_unimodular_complete( isl_mat *M, int row);
 isl_mat *isl_mat_row_basis( isl_mat *mat);
 isl_mat *isl_mat_row_basis_extension(
	 isl_mat *mat1,  isl_mat *mat2);

 isl_mat *isl_mat_from_row_vec( isl_vec *vec);
 isl_mat *isl_mat_concat( isl_mat *top,
	 isl_mat *bot);
 isl_mat *isl_mat_vec_concat( isl_mat *top,
	 isl_vec *bot);

isl_bool isl_mat_is_equal( isl_mat *mat1,  isl_mat *mat2);
isl_bool isl_mat_has_linearly_independent_rows( isl_mat *mat1,
	 isl_mat *mat2);

isl_size isl_mat_rank( isl_mat *mat);
int isl_mat_initial_non_zero_cols( isl_mat *mat);

void isl_mat_print_internal( isl_mat *mat, FILE *out, int indent);
void isl_mat_dump( isl_mat *mat);


#endif
