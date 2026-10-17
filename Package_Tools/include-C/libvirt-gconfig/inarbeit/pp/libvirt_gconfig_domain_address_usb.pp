
unit libvirt_gconfig_domain_address_usb;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_domain_address_usb.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_domain_address_usb.h
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
Pchar  = ^char;
Pgchar  = ^gchar;
PGError  = ^GError;
PGVirConfigDomainAddressUsb  = ^GVirConfigDomainAddressUsb;
PGVirConfigDomainAddressUsbClass  = ^GVirConfigDomainAddressUsbClass;
PGVirConfigDomainAddressUsbPrivate  = ^GVirConfigDomainAddressUsbPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-address-usb.h: libvirt USB device address configuration
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

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_ADDRESS_USB : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_ADDRESS_USB(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_ADDRESS_USB_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_ADDRESS_USB(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_ADDRESS_USB_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_ADDRESS_USB_GET_CLASS(obj : longint) : longint;

type
{ Do not add fields to this struct  }
  PGVirConfigDomainAddressUsb = ^TGVirConfigDomainAddressUsb;
  TGVirConfigDomainAddressUsb = record
      parent : TGVirConfigDomainAddress;
      priv : PGVirConfigDomainAddressUsbPrivate;
    end;

  PGVirConfigDomainAddressUsbClass = ^TGVirConfigDomainAddressUsbClass;
  TGVirConfigDomainAddressUsbClass = record
      parent_class : TGVirConfigDomainAddressClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_domain_address_usb_get_type:TGType;cdecl;external;
function gvir_config_domain_address_usb_new:PGVirConfigDomainAddressUsb;cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_address_usb_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainAddressUsb;cdecl;external;
procedure gvir_config_domain_address_usb_set_bus(address:PGVirConfigDomainAddressUsb; bus:Tguint16);cdecl;external;
(* Const before type ignored *)
procedure gvir_config_domain_address_usb_set_port(address:PGVirConfigDomainAddressUsb; port:Pchar);cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_ADDRESS_USB : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_DOMAIN_ADDRESS_USB:=gvir_config_domain_address_usb_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_ADDRESS_USB(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_ADDRESS_USB:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_DOMAIN_ADDRESS_USB,GVirConfigDomainAddressUsb);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_ADDRESS_USB_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_ADDRESS_USB_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_DOMAIN_ADDRESS_USB,GVirConfigDomainAddressUsbClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_ADDRESS_USB(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_ADDRESS_USB:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_DOMAIN_ADDRESS_USB);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_ADDRESS_USB_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_ADDRESS_USB_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_DOMAIN_ADDRESS_USB);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_ADDRESS_USB_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_ADDRESS_USB_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_DOMAIN_ADDRESS_USB,GVirConfigDomainAddressUsbClass);
end;


end.
