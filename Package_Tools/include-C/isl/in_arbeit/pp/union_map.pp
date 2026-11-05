
unit union_map;
interface

{
  Automatically converted by H2Pas 1.0.0 from union_map.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    union_map
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PFILE  = ^FILE;
Pisl_basic_map  = ^isl_basic_map;
Pisl_bool  = ^isl_bool;
Pisl_ctx  = ^isl_ctx;
Pisl_id  = ^isl_id;
Pisl_id_list  = ^isl_id_list;
Pisl_map  = ^isl_map;
Pisl_map_list  = ^isl_map_list;
Pisl_multi_aff  = ^isl_multi_aff;
Pisl_multi_id  = ^isl_multi_id;
Pisl_multi_pw_aff  = ^isl_multi_pw_aff;
Pisl_multi_union_pw_aff  = ^isl_multi_union_pw_aff;
Pisl_printer  = ^isl_printer;
Pisl_pw_multi_aff  = ^isl_pw_multi_aff;
Pisl_set  = ^isl_set;
Pisl_space  = ^isl_space;
Pisl_union_map  = ^isl_union_map;
Pisl_union_map_list  = ^isl_union_map_list;
Pisl_union_pw_multi_aff  = ^isl_union_pw_multi_aff;
Pisl_union_set  = ^isl_union_set;
Pisl_val  = ^isl_val;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ISL_UNION_MAP_H}
{$define ISL_UNION_MAP_H}
{$include <isl/stdint.h>}
{$include <isl/space_type.h>}
{$include <isl/aff_type.h>}
{$include <isl/map_type.h>}
{$include <isl/union_map_type.h>}
{$include <isl/printer.h>}
{$include <isl/val_type.h>}
{$if defined(__cplusplus)}
{$endif}

function isl_union_map_dim(umap:Pisl_union_map; _type:Tisl_dim_type):Tisl_size;cdecl;external;
function isl_union_map_involves_dims(umap:Pisl_union_map; _type:Tisl_dim_type; first:dword; n:dword):Tisl_bool;cdecl;external;
function isl_union_map_get_dim_id(umap:Pisl_union_map; _type:Tisl_dim_type; pos:dword):Pisl_id;cdecl;external;
function isl_union_map_from_basic_map(bmap:Pisl_basic_map):Pisl_union_map;cdecl;external;
function isl_map_to_union_map(map:Pisl_map):Pisl_union_map;cdecl;external;
function isl_union_map_from_map(map:Pisl_map):Pisl_union_map;cdecl;external;
function isl_union_map_empty_ctx(ctx:Pisl_ctx):Pisl_union_map;cdecl;external;
function isl_union_map_empty_space(space:Pisl_space):Pisl_union_map;cdecl;external;
function isl_union_map_empty(space:Pisl_space):Pisl_union_map;cdecl;external;
function isl_union_map_copy(umap:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_free(umap:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_get_ctx(umap:Pisl_union_map):Pisl_ctx;cdecl;external;
function isl_union_map_get_space(umap:Pisl_union_map):Pisl_space;cdecl;external;
function isl_union_map_reset_user(umap:Pisl_union_map):Pisl_union_map;cdecl;external;
(* Const before type ignored *)
function isl_union_map_find_dim_by_name(umap:Pisl_union_map; _type:Tisl_dim_type; name:Pchar):longint;cdecl;external;
function isl_union_map_universe(umap:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_params(umap:Pisl_union_map):Pisl_set;cdecl;external;
function isl_union_map_domain(umap:Pisl_union_map):Pisl_union_set;cdecl;external;
function isl_union_map_range(umap:Pisl_union_map):Pisl_union_set;cdecl;external;
function isl_union_map_domain_map(umap:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_domain_map_union_pw_multi_aff(umap:Pisl_union_map):Pisl_union_pw_multi_aff;cdecl;external;
function isl_union_map_range_map(umap:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_set_wrapped_domain_map(uset:Pisl_union_set):Pisl_union_map;cdecl;external;
function isl_union_map_from_domain(uset:Pisl_union_set):Pisl_union_map;cdecl;external;
function isl_union_map_from_range(uset:Pisl_union_set):Pisl_union_map;cdecl;external;
function isl_union_map_affine_hull(umap:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_polyhedral_hull(umap:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_remove_redundancies(umap:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_simple_hull(umap:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_coalesce(umap:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_compute_divs(umap:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_lexmin(umap:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_lexmax(umap:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_add_map(umap:Pisl_union_map; map:Pisl_map):Pisl_union_map;cdecl;external;
function isl_union_map_union(umap1:Pisl_union_map; umap2:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_subtract(umap1:Pisl_union_map; umap2:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_intersect(umap1:Pisl_union_map; umap2:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_intersect_params(umap:Pisl_union_map; set:Pisl_set):Pisl_union_map;cdecl;external;
function isl_union_map_product(umap1:Pisl_union_map; umap2:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_domain_product(umap1:Pisl_union_map; umap2:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_flat_domain_product(umap1:Pisl_union_map; umap2:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_range_product(umap1:Pisl_union_map; umap2:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_flat_range_product(umap1:Pisl_union_map; umap2:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_domain_factor_domain(umap:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_domain_factor_range(umap:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_range_factor_domain(umap:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_range_factor_range(umap:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_factor_domain(umap:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_factor_range(umap:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_gist(umap:Pisl_union_map; context:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_gist_params(umap:Pisl_union_map; set:Pisl_set):Pisl_union_map;cdecl;external;
function isl_union_map_gist_domain(umap:Pisl_union_map; uset:Pisl_union_set):Pisl_union_map;cdecl;external;
function isl_union_map_gist_range(umap:Pisl_union_map; uset:Pisl_union_set):Pisl_union_map;cdecl;external;
function isl_union_map_intersect_domain_union_set(umap:Pisl_union_map; uset:Pisl_union_set):Pisl_union_map;cdecl;external;
function isl_union_map_intersect_domain_space(umap:Pisl_union_map; space:Pisl_space):Pisl_union_map;cdecl;external;
function isl_union_map_intersect_domain(umap:Pisl_union_map; uset:Pisl_union_set):Pisl_union_map;cdecl;external;
function isl_union_map_intersect_range_union_set(umap:Pisl_union_map; uset:Pisl_union_set):Pisl_union_map;cdecl;external;
function isl_union_map_intersect_range_space(umap:Pisl_union_map; space:Pisl_space):Pisl_union_map;cdecl;external;
function isl_union_map_intersect_range(umap:Pisl_union_map; uset:Pisl_union_set):Pisl_union_map;cdecl;external;
function isl_union_map_intersect_domain_factor_domain(umap:Pisl_union_map; factor:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_intersect_domain_factor_range(umap:Pisl_union_map; factor:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_intersect_range_factor_domain(umap:Pisl_union_map; factor:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_intersect_range_factor_range(umap:Pisl_union_map; factor:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_intersect_domain_wrapped_domain_union_set(umap:Pisl_union_map; domain:Pisl_union_set):Pisl_union_map;cdecl;external;
function isl_union_map_intersect_range_wrapped_domain_union_set(umap:Pisl_union_map; domain:Pisl_union_set):Pisl_union_map;cdecl;external;
function isl_union_map_subtract_domain(umap:Pisl_union_map; dom:Pisl_union_set):Pisl_union_map;cdecl;external;
function isl_union_map_subtract_range(umap:Pisl_union_map; dom:Pisl_union_set):Pisl_union_map;cdecl;external;
function isl_union_map_apply_domain(umap1:Pisl_union_map; umap2:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_apply_range(umap1:Pisl_union_map; umap2:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_preimage_domain_multi_aff(umap:Pisl_union_map; ma:Pisl_multi_aff):Pisl_union_map;cdecl;external;
function isl_union_map_preimage_range_multi_aff(umap:Pisl_union_map; ma:Pisl_multi_aff):Pisl_union_map;cdecl;external;
function isl_union_map_preimage_domain_pw_multi_aff(umap:Pisl_union_map; pma:Pisl_pw_multi_aff):Pisl_union_map;cdecl;external;
function isl_union_map_preimage_range_pw_multi_aff(umap:Pisl_union_map; pma:Pisl_pw_multi_aff):Pisl_union_map;cdecl;external;
function isl_union_map_preimage_domain_multi_pw_aff(umap:Pisl_union_map; mpa:Pisl_multi_pw_aff):Pisl_union_map;cdecl;external;
function isl_union_map_preimage_domain_union_pw_multi_aff(umap:Pisl_union_map; upma:Pisl_union_pw_multi_aff):Pisl_union_map;cdecl;external;
function isl_union_map_preimage_range_union_pw_multi_aff(umap:Pisl_union_map; upma:Pisl_union_pw_multi_aff):Pisl_union_map;cdecl;external;
function isl_union_map_reverse(umap:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_domain_reverse(umap:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_range_reverse(umap:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_from_domain_and_range(domain:Pisl_union_set; range:Pisl_union_set):Pisl_union_map;cdecl;external;
function isl_union_map_detect_equalities(umap:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_deltas(umap:Pisl_union_map):Pisl_union_set;cdecl;external;
function isl_union_map_deltas_map(umap:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_set_identity(uset:Pisl_union_set):Pisl_union_map;cdecl;external;
function isl_union_map_project_out_param_id(umap:Pisl_union_map; id:Pisl_id):Pisl_union_map;cdecl;external;
function isl_union_map_project_out_param_id_list(umap:Pisl_union_map; list:Pisl_id_list):Pisl_union_map;cdecl;external;
function isl_union_map_project_out(umap:Pisl_union_map; _type:Tisl_dim_type; first:dword; n:dword):Pisl_union_map;cdecl;external;
function isl_union_map_project_out_all_params(umap:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_drop_unused_params(umap:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_remove_divs(bmap:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_bind_range(umap:Pisl_union_map; tuple:Pisl_multi_id):Pisl_union_set;cdecl;external;
function isl_union_map_plain_is_empty(umap:Pisl_union_map):Tisl_bool;cdecl;external;
function isl_union_map_is_empty(umap:Pisl_union_map):Tisl_bool;cdecl;external;
function isl_union_map_is_single_valued(umap:Pisl_union_map):Tisl_bool;cdecl;external;
function isl_union_map_plain_is_injective(umap:Pisl_union_map):Tisl_bool;cdecl;external;
function isl_union_map_is_injective(umap:Pisl_union_map):Tisl_bool;cdecl;external;
function isl_union_map_is_bijective(umap:Pisl_union_map):Tisl_bool;cdecl;external;
function isl_union_map_is_identity(umap:Pisl_union_map):Tisl_bool;cdecl;external;
function isl_union_map_is_subset(umap1:Pisl_union_map; umap2:Pisl_union_map):Tisl_bool;cdecl;external;
function isl_union_map_is_equal(umap1:Pisl_union_map; umap2:Pisl_union_map):Tisl_bool;cdecl;external;
function isl_union_map_is_disjoint(umap1:Pisl_union_map; umap2:Pisl_union_map):Tisl_bool;cdecl;external;
function isl_union_map_is_strict_subset(umap1:Pisl_union_map; umap2:Pisl_union_map):Tisl_bool;cdecl;external;
function isl_union_map_get_hash(umap:Pisl_union_map):Tuint32_t;cdecl;external;
function isl_union_map_n_map(umap:Pisl_union_map):Tisl_size;cdecl;external;
function isl_union_map_foreach_map(umap:Pisl_union_map; fn:function (map:Pisl_map; user:pointer):Tisl_stat; user:pointer):Tisl_stat;cdecl;external;
function isl_union_map_get_map_list(umap:Pisl_union_map):Pisl_map_list;cdecl;external;
function isl_union_map_every_map(umap:Pisl_union_map; test:function (map:Pisl_map; user:pointer):Tisl_bool; user:pointer):Tisl_bool;cdecl;external;
function isl_union_map_remove_map_if(umap:Pisl_union_map; fn:function (map:Pisl_map; user:pointer):Tisl_bool; user:pointer):Pisl_union_map;cdecl;external;
function isl_union_map_contains(umap:Pisl_union_map; space:Pisl_space):Tisl_bool;cdecl;external;
function isl_union_map_extract_map(umap:Pisl_union_map; space:Pisl_space):Pisl_map;cdecl;external;
function isl_union_map_isa_map(umap:Pisl_union_map):Tisl_bool;cdecl;external;
function isl_union_map_as_map(umap:Pisl_union_map):Pisl_map;cdecl;external;
function isl_map_from_union_map(umap:Pisl_union_map):Pisl_map;cdecl;external;
function isl_union_map_sample(umap:Pisl_union_map):Pisl_basic_map;cdecl;external;
function isl_union_map_fixed_power_val(umap:Pisl_union_map; exp:Pisl_val):Pisl_union_map;cdecl;external;
function isl_union_map_power(umap:Pisl_union_map; exact:Pisl_bool):Pisl_union_map;cdecl;external;
function isl_union_map_transitive_closure(umap:Pisl_union_map; exact:Pisl_bool):Pisl_union_map;cdecl;external;
function isl_union_map_lex_lt_union_map(umap1:Pisl_union_map; umap2:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_lex_le_union_map(umap1:Pisl_union_map; umap2:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_lex_gt_union_map(umap1:Pisl_union_map; umap2:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_lex_ge_union_map(umap1:Pisl_union_map; umap2:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_eq_at_multi_union_pw_aff(umap:Pisl_union_map; mupa:Pisl_multi_union_pw_aff):Pisl_union_map;cdecl;external;
function isl_union_map_lex_le_at_multi_union_pw_aff(umap:Pisl_union_map; mupa:Pisl_multi_union_pw_aff):Pisl_union_map;cdecl;external;
function isl_union_map_lex_lt_at_multi_union_pw_aff(umap:Pisl_union_map; mupa:Pisl_multi_union_pw_aff):Pisl_union_map;cdecl;external;
function isl_union_map_lex_ge_at_multi_union_pw_aff(umap:Pisl_union_map; mupa:Pisl_multi_union_pw_aff):Pisl_union_map;cdecl;external;
function isl_union_map_lex_gt_at_multi_union_pw_aff(umap:Pisl_union_map; mupa:Pisl_multi_union_pw_aff):Pisl_union_map;cdecl;external;
function isl_union_map_read_from_file(ctx:Pisl_ctx; input:PFILE):Pisl_union_map;cdecl;external;
(* Const before type ignored *)
function isl_union_map_read_from_str(ctx:Pisl_ctx; str:Pchar):Pisl_union_map;cdecl;external;
function isl_union_map_to_str(umap:Pisl_union_map):Pchar;cdecl;external;
function isl_printer_print_union_map(p:Pisl_printer; umap:Pisl_union_map):Pisl_printer;cdecl;external;
procedure isl_union_map_dump(umap:Pisl_union_map);cdecl;external;
function isl_union_map_wrap(umap:Pisl_union_map):Pisl_union_set;cdecl;external;
function isl_union_set_unwrap(uset:Pisl_union_set):Pisl_union_map;cdecl;external;
function isl_union_map_zip(umap:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_curry(umap:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_range_curry(umap:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_uncurry(umap:Pisl_union_map):Pisl_union_map;cdecl;external;
function isl_union_map_align_params(umap:Pisl_union_map; model:Pisl_space):Pisl_union_map;cdecl;external;
function isl_union_set_align_params(uset:Pisl_union_set; model:Pisl_space):Pisl_union_set;cdecl;external;
function isl_union_map_list_get_ctx(list:Pisl_union_map_list):Pisl_ctx;cdecl;external;
function isl_union_map_to_list(el:Pisl_union_map):Pisl_union_map_list;cdecl;external;
function isl_union_map_list_from_union_map(el:Pisl_union_map):Pisl_union_map_list;cdecl;external;
function isl_union_map_list_alloc(ctx:Pisl_ctx; n:longint):Pisl_union_map_list;cdecl;external;
function isl_union_map_list_copy(list:Pisl_union_map_list):Pisl_union_map_list;cdecl;external;
function isl_union_map_list_free(list:Pisl_union_map_list):Pisl_union_map_list;cdecl;external;
function isl_union_map_list_add(list:Pisl_union_map_list; el:Pisl_union_map):Pisl_union_map_list;cdecl;external;
function isl_union_map_list_insert(list:Pisl_union_map_list; pos:dword; el:Pisl_union_map):Pisl_union_map_list;cdecl;external;
function isl_union_map_list_drop(list:Pisl_union_map_list; first:dword; n:dword):Pisl_union_map_list;cdecl;external;
function isl_union_map_list_clear(list:Pisl_union_map_list):Pisl_union_map_list;cdecl;external;
function isl_union_map_list_swap(list:Pisl_union_map_list; pos1:dword; pos2:dword):Pisl_union_map_list;cdecl;external;
function isl_union_map_list_reverse(list:Pisl_union_map_list):Pisl_union_map_list;cdecl;external;
function isl_union_map_list_concat(list1:Pisl_union_map_list; list2:Pisl_union_map_list):Pisl_union_map_list;cdecl;external;
function isl_union_map_list_size(list:Pisl_union_map_list):Tisl_size;cdecl;external;
function isl_union_map_list_n_union_map(list:Pisl_union_map_list):Tisl_size;cdecl;external;
function isl_union_map_list_get_at(list:Pisl_union_map_list; index:longint):Pisl_union_map;cdecl;external;
function isl_union_map_list_get_union_map(list:Pisl_union_map_list; index:longint):Pisl_union_map;cdecl;external;
function isl_union_map_list_set_at(list:Pisl_union_map_list; index:longint; el:Pisl_union_map):Pisl_union_map_list;cdecl;external;
function isl_union_map_list_set_union_map(list:Pisl_union_map_list; index:longint; el:Pisl_union_map):Pisl_union_map_list;cdecl;external;
function isl_union_map_list_foreach(list:Pisl_union_map_list; fn:function (el:Pisl_union_map; user:pointer):Tisl_stat; user:pointer):Tisl_stat;cdecl;external;
function isl_union_map_list_every(list:Pisl_union_map_list; test:function (el:Pisl_union_map; user:pointer):Tisl_bool; user:pointer):Tisl_bool;cdecl;external;
function isl_union_map_list_map(list:Pisl_union_map_list; fn:function (el:Pisl_union_map; user:pointer):Pisl_union_map; user:pointer):Pisl_union_map_list;cdecl;external;
function isl_union_map_list_sort(list:Pisl_union_map_list; cmp:function (a:Pisl_union_map; b:Pisl_union_map; user:pointer):longint; user:pointer):Pisl_union_map_list;cdecl;external;
function isl_union_map_list_foreach_scc(list:Pisl_union_map_list; follows:function (a:Pisl_union_map; b:Pisl_union_map; user:pointer):Tisl_bool; follows_user:pointer; fn:function (scc:Pisl_union_map_list; user:pointer):Tisl_stat; fn_user:pointer):Tisl_stat;cdecl;external;
function isl_union_map_list_to_str(list:Pisl_union_map_list):Pchar;cdecl;external;
function isl_printer_print_union_map_list(p:Pisl_printer; list:Pisl_union_map_list):Pisl_printer;cdecl;external;
procedure isl_union_map_list_dump(list:Pisl_union_map_list);cdecl;external;
{$endif}

implementation


end.
