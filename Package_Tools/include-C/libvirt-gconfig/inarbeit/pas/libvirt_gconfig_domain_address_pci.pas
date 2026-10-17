unit libvirt_gconfig_domain_address_pci;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-address-pci.h: libvirt PCI device address configuration
 *
 * Copyright (C) 2012 Red Hat, Inc.
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
 * Author: Christophe Fergeau <cfergeau@redhat.com>
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)

type
{ Do not add fields to this struct  }
  PGVirConfigDomainAddressPci = ^TGVirConfigDomainAddressPci;
  TGVirConfigDomainAddressPci = record
      parent : TGVirConfigDomainAddress;
      priv : PGVirConfigDomainAddressPciPrivate;
    end;

  PGVirConfigDomainAddressPciClass = ^TGVirConfigDomainAddressPciClass;
  TGVirConfigDomainAddressPciClass = record
      parent_class : TGVirConfigDomainAddressClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_domain_address_pci_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_domain_address_pci_new:PGVirConfigDomainAddressPci;cdecl;external libvirtgconfig;
function gvir_config_domain_address_pci_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainAddressPci;cdecl;external libvirtgconfig;
function gvir_config_domain_address_pci_get_domain(address:PGVirConfigDomainAddressPci):longint;cdecl;external libvirtgconfig;
procedure gvir_config_domain_address_pci_set_domain(address:PGVirConfigDomainAddressPci; pci_domain:Tguint16);cdecl;external libvirtgconfig;
function gvir_config_domain_address_pci_get_bus(address:PGVirConfigDomainAddressPci):longint;cdecl;external libvirtgconfig;
procedure gvir_config_domain_address_pci_set_bus(address:PGVirConfigDomainAddressPci; bus:Tguchar);cdecl;external libvirtgconfig;
function gvir_config_domain_address_pci_get_slot(address:PGVirConfigDomainAddressPci):longint;cdecl;external libvirtgconfig;
procedure gvir_config_domain_address_pci_set_slot(address:PGVirConfigDomainAddressPci; slot:Tguchar);cdecl;external libvirtgconfig;
function gvir_config_domain_address_pci_get_function(address:PGVirConfigDomainAddressPci):longint;cdecl;external libvirtgconfig;
procedure gvir_config_domain_address_pci_set_function(address:PGVirConfigDomainAddressPci; _function:Tguchar);cdecl;external libvirtgconfig;
function gvir_config_domain_address_pci_get_multifunction(address:PGVirConfigDomainAddressPci):Tgboolean;cdecl;external libvirtgconfig;
procedure gvir_config_domain_address_pci_set_multifunction(address:PGVirConfigDomainAddressPci; multifunction:Tgboolean);cdecl;external libvirtgconfig;

// === Konventiert am: 17-10-26 19:56:16 ===

function GVIR_CONFIG_TYPE_DOMAIN_ADDRESS_PCI : TGType;
function GVIR_CONFIG_DOMAIN_ADDRESS_PCI(obj : Pointer) : PGVirConfigDomainAddressPci;
function GVIR_CONFIG_DOMAIN_ADDRESS_PCI_CLASS(klass : Pointer) : PGVirConfigDomainAddressPciClass;
function GVIR_CONFIG_IS_DOMAIN_ADDRESS_PCI(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_ADDRESS_PCI_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_ADDRESS_PCI_GET_CLASS(obj : Pointer) : PGVirConfigDomainAddressPciClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_ADDRESS_PCI : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_ADDRESS_PCI:=gvir_config_domain_address_pci_get_type;
  end;

function GVIR_CONFIG_DOMAIN_ADDRESS_PCI(obj : Pointer) : PGVirConfigDomainAddressPci;
begin
  Result := PGVirConfigDomainAddressPci(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_ADDRESS_PCI));
end;

function GVIR_CONFIG_DOMAIN_ADDRESS_PCI_CLASS(klass : Pointer) : PGVirConfigDomainAddressPciClass;
begin
  Result := PGVirConfigDomainAddressPciClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_ADDRESS_PCI));
end;

function GVIR_CONFIG_IS_DOMAIN_ADDRESS_PCI(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_ADDRESS_PCI);
end;

function GVIR_CONFIG_IS_DOMAIN_ADDRESS_PCI_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_ADDRESS_PCI);
end;

function GVIR_CONFIG_DOMAIN_ADDRESS_PCI_GET_CLASS(obj : Pointer) : PGVirConfigDomainAddressPciClass;
begin
  Result := PGVirConfigDomainAddressPciClass(PGTypeInstance(obj)^.g_class);
end;



end.
