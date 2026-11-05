unit polynomial_type;

interface

uses
  fp_isl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ISL_POLYNOMIAL_TYPE_H}
{$define ISL_POLYNOMIAL_TYPE_H}
{$include <isl/ctx.h>}
{$include <isl/list.h>}
type
  Pisl_qpolynomial = ^Tisl_qpolynomial;
  Tisl_qpolynomial = record
      {undefined structure}
    end;

  Pisl_qpolynomial = ^Tisl_qpolynomial;
  Tisl_qpolynomial = record
      {undefined structure}
    end;

  Pisl_qpolynomial_list = ^Tisl_qpolynomial_list;
  Tisl_qpolynomial_list = record
      {undefined structure}
    end;

  Pisl_term = ^Tisl_term;
  Tisl_term = record
      {undefined structure}
    end;

  Pisl_pw_qpolynomial = ^Tisl_pw_qpolynomial;
  Tisl_pw_qpolynomial = record
      {undefined structure}
    end;

  Pisl_pw_qpolynomial = ^Tisl_pw_qpolynomial;
  Tisl_pw_qpolynomial = record
      {undefined structure}
    end;

  Pisl_pw_qpolynomial_list = ^Tisl_pw_qpolynomial_list;
  Tisl_pw_qpolynomial_list = record
      {undefined structure}
    end;

  Tisl_fold =  Longint;
  Const
    isl_fold_error = -(1);
    isl_fold_min = (-(1))+1;
    isl_fold_max = (-(1))+2;
    isl_fold_list = (-(1))+3;

type
  Pisl_qpolynomial_fold = ^Tisl_qpolynomial_fold;
  Tisl_qpolynomial_fold = record
      {undefined structure}
    end;

  Pisl_pw_qpolynomial_fold = ^Tisl_pw_qpolynomial_fold;
  Tisl_pw_qpolynomial_fold = record
      {undefined structure}
    end;

  Pisl_pw_qpolynomial_fold = ^Tisl_pw_qpolynomial_fold;
  Tisl_pw_qpolynomial_fold = record
      {undefined structure}
    end;

  Pisl_pw_qpolynomial_fold_list = ^Tisl_pw_qpolynomial_fold_list;
  Tisl_pw_qpolynomial_fold_list = record
      {undefined structure}
    end;

  Pisl_union_pw_qpolynomial = ^Tisl_union_pw_qpolynomial;
  Tisl_union_pw_qpolynomial = record
      {undefined structure}
    end;

  Pisl_union_pw_qpolynomial_fold = ^Tisl_union_pw_qpolynomial_fold;
  Tisl_union_pw_qpolynomial_fold = record
      {undefined structure}
    end;

{$endif}

// === Konventiert am: 5-11-26 15:51:32 ===


implementation



end.
