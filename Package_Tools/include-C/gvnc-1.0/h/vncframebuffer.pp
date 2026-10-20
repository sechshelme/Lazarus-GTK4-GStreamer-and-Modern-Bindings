
unit vncframebuffer;
interface

{
  Automatically converted by H2Pas 1.0.0 from vncframebuffer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    vncframebuffer.h
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
PVncColorMap  = ^VncColorMap;
PVncFramebuffer  = ^VncFramebuffer;
PVncFramebufferInterface  = ^VncFramebufferInterface;
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
{$ifndef VNC_FRAMEBUFFER_H}
{$define VNC_FRAMEBUFFER_H}
{$include <glib-object.h>}
{$include <vncpixelformat.h>}
{$include <vnccolormap.h>}

{ was #define dname def_expr }
function VNC_TYPE_FRAMEBUFFER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VNC_FRAMEBUFFER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VNC_IS_FRAMEBUFFER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VNC_FRAMEBUFFER_GET_INTERFACE(inst : longint) : longint;

type
{ Dummy object  }
(* Const before type ignored *)
(* Const before type ignored *)
{ One remote pixel  }
{ One remote pixel  }
{ Remote pixel array  }
{ rgb24 pixel array  }
{ Do not add fields to this struct  }
  PVncFramebufferInterface = ^TVncFramebufferInterface;
  TVncFramebufferInterface = record
      parent : TGTypeInterface;
      get_width : function (fb:PVncFramebuffer):Tguint16;cdecl;
      get_height : function (fb:PVncFramebuffer):Tguint16;cdecl;
      get_rowstride : function (fb:PVncFramebuffer):longint;cdecl;
      get_buffer : function (fb:PVncFramebuffer):Pguint8;cdecl;
      get_local_format : function (fb:PVncFramebuffer):PVncPixelFormat;cdecl;
      get_remote_format : function (fb:PVncFramebuffer):PVncPixelFormat;cdecl;
      perfect_format_match : function (fb:PVncFramebuffer):Tgboolean;cdecl;
      set_pixel_at : procedure (fb:PVncFramebuffer; src:Pguint8; x:Tguint16; y:Tguint16);cdecl;
      fill : procedure (fb:PVncFramebuffer; src:Pguint8; x:Tguint16; y:Tguint16; width:Tguint16; 
                    height:Tguint16);cdecl;
      copyrect : procedure (fb:PVncFramebuffer; srcx:Tguint16; srcy:Tguint16; dstx:Tguint16; dsty:Tguint16; 
                    width:Tguint16; height:Tguint16);cdecl;
      blt : procedure (fb:PVncFramebuffer; src:Pguint8; rowstride:longint; x:Tguint16; y:Tguint16; 
                    width:Tguint16; height:Tguint16);cdecl;
      rgb24_blt : procedure (fb:PVncFramebuffer; src:Pguint8; rowstride:longint; x:Tguint16; y:Tguint16; 
                    width:Tguint16; height:Tguint16);cdecl;
      set_color_map : procedure (fb:PVncFramebuffer; map:PVncColorMap);cdecl;
    end;


function vnc_framebuffer_get_type:TGType;cdecl;external;
function vnc_framebuffer_get_width(fb:PVncFramebuffer):Tguint16;cdecl;external;
function vnc_framebuffer_get_height(fb:PVncFramebuffer):Tguint16;cdecl;external;
function vnc_framebuffer_get_rowstride(fb:PVncFramebuffer):longint;cdecl;external;
function vnc_framebuffer_get_buffer(fb:PVncFramebuffer):Pguint8;cdecl;external;
(* Const before type ignored *)
function vnc_framebuffer_get_local_format(fb:PVncFramebuffer):PVncPixelFormat;cdecl;external;
(* Const before type ignored *)
function vnc_framebuffer_get_remote_format(fb:PVncFramebuffer):PVncPixelFormat;cdecl;external;
function vnc_framebuffer_perfect_format_match(fb:PVncFramebuffer):Tgboolean;cdecl;external;
{ One remote pixel  }
procedure vnc_framebuffer_set_pixel_at(fb:PVncFramebuffer; src:Pguint8; x:Tguint16; y:Tguint16);cdecl;external;
{ One remote pixel  }
procedure vnc_framebuffer_fill(fb:PVncFramebuffer; src:Pguint8; x:Tguint16; y:Tguint16; width:Tguint16; 
            height:Tguint16);cdecl;external;
procedure vnc_framebuffer_copyrect(fb:PVncFramebuffer; srcx:Tguint16; srcy:Tguint16; dstx:Tguint16; dsty:Tguint16; 
            width:Tguint16; height:Tguint16);cdecl;external;
{ Remote pixel array  }
procedure vnc_framebuffer_blt(fb:PVncFramebuffer; src:Pguint8; rowstride:longint; x:Tguint16; y:Tguint16; 
            width:Tguint16; height:Tguint16);cdecl;external;
{ rgb24 pixel array  }
procedure vnc_framebuffer_rgb24_blt(fb:PVncFramebuffer; src:Pguint8; rowstride:longint; x:Tguint16; y:Tguint16; 
            width:Tguint16; height:Tguint16);cdecl;external;
procedure vnc_framebuffer_set_color_map(fb:PVncFramebuffer; map:PVncColorMap);cdecl;external;
{$endif}
{ VNC_FRAMEBUFFER_H  }

implementation

{ was #define dname def_expr }
function VNC_TYPE_FRAMEBUFFER : longint; { return type might be wrong }
  begin
    VNC_TYPE_FRAMEBUFFER:=vnc_framebuffer_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VNC_FRAMEBUFFER(obj : longint) : longint;
begin
  VNC_FRAMEBUFFER:=G_TYPE_CHECK_INSTANCE_CAST(obj,VNC_TYPE_FRAMEBUFFER,VncFramebuffer);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VNC_IS_FRAMEBUFFER(obj : longint) : longint;
begin
  VNC_IS_FRAMEBUFFER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,VNC_TYPE_FRAMEBUFFER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VNC_FRAMEBUFFER_GET_INTERFACE(inst : longint) : longint;
begin
  VNC_FRAMEBUFFER_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(inst,VNC_TYPE_FRAMEBUFFER,VncFramebufferInterface);
end;


end.
