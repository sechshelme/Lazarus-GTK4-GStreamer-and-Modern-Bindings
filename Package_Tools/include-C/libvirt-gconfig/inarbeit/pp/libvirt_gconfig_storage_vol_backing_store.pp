
unit libvirt_gconfig_storage_vol_backing_store;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_storage_vol_backing_store.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_storage_vol_backing_store.h
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
PGVirConfigStorageVolBackingStore  = ^GVirConfigStorageVolBackingStore;
PGVirConfigStorageVolBackingStoreClass  = ^GVirConfigStorageVolBackingStoreClass;
PGVirConfigStorageVolBackingStorePrivate  = ^GVirConfigStorageVolBackingStorePrivate;
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

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_STORAGE_VOL_BACKING_STORE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_STORAGE_VOL_BACKING_STORE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_STORAGE_VOL_BACKING_STORE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_STORAGE_VOL_BACKING_STORE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_STORAGE_VOL_BACKING_STORE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_STORAGE_VOL_BACKING_STORE_GET_CLASS(obj : longint) : longint;

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


function gvir_config_storage_vol_backing_store_get_type:TGType;cdecl;external;
function gvir_config_storage_vol_backing_store_new:PGVirConfigStorageVolBackingStore;cdecl;external;
(* Const before type ignored *)
function gvir_config_storage_vol_backing_store_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigStorageVolBackingStore;cdecl;external;
(* Const before type ignored *)
procedure gvir_config_storage_vol_backing_store_set_format(backing_store:PGVirConfigStorageVolBackingStore; format:Pchar);cdecl;external;
(* Const before type ignored *)
procedure gvir_config_storage_vol_backing_store_set_path(backing_store:PGVirConfigStorageVolBackingStore; path:Pchar);cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_STORAGE_VOL_BACKING_STORE : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_STORAGE_VOL_BACKING_STORE:=gvir_config_storage_vol_backing_store_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_STORAGE_VOL_BACKING_STORE(obj : longint) : longint;
begin
  GVIR_CONFIG_STORAGE_VOL_BACKING_STORE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_STORAGE_VOL_BACKING_STORE,GVirConfigStorageVolBackingStore);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_STORAGE_VOL_BACKING_STORE_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_STORAGE_VOL_BACKING_STORE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_STORAGE_VOL_BACKING_STORE,GVirConfigStorageVolBackingStoreClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_STORAGE_VOL_BACKING_STORE(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_STORAGE_VOL_BACKING_STORE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_STORAGE_VOL_BACKING_STORE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_STORAGE_VOL_BACKING_STORE_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_STORAGE_VOL_BACKING_STORE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_STORAGE_VOL_BACKING_STORE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_STORAGE_VOL_BACKING_STORE_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_STORAGE_VOL_BACKING_STORE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_STORAGE_VOL_BACKING_STORE,GVirConfigStorageVolBackingStoreClass);
end;


end.
