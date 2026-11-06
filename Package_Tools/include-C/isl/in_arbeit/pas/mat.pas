unit mat;

interface

uses
  fp_isl, ctx, val_type, vec;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pisl_mat = type Pointer;
  PPisl_mat = ^Pisl_mat;

function isl_mat_get_ctx(mat: Pisl_mat): Pisl_ctx; cdecl; external libisl;
function isl_mat_alloc(ctx: Pisl_ctx; n_row: dword; n_col: dword): Pisl_mat; cdecl; external libisl;
function isl_mat_extend(mat: Pisl_mat; n_row: dword; n_col: dword): Pisl_mat; cdecl; external libisl;
function isl_mat_identity(ctx: Pisl_ctx; n_row: dword): Pisl_mat; cdecl; external libisl;
function isl_mat_copy(mat: Pisl_mat): Pisl_mat; cdecl; external libisl;
function isl_mat_free(mat: Pisl_mat): Pisl_mat; cdecl; external libisl;
function isl_mat_rows(mat: Pisl_mat): Tisl_size; cdecl; external libisl;
function isl_mat_cols(mat: Pisl_mat): Tisl_size; cdecl; external libisl;
function isl_mat_get_element_val(mat: Pisl_mat; row: longint; col: longint): Pisl_val; cdecl; external libisl;
function isl_mat_set_element_si(mat: Pisl_mat; row: longint; col: longint; v: longint): Pisl_mat; cdecl; external libisl;
function isl_mat_set_element_val(mat: Pisl_mat; row: longint; col: longint; v: Pisl_val): Pisl_mat; cdecl; external libisl;
function isl_mat_swap_cols(mat: Pisl_mat; i: dword; j: dword): Pisl_mat; cdecl; external libisl;
function isl_mat_swap_rows(mat: Pisl_mat; i: dword; j: dword): Pisl_mat; cdecl; external libisl;
function isl_mat_vec_product(mat: Pisl_mat; vec: Pisl_vec): Pisl_vec; cdecl; external libisl;
function isl_vec_mat_product(vec: Pisl_vec; mat: Pisl_mat): Pisl_vec; cdecl; external libisl;
function isl_mat_vec_inverse_product(mat: Pisl_mat; vec: Pisl_vec): Pisl_vec; cdecl; external libisl;
function isl_mat_aff_direct_sum(left: Pisl_mat; right: Pisl_mat): Pisl_mat; cdecl; external libisl;
function isl_mat_diagonal(mat1: Pisl_mat; mat2: Pisl_mat): Pisl_mat; cdecl; external libisl;
function isl_mat_left_hermite(M: Pisl_mat; neg: longint; U: PPisl_mat; Q: PPisl_mat): Pisl_mat; cdecl; external libisl;
function isl_mat_lin_to_aff(mat: Pisl_mat): Pisl_mat; cdecl; external libisl;
function isl_mat_inverse_product(left: Pisl_mat; right: Pisl_mat): Pisl_mat; cdecl; external libisl;
function isl_mat_product(left: Pisl_mat; right: Pisl_mat): Pisl_mat; cdecl; external libisl;
function isl_mat_transpose(mat: Pisl_mat): Pisl_mat; cdecl; external libisl;
function isl_mat_right_inverse(mat: Pisl_mat): Pisl_mat; cdecl; external libisl;
function isl_mat_right_kernel(mat: Pisl_mat): Pisl_mat; cdecl; external libisl;
function isl_mat_normalize(mat: Pisl_mat): Pisl_mat; cdecl; external libisl;
function isl_mat_normalize_row(mat: Pisl_mat; row: longint): Pisl_mat; cdecl; external libisl;
function isl_mat_drop_cols(mat: Pisl_mat; col: dword; n: dword): Pisl_mat; cdecl; external libisl;
function isl_mat_drop_rows(mat: Pisl_mat; row: dword; n: dword): Pisl_mat; cdecl; external libisl;
function isl_mat_insert_cols(mat: Pisl_mat; col: dword; n: dword): Pisl_mat; cdecl; external libisl;
function isl_mat_insert_rows(mat: Pisl_mat; row: dword; n: dword): Pisl_mat; cdecl; external libisl;
function isl_mat_move_cols(mat: Pisl_mat; dst_col: dword; src_col: dword; n: dword): Pisl_mat; cdecl; external libisl;
function isl_mat_add_rows(mat: Pisl_mat; n: dword): Pisl_mat; cdecl; external libisl;
function isl_mat_insert_zero_cols(mat: Pisl_mat; first: dword; n: dword): Pisl_mat; cdecl; external libisl;
function isl_mat_add_zero_cols(mat: Pisl_mat; n: dword): Pisl_mat; cdecl; external libisl;
function isl_mat_insert_zero_rows(mat: Pisl_mat; row: dword; n: dword): Pisl_mat; cdecl; external libisl;
function isl_mat_add_zero_rows(mat: Pisl_mat; n: dword): Pisl_mat; cdecl; external libisl;
procedure isl_mat_col_add(mat: Pisl_mat; dst_col: longint; src_col: longint); cdecl; external libisl;
function isl_mat_unimodular_complete(M: Pisl_mat; row: longint): Pisl_mat; cdecl; external libisl;
function isl_mat_row_basis(mat: Pisl_mat): Pisl_mat; cdecl; external libisl;
function isl_mat_row_basis_extension(mat1: Pisl_mat; mat2: Pisl_mat): Pisl_mat; cdecl; external libisl;
function isl_mat_from_row_vec(vec: Pisl_vec): Pisl_mat; cdecl; external libisl;
function isl_mat_concat(top: Pisl_mat; bot: Pisl_mat): Pisl_mat; cdecl; external libisl;
function isl_mat_vec_concat(top: Pisl_mat; bot: Pisl_vec): Pisl_mat; cdecl; external libisl;
function isl_mat_is_equal(mat1: Pisl_mat; mat2: Pisl_mat): Tisl_bool; cdecl; external libisl;
function isl_mat_has_linearly_independent_rows(mat1: Pisl_mat; mat2: Pisl_mat): Tisl_bool; cdecl; external libisl;
function isl_mat_rank(mat: Pisl_mat): Tisl_size; cdecl; external libisl;
function isl_mat_initial_non_zero_cols(mat: Pisl_mat): longint; cdecl; external libisl;
procedure isl_mat_print_internal(mat: Pisl_mat; out_: PFILE; indent: longint); cdecl; external libisl;
procedure isl_mat_dump(mat: Pisl_mat); cdecl; external libisl;

// === Konventiert am: 5-11-26 15:43:10 ===


implementation



end.
