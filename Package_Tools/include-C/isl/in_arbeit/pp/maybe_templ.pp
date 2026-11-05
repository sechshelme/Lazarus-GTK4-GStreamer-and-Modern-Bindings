
unit maybe_templ;
interface

{
  Automatically converted by H2Pas 1.0.0 from maybe_templ.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    maybe_templ.h
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
Pisl_ast_expr  = ^isl_ast_expr;
Pisl_basic_set  = ^isl_basic_set;
Pisl_id  = ^isl_id;
Pisl_maybe_isl_ast_expr  = ^isl_maybe_isl_ast_expr;
Pisl_maybe_isl_basic_set  = ^isl_maybe_isl_basic_set;
Pisl_maybe_isl_id  = ^isl_maybe_isl_id;
Pisl_maybe_isl_pw_aff  = ^isl_maybe_isl_pw_aff;
Pisl_pw_aff  = ^isl_pw_aff;
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


implementation


end.
