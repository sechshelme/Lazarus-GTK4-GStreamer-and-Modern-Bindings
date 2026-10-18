unit libvirt_gconfig_domain_hostdev;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-hostdev.h: libvirt domain hostdev configuration
 *
 * Copyright (C) 2016 Red Hat, Inc.
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
 * Authors: Zeeshan Ali (Khattak) <zeeshanak@gnome.org>
 *          Christophe Fergeau <cfergeau@redhat.com>
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)

type
{ Do not add fields to this struct  }
  PGVirConfigDomainHostdev = ^TGVirConfigDomainHostdev;
  TGVirConfigDomainHostdev = record
      parent : TGVirConfigDomainDevice;
      priv : PGVirConfigDomainHostdevPrivate;
    end;

  PGVirConfigDomainHostdevClass = ^TGVirConfigDomainHostdevClass;
  TGVirConfigDomainHostdevClass = record
      parent_class : TGVirConfigDomainDeviceClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_domain_hostdev_get_type:TGType;cdecl;external libvirtgconfig;
procedure gvir_config_domain_hostdev_set_boot_order(hostdev:PGVirConfigDomainHostdev; order:Tgint);cdecl;external libvirtgconfig;
function gvir_config_domain_hostdev_get_boot_order(hostdev:PGVirConfigDomainHostdev):Tgint;cdecl;external libvirtgconfig;
procedure gvir_config_domain_hostdev_set_readonly(hostdev:PGVirConfigDomainHostdev; readonly:Tgboolean);cdecl;external libvirtgconfig;
function gvir_config_domain_hostdev_get_readonly(hostdev:PGVirConfigDomainHostdev):Tgboolean;cdecl;external libvirtgconfig;
procedure gvir_config_domain_hostdev_set_shareable(hostdev:PGVirConfigDomainHostdev; shareable:Tgboolean);cdecl;external libvirtgconfig;
function gvir_config_domain_hostdev_get_shareable(hostdev:PGVirConfigDomainHostdev):Tgboolean;cdecl;external libvirtgconfig;

// === Konventiert am: 18-10-26 12:43:33 ===

function GVIR_CONFIG_TYPE_DOMAIN_HOSTDEV : TGType;
function GVIR_CONFIG_DOMAIN_HOSTDEV(obj : Pointer) : PGVirConfigDomainHostdev;
function GVIR_CONFIG_DOMAIN_HOSTDEV_CLASS(klass : Pointer) : PGVirConfigDomainHostdevClass;
function GVIR_CONFIG_IS_DOMAIN_HOSTDEV(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_HOSTDEV_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_HOSTDEV_GET_CLASS(obj : Pointer) : PGVirConfigDomainHostdevClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_HOSTDEV : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_HOSTDEV:=gvir_config_domain_hostdev_get_type;
  end;

function GVIR_CONFIG_DOMAIN_HOSTDEV(obj : Pointer) : PGVirConfigDomainHostdev;
begin
  Result := PGVirConfigDomainHostdev(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_HOSTDEV));
end;

function GVIR_CONFIG_DOMAIN_HOSTDEV_CLASS(klass : Pointer) : PGVirConfigDomainHostdevClass;
begin
  Result := PGVirConfigDomainHostdevClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_HOSTDEV));
end;

function GVIR_CONFIG_IS_DOMAIN_HOSTDEV(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_HOSTDEV);
end;

function GVIR_CONFIG_IS_DOMAIN_HOSTDEV_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_HOSTDEV);
end;

function GVIR_CONFIG_DOMAIN_HOSTDEV_GET_CLASS(obj : Pointer) : PGVirConfigDomainHostdevClass;
begin
  Result := PGVirConfigDomainHostdevClass(PGTypeInstance(obj)^.g_class);
end;



end.
