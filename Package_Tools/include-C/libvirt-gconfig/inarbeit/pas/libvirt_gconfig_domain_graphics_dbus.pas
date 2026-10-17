unit libvirt_gconfig_domain_graphics_dbus;

interface

uses
  fp_glib2, fp_virtgconfig;

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


function gvir_config_domain_graphics_dbus_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_domain_graphics_dbus_new:PGVirConfigDomainGraphicsDBus;cdecl;external libvirtgconfig;
function gvir_config_domain_graphics_dbus_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainGraphicsDBus;cdecl;external libvirtgconfig;
function gvir_config_domain_graphics_dbus_get_address(graphics:PGVirConfigDomainGraphicsDBus):Pchar;cdecl;external libvirtgconfig;
procedure gvir_config_domain_graphics_dbus_set_address(graphics:PGVirConfigDomainGraphicsDBus; address:Pchar);cdecl;external libvirtgconfig;
procedure gvir_config_domain_graphics_dbus_set_gl(graphics:PGVirConfigDomainGraphicsDBus; gl:Tgboolean);cdecl;external libvirtgconfig;

// === Konventiert am: 17-10-26 20:08:52 ===

function GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_DBUS : TGType;
function GVIR_CONFIG_DOMAIN_GRAPHICS_DBUS(obj : Pointer) : PGVirConfigDomainGraphicsDBus;
function GVIR_CONFIG_DOMAIN_GRAPHICS_DBUS_CLASS(klass : Pointer) : PGVirConfigDomainGraphicsDBusClass;
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_DBUS(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_DBUS_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_GRAPHICS_DBUS_GET_CLASS(obj : Pointer) : PGVirConfigDomainGraphicsDBusClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_DBUS : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_DBUS:=gvir_config_domain_graphics_dbus_get_type;
  end;

function GVIR_CONFIG_DOMAIN_GRAPHICS_DBUS(obj : Pointer) : PGVirConfigDomainGraphicsDBus;
begin
  Result := PGVirConfigDomainGraphicsDBus(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_DBUS));
end;

function GVIR_CONFIG_DOMAIN_GRAPHICS_DBUS_CLASS(klass : Pointer) : PGVirConfigDomainGraphicsDBusClass;
begin
  Result := PGVirConfigDomainGraphicsDBusClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_DBUS));
end;

function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_DBUS(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_DBUS);
end;

function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_DBUS_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_DBUS);
end;

function GVIR_CONFIG_DOMAIN_GRAPHICS_DBUS_GET_CLASS(obj : Pointer) : PGVirConfigDomainGraphicsDBusClass;
begin
  Result := PGVirConfigDomainGraphicsDBusClass(PGTypeInstance(obj)^.g_class);
end;



end.
