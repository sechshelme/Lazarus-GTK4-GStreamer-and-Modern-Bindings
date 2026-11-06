unit maybe_templ;

interface

uses
  fp_isl, aff_type, map_type, ctx, id_type, ast_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pisl_maybe_isl_id = ^Tisl_maybe_isl_id;
  Tisl_maybe_isl_id = record
    valid: Tisl_bool;
    value: Pisl_id;
  end;

  Pisl_maybe_isl_ast_expr = ^Tisl_maybe_isl_ast_expr;
  Tisl_maybe_isl_ast_expr = record
    valid: Tisl_bool;
    value: Pisl_ast_expr;
  end;

  Pisl_maybe_isl_pw_aff = ^Tisl_maybe_isl_pw_aff;
  Tisl_maybe_isl_pw_aff = record
    valid: Tisl_bool;
    value: Pisl_pw_aff;
  end;

  Pisl_maybe_isl_basic_set = ^Tisl_maybe_isl_basic_set;
  Tisl_maybe_isl_basic_set = record
    valid: Tisl_bool;
    value: Pisl_basic_set;
  end;


  // === Konventiert am: 5-11-26 15:43:07 ===


implementation



end.
