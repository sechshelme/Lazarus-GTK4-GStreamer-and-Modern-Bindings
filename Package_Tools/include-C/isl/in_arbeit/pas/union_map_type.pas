unit union_map_type;

interface

uses
  fp_isl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pisl_union_map = type Pointer;
  PPisl_union_map = type Pointer;
  Pisl_union_map_list = type Pointer;
  Pisl_union_set = type Pointer;
  Pisl_union_set_list = type Pointer;

  // === Konventiert am: 5-11-26 16:53:22 ===


implementation



end.
