unit libvirt_gconfig_domain_device;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-device.h: libvirt domain device configuration
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

type
{ Do not add fields to this struct  }
  PGVirConfigDomainDevice = ^TGVirConfigDomainDevice;
  TGVirConfigDomainDevice = record
      parent : TGVirConfigObject;
      priv : PGVirConfigDomainDevicePrivate;
    end;

  PGVirConfigDomainDeviceClass = ^TGVirConfigDomainDeviceClass;
  TGVirConfigDomainDeviceClass = record
      parent_class : TGVirConfigObjectClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_domain_device_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_domain_device_get_alias(dev:PGVirConfigDomainDevice):Pgchar;cdecl;external libvirtgconfig;

// === Konventiert am: 17-10-26 20:09:12 ===

function GVIR_CONFIG_TYPE_DOMAIN_DEVICE : TGType;
function GVIR_CONFIG_DOMAIN_DEVICE(obj : Pointer) : PGVirConfigDomainDevice;
function GVIR_CONFIG_DOMAIN_DEVICE_CLASS(klass : Pointer) : PGVirConfigDomainDeviceClass;
function GVIR_CONFIG_IS_DOMAIN_DEVICE(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_DEVICE_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_DEVICE_GET_CLASS(obj : Pointer) : PGVirConfigDomainDeviceClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_DEVICE : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_DEVICE:=gvir_config_domain_device_get_type;
  end;

function GVIR_CONFIG_DOMAIN_DEVICE(obj : Pointer) : PGVirConfigDomainDevice;
begin
  Result := PGVirConfigDomainDevice(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_DEVICE));
end;

function GVIR_CONFIG_DOMAIN_DEVICE_CLASS(klass : Pointer) : PGVirConfigDomainDeviceClass;
begin
  Result := PGVirConfigDomainDeviceClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_DEVICE));
end;

function GVIR_CONFIG_IS_DOMAIN_DEVICE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_DEVICE);
end;

function GVIR_CONFIG_IS_DOMAIN_DEVICE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_DEVICE);
end;

function GVIR_CONFIG_DOMAIN_DEVICE_GET_CLASS(obj : Pointer) : PGVirConfigDomainDeviceClass;
begin
  Result := PGVirConfigDomainDeviceClass(PGTypeInstance(obj)^.g_class);
end;



end.
