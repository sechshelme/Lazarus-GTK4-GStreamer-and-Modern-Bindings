unit space_type;

interface

uses
  fp_isl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pisl_space = type Pointer;

type
  Tisl_dim_type = longint;

const
  isl_dim_cst = 0;
  isl_dim_param = 1;
  isl_dim_in = 2;
  isl_dim_out = 3;
  isl_dim_set = isl_dim_out;
  isl_dim_div = (isl_dim_out) + 1;
  isl_dim_all = (isl_dim_out) + 2;

  // === Konventiert am: 5-11-26 15:57:38 ===


implementation



end.
