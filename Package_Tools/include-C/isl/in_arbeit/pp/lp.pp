
unit lp;
interface

{
  Automatically converted by H2Pas 1.0.0 from lp.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lp.h
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
Pisl_basic_set  = ^isl_basic_set;
Pisl_lp_result  = ^isl_lp_result;
Pisl_val  = ^isl_val;
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
{$ifndef ISL_LP_H}
{$define ISL_LP_H}
{$include <isl/aff.h>}
{$include <isl/val_type.h>}
{$include <isl/set_type.h>}
type
  Tisl_lp_result =  Longint;
  Const
    isl_lp_error = -(1);
    isl_lp_ok = 0;
    isl_lp_unbounded = 1;
    isl_lp_empty = 2;

{$if defined(__cplusplus)}
{$endif}

function isl_basic_set_min_lp_val(bset:Pisl_basic_set; obj:Pisl_aff):Pisl_val;cdecl;external;
function isl_basic_set_max_lp_val(bset:Pisl_basic_set; obj:Pisl_aff):Pisl_val;cdecl;external;
{$endif}

implementation


end.
