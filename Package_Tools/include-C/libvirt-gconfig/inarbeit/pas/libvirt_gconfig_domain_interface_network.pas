unit libvirt_gconfig_domain_interface_network;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-interface-network.c: libvirt domain interface configuration
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
  PGVirConfigDomainInterfaceNetwork = ^TGVirConfigDomainInterfaceNetwork;
  TGVirConfigDomainInterfaceNetwork = record
      parent : TGVirConfigDomainInterface;
      priv : PGVirConfigDomainInterfaceNetworkPrivate;
    end;

  PGVirConfigDomainInterfaceNetworkClass = ^TGVirConfigDomainInterfaceNetworkClass;
  TGVirConfigDomainInterfaceNetworkClass = record
      parent_class : TGVirConfigDomainInterfaceClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_domain_interface_network_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_domain_interface_network_new:PGVirConfigDomainInterfaceNetwork;cdecl;external libvirtgconfig;
function gvir_config_domain_interface_network_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainInterfaceNetwork;cdecl;external libvirtgconfig;
procedure gvir_config_domain_interface_network_set_source(interface:PGVirConfigDomainInterfaceNetwork; source:Pchar);cdecl;external libvirtgconfig;

// === Konventiert am: 18-10-26 12:43:13 ===

function GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_NETWORK : TGType;
function GVIR_CONFIG_DOMAIN_INTERFACE_NETWORK(obj : Pointer) : PGVirConfigDomainInterfaceNetwork;
function GVIR_CONFIG_DOMAIN_INTERFACE_NETWORK_CLASS(klass : Pointer) : PGVirConfigDomainInterfaceNetworkClass;
function GVIR_CONFIG_IS_DOMAIN_INTERFACE_NETWORK(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_INTERFACE_NETWORK_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_INTERFACE_NETWORK_GET_CLASS(obj : Pointer) : PGVirConfigDomainInterfaceNetworkClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_NETWORK : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_NETWORK:=gvir_config_domain_interface_network_get_type;
  end;

function GVIR_CONFIG_DOMAIN_INTERFACE_NETWORK(obj : Pointer) : PGVirConfigDomainInterfaceNetwork;
begin
  Result := PGVirConfigDomainInterfaceNetwork(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_NETWORK));
end;

function GVIR_CONFIG_DOMAIN_INTERFACE_NETWORK_CLASS(klass : Pointer) : PGVirConfigDomainInterfaceNetworkClass;
begin
  Result := PGVirConfigDomainInterfaceNetworkClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_NETWORK));
end;

function GVIR_CONFIG_IS_DOMAIN_INTERFACE_NETWORK(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_NETWORK);
end;

function GVIR_CONFIG_IS_DOMAIN_INTERFACE_NETWORK_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_NETWORK);
end;

function GVIR_CONFIG_DOMAIN_INTERFACE_NETWORK_GET_CLASS(obj : Pointer) : PGVirConfigDomainInterfaceNetworkClass;
begin
  Result := PGVirConfigDomainInterfaceNetworkClass(PGTypeInstance(obj)^.g_class);
end;



end.
