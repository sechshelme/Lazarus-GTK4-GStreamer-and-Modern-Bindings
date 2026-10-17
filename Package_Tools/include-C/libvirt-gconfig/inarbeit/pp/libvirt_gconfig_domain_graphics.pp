
unit libvirt_gconfig_domain_graphics;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_domain_graphics.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_domain_graphics
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
PGVirConfigDomainGraphics  = ^GVirConfigDomainGraphics;
PGVirConfigDomainGraphicsClass  = ^GVirConfigDomainGraphicsClass;
PGVirConfigDomainGraphicsPrivate  = ^GVirConfigDomainGraphicsPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-graphics.h: libvirt domain graphics configuration
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
 * Author: Christophe Fergeau <cfergeau@gmail.com>
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_GRAPHICS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_GRAPHICS_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_GRAPHICS_GET_CLASS(obj : longint) : longint;

type
{ Do not add fields to this struct  }
  PGVirConfigDomainGraphics = ^TGVirConfigDomainGraphics;
  TGVirConfigDomainGraphics = record
      parent : TGVirConfigDomainDevice;
      priv : PGVirConfigDomainGraphicsPrivate;
    end;

  PGVirConfigDomainGraphicsClass = ^TGVirConfigDomainGraphicsClass;
  TGVirConfigDomainGraphicsClass = record
      parent_class : TGVirConfigDomainDeviceClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_domain_graphics_get_type:TGType;cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS:=gvir_config_domain_graphics_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_GRAPHICS(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_GRAPHICS:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS,GVirConfigDomainGraphics);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_GRAPHICS_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_GRAPHICS_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS,GVirConfigDomainGraphicsClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_GRAPHICS:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_GRAPHICS_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_GRAPHICS_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_GRAPHICS_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS,GVirConfigDomainGraphicsClass);
end;


end.
