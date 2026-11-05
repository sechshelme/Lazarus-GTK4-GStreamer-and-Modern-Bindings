
unit local_space;
interface

{
  Automatically converted by H2Pas 1.0.0 from local_space.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    local_space.h
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
Pisl_aff  = ^isl_aff;
Pisl_basic_map  = ^isl_basic_map;
Pisl_ctx  = ^isl_ctx;
Pisl_id  = ^isl_id;
Pisl_local_space  = ^isl_local_space;
Pisl_printer  = ^isl_printer;
Pisl_space  = ^isl_space;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ISL_LOCAL_SPACE_H}
{$define ISL_LOCAL_SPACE_H}
{$include <isl/aff_type.h>}
{$include <isl/space_type.h>}
{$include <isl/printer.h>}
{$include <isl/map_type.h>}
{$if defined(__cplusplus)}
{$endif}
type
  Pisl_local_space = ^Tisl_local_space;
  Tisl_local_space = record
      {undefined structure}
    end;


function isl_local_space_get_ctx(ls:Pisl_local_space):Pisl_ctx;cdecl;external;
function isl_local_space_from_space(space:Pisl_space):Pisl_local_space;cdecl;external;
function isl_local_space_copy(ls:Pisl_local_space):Pisl_local_space;cdecl;external;
function isl_local_space_free(ls:Pisl_local_space):Pisl_local_space;cdecl;external;
function isl_local_space_is_params(ls:Pisl_local_space):Tisl_bool;cdecl;external;
function isl_local_space_is_set(ls:Pisl_local_space):Tisl_bool;cdecl;external;
function isl_local_space_set_tuple_id(ls:Pisl_local_space; _type:Tisl_dim_type; id:Pisl_id):Pisl_local_space;cdecl;external;
function isl_local_space_dim(ls:Pisl_local_space; _type:Tisl_dim_type):Tisl_size;cdecl;external;
function isl_local_space_has_dim_name(ls:Pisl_local_space; _type:Tisl_dim_type; pos:dword):Tisl_bool;cdecl;external;
(* Const before type ignored *)
function isl_local_space_get_dim_name(ls:Pisl_local_space; _type:Tisl_dim_type; pos:dword):Pchar;cdecl;external;
(* Const before type ignored *)
function isl_local_space_set_dim_name(ls:Pisl_local_space; _type:Tisl_dim_type; pos:dword; s:Pchar):Pisl_local_space;cdecl;external;
function isl_local_space_has_dim_id(ls:Pisl_local_space; _type:Tisl_dim_type; pos:dword):Tisl_bool;cdecl;external;
function isl_local_space_get_dim_id(ls:Pisl_local_space; _type:Tisl_dim_type; pos:dword):Pisl_id;cdecl;external;
function isl_local_space_set_dim_id(ls:Pisl_local_space; _type:Tisl_dim_type; pos:dword; id:Pisl_id):Pisl_local_space;cdecl;external;
function isl_local_space_get_space(ls:Pisl_local_space):Pisl_space;cdecl;external;
function isl_local_space_get_div(ls:Pisl_local_space; pos:longint):Pisl_aff;cdecl;external;
(* Const before type ignored *)
function isl_local_space_find_dim_by_name(ls:Pisl_local_space; _type:Tisl_dim_type; name:Pchar):longint;cdecl;external;
function isl_local_space_domain(ls:Pisl_local_space):Pisl_local_space;cdecl;external;
function isl_local_space_range(ls:Pisl_local_space):Pisl_local_space;cdecl;external;
function isl_local_space_from_domain(ls:Pisl_local_space):Pisl_local_space;cdecl;external;
function isl_local_space_add_dims(ls:Pisl_local_space; _type:Tisl_dim_type; n:dword):Pisl_local_space;cdecl;external;
function isl_local_space_drop_dims(ls:Pisl_local_space; _type:Tisl_dim_type; first:dword; n:dword):Pisl_local_space;cdecl;external;
function isl_local_space_insert_dims(ls:Pisl_local_space; _type:Tisl_dim_type; first:dword; n:dword):Pisl_local_space;cdecl;external;
function isl_local_space_set_from_params(ls:Pisl_local_space):Pisl_local_space;cdecl;external;
function isl_local_space_intersect(ls1:Pisl_local_space; ls2:Pisl_local_space):Pisl_local_space;cdecl;external;
function isl_local_space_wrap(ls:Pisl_local_space):Pisl_local_space;cdecl;external;
function isl_local_space_is_equal(ls1:Pisl_local_space; ls2:Pisl_local_space):Tisl_bool;cdecl;external;
function isl_local_space_lifting(ls:Pisl_local_space):Pisl_basic_map;cdecl;external;
function isl_local_space_flatten_domain(ls:Pisl_local_space):Pisl_local_space;cdecl;external;
function isl_local_space_flatten_range(ls:Pisl_local_space):Pisl_local_space;cdecl;external;
function isl_printer_print_local_space(p:Pisl_printer; ls:Pisl_local_space):Pisl_printer;cdecl;external;
procedure isl_local_space_dump(ls:Pisl_local_space);cdecl;external;
{$endif}

implementation


end.
