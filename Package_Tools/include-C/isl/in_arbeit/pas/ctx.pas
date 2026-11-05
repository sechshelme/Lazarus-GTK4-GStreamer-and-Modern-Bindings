unit ctx;

interface

uses
  fp_isl, arg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pisl_stats = ^Tisl_stats;
  Tisl_stats = record
    gbr_solved_lps: longint;
  end;

type
  Tisl_error = longint;

const
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
  Tisl_stat = longint;

const
  isl_stat_error = -(1);
  isl_stat_ok = 0;

function isl_stat_non_null(obj: pointer): Tisl_stat; cdecl; external libisl;

type
  Pisl_bool = ^Tisl_bool;
  Tisl_bool = longint;

const
  isl_bool_error = -(1);
  isl_bool_false = 0;
  isl_bool_true = 1;

function isl_bool_not(b: Tisl_bool): Tisl_bool; cdecl; external libisl;
function isl_bool_ok(b: longint): Tisl_bool; cdecl; external libisl;

type
  Pisl_size = ^Tisl_size;
  Tisl_size = longint;

const
  isl_size_error = -1;

type
  Pisl_ctx = type Pointer;

function isl_malloc_or_die(ctx: Pisl_ctx; size: Tsize_t): pointer; cdecl; external libisl;
function isl_calloc_or_die(ctx: Pisl_ctx; nmemb: Tsize_t; size: Tsize_t): pointer; cdecl; external libisl;
function isl_realloc_or_die(ctx: Pisl_ctx; ptr: pointer; size: Tsize_t): pointer; cdecl; external libisl;
procedure isl_handle_error(ctx: Pisl_ctx; error: Tisl_error; msg: Pchar; file_: Pchar; line: longint); cdecl; external libisl;
function isl_ctx_options(ctx: Pisl_ctx): Pisl_options; cdecl; external libisl;
function isl_ctx_alloc_with_options(args: Pisl_args; opt: pointer): Pisl_ctx; cdecl; external libisl;
function isl_ctx_alloc: Pisl_ctx; cdecl; external libisl;
function isl_ctx_peek_options(ctx: Pisl_ctx; args: Pisl_args): pointer; cdecl; external libisl;
function isl_ctx_parse_options(ctx: Pisl_ctx; argc: longint; argv: PPchar; flags: dword): longint; cdecl; external libisl;
procedure isl_ctx_ref(ctx: Pisl_ctx); cdecl; external libisl;
procedure isl_ctx_deref(ctx: Pisl_ctx); cdecl; external libisl;
procedure isl_ctx_free(ctx: Pisl_ctx); cdecl; external libisl;
procedure isl_ctx_abort(ctx: Pisl_ctx); cdecl; external libisl;
procedure isl_ctx_resume(ctx: Pisl_ctx); cdecl; external libisl;
function isl_ctx_aborted(ctx: Pisl_ctx): longint; cdecl; external libisl;
procedure isl_ctx_set_max_operations(ctx: Pisl_ctx; max_operations: dword); cdecl; external libisl;
function isl_ctx_get_max_operations(ctx: Pisl_ctx): dword; cdecl; external libisl;
procedure isl_ctx_reset_operations(ctx: Pisl_ctx); cdecl; external libisl;
function isl_ctx_last_error(ctx: Pisl_ctx): Tisl_error; cdecl; external libisl;
function isl_ctx_last_error_msg(ctx: Pisl_ctx): Pchar; cdecl; external libisl;
function isl_ctx_last_error_file(ctx: Pisl_ctx): Pchar; cdecl; external libisl;
function isl_ctx_last_error_line(ctx: Pisl_ctx): longint; cdecl; external libisl;
procedure isl_ctx_reset_error(ctx: Pisl_ctx); cdecl; external libisl;
procedure isl_ctx_set_error(ctx: Pisl_ctx; error: Tisl_error); cdecl; external libisl;

// === Konventiert am: 4-11-26 20:16:55 ===


implementation


end.
