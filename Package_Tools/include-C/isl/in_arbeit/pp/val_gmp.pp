
unit val_gmp;
interface

{
  Automatically converted by H2Pas 1.0.0 from val_gmp.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    val_gmp.h
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
Pisl_ctx  = ^isl_ctx;
Pisl_val  = ^isl_val;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ISL_VAL_GMP_H}
{$define ISL_VAL_GMP_H}
{$include <gmp.h>}
{$include <isl/val_type.h>}
{$if defined(__cplusplus)}
{$endif}

function isl_val_int_from_gmp(ctx:Pisl_ctx; z:Tmpz_t):Pisl_val;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function isl_val_from_gmp(ctx:Pisl_ctx; n:Tmpz_t; d:Tmpz_t):Pisl_val;cdecl;external;
function isl_val_get_num_gmp(v:Pisl_val; z:Tmpz_t):longint;cdecl;external;
function isl_val_get_den_gmp(v:Pisl_val; z:Tmpz_t):longint;cdecl;external;
{$endif}

implementation


end.
