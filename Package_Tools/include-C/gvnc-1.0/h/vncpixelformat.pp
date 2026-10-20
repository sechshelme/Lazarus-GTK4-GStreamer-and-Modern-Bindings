
unit vncpixelformat;
interface

{
  Automatically converted by H2Pas 1.0.0 from vncpixelformat.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    vncpixelformat.h
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
PVncPixelFormat  = ^VncPixelFormat;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GTK VNC Widget
 *
 * Copyright (C) 2006  Anthony Liguori <anthony@codemonkey.ws>
 * Copyright (C) 2009-2010 Daniel P. Berrange <dan@berrange.com>
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
{$ifndef VNC_PIXEL_FORMAT_H}
{$define VNC_PIXEL_FORMAT_H}
{$include <glib.h>}
{$include <glib-object.h>}

{ was #define dname def_expr }
function VNC_TYPE_PIXEL_FORMAT : longint; { return type might be wrong }

type
{ Do not add fields to this struct  }
  PVncPixelFormat = ^TVncPixelFormat;
  TVncPixelFormat = record
      bits_per_pixel : Tguint8;
      depth : Tguint8;
      byte_order : Tguint16;
      true_color_flag : Tguint8;
      red_max : Tguint16;
      green_max : Tguint16;
      blue_max : Tguint16;
      red_shift : Tguint8;
      green_shift : Tguint8;
      blue_shift : Tguint8;
    end;


function vnc_pixel_format_get_type:TGType;cdecl;external;
function vnc_pixel_format_new:PVncPixelFormat;cdecl;external;
function vnc_pixel_format_copy(format:PVncPixelFormat):PVncPixelFormat;cdecl;external;
procedure vnc_pixel_format_free(format:PVncPixelFormat);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function vnc_pixel_format_match(format:PVncPixelFormat; other:PVncPixelFormat):Tgboolean;cdecl;external;
{$endif}
{ VNC_PIXEL_FORMAT_H  }

implementation

{ was #define dname def_expr }
function VNC_TYPE_PIXEL_FORMAT : longint; { return type might be wrong }
  begin
    VNC_TYPE_PIXEL_FORMAT:=vnc_pixel_format_get_type;
  end;


end.
