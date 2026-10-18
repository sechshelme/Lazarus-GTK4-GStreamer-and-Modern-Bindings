unit libvirt_gconfig_domain_interface_bridge;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-interface-bridge.c: libvirt domain interface configuration
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
 * Author: Christophe Fergeau <cfergeau@redhat.com>
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)

type
{ Do not add fields to this struct  }
  PGVirConfigDomainInterfaceBridge = ^TGVirConfigDomainInterfaceBridge;
  TGVirConfigDomainInterfaceBridge = record
      parent : TGVirConfigDomainInterface;
      priv : PGVirConfigDomainInterfaceBridgePrivate;
    end;

  PGVirConfigDomainInterfaceBridgeClass = ^TGVirConfigDomainInterfaceBridgeClass;
  TGVirConfigDomainInterfaceBridgeClass = record
      parent_class : TGVirConfigDomainInterfaceClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_domain_interface_bridge_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_domain_interface_bridge_new:PGVirConfigDomainInterfaceBridge;cdecl;external libvirtgconfig;
function gvir_config_domain_interface_bridge_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainInterfaceBridge;cdecl;external libvirtgconfig;
procedure gvir_config_domain_interface_bridge_set_source(interface:PGVirConfigDomainInterfaceBridge; brname:Pchar);cdecl;external libvirtgconfig;

// === Konventiert am: 18-10-26 12:43:21 ===

function GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_BRIDGE : TGType;
function GVIR_CONFIG_DOMAIN_INTERFACE_BRIDGE(obj : Pointer) : PGVirConfigDomainInterfaceBridge;
function GVIR_CONFIG_DOMAIN_INTERFACE_BRIDGE_CLASS(klass : Pointer) : PGVirConfigDomainInterfaceBridgeClass;
function GVIR_CONFIG_IS_DOMAIN_INTERFACE_BRIDGE(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_INTERFACE_BRIDGE_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_INTERFACE_BRIDGE_GET_CLASS(obj : Pointer) : PGVirConfigDomainInterfaceBridgeClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_BRIDGE : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_BRIDGE:=gvir_config_domain_interface_bridge_get_type;
  end;

function GVIR_CONFIG_DOMAIN_INTERFACE_BRIDGE(obj : Pointer) : PGVirConfigDomainInterfaceBridge;
begin
  Result := PGVirConfigDomainInterfaceBridge(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_BRIDGE));
end;

function GVIR_CONFIG_DOMAIN_INTERFACE_BRIDGE_CLASS(klass : Pointer) : PGVirConfigDomainInterfaceBridgeClass;
begin
  Result := PGVirConfigDomainInterfaceBridgeClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_BRIDGE));
end;

function GVIR_CONFIG_IS_DOMAIN_INTERFACE_BRIDGE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_BRIDGE);
end;

function GVIR_CONFIG_IS_DOMAIN_INTERFACE_BRIDGE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_BRIDGE);
end;

function GVIR_CONFIG_DOMAIN_INTERFACE_BRIDGE_GET_CLASS(obj : Pointer) : PGVirConfigDomainInterfaceBridgeClass;
begin
  Result := PGVirConfigDomainInterfaceBridgeClass(PGTypeInstance(obj)^.g_class);
end;



end.
