unit vnccolormap;

interface

uses
  fp_glib2, fp_gvnc;

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


function vnc_color_map_get_type:TGType;cdecl;external libgvnc;
function vnc_color_map_new(offset:Tguint16; size:Tguint16):PVncColorMap;cdecl;external libgvnc;
function vnc_color_map_copy(map:PVncColorMap):PVncColorMap;cdecl;external libgvnc;
procedure vnc_color_map_free(map:PVncColorMap);cdecl;external libgvnc;
function vnc_color_map_set(map:PVncColorMap; idx:Tguint16; red:Tguint16; green:Tguint16; blue:Tguint16):Tgboolean;cdecl;external libgvnc;
function vnc_color_map_lookup(map:PVncColorMap; idx:Tguint16; red:Pguint16; green:Pguint16; blue:Pguint16):Tgboolean;cdecl;external libgvnc;
{$endif}
{ VNC_COLOR_MAP_H  }

// === Konventiert am: 20-10-26 19:51:02 ===

function VNC_TYPE_COLOR_MAP : TGType;

implementation

function VNC_TYPE_COLOR_MAP : TGType;
  begin
    VNC_TYPE_COLOR_MAP:=vnc_color_map_get_type;
  end;



end.
