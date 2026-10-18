unit libvirt_gconfig_storage_pool_source;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-storage-pool-target.c: libvirt storage pool target configuration
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
  PGVirConfigStoragePoolSource = ^TGVirConfigStoragePoolSource;
  TGVirConfigStoragePoolSource = record
      parent : TGVirConfigObject;
      priv : PGVirConfigStoragePoolSourcePrivate;
    end;

  PGVirConfigStoragePoolSourceClass = ^TGVirConfigStoragePoolSourceClass;
  TGVirConfigStoragePoolSourceClass = record
      parent_class : TGVirConfigObjectClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_storage_pool_source_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_storage_pool_source_new:PGVirConfigStoragePoolSource;cdecl;external libvirtgconfig;
function gvir_config_storage_pool_source_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigStoragePoolSource;cdecl;external libvirtgconfig;
function gvir_config_storage_pool_source_get_adapter(source:PGVirConfigStoragePoolSource):Pchar;cdecl;external libvirtgconfig;
procedure gvir_config_storage_pool_source_set_adapter(source:PGVirConfigStoragePoolSource; adapter:Pchar);cdecl;external libvirtgconfig;
function gvir_config_storage_pool_source_get_device_path(source:PGVirConfigStoragePoolSource):Pchar;cdecl;external libvirtgconfig;
procedure gvir_config_storage_pool_source_set_device_path(source:PGVirConfigStoragePoolSource; device_path:Pchar);cdecl;external libvirtgconfig;
function gvir_config_storage_pool_source_get_directory(source:PGVirConfigStoragePoolSource):Pchar;cdecl;external libvirtgconfig;
procedure gvir_config_storage_pool_source_set_directory(source:PGVirConfigStoragePoolSource; directory:Pchar);cdecl;external libvirtgconfig;
function gvir_config_storage_pool_source_get_format(source:PGVirConfigStoragePoolSource):Pchar;cdecl;external libvirtgconfig;
procedure gvir_config_storage_pool_source_set_format(source:PGVirConfigStoragePoolSource; format:Pchar);cdecl;external libvirtgconfig;
function gvir_config_storage_pool_source_get_host(source:PGVirConfigStoragePoolSource):Pchar;cdecl;external libvirtgconfig;
procedure gvir_config_storage_pool_source_set_host(source:PGVirConfigStoragePoolSource; host:Pchar);cdecl;external libvirtgconfig;
function gvir_config_storage_pool_source_get_name(source:PGVirConfigStoragePoolSource):Pchar;cdecl;external libvirtgconfig;
procedure gvir_config_storage_pool_source_set_name(source:PGVirConfigStoragePoolSource; name:Pchar);cdecl;external libvirtgconfig;
function gvir_config_storage_pool_source_get_product(source:PGVirConfigStoragePoolSource):Pchar;cdecl;external libvirtgconfig;
procedure gvir_config_storage_pool_source_set_product(source:PGVirConfigStoragePoolSource; product:Pchar);cdecl;external libvirtgconfig;
function gvir_config_storage_pool_source_get_vendor(source:PGVirConfigStoragePoolSource):Pchar;cdecl;external libvirtgconfig;
procedure gvir_config_storage_pool_source_set_vendor(source:PGVirConfigStoragePoolSource; vendor:Pchar);cdecl;external libvirtgconfig;

// === Konventiert am: 18-10-26 12:52:54 ===

function GVIR_CONFIG_TYPE_STORAGE_POOL_SOURCE : TGType;
function GVIR_CONFIG_STORAGE_POOL_SOURCE(obj : Pointer) : PGVirConfigStoragePoolSource;
function GVIR_CONFIG_STORAGE_POOL_SOURCE_CLASS(klass : Pointer) : PGVirConfigStoragePoolSourceClass;
function GVIR_CONFIG_IS_STORAGE_POOL_SOURCE(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_STORAGE_POOL_SOURCE_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_STORAGE_POOL_SOURCE_GET_CLASS(obj : Pointer) : PGVirConfigStoragePoolSourceClass;

implementation

function GVIR_CONFIG_TYPE_STORAGE_POOL_SOURCE : TGType;
  begin
    GVIR_CONFIG_TYPE_STORAGE_POOL_SOURCE:=gvir_config_storage_pool_source_get_type;
  end;

function GVIR_CONFIG_STORAGE_POOL_SOURCE(obj : Pointer) : PGVirConfigStoragePoolSource;
begin
  Result := PGVirConfigStoragePoolSource(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_STORAGE_POOL_SOURCE));
end;

function GVIR_CONFIG_STORAGE_POOL_SOURCE_CLASS(klass : Pointer) : PGVirConfigStoragePoolSourceClass;
begin
  Result := PGVirConfigStoragePoolSourceClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_STORAGE_POOL_SOURCE));
end;

function GVIR_CONFIG_IS_STORAGE_POOL_SOURCE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_STORAGE_POOL_SOURCE);
end;

function GVIR_CONFIG_IS_STORAGE_POOL_SOURCE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_STORAGE_POOL_SOURCE);
end;

function GVIR_CONFIG_STORAGE_POOL_SOURCE_GET_CLASS(obj : Pointer) : PGVirConfigStoragePoolSourceClass;
begin
  Result := PGVirConfigStoragePoolSourceClass(PGTypeInstance(obj)^.g_class);
end;



end.
