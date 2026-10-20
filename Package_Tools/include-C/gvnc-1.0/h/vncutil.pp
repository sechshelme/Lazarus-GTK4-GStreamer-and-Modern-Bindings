
unit vncutil;
interface

{
  Automatically converted by H2Pas 1.0.0 from vncutil.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    vncutil.h
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
Pgchar  = ^gchar;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GTK VNC Widget
 *
 * Copyright (C) 2010 Daniel P. Berrange <dan@berrange.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.0 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301 USA
  }
{$ifndef VNC_UTIL_H}
{$define VNC_UTIL_H}
{$include <glib.h>}

procedure vnc_util_set_debug(enabled:Tgboolean);cdecl;external;
function vnc_util_get_debug:Tgboolean;cdecl;external;
function vnc_util_get_version:Tgint;cdecl;external;
(* Const before type ignored *)
function vnc_util_get_version_string:Pgchar;cdecl;external;
function vnc_util_check_version(major:Tgint; minor:Tgint; micro:Tgint):Tgboolean;cdecl;external;
{ For normal VncXXXClass structs  }
const
  VNC_PADDING = 4;  
{ For very extensible VncXXXClass structs  }
  VNC_PADDING_LARGE = 20;  
{$endif}
{ VNC_UTIL_H  }

implementation


end.
