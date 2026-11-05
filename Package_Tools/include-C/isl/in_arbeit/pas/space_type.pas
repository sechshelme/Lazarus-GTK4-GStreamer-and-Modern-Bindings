unit space_type;

interface

uses
  fp_isl;

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

// === Konventiert am: 5-11-26 15:57:38 ===


implementation



end.
