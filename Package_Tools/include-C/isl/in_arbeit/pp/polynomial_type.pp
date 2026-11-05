
unit polynomial_type;
interface

{
  Automatically converted by H2Pas 1.0.0 from polynomial_type.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    polynomial_type.h
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
Pisl_fold  = ^isl_fold;
Pisl_pw_qpolynomial  = ^isl_pw_qpolynomial;
Pisl_pw_qpolynomial_fold  = ^isl_pw_qpolynomial_fold;
Pisl_pw_qpolynomial_fold_list  = ^isl_pw_qpolynomial_fold_list;
Pisl_pw_qpolynomial_list  = ^isl_pw_qpolynomial_list;
Pisl_qpolynomial  = ^isl_qpolynomial;
Pisl_qpolynomial_fold  = ^isl_qpolynomial_fold;
Pisl_qpolynomial_list  = ^isl_qpolynomial_list;
Pisl_term  = ^isl_term;
Pisl_union_pw_qpolynomial  = ^isl_union_pw_qpolynomial;
Pisl_union_pw_qpolynomial_fold  = ^isl_union_pw_qpolynomial_fold;
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

implementation


end.
