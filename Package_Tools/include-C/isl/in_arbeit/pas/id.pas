unit id;

interface

uses
  fp_isl, id_type, ctx, printer_type, space_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function isl_id_list_get_ctx(list: Pisl_id_list): Pisl_ctx; cdecl; external libisl;
function isl_id_to_list(el: Pisl_id): Pisl_id_list; cdecl; external libisl;
function isl_id_list_from_id(el: Pisl_id): Pisl_id_list; cdecl; external libisl;
function isl_id_list_alloc(ctx: Pisl_ctx; n: longint): Pisl_id_list; cdecl; external libisl;
function isl_id_list_copy(list: Pisl_id_list): Pisl_id_list; cdecl; external libisl;
function isl_id_list_free(list: Pisl_id_list): Pisl_id_list; cdecl; external libisl;
function isl_id_list_add(list: Pisl_id_list; el: Pisl_id): Pisl_id_list; cdecl; external libisl;
function isl_id_list_insert(list: Pisl_id_list; pos: dword; el: Pisl_id): Pisl_id_list; cdecl; external libisl;
function isl_id_list_drop(list: Pisl_id_list; first: dword; n: dword): Pisl_id_list; cdecl; external libisl;
function isl_id_list_clear(list: Pisl_id_list): Pisl_id_list; cdecl; external libisl;
function isl_id_list_swap(list: Pisl_id_list; pos1: dword; pos2: dword): Pisl_id_list; cdecl; external libisl;
function isl_id_list_reverse(list: Pisl_id_list): Pisl_id_list; cdecl; external libisl;
function isl_id_list_concat(list1: Pisl_id_list; list2: Pisl_id_list): Pisl_id_list; cdecl; external libisl;
function isl_id_list_size(list: Pisl_id_list): Tisl_size; cdecl; external libisl;
function isl_id_list_n_id(list: Pisl_id_list): Tisl_size; cdecl; external libisl;
function isl_id_list_get_at(list: Pisl_id_list; index: longint): Pisl_id; cdecl; external libisl;
function isl_id_list_get_id(list: Pisl_id_list; index: longint): Pisl_id; cdecl; external libisl;
function isl_id_list_set_at(list: Pisl_id_list; index: longint; el: Pisl_id): Pisl_id_list; cdecl; external libisl;
function isl_id_list_set_id(list: Pisl_id_list; index: longint; el: Pisl_id): Pisl_id_list; cdecl; external libisl;

type
  Tis_list_func1 = function(el: Pisl_id; user: pointer): Tisl_stat; cdecl;
  Tis_list_func2 = function(el: Pisl_id; user: pointer): Tisl_bool; cdecl;
  Tis_list_func3 = function(el: Pisl_id; user: pointer): Pisl_id; cdecl;
  Tis_list_func4 = function(a: Pisl_id; b: Pisl_id; user: pointer): longint; cdecl;
  Tis_list_func5 = function(a: Pisl_id; b: Pisl_id; user: pointer): Tisl_bool; cdecl;
  Tis_list_func6 = function(scc: Pisl_id_list; user: pointer): Tisl_stat; cdecl;
  Tis_list_func7 = procedure(user: pointer); cdecl;

function isl_id_list_foreach(list: Pisl_id_list; fn: Tis_list_func1; user: pointer): Tisl_stat; cdecl; external libisl;
function isl_id_list_every(list: Pisl_id_list; test: Tis_list_func2; user: pointer): Tisl_bool; cdecl; external libisl;
function isl_id_list_map(list: Pisl_id_list; fn: Tis_list_func3; user: pointer): Pisl_id_list; cdecl; external libisl;
function isl_id_list_sort(list: Pisl_id_list; cmp: Tis_list_func4; user: pointer): Pisl_id_list; cdecl; external libisl;
function isl_id_list_foreach_scc(list: Pisl_id_list; follows: Tis_list_func5; follows_user: pointer; fn: Tis_list_func6; fn_user: pointer): Tisl_stat; cdecl; external libisl;
function isl_id_list_to_str(list: Pisl_id_list): Pchar; cdecl; external libisl;
function isl_printer_print_id_list(p: Pisl_printer; list: Pisl_id_list): Pisl_printer; cdecl; external libisl;
procedure isl_id_list_dump(list: Pisl_id_list); cdecl; external libisl;
function isl_id_list_read_from_str(ctx: Pisl_ctx; str: Pchar): Pisl_id_list; cdecl; external libisl;
function isl_multi_id_get_ctx(multi: Pisl_multi_id): Pisl_ctx; cdecl; external libisl;
function isl_multi_id_get_space(multi: Pisl_multi_id): Pisl_space; cdecl; external libisl;
function isl_multi_id_get_domain_space(multi: Pisl_multi_id): Pisl_space; cdecl; external libisl;
function isl_multi_id_get_list(multi: Pisl_multi_id): Pisl_id_list; cdecl; external libisl;
function isl_multi_id_from_id_list(space: Pisl_space; list: Pisl_id_list): Pisl_multi_id; cdecl; external libisl;
function isl_space_multi_id(space: Pisl_space; list: Pisl_id_list): Pisl_multi_id; cdecl; external libisl;
function isl_multi_id_copy(multi: Pisl_multi_id): Pisl_multi_id; cdecl; external libisl;
function isl_multi_id_free(multi: Pisl_multi_id): Pisl_multi_id; cdecl; external libisl;
function isl_multi_id_plain_is_equal(multi1: Pisl_multi_id; multi2: Pisl_multi_id): Tisl_bool; cdecl; external libisl;
function isl_multi_id_reset_user(multi: Pisl_multi_id): Pisl_multi_id; cdecl; external libisl;
function isl_multi_id_size(multi: Pisl_multi_id): Tisl_size; cdecl; external libisl;
function isl_multi_id_get_at(multi: Pisl_multi_id; pos: longint): Pisl_id; cdecl; external libisl;
function isl_multi_id_get_id(multi: Pisl_multi_id; pos: longint): Pisl_id; cdecl; external libisl;
function isl_multi_id_set_at(multi: Pisl_multi_id; pos: longint; el: Pisl_id): Pisl_multi_id; cdecl; external libisl;
function isl_multi_id_set_id(multi: Pisl_multi_id; pos: longint; el: Pisl_id): Pisl_multi_id; cdecl; external libisl;
function isl_multi_id_range_splice(multi1: Pisl_multi_id; pos: dword; multi2: Pisl_multi_id): Pisl_multi_id; cdecl; external libisl;
function isl_multi_id_flatten_range(multi: Pisl_multi_id): Pisl_multi_id; cdecl; external libisl;
function isl_multi_id_flat_range_product(multi1: Pisl_multi_id; multi2: Pisl_multi_id): Pisl_multi_id; cdecl; external libisl;
function isl_multi_id_range_product(multi1: Pisl_multi_id; multi2: Pisl_multi_id): Pisl_multi_id; cdecl; external libisl;
function isl_multi_id_factor_range(multi: Pisl_multi_id): Pisl_multi_id; cdecl; external libisl;
function isl_multi_id_range_is_wrapping(multi: Pisl_multi_id): Tisl_bool; cdecl; external libisl;
function isl_multi_id_range_factor_domain(multi: Pisl_multi_id): Pisl_multi_id; cdecl; external libisl;
function isl_multi_id_range_factor_range(multi: Pisl_multi_id): Pisl_multi_id; cdecl; external libisl;
function isl_multi_id_align_params(multi: Pisl_multi_id; model: Pisl_space): Pisl_multi_id; cdecl; external libisl;
function isl_multi_id_from_range(multi: Pisl_multi_id): Pisl_multi_id; cdecl; external libisl;
function isl_id_get_ctx(id: Pisl_id): Pisl_ctx; cdecl; external libisl;
function isl_id_get_hash(id: Pisl_id): Tuint32_t; cdecl; external libisl;
function isl_id_alloc(ctx: Pisl_ctx; name: Pchar; user: pointer): Pisl_id; cdecl; external libisl;
function isl_id_copy(id: Pisl_id): Pisl_id; cdecl; external libisl;
function isl_id_free(id: Pisl_id): Pisl_id; cdecl; external libisl;
function isl_id_get_user(id: Pisl_id): pointer; cdecl; external libisl;
function isl_id_get_name(id: Pisl_id): Pchar; cdecl; external libisl;
function isl_id_set_free_user(id: Pisl_id; free_user: Tis_list_func7): Pisl_id; cdecl; external libisl;
function isl_id_get_free_user(id: Pisl_id): Tis_list_func7; cdecl; external libisl;
function isl_id_read_from_str(ctx: Pisl_ctx; str: Pchar): Pisl_id; cdecl; external libisl;
function isl_id_to_str(id: Pisl_id): Pchar; cdecl; external libisl;
function isl_printer_print_id(p: Pisl_printer; id: Pisl_id): Pisl_printer; cdecl; external libisl;
procedure isl_id_dump(id: Pisl_id); cdecl; external libisl;
function isl_multi_id_read_from_str(ctx: Pisl_ctx; str: Pchar): Pisl_multi_id; cdecl; external libisl;
function isl_printer_print_multi_id(p: Pisl_printer; mi: Pisl_multi_id): Pisl_printer; cdecl; external libisl;
procedure isl_multi_id_dump(mi: Pisl_multi_id); cdecl; external libisl;
function isl_multi_id_to_str(mi: Pisl_multi_id): Pchar; cdecl; external libisl;

// === Konventiert am: 5-11-26 15:28:44 ===


implementation



end.
