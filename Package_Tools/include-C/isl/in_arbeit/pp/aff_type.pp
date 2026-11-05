
unit aff_type;
interface

{
  Automatically converted by H2Pas 1.0.0 from aff_type.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    aff_type.h
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
Pisl_multi_aff  = ^isl_multi_aff;
Pisl_multi_pw_aff  = ^isl_multi_pw_aff;
Pisl_multi_union_pw_aff  = ^isl_multi_union_pw_aff;
Pisl_pw_aff  = ^isl_pw_aff;
Pisl_pw_aff_list  = ^isl_pw_aff_list;
Pisl_pw_multi_aff  = ^isl_pw_multi_aff;
Pisl_pw_multi_aff_list  = ^isl_pw_multi_aff_list;
Pisl_union_pw_aff  = ^isl_union_pw_aff;
Pisl_union_pw_aff_list  = ^isl_union_pw_aff_list;
Pisl_union_pw_multi_aff  = ^isl_union_pw_multi_aff;
Pisl_union_pw_multi_aff_list  = ^isl_union_pw_multi_aff_list;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ISL_AFF_TYPE_H}
{$define ISL_AFF_TYPE_H}
{$include <isl/list.h>}
{$if defined(__cplusplus)}
{$endif}
type
  Pisl_aff = ^Tisl_aff;
  Tisl_aff = record
      {undefined structure}
    end;

  Pisl_aff = ^Tisl_aff;
  Tisl_aff = record
      {undefined structure}
    end;

  Pisl_pw_aff = ^Tisl_pw_aff;
  Tisl_pw_aff = record
      {undefined structure}
    end;

  Pisl_pw_aff_list = ^Tisl_pw_aff_list;
  Tisl_pw_aff_list = record
      {undefined structure}
    end;

  Pisl_union_pw_aff = ^Tisl_union_pw_aff;
  Tisl_union_pw_aff = record
      {undefined structure}
    end;

  Pisl_union_pw_aff_list = ^Tisl_union_pw_aff_list;
  Tisl_union_pw_aff_list = record
      {undefined structure}
    end;

  Pisl_multi_aff = ^Tisl_multi_aff;
  Tisl_multi_aff = record
      {undefined structure}
    end;

  Pisl_pw_multi_aff = ^Tisl_pw_multi_aff;
  Tisl_pw_multi_aff = record
      {undefined structure}
    end;

  Pisl_pw_multi_aff = ^Tisl_pw_multi_aff;
  Tisl_pw_multi_aff = record
      {undefined structure}
    end;

  Pisl_pw_multi_aff_list = ^Tisl_pw_multi_aff_list;
  Tisl_pw_multi_aff_list = record
      {undefined structure}
    end;

  Pisl_union_pw_multi_aff = ^Tisl_union_pw_multi_aff;
  Tisl_union_pw_multi_aff = record
      {undefined structure}
    end;

  Pisl_union_pw_multi_aff = ^Tisl_union_pw_multi_aff;
  Tisl_union_pw_multi_aff = record
      {undefined structure}
    end;

  Pisl_union_pw_multi_aff_list = ^Tisl_union_pw_multi_aff_list;
  Tisl_union_pw_multi_aff_list = record
      {undefined structure}
    end;

  Pisl_multi_pw_aff = ^Tisl_multi_pw_aff;
  Tisl_multi_pw_aff = record
      {undefined structure}
    end;

  Pisl_multi_union_pw_aff = ^Tisl_multi_union_pw_aff;
  Tisl_multi_union_pw_aff = record
      {undefined structure}
    end;

{$endif}

implementation


end.
