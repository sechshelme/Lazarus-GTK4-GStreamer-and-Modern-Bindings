unit stream;

interface

uses
  fp_isl, ctx, val_type, obj, id_type, aff_type, map_type, polynomial_type, union_map_type, schedule_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tisl_token_type = longint;
const
  ISL_TOKEN_ERROR = -(1);
  ISL_TOKEN_UNKNOWN = 256;
  ISL_TOKEN_VALUE = 257;
  ISL_TOKEN_IDENT = 258;
  ISL_TOKEN_GE = 259;
  ISL_TOKEN_LE = 260;
  ISL_TOKEN_GT = 261;
  ISL_TOKEN_LT = 262;
  ISL_TOKEN_NE = 263;
  ISL_TOKEN_EQ_EQ = 264;
  ISL_TOKEN_LEX_GE = 265;
  ISL_TOKEN_LEX_LE = 266;
  ISL_TOKEN_LEX_GT = 267;
  ISL_TOKEN_LEX_LT = 268;
  ISL_TOKEN_TO = 269;
  ISL_TOKEN_AND = 270;
  ISL_TOKEN_OR = 271;
  ISL_TOKEN_EXISTS = 272;
  ISL_TOKEN_NOT = 273;
  ISL_TOKEN_DEF = 274;
  ISL_TOKEN_INFTY = 275;
  ISL_TOKEN_NAN = 276;
  ISL_TOKEN_MIN = 277;
  ISL_TOKEN_MAX = 278;
  ISL_TOKEN_RAT = 279;
  ISL_TOKEN_TRUE = 280;
  ISL_TOKEN_FALSE = 281;
  ISL_TOKEN_CEILD = 282;
  ISL_TOKEN_FLOORD = 283;
  ISL_TOKEN_MOD = 284;
  ISL_TOKEN_STRING = 285;
  ISL_TOKEN_MAP = 286;
  ISL_TOKEN_AFF = 287;
  ISL_TOKEN_CEIL = 288;
  ISL_TOKEN_FLOOR = 289;
  ISL_TOKEN_IMPLIES = 290;
  ISL_TOKEN_INT_DIV = 291;
  ISL_TOKEN_LAST = 292;

type
  Pisl_token = ^Tisl_token;
  Tisl_token = record
    {undefined structure}
  end;


function isl_token_get_val(ctx: Pisl_ctx; tok: Pisl_token): Pisl_val; cdecl; external libisl;
function isl_token_has_str(tok: Pisl_token): Tisl_bool; cdecl; external libisl;
function isl_token_get_str(ctx: Pisl_ctx; tok: Pisl_token): Pchar; cdecl; external libisl;
function isl_token_get_type(tok: Pisl_token): longint; cdecl; external libisl;
procedure isl_token_free(tok: Pisl_token); cdecl; external libisl;

type
  Pisl_stream = type Pointer;

function isl_stream_new_file(ctx: Pisl_ctx; file_: PFILE): Pisl_stream; cdecl; external libisl;
function isl_stream_new_str(ctx: Pisl_ctx; str: Pchar): Pisl_stream; cdecl; external libisl;
procedure isl_stream_free(s: Pisl_stream); cdecl; external libisl;
function isl_stream_get_ctx(s: Pisl_stream): Pisl_ctx; cdecl; external libisl;
procedure isl_stream_error(s: Pisl_stream; tok: Pisl_token; msg: Pchar); cdecl; external libisl;
function isl_stream_next_token(s: Pisl_stream): Pisl_token; cdecl; external libisl;
function isl_stream_next_token_on_same_line(s: Pisl_stream): Pisl_token; cdecl; external libisl;
function isl_stream_next_token_is(s: Pisl_stream; _type: longint): longint; cdecl; external libisl;
procedure isl_stream_push_token(s: Pisl_stream; tok: Pisl_token); cdecl; external libisl;
procedure isl_stream_flush_tokens(s: Pisl_stream); cdecl; external libisl;
function isl_stream_eat_if_available(s: Pisl_stream; _type: longint): longint; cdecl; external libisl;
function isl_stream_read_ident_if_available(s: Pisl_stream): Pchar; cdecl; external libisl;
function isl_stream_eat(s: Pisl_stream; _type: longint): longint; cdecl; external libisl;
function isl_stream_is_empty(s: Pisl_stream): longint; cdecl; external libisl;
function isl_stream_skip_line(s: Pisl_stream): longint; cdecl; external libisl;
function isl_stream_register_keyword(s: Pisl_stream; name: Pchar): Tisl_token_type; cdecl; external libisl;
function isl_stream_read_obj(s: Pisl_stream): Tisl_obj; cdecl; external libisl;
function isl_stream_read_id(s: Pisl_stream): Pisl_id; cdecl; external libisl;
function isl_stream_read_val(s: Pisl_stream): Pisl_val; cdecl; external libisl;
function isl_stream_read_multi_val(s: Pisl_stream): Pisl_multi_val; cdecl; external libisl;
function isl_stream_read_multi_aff(s: Pisl_stream): Pisl_multi_aff; cdecl; external libisl;
function isl_stream_read_map(s: Pisl_stream): Pisl_map; cdecl; external libisl;
function isl_stream_read_set(s: Pisl_stream): Pisl_set; cdecl; external libisl;
function isl_stream_read_basic_set(s: Pisl_stream): Pisl_basic_set; cdecl; external libisl;
function isl_stream_read_pw_qpolynomial(s: Pisl_stream): Pisl_pw_qpolynomial; cdecl; external libisl;
function isl_stream_read_union_set(s: Pisl_stream): Pisl_union_set; cdecl; external libisl;
function isl_stream_read_union_map(s: Pisl_stream): Pisl_union_map; cdecl; external libisl;
function isl_stream_read_schedule(s: Pisl_stream): Pisl_schedule; cdecl; external libisl;
function isl_stream_yaml_read_start_mapping(s: Pisl_stream): Tisl_stat; cdecl; external libisl;
function isl_stream_yaml_read_end_mapping(s: Pisl_stream): Tisl_stat; cdecl; external libisl;
function isl_stream_yaml_read_start_sequence(s: Pisl_stream): Tisl_stat; cdecl; external libisl;
function isl_stream_yaml_read_end_sequence(s: Pisl_stream): Tisl_stat; cdecl; external libisl;
function isl_stream_yaml_next(s: Pisl_stream): Tisl_bool; cdecl; external libisl;

// === Konventiert am: 5-11-26 15:57:35 ===


implementation



end.
