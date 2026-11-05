
unit stride_info;
interface

{
  Automatically converted by H2Pas 1.0.0 from stride_info.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    stride_info.h
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
Pisl_aff  = ^isl_aff;
Pisl_ctx  = ^isl_ctx;
Pisl_stride_info  = ^isl_stride_info;
Pisl_val  = ^isl_val;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Use of this software is governed by the MIT license
  }
{$ifndef ISL_STRIDE_INFO_H}
{$define ISL_STRIDE_INFO_H}
{$include <isl/val_type.h>}
{$include <isl/aff_type.h>}
{$if defined(__cplusplus)}
{$endif}
type
  Pisl_stride_info = ^Tisl_stride_info;
  Tisl_stride_info = record
      {undefined structure}
    end;


function isl_stride_info_get_ctx(si:Pisl_stride_info):Pisl_ctx;cdecl;external;
function isl_stride_info_get_stride(si:Pisl_stride_info):Pisl_val;cdecl;external;
function isl_stride_info_get_offset(si:Pisl_stride_info):Pisl_aff;cdecl;external;
function isl_stride_info_free(si:Pisl_stride_info):Pisl_stride_info;cdecl;external;
function isl_stride_info_copy(si:Pisl_stride_info):Pisl_stride_info;cdecl;external;
{$endif}

implementation


end.
