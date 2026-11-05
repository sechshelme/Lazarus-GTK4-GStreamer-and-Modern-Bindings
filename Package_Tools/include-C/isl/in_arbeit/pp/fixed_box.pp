
unit fixed_box;
interface

{
  Automatically converted by H2Pas 1.0.0 from fixed_box.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    fixed_box.h
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
Pisl_fixed_box  = ^isl_fixed_box;
Pisl_multi_aff  = ^isl_multi_aff;
Pisl_multi_val  = ^isl_multi_val;
Pisl_printer  = ^isl_printer;
Pisl_space  = ^isl_space;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Use of this software is governed by the MIT license
  }
{$ifndef ISL_FIXED_BOX_H}
{$define ISL_FIXED_BOX_H}
{$include <isl/ctx.h>}
{$include <isl/val_type.h>}
{$include <isl/space_type.h>}
{$include <isl/aff_type.h>}
{$if defined(__cplusplus)}
{$endif}
type
  Pisl_fixed_box = ^Tisl_fixed_box;
  Tisl_fixed_box = record
      {undefined structure}
    end;


function isl_fixed_box_get_ctx(box:Pisl_fixed_box):Pisl_ctx;cdecl;external;
function isl_fixed_box_get_space(box:Pisl_fixed_box):Pisl_space;cdecl;external;
function isl_fixed_box_is_valid(box:Pisl_fixed_box):Tisl_bool;cdecl;external;
function isl_fixed_box_get_offset(box:Pisl_fixed_box):Pisl_multi_aff;cdecl;external;
function isl_fixed_box_get_size(box:Pisl_fixed_box):Pisl_multi_val;cdecl;external;
function isl_fixed_box_copy(box:Pisl_fixed_box):Pisl_fixed_box;cdecl;external;
function isl_fixed_box_free(box:Pisl_fixed_box):Pisl_fixed_box;cdecl;external;
(* Const before type ignored *)
function isl_fixed_box_read_from_str(ctx:Pisl_ctx; str:Pchar):Pisl_fixed_box;cdecl;external;
function isl_printer_print_fixed_box(p:Pisl_printer; box:Pisl_fixed_box):Pisl_printer;cdecl;external;
function isl_fixed_box_to_str(box:Pisl_fixed_box):Pchar;cdecl;external;
procedure isl_fixed_box_dump(box:Pisl_fixed_box);cdecl;external;
{$endif}

implementation


end.
