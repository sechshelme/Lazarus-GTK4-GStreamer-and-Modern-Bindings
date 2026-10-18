
unit libvirt_gconfig_storage_pool;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_storage_pool.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_storage_pool
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
PGVirConfigStoragePool  = ^GVirConfigStoragePool;
PGVirConfigStoragePoolClass  = ^GVirConfigStoragePoolClass;
PGVirConfigStoragePoolPrivate  = ^GVirConfigStoragePoolPrivate;
PGVirConfigStoragePoolSource  = ^GVirConfigStoragePoolSource;
PGVirConfigStoragePoolTarget  = ^GVirConfigStoragePoolTarget;
PGVirConfigStoragePoolType  = ^GVirConfigStoragePoolType;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-storage-pool.h: libvirt storage pool configuration
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
{$include <libvirt-gconfig/libvirt-gconfig-storage-pool-source.h>}
{$include <libvirt-gconfig/libvirt-gconfig-storage-pool-target.h>}

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_STORAGE_POOL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_STORAGE_POOL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_STORAGE_POOL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_STORAGE_POOL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_STORAGE_POOL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_STORAGE_POOL_GET_CLASS(obj : longint) : longint;

type
{ Do not add fields to this struct  }
  PGVirConfigStoragePool = ^TGVirConfigStoragePool;
  TGVirConfigStoragePool = record
      parent : TGVirConfigObject;
      priv : PGVirConfigStoragePoolPrivate;
    end;

  PGVirConfigStoragePoolClass = ^TGVirConfigStoragePoolClass;
  TGVirConfigStoragePoolClass = record
      parent_class : TGVirConfigObjectClass;
      padding : array[0..19] of Tgpointer;
    end;


  PGVirConfigStoragePoolType = ^TGVirConfigStoragePoolType;
  TGVirConfigStoragePoolType =  Longint;
  Const
    GVIR_CONFIG_STORAGE_POOL_TYPE_DIR = 0;
    GVIR_CONFIG_STORAGE_POOL_TYPE_FS = 1;
    GVIR_CONFIG_STORAGE_POOL_TYPE_NETFS = 2;
    GVIR_CONFIG_STORAGE_POOL_TYPE_LOGICAL = 3;
    GVIR_CONFIG_STORAGE_POOL_TYPE_DISK = 4;
    GVIR_CONFIG_STORAGE_POOL_TYPE_ISCSI = 5;
    GVIR_CONFIG_STORAGE_POOL_TYPE_SCSI = 6;
    GVIR_CONFIG_STORAGE_POOL_TYPE_MPATH = 7;
;

function gvir_config_storage_pool_get_type:TGType;cdecl;external;
function gvir_config_storage_pool_new:PGVirConfigStoragePool;cdecl;external;
(* Const before type ignored *)
function gvir_config_storage_pool_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigStoragePool;cdecl;external;
function gvir_config_storage_pool_get_allocation(pool:PGVirConfigStoragePool):Tguint64;cdecl;external;
procedure gvir_config_storage_pool_set_allocation(pool:PGVirConfigStoragePool; allocation:Tguint64);cdecl;external;
function gvir_config_storage_pool_get_available(pool:PGVirConfigStoragePool):Tguint64;cdecl;external;
procedure gvir_config_storage_pool_set_available(pool:PGVirConfigStoragePool; available:Tguint64);cdecl;external;
function gvir_config_storage_pool_get_capacity(pool:PGVirConfigStoragePool):Tguint64;cdecl;external;
procedure gvir_config_storage_pool_set_capacity(pool:PGVirConfigStoragePool; capacity:Tguint64);cdecl;external;
(* Const before type ignored *)
function gvir_config_storage_pool_get_name(pool:PGVirConfigStoragePool):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gvir_config_storage_pool_set_name(pool:PGVirConfigStoragePool; name:Pchar);cdecl;external;
function gvir_config_storage_pool_get_pool_type(pool:PGVirConfigStoragePool):TGVirConfigStoragePoolType;cdecl;external;
procedure gvir_config_storage_pool_set_pool_type(pool:PGVirConfigStoragePool; _type:TGVirConfigStoragePoolType);cdecl;external;
function gvir_config_storage_pool_get_source(pool:PGVirConfigStoragePool):PGVirConfigStoragePoolSource;cdecl;external;
procedure gvir_config_storage_pool_set_source(pool:PGVirConfigStoragePool; source:PGVirConfigStoragePoolSource);cdecl;external;
function gvir_config_storage_pool_get_target(pool:PGVirConfigStoragePool):PGVirConfigStoragePoolTarget;cdecl;external;
procedure gvir_config_storage_pool_set_target(pool:PGVirConfigStoragePool; target:PGVirConfigStoragePoolTarget);cdecl;external;
(* Const before type ignored *)
function gvir_config_storage_pool_get_uuid(pool:PGVirConfigStoragePool):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gvir_config_storage_pool_set_uuid(pool:PGVirConfigStoragePool; uuid:Pchar);cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_STORAGE_POOL : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_STORAGE_POOL:=gvir_config_storage_pool_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_STORAGE_POOL(obj : longint) : longint;
begin
  GVIR_CONFIG_STORAGE_POOL:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_STORAGE_POOL,GVirConfigStoragePool);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_STORAGE_POOL_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_STORAGE_POOL_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_STORAGE_POOL,GVirConfigStoragePoolClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_STORAGE_POOL(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_STORAGE_POOL:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_STORAGE_POOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_STORAGE_POOL_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_STORAGE_POOL_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_STORAGE_POOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_STORAGE_POOL_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_STORAGE_POOL_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_STORAGE_POOL,GVirConfigStoragePoolClass);
end;


end.
