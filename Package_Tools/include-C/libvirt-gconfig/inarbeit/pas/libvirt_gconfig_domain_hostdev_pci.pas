unit libvirt_gconfig_domain_hostdev_pci;

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
  PGVirConfigDomainHostdevPci = ^TGVirConfigDomainHostdevPci;
  TGVirConfigDomainHostdevPci = record
      parent : TGVirConfigDomainHostdev;
      priv : PGVirConfigDomainHostdevPciPrivate;
    end;

  PGVirConfigDomainHostdevPciClass = ^TGVirConfigDomainHostdevPciClass;
  TGVirConfigDomainHostdevPciClass = record
      parent_class : TGVirConfigDomainHostdevClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_domain_hostdev_pci_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_domain_hostdev_pci_new:PGVirConfigDomainHostdevPci;cdecl;external libvirtgconfig;
function gvir_config_domain_hostdev_pci_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainHostdevPci;cdecl;external libvirtgconfig;
procedure gvir_config_domain_hostdev_pci_set_address(hostdev:PGVirConfigDomainHostdevPci; address:PGVirConfigDomainAddressPci);cdecl;external libvirtgconfig;
function gvir_config_domain_hostdev_pci_get_address(hostdev:PGVirConfigDomainHostdevPci):PGVirConfigDomainAddressPci;cdecl;external libvirtgconfig;
procedure gvir_config_domain_hostdev_pci_set_managed(hostdev:PGVirConfigDomainHostdevPci; managed:Tgboolean);cdecl;external libvirtgconfig;
function gvir_config_domain_hostdev_pci_get_managed(hostdev:PGVirConfigDomainHostdevPci):Tgboolean;cdecl;external libvirtgconfig;
procedure gvir_config_domain_hostdev_pci_set_rom_file(hostdev:PGVirConfigDomainHostdevPci; file:Pgchar);cdecl;external libvirtgconfig;
function gvir_config_domain_hostdev_pci_get_rom_file(hostdev:PGVirConfigDomainHostdevPci):Pgchar;cdecl;external libvirtgconfig;
procedure gvir_config_domain_hostdev_pci_set_rom_bar(hostdev:PGVirConfigDomainHostdevPci; bar:Tgboolean);cdecl;external libvirtgconfig;
function gvir_config_domain_hostdev_pci_get_rom_bar(hostdev:PGVirConfigDomainHostdevPci):Tgboolean;cdecl;external libvirtgconfig;

// === Konventiert am: 18-10-26 12:43:30 ===

function GVIR_CONFIG_TYPE_DOMAIN_HOSTDEV_PCI : TGType;
function GVIR_CONFIG_DOMAIN_HOSTDEV_PCI(obj : Pointer) : PGVirConfigDomainHostdevPci;
function GVIR_CONFIG_DOMAIN_HOSTDEV_PCI_CLASS(klass : Pointer) : PGVirConfigDomainHostdevPciClass;
function GVIR_CONFIG_IS_DOMAIN_HOSTDEV_PCI(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_HOSTDEV_PCI_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_HOSTDEV_PCI_GET_CLASS(obj : Pointer) : PGVirConfigDomainHostdevPciClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_HOSTDEV_PCI : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_HOSTDEV_PCI:=gvir_config_domain_hostdev_pci_get_type;
  end;

function GVIR_CONFIG_DOMAIN_HOSTDEV_PCI(obj : Pointer) : PGVirConfigDomainHostdevPci;
begin
  Result := PGVirConfigDomainHostdevPci(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_HOSTDEV_PCI));
end;

function GVIR_CONFIG_DOMAIN_HOSTDEV_PCI_CLASS(klass : Pointer) : PGVirConfigDomainHostdevPciClass;
begin
  Result := PGVirConfigDomainHostdevPciClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_HOSTDEV_PCI));
end;

function GVIR_CONFIG_IS_DOMAIN_HOSTDEV_PCI(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_HOSTDEV_PCI);
end;

function GVIR_CONFIG_IS_DOMAIN_HOSTDEV_PCI_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_HOSTDEV_PCI);
end;

function GVIR_CONFIG_DOMAIN_HOSTDEV_PCI_GET_CLASS(obj : Pointer) : PGVirConfigDomainHostdevPciClass;
begin
  Result := PGVirConfigDomainHostdevPciClass(PGTypeInstance(obj)^.g_class);
end;



end.
