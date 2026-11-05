
unit union_map_type;
interface

{
  Automatically converted by H2Pas 1.0.0 from union_map_type.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    union_map_type.h
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
Pisl_union_map  = ^isl_union_map;
Pisl_union_map_list  = ^isl_union_map_list;
Pisl_union_set  = ^isl_union_set;
Pisl_union_set_list  = ^isl_union_set_list;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ISL_UNION_MAP_TYPE_H}
{$define ISL_UNION_MAP_TYPE_H}
{$include <isl/ctx.h>}
{$include <isl/list.h>}
{$if defined(__cplusplus)}
{$endif}
type
  Pisl_union_map = ^Tisl_union_map;
  Tisl_union_map = record
      {undefined structure}
    end;

  Pisl_union_map = ^Tisl_union_map;
  Tisl_union_map = record
      {undefined structure}
    end;

  Pisl_union_map_list = ^Tisl_union_map_list;
  Tisl_union_map_list = record
      {undefined structure}
    end;

{$ifndef isl_union_set}
type
  Pisl_union_set = ^Tisl_union_set;
  Tisl_union_set = record
      {undefined structure}
    end;

  Pisl_union_set = ^Tisl_union_set;
  Tisl_union_set = record
      {undefined structure}
    end;

  Pisl_union_set_list = ^Tisl_union_set_list;
  Tisl_union_set_list = record
      {undefined structure}
    end;

{$endif}
{$endif}

implementation


end.
