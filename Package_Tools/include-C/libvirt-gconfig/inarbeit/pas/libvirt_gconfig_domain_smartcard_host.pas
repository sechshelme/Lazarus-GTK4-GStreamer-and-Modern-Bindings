unit libvirt_gconfig_domain_smartcard_host;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-smartcard-host.h: libvirt domain smartcard host configuration
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
 * Author: Alexander Larsson <alexl@redhat.com>
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)

type
{ Do not add fields to this struct  }
  PGVirConfigDomainSmartcardHost = ^TGVirConfigDomainSmartcardHost;
  TGVirConfigDomainSmartcardHost = record
      parent : TGVirConfigDomainSmartcard;
      priv : PGVirConfigDomainSmartcardHostPrivate;
    end;

  PGVirConfigDomainSmartcardHostClass = ^TGVirConfigDomainSmartcardHostClass;
  TGVirConfigDomainSmartcardHostClass = record
      parent_class : TGVirConfigDomainSmartcardClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_domain_smartcard_host_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_domain_smartcard_host_new:PGVirConfigDomainSmartcardHost;cdecl;external libvirtgconfig;
function gvir_config_domain_smartcard_host_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainSmartcardHost;cdecl;external libvirtgconfig;

// === Konventiert am: 18-10-26 12:46:59 ===

function GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_HOST : TGType;
function GVIR_CONFIG_DOMAIN_SMARTCARD_HOST(obj : Pointer) : PGVirConfigDomainSmartcardHost;
function GVIR_CONFIG_DOMAIN_SMARTCARD_HOST_CLASS(klass : Pointer) : PGVirConfigDomainSmartcardHostClass;
function GVIR_CONFIG_IS_DOMAIN_SMARTCARD_HOST(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_SMARTCARD_HOST_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_SMARTCARD_HOST_GET_CLASS(obj : Pointer) : PGVirConfigDomainSmartcardHostClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_HOST : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_HOST:=gvir_config_domain_smartcard_host_get_type;
  end;

function GVIR_CONFIG_DOMAIN_SMARTCARD_HOST(obj : Pointer) : PGVirConfigDomainSmartcardHost;
begin
  Result := PGVirConfigDomainSmartcardHost(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_HOST));
end;

function GVIR_CONFIG_DOMAIN_SMARTCARD_HOST_CLASS(klass : Pointer) : PGVirConfigDomainSmartcardHostClass;
begin
  Result := PGVirConfigDomainSmartcardHostClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_HOST));
end;

function GVIR_CONFIG_IS_DOMAIN_SMARTCARD_HOST(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_HOST);
end;

function GVIR_CONFIG_IS_DOMAIN_SMARTCARD_HOST_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_HOST);
end;

function GVIR_CONFIG_DOMAIN_SMARTCARD_HOST_GET_CLASS(obj : Pointer) : PGVirConfigDomainSmartcardHostClass;
begin
  Result := PGVirConfigDomainSmartcardHostClass(PGTypeInstance(obj)^.g_class);
end;



end.
