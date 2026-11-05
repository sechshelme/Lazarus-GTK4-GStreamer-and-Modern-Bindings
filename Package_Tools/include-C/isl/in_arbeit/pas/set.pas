unit set;

interface

uses
  fp_isl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2008-2009 Katholieke Universiteit Leuven
 *
 * Use of this software is governed by the MIT license
 *
 * Written by Sven Verdoolaege, K.U.Leuven, Departement
 * Computerwetenschappen, Celestijnenlaan 200A, B-3001 Leuven, Belgium
  }
{$ifndef ISL_SET_H}
{$define ISL_SET_H}
{$include <isl/id_type.h>}
{$include <isl/map_type.h>}
{$include <isl/aff_type.h>}
{$include <isl/list.h>}
{$include <isl/mat.h>}
{$include <isl/point.h>}
{$include <isl/local_space.h>}
{$include <isl/val_type.h>}
{$include <isl/stdint.h>}
{$include <isl/stride_info.h>}
{$include <isl/fixed_box.h>}
{$if defined(__cplusplus)}
{$endif}

function isl_basic_set_n_dim(bset:Pisl_basic_set):Tisl_size;cdecl;external libisl;
function isl_basic_set_n_param(bset:Pisl_basic_set):Tisl_size;cdecl;external libisl;
function isl_basic_set_total_dim(bset:Pisl_basic_set):Tisl_size;cdecl;external libisl;
function isl_basic_set_dim(bset:Pisl_basic_set; _type:Tisl_dim_type):Tisl_size;cdecl;external libisl;
function isl_set_n_dim(set:Pisl_set):Tisl_size;cdecl;external libisl;
function isl_set_n_param(set:Pisl_set):Tisl_size;cdecl;external libisl;
function isl_set_tuple_dim(set:Pisl_set):Tisl_size;cdecl;external libisl;
function isl_set_dim(set:Pisl_set; _type:Tisl_dim_type):Tisl_size;cdecl;external libisl;
function isl_basic_set_get_ctx(bset:Pisl_basic_set):Pisl_ctx;cdecl;external libisl;
function isl_set_get_ctx(set:Pisl_set):Pisl_ctx;cdecl;external libisl;
function isl_basic_set_get_space(bset:Pisl_basic_set):Pisl_space;cdecl;external libisl;
function isl_set_get_space(set:Pisl_set):Pisl_space;cdecl;external libisl;
function isl_set_reset_space(set:Pisl_set; space:Pisl_space):Pisl_set;cdecl;external libisl;
function isl_basic_set_get_div(bset:Pisl_basic_set; pos:longint):Pisl_aff;cdecl;external libisl;
function isl_basic_set_get_local_space(bset:Pisl_basic_set):Pisl_local_space;cdecl;external libisl;
function isl_basic_set_get_tuple_name(bset:Pisl_basic_set):Pchar;cdecl;external libisl;
function isl_set_has_tuple_name(set:Pisl_set):Tisl_bool;cdecl;external libisl;
function isl_set_get_tuple_name(set:Pisl_set):Pchar;cdecl;external libisl;
function isl_basic_set_set_tuple_name(set:Pisl_basic_set; s:Pchar):Pisl_basic_set;cdecl;external libisl;
function isl_set_set_tuple_name(set:Pisl_set; s:Pchar):Pisl_set;cdecl;external libisl;
function isl_basic_set_get_dim_name(bset:Pisl_basic_set; _type:Tisl_dim_type; pos:dword):Pchar;cdecl;external libisl;
function isl_basic_set_set_dim_name(bset:Pisl_basic_set; _type:Tisl_dim_type; pos:dword; s:Pchar):Pisl_basic_set;cdecl;external libisl;
function isl_set_has_dim_name(set:Pisl_set; _type:Tisl_dim_type; pos:dword):Tisl_bool;cdecl;external libisl;
function isl_set_get_dim_name(set:Pisl_set; _type:Tisl_dim_type; pos:dword):Pchar;cdecl;external libisl;
function isl_set_set_dim_name(set:Pisl_set; _type:Tisl_dim_type; pos:dword; s:Pchar):Pisl_set;cdecl;external libisl;
function isl_basic_set_get_dim_id(bset:Pisl_basic_set; _type:Tisl_dim_type; pos:dword):Pisl_id;cdecl;external libisl;
function isl_basic_set_set_tuple_id(bset:Pisl_basic_set; id:Pisl_id):Pisl_basic_set;cdecl;external libisl;
function isl_set_set_dim_id(set:Pisl_set; _type:Tisl_dim_type; pos:dword; id:Pisl_id):Pisl_set;cdecl;external libisl;
function isl_set_has_dim_id(set:Pisl_set; _type:Tisl_dim_type; pos:dword):Tisl_bool;cdecl;external libisl;
function isl_set_get_dim_id(set:Pisl_set; _type:Tisl_dim_type; pos:dword):Pisl_id;cdecl;external libisl;
function isl_set_set_tuple_id(set:Pisl_set; id:Pisl_id):Pisl_set;cdecl;external libisl;
function isl_set_reset_tuple_id(set:Pisl_set):Pisl_set;cdecl;external libisl;
function isl_set_has_tuple_id(set:Pisl_set):Tisl_bool;cdecl;external libisl;
function isl_set_get_tuple_id(set:Pisl_set):Pisl_id;cdecl;external libisl;
function isl_set_reset_user(set:Pisl_set):Pisl_set;cdecl;external libisl;
function isl_set_find_dim_by_id(set:Pisl_set; _type:Tisl_dim_type; id:Pisl_id):longint;cdecl;external libisl;
function isl_set_find_dim_by_name(set:Pisl_set; _type:Tisl_dim_type; name:Pchar):longint;cdecl;external libisl;
function isl_basic_set_is_rational(bset:Pisl_basic_set):longint;cdecl;external libisl;
function isl_basic_set_free(bset:Pisl_basic_set):Pisl_basic_set;cdecl;external libisl;
function isl_basic_set_copy(bset:Pisl_basic_set):Pisl_basic_set;cdecl;external libisl;
function isl_basic_set_empty(space:Pisl_space):Pisl_basic_set;cdecl;external libisl;
function isl_basic_set_universe(space:Pisl_space):Pisl_basic_set;cdecl;external libisl;
function isl_basic_set_nat_universe(space:Pisl_space):Pisl_basic_set;cdecl;external libisl;
function isl_basic_set_positive_orthant(space:Pisl_space):Pisl_basic_set;cdecl;external libisl;
procedure isl_basic_set_print_internal(bset:Pisl_basic_set; out:PFILE; indent:longint);cdecl;external libisl;
function isl_basic_set_intersect(bset1:Pisl_basic_set; bset2:Pisl_basic_set):Pisl_basic_set;cdecl;external libisl;
function isl_basic_set_intersect_params(bset1:Pisl_basic_set; bset2:Pisl_basic_set):Pisl_basic_set;cdecl;external libisl;
function isl_basic_set_apply(bset:Pisl_basic_set; bmap:Pisl_basic_map):Pisl_basic_set;cdecl;external libisl;
function isl_basic_set_preimage_multi_aff(bset:Pisl_basic_set; ma:Pisl_multi_aff):Pisl_basic_set;cdecl;external libisl;
function isl_basic_set_affine_hull(bset:Pisl_basic_set):Pisl_basic_set;cdecl;external libisl;
function isl_basic_set_remove_dims(bset:Pisl_basic_set; _type:Tisl_dim_type; first:dword; n:dword):Pisl_basic_set;cdecl;external libisl;
function isl_basic_set_sample(bset:Pisl_basic_set):Pisl_basic_set;cdecl;external libisl;
function isl_basic_set_detect_equalities(bset:Pisl_basic_set):Pisl_basic_set;cdecl;external libisl;
function isl_basic_set_remove_redundancies(bset:Pisl_basic_set):Pisl_basic_set;cdecl;external libisl;
function isl_set_remove_redundancies(set:Pisl_set):Pisl_set;cdecl;external libisl;
function isl_basic_set_list_intersect(list:Pisl_basic_set_list):Pisl_basic_set;cdecl;external libisl;
function isl_set_list_union(list:Pisl_set_list):Pisl_set;cdecl;external libisl;
function isl_basic_set_read_from_file(ctx:Pisl_ctx; input:PFILE):Pisl_basic_set;cdecl;external libisl;
function isl_basic_set_read_from_str(ctx:Pisl_ctx; str:Pchar):Pisl_basic_set;cdecl;external libisl;
function isl_set_read_from_file(ctx:Pisl_ctx; input:PFILE):Pisl_set;cdecl;external libisl;
function isl_set_read_from_str(ctx:Pisl_ctx; str:Pchar):Pisl_set;cdecl;external libisl;
procedure isl_basic_set_dump(bset:Pisl_basic_set);cdecl;external libisl;
procedure isl_set_dump(set:Pisl_set);cdecl;external libisl;
function isl_printer_print_basic_set(printer:Pisl_printer; bset:Pisl_basic_set):Pisl_printer;cdecl;external libisl;
function isl_printer_print_set(printer:Pisl_printer; map:Pisl_set):Pisl_printer;cdecl;external libisl;
function isl_basic_set_fix_si(bset:Pisl_basic_set; _type:Tisl_dim_type; pos:dword; value:longint):Pisl_basic_set;cdecl;external libisl;
function isl_basic_set_fix_val(bset:Pisl_basic_set; _type:Tisl_dim_type; pos:dword; v:Pisl_val):Pisl_basic_set;cdecl;external libisl;
function isl_set_fix_si(set:Pisl_set; _type:Tisl_dim_type; pos:dword; value:longint):Pisl_set;cdecl;external libisl;
function isl_set_lower_bound_si(set:Pisl_set; _type:Tisl_dim_type; pos:dword; value:longint):Pisl_set;cdecl;external libisl;
function isl_basic_set_lower_bound_val(bset:Pisl_basic_set; _type:Tisl_dim_type; pos:dword; value:Pisl_val):Pisl_basic_set;cdecl;external libisl;
function isl_set_lower_bound_val(set:Pisl_set; _type:Tisl_dim_type; pos:dword; value:Pisl_val):Pisl_set;cdecl;external libisl;
function isl_set_upper_bound_si(set:Pisl_set; _type:Tisl_dim_type; pos:dword; value:longint):Pisl_set;cdecl;external libisl;
function isl_basic_set_upper_bound_val(bset:Pisl_basic_set; _type:Tisl_dim_type; pos:dword; value:Pisl_val):Pisl_basic_set;cdecl;external libisl;
function isl_set_upper_bound_val(set:Pisl_set; _type:Tisl_dim_type; pos:dword; value:Pisl_val):Pisl_set;cdecl;external libisl;
function isl_set_lower_bound_multi_val(set:Pisl_set; lower:Pisl_multi_val):Pisl_set;cdecl;external libisl;
function isl_set_upper_bound_multi_val(set:Pisl_set; upper:Pisl_multi_val):Pisl_set;cdecl;external libisl;
function isl_set_lower_bound_multi_pw_aff(set:Pisl_set; lower:Pisl_multi_pw_aff):Pisl_set;cdecl;external libisl;
function isl_set_upper_bound_multi_pw_aff(set:Pisl_set; upper:Pisl_multi_pw_aff):Pisl_set;cdecl;external libisl;
function isl_set_equate(set:Pisl_set; type1:Tisl_dim_type; pos1:longint; type2:Tisl_dim_type; pos2:longint):Pisl_set;cdecl;external libisl;
function isl_basic_set_is_equal(bset1:Pisl_basic_set; bset2:Pisl_basic_set):Tisl_bool;cdecl;external libisl;
function isl_basic_set_is_disjoint(bset1:Pisl_basic_set; bset2:Pisl_basic_set):Tisl_bool;cdecl;external libisl;
function isl_basic_set_partial_lexmin(bset:Pisl_basic_set; dom:Pisl_basic_set; empty:PPisl_set):Pisl_set;cdecl;external libisl;
function isl_basic_set_partial_lexmax(bset:Pisl_basic_set; dom:Pisl_basic_set; empty:PPisl_set):Pisl_set;cdecl;external libisl;
function isl_set_partial_lexmin(set:Pisl_set; dom:Pisl_set; empty:PPisl_set):Pisl_set;cdecl;external libisl;
function isl_set_partial_lexmax(set:Pisl_set; dom:Pisl_set; empty:PPisl_set):Pisl_set;cdecl;external libisl;
function isl_basic_set_lexmin(bset:Pisl_basic_set):Pisl_set;cdecl;external libisl;
function isl_basic_set_lexmax(bset:Pisl_basic_set):Pisl_set;cdecl;external libisl;
function isl_set_lexmin(set:Pisl_set):Pisl_set;cdecl;external libisl;
function isl_set_lexmax(set:Pisl_set):Pisl_set;cdecl;external libisl;
function isl_basic_set_partial_lexmin_pw_multi_aff(bset:Pisl_basic_set; dom:Pisl_basic_set; empty:PPisl_set):Pisl_pw_multi_aff;cdecl;external libisl;
function isl_basic_set_partial_lexmax_pw_multi_aff(bset:Pisl_basic_set; dom:Pisl_basic_set; empty:PPisl_set):Pisl_pw_multi_aff;cdecl;external libisl;
function isl_set_lexmin_pw_multi_aff(set:Pisl_set):Pisl_pw_multi_aff;cdecl;external libisl;
function isl_set_lexmax_pw_multi_aff(set:Pisl_set):Pisl_pw_multi_aff;cdecl;external libisl;
function isl_set_min_multi_pw_aff(set:Pisl_set):Pisl_multi_pw_aff;cdecl;external libisl;
function isl_set_max_multi_pw_aff(set:Pisl_set):Pisl_multi_pw_aff;cdecl;external libisl;
function isl_basic_set_union(bset1:Pisl_basic_set; bset2:Pisl_basic_set):Pisl_set;cdecl;external libisl;
function isl_basic_set_compare_at(bset1:Pisl_basic_set; bset2:Pisl_basic_set; pos:longint):longint;cdecl;external libisl;
function isl_set_follows_at(set1:Pisl_set; set2:Pisl_set; pos:longint):longint;cdecl;external libisl;
function isl_basic_set_params(bset:Pisl_basic_set):Pisl_basic_set;cdecl;external libisl;
function isl_basic_set_from_params(bset:Pisl_basic_set):Pisl_basic_set;cdecl;external libisl;
function isl_set_params(set:Pisl_set):Pisl_set;cdecl;external libisl;
function isl_set_from_params(set:Pisl_set):Pisl_set;cdecl;external libisl;
function isl_set_bind(set:Pisl_set; tuple:Pisl_multi_id):Pisl_set;cdecl;external libisl;
function isl_set_unbind_params(set:Pisl_set; tuple:Pisl_multi_id):Pisl_set;cdecl;external libisl;
function isl_set_unbind_params_insert_domain(set:Pisl_set; domain:Pisl_multi_id):Pisl_map;cdecl;external libisl;
function isl_basic_set_dims_get_sign(bset:Pisl_basic_set; _type:Tisl_dim_type; pos:dword; n:dword; signs:Plongint):Tisl_stat;cdecl;external libisl;
function isl_basic_set_plain_is_universe(bset:Pisl_basic_set):Tisl_bool;cdecl;external libisl;
function isl_basic_set_is_universe(bset:Pisl_basic_set):Tisl_bool;cdecl;external libisl;
function isl_basic_set_plain_is_empty(bset:Pisl_basic_set):Tisl_bool;cdecl;external libisl;
function isl_basic_set_is_empty(bset:Pisl_basic_set):Tisl_bool;cdecl;external libisl;
function isl_basic_set_is_bounded(bset:Pisl_basic_set):Tisl_bool;cdecl;external libisl;
function isl_basic_set_is_subset(bset1:Pisl_basic_set; bset2:Pisl_basic_set):Tisl_bool;cdecl;external libisl;
function isl_basic_set_plain_is_equal(bset1:Pisl_basic_set; bset2:Pisl_basic_set):Tisl_bool;cdecl;external libisl;
function isl_set_empty(space:Pisl_space):Pisl_set;cdecl;external libisl;
function isl_set_universe(space:Pisl_space):Pisl_set;cdecl;external libisl;
function isl_space_universe_set(space:Pisl_space):Pisl_set;cdecl;external libisl;
function isl_set_nat_universe(space:Pisl_space):Pisl_set;cdecl;external libisl;
function isl_set_copy(set:Pisl_set):Pisl_set;cdecl;external libisl;
function isl_set_free(set:Pisl_set):Pisl_set;cdecl;external libisl;
function isl_basic_set_to_set(bset:Pisl_basic_set):Pisl_set;cdecl;external libisl;
function isl_set_from_basic_set(bset:Pisl_basic_set):Pisl_set;cdecl;external libisl;
function isl_set_sample(set:Pisl_set):Pisl_basic_set;cdecl;external libisl;
function isl_basic_set_sample_point(bset:Pisl_basic_set):Pisl_point;cdecl;external libisl;
function isl_set_sample_point(set:Pisl_set):Pisl_point;cdecl;external libisl;
function isl_set_detect_equalities(set:Pisl_set):Pisl_set;cdecl;external libisl;
function isl_set_affine_hull(set:Pisl_set):Pisl_basic_set;cdecl;external libisl;
function isl_set_convex_hull(set:Pisl_set):Pisl_basic_set;cdecl;external libisl;
function isl_set_polyhedral_hull(set:Pisl_set):Pisl_basic_set;cdecl;external libisl;
function isl_set_simple_hull(set:Pisl_set):Pisl_basic_set;cdecl;external libisl;
function isl_set_unshifted_simple_hull(set:Pisl_set):Pisl_basic_set;cdecl;external libisl;
function isl_set_plain_unshifted_simple_hull(set:Pisl_set):Pisl_basic_set;cdecl;external libisl;
function isl_set_unshifted_simple_hull_from_set_list(set:Pisl_set; list:Pisl_set_list):Pisl_basic_set;cdecl;external libisl;
function isl_set_bounded_simple_hull(set:Pisl_set):Pisl_basic_set;cdecl;external libisl;
function isl_set_wrapped_reverse(set:Pisl_set):Pisl_set;cdecl;external libisl;
function isl_set_union_disjoint(set1:Pisl_set; set2:Pisl_set):Pisl_set;cdecl;external libisl;
function isl_set_union(set1:Pisl_set; set2:Pisl_set):Pisl_set;cdecl;external libisl;
function isl_set_product(set1:Pisl_set; set2:Pisl_set):Pisl_set;cdecl;external libisl;
function isl_basic_set_flat_product(bset1:Pisl_basic_set; bset2:Pisl_basic_set):Pisl_basic_set;cdecl;external libisl;
function isl_set_flat_product(set1:Pisl_set; set2:Pisl_set):Pisl_set;cdecl;external libisl;
function isl_set_intersect(set1:Pisl_set; set2:Pisl_set):Pisl_set;cdecl;external libisl;
function isl_set_intersect_params(set:Pisl_set; params:Pisl_set):Pisl_set;cdecl;external libisl;
function isl_set_intersect_factor_domain(set:Pisl_set; domain:Pisl_set):Pisl_set;cdecl;external libisl;
function isl_set_intersect_factor_range(set:Pisl_set; range:Pisl_set):Pisl_set;cdecl;external libisl;
function isl_set_subtract(set1:Pisl_set; set2:Pisl_set):Pisl_set;cdecl;external libisl;
function isl_set_complement(set:Pisl_set):Pisl_set;cdecl;external libisl;
function isl_set_apply(set:Pisl_set; map:Pisl_map):Pisl_set;cdecl;external libisl;
function isl_set_preimage_multi_aff(set:Pisl_set; ma:Pisl_multi_aff):Pisl_set;cdecl;external libisl;
function isl_set_preimage_pw_multi_aff(set:Pisl_set; pma:Pisl_pw_multi_aff):Pisl_set;cdecl;external libisl;
function isl_set_preimage_multi_pw_aff(set:Pisl_set; mpa:Pisl_multi_pw_aff):Pisl_set;cdecl;external libisl;
function isl_set_fix_val(set:Pisl_set; _type:Tisl_dim_type; pos:dword; v:Pisl_val):Pisl_set;cdecl;external libisl;
function isl_set_fix_dim_si(set:Pisl_set; dim:dword; value:longint):Pisl_set;cdecl;external libisl;
function isl_basic_set_insert_dims(bset:Pisl_basic_set; _type:Tisl_dim_type; pos:dword; n:dword):Pisl_basic_set;cdecl;external libisl;
function isl_set_insert_dims(set:Pisl_set; _type:Tisl_dim_type; pos:dword; n:dword):Pisl_set;cdecl;external libisl;
function isl_basic_set_add_dims(bset:Pisl_basic_set; _type:Tisl_dim_type; n:dword):Pisl_basic_set;cdecl;external libisl;
function isl_set_add_dims(set:Pisl_set; _type:Tisl_dim_type; n:dword):Pisl_set;cdecl;external libisl;
function isl_basic_set_move_dims(bset:Pisl_basic_set; dst_type:Tisl_dim_type; dst_pos:dword; src_type:Tisl_dim_type; src_pos:dword; 
           n:dword):Pisl_basic_set;cdecl;external libisl;
function isl_set_move_dims(set:Pisl_set; dst_type:Tisl_dim_type; dst_pos:dword; src_type:Tisl_dim_type; src_pos:dword; 
           n:dword):Pisl_set;cdecl;external libisl;
function isl_basic_set_project_out(bset:Pisl_basic_set; _type:Tisl_dim_type; first:dword; n:dword):Pisl_basic_set;cdecl;external libisl;
function isl_set_project_out_param_id(set:Pisl_set; id:Pisl_id):Pisl_set;cdecl;external libisl;
function isl_set_project_out_param_id_list(set:Pisl_set; list:Pisl_id_list):Pisl_set;cdecl;external libisl;
function isl_set_project_out(set:Pisl_set; _type:Tisl_dim_type; first:dword; n:dword):Pisl_set;cdecl;external libisl;
function isl_set_project_out_all_params(set:Pisl_set):Pisl_set;cdecl;external libisl;
function isl_set_project_onto_map(set:Pisl_set; _type:Tisl_dim_type; first:dword; n:dword):Pisl_map;cdecl;external libisl;
function isl_basic_set_remove_divs(bset:Pisl_basic_set):Pisl_basic_set;cdecl;external libisl;
function isl_basic_set_eliminate(bset:Pisl_basic_set; _type:Tisl_dim_type; first:dword; n:dword):Pisl_basic_set;cdecl;external libisl;
function isl_set_eliminate(set:Pisl_set; _type:Tisl_dim_type; first:dword; n:dword):Pisl_set;cdecl;external libisl;
function isl_set_eliminate_dims(set:Pisl_set; first:dword; n:dword):Pisl_set;cdecl;external libisl;
function isl_set_remove_dims(bset:Pisl_set; _type:Tisl_dim_type; first:dword; n:dword):Pisl_set;cdecl;external libisl;
function isl_basic_set_remove_divs_involving_dims(bset:Pisl_basic_set; _type:Tisl_dim_type; first:dword; n:dword):Pisl_basic_set;cdecl;external libisl;
function isl_set_remove_divs_involving_dims(set:Pisl_set; _type:Tisl_dim_type; first:dword; n:dword):Pisl_set;cdecl;external libisl;
function isl_basic_set_remove_unknown_divs(bset:Pisl_basic_set):Pisl_basic_set;cdecl;external libisl;
function isl_set_remove_unknown_divs(set:Pisl_set):Pisl_set;cdecl;external libisl;
function isl_set_remove_divs(set:Pisl_set):Pisl_set;cdecl;external libisl;
function isl_set_split_dims(set:Pisl_set; _type:Tisl_dim_type; first:dword; n:dword):Pisl_set;cdecl;external libisl;
function isl_basic_set_drop_constraints_involving_dims(bset:Pisl_basic_set; _type:Tisl_dim_type; first:dword; n:dword):Pisl_basic_set;cdecl;external libisl;
function isl_basic_set_drop_constraints_not_involving_dims(bset:Pisl_basic_set; _type:Tisl_dim_type; first:dword; n:dword):Pisl_basic_set;cdecl;external libisl;
function isl_set_drop_constraints_involving_dims(set:Pisl_set; _type:Tisl_dim_type; first:dword; n:dword):Pisl_set;cdecl;external libisl;
function isl_set_drop_constraints_not_involving_dims(set:Pisl_set; _type:Tisl_dim_type; first:dword; n:dword):Pisl_set;cdecl;external libisl;
function isl_set_involves_locals(set:Pisl_set):Tisl_bool;cdecl;external libisl;
function isl_basic_set_involves_dims(bset:Pisl_basic_set; _type:Tisl_dim_type; first:dword; n:dword):Tisl_bool;cdecl;external libisl;
function isl_set_involves_dims(set:Pisl_set; _type:Tisl_dim_type; first:dword; n:dword):Tisl_bool;cdecl;external libisl;
procedure isl_set_print_internal(set:Pisl_set; out:PFILE; indent:longint);cdecl;external libisl;
function isl_set_plain_is_empty(set:Pisl_set):Tisl_bool;cdecl;external libisl;
function isl_set_plain_is_universe(set:Pisl_set):Tisl_bool;cdecl;external libisl;
function isl_set_is_params(set:Pisl_set):Tisl_bool;cdecl;external libisl;
function isl_set_is_empty(set:Pisl_set):Tisl_bool;cdecl;external libisl;
function isl_set_is_bounded(set:Pisl_set):Tisl_bool;cdecl;external libisl;
function isl_set_is_subset(set1:Pisl_set; set2:Pisl_set):Tisl_bool;cdecl;external libisl;
function isl_set_is_strict_subset(set1:Pisl_set; set2:Pisl_set):Tisl_bool;cdecl;external libisl;
function isl_set_is_equal(set1:Pisl_set; set2:Pisl_set):Tisl_bool;cdecl;external libisl;
function isl_set_is_disjoint(set1:Pisl_set; set2:Pisl_set):Tisl_bool;cdecl;external libisl;
function isl_set_is_singleton(set:Pisl_set):Tisl_bool;cdecl;external libisl;
function isl_set_is_box(set:Pisl_set):Tisl_bool;cdecl;external libisl;
function isl_set_has_equal_space(set1:Pisl_set; set2:Pisl_set):Tisl_bool;cdecl;external libisl;
function isl_set_sum(set1:Pisl_set; set2:Pisl_set):Pisl_set;cdecl;external libisl;
function isl_basic_set_neg(bset:Pisl_basic_set):Pisl_basic_set;cdecl;external libisl;
function isl_set_neg(set:Pisl_set):Pisl_set;cdecl;external libisl;
function isl_set_make_disjoint(set:Pisl_set):Pisl_set;cdecl;external libisl;
function isl_basic_set_compute_divs(bset:Pisl_basic_set):Pisl_set;cdecl;external libisl;
function isl_set_compute_divs(set:Pisl_set):Pisl_set;cdecl;external libisl;
{xxxxxxx ISL_DEPRECATED }
function isl_set_align_divs(set:Pisl_set):Pisl_set;cdecl;external libisl;
function isl_set_get_plain_multi_val_if_fixed(set:Pisl_set):Pisl_multi_val;cdecl;external libisl;
function isl_set_plain_get_val_if_fixed(set:Pisl_set; _type:Tisl_dim_type; pos:dword):Pisl_val;cdecl;external libisl;
function isl_set_dim_is_bounded(set:Pisl_set; _type:Tisl_dim_type; pos:dword):Tisl_bool;cdecl;external libisl;
function isl_set_dim_has_lower_bound(set:Pisl_set; _type:Tisl_dim_type; pos:dword):Tisl_bool;cdecl;external libisl;
function isl_set_dim_has_upper_bound(set:Pisl_set; _type:Tisl_dim_type; pos:dword):Tisl_bool;cdecl;external libisl;
function isl_set_dim_has_any_lower_bound(set:Pisl_set; _type:Tisl_dim_type; pos:dword):Tisl_bool;cdecl;external libisl;
function isl_set_dim_has_any_upper_bound(set:Pisl_set; _type:Tisl_dim_type; pos:dword):Tisl_bool;cdecl;external libisl;
function isl_basic_set_gist(bset:Pisl_basic_set; context:Pisl_basic_set):Pisl_basic_set;cdecl;external libisl;
function isl_set_gist_basic_set(set:Pisl_set; context:Pisl_basic_set):Pisl_set;cdecl;external libisl;
function isl_set_gist(set:Pisl_set; context:Pisl_set):Pisl_set;cdecl;external libisl;
function isl_set_gist_params(set:Pisl_set; context:Pisl_set):Pisl_set;cdecl;external libisl;
function isl_set_dim_residue_class_val(set:Pisl_set; pos:longint; modulo:PPisl_val; residue:PPisl_val):Tisl_stat;cdecl;external libisl;
function isl_set_get_stride_info(set:Pisl_set; pos:longint):Pisl_stride_info;cdecl;external libisl;
function isl_set_get_stride(set:Pisl_set; pos:longint):Pisl_val;cdecl;external libisl;
function isl_set_get_lattice_tile(set:Pisl_set):Pisl_fixed_box;cdecl;external libisl;
function isl_set_get_simple_fixed_box_hull(set:Pisl_set):Pisl_fixed_box;cdecl;external libisl;
function isl_set_coalesce(set:Pisl_set):Pisl_set;cdecl;external libisl;
function isl_set_plain_cmp(set1:Pisl_set; set2:Pisl_set):longint;cdecl;external libisl;
function isl_set_plain_is_equal(set1:Pisl_set; set2:Pisl_set):Tisl_bool;cdecl;external libisl;
function isl_set_plain_is_disjoint(set1:Pisl_set; set2:Pisl_set):Tisl_bool;cdecl;external libisl;
function isl_set_get_hash(set:Pisl_set):Tuint32_t;cdecl;external libisl;
function isl_set_n_basic_set(set:Pisl_set):Tisl_size;cdecl;external libisl;
function isl_set_foreach_basic_set(set:Pisl_set; fn:function (bset:Pisl_basic_set; user:pointer):Tisl_stat; user:pointer):Tisl_stat;cdecl;external libisl;
function isl_set_get_basic_set_list(set:Pisl_set):Pisl_basic_set_list;cdecl;external libisl;
function isl_set_foreach_point(set:Pisl_set; fn:function (pnt:Pisl_point; user:pointer):Tisl_stat; user:pointer):Tisl_stat;cdecl;external libisl;
function isl_set_count_val(set:Pisl_set):Pisl_val;cdecl;external libisl;
function isl_basic_set_from_point(pnt:Pisl_point):Pisl_basic_set;cdecl;external libisl;
function isl_point_to_set(pnt:Pisl_point):Pisl_set;cdecl;external libisl;
function isl_set_from_point(pnt:Pisl_point):Pisl_set;cdecl;external libisl;
function isl_basic_set_box_from_points(pnt1:Pisl_point; pnt2:Pisl_point):Pisl_basic_set;cdecl;external libisl;
function isl_set_box_from_points(pnt1:Pisl_point; pnt2:Pisl_point):Pisl_set;cdecl;external libisl;
function isl_basic_set_lift(bset:Pisl_basic_set):Pisl_basic_set;cdecl;external libisl;
function isl_set_lift(set:Pisl_set):Pisl_set;cdecl;external libisl;
function isl_set_lex_le_set(set1:Pisl_set; set2:Pisl_set):Pisl_map;cdecl;external libisl;
function isl_set_lex_lt_set(set1:Pisl_set; set2:Pisl_set):Pisl_map;cdecl;external libisl;
function isl_set_lex_ge_set(set1:Pisl_set; set2:Pisl_set):Pisl_map;cdecl;external libisl;
function isl_set_lex_gt_set(set1:Pisl_set; set2:Pisl_set):Pisl_map;cdecl;external libisl;
function isl_set_size(set:Pisl_set):longint;cdecl;external libisl;
function isl_basic_set_align_params(bset:Pisl_basic_set; model:Pisl_space):Pisl_basic_set;cdecl;external libisl;
function isl_set_align_params(set:Pisl_set; model:Pisl_space):Pisl_set;cdecl;external libisl;
function isl_basic_set_drop_unused_params(bset:Pisl_basic_set):Pisl_basic_set;cdecl;external libisl;
function isl_set_drop_unused_params(set:Pisl_set):Pisl_set;cdecl;external libisl;
function isl_basic_set_equalities_matrix(bset:Pisl_basic_set; c1:Tisl_dim_type; c2:Tisl_dim_type; c3:Tisl_dim_type; c4:Tisl_dim_type):Pisl_mat;cdecl;external libisl;
function isl_basic_set_inequalities_matrix(bset:Pisl_basic_set; c1:Tisl_dim_type; c2:Tisl_dim_type; c3:Tisl_dim_type; c4:Tisl_dim_type):Pisl_mat;cdecl;external libisl;
function isl_basic_set_from_constraint_matrices(space:Pisl_space; eq:Pisl_mat; ineq:Pisl_mat; c1:Tisl_dim_type; c2:Tisl_dim_type; 
           c3:Tisl_dim_type; c4:Tisl_dim_type):Pisl_basic_set;cdecl;external libisl;
function isl_basic_set_from_multi_aff(ma:Pisl_multi_aff):Pisl_basic_set;cdecl;external libisl;
function isl_multi_aff_as_set(ma:Pisl_multi_aff):Pisl_set;cdecl;external libisl;
function isl_set_from_multi_aff(ma:Pisl_multi_aff):Pisl_set;cdecl;external libisl;
function isl_basic_set_reduced_basis(bset:Pisl_basic_set):Pisl_mat;cdecl;external libisl;
function isl_basic_set_coefficients(bset:Pisl_basic_set):Pisl_basic_set;cdecl;external libisl;
function isl_basic_set_list_coefficients(list:Pisl_basic_set_list):Pisl_basic_set_list;cdecl;external libisl;
function isl_set_coefficients(set:Pisl_set):Pisl_basic_set;cdecl;external libisl;
function isl_basic_set_solutions(bset:Pisl_basic_set):Pisl_basic_set;cdecl;external libisl;
function isl_set_solutions(set:Pisl_set):Pisl_basic_set;cdecl;external libisl;
function isl_set_dim_max(set:Pisl_set; pos:longint):Pisl_pw_aff;cdecl;external libisl;
function isl_set_dim_min(set:Pisl_set; pos:longint):Pisl_pw_aff;cdecl;external libisl;
function isl_basic_set_to_str(bset:Pisl_basic_set):Pchar;cdecl;external libisl;
function isl_set_to_str(set:Pisl_set):Pchar;cdecl;external libisl;
{$endif}

// === Konventiert am: 5-11-26 15:55:01 ===


implementation



end.
