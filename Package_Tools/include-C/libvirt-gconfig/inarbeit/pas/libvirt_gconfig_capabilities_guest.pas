unit libvirt_gconfig_capabilities_guest;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-capabilities-guest.h: libvirt guest capabilities
 *
 * Copyright (C) 2010-2012 Red Hat, Inc.
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
 * Authors: Zeeshan Ali <zeenix@redhat.com>
 *          Daniel P. Berrange <berrange@redhat.com>
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)
{$include "libvirt-gconfig-domain-os.h"}
{$include "libvirt-gconfig-capabilities-guest-arch.h"}

type
{ Do not add fields to this struct  }
  PGVirConfigCapabilitiesGuest = ^TGVirConfigCapabilitiesGuest;
  TGVirConfigCapabilitiesGuest = record
      parent : TGVirConfigObject;
      priv : PGVirConfigCapabilitiesGuestPrivate;
    end;

  PGVirConfigCapabilitiesGuestClass = ^TGVirConfigCapabilitiesGuestClass;
  TGVirConfigCapabilitiesGuestClass = record
      parent_class : TGVirConfigObjectClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_capabilities_guest_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_capabilities_guest_get_os_type(guest:PGVirConfigCapabilitiesGuest):TGVirConfigDomainOsType;cdecl;external libvirtgconfig;
function gvir_config_capabilities_guest_get_arch(guest:PGVirConfigCapabilitiesGuest):PGVirConfigCapabilitiesGuestArch;cdecl;external libvirtgconfig;
function gvir_config_capabilities_guest_get_features(guest:PGVirConfigCapabilitiesGuest):PGList;cdecl;external libvirtgconfig;

// === Konventiert am: 17-10-26 19:52:29 ===

function GVIR_CONFIG_TYPE_CAPABILITIES_GUEST : TGType;
function GVIR_CONFIG_CAPABILITIES_GUEST(obj : Pointer) : PGVirConfigCapabilitiesGuest;
function GVIR_CONFIG_CAPABILITIES_GUEST_CLASS(klass : Pointer) : PGVirConfigCapabilitiesGuestClass;
function GVIR_CONFIG_IS_CAPABILITIES_GUEST(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_CAPABILITIES_GUEST_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_CAPABILITIES_GUEST_GET_CLASS(obj : Pointer) : PGVirConfigCapabilitiesGuestClass;

implementation

function GVIR_CONFIG_TYPE_CAPABILITIES_GUEST : TGType;
  begin
    GVIR_CONFIG_TYPE_CAPABILITIES_GUEST:=gvir_config_capabilities_guest_get_type;
  end;

function GVIR_CONFIG_CAPABILITIES_GUEST(obj : Pointer) : PGVirConfigCapabilitiesGuest;
begin
  Result := PGVirConfigCapabilitiesGuest(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_CAPABILITIES_GUEST));
end;

function GVIR_CONFIG_CAPABILITIES_GUEST_CLASS(klass : Pointer) : PGVirConfigCapabilitiesGuestClass;
begin
  Result := PGVirConfigCapabilitiesGuestClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_CAPABILITIES_GUEST));
end;

function GVIR_CONFIG_IS_CAPABILITIES_GUEST(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_CAPABILITIES_GUEST);
end;

function GVIR_CONFIG_IS_CAPABILITIES_GUEST_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_CAPABILITIES_GUEST);
end;

function GVIR_CONFIG_CAPABILITIES_GUEST_GET_CLASS(obj : Pointer) : PGVirConfigCapabilitiesGuestClass;
begin
  Result := PGVirConfigCapabilitiesGuestClass(PGTypeInstance(obj)^.g_class);
end;



end.
