{$IFDEF read_interface}


function isl_union_set_dim(uset: Pisl_union_set; _type: Tisl_dim_type): Tisl_size; cdecl; external libisl;
function isl_union_set_from_basic_set(bset: Pisl_basic_set): Pisl_union_set; cdecl; external libisl;
function isl_set_to_union_set(set_: Pisl_set): Pisl_union_set; cdecl; external libisl;
function isl_union_set_from_set(set_: Pisl_set): Pisl_union_set; cdecl; external libisl;
function isl_union_set_empty_ctx(ctx: Pisl_ctx): Pisl_union_set; cdecl; external libisl;
function isl_union_set_empty_space(space: Pisl_space): Pisl_union_set; cdecl; external libisl;
function isl_union_set_empty(space: Pisl_space): Pisl_union_set; cdecl; external libisl;
function isl_union_set_copy(uset: Pisl_union_set): Pisl_union_set; cdecl; external libisl;
function isl_union_set_free(uset: Pisl_union_set): Pisl_union_set; cdecl; external libisl;
function isl_union_set_get_ctx(uset: Pisl_union_set): Pisl_ctx; cdecl; external libisl;
function isl_union_set_get_space(uset: Pisl_union_set): Pisl_space; cdecl; external libisl;
function isl_union_set_reset_user(uset: Pisl_union_set): Pisl_union_set; cdecl; external libisl;
function isl_union_set_universe(uset: Pisl_union_set): Pisl_union_set; cdecl; external libisl;
function isl_union_set_params(uset: Pisl_union_set): Pisl_set; cdecl; external libisl;
function isl_union_set_detect_equalities(uset: Pisl_union_set): Pisl_union_set; cdecl; external libisl;
function isl_union_set_affine_hull(uset: Pisl_union_set): Pisl_union_set; cdecl; external libisl;
function isl_union_set_polyhedral_hull(uset: Pisl_union_set): Pisl_union_set; cdecl; external libisl;
function isl_union_set_remove_redundancies(uset: Pisl_union_set): Pisl_union_set; cdecl; external libisl;
function isl_union_set_simple_hull(uset: Pisl_union_set): Pisl_union_set; cdecl; external libisl;
function isl_union_set_coalesce(uset: Pisl_union_set): Pisl_union_set; cdecl; external libisl;
function isl_union_set_compute_divs(uset: Pisl_union_set): Pisl_union_set; cdecl; external libisl;
function isl_union_set_lexmin(uset: Pisl_union_set): Pisl_union_set; cdecl; external libisl;
function isl_union_set_lexmax(uset: Pisl_union_set): Pisl_union_set; cdecl; external libisl;
function isl_union_set_add_set(uset: Pisl_union_set; set_: Pisl_set): Pisl_union_set; cdecl; external libisl;
function isl_union_set_union(uset1: Pisl_union_set; uset2: Pisl_union_set): Pisl_union_set; cdecl; external libisl;
function isl_union_set_subtract(uset1: Pisl_union_set; uset2: Pisl_union_set): Pisl_union_set; cdecl; external libisl;
function isl_union_set_intersect(uset1: Pisl_union_set; uset2: Pisl_union_set): Pisl_union_set; cdecl; external libisl;
function isl_union_set_intersect_params(uset: Pisl_union_set; set_: Pisl_set): Pisl_union_set; cdecl; external libisl;
function isl_union_set_product(uset1: Pisl_union_set; uset2: Pisl_union_set): Pisl_union_set; cdecl; external libisl;
function isl_union_set_gist(uset: Pisl_union_set; context: Pisl_union_set): Pisl_union_set; cdecl; external libisl;
function isl_union_set_gist_params(uset: Pisl_union_set; set_: Pisl_set): Pisl_union_set; cdecl; external libisl;
function isl_union_set_apply(uset: Pisl_union_set; umap: Pisl_union_map): Pisl_union_set; cdecl; external libisl;
function isl_union_set_preimage_multi_aff(uset: Pisl_union_set; ma: Pisl_multi_aff): Pisl_union_set; cdecl; external libisl;
function isl_union_set_preimage_pw_multi_aff(uset: Pisl_union_set; pma: Pisl_pw_multi_aff): Pisl_union_set; cdecl; external libisl;
function isl_union_set_preimage_union_pw_multi_aff(uset: Pisl_union_set; upma: Pisl_union_pw_multi_aff): Pisl_union_set; cdecl; external libisl;
function isl_union_set_project_out(uset: Pisl_union_set; _type: Tisl_dim_type; first: dword; n: dword): Pisl_union_set; cdecl; external libisl;
function isl_union_set_project_out_all_params(uset: Pisl_union_set): Pisl_union_set; cdecl; external libisl;
function isl_union_set_drop_unused_params(uset: Pisl_union_set): Pisl_union_set; cdecl; external libisl;
function isl_union_set_remove_divs(bset: Pisl_union_set): Pisl_union_set; cdecl; external libisl;
function isl_union_set_is_params(uset: Pisl_union_set): Tisl_bool; cdecl; external libisl;
function isl_union_set_is_empty(uset: Pisl_union_set): Tisl_bool; cdecl; external libisl;
function isl_union_set_is_subset(uset1: Pisl_union_set; uset2: Pisl_union_set): Tisl_bool; cdecl; external libisl;
function isl_union_set_is_equal(uset1: Pisl_union_set; uset2: Pisl_union_set): Tisl_bool; cdecl; external libisl;
function isl_union_set_is_disjoint(uset1: Pisl_union_set; uset2: Pisl_union_set): Tisl_bool; cdecl; external libisl;
function isl_union_set_is_strict_subset(uset1: Pisl_union_set; uset2: Pisl_union_set): Tisl_bool; cdecl; external libisl;
function isl_union_set_get_hash(uset: Pisl_union_set): Tuint32_t; cdecl; external libisl;
function isl_union_set_n_set(uset: Pisl_union_set): Tisl_size; cdecl; external libisl;

type
  Tisl_union_set_func1 = function(set_: Pisl_set; user: pointer): Tisl_stat; cdecl;
  Tisl_union_set_func2 = function(set_: Pisl_set; user: pointer): Tisl_bool; cdecl;
  Tisl_union_set_func3 = function(pnt: Pisl_point; user: pointer): Tisl_stat; cdecl;

  Tisl_union_set_func4 = function(el: Pisl_union_set; user: pointer): Tisl_stat; cdecl;
  Tisl_union_set_func5 = function(el: Pisl_union_set; user: pointer): Tisl_bool; cdecl;
  Tisl_union_set_func6 = function(el: Pisl_union_set; user: pointer): Pisl_union_set; cdecl;
  Tisl_union_set_func7 = function(a: Pisl_union_set; b: Pisl_union_set; user: pointer): longint; cdecl;
  Tisl_union_set_func8 = function(a: Pisl_union_set; b: Pisl_union_set; user: pointer): Tisl_bool; cdecl;
  Tisl_union_set_func9 = function(scc: Pisl_union_set_list; user: pointer): Tisl_stat; cdecl;

function isl_union_set_foreach_set(uset: Pisl_union_set; fn: Tisl_union_set_func1; user: pointer): Tisl_stat; cdecl; external libisl;
function isl_union_set_every_set(uset: Pisl_union_set; test: Tisl_union_set_func2; user: pointer): Tisl_bool; cdecl; external libisl;
function isl_union_set_get_basic_set_list(uset: Pisl_union_set): Pisl_basic_set_list; cdecl; external libisl;
function isl_union_set_get_set_list(uset: Pisl_union_set): Pisl_set_list; cdecl; external libisl;
function isl_union_set_contains(uset: Pisl_union_set; space: Pisl_space): Tisl_bool; cdecl; external libisl;
function isl_union_set_extract_set(uset: Pisl_union_set; space: Pisl_space): Pisl_set; cdecl; external libisl;
function isl_union_set_isa_set(uset: Pisl_union_set): Tisl_bool; cdecl; external libisl;
function isl_union_set_as_set(uset: Pisl_union_set): Pisl_set; cdecl; external libisl;
function isl_set_from_union_set(uset: Pisl_union_set): Pisl_set; cdecl; external libisl;
function isl_union_set_foreach_point(uset: Pisl_union_set; fn: Tisl_union_set_func3; user: pointer): Tisl_stat; cdecl; external libisl;
function isl_union_set_sample(uset: Pisl_union_set): Pisl_basic_set; cdecl; external libisl;
function isl_union_set_sample_point(uset: Pisl_union_set): Pisl_point; cdecl; external libisl;
function isl_union_set_from_point(pnt: Pisl_point): Pisl_union_set; cdecl; external libisl;
function isl_union_set_lift(uset: Pisl_union_set): Pisl_union_set; cdecl; external libisl;
function isl_union_set_lex_lt_union_set(uset1: Pisl_union_set; uset2: Pisl_union_set): Pisl_union_map; cdecl; external libisl;
function isl_union_set_lex_le_union_set(uset1: Pisl_union_set; uset2: Pisl_union_set): Pisl_union_map; cdecl; external libisl;
function isl_union_set_lex_gt_union_set(uset1: Pisl_union_set; uset2: Pisl_union_set): Pisl_union_map; cdecl; external libisl;
function isl_union_set_lex_ge_union_set(uset1: Pisl_union_set; uset2: Pisl_union_set): Pisl_union_map; cdecl; external libisl;
function isl_union_set_coefficients(bset: Pisl_union_set): Pisl_union_set; cdecl; external libisl;
function isl_union_set_solutions(bset: Pisl_union_set): Pisl_union_set; cdecl; external libisl;
function isl_union_set_read_from_file(ctx: Pisl_ctx; input: PFILE): Pisl_union_set; cdecl; external libisl;
function isl_union_set_read_from_str(ctx: Pisl_ctx; str: Pchar): Pisl_union_set; cdecl; external libisl;
function isl_union_set_to_str(uset: Pisl_union_set): Pchar; cdecl; external libisl;
function isl_printer_print_union_set(p: Pisl_printer; uset: Pisl_union_set): Pisl_printer; cdecl; external libisl;
procedure isl_union_set_dump(uset: Pisl_union_set); cdecl; external libisl;
function isl_union_set_list_get_ctx(list: Pisl_union_set_list): Pisl_ctx; cdecl; external libisl;
function isl_union_set_to_list(el: Pisl_union_set): Pisl_union_set_list; cdecl; external libisl;
function isl_union_set_list_from_union_set(el: Pisl_union_set): Pisl_union_set_list; cdecl; external libisl;
function isl_union_set_list_alloc(ctx: Pisl_ctx; n: longint): Pisl_union_set_list; cdecl; external libisl;
function isl_union_set_list_copy(list: Pisl_union_set_list): Pisl_union_set_list; cdecl; external libisl;
function isl_union_set_list_free(list: Pisl_union_set_list): Pisl_union_set_list; cdecl; external libisl;
function isl_union_set_list_add(list: Pisl_union_set_list; el: Pisl_union_set): Pisl_union_set_list; cdecl; external libisl;
function isl_union_set_list_insert(list: Pisl_union_set_list; pos: dword; el: Pisl_union_set): Pisl_union_set_list; cdecl; external libisl;
function isl_union_set_list_drop(list: Pisl_union_set_list; first: dword; n: dword): Pisl_union_set_list; cdecl; external libisl;
function isl_union_set_list_clear(list: Pisl_union_set_list): Pisl_union_set_list; cdecl; external libisl;
function isl_union_set_list_swap(list: Pisl_union_set_list; pos1: dword; pos2: dword): Pisl_union_set_list; cdecl; external libisl;
function isl_union_set_list_reverse(list: Pisl_union_set_list): Pisl_union_set_list; cdecl; external libisl;
function isl_union_set_list_concat(list1: Pisl_union_set_list; list2: Pisl_union_set_list): Pisl_union_set_list; cdecl; external libisl;
function isl_union_set_list_size(list: Pisl_union_set_list): Tisl_size; cdecl; external libisl;
function isl_union_set_list_n_union_set(list: Pisl_union_set_list): Tisl_size; cdecl; external libisl;
function isl_union_set_list_get_at(list: Pisl_union_set_list; index: longint): Pisl_union_set; cdecl; external libisl;
function isl_union_set_list_get_union_set(list: Pisl_union_set_list; index: longint): Pisl_union_set; cdecl; external libisl;
function isl_union_set_list_set_at(list: Pisl_union_set_list; index: longint; el: Pisl_union_set): Pisl_union_set_list; cdecl; external libisl;
function isl_union_set_list_set_union_set(list: Pisl_union_set_list; index: longint; el: Pisl_union_set): Pisl_union_set_list; cdecl; external libisl;
function isl_union_set_list_foreach(list: Pisl_union_set_list; fn: Tisl_union_set_func4; user: pointer): Tisl_stat; cdecl; external libisl;
function isl_union_set_list_every(list: Pisl_union_set_list; test: Tisl_union_set_func5; user: pointer): Tisl_bool; cdecl; external libisl;
function isl_union_set_list_map(list: Pisl_union_set_list; fn: Tisl_union_set_func6; user: pointer): Pisl_union_set_list; cdecl; external libisl;
function isl_union_set_list_sort(list: Pisl_union_set_list; cmp: Tisl_union_set_func7; user: pointer): Pisl_union_set_list; cdecl; external libisl;
function isl_union_set_list_foreach_scc(list: Pisl_union_set_list; follows: Tisl_union_set_func8; follows_user: pointer; fn: Tisl_union_set_func9; fn_user: pointer): Tisl_stat; cdecl; external libisl;
function isl_union_set_list_to_str(list: Pisl_union_set_list): Pchar; cdecl; external libisl;
function isl_printer_print_union_set_list(p: Pisl_printer; list: Pisl_union_set_list): Pisl_printer; cdecl; external libisl;
procedure isl_union_set_list_dump(list: Pisl_union_set_list); cdecl; external libisl;
function isl_union_set_list_read_from_str(ctx: Pisl_ctx; str: Pchar): Pisl_union_set_list; cdecl; external libisl;
function isl_union_set_list_union(list: Pisl_union_set_list): Pisl_union_set; cdecl; external libisl;

// === Konventiert am: 5-11-26 16:53:20 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
