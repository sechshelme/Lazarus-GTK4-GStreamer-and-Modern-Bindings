unit val_type;

interface

uses
  fp_isl;

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

// === Konventiert am: 5-11-26 16:55:34 ===


implementation



end.
