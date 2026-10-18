
unit libvirt_gconfig_domain_hostdev_pci;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_domain_hostdev_pci.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_domain_hostdev_pci.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pgchar  = ^gchar;
PGError  = ^GError;
PGVirConfigDomainAddressPci  = ^GVirConfigDomainAddressPci;
PGVirConfigDomainHostdevPci  = ^GVirConfigDomainHostdevPci;
PGVirConfigDomainHostdevPciClass  = ^GVirConfigDomainHostdevPciClass;
PGVirConfigDomainHostdevPciPrivate  = ^GVirConfigDomainHostdevPciPrivate;
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

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_HOSTDEV_PCI : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_HOSTDEV_PCI(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_HOSTDEV_PCI_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_HOSTDEV_PCI(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_HOSTDEV_PCI_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_HOSTDEV_PCI_GET_CLASS(obj : longint) : longint;

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


function gvir_config_domain_hostdev_pci_get_type:TGType;cdecl;external;
function gvir_config_domain_hostdev_pci_new:PGVirConfigDomainHostdevPci;cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_hostdev_pci_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainHostdevPci;cdecl;external;
procedure gvir_config_domain_hostdev_pci_set_address(hostdev:PGVirConfigDomainHostdevPci; address:PGVirConfigDomainAddressPci);cdecl;external;
function gvir_config_domain_hostdev_pci_get_address(hostdev:PGVirConfigDomainHostdevPci):PGVirConfigDomainAddressPci;cdecl;external;
procedure gvir_config_domain_hostdev_pci_set_managed(hostdev:PGVirConfigDomainHostdevPci; managed:Tgboolean);cdecl;external;
function gvir_config_domain_hostdev_pci_get_managed(hostdev:PGVirConfigDomainHostdevPci):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure gvir_config_domain_hostdev_pci_set_rom_file(hostdev:PGVirConfigDomainHostdevPci; file:Pgchar);cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_hostdev_pci_get_rom_file(hostdev:PGVirConfigDomainHostdevPci):Pgchar;cdecl;external;
procedure gvir_config_domain_hostdev_pci_set_rom_bar(hostdev:PGVirConfigDomainHostdevPci; bar:Tgboolean);cdecl;external;
function gvir_config_domain_hostdev_pci_get_rom_bar(hostdev:PGVirConfigDomainHostdevPci):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_HOSTDEV_PCI : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_DOMAIN_HOSTDEV_PCI:=gvir_config_domain_hostdev_pci_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_HOSTDEV_PCI(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_HOSTDEV_PCI:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_DOMAIN_HOSTDEV_PCI,GVirConfigDomainHostdevPci);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_HOSTDEV_PCI_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_HOSTDEV_PCI_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_DOMAIN_HOSTDEV_PCI,GVirConfigDomainHostdevPciClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_HOSTDEV_PCI(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_HOSTDEV_PCI:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_DOMAIN_HOSTDEV_PCI);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_HOSTDEV_PCI_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_HOSTDEV_PCI_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_DOMAIN_HOSTDEV_PCI);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_HOSTDEV_PCI_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_HOSTDEV_PCI_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_DOMAIN_HOSTDEV_PCI,GVirConfigDomainHostdevPciClass);
end;


end.
