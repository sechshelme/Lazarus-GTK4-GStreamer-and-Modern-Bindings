unit val;

interface

uses
  fp_isl, ctx, val_type, space_type, id_type, printer_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function isl_multi_val_get_ctx(multi: Pisl_multi_val): Pisl_ctx; cdecl; external libisl;
function isl_multi_val_get_space(multi: Pisl_multi_val): Pisl_space; cdecl; external libisl;
function isl_multi_val_get_domain_space(multi: Pisl_multi_val): Pisl_space; cdecl; external libisl;
function isl_multi_val_get_list(multi: Pisl_multi_val): Pisl_val_list; cdecl; external libisl;
function isl_multi_val_from_val_list(space: Pisl_space; list: Pisl_val_list): Pisl_multi_val; cdecl; external libisl;
function isl_space_multi_val(space: Pisl_space; list: Pisl_val_list): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_copy(multi: Pisl_multi_val): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_free(multi: Pisl_multi_val): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_plain_is_equal(multi1: Pisl_multi_val; multi2: Pisl_multi_val): Tisl_bool; cdecl; external libisl;
function isl_multi_val_reset_user(multi: Pisl_multi_val): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_size(multi: Pisl_multi_val): Tisl_size; cdecl; external libisl;
function isl_multi_val_get_at(multi: Pisl_multi_val; pos: longint): Pisl_val; cdecl; external libisl;
function isl_multi_val_get_val(multi: Pisl_multi_val; pos: longint): Pisl_val; cdecl; external libisl;
function isl_multi_val_set_at(multi: Pisl_multi_val; pos: longint; el: Pisl_val): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_set_val(multi: Pisl_multi_val; pos: longint; el: Pisl_val): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_range_splice(multi1: Pisl_multi_val; pos: dword; multi2: Pisl_multi_val): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_flatten_range(multi: Pisl_multi_val): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_flat_range_product(multi1: Pisl_multi_val; multi2: Pisl_multi_val): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_range_product(multi1: Pisl_multi_val; multi2: Pisl_multi_val): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_factor_range(multi: Pisl_multi_val): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_range_is_wrapping(multi: Pisl_multi_val): Tisl_bool; cdecl; external libisl;
function isl_multi_val_range_factor_domain(multi: Pisl_multi_val): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_range_factor_range(multi: Pisl_multi_val): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_align_params(multi: Pisl_multi_val; model: Pisl_space): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_from_range(multi: Pisl_multi_val): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_scale_val(multi: Pisl_multi_val; v: Pisl_val): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_scale_down_val(multi: Pisl_multi_val; v: Pisl_val): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_scale_multi_val(multi: Pisl_multi_val; mv: Pisl_multi_val): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_scale_down_multi_val(multi: Pisl_multi_val; mv: Pisl_multi_val): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_mod_multi_val(multi: Pisl_multi_val; mv: Pisl_multi_val): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_add(multi1: Pisl_multi_val; multi2: Pisl_multi_val): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_sub(multi1: Pisl_multi_val; multi2: Pisl_multi_val): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_neg(multi: Pisl_multi_val): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_min(multi1: Pisl_multi_val; multi2: Pisl_multi_val): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_max(multi1: Pisl_multi_val; multi2: Pisl_multi_val): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_zero(space: Pisl_space): Pisl_multi_val; cdecl; external libisl;
function isl_space_zero_multi_val(space: Pisl_space): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_involves_nan(multi: Pisl_multi_val): Tisl_bool; cdecl; external libisl;
function isl_multi_val_dim(multi: Pisl_multi_val; _type: Tisl_dim_type): Tisl_size; cdecl; external libisl;
function isl_multi_val_drop_dims(multi: Pisl_multi_val; _type: Tisl_dim_type; first: dword; n: dword): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_involves_dims(multi: Pisl_multi_val; _type: Tisl_dim_type; first: dword; n: dword): Tisl_bool; cdecl; external libisl;
function isl_multi_val_insert_dims(multi: Pisl_multi_val; _type: Tisl_dim_type; first: dword; n: dword): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_add_dims(multi: Pisl_multi_val; _type: Tisl_dim_type; n: dword): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_project_domain_on_params(multi: Pisl_multi_val): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_find_dim_by_name(multi: Pisl_multi_val; _type: Tisl_dim_type; name: Pchar): longint; cdecl; external libisl;
function isl_multi_val_find_dim_by_id(multi: Pisl_multi_val; _type: Tisl_dim_type; id: Pisl_id): longint; cdecl; external libisl;
function isl_multi_val_get_dim_id(multi: Pisl_multi_val; _type: Tisl_dim_type; pos: dword): Pisl_id; cdecl; external libisl;
function isl_multi_val_set_dim_name(multi: Pisl_multi_val; _type: Tisl_dim_type; pos: dword; s: Pchar): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_set_dim_id(multi: Pisl_multi_val; _type: Tisl_dim_type; pos: dword; id: Pisl_id): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_get_tuple_name(multi: Pisl_multi_val; _type: Tisl_dim_type): Pchar; cdecl; external libisl;
function isl_multi_val_has_range_tuple_id(multi: Pisl_multi_val): Tisl_bool; cdecl; external libisl;
function isl_multi_val_has_tuple_id(multi: Pisl_multi_val; _type: Tisl_dim_type): Tisl_bool; cdecl; external libisl;
function isl_multi_val_get_range_tuple_id(multi: Pisl_multi_val): Pisl_id; cdecl; external libisl;
function isl_multi_val_get_tuple_id(multi: Pisl_multi_val; _type: Tisl_dim_type): Pisl_id; cdecl; external libisl;
function isl_multi_val_set_tuple_name(multi: Pisl_multi_val; _type: Tisl_dim_type; s: Pchar): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_set_range_tuple_id(multi: Pisl_multi_val; id: Pisl_id): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_set_tuple_id(multi: Pisl_multi_val; _type: Tisl_dim_type; id: Pisl_id): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_reset_range_tuple_id(multi: Pisl_multi_val): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_reset_tuple_id(multi: Pisl_multi_val; _type: Tisl_dim_type): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_product(multi1: Pisl_multi_val; multi2: Pisl_multi_val): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_splice(multi1: Pisl_multi_val; in_pos: dword; out_pos: dword; multi2: Pisl_multi_val): Pisl_multi_val; cdecl; external libisl;
function isl_val_zero(ctx: Pisl_ctx): Pisl_val; cdecl; external libisl;
function isl_val_one(ctx: Pisl_ctx): Pisl_val; cdecl; external libisl;
function isl_val_negone(ctx: Pisl_ctx): Pisl_val; cdecl; external libisl;
function isl_val_nan(ctx: Pisl_ctx): Pisl_val; cdecl; external libisl;
function isl_val_infty(ctx: Pisl_ctx): Pisl_val; cdecl; external libisl;
function isl_val_neginfty(ctx: Pisl_ctx): Pisl_val; cdecl; external libisl;
function isl_val_int_from_si(ctx: Pisl_ctx; i: longint): Pisl_val; cdecl; external libisl;
function isl_val_int_from_ui(ctx: Pisl_ctx; u: dword): Pisl_val; cdecl; external libisl;
function isl_val_int_from_chunks(ctx: Pisl_ctx; n: Tsize_t; size: Tsize_t; chunks: pointer): Pisl_val; cdecl; external libisl;
function isl_val_copy(v: Pisl_val): Pisl_val; cdecl; external libisl;
function isl_val_free(v: Pisl_val): Pisl_val; cdecl; external libisl;
function isl_val_get_ctx(val: Pisl_val): Pisl_ctx; cdecl; external libisl;
function isl_val_get_hash(val: Pisl_val): Tuint32_t; cdecl; external libisl;
function isl_val_get_num_si(v: Pisl_val): longint; cdecl; external libisl;
function isl_val_get_den_si(v: Pisl_val): longint; cdecl; external libisl;
function isl_val_get_den_val(v: Pisl_val): Pisl_val; cdecl; external libisl;
function isl_val_get_d(v: Pisl_val): double; cdecl; external libisl;
function isl_val_n_abs_num_chunks(v: Pisl_val; size: Tsize_t): Tisl_size; cdecl; external libisl;
function isl_val_get_abs_num_chunks(v: Pisl_val; size: Tsize_t; chunks: pointer): Tisl_stat; cdecl; external libisl;
function isl_val_set_si(v: Pisl_val; i: longint): Pisl_val; cdecl; external libisl;
function isl_val_abs(v: Pisl_val): Pisl_val; cdecl; external libisl;
function isl_val_neg(v: Pisl_val): Pisl_val; cdecl; external libisl;
function isl_val_inv(v: Pisl_val): Pisl_val; cdecl; external libisl;
function isl_val_floor(v: Pisl_val): Pisl_val; cdecl; external libisl;
function isl_val_ceil(v: Pisl_val): Pisl_val; cdecl; external libisl;
function isl_val_trunc(v: Pisl_val): Pisl_val; cdecl; external libisl;
function isl_val_2exp(v: Pisl_val): Pisl_val; cdecl; external libisl;
function isl_val_pow2(v: Pisl_val): Pisl_val; cdecl; external libisl;
function isl_val_min(v1: Pisl_val; v2: Pisl_val): Pisl_val; cdecl; external libisl;
function isl_val_max(v1: Pisl_val; v2: Pisl_val): Pisl_val; cdecl; external libisl;
function isl_val_add(v1: Pisl_val; v2: Pisl_val): Pisl_val; cdecl; external libisl;
function isl_val_add_ui(v1: Pisl_val; v2: dword): Pisl_val; cdecl; external libisl;
function isl_val_sub(v1: Pisl_val; v2: Pisl_val): Pisl_val; cdecl; external libisl;
function isl_val_sub_ui(v1: Pisl_val; v2: dword): Pisl_val; cdecl; external libisl;
function isl_val_mul(v1: Pisl_val; v2: Pisl_val): Pisl_val; cdecl; external libisl;
function isl_val_mul_ui(v1: Pisl_val; v2: dword): Pisl_val; cdecl; external libisl;
function isl_val_div(v1: Pisl_val; v2: Pisl_val): Pisl_val; cdecl; external libisl;
function isl_val_div_ui(v1: Pisl_val; v2: dword): Pisl_val; cdecl; external libisl;
function isl_val_mod(v1: Pisl_val; v2: Pisl_val): Pisl_val; cdecl; external libisl;
function isl_val_gcd(v1: Pisl_val; v2: Pisl_val): Pisl_val; cdecl; external libisl;
function isl_val_gcdext(v1: Pisl_val; v2: Pisl_val; x: PPisl_val; y: PPisl_val): Pisl_val; cdecl; external libisl;
function isl_val_sgn(v: Pisl_val): longint; cdecl; external libisl;
function isl_val_is_zero(v: Pisl_val): Tisl_bool; cdecl; external libisl;
function isl_val_is_one(v: Pisl_val): Tisl_bool; cdecl; external libisl;
function isl_val_is_negone(v: Pisl_val): Tisl_bool; cdecl; external libisl;
function isl_val_is_nonneg(v: Pisl_val): Tisl_bool; cdecl; external libisl;
function isl_val_is_nonpos(v: Pisl_val): Tisl_bool; cdecl; external libisl;
function isl_val_is_pos(v: Pisl_val): Tisl_bool; cdecl; external libisl;
function isl_val_is_neg(v: Pisl_val): Tisl_bool; cdecl; external libisl;
function isl_val_is_int(v: Pisl_val): Tisl_bool; cdecl; external libisl;
function isl_val_is_rat(v: Pisl_val): Tisl_bool; cdecl; external libisl;
function isl_val_is_nan(v: Pisl_val): Tisl_bool; cdecl; external libisl;
function isl_val_is_infty(v: Pisl_val): Tisl_bool; cdecl; external libisl;
function isl_val_is_neginfty(v: Pisl_val): Tisl_bool; cdecl; external libisl;
function isl_val_cmp_si(v: Pisl_val; i: longint): longint; cdecl; external libisl;
function isl_val_lt(v1: Pisl_val; v2: Pisl_val): Tisl_bool; cdecl; external libisl;
function isl_val_le(v1: Pisl_val; v2: Pisl_val): Tisl_bool; cdecl; external libisl;
function isl_val_gt(v1: Pisl_val; v2: Pisl_val): Tisl_bool; cdecl; external libisl;
function isl_val_gt_si(v: Pisl_val; i: longint): Tisl_bool; cdecl; external libisl;
function isl_val_ge(v1: Pisl_val; v2: Pisl_val): Tisl_bool; cdecl; external libisl;
function isl_val_eq(v1: Pisl_val; v2: Pisl_val): Tisl_bool; cdecl; external libisl;
function isl_val_eq_si(v: Pisl_val; i: longint): Tisl_bool; cdecl; external libisl;
function isl_val_ne(v1: Pisl_val; v2: Pisl_val): Tisl_bool; cdecl; external libisl;
function isl_val_abs_eq(v1: Pisl_val; v2: Pisl_val): Tisl_bool; cdecl; external libisl;
function isl_val_is_divisible_by(v1: Pisl_val; v2: Pisl_val): Tisl_bool; cdecl; external libisl;
function isl_val_read_from_str(ctx: Pisl_ctx; str: Pchar): Pisl_val; cdecl; external libisl;
function isl_printer_print_val(p: Pisl_printer; v: Pisl_val): Pisl_printer; cdecl; external libisl;
procedure isl_val_dump(v: Pisl_val); cdecl; external libisl;
function isl_val_to_str(v: Pisl_val): Pchar; cdecl; external libisl;
function isl_multi_val_is_zero(mv: Pisl_multi_val): Tisl_bool; cdecl; external libisl;
function isl_multi_val_add_val(mv: Pisl_multi_val; v: Pisl_val): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_mod_val(mv: Pisl_multi_val; v: Pisl_val): Pisl_multi_val; cdecl; external libisl;
function isl_multi_val_read_from_str(ctx: Pisl_ctx; str: Pchar): Pisl_multi_val; cdecl; external libisl;
function isl_printer_print_multi_val(p: Pisl_printer; mv: Pisl_multi_val): Pisl_printer; cdecl; external libisl;
procedure isl_multi_val_dump(mv: Pisl_multi_val); cdecl; external libisl;
function isl_multi_val_to_str(mv: Pisl_multi_val): Pchar; cdecl; external libisl;
function isl_val_list_get_ctx(list: Pisl_val_list): Pisl_ctx; cdecl; external libisl;
function isl_val_to_list(el: Pisl_val): Pisl_val_list; cdecl; external libisl;
function isl_val_list_from_val(el: Pisl_val): Pisl_val_list; cdecl; external libisl;
function isl_val_list_alloc(ctx: Pisl_ctx; n: longint): Pisl_val_list; cdecl; external libisl;
function isl_val_list_copy(list: Pisl_val_list): Pisl_val_list; cdecl; external libisl;
function isl_val_list_free(list: Pisl_val_list): Pisl_val_list; cdecl; external libisl;
function isl_val_list_add(list: Pisl_val_list; el: Pisl_val): Pisl_val_list; cdecl; external libisl;
function isl_val_list_insert(list: Pisl_val_list; pos: dword; el: Pisl_val): Pisl_val_list; cdecl; external libisl;
function isl_val_list_drop(list: Pisl_val_list; first: dword; n: dword): Pisl_val_list; cdecl; external libisl;
function isl_val_list_clear(list: Pisl_val_list): Pisl_val_list; cdecl; external libisl;
function isl_val_list_swap(list: Pisl_val_list; pos1: dword; pos2: dword): Pisl_val_list; cdecl; external libisl;
function isl_val_list_reverse(list: Pisl_val_list): Pisl_val_list; cdecl; external libisl;
function isl_val_list_concat(list1: Pisl_val_list; list2: Pisl_val_list): Pisl_val_list; cdecl; external libisl;
function isl_val_list_size(list: Pisl_val_list): Tisl_size; cdecl; external libisl;
function isl_val_list_n_val(list: Pisl_val_list): Tisl_size; cdecl; external libisl;
function isl_val_list_get_at(list: Pisl_val_list; index: longint): Pisl_val; cdecl; external libisl;
function isl_val_list_get_val(list: Pisl_val_list; index: longint): Pisl_val; cdecl; external libisl;
function isl_val_list_set_at(list: Pisl_val_list; index: longint; el: Pisl_val): Pisl_val_list; cdecl; external libisl;
function isl_val_list_set_val(list: Pisl_val_list; index: longint; el: Pisl_val): Pisl_val_list; cdecl; external libisl;

type
  Tisl_val_list_func1 = function(el: Pisl_val; user: pointer): Tisl_stat; cdecl;
  Tisl_val_list_func2 = function(el: Pisl_val; user: pointer): Tisl_bool; cdecl;
  Tisl_val_list_func3 = function(el: Pisl_val; user: pointer): Pisl_val; cdecl;
  Tisl_val_list_func4 = function(a: Pisl_val; b: Pisl_val; user: pointer): longint; cdecl;
  Tisl_val_list_func5 = function(a: Pisl_val; b: Pisl_val; user: pointer): Tisl_bool; cdecl;
  Tisl_val_list_func6 = function(scc: Pisl_val_list; user: pointer): Tisl_stat; cdecl;

function isl_val_list_foreach(list: Pisl_val_list; fn: Tisl_val_list_func1; user: pointer): Tisl_stat; cdecl; external libisl;
function isl_val_list_every(list: Pisl_val_list; test: Tisl_val_list_func2; user: pointer): Tisl_bool; cdecl; external libisl;
function isl_val_list_map(list: Pisl_val_list; fn: Tisl_val_list_func3; user: pointer): Pisl_val_list; cdecl; external libisl;
function isl_val_list_sort(list: Pisl_val_list; cmp: Tisl_val_list_func4; user: pointer): Pisl_val_list; cdecl; external libisl;
function isl_val_list_foreach_scc(list: Pisl_val_list; follows: Tisl_val_list_func5; follows_user: pointer; fn: Tisl_val_list_func6; fn_user: pointer): Tisl_stat; cdecl; external libisl;
function isl_val_list_to_str(list: Pisl_val_list): Pchar; cdecl; external libisl;
function isl_printer_print_val_list(p: Pisl_printer; list: Pisl_val_list): Pisl_printer; cdecl; external libisl;
procedure isl_val_list_dump(list: Pisl_val_list); cdecl; external libisl;
function isl_val_list_read_from_str(ctx: Pisl_ctx; str: Pchar): Pisl_val_list; cdecl; external libisl;

// === Konventiert am: 5-11-26 16:53:17 ===


implementation



end.
