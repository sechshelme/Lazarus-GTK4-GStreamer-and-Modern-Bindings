
unit vec;
interface

{
  Automatically converted by H2Pas 1.0.0 from vec.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    vec.h
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
PFILE  = ^FILE;
Pisl_ctx  = ^isl_ctx;
Pisl_printer  = ^isl_printer;
Pisl_val  = ^isl_val;
Pisl_vec  = ^isl_vec;
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
{$ifndef ISL_VEC_H}
{$define ISL_VEC_H}
{$include <stdio.h>}
{$include <isl/ctx.h>}
{$include <isl/val_type.h>}
{$include <isl/printer.h>}
{$if defined(__cplusplus)}
{$endif}
type
  Pisl_vec = ^Tisl_vec;
  Tisl_vec = record
      {undefined structure}
    end;


function isl_vec_alloc(ctx:Pisl_ctx; size:dword):Pisl_vec;cdecl;external;
function isl_vec_zero(ctx:Pisl_ctx; size:dword):Pisl_vec;cdecl;external;
function isl_vec_copy(vec:Pisl_vec):Pisl_vec;cdecl;external;
function isl_vec_free(vec:Pisl_vec):Pisl_vec;cdecl;external;
function isl_vec_get_ctx(vec:Pisl_vec):Pisl_ctx;cdecl;external;
function isl_vec_size(vec:Pisl_vec):Tisl_size;cdecl;external;
function isl_vec_get_element_val(vec:Pisl_vec; pos:longint):Pisl_val;cdecl;external;
function isl_vec_set_element_si(vec:Pisl_vec; pos:longint; v:longint):Pisl_vec;cdecl;external;
function isl_vec_set_element_val(vec:Pisl_vec; pos:longint; v:Pisl_val):Pisl_vec;cdecl;external;
function isl_vec_is_equal(vec1:Pisl_vec; vec2:Pisl_vec):Tisl_bool;cdecl;external;
function isl_vec_cmp_element(vec1:Pisl_vec; vec2:Pisl_vec; pos:longint):longint;cdecl;external;
procedure isl_vec_dump(vec:Pisl_vec);cdecl;external;
function isl_printer_print_vec(printer:Pisl_printer; vec:Pisl_vec):Pisl_printer;cdecl;external;
function isl_vec_ceil(vec:Pisl_vec):Pisl_vec;cdecl;external;
function isl_vec_normalize(vec:Pisl_vec):Pisl_vec;cdecl;external;
function isl_vec_set_si(vec:Pisl_vec; v:longint):Pisl_vec;cdecl;external;
function isl_vec_set_val(vec:Pisl_vec; v:Pisl_val):Pisl_vec;cdecl;external;
function isl_vec_clr(vec:Pisl_vec):Pisl_vec;cdecl;external;
function isl_vec_neg(vec:Pisl_vec):Pisl_vec;cdecl;external;
function isl_vec_add(vec1:Pisl_vec; vec2:Pisl_vec):Pisl_vec;cdecl;external;
function isl_vec_extend(vec:Pisl_vec; size:dword):Pisl_vec;cdecl;external;
function isl_vec_zero_extend(vec:Pisl_vec; size:dword):Pisl_vec;cdecl;external;
function isl_vec_concat(vec1:Pisl_vec; vec2:Pisl_vec):Pisl_vec;cdecl;external;
function isl_vec_sort(vec:Pisl_vec):Pisl_vec;cdecl;external;
function isl_vec_read_from_file(ctx:Pisl_ctx; input:PFILE):Pisl_vec;cdecl;external;
function isl_vec_drop_els(vec:Pisl_vec; pos:dword; n:dword):Pisl_vec;cdecl;external;
function isl_vec_add_els(vec:Pisl_vec; n:dword):Pisl_vec;cdecl;external;
function isl_vec_insert_els(vec:Pisl_vec; pos:dword; n:dword):Pisl_vec;cdecl;external;
function isl_vec_insert_zero_els(vec:Pisl_vec; pos:dword; n:dword):Pisl_vec;cdecl;external;
function isl_vec_move_els(vec:Pisl_vec; dst_col:dword; src_col:dword; n:dword):Pisl_vec;cdecl;external;
{$endif}

implementation


end.
