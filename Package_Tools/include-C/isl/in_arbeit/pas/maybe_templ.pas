unit maybe_templ;

interface

uses
  fp_isl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$include <isl/ctx.h>}
{$include <isl/maybe.h>}
{ xxxxxxxxxxxx
struct ISL_MAYBE(ISL_TYPE) 
	isl_bool	valid;
	ISL_TYPE	*value;
;
typedef struct ISL_MAYBE(ISL_TYPE) ISL_MAYBE(ISL_TYPE);

  }
{ Ist isl_bool_true, wenn der Key existierte }
{ Der gefundene Wert (oder NULL) }
type
  Pisl_maybe_isl_id = ^Tisl_maybe_isl_id;
  Tisl_maybe_isl_id = record
      valid : Tisl_bool;
      value : Pisl_id;
    end;

  Pisl_maybe_isl_ast_expr = ^Tisl_maybe_isl_ast_expr;
  Tisl_maybe_isl_ast_expr = record
      valid : Tisl_bool;
      value : Pisl_ast_expr;
    end;

  Pisl_maybe_isl_pw_aff = ^Tisl_maybe_isl_pw_aff;
  Tisl_maybe_isl_pw_aff = record
      valid : Tisl_bool;
      value : Pisl_pw_aff;
    end;

{ Ist isl_bool_true, wenn der Key existierte }
{ Zeiger auf das gefundene Basic Set }
  Pisl_maybe_isl_basic_set = ^Tisl_maybe_isl_basic_set;
  Tisl_maybe_isl_basic_set = record
      valid : Tisl_bool;
      value : Pisl_basic_set;
    end;


// === Konventiert am: 5-11-26 15:43:07 ===


implementation



end.
