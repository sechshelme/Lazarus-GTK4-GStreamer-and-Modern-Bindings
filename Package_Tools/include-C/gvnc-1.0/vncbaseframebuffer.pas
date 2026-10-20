unit vncbaseframebuffer;

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
{$ifndef VNC_BASE_FRAMEBUFFER_H}
{$define VNC_BASE_FRAMEBUFFER_H}
{$include <glib-object.h>}
{$include <vncframebuffer.h>}
{$include <vncutil.h>}

type
{ Do not add fields to this struct  }
  PVncBaseFramebuffer = ^TVncBaseFramebuffer;
  TVncBaseFramebuffer = record
      parent : TGObject;
      priv : PVncBaseFramebufferPrivate;
    end;

{
     * If adding fields to this struct, remove corresponding
     * amount of padding to avoid changing overall struct size
      }
  PVncBaseFramebufferClass = ^TVncBaseFramebufferClass;
  TVncBaseFramebufferClass = record
      parent_class : TGObjectClass;
      _vnc_reserved : array[0..(VNC_PADDING)-1] of Tgpointer;
    end;


function vnc_base_framebuffer_get_type:TGType;cdecl;external libgvnc;
function vnc_base_framebuffer_new(buffer:Pguint8; width:Tguint16; height:Tguint16; rowstride:longint; localFormat:PVncPixelFormat; 
           remoteFormat:PVncPixelFormat):PVncBaseFramebuffer;cdecl;external libgvnc;
{$endif}
{ VNC_BASE_FRAMEBUFFER_H  }

// === Konventiert am: 20-10-26 19:51:08 ===

function VNC_TYPE_BASE_FRAMEBUFFER : TGType;
function VNC_BASE_FRAMEBUFFER(obj : Pointer) : PVncBaseFramebuffer;
function VNC_BASE_FRAMEBUFFER_CLASS(klass : Pointer) : PVncBaseFramebufferClass;
function VNC_IS_BASE_FRAMEBUFFER(obj : Pointer) : Tgboolean;
function VNC_IS_BASE_FRAMEBUFFER_CLASS(klass : Pointer) : Tgboolean;
function VNC_BASE_FRAMEBUFFER_GET_CLASS(obj : Pointer) : PVncBaseFramebufferClass;

implementation

function VNC_TYPE_BASE_FRAMEBUFFER : TGType;
  begin
    VNC_TYPE_BASE_FRAMEBUFFER:=vnc_base_framebuffer_get_type;
  end;

function VNC_BASE_FRAMEBUFFER(obj : Pointer) : PVncBaseFramebuffer;
begin
  Result := PVncBaseFramebuffer(g_type_check_instance_cast(obj, VNC_TYPE_BASE_FRAMEBUFFER));
end;

function VNC_BASE_FRAMEBUFFER_CLASS(klass : Pointer) : PVncBaseFramebufferClass;
begin
  Result := PVncBaseFramebufferClass(g_type_check_class_cast(klass, VNC_TYPE_BASE_FRAMEBUFFER));
end;

function VNC_IS_BASE_FRAMEBUFFER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  VNC_TYPE_BASE_FRAMEBUFFER);
end;

function VNC_IS_BASE_FRAMEBUFFER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  VNC_TYPE_BASE_FRAMEBUFFER);
end;

function VNC_BASE_FRAMEBUFFER_GET_CLASS(obj : Pointer) : PVncBaseFramebufferClass;
begin
  Result := PVncBaseFramebufferClass(PGTypeInstance(obj)^.g_class);
end;



end.
