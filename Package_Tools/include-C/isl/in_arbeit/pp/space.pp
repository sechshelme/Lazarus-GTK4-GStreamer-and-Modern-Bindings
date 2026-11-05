
unit space;
interface

{
  Automatically converted by H2Pas 1.0.0 from space.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    space.h
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
Pisl_ctx  = ^isl_ctx;
Pisl_id  = ^isl_id;
Pisl_printer  = ^isl_printer;
Pisl_space  = ^isl_space;
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
{$ifndef ISL_SPACE_H}
{$define ISL_SPACE_H}
{$include <isl/ctx.h>}
{$include <isl/space_type.h>}
{$include <isl/id_type.h>}
{$include <isl/printer.h>}
{$if defined(__cplusplus)}
{$endif}

function isl_space_get_ctx(space:Pisl_space):Pisl_ctx;cdecl;external;
function isl_space_unit(ctx:Pisl_ctx):Pisl_space;cdecl;external;
function isl_space_alloc(ctx:Pisl_ctx; nparam:dword; n_in:dword; n_out:dword):Pisl_space;cdecl;external;
function isl_space_set_alloc(ctx:Pisl_ctx; nparam:dword; dim:dword):Pisl_space;cdecl;external;
function isl_space_params_alloc(ctx:Pisl_ctx; nparam:dword):Pisl_space;cdecl;external;
function isl_space_copy(space:Pisl_space):Pisl_space;cdecl;external;
function isl_space_free(space:Pisl_space):Pisl_space;cdecl;external;
function isl_space_is_params(space:Pisl_space):Tisl_bool;cdecl;external;
function isl_space_is_set(space:Pisl_space):Tisl_bool;cdecl;external;
function isl_space_is_map(space:Pisl_space):Tisl_bool;cdecl;external;
function isl_space_add_param_id(space:Pisl_space; id:Pisl_id):Pisl_space;cdecl;external;
(* Const before type ignored *)
function isl_space_set_tuple_name(space:Pisl_space; _type:Tisl_dim_type; s:Pchar):Pisl_space;cdecl;external;
function isl_space_has_tuple_name(space:Pisl_space; _type:Tisl_dim_type):Tisl_bool;cdecl;external;
(* Const before type ignored *)
function isl_space_get_tuple_name(space:Pisl_space; _type:Tisl_dim_type):Pchar;cdecl;external;
function isl_space_set_domain_tuple_id(space:Pisl_space; id:Pisl_id):Pisl_space;cdecl;external;
function isl_space_set_range_tuple_id(space:Pisl_space; id:Pisl_id):Pisl_space;cdecl;external;
function isl_space_set_tuple_id(space:Pisl_space; _type:Tisl_dim_type; id:Pisl_id):Pisl_space;cdecl;external;
function isl_space_reset_tuple_id(space:Pisl_space; _type:Tisl_dim_type):Pisl_space;cdecl;external;
function isl_space_has_domain_tuple_id(space:Pisl_space):Tisl_bool;cdecl;external;
function isl_space_has_range_tuple_id(space:Pisl_space):Tisl_bool;cdecl;external;
function isl_space_has_tuple_id(space:Pisl_space; _type:Tisl_dim_type):Tisl_bool;cdecl;external;
function isl_space_get_domain_tuple_id(space:Pisl_space):Pisl_id;cdecl;external;
function isl_space_get_range_tuple_id(space:Pisl_space):Pisl_id;cdecl;external;
function isl_space_get_tuple_id(space:Pisl_space; _type:Tisl_dim_type):Pisl_id;cdecl;external;
function isl_space_reset_user(space:Pisl_space):Pisl_space;cdecl;external;
function isl_space_set_dim_id(space:Pisl_space; _type:Tisl_dim_type; pos:dword; id:Pisl_id):Pisl_space;cdecl;external;
function isl_space_has_dim_id(space:Pisl_space; _type:Tisl_dim_type; pos:dword):Tisl_bool;cdecl;external;
function isl_space_get_dim_id(space:Pisl_space; _type:Tisl_dim_type; pos:dword):Pisl_id;cdecl;external;
function isl_space_find_dim_by_id(space:Pisl_space; _type:Tisl_dim_type; id:Pisl_id):longint;cdecl;external;
(* Const before type ignored *)
function isl_space_find_dim_by_name(space:Pisl_space; _type:Tisl_dim_type; name:Pchar):longint;cdecl;external;
function isl_space_has_dim_name(space:Pisl_space; _type:Tisl_dim_type; pos:dword):Tisl_bool;cdecl;external;
(* Const before type ignored *)
function isl_space_set_dim_name(space:Pisl_space; _type:Tisl_dim_type; pos:dword; name:Pchar):Pisl_space;cdecl;external;
(* Const before type ignored *)
function isl_space_get_dim_name(space:Pisl_space; _type:Tisl_dim_type; pos:dword):Pchar;cdecl;external;
{ xxxxxxxx ISL_DEPRECATED }
function isl_space_extend(space:Pisl_space; nparam:dword; n_in:dword; n_out:dword):Pisl_space;cdecl;external;
function isl_space_add_dims(space:Pisl_space; _type:Tisl_dim_type; n:dword):Pisl_space;cdecl;external;
function isl_space_move_dims(space:Pisl_space; dst_type:Tisl_dim_type; dst_pos:dword; src_type:Tisl_dim_type; src_pos:dword; 
           n:dword):Pisl_space;cdecl;external;
function isl_space_insert_dims(space:Pisl_space; _type:Tisl_dim_type; pos:dword; n:dword):Pisl_space;cdecl;external;
function isl_space_join(left:Pisl_space; right:Pisl_space):Pisl_space;cdecl;external;
function isl_space_product(left:Pisl_space; right:Pisl_space):Pisl_space;cdecl;external;
function isl_space_domain_product(left:Pisl_space; right:Pisl_space):Pisl_space;cdecl;external;
function isl_space_range_product(left:Pisl_space; right:Pisl_space):Pisl_space;cdecl;external;
function isl_space_factor_domain(space:Pisl_space):Pisl_space;cdecl;external;
function isl_space_factor_range(space:Pisl_space):Pisl_space;cdecl;external;
function isl_space_domain_factor_domain(space:Pisl_space):Pisl_space;cdecl;external;
function isl_space_domain_factor_range(space:Pisl_space):Pisl_space;cdecl;external;
function isl_space_range_factor_domain(space:Pisl_space):Pisl_space;cdecl;external;
function isl_space_range_factor_range(space:Pisl_space):Pisl_space;cdecl;external;
function isl_space_domain_wrapped_domain(space:Pisl_space):Pisl_space;cdecl;external;
function isl_space_domain_wrapped_range(space:Pisl_space):Pisl_space;cdecl;external;
function isl_space_range_wrapped_domain(space:Pisl_space):Pisl_space;cdecl;external;
function isl_space_range_wrapped_range(space:Pisl_space):Pisl_space;cdecl;external;
function isl_space_map_from_set(space:Pisl_space):Pisl_space;cdecl;external;
function isl_space_map_from_domain_and_range(domain:Pisl_space; range:Pisl_space):Pisl_space;cdecl;external;
function isl_space_reverse(space:Pisl_space):Pisl_space;cdecl;external;
function isl_space_wrapped_reverse(space:Pisl_space):Pisl_space;cdecl;external;
function isl_space_domain_reverse(space:Pisl_space):Pisl_space;cdecl;external;
function isl_space_range_reverse(space:Pisl_space):Pisl_space;cdecl;external;
function isl_space_drop_dims(space:Pisl_space; _type:Tisl_dim_type; first:dword; num:dword):Pisl_space;cdecl;external;
{ xxxxxxx ISL_DEPRECATED }
function isl_space_drop_inputs(space:Pisl_space; first:dword; n:dword):Pisl_space;cdecl;external;
{ xxxxxxxx ISL_DEPRECATED }
function isl_space_drop_outputs(space:Pisl_space; first:dword; n:dword):Pisl_space;cdecl;external;
function isl_space_drop_all_params(space:Pisl_space):Pisl_space;cdecl;external;
function isl_space_domain(space:Pisl_space):Pisl_space;cdecl;external;
function isl_space_from_domain(space:Pisl_space):Pisl_space;cdecl;external;
function isl_space_range(space:Pisl_space):Pisl_space;cdecl;external;
function isl_space_from_range(space:Pisl_space):Pisl_space;cdecl;external;
function isl_space_domain_map(space:Pisl_space):Pisl_space;cdecl;external;
function isl_space_range_map(space:Pisl_space):Pisl_space;cdecl;external;
function isl_space_params(space:Pisl_space):Pisl_space;cdecl;external;
function isl_space_add_unnamed_tuple_ui(space:Pisl_space; dim:dword):Pisl_space;cdecl;external;
function isl_space_add_named_tuple_id_ui(space:Pisl_space; tuple_id:Pisl_id; dim:dword):Pisl_space;cdecl;external;
function isl_space_set_from_params(space:Pisl_space):Pisl_space;cdecl;external;
function isl_space_align_params(space1:Pisl_space; space2:Pisl_space):Pisl_space;cdecl;external;
function isl_space_is_wrapping(space:Pisl_space):Tisl_bool;cdecl;external;
function isl_space_domain_is_wrapping(space:Pisl_space):Tisl_bool;cdecl;external;
function isl_space_range_is_wrapping(space:Pisl_space):Tisl_bool;cdecl;external;
function isl_space_is_product(space:Pisl_space):Tisl_bool;cdecl;external;
function isl_space_wrap(space:Pisl_space):Pisl_space;cdecl;external;
function isl_space_unwrap(space:Pisl_space):Pisl_space;cdecl;external;
function isl_space_can_zip(space:Pisl_space):Tisl_bool;cdecl;external;
function isl_space_zip(space:Pisl_space):Pisl_space;cdecl;external;
function isl_space_can_curry(space:Pisl_space):Tisl_bool;cdecl;external;
function isl_space_curry(space:Pisl_space):Pisl_space;cdecl;external;
function isl_space_can_range_curry(space:Pisl_space):Tisl_bool;cdecl;external;
function isl_space_range_curry(space:Pisl_space):Pisl_space;cdecl;external;
function isl_space_can_uncurry(space:Pisl_space):Tisl_bool;cdecl;external;
function isl_space_uncurry(space:Pisl_space):Pisl_space;cdecl;external;
function isl_space_is_domain(space1:Pisl_space; space2:Pisl_space):Tisl_bool;cdecl;external;
function isl_space_is_range(space1:Pisl_space; space2:Pisl_space):Tisl_bool;cdecl;external;
function isl_space_is_equal(space1:Pisl_space; space2:Pisl_space):Tisl_bool;cdecl;external;
function isl_space_has_equal_params(space1:Pisl_space; space2:Pisl_space):Tisl_bool;cdecl;external;
function isl_space_has_equal_tuples(space1:Pisl_space; space2:Pisl_space):Tisl_bool;cdecl;external;
function isl_space_tuple_is_equal(space1:Pisl_space; type1:Tisl_dim_type; space2:Pisl_space; type2:Tisl_dim_type):Tisl_bool;cdecl;external;
{ xxxxxxxxxx ISL_DEPRECATED }
function isl_space_match(space1:Pisl_space; type1:Tisl_dim_type; space2:Pisl_space; type2:Tisl_dim_type):Tisl_bool;cdecl;external;
function isl_space_dim(space:Pisl_space; _type:Tisl_dim_type):Tisl_size;cdecl;external;
function isl_space_flatten_domain(space:Pisl_space):Pisl_space;cdecl;external;
function isl_space_flatten_range(space:Pisl_space):Pisl_space;cdecl;external;
(* Const before type ignored *)
function isl_space_read_from_str(ctx:Pisl_ctx; str:Pchar):Pisl_space;cdecl;external;
function isl_space_to_str(space:Pisl_space):Pchar;cdecl;external;
function isl_printer_print_space(p:Pisl_printer; space:Pisl_space):Pisl_printer;cdecl;external;
procedure isl_space_dump(space:Pisl_space);cdecl;external;
{$endif}

implementation


end.
