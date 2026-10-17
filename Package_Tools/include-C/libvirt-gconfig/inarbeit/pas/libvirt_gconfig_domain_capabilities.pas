unit libvirt_gconfig_domain_capabilities;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-capabilities.c: libvirt domain capabilities configuration
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
{$include "libvirt-gconfig/libvirt-gconfig-domain-capabilities-os.h"}

type
{ Do not add fields to this struct  }
  PGVirConfigDomainCapabilities = ^TGVirConfigDomainCapabilities;
  TGVirConfigDomainCapabilities = record
      parent : TGVirConfigObject;
      priv : PGVirConfigDomainCapabilitiesPrivate;
    end;

  PGVirConfigDomainCapabilitiesClass = ^TGVirConfigDomainCapabilitiesClass;
  TGVirConfigDomainCapabilitiesClass = record
      parent_class : TGVirConfigObjectClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_domain_capabilities_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_domain_capabilities_new:PGVirConfigDomainCapabilities;cdecl;external libvirtgconfig;
function gvir_config_domain_capabilities_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainCapabilities;cdecl;external libvirtgconfig;
function gvir_config_domain_capabilities_get_os(domain_caps:PGVirConfigDomainCapabilities):PGVirConfigDomainCapabilitiesOs;cdecl;external libvirtgconfig;

// === Konventiert am: 17-10-26 19:56:08 ===

function GVIR_CONFIG_TYPE_DOMAIN_CAPABILITIES : TGType;
function GVIR_CONFIG_DOMAIN_CAPABILITIES(obj : Pointer) : PGVirConfigDomainCapabilities;
function GVIR_CONFIG_DOMAIN_CAPABILITIES_CLASS(klass : Pointer) : PGVirConfigDomainCapabilitiesClass;
function GVIR_CONFIG_IS_DOMAIN_CAPABILITIES(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_CAPABILITIES_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_CAPABILITIES_GET_CLASS(obj : Pointer) : PGVirConfigDomainCapabilitiesClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_CAPABILITIES : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_CAPABILITIES:=gvir_config_domain_capabilities_get_type;
  end;

function GVIR_CONFIG_DOMAIN_CAPABILITIES(obj : Pointer) : PGVirConfigDomainCapabilities;
begin
  Result := PGVirConfigDomainCapabilities(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_CAPABILITIES));
end;

function GVIR_CONFIG_DOMAIN_CAPABILITIES_CLASS(klass : Pointer) : PGVirConfigDomainCapabilitiesClass;
begin
  Result := PGVirConfigDomainCapabilitiesClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_CAPABILITIES));
end;

function GVIR_CONFIG_IS_DOMAIN_CAPABILITIES(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_CAPABILITIES);
end;

function GVIR_CONFIG_IS_DOMAIN_CAPABILITIES_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_CAPABILITIES);
end;

function GVIR_CONFIG_DOMAIN_CAPABILITIES_GET_CLASS(obj : Pointer) : PGVirConfigDomainCapabilitiesClass;
begin
  Result := PGVirConfigDomainCapabilitiesClass(PGTypeInstance(obj)^.g_class);
end;



end.
