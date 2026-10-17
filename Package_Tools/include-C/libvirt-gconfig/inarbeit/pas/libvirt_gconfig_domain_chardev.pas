unit libvirt_gconfig_domain_chardev;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-chardev.h: libvirt domain chardev configuration
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
 * Author: Daniel P. Berrange <berrange@redhat.com>
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)
{$include <libvirt-gconfig/libvirt-gconfig-domain-chardev-source.h>}

type
{ Do not add fields to this struct  }
  PGVirConfigDomainChardev = ^TGVirConfigDomainChardev;
  TGVirConfigDomainChardev = record
      parent : TGVirConfigDomainDevice;
      priv : PGVirConfigDomainChardevPrivate;
    end;

  PGVirConfigDomainChardevClass = ^TGVirConfigDomainChardevClass;
  TGVirConfigDomainChardevClass = record
      parent_class : TGVirConfigDomainDeviceClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_domain_chardev_get_type:TGType;cdecl;external libvirtgconfig;
procedure gvir_config_domain_chardev_set_source(chardev:PGVirConfigDomainChardev; source:PGVirConfigDomainChardevSource);cdecl;external libvirtgconfig;
function gvir_config_domain_chardev_get_source(chardev:PGVirConfigDomainChardev):PGVirConfigDomainChardevSource;cdecl;external libvirtgconfig;

// === Konventiert am: 17-10-26 19:56:01 ===

function GVIR_CONFIG_TYPE_DOMAIN_CHARDEV : TGType;
function GVIR_CONFIG_DOMAIN_CHARDEV(obj : Pointer) : PGVirConfigDomainChardev;
function GVIR_CONFIG_DOMAIN_CHARDEV_CLASS(klass : Pointer) : PGVirConfigDomainChardevClass;
function GVIR_CONFIG_IS_DOMAIN_CHARDEV(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_CHARDEV_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_CHARDEV_GET_CLASS(obj : Pointer) : PGVirConfigDomainChardevClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_CHARDEV : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_CHARDEV:=gvir_config_domain_chardev_get_type;
  end;

function GVIR_CONFIG_DOMAIN_CHARDEV(obj : Pointer) : PGVirConfigDomainChardev;
begin
  Result := PGVirConfigDomainChardev(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_CHARDEV));
end;

function GVIR_CONFIG_DOMAIN_CHARDEV_CLASS(klass : Pointer) : PGVirConfigDomainChardevClass;
begin
  Result := PGVirConfigDomainChardevClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_CHARDEV));
end;

function GVIR_CONFIG_IS_DOMAIN_CHARDEV(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_CHARDEV);
end;

function GVIR_CONFIG_IS_DOMAIN_CHARDEV_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_CHARDEV);
end;

function GVIR_CONFIG_DOMAIN_CHARDEV_GET_CLASS(obj : Pointer) : PGVirConfigDomainChardevClass;
begin
  Result := PGVirConfigDomainChardevClass(PGTypeInstance(obj)^.g_class);
end;



end.
