unit libvirt_gconfig_domain_smartcard;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-smartcard.h: libvirt domain smartcard configuration
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
  PGVirConfigDomainSmartcard = ^TGVirConfigDomainSmartcard;
  TGVirConfigDomainSmartcard = record
      parent : TGVirConfigDomainDevice;
      priv : PGVirConfigDomainSmartcardPrivate;
    end;

  PGVirConfigDomainSmartcardClass = ^TGVirConfigDomainSmartcardClass;
  TGVirConfigDomainSmartcardClass = record
      parent_class : TGVirConfigDomainDeviceClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_domain_smartcard_get_type:TGType;cdecl;external libvirtgconfig;
procedure gvir_config_domain_smartcard_set_address(redirdev:PGVirConfigDomainRedirdev; address:PGVirConfigDomainAddress);cdecl;external libvirtgconfig;

// === Konventiert am: 18-10-26 12:47:04 ===

function GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD : TGType;
function GVIR_CONFIG_DOMAIN_SMARTCARD(obj : Pointer) : PGVirConfigDomainSmartcard;
function GVIR_CONFIG_DOMAIN_SMARTCARD_CLASS(klass : Pointer) : PGVirConfigDomainSmartcardClass;
function GVIR_CONFIG_IS_DOMAIN_SMARTCARD(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_SMARTCARD_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_SMARTCARD_GET_CLASS(obj : Pointer) : PGVirConfigDomainSmartcardClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD:=gvir_config_domain_smartcard_get_type;
  end;

function GVIR_CONFIG_DOMAIN_SMARTCARD(obj : Pointer) : PGVirConfigDomainSmartcard;
begin
  Result := PGVirConfigDomainSmartcard(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD));
end;

function GVIR_CONFIG_DOMAIN_SMARTCARD_CLASS(klass : Pointer) : PGVirConfigDomainSmartcardClass;
begin
  Result := PGVirConfigDomainSmartcardClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD));
end;

function GVIR_CONFIG_IS_DOMAIN_SMARTCARD(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD);
end;

function GVIR_CONFIG_IS_DOMAIN_SMARTCARD_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD);
end;

function GVIR_CONFIG_DOMAIN_SMARTCARD_GET_CLASS(obj : Pointer) : PGVirConfigDomainSmartcardClass;
begin
  Result := PGVirConfigDomainSmartcardClass(PGTypeInstance(obj)^.g_class);
end;



end.
