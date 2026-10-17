unit libvirt_gconfig_domain_capabilities_os;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-capabilities-os.h: libvirt domain capabilities OS
 *
 * Copyright (C) 2019 Red Hat, Inc.
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
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)

type
{ Do not add fields to this struct  }
  PGVirConfigDomainCapabilitiesOs = ^TGVirConfigDomainCapabilitiesOs;
  TGVirConfigDomainCapabilitiesOs = record
      parent : TGVirConfigObject;
      priv : PGVirConfigDomainCapabilitiesOsPrivate;
    end;

  PGVirConfigDomainCapabilitiesOsClass = ^TGVirConfigDomainCapabilitiesOsClass;
  TGVirConfigDomainCapabilitiesOsClass = record
      parent_class : TGVirConfigObjectClass;
      get_firmwares : function (os:PGVirConfigDomainCapabilitiesOs):PGList;cdecl;
      padding : array[0..18] of Tgpointer;
    end;


function gvir_config_domain_capabilities_os_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_domain_capabilities_os_get_firmwares(os:PGVirConfigDomainCapabilitiesOs):PGList;cdecl;external libvirtgconfig;

// === Konventiert am: 17-10-26 19:56:06 ===

function GVIR_CONFIG_TYPE_DOMAIN_CAPABILITIES_OS : TGType;
function GVIR_CONFIG_DOMAIN_CAPABILITIES_OS(obj : Pointer) : PGVirConfigDomainCapabilitiesOs;
function GVIR_CONFIG_DOMAIN_CAPABILITIES_OS_CLASS(klass : Pointer) : PGVirConfigDomainCapabilitiesOsClass;
function GVIR_CONFIG_IS_DOMAIN_CAPABILITIES_OS(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_CAPABILITIES_OS_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_CAPABILITIES_OS_GET_CLASS(obj : Pointer) : PGVirConfigDomainCapabilitiesOsClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_CAPABILITIES_OS : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_CAPABILITIES_OS:=gvir_config_domain_capabilities_os_get_type;
  end;

function GVIR_CONFIG_DOMAIN_CAPABILITIES_OS(obj : Pointer) : PGVirConfigDomainCapabilitiesOs;
begin
  Result := PGVirConfigDomainCapabilitiesOs(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_CAPABILITIES_OS));
end;

function GVIR_CONFIG_DOMAIN_CAPABILITIES_OS_CLASS(klass : Pointer) : PGVirConfigDomainCapabilitiesOsClass;
begin
  Result := PGVirConfigDomainCapabilitiesOsClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_CAPABILITIES_OS));
end;

function GVIR_CONFIG_IS_DOMAIN_CAPABILITIES_OS(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_CAPABILITIES_OS);
end;

function GVIR_CONFIG_IS_DOMAIN_CAPABILITIES_OS_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_CAPABILITIES_OS);
end;

function GVIR_CONFIG_DOMAIN_CAPABILITIES_OS_GET_CLASS(obj : Pointer) : PGVirConfigDomainCapabilitiesOsClass;
begin
  Result := PGVirConfigDomainCapabilitiesOsClass(PGTypeInstance(obj)^.g_class);
end;



end.
