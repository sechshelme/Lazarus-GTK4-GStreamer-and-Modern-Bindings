unit libvirt_gconfig_domain_address;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-address.h: libvirt device address configuration
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
  PGVirConfigDomainAddress = ^TGVirConfigDomainAddress;
  TGVirConfigDomainAddress = record
      parent : TGVirConfigObject;
      priv : PGVirConfigDomainAddressPrivate;
    end;

  PGVirConfigDomainAddressClass = ^TGVirConfigDomainAddressClass;
  TGVirConfigDomainAddressClass = record
      parent_class : TGVirConfigObjectClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_domain_address_get_type:TGType;cdecl;external libvirtgconfig;

// === Konventiert am: 17-10-26 19:56:19 ===

function GVIR_CONFIG_TYPE_DOMAIN_ADDRESS : TGType;
function GVIR_CONFIG_DOMAIN_ADDRESS(obj : Pointer) : PGVirConfigDomainAddress;
function GVIR_CONFIG_DOMAIN_ADDRESS_CLASS(klass : Pointer) : PGVirConfigDomainAddressClass;
function GVIR_CONFIG_IS_DOMAIN_ADDRESS(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_ADDRESS_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_ADDRESS_GET_CLASS(obj : Pointer) : PGVirConfigDomainAddressClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_ADDRESS : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_ADDRESS:=gvir_config_domain_address_get_type;
  end;

function GVIR_CONFIG_DOMAIN_ADDRESS(obj : Pointer) : PGVirConfigDomainAddress;
begin
  Result := PGVirConfigDomainAddress(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_ADDRESS));
end;

function GVIR_CONFIG_DOMAIN_ADDRESS_CLASS(klass : Pointer) : PGVirConfigDomainAddressClass;
begin
  Result := PGVirConfigDomainAddressClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_ADDRESS));
end;

function GVIR_CONFIG_IS_DOMAIN_ADDRESS(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_ADDRESS);
end;

function GVIR_CONFIG_IS_DOMAIN_ADDRESS_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_ADDRESS);
end;

function GVIR_CONFIG_DOMAIN_ADDRESS_GET_CLASS(obj : Pointer) : PGVirConfigDomainAddressClass;
begin
  Result := PGVirConfigDomainAddressClass(PGTypeInstance(obj)^.g_class);
end;



end.
