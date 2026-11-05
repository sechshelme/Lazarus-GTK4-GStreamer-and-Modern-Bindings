unit aff_type;

interface

uses
  fp_isl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pisl_aff = type Pointer;
  Pisl_aff_list = type Pointer;
  Pisl_pw_aff = type Pointer;
  Pisl_pw_aff_list = type Pointer;
  Pisl_union_pw_aff = type Pointer;
  Pisl_union_pw_aff_list = type Pointer;
  Pisl_multi_aff = type Pointer;
  Pisl_pw_multi_aff = type Pointer;
  Pisl_pw_multi_aff_list = type Pointer;
  Pisl_union_pw_multi_aff = type Pointer;
  Pisl_union_pw_multi_aff_list = type Pointer;
  Pisl_multi_pw_aff = type Pointer;
  Pisl_multi_union_pw_aff = type Pointer;

  // === Konventiert am: 4-11-26 19:46:44 ===


implementation



end.
