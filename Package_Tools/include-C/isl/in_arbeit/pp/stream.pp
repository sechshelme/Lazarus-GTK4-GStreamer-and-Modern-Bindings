
unit stream;
interface

{
  Automatically converted by H2Pas 1.0.0 from stream.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    stream.h
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
PFILE  = ^FILE;
Pisl_basic_set  = ^isl_basic_set;
Pisl_ctx  = ^isl_ctx;
Pisl_id  = ^isl_id;
Pisl_map  = ^isl_map;
Pisl_multi_aff  = ^isl_multi_aff;
Pisl_multi_val  = ^isl_multi_val;
Pisl_pw_qpolynomial  = ^isl_pw_qpolynomial;
Pisl_schedule  = ^isl_schedule;
Pisl_set  = ^isl_set;
Pisl_stream  = ^isl_stream;
Pisl_token  = ^isl_token;
Pisl_token_type  = ^isl_token_type;
Pisl_union_map  = ^isl_union_map;
Pisl_union_set  = ^isl_union_set;
Pisl_val  = ^isl_val;
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
{$ifndef ISL_STREAM_H}
{$define ISL_STREAM_H}
{$include <stdio.h>}
{$include <isl/hash.h>}
{$include <isl/aff_type.h>}
{$include <isl/obj.h>}
{$include <isl/val_type.h>}
{$include <isl/schedule_type.h>}
{$if defined(__cplusplus)}
{$endif}
type
  Tisl_token_type =  Longint;
  Const
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


function isl_token_get_val(ctx:Pisl_ctx; tok:Pisl_token):Pisl_val;cdecl;external;
function isl_token_has_str(tok:Pisl_token):Tisl_bool;cdecl;external;
function isl_token_get_str(ctx:Pisl_ctx; tok:Pisl_token):Pchar;cdecl;external;
function isl_token_get_type(tok:Pisl_token):longint;cdecl;external;
procedure isl_token_free(tok:Pisl_token);cdecl;external;
type
  Pisl_stream = ^Tisl_stream;
  Tisl_stream = record
      {undefined structure}
    end;


function isl_stream_new_file(ctx:Pisl_ctx; file:PFILE):Pisl_stream;cdecl;external;
(* Const before type ignored *)
function isl_stream_new_str(ctx:Pisl_ctx; str:Pchar):Pisl_stream;cdecl;external;
procedure isl_stream_free(s:Pisl_stream);cdecl;external;
function isl_stream_get_ctx(s:Pisl_stream):Pisl_ctx;cdecl;external;
procedure isl_stream_error(s:Pisl_stream; tok:Pisl_token; msg:Pchar);cdecl;external;
function isl_stream_next_token(s:Pisl_stream):Pisl_token;cdecl;external;
function isl_stream_next_token_on_same_line(s:Pisl_stream):Pisl_token;cdecl;external;
function isl_stream_next_token_is(s:Pisl_stream; _type:longint):longint;cdecl;external;
procedure isl_stream_push_token(s:Pisl_stream; tok:Pisl_token);cdecl;external;
procedure isl_stream_flush_tokens(s:Pisl_stream);cdecl;external;
function isl_stream_eat_if_available(s:Pisl_stream; _type:longint):longint;cdecl;external;
function isl_stream_read_ident_if_available(s:Pisl_stream):Pchar;cdecl;external;
function isl_stream_eat(s:Pisl_stream; _type:longint):longint;cdecl;external;
function isl_stream_is_empty(s:Pisl_stream):longint;cdecl;external;
function isl_stream_skip_line(s:Pisl_stream):longint;cdecl;external;
(* Const before type ignored *)
function isl_stream_register_keyword(s:Pisl_stream; name:Pchar):Tisl_token_type;cdecl;external;
function isl_stream_read_obj(s:Pisl_stream):Tisl_obj;cdecl;external;
function isl_stream_read_id(s:Pisl_stream):Pisl_id;cdecl;external;
function isl_stream_read_val(s:Pisl_stream):Pisl_val;cdecl;external;
function isl_stream_read_multi_val(s:Pisl_stream):Pisl_multi_val;cdecl;external;
function isl_stream_read_multi_aff(s:Pisl_stream):Pisl_multi_aff;cdecl;external;
function isl_stream_read_map(s:Pisl_stream):Pisl_map;cdecl;external;
function isl_stream_read_set(s:Pisl_stream):Pisl_set;cdecl;external;
function isl_stream_read_basic_set(s:Pisl_stream):Pisl_basic_set;cdecl;external;
function isl_stream_read_pw_qpolynomial(s:Pisl_stream):Pisl_pw_qpolynomial;cdecl;external;
function isl_stream_read_union_set(s:Pisl_stream):Pisl_union_set;cdecl;external;
function isl_stream_read_union_map(s:Pisl_stream):Pisl_union_map;cdecl;external;
function isl_stream_read_schedule(s:Pisl_stream):Pisl_schedule;cdecl;external;
function isl_stream_yaml_read_start_mapping(s:Pisl_stream):Tisl_stat;cdecl;external;
function isl_stream_yaml_read_end_mapping(s:Pisl_stream):Tisl_stat;cdecl;external;
function isl_stream_yaml_read_start_sequence(s:Pisl_stream):Tisl_stat;cdecl;external;
function isl_stream_yaml_read_end_sequence(s:Pisl_stream):Tisl_stat;cdecl;external;
function isl_stream_yaml_next(s:Pisl_stream):Tisl_bool;cdecl;external;
{$endif}

implementation


end.
