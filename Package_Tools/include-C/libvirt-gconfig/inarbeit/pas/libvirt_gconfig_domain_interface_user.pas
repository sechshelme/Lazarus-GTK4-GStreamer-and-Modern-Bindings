unit libvirt_gconfig_domain_interface_user;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-interface-user.c: libvirt domain interface configuration
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
  PGVirConfigDomainInterfaceUser = ^TGVirConfigDomainInterfaceUser;
  TGVirConfigDomainInterfaceUser = record
      parent : TGVirConfigDomainInterface;
      priv : PGVirConfigDomainInterfaceUserPrivate;
    end;

  PGVirConfigDomainInterfaceUserClass = ^TGVirConfigDomainInterfaceUserClass;
  TGVirConfigDomainInterfaceUserClass = record
      parent_class : TGVirConfigDomainInterfaceClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_domain_interface_user_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_domain_interface_user_new:PGVirConfigDomainInterfaceUser;cdecl;external libvirtgconfig;
function gvir_config_domain_interface_user_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainInterfaceUser;cdecl;external libvirtgconfig;

// === Konventiert am: 18-10-26 12:43:09 ===

function GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_USER : TGType;
function GVIR_CONFIG_DOMAIN_INTERFACE_USER(obj : Pointer) : PGVirConfigDomainInterfaceUser;
function GVIR_CONFIG_DOMAIN_INTERFACE_USER_CLASS(klass : Pointer) : PGVirConfigDomainInterfaceUserClass;
function GVIR_CONFIG_IS_DOMAIN_INTERFACE_USER(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_INTERFACE_USER_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_INTERFACE_USER_GET_CLASS(obj : Pointer) : PGVirConfigDomainInterfaceUserClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_USER : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_USER:=gvir_config_domain_interface_user_get_type;
  end;

function GVIR_CONFIG_DOMAIN_INTERFACE_USER(obj : Pointer) : PGVirConfigDomainInterfaceUser;
begin
  Result := PGVirConfigDomainInterfaceUser(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_USER));
end;

function GVIR_CONFIG_DOMAIN_INTERFACE_USER_CLASS(klass : Pointer) : PGVirConfigDomainInterfaceUserClass;
begin
  Result := PGVirConfigDomainInterfaceUserClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_USER));
end;

function GVIR_CONFIG_IS_DOMAIN_INTERFACE_USER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_USER);
end;

function GVIR_CONFIG_IS_DOMAIN_INTERFACE_USER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_USER);
end;

function GVIR_CONFIG_DOMAIN_INTERFACE_USER_GET_CLASS(obj : Pointer) : PGVirConfigDomainInterfaceUserClass;
begin
  Result := PGVirConfigDomainInterfaceUserClass(PGTypeInstance(obj)^.g_class);
end;



end.
