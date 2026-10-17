unit libvirt_gconfig_capabilities;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-capabilities.c: libvirt capabilities configuration
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
{$include "libvirt-gconfig/libvirt-gconfig-capabilities-host.h"}

type
{ Do not add fields to this struct  }
  PGVirConfigCapabilities = ^TGVirConfigCapabilities;
  TGVirConfigCapabilities = record
      parent : TGVirConfigObject;
      priv : PGVirConfigCapabilitiesPrivate;
    end;

  PGVirConfigCapabilitiesClass = ^TGVirConfigCapabilitiesClass;
  TGVirConfigCapabilitiesClass = record
      parent_class : TGVirConfigObjectClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_capabilities_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_capabilities_new:PGVirConfigCapabilities;cdecl;external libvirtgconfig;
function gvir_config_capabilities_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigCapabilities;cdecl;external libvirtgconfig;
function gvir_config_capabilities_get_host(caps:PGVirConfigCapabilities):PGVirConfigCapabilitiesHost;cdecl;external libvirtgconfig;
function gvir_config_capabilities_get_guests(caps:PGVirConfigCapabilities):PGList;cdecl;external libvirtgconfig;

// === Konventiert am: 17-10-26 19:53:13 ===

function GVIR_CONFIG_TYPE_CAPABILITIES : TGType;
function GVIR_CONFIG_CAPABILITIES(obj : Pointer) : PGVirConfigCapabilities;
function GVIR_CONFIG_CAPABILITIES_CLASS(klass : Pointer) : PGVirConfigCapabilitiesClass;
function GVIR_CONFIG_IS_CAPABILITIES(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_CAPABILITIES_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_CAPABILITIES_GET_CLASS(obj : Pointer) : PGVirConfigCapabilitiesClass;

implementation

function GVIR_CONFIG_TYPE_CAPABILITIES : TGType;
  begin
    GVIR_CONFIG_TYPE_CAPABILITIES:=gvir_config_capabilities_get_type;
  end;

function GVIR_CONFIG_CAPABILITIES(obj : Pointer) : PGVirConfigCapabilities;
begin
  Result := PGVirConfigCapabilities(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_CAPABILITIES));
end;

function GVIR_CONFIG_CAPABILITIES_CLASS(klass : Pointer) : PGVirConfigCapabilitiesClass;
begin
  Result := PGVirConfigCapabilitiesClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_CAPABILITIES));
end;

function GVIR_CONFIG_IS_CAPABILITIES(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_CAPABILITIES);
end;

function GVIR_CONFIG_IS_CAPABILITIES_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_CAPABILITIES);
end;

function GVIR_CONFIG_CAPABILITIES_GET_CLASS(obj : Pointer) : PGVirConfigCapabilitiesClass;
begin
  Result := PGVirConfigCapabilitiesClass(PGTypeInstance(obj)^.g_class);
end;



end.
