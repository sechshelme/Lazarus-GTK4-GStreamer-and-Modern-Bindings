
unit libvirt_gconfig_domain_controller_usb;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_domain_controller_usb.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_domain_controller_usb.h
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
PGVirConfigDomainControllerUsb  = ^GVirConfigDomainControllerUsb;
PGVirConfigDomainControllerUsbClass  = ^GVirConfigDomainControllerUsbClass;
PGVirConfigDomainControllerUsbModel  = ^GVirConfigDomainControllerUsbModel;
PGVirConfigDomainControllerUsbPrivate  = ^GVirConfigDomainControllerUsbPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-controller-usb.h: libvirt domain USB controller configuration
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
function GVIR_CONFIG_TYPE_DOMAIN_CONTROLLER_USB : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CONTROLLER_USB(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CONTROLLER_USB_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_CONTROLLER_USB(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_CONTROLLER_USB_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CONTROLLER_USB_GET_CLASS(obj : longint) : longint;

type
{ Do not add fields to this struct  }
  PGVirConfigDomainControllerUsb = ^TGVirConfigDomainControllerUsb;
  TGVirConfigDomainControllerUsb = record
      parent : TGVirConfigDomainController;
      priv : PGVirConfigDomainControllerUsbPrivate;
    end;

  PGVirConfigDomainControllerUsbClass = ^TGVirConfigDomainControllerUsbClass;
  TGVirConfigDomainControllerUsbClass = record
      parent_class : TGVirConfigDomainControllerClass;
      padding : array[0..19] of Tgpointer;
    end;


  PGVirConfigDomainControllerUsbModel = ^TGVirConfigDomainControllerUsbModel;
  TGVirConfigDomainControllerUsbModel =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_CONTROLLER_USB_MODEL_PIIX3_UHCI = 0;
    GVIR_CONFIG_DOMAIN_CONTROLLER_USB_MODEL_PIIX4_UHCI = 1;
    GVIR_CONFIG_DOMAIN_CONTROLLER_USB_MODEL_EHCI = 2;
    GVIR_CONFIG_DOMAIN_CONTROLLER_USB_MODEL_ICH9_EHCI1 = 3;
    GVIR_CONFIG_DOMAIN_CONTROLLER_USB_MODEL_ICH9_UHCI1 = 4;
    GVIR_CONFIG_DOMAIN_CONTROLLER_USB_MODEL_ICH9_UHCI2 = 5;
    GVIR_CONFIG_DOMAIN_CONTROLLER_USB_MODEL_ICH9_UHCI3 = 6;
    GVIR_CONFIG_DOMAIN_CONTROLLER_USB_MODEL_VT82C686B_UHCI = 7;
    GVIR_CONFIG_DOMAIN_CONTROLLER_USB_MODEL_PCI_OHCI = 8;
    GVIR_CONFIG_DOMAIN_CONTROLLER_USB_MODEL_QEMU_XHCI = 9;
;

function gvir_config_domain_controller_usb_get_type:TGType;cdecl;external;
function gvir_config_domain_controller_usb_new:PGVirConfigDomainControllerUsb;cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_controller_usb_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainControllerUsb;cdecl;external;
procedure gvir_config_domain_controller_usb_set_model(controller:PGVirConfigDomainControllerUsb; model:TGVirConfigDomainControllerUsbModel);cdecl;external;
procedure gvir_config_domain_controller_usb_set_master(controller:PGVirConfigDomainControllerUsb; master:PGVirConfigDomainControllerUsb; startport:Tguint);cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_CONTROLLER_USB : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_DOMAIN_CONTROLLER_USB:=gvir_config_domain_controller_usb_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CONTROLLER_USB(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_CONTROLLER_USB:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_DOMAIN_CONTROLLER_USB,GVirConfigDomainControllerUsb);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CONTROLLER_USB_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_CONTROLLER_USB_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_DOMAIN_CONTROLLER_USB,GVirConfigDomainControllerUsbClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_CONTROLLER_USB(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_CONTROLLER_USB:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_DOMAIN_CONTROLLER_USB);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_CONTROLLER_USB_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_CONTROLLER_USB_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_DOMAIN_CONTROLLER_USB);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CONTROLLER_USB_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_CONTROLLER_USB_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_DOMAIN_CONTROLLER_USB,GVirConfigDomainControllerUsbClass);
end;


end.
