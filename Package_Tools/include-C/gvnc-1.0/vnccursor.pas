unit vnccursor;

interface

uses
  fp_glib2, fp_gvnc;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GTK VNC Widget
 *
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
{$ifndef VNC_CURSOR_H}
{$define VNC_CURSOR_H}
{$include <glib-object.h>}
{$include <vncutil.h>}

type
{ Do not add fields to this struct  }
  PVncCursor = ^TVncCursor;
  TVncCursor = record
      parent : TGObject;
      priv : PVncCursorPrivate;
    end;

{
     * If adding fields to this struct, remove corresponding
     * amount of padding to avoid changing overall struct size
      }
  PVncCursorClass = ^TVncCursorClass;
  TVncCursorClass = record
      parent_class : TGObjectClass;
      _vnc_reserved : array[0..(VNC_PADDING)-1] of Tgpointer;
    end;


function vnc_cursor_get_type:TGType;cdecl;external libgvnc;
function vnc_cursor_new(data:Pguint8; hotx:Tguint16; hoty:Tguint16; width:Tguint16; height:Tguint16):PVncCursor;cdecl;external libgvnc;
function vnc_cursor_get_data(cursor:PVncCursor):Pguint8;cdecl;external libgvnc;
function vnc_cursor_get_hotx(cursor:PVncCursor):Tguint16;cdecl;external libgvnc;
function vnc_cursor_get_hoty(cursor:PVncCursor):Tguint16;cdecl;external libgvnc;
function vnc_cursor_get_width(cursor:PVncCursor):Tguint16;cdecl;external libgvnc;
function vnc_cursor_get_height(cursor:PVncCursor):Tguint16;cdecl;external libgvnc;
{$endif}
{ VNC_CURSOR_H  }

// === Konventiert am: 20-10-26 19:50:31 ===

function VNC_TYPE_CURSOR : TGType;
function VNC_CURSOR(obj : Pointer) : PVncCursor;
function VNC_CURSOR_CLASS(klass : Pointer) : PVncCursorClass;
function VNC_IS_CURSOR(obj : Pointer) : Tgboolean;
function VNC_IS_CURSOR_CLASS(klass : Pointer) : Tgboolean;
function VNC_CURSOR_GET_CLASS(obj : Pointer) : PVncCursorClass;

implementation

function VNC_TYPE_CURSOR : TGType;
  begin
    VNC_TYPE_CURSOR:=vnc_cursor_get_type;
  end;

function VNC_CURSOR(obj : Pointer) : PVncCursor;
begin
  Result := PVncCursor(g_type_check_instance_cast(obj, VNC_TYPE_CURSOR));
end;

function VNC_CURSOR_CLASS(klass : Pointer) : PVncCursorClass;
begin
  Result := PVncCursorClass(g_type_check_class_cast(klass, VNC_TYPE_CURSOR));
end;

function VNC_IS_CURSOR(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  VNC_TYPE_CURSOR);
end;

function VNC_IS_CURSOR_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  VNC_TYPE_CURSOR);
end;

function VNC_CURSOR_GET_CLASS(obj : Pointer) : PVncCursorClass;
begin
  Result := PVncCursorClass(PGTypeInstance(obj)^.g_class);
end;



end.
