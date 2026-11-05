unit union_map_type;

interface

uses
  fp_isl;

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

// === Konventiert am: 5-11-26 16:53:22 ===


implementation



end.
