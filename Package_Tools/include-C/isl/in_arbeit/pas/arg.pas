unit arg;

interface

uses
  fp_isl;

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
{$ifndef ISL_ARG_H}
{$define ISL_ARG_H}
{$include <stddef.h>}
{$include <stdlib.h>}
{$if defined(__cplusplus)}
{$endif}
type
  Pisl_arg_choice = ^Tisl_arg_choice;
  Tisl_arg_choice = record
      name : Pchar;
      value : dword;
    end;

  Pisl_arg_flags = ^Tisl_arg_flags;
  Tisl_arg_flags = record
      name : Pchar;
      mask : dword;
      value : dword;
    end;

  Tisl_arg_type =  Longint;
  Const
    isl_arg_end = 0;
    isl_arg_alias = 1;
    isl_arg_arg = 2;
    isl_arg_bool = 3;
    isl_arg_child = 4;
    isl_arg_choice = 5;
    isl_arg_flags = 6;
    isl_arg_footer = 7;
    isl_arg_int = 8;
    isl_arg_user = 9;
    isl_arg_long = 10;
    isl_arg_ulong = 11;
    isl_arg_str = 12;
    isl_arg_str_list = 13;
    isl_arg_version = 14;

type
  Pisl_args = ^Tisl_args;
  Tisl_args = record
      {undefined structure}
    end;


{ was #define dname def_expr }
function ISL_ARG_OFFSET_NONE : Tsize_t;  

const
  ISL_ARG_SINGLE_DASH = 1 shl 0;  
  ISL_ARG_BOOL_ARG = 1 shl 1;  
  ISL_ARG_HIDDEN = 1 shl 2;  
type
  Pisl_arg = ^Tisl_arg;
  Tisl_arg = record
      _type : Tisl_arg_type;
      short_name : char;
      long_name : Pchar;
      argument_name : Pchar;
      offset : Tsize_t;
      help_msg : Pchar;
      flags : dword;
      u : record
          case longint of
            0 : ( choice : record
                choice : Pisl_arg_choice;
                default_value : dword;
                default_selected : dword;
                set : function (opt:pointer; val:dword):longint;cdecl;
              end );
            1 : ( flags : record
                flags : Pisl_arg_flags;
                default_value : dword;
              end );
            2 : ( b : record
                default_value : dword;
                set : function (opt:pointer; val:dword):longint;cdecl;
              end );
            3 : ( i : record
                default_value : longint;
              end );
            4 : ( l : record
                default_value : longint;
                default_selected : longint;
                set : function (opt:pointer; val:longint):longint;cdecl;
              end );
            5 : ( ul : record
                default_value : dword;
              end );
            6 : ( str : record
                default_value : Pchar;
              end );
            7 : ( str_list : record
                offset_n : Tsize_t;
              end );
            8 : ( child : record
                child : Pisl_args;
              end );
            9 : ( version : record
                print_version : procedure ;cdecl;
              end );
            10 : ( user : record
                init : function (para1:pointer):longint;cdecl;
                clear : procedure (para1:pointer);cdecl;
              end );
          end;
    end;

  Pisl_args = ^Tisl_args;
  Tisl_args = record
      options_size : Tsize_t;
      args : Pisl_arg;
    end;


const
  ISL_ARG_ALL = 1 shl 0;  
  ISL_ARG_SKIP_HELP = 1 shl 1;  

procedure isl_args_set_defaults(args:Pisl_args; opt:pointer);cdecl;external libisl;
procedure isl_args_free(args:Pisl_args; opt:pointer);cdecl;external libisl;
function isl_args_parse(args:Pisl_args; argc:longint; argv:PPchar; opt:pointer; flags:dword):longint;cdecl;external libisl;

// === Konventiert am: 4-11-26 19:46:41 ===


implementation


{ was #define dname def_expr }
function ISL_ARG_OFFSET_NONE : Tsize_t;
  begin
    ISL_ARG_OFFSET_NONE:=Tsize_t(-(1));
  end;


end.
