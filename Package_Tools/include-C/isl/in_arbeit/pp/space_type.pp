
unit space_type;
interface

{
  Automatically converted by H2Pas 1.0.0 from space_type.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    space_type.h
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
Pisl_dim_type  = ^isl_dim_type;
Pisl_space  = ^isl_space;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ISL_SPACE_TYPE_H}
{$define ISL_SPACE_TYPE_H}
{$include <isl/ctx.h>}
{$if defined(__cplusplus)}
{$endif}
type
  Pisl_space = ^Tisl_space;
  Tisl_space = record
      {undefined structure}
    end;

  Tisl_dim_type =  Longint;
  Const
    isl_dim_cst = 0;
    isl_dim_param = 1;
    isl_dim_in = 2;
    isl_dim_out = 3;
    isl_dim_set = isl_dim_out;
    isl_dim_div = (isl_dim_out)+1;
    isl_dim_all = (isl_dim_out)+2;

{$endif}

implementation


end.
