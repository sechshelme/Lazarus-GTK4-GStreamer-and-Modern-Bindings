
unit point;
interface

{
  Automatically converted by H2Pas 1.0.0 from point.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    point.h
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
Pisl_multi_val  = ^isl_multi_val;
Pisl_point  = ^isl_point;
Pisl_printer  = ^isl_printer;
Pisl_space  = ^isl_space;
Pisl_val  = ^isl_val;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ISL_POINT_H}
{$define ISL_POINT_H}
{$include <stdio.h>}
{$include <isl/space_type.h>}
{$include <isl/val_type.h>}
{$if defined(__cplusplus)}
{$endif}
type
  Pisl_point = ^Tisl_point;
  Tisl_point = record
      {undefined structure}
    end;


function isl_point_get_ctx(pnt:Pisl_point):Pisl_ctx;cdecl;external;
function isl_point_get_space(pnt:Pisl_point):Pisl_space;cdecl;external;
function isl_point_zero(space:Pisl_space):Pisl_point;cdecl;external;
function isl_point_copy(pnt:Pisl_point):Pisl_point;cdecl;external;
function isl_point_free(pnt:Pisl_point):Pisl_point;cdecl;external;
function isl_point_get_coordinate_val(pnt:Pisl_point; _type:Tisl_dim_type; pos:longint):Pisl_val;cdecl;external;
function isl_point_set_coordinate_val(pnt:Pisl_point; _type:Tisl_dim_type; pos:longint; v:Pisl_val):Pisl_point;cdecl;external;
function isl_point_get_multi_val(pnt:Pisl_point):Pisl_multi_val;cdecl;external;
function isl_point_add_ui(pnt:Pisl_point; _type:Tisl_dim_type; pos:longint; val:dword):Pisl_point;cdecl;external;
function isl_point_sub_ui(pnt:Pisl_point; _type:Tisl_dim_type; pos:longint; val:dword):Pisl_point;cdecl;external;
function isl_point_void(space:Pisl_space):Pisl_point;cdecl;external;
function isl_point_is_void(pnt:Pisl_point):Tisl_bool;cdecl;external;
function isl_printer_print_point(printer:Pisl_printer; pnt:Pisl_point):Pisl_printer;cdecl;external;
function isl_point_to_str(pnt:Pisl_point):Pchar;cdecl;external;
procedure isl_point_dump(pnt:Pisl_point);cdecl;external;
{$endif}

implementation


end.
