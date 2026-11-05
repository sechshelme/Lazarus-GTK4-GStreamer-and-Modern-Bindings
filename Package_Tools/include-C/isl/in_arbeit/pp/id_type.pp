
unit id_type;
interface

{
  Automatically converted by H2Pas 1.0.0 from id_type.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    id_type.h
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
Pisl_id  = ^isl_id;
Pisl_id_list  = ^isl_id_list;
Pisl_multi_id  = ^isl_multi_id;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ISL_ID_TYPE_H}
{$define ISL_ID_TYPE_H}
{$include <isl/list.h>}
{$if defined(__cplusplus)}
{$endif}
type
  Pisl_id = ^Tisl_id;
  Tisl_id = record
      {undefined structure}
    end;

  Pisl_id = ^Tisl_id;
  Tisl_id = record
      {undefined structure}
    end;

  Pisl_id_list = ^Tisl_id_list;
  Tisl_id_list = record
      {undefined structure}
    end;

  Pisl_multi_id = ^Tisl_multi_id;
  Tisl_multi_id = record
      {undefined structure}
    end;


implementation


end.
