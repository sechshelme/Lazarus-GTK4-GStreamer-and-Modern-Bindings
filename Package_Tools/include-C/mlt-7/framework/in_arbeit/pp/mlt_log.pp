
unit mlt_log;
interface

{
  Automatically converted by H2Pas 1.0.0 from mlt_log.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mlt_log.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file mlt_log.h
 * \brief logging functions
 *
 * Copyright (C) 2004-2014 Meltytech, LLC
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
  }
{$ifndef MLT_LOG_H}
{$define MLT_LOG_H}
{$include <stdarg.h>}
{$include <stdint.h>}

const
  MLT_LOG_QUIET = -(8);  
{*
 * something went really wrong and we will crash now
  }
  MLT_LOG_PANIC = 0;  
{*
 * something went wrong and recovery is not possible
 * like no header in a format which depends on it or a combination
 * of parameters which are not allowed
  }
  MLT_LOG_FATAL = 8;  
{*
 * something went wrong and cannot losslessly be recovered
 * but not all future data is affected
  }
  MLT_LOG_ERROR = 16;  
{*
 * something somehow does not look correct / something which may or may not
 * lead to some problems
  }
  MLT_LOG_WARNING = 24;  
  MLT_LOG_INFO = 32;  
  MLT_LOG_VERBOSE = 40;  
  MLT_LOG_TIMINGS = 44;  
{*
 * stuff which is only useful for MLT developers
  }
  MLT_LOG_DEBUG = 48;  
(* Const before type ignored *)

procedure mlt_log(service:pointer; level:longint; fmt:Pchar; args:array of const);cdecl;external;
procedure mlt_log(service:pointer; level:longint; fmt:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mlt_vlog(service:pointer; level:longint; fmt:Pchar; para4:Tva_list);cdecl;external;
function mlt_log_get_level:longint;cdecl;external;
procedure mlt_log_set_level(para1:longint);cdecl;external;
{void mlt_log_set_callback(void (*)(void *, int, const char *, va_list)); }
{$include <stdarg.h>}
{typedef void (*mlt_log_callback_t)(void *p, int i, const char * c, va_list); }
{void mlt_log_set_callback(mlt_log_callback_t callback); }

function mlt_log_timings_now:Tint64_t;cdecl;external;
{$endif}
{ MLT_LOG_H  }

implementation


end.
