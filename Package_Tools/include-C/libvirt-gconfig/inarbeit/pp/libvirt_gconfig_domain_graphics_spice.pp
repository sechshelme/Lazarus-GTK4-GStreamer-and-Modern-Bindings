
unit libvirt_gconfig_domain_graphics_spice;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_domain_graphics_spice.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_domain_graphics_spice.h
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
Pgchar  = ^gchar;
PGError  = ^GError;
PGVirConfigDomainGraphicsSpice  = ^GVirConfigDomainGraphicsSpice;
PGVirConfigDomainGraphicsSpiceClass  = ^GVirConfigDomainGraphicsSpiceClass;
PGVirConfigDomainGraphicsSpiceImageCompression  = ^GVirConfigDomainGraphicsSpiceImageCompression;
PGVirConfigDomainGraphicsSpicePrivate  = ^GVirConfigDomainGraphicsSpicePrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-graphics-spice.h: libvirt domain SPICE confiiguration
 *
 * Copyright (C) 2011 Red Hat, Inc.
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
 * License along with this library. If not, see
 * <http://www.gnu.org/licenses/>.
 *
 * Authors: Christophe Fergeau <cfergeau@gmail.com>
 *          Zeeshan Ali (Khattak) <zeeshanak@gnome.org>
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SPICE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_SPICE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_SPICE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE_GET_CLASS(obj : longint) : longint;

type
{ Do not add fields to this struct  }
  PGVirConfigDomainGraphicsSpice = ^TGVirConfigDomainGraphicsSpice;
  TGVirConfigDomainGraphicsSpice = record
      parent : TGVirConfigDomainGraphics;
      priv : PGVirConfigDomainGraphicsSpicePrivate;
    end;

  PGVirConfigDomainGraphicsSpiceClass = ^TGVirConfigDomainGraphicsSpiceClass;
  TGVirConfigDomainGraphicsSpiceClass = record
      parent_class : TGVirConfigDomainGraphicsClass;
      padding : array[0..19] of Tgpointer;
    end;

{< nick=auto_glz > }
{< nick=auto_lz > }

  PGVirConfigDomainGraphicsSpiceImageCompression = ^TGVirConfigDomainGraphicsSpiceImageCompression;
  TGVirConfigDomainGraphicsSpiceImageCompression =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE_IMAGE_COMPRESSION_AUTO_GLZ = 0;
    GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE_IMAGE_COMPRESSION_AUTO_LZ = 1;
    GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE_IMAGE_COMPRESSION_QUIC = 2;
    GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE_IMAGE_COMPRESSION_GLZ = 3;
    GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE_IMAGE_COMPRESSION_LZ = 4;
    GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE_IMAGE_COMPRESSION_OFF = 5;
;

function gvir_config_domain_graphics_spice_get_type:TGType;cdecl;external;
function gvir_config_domain_graphics_spice_new:PGVirConfigDomainGraphicsSpice;cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_graphics_spice_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainGraphicsSpice;cdecl;external;
procedure gvir_config_domain_graphics_spice_set_autoport(graphics:PGVirConfigDomainGraphicsSpice; autoport:Tgboolean);cdecl;external;
(* Const before type ignored *)
procedure gvir_config_domain_graphics_spice_set_password(graphics:PGVirConfigDomainGraphicsSpice; password:Pchar);cdecl;external;
function gvir_config_domain_graphics_spice_get_port(graphics:PGVirConfigDomainGraphicsSpice):longint;cdecl;external;
procedure gvir_config_domain_graphics_spice_set_port(graphics:PGVirConfigDomainGraphicsSpice; port:longint);cdecl;external;
procedure gvir_config_domain_graphics_spice_set_tls_port(graphics:PGVirConfigDomainGraphicsSpice; port:longint);cdecl;external;
procedure gvir_config_domain_graphics_spice_set_image_compression(graphics:PGVirConfigDomainGraphicsSpice; compression:TGVirConfigDomainGraphicsSpiceImageCompression);cdecl;external;
function gvir_config_domain_graphics_spice_get_image_compression(graphics:PGVirConfigDomainGraphicsSpice):longint;cdecl;external;
procedure gvir_config_domain_graphics_spice_set_gl(graphics:PGVirConfigDomainGraphicsSpice; gl:Tgboolean);cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SPICE : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SPICE:=gvir_config_domain_graphics_spice_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SPICE,GVirConfigDomainGraphicsSpice);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SPICE,GVirConfigDomainGraphicsSpiceClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_SPICE(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_GRAPHICS_SPICE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SPICE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_SPICE_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_GRAPHICS_SPICE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SPICE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SPICE,GVirConfigDomainGraphicsSpiceClass);
end;


end.
