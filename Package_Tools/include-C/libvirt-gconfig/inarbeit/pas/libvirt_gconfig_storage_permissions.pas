unit libvirt_gconfig_storage_permissions;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-storage-permissions.h: libvirt storage permissions configuration
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
 * Author: Christophe Fergeau
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)

type
{ Do not add fields to this struct  }
  PGVirConfigStoragePermissions = ^TGVirConfigStoragePermissions;
  TGVirConfigStoragePermissions = record
      parent : TGVirConfigObject;
      priv : PGVirConfigStoragePermissionsPrivate;
    end;

  PGVirConfigStoragePermissionsClass = ^TGVirConfigStoragePermissionsClass;
  TGVirConfigStoragePermissionsClass = record
      parent_class : TGVirConfigObjectClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_storage_permissions_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_storage_permissions_new:PGVirConfigStoragePermissions;cdecl;external libvirtgconfig;
function gvir_config_storage_permissions_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigStoragePermissions;cdecl;external libvirtgconfig;
function gvir_config_storage_permissions_get_group(perms:PGVirConfigStoragePermissions):Tguint;cdecl;external libvirtgconfig;
procedure gvir_config_storage_permissions_set_group(perms:PGVirConfigStoragePermissions; group:Tguint);cdecl;external libvirtgconfig;
function gvir_config_storage_permissions_get_label(perms:PGVirConfigStoragePermissions):Pchar;cdecl;external libvirtgconfig;
procedure gvir_config_storage_permissions_set_label(perms:PGVirConfigStoragePermissions; _label:Pchar);cdecl;external libvirtgconfig;
function gvir_config_storage_permissions_get_mode(perms:PGVirConfigStoragePermissions):Tguint;cdecl;external libvirtgconfig;
procedure gvir_config_storage_permissions_set_mode(perms:PGVirConfigStoragePermissions; mode:Tguint);cdecl;external libvirtgconfig;
function gvir_config_storage_permissions_get_owner(perms:PGVirConfigStoragePermissions):Tguint;cdecl;external libvirtgconfig;
procedure gvir_config_storage_permissions_set_owner(perms:PGVirConfigStoragePermissions; owner:Tguint);cdecl;external libvirtgconfig;

// === Konventiert am: 18-10-26 12:52:59 ===

function GVIR_CONFIG_TYPE_STORAGE_PERMISSIONS : TGType;
function GVIR_CONFIG_STORAGE_PERMISSIONS(obj : Pointer) : PGVirConfigStoragePermissions;
function GVIR_CONFIG_STORAGE_PERMISSIONS_CLASS(klass : Pointer) : PGVirConfigStoragePermissionsClass;
function GVIR_CONFIG_IS_STORAGE_PERMISSIONS(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_STORAGE_PERMISSIONS_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_STORAGE_PERMISSIONS_GET_CLASS(obj : Pointer) : PGVirConfigStoragePermissionsClass;

implementation

function GVIR_CONFIG_TYPE_STORAGE_PERMISSIONS : TGType;
  begin
    GVIR_CONFIG_TYPE_STORAGE_PERMISSIONS:=gvir_config_storage_permissions_get_type;
  end;

function GVIR_CONFIG_STORAGE_PERMISSIONS(obj : Pointer) : PGVirConfigStoragePermissions;
begin
  Result := PGVirConfigStoragePermissions(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_STORAGE_PERMISSIONS));
end;

function GVIR_CONFIG_STORAGE_PERMISSIONS_CLASS(klass : Pointer) : PGVirConfigStoragePermissionsClass;
begin
  Result := PGVirConfigStoragePermissionsClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_STORAGE_PERMISSIONS));
end;

function GVIR_CONFIG_IS_STORAGE_PERMISSIONS(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_STORAGE_PERMISSIONS);
end;

function GVIR_CONFIG_IS_STORAGE_PERMISSIONS_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_STORAGE_PERMISSIONS);
end;

function GVIR_CONFIG_STORAGE_PERMISSIONS_GET_CLASS(obj : Pointer) : PGVirConfigStoragePermissionsClass;
begin
  Result := PGVirConfigStoragePermissionsClass(PGTypeInstance(obj)^.g_class);
end;



end.
