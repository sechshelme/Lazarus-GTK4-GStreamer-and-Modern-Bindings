
unit val_type;
interface

{
  Automatically converted by H2Pas 1.0.0 from val_type.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    val_type.h
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
Pisl_multi_val  = ^isl_multi_val;
Pisl_val  = ^isl_val;
Pisl_val_list  = ^isl_val_list;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ISL_VAL_TYPE_H}
{$define ISL_VAL_TYPE_H}
{$include <isl/list.h>}
{$if defined(__cplusplus)}
{$endif}
type
  Pisl_val = ^Tisl_val;
  Tisl_val = record
      {undefined structure}
    end;

  Pisl_val = ^Tisl_val;
  Tisl_val = record
      {undefined structure}
    end;

  Pisl_val_list = ^Tisl_val_list;
  Tisl_val_list = record
      {undefined structure}
    end;

  Pisl_multi_val = ^Tisl_multi_val;
  Tisl_multi_val = record
      {undefined structure}
    end;

{$endif}

implementation


end.
