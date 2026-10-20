
unit vncbaseframebuffer;
interface

{
  Automatically converted by H2Pas 1.0.0 from vncbaseframebuffer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    vncbaseframebuffer.h
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
Pguint8  = ^guint8;
PVncBaseFramebuffer  = ^VncBaseFramebuffer;
PVncBaseFramebufferClass  = ^VncBaseFramebufferClass;
PVncBaseFramebufferPrivate  = ^VncBaseFramebufferPrivate;
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
{$ifndef VNC_BASE_FRAMEBUFFER_H}
{$define VNC_BASE_FRAMEBUFFER_H}
{$include <glib-object.h>}
{$include <vncframebuffer.h>}
{$include <vncutil.h>}

{ was #define dname def_expr }
function VNC_TYPE_BASE_FRAMEBUFFER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VNC_BASE_FRAMEBUFFER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VNC_BASE_FRAMEBUFFER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VNC_IS_BASE_FRAMEBUFFER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VNC_IS_BASE_FRAMEBUFFER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VNC_BASE_FRAMEBUFFER_GET_CLASS(obj : longint) : longint;

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


function vnc_base_framebuffer_get_type:TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function vnc_base_framebuffer_new(buffer:Pguint8; width:Tguint16; height:Tguint16; rowstride:longint; localFormat:PVncPixelFormat; 
           remoteFormat:PVncPixelFormat):PVncBaseFramebuffer;cdecl;external;
{$endif}
{ VNC_BASE_FRAMEBUFFER_H  }

implementation

{ was #define dname def_expr }
function VNC_TYPE_BASE_FRAMEBUFFER : longint; { return type might be wrong }
  begin
    VNC_TYPE_BASE_FRAMEBUFFER:=vnc_base_framebuffer_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VNC_BASE_FRAMEBUFFER(obj : longint) : longint;
begin
  VNC_BASE_FRAMEBUFFER:=G_TYPE_CHECK_INSTANCE_CAST(obj,VNC_TYPE_BASE_FRAMEBUFFER,VncBaseFramebuffer);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VNC_BASE_FRAMEBUFFER_CLASS(klass : longint) : longint;
begin
  VNC_BASE_FRAMEBUFFER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,VNC_TYPE_BASE_FRAMEBUFFER,VncBaseFramebufferClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VNC_IS_BASE_FRAMEBUFFER(obj : longint) : longint;
begin
  VNC_IS_BASE_FRAMEBUFFER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,VNC_TYPE_BASE_FRAMEBUFFER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VNC_IS_BASE_FRAMEBUFFER_CLASS(klass : longint) : longint;
begin
  VNC_IS_BASE_FRAMEBUFFER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,VNC_TYPE_BASE_FRAMEBUFFER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VNC_BASE_FRAMEBUFFER_GET_CLASS(obj : longint) : longint;
begin
  VNC_BASE_FRAMEBUFFER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,VNC_TYPE_BASE_FRAMEBUFFER,VncBaseFramebufferClass);
end;


end.
