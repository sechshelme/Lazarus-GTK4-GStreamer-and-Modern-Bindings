unit libvirt_gconfig_storage_vol_target;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-storage-vol-target.c: libvirt storage volume target configuration
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
 * Author: Christophe Fergeau <cfergeau@redhat.com>
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)

type
{ Do not add fields to this struct  }
  PGVirConfigStorageVolTarget = ^TGVirConfigStorageVolTarget;
  TGVirConfigStorageVolTarget = record
      parent : TGVirConfigObject;
      priv : PGVirConfigStorageVolTargetPrivate;
    end;

  PGVirConfigStorageVolTargetClass = ^TGVirConfigStorageVolTargetClass;
  TGVirConfigStorageVolTargetClass = record
      parent_class : TGVirConfigObjectClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_storage_vol_target_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_storage_vol_target_new:PGVirConfigStorageVolTarget;cdecl;external libvirtgconfig;
function gvir_config_storage_vol_target_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigStorageVolTarget;cdecl;external libvirtgconfig;
procedure gvir_config_storage_vol_target_set_compat(target:PGVirConfigStorageVolTarget; compat:Pchar);cdecl;external libvirtgconfig;
procedure gvir_config_storage_vol_target_set_format(target:PGVirConfigStorageVolTarget; format:Pchar);cdecl;external libvirtgconfig;
procedure gvir_config_storage_vol_target_set_permissions(target:PGVirConfigStorageVolTarget; perms:PGVirConfigStoragePermissions);cdecl;external libvirtgconfig;
type
  PGVirConfigStorageVolTargetFeatures = ^TGVirConfigStorageVolTargetFeatures;
  TGVirConfigStorageVolTargetFeatures =  Longint;
  Const
    GVIR_CONFIG_STORAGE_VOL_TARGET_FEATURE_LAZY_REFCOUNT = 1 shl 0;
;

procedure gvir_config_storage_vol_target_set_features(target:PGVirConfigStorageVolTarget; features:Tguint64);cdecl;external libvirtgconfig;

// === Konventiert am: 18-10-26 12:52:40 ===

function GVIR_CONFIG_TYPE_STORAGE_VOL_TARGET : TGType;
function GVIR_CONFIG_STORAGE_VOL_TARGET(obj : Pointer) : PGVirConfigStorageVolTarget;
function GVIR_CONFIG_STORAGE_VOL_TARGET_CLASS(klass : Pointer) : PGVirConfigStorageVolTargetClass;
function GVIR_CONFIG_IS_STORAGE_VOL_TARGET(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_STORAGE_VOL_TARGET_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_STORAGE_VOL_TARGET_GET_CLASS(obj : Pointer) : PGVirConfigStorageVolTargetClass;

implementation

function GVIR_CONFIG_TYPE_STORAGE_VOL_TARGET : TGType;
  begin
    GVIR_CONFIG_TYPE_STORAGE_VOL_TARGET:=gvir_config_storage_vol_target_get_type;
  end;

function GVIR_CONFIG_STORAGE_VOL_TARGET(obj : Pointer) : PGVirConfigStorageVolTarget;
begin
  Result := PGVirConfigStorageVolTarget(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_STORAGE_VOL_TARGET));
end;

function GVIR_CONFIG_STORAGE_VOL_TARGET_CLASS(klass : Pointer) : PGVirConfigStorageVolTargetClass;
begin
  Result := PGVirConfigStorageVolTargetClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_STORAGE_VOL_TARGET));
end;

function GVIR_CONFIG_IS_STORAGE_VOL_TARGET(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_STORAGE_VOL_TARGET);
end;

function GVIR_CONFIG_IS_STORAGE_VOL_TARGET_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_STORAGE_VOL_TARGET);
end;

function GVIR_CONFIG_STORAGE_VOL_TARGET_GET_CLASS(obj : Pointer) : PGVirConfigStorageVolTargetClass;
begin
  Result := PGVirConfigStorageVolTargetClass(PGTypeInstance(obj)^.g_class);
end;



end.
