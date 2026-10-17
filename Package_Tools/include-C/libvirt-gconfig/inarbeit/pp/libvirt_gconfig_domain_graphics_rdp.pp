
unit libvirt_gconfig_domain_graphics_rdp;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_domain_graphics_rdp.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_domain_graphics_rdp.h
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
PGError  = ^GError;
PGVirConfigDomainGraphicsRdp  = ^GVirConfigDomainGraphicsRdp;
PGVirConfigDomainGraphicsRdpClass  = ^GVirConfigDomainGraphicsRdpClass;
PGVirConfigDomainGraphicsRdpPrivate  = ^GVirConfigDomainGraphicsRdpPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-graphics-rdp.h: libvirt domain RDP graphics configuration
 *
 * Copyright (C) 2011, 2014 Red Hat, Inc.
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
 * Author: Daniel P. Berrange <berrange@redhat.com>
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_RDP : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_GRAPHICS_RDP(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_GRAPHICS_RDP_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_RDP(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_RDP_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_GRAPHICS_RDP_GET_CLASS(obj : longint) : longint;

type
{ Do not add fields to this struct  }
  PGVirConfigDomainGraphicsRdp = ^TGVirConfigDomainGraphicsRdp;
  TGVirConfigDomainGraphicsRdp = record
      parent : TGVirConfigDomainGraphics;
      priv : PGVirConfigDomainGraphicsRdpPrivate;
    end;

  PGVirConfigDomainGraphicsRdpClass = ^TGVirConfigDomainGraphicsRdpClass;
  TGVirConfigDomainGraphicsRdpClass = record
      parent_class : TGVirConfigDomainGraphicsClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_domain_graphics_rdp_get_type:TGType;cdecl;external;
function gvir_config_domain_graphics_rdp_new:PGVirConfigDomainGraphicsRdp;cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_graphics_rdp_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainGraphicsRdp;cdecl;external;
procedure gvir_config_domain_graphics_rdp_set_autoport(graphics:PGVirConfigDomainGraphicsRdp; autoport:Tgboolean);cdecl;external;
function gvir_config_domain_graphics_rdp_get_port(graphics:PGVirConfigDomainGraphicsRdp):longint;cdecl;external;
procedure gvir_config_domain_graphics_rdp_set_port(graphics:PGVirConfigDomainGraphicsRdp; port:longint);cdecl;external;
function gvir_config_domain_graphics_rdp_get_multi_user(graphics:PGVirConfigDomainGraphicsRdp):Tgboolean;cdecl;external;
procedure gvir_config_domain_graphics_rdp_set_multi_user(graphics:PGVirConfigDomainGraphicsRdp; multi_user:Tgboolean);cdecl;external;
function gvir_config_domain_graphics_rdp_get_replace_user(graphics:PGVirConfigDomainGraphicsRdp):Tgboolean;cdecl;external;
procedure gvir_config_domain_graphics_rdp_set_replace_user(graphics:PGVirConfigDomainGraphicsRdp; replace_user:Tgboolean);cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_RDP : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_RDP:=gvir_config_domain_graphics_rdp_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_GRAPHICS_RDP(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_GRAPHICS_RDP:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_RDP,GVirConfigDomainGraphicsRdp);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_GRAPHICS_RDP_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_GRAPHICS_RDP_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_RDP,GVirConfigDomainGraphicsRdpClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_RDP(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_GRAPHICS_RDP:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_RDP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_RDP_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_GRAPHICS_RDP_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_RDP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_GRAPHICS_RDP_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_GRAPHICS_RDP_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_RDP,GVirConfigDomainGraphicsRdpClass);
end;


end.
