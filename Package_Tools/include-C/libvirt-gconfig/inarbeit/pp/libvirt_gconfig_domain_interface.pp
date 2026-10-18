
unit libvirt_gconfig_domain_interface;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_domain_interface.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_domain_interface
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
PGVirConfigDomainInterface  = ^GVirConfigDomainInterface;
PGVirConfigDomainInterfaceClass  = ^GVirConfigDomainInterfaceClass;
PGVirConfigDomainInterfaceFilterref  = ^GVirConfigDomainInterfaceFilterref;
PGVirConfigDomainInterfaceLinkState  = ^GVirConfigDomainInterfaceLinkState;
PGVirConfigDomainInterfacePrivate  = ^GVirConfigDomainInterfacePrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-interface.h: libvirt domain interface configuration
 *
 * Copyright (C) 2010-2011 Red Hat, Inc.
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
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)
{$include <libvirt-gconfig/libvirt-gconfig-domain-interface-filterref.h>}

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_INTERFACE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_INTERFACE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_INTERFACE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_INTERFACE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_INTERFACE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_INTERFACE_GET_CLASS(obj : longint) : longint;

type
{ Do not add fields to this struct  }
  PGVirConfigDomainInterface = ^TGVirConfigDomainInterface;
  TGVirConfigDomainInterface = record
      parent : TGVirConfigDomainDevice;
      priv : PGVirConfigDomainInterfacePrivate;
    end;

  PGVirConfigDomainInterfaceClass = ^TGVirConfigDomainInterfaceClass;
  TGVirConfigDomainInterfaceClass = record
      parent_class : TGVirConfigDomainDeviceClass;
      padding : array[0..19] of Tgpointer;
    end;


  PGVirConfigDomainInterfaceLinkState = ^TGVirConfigDomainInterfaceLinkState;
  TGVirConfigDomainInterfaceLinkState =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_INTERFACE_LINK_STATE_DEFAULT = 0;
    GVIR_CONFIG_DOMAIN_INTERFACE_LINK_STATE_UP = 1;
    GVIR_CONFIG_DOMAIN_INTERFACE_LINK_STATE_DOWN = 2;
;

function gvir_config_domain_interface_get_type:TGType;cdecl;external;
(* Const before type ignored *)
procedure gvir_config_domain_interface_set_ifname(interface:PGVirConfigDomainInterface; ifname:Pchar);cdecl;external;
procedure gvir_config_domain_interface_set_link_state(interface:PGVirConfigDomainInterface; state:TGVirConfigDomainInterfaceLinkState);cdecl;external;
(* Const before type ignored *)
procedure gvir_config_domain_interface_set_mac(interface:PGVirConfigDomainInterface; mac_address:Pchar);cdecl;external;
(* Const before type ignored *)
procedure gvir_config_domain_interface_set_model(interface:PGVirConfigDomainInterface; model:Pchar);cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_interface_get_ifname(interface:PGVirConfigDomainInterface):Pchar;cdecl;external;
function gvir_config_domain_interface_get_link_state(interface:PGVirConfigDomainInterface):TGVirConfigDomainInterfaceLinkState;cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_interface_get_mac(interface:PGVirConfigDomainInterface):Pchar;cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_interface_get_model(interface:PGVirConfigDomainInterface):Pchar;cdecl;external;
procedure gvir_config_domain_interface_set_filterref(interface:PGVirConfigDomainInterface; filterref:PGVirConfigDomainInterfaceFilterref);cdecl;external;
function gvir_config_domain_interface_get_filterref(interface:PGVirConfigDomainInterface):PGVirConfigDomainInterfaceFilterref;cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_INTERFACE : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_DOMAIN_INTERFACE:=gvir_config_domain_interface_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_INTERFACE(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_INTERFACE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_DOMAIN_INTERFACE,GVirConfigDomainInterface);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_INTERFACE_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_INTERFACE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_DOMAIN_INTERFACE,GVirConfigDomainInterfaceClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_INTERFACE(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_INTERFACE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_DOMAIN_INTERFACE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_INTERFACE_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_INTERFACE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_DOMAIN_INTERFACE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_INTERFACE_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_INTERFACE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_DOMAIN_INTERFACE,GVirConfigDomainInterfaceClass);
end;


end.
