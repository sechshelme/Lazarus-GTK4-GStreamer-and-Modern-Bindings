
unit ctx;
interface

{
  Automatically converted by H2Pas 1.0.0 from ctx.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ctx.h
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
Pchar  = ^char;
Pisl_args  = ^isl_args;
Pisl_bool  = ^isl_bool;
Pisl_ctx  = ^isl_ctx;
Pisl_error  = ^isl_error;
Pisl_options  = ^isl_options;
Pisl_size  = ^isl_size;
Pisl_stat  = ^isl_stat;
Pisl_stats  = ^isl_stats;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2008-2009 Katholieke Universiteit Leuven
 *
 * Use of this software is governed by the MIT license
 *
 * Written by Sven Verdoolaege, K.U.Leuven, Departement
 * Computerwetenschappen, Celestijnenlaan 200A, B-3001 Leuven, Belgium
  }
{$ifndef ISL_CTX_H}
{$define ISL_CTX_H}
{$include <stdio.h>}
{$include <stdlib.h>}
{$include <isl/arg.h>}
type
  Pisl_stats = ^Tisl_stats;
  Tisl_stats = record
      gbr_solved_lps : longint;
    end;

  Tisl_error =  Longint;
  Const
    isl_error_none = 0;
    isl_error_abort = 1;
    isl_error_alloc = 2;
    isl_error_unknown = 3;
    isl_error_internal = 4;
    isl_error_invalid = 5;
    isl_error_quota = 6;
    isl_error_unsupported = 7;

type
  Pisl_stat = ^Tisl_stat;
  Tisl_stat =  Longint;
  Const
    isl_stat_error = -(1);
    isl_stat_ok = 0;
;

function isl_stat_non_null(obj:pointer):Tisl_stat;cdecl;external;
type
  Pisl_bool = ^Tisl_bool;
  Tisl_bool =  Longint;
  Const
    isl_bool_error = -(1);
    isl_bool_false = 0;
    isl_bool_true = 1;
;

function isl_bool_not(b:Tisl_bool):Tisl_bool;cdecl;external;
function isl_bool_ok(b:longint):Tisl_bool;cdecl;external;
type
  Pisl_size = ^Tisl_size;
  Tisl_size = longint;

{ was #define dname def_expr }
function isl_size_error : longint;  

type
  Pisl_ctx = ^Tisl_ctx;
  Tisl_ctx = record
      {undefined structure}
    end;

{ Some helper macros  }

function isl_malloc_or_die(ctx:Pisl_ctx; size:Tsize_t):pointer;cdecl;external;
function isl_calloc_or_die(ctx:Pisl_ctx; nmemb:Tsize_t; size:Tsize_t):pointer;cdecl;external;
function isl_realloc_or_die(ctx:Pisl_ctx; ptr:pointer; size:Tsize_t):pointer;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure isl_handle_error(ctx:Pisl_ctx; error:Tisl_error; msg:Pchar; file:Pchar; line:longint);cdecl;external;
{ struct isl_ctx functions  }
function isl_ctx_options(ctx:Pisl_ctx):Pisl_options;cdecl;external;
function isl_ctx_alloc_with_options(args:Pisl_args; opt:pointer):Pisl_ctx;cdecl;external;
function isl_ctx_alloc:Pisl_ctx;cdecl;external;
function isl_ctx_peek_options(ctx:Pisl_ctx; args:Pisl_args):pointer;cdecl;external;
function isl_ctx_parse_options(ctx:Pisl_ctx; argc:longint; argv:PPchar; flags:dword):longint;cdecl;external;
procedure isl_ctx_ref(ctx:Pisl_ctx);cdecl;external;
procedure isl_ctx_deref(ctx:Pisl_ctx);cdecl;external;
procedure isl_ctx_free(ctx:Pisl_ctx);cdecl;external;
procedure isl_ctx_abort(ctx:Pisl_ctx);cdecl;external;
procedure isl_ctx_resume(ctx:Pisl_ctx);cdecl;external;
function isl_ctx_aborted(ctx:Pisl_ctx):longint;cdecl;external;
procedure isl_ctx_set_max_operations(ctx:Pisl_ctx; max_operations:dword);cdecl;external;
function isl_ctx_get_max_operations(ctx:Pisl_ctx):dword;cdecl;external;
procedure isl_ctx_reset_operations(ctx:Pisl_ctx);cdecl;external;
function isl_ctx_last_error(ctx:Pisl_ctx):Tisl_error;cdecl;external;
(* Const before type ignored *)
function isl_ctx_last_error_msg(ctx:Pisl_ctx):Pchar;cdecl;external;
(* Const before type ignored *)
function isl_ctx_last_error_file(ctx:Pisl_ctx):Pchar;cdecl;external;
function isl_ctx_last_error_line(ctx:Pisl_ctx):longint;cdecl;external;
procedure isl_ctx_reset_error(ctx:Pisl_ctx);cdecl;external;
procedure isl_ctx_set_error(ctx:Pisl_ctx; error:Tisl_error);cdecl;external;

implementation

{ was #define dname def_expr }
function isl_size_error : longint;
  begin
    isl_size_error:=longint(-(1));
  end;


end.
