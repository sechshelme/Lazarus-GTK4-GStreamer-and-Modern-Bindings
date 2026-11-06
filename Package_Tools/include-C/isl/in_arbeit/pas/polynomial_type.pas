unit polynomial_type;

interface

uses
  fp_isl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pisl_qpolynomial = type Pointer;
  PPisl_qpolynomial = ^Pisl_qpolynomial;
  Pisl_qpolynomial_list = type Pointer;
  Pisl_term = type Pointer;
  Pisl_pw_qpolynomial = type Pointer;
  Pisl_pw_qpolynomial_list = type Pointer;

type
  Tisl_fold = longint;
const
  isl_fold_error = -(1);
  isl_fold_min = (-(1)) + 1;
  isl_fold_max = (-(1)) + 2;
  isl_fold_list = (-(1)) + 3;

type
  Pisl_qpolynomial_fold = type Pointer;
  Pisl_pw_qpolynomial_fold = type Pointer;
  Pisl_pw_qpolynomial_fold_list = type Pointer;
  Pisl_union_pw_qpolynomial = type Pointer;
  Pisl_union_pw_qpolynomial_fold = type Pointer;

  // === Konventiert am: 5-11-26 15:51:32 ===


implementation



end.
