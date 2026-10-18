
unit libvirt_gconfig_storage_permissions;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_storage_permissions.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_storage_permissions.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
Pgchar  = ^gchar;
PGError  = ^GError;
PGVirConfigStoragePermissions  = ^GVirConfigStoragePermissions;
PGVirConfigStoragePermissionsClass  = ^GVirConfigStoragePermissionsClass;
PGVirConfigStoragePermissionsPrivate  = ^GVirConfigStoragePermissionsPrivate;
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

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_STORAGE_PERMISSIONS : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_STORAGE_PERMISSIONS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_STORAGE_PERMISSIONS_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_STORAGE_PERMISSIONS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_STORAGE_PERMISSIONS_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_STORAGE_PERMISSIONS_GET_CLASS(obj : longint) : longint;

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


function gvir_config_storage_permissions_get_type:TGType;cdecl;external;
function gvir_config_storage_permissions_new:PGVirConfigStoragePermissions;cdecl;external;
(* Const before type ignored *)
function gvir_config_storage_permissions_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigStoragePermissions;cdecl;external;
function gvir_config_storage_permissions_get_group(perms:PGVirConfigStoragePermissions):Tguint;cdecl;external;
procedure gvir_config_storage_permissions_set_group(perms:PGVirConfigStoragePermissions; group:Tguint);cdecl;external;
(* Const before type ignored *)
function gvir_config_storage_permissions_get_label(perms:PGVirConfigStoragePermissions):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gvir_config_storage_permissions_set_label(perms:PGVirConfigStoragePermissions; _label:Pchar);cdecl;external;
function gvir_config_storage_permissions_get_mode(perms:PGVirConfigStoragePermissions):Tguint;cdecl;external;
procedure gvir_config_storage_permissions_set_mode(perms:PGVirConfigStoragePermissions; mode:Tguint);cdecl;external;
function gvir_config_storage_permissions_get_owner(perms:PGVirConfigStoragePermissions):Tguint;cdecl;external;
procedure gvir_config_storage_permissions_set_owner(perms:PGVirConfigStoragePermissions; owner:Tguint);cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_STORAGE_PERMISSIONS : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_STORAGE_PERMISSIONS:=gvir_config_storage_permissions_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_STORAGE_PERMISSIONS(obj : longint) : longint;
begin
  GVIR_CONFIG_STORAGE_PERMISSIONS:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_STORAGE_PERMISSIONS,GVirConfigStoragePermissions);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_STORAGE_PERMISSIONS_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_STORAGE_PERMISSIONS_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_STORAGE_PERMISSIONS,GVirConfigStoragePermissionsClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_STORAGE_PERMISSIONS(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_STORAGE_PERMISSIONS:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_STORAGE_PERMISSIONS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_STORAGE_PERMISSIONS_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_STORAGE_PERMISSIONS_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_STORAGE_PERMISSIONS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_STORAGE_PERMISSIONS_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_STORAGE_PERMISSIONS_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_STORAGE_PERMISSIONS,GVirConfigStoragePermissionsClass);
end;


end.
