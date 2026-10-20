
unit vnccolormap;
interface

{
  Automatically converted by H2Pas 1.0.0 from vnccolormap.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    vnccolormap.h
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
Pguint16  = ^guint16;
PVncColorMap  = ^VncColorMap;
PVncColorMapEntry  = ^VncColorMapEntry;
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
{$ifndef VNC_COLOR_MAP_H}
{$define VNC_COLOR_MAP_H}
{$include <glib.h>}
{$include <glib-object.h>}

{ was #define dname def_expr }
function VNC_TYPE_COLOR_MAP : longint; { return type might be wrong }

type
{ Do not add fields to this struct  }
  PVncColorMap = ^TVncColorMap;
  TVncColorMap = record
      offset : Tguint16;
      size : Tguint16;
      colors : PVncColorMapEntry;
    end;

{ Do not add fields to this struct  }
  PVncColorMapEntry = ^TVncColorMapEntry;
  TVncColorMapEntry = record
      red : Tguint16;
      green : Tguint16;
      blue : Tguint16;
    end;


function vnc_color_map_get_type:TGType;cdecl;external;
function vnc_color_map_new(offset:Tguint16; size:Tguint16):PVncColorMap;cdecl;external;
function vnc_color_map_copy(map:PVncColorMap):PVncColorMap;cdecl;external;
procedure vnc_color_map_free(map:PVncColorMap);cdecl;external;
function vnc_color_map_set(map:PVncColorMap; idx:Tguint16; red:Tguint16; green:Tguint16; blue:Tguint16):Tgboolean;cdecl;external;
function vnc_color_map_lookup(map:PVncColorMap; idx:Tguint16; red:Pguint16; green:Pguint16; blue:Pguint16):Tgboolean;cdecl;external;
{$endif}
{ VNC_COLOR_MAP_H  }

implementation

{ was #define dname def_expr }
function VNC_TYPE_COLOR_MAP : longint; { return type might be wrong }
  begin
    VNC_TYPE_COLOR_MAP:=vnc_color_map_get_type;
  end;


end.
