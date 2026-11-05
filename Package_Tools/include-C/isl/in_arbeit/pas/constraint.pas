unit constraint;

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
{$ifndef ISL_CONSTRAINT_H}
{$define ISL_CONSTRAINT_H}
{$include <isl/local_space.h>}
{$include <isl/space_type.h>}
{$include <isl/aff_type.h>}
{$include <isl/set_type.h>}
{$include <isl/list.h>}
{$include <isl/val_type.h>}
{$include <isl/printer.h>}
{$if defined(__cplusplus)}
{$endif}
type
  Pisl_constraint = ^Tisl_constraint;
  Tisl_constraint = record
      {undefined structure}
    end;

  Pisl_constraint = ^Tisl_constraint;
  Tisl_constraint = record
      {undefined structure}
    end;

  Pisl_constraint_list = ^Tisl_constraint_list;
  Tisl_constraint_list = record
      {undefined structure}
    end;


function isl_constraint_list_get_ctx(list:Pisl_constraint_list):Pisl_ctx;cdecl;external libisl;
function isl_constraint_to_list(el:Pisl_constraint):Pisl_constraint_list;cdecl;external libisl;
function isl_constraint_list_from_constraint(el:Pisl_constraint):Pisl_constraint_list;cdecl;external libisl;
function isl_constraint_list_alloc(ctx:Pisl_ctx; n:longint):Pisl_constraint_list;cdecl;external libisl;
function isl_constraint_list_copy(list:Pisl_constraint_list):Pisl_constraint_list;cdecl;external libisl;
function isl_constraint_list_free(list:Pisl_constraint_list):Pisl_constraint_list;cdecl;external libisl;
function isl_constraint_list_add(list:Pisl_constraint_list; el:Pisl_constraint):Pisl_constraint_list;cdecl;external libisl;
function isl_constraint_list_insert(list:Pisl_constraint_list; pos:dword; el:Pisl_constraint):Pisl_constraint_list;cdecl;external libisl;
function isl_constraint_list_drop(list:Pisl_constraint_list; first:dword; n:dword):Pisl_constraint_list;cdecl;external libisl;
function isl_constraint_list_clear(list:Pisl_constraint_list):Pisl_constraint_list;cdecl;external libisl;
function isl_constraint_list_swap(list:Pisl_constraint_list; pos1:dword; pos2:dword):Pisl_constraint_list;cdecl;external libisl;
function isl_constraint_list_reverse(list:Pisl_constraint_list):Pisl_constraint_list;cdecl;external libisl;
function isl_constraint_list_concat(list1:Pisl_constraint_list; list2:Pisl_constraint_list):Pisl_constraint_list;cdecl;external libisl;
function isl_constraint_list_size(list:Pisl_constraint_list):Tisl_size;cdecl;external libisl;
function isl_constraint_list_n_constraint(list:Pisl_constraint_list):Tisl_size;cdecl;external libisl;
function isl_constraint_list_get_at(list:Pisl_constraint_list; index:longint):Pisl_constraint;cdecl;external libisl;
function isl_constraint_list_get_constraint(list:Pisl_constraint_list; index:longint):Pisl_constraint;cdecl;external libisl;
function isl_constraint_list_set_at(list:Pisl_constraint_list; index:longint; el:Pisl_constraint):Pisl_constraint_list;cdecl;external libisl;
function isl_constraint_list_set_constraint(list:Pisl_constraint_list; index:longint; el:Pisl_constraint):Pisl_constraint_list;cdecl;external libisl;
function isl_constraint_list_foreach(list:Pisl_constraint_list; fn:function (el:Pisl_constraint; user:pointer):Tisl_stat; user:pointer):Tisl_stat;cdecl;external libisl;
function isl_constraint_list_every(list:Pisl_constraint_list; test:function (el:Pisl_constraint; user:pointer):Tisl_bool; user:pointer):Tisl_bool;cdecl;external libisl;
function isl_constraint_list_map(list:Pisl_constraint_list; fn:function (el:Pisl_constraint; user:pointer):Pisl_constraint; user:pointer):Pisl_constraint_list;cdecl;external libisl;
function isl_constraint_list_sort(list:Pisl_constraint_list; cmp:function (a:Pisl_constraint; b:Pisl_constraint; user:pointer):longint; user:pointer):Pisl_constraint_list;cdecl;external libisl;
function isl_constraint_list_foreach_scc(list:Pisl_constraint_list; follows:function (a:Pisl_constraint; b:Pisl_constraint; user:pointer):Tisl_bool; follows_user:pointer; fn:function (scc:Pisl_constraint_list; user:pointer):Tisl_stat; fn_user:pointer):Tisl_stat;cdecl;external libisl;
function isl_constraint_list_to_str(list:Pisl_constraint_list):Pchar;cdecl;external libisl;
function isl_printer_print_constraint_list(p:Pisl_printer; list:Pisl_constraint_list):Pisl_printer;cdecl;external libisl;
procedure isl_constraint_list_dump(list:Pisl_constraint_list);cdecl;external libisl;
function isl_constraint_get_ctx(c:Pisl_constraint):Pisl_ctx;cdecl;external libisl;
function isl_constraint_alloc_equality(ls:Pisl_local_space):Pisl_constraint;cdecl;external libisl;
function isl_constraint_alloc_inequality(ls:Pisl_local_space):Pisl_constraint;cdecl;external libisl;
function isl_equality_alloc(ls:Pisl_local_space):Pisl_constraint;cdecl;external libisl;
function isl_inequality_alloc(ls:Pisl_local_space):Pisl_constraint;cdecl;external libisl;
function isl_constraint_copy(c:Pisl_constraint):Pisl_constraint;cdecl;external libisl;
function isl_constraint_free(c:Pisl_constraint):Pisl_constraint;cdecl;external libisl;
function isl_basic_map_n_constraint(bmap:Pisl_basic_map):Tisl_size;cdecl;external libisl;
function isl_basic_set_n_constraint(bset:Pisl_basic_set):Tisl_size;cdecl;external libisl;
function isl_basic_map_foreach_constraint(bmap:Pisl_basic_map; fn:function (c:Pisl_constraint; user:pointer):Tisl_stat; user:pointer):Tisl_stat;cdecl;external libisl;
function isl_basic_set_foreach_constraint(bset:Pisl_basic_set; fn:function (c:Pisl_constraint; user:pointer):Tisl_stat; user:pointer):Tisl_stat;cdecl;external libisl;
function isl_basic_map_get_constraint_list(bmap:Pisl_basic_map):Pisl_constraint_list;cdecl;external libisl;
function isl_basic_set_get_constraint_list(bset:Pisl_basic_set):Pisl_constraint_list;cdecl;external libisl;
function isl_constraint_is_equal(constraint1:Pisl_constraint; constraint2:Pisl_constraint):longint;cdecl;external libisl;
function isl_basic_set_foreach_bound_pair(bset:Pisl_basic_set; _type:Tisl_dim_type; pos:dword; fn:function (lower:Pisl_constraint; upper:Pisl_constraint; bset:Pisl_basic_set; user:pointer):Tisl_stat; user:pointer):Tisl_stat;cdecl;external libisl;
function isl_basic_map_add_constraint(bmap:Pisl_basic_map; constraint:Pisl_constraint):Pisl_basic_map;cdecl;external libisl;
function isl_basic_set_add_constraint(bset:Pisl_basic_set; constraint:Pisl_constraint):Pisl_basic_set;cdecl;external libisl;
function isl_map_add_constraint(map:Pisl_map; constraint:Pisl_constraint):Pisl_map;cdecl;external libisl;
function isl_set_add_constraint(set:Pisl_set; constraint:Pisl_constraint):Pisl_set;cdecl;external libisl;
function isl_basic_map_has_defining_equality(bmap:Pisl_basic_map; _type:Tisl_dim_type; pos:longint; c:PPisl_constraint):Tisl_bool;cdecl;external libisl;
function isl_basic_set_has_defining_equality(bset:Pisl_basic_set; _type:Tisl_dim_type; pos:longint; constraint:PPisl_constraint):Tisl_bool;cdecl;external libisl;
function isl_basic_set_has_defining_inequalities(bset:Pisl_basic_set; _type:Tisl_dim_type; pos:longint; lower:PPisl_constraint; upper:PPisl_constraint):Tisl_bool;cdecl;external libisl;
function isl_constraint_get_space(constraint:Pisl_constraint):Pisl_space;cdecl;external libisl;
function isl_constraint_get_local_space(constraint:Pisl_constraint):Pisl_local_space;cdecl;external libisl;
function isl_constraint_dim(constraint:Pisl_constraint; _type:Tisl_dim_type):Tisl_size;cdecl;external libisl;
function isl_constraint_involves_dims(constraint:Pisl_constraint; _type:Tisl_dim_type; first:dword; n:dword):Tisl_bool;cdecl;external libisl;
function isl_constraint_get_dim_name(constraint:Pisl_constraint; _type:Tisl_dim_type; pos:dword):Pchar;cdecl;external libisl;
function isl_constraint_get_constant_val(constraint:Pisl_constraint):Pisl_val;cdecl;external libisl;
function isl_constraint_get_coefficient_val(constraint:Pisl_constraint; _type:Tisl_dim_type; pos:longint):Pisl_val;cdecl;external libisl;
function isl_constraint_set_constant_si(constraint:Pisl_constraint; v:longint):Pisl_constraint;cdecl;external libisl;
function isl_constraint_set_constant_val(constraint:Pisl_constraint; v:Pisl_val):Pisl_constraint;cdecl;external libisl;
function isl_constraint_set_coefficient_si(constraint:Pisl_constraint; _type:Tisl_dim_type; pos:longint; v:longint):Pisl_constraint;cdecl;external libisl;
function isl_constraint_set_coefficient_val(constraint:Pisl_constraint; _type:Tisl_dim_type; pos:longint; v:Pisl_val):Pisl_constraint;cdecl;external libisl;
function isl_constraint_get_div(constraint:Pisl_constraint; pos:longint):Pisl_aff;cdecl;external libisl;
function isl_constraint_negate(constraint:Pisl_constraint):Pisl_constraint;cdecl;external libisl;
function isl_constraint_is_equality(constraint:Pisl_constraint):Tisl_bool;cdecl;external libisl;
function isl_constraint_is_div_constraint(constraint:Pisl_constraint):Tisl_bool;cdecl;external libisl;
function isl_constraint_is_lower_bound(constraint:Pisl_constraint; _type:Tisl_dim_type; pos:dword):Tisl_bool;cdecl;external libisl;
function isl_constraint_is_upper_bound(constraint:Pisl_constraint; _type:Tisl_dim_type; pos:dword):Tisl_bool;cdecl;external libisl;
function isl_basic_map_from_constraint(constraint:Pisl_constraint):Pisl_basic_map;cdecl;external libisl;
function isl_basic_set_from_constraint(constraint:Pisl_constraint):Pisl_basic_set;cdecl;external libisl;
function isl_constraint_get_bound(constraint:Pisl_constraint; _type:Tisl_dim_type; pos:longint):Pisl_aff;cdecl;external libisl;
function isl_constraint_get_aff(constraint:Pisl_constraint):Pisl_aff;cdecl;external libisl;
function isl_equality_from_aff(aff:Pisl_aff):Pisl_constraint;cdecl;external libisl;
function isl_inequality_from_aff(aff:Pisl_aff):Pisl_constraint;cdecl;external libisl;
function isl_constraint_plain_cmp(c1:Pisl_constraint; c2:Pisl_constraint):longint;cdecl;external libisl;
function isl_constraint_cmp_last_non_zero(c1:Pisl_constraint; c2:Pisl_constraint):longint;cdecl;external libisl;
function isl_printer_print_constraint(p:Pisl_printer; c:Pisl_constraint):Pisl_printer;cdecl;external libisl;
procedure isl_constraint_dump(c:Pisl_constraint);cdecl;external libisl;

// === Konventiert am: 4-11-26 19:46:27 ===


implementation



end.
