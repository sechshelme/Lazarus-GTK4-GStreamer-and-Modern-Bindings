unit libvirt_gconfig_capabilities_guest_feature;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-capabilities-guest-feature.h: libvirt guest feature capabilities
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

type
{ Do not add fields to this struct  }
  PGVirConfigCapabilitiesGuestFeature = ^TGVirConfigCapabilitiesGuestFeature;
  TGVirConfigCapabilitiesGuestFeature = record
      parent : TGVirConfigObject;
      priv : PGVirConfigCapabilitiesGuestFeaturePrivate;
    end;

  PGVirConfigCapabilitiesGuestFeatureClass = ^TGVirConfigCapabilitiesGuestFeatureClass;
  TGVirConfigCapabilitiesGuestFeatureClass = record
      parent_class : TGVirConfigObjectClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_capabilities_guest_feature_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_capabilities_guest_feature_get_name(feature:PGVirConfigCapabilitiesGuestFeature):Pgchar;cdecl;external libvirtgconfig;

// === Konventiert am: 17-10-26 19:52:15 ===

function GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_FEATURE : TGType;
function GVIR_CONFIG_CAPABILITIES_GUEST_FEATURE(obj : Pointer) : PGVirConfigCapabilitiesGuestFeature;
function GVIR_CONFIG_CAPABILITIES_GUEST_FEATURE_CLASS(klass : Pointer) : PGVirConfigCapabilitiesGuestFeatureClass;
function GVIR_CONFIG_IS_CAPABILITIES_GUEST_FEATURE(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_CAPABILITIES_GUEST_FEATURE_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_CAPABILITIES_GUEST_FEATURE_GET_CLASS(obj : Pointer) : PGVirConfigCapabilitiesGuestFeatureClass;

implementation

function GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_FEATURE : TGType;
  begin
    GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_FEATURE:=gvir_config_capabilities_guest_feature_get_type;
  end;

function GVIR_CONFIG_CAPABILITIES_GUEST_FEATURE(obj : Pointer) : PGVirConfigCapabilitiesGuestFeature;
begin
  Result := PGVirConfigCapabilitiesGuestFeature(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_FEATURE));
end;

function GVIR_CONFIG_CAPABILITIES_GUEST_FEATURE_CLASS(klass : Pointer) : PGVirConfigCapabilitiesGuestFeatureClass;
begin
  Result := PGVirConfigCapabilitiesGuestFeatureClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_FEATURE));
end;

function GVIR_CONFIG_IS_CAPABILITIES_GUEST_FEATURE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_FEATURE);
end;

function GVIR_CONFIG_IS_CAPABILITIES_GUEST_FEATURE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_FEATURE);
end;

function GVIR_CONFIG_CAPABILITIES_GUEST_FEATURE_GET_CLASS(obj : Pointer) : PGVirConfigCapabilitiesGuestFeatureClass;
begin
  Result := PGVirConfigCapabilitiesGuestFeatureClass(PGTypeInstance(obj)^.g_class);
end;



end.
