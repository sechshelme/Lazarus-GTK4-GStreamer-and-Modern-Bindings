unit libvirt_gconfig_storage_vol_backing_store;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-storage-vol-backing-store.c: libvirt storage volume backing store configuration
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
 * Author: Christophe Fergeau <cfergeau@redhat.com>
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)

type
{ Do not add fields to this struct  }
  PGVirConfigStorageVolBackingStore = ^TGVirConfigStorageVolBackingStore;
  TGVirConfigStorageVolBackingStore = record
      parent : TGVirConfigObject;
      priv : PGVirConfigStorageVolBackingStorePrivate;
    end;

  PGVirConfigStorageVolBackingStoreClass = ^TGVirConfigStorageVolBackingStoreClass;
  TGVirConfigStorageVolBackingStoreClass = record
      parent_class : TGVirConfigObjectClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_storage_vol_backing_store_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_storage_vol_backing_store_new:PGVirConfigStorageVolBackingStore;cdecl;external libvirtgconfig;
function gvir_config_storage_vol_backing_store_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigStorageVolBackingStore;cdecl;external libvirtgconfig;
procedure gvir_config_storage_vol_backing_store_set_format(backing_store:PGVirConfigStorageVolBackingStore; format:Pchar);cdecl;external libvirtgconfig;
procedure gvir_config_storage_vol_backing_store_set_path(backing_store:PGVirConfigStorageVolBackingStore; path:Pchar);cdecl;external libvirtgconfig;

// === Konventiert am: 18-10-26 12:52:45 ===

function GVIR_CONFIG_TYPE_STORAGE_VOL_BACKING_STORE : TGType;
function GVIR_CONFIG_STORAGE_VOL_BACKING_STORE(obj : Pointer) : PGVirConfigStorageVolBackingStore;
function GVIR_CONFIG_STORAGE_VOL_BACKING_STORE_CLASS(klass : Pointer) : PGVirConfigStorageVolBackingStoreClass;
function GVIR_CONFIG_IS_STORAGE_VOL_BACKING_STORE(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_STORAGE_VOL_BACKING_STORE_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_STORAGE_VOL_BACKING_STORE_GET_CLASS(obj : Pointer) : PGVirConfigStorageVolBackingStoreClass;

implementation

function GVIR_CONFIG_TYPE_STORAGE_VOL_BACKING_STORE : TGType;
  begin
    GVIR_CONFIG_TYPE_STORAGE_VOL_BACKING_STORE:=gvir_config_storage_vol_backing_store_get_type;
  end;

function GVIR_CONFIG_STORAGE_VOL_BACKING_STORE(obj : Pointer) : PGVirConfigStorageVolBackingStore;
begin
  Result := PGVirConfigStorageVolBackingStore(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_STORAGE_VOL_BACKING_STORE));
end;

function GVIR_CONFIG_STORAGE_VOL_BACKING_STORE_CLASS(klass : Pointer) : PGVirConfigStorageVolBackingStoreClass;
begin
  Result := PGVirConfigStorageVolBackingStoreClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_STORAGE_VOL_BACKING_STORE));
end;

function GVIR_CONFIG_IS_STORAGE_VOL_BACKING_STORE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_STORAGE_VOL_BACKING_STORE);
end;

function GVIR_CONFIG_IS_STORAGE_VOL_BACKING_STORE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_STORAGE_VOL_BACKING_STORE);
end;

function GVIR_CONFIG_STORAGE_VOL_BACKING_STORE_GET_CLASS(obj : Pointer) : PGVirConfigStorageVolBackingStoreClass;
begin
  Result := PGVirConfigStorageVolBackingStoreClass(PGTypeInstance(obj)^.g_class);
end;



end.
