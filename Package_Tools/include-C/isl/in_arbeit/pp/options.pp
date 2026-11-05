
unit options;
interface

{
  Automatically converted by H2Pas 1.0.0 from options.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    options.h
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
Pisl_ctx  = ^isl_ctx;
Pisl_options  = ^isl_options;
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
{$ifndef ISL_OPTIONS_H}
{$define ISL_OPTIONS_H}
{$include <isl/arg.h>}
{$include <isl/ctx.h>}
{$if defined(__cplusplus)}
{$endif}
type
  Pisl_options = ^Tisl_options;
  Tisl_options = record
      {undefined structure}
    end;

{ xxxxxxxx ISL_ARG_DECL(isl_options, struct isl_options, isl_options_args) }
  var
    isl_options_args : Tisl_args;cvar;external;

function isl_options_new_with_defaults:Pisl_options;cdecl;external;
procedure isl_options_free(opt:Pisl_options);cdecl;external;
function isl_options_parse(opt:Pisl_options; argc:longint; argv:PPchar; flags:dword):longint;cdecl;external;
const
  ISL_BOUND_BERNSTEIN = 0;  
  ISL_BOUND_RANGE = 1;  

function isl_options_set_bound(ctx:Pisl_ctx; val:longint):Tisl_stat;cdecl;external;
function isl_options_get_bound(ctx:Pisl_ctx):longint;cdecl;external;
const
  ISL_ON_ERROR_WARN = 0;  
  ISL_ON_ERROR_CONTINUE = 1;  
  ISL_ON_ERROR_ABORT = 2;  

function isl_options_set_on_error(ctx:Pisl_ctx; val:longint):Tisl_stat;cdecl;external;
function isl_options_get_on_error(ctx:Pisl_ctx):longint;cdecl;external;
function isl_options_set_gbr_only_first(ctx:Pisl_ctx; val:longint):Tisl_stat;cdecl;external;
function isl_options_get_gbr_only_first(ctx:Pisl_ctx):longint;cdecl;external;
const
  ISL_SCHEDULE_ALGORITHM_ISL = 0;  
  ISL_SCHEDULE_ALGORITHM_FEAUTRIER = 1;  

function isl_options_set_schedule_algorithm(ctx:Pisl_ctx; val:longint):Tisl_stat;cdecl;external;
function isl_options_get_schedule_algorithm(ctx:Pisl_ctx):longint;cdecl;external;
function isl_options_set_pip_symmetry(ctx:Pisl_ctx; val:longint):Tisl_stat;cdecl;external;
function isl_options_get_pip_symmetry(ctx:Pisl_ctx):longint;cdecl;external;
function isl_options_set_coalesce_bounded_wrapping(ctx:Pisl_ctx; val:longint):Tisl_stat;cdecl;external;
function isl_options_get_coalesce_bounded_wrapping(ctx:Pisl_ctx):longint;cdecl;external;
function isl_options_set_coalesce_preserve_locals(ctx:Pisl_ctx; val:longint):Tisl_stat;cdecl;external;
function isl_options_get_coalesce_preserve_locals(ctx:Pisl_ctx):longint;cdecl;external;
{$endif}

implementation


end.
