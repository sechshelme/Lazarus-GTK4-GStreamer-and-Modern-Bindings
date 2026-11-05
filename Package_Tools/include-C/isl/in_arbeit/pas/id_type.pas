unit id_type;

interface

uses
  fp_isl;

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


// === Konventiert am: 5-11-26 15:28:52 ===


implementation



end.
