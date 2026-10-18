unit libvirt_gconfig_domain_serial;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-serial.h: libvirt domain serial configuration
 *
 * Copyright (C) 2011-2012 Red Hat, Inc.
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

type
{ Do not add fields to this struct  }
  PGVirConfigDomainSerial = ^TGVirConfigDomainSerial;
  TGVirConfigDomainSerial = record
      parent : TGVirConfigDomainChardev;
      priv : PGVirConfigDomainSerialPrivate;
    end;

  PGVirConfigDomainSerialClass = ^TGVirConfigDomainSerialClass;
  TGVirConfigDomainSerialClass = record
      parent_class : TGVirConfigDomainChardevClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_domain_serial_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_domain_serial_new:PGVirConfigDomainSerial;cdecl;external libvirtgconfig;
function gvir_config_domain_serial_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainSerial;cdecl;external libvirtgconfig;

// === Konventiert am: 18-10-26 12:47:06 ===

function GVIR_CONFIG_TYPE_DOMAIN_SERIAL : TGType;
function GVIR_CONFIG_DOMAIN_SERIAL(obj : Pointer) : PGVirConfigDomainSerial;
function GVIR_CONFIG_DOMAIN_SERIAL_CLASS(klass : Pointer) : PGVirConfigDomainSerialClass;
function GVIR_CONFIG_IS_DOMAIN_SERIAL(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_SERIAL_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_SERIAL_GET_CLASS(obj : Pointer) : PGVirConfigDomainSerialClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_SERIAL : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_SERIAL:=gvir_config_domain_serial_get_type;
  end;

function GVIR_CONFIG_DOMAIN_SERIAL(obj : Pointer) : PGVirConfigDomainSerial;
begin
  Result := PGVirConfigDomainSerial(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_SERIAL));
end;

function GVIR_CONFIG_DOMAIN_SERIAL_CLASS(klass : Pointer) : PGVirConfigDomainSerialClass;
begin
  Result := PGVirConfigDomainSerialClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_SERIAL));
end;

function GVIR_CONFIG_IS_DOMAIN_SERIAL(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_SERIAL);
end;

function GVIR_CONFIG_IS_DOMAIN_SERIAL_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_SERIAL);
end;

function GVIR_CONFIG_DOMAIN_SERIAL_GET_CLASS(obj : Pointer) : PGVirConfigDomainSerialClass;
begin
  Result := PGVirConfigDomainSerialClass(PGTypeInstance(obj)^.g_class);
end;



end.
