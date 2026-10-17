
unit libvirt_gconfig_domain_graphics_dbus;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_domain_graphics_dbus.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_domain_graphics_dbus.h
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
PGVirConfigDomainGraphicsDBus  = ^GVirConfigDomainGraphicsDBus;
PGVirConfigDomainGraphicsDBusClass  = ^GVirConfigDomainGraphicsDBusClass;
PGVirConfigDomainGraphicsDBusPrivate  = ^GVirConfigDomainGraphicsDBusPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-graphics-dbus.h: libvirt domain DBUS graphics configuration
 *
 * Copyright (C) 2023 Red Hat, Inc.
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
 * Author: Felipe Borges <felipeborges@gnome.org>
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_DBUS : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_GRAPHICS_DBUS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_GRAPHICS_DBUS_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_DBUS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_DBUS_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_GRAPHICS_DBUS_GET_CLASS(obj : longint) : longint;

type
{ Do not add fields to this struct  }
  PGVirConfigDomainGraphicsDBus = ^TGVirConfigDomainGraphicsDBus;
  TGVirConfigDomainGraphicsDBus = record
      parent : TGVirConfigDomainGraphics;
      priv : PGVirConfigDomainGraphicsDBusPrivate;
    end;

  PGVirConfigDomainGraphicsDBusClass = ^TGVirConfigDomainGraphicsDBusClass;
  TGVirConfigDomainGraphicsDBusClass = record
      parent_class : TGVirConfigDomainGraphicsClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_domain_graphics_dbus_get_type:TGType;cdecl;external;
function gvir_config_domain_graphics_dbus_new:PGVirConfigDomainGraphicsDBus;cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_graphics_dbus_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainGraphicsDBus;cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_graphics_dbus_get_address(graphics:PGVirConfigDomainGraphicsDBus):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gvir_config_domain_graphics_dbus_set_address(graphics:PGVirConfigDomainGraphicsDBus; address:Pchar);cdecl;external;
procedure gvir_config_domain_graphics_dbus_set_gl(graphics:PGVirConfigDomainGraphicsDBus; gl:Tgboolean);cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_DBUS : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_DBUS:=gvir_config_domain_graphics_dbus_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_GRAPHICS_DBUS(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_GRAPHICS_DBUS:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_DBUS,GVirConfigDomainGraphicsDBus);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_GRAPHICS_DBUS_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_GRAPHICS_DBUS_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_DBUS,GVirConfigDomainGraphicsDBusClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_DBUS(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_GRAPHICS_DBUS:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_DBUS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_DBUS_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_GRAPHICS_DBUS_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_DBUS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_GRAPHICS_DBUS_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_GRAPHICS_DBUS_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_DBUS,GVirConfigDomainGraphicsDBusClass);
end;


end.
