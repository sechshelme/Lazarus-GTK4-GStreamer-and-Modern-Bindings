
unit libvirt_gconfig_storage_pool_source;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_storage_pool_source.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_storage_pool_source.h
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
PGVirConfigStoragePoolSource  = ^GVirConfigStoragePoolSource;
PGVirConfigStoragePoolSourceClass  = ^GVirConfigStoragePoolSourceClass;
PGVirConfigStoragePoolSourcePrivate  = ^GVirConfigStoragePoolSourcePrivate;
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

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_STORAGE_POOL_SOURCE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_STORAGE_POOL_SOURCE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_STORAGE_POOL_SOURCE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_STORAGE_POOL_SOURCE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_STORAGE_POOL_SOURCE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_STORAGE_POOL_SOURCE_GET_CLASS(obj : longint) : longint;

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


function gvir_config_storage_pool_source_get_type:TGType;cdecl;external;
function gvir_config_storage_pool_source_new:PGVirConfigStoragePoolSource;cdecl;external;
(* Const before type ignored *)
function gvir_config_storage_pool_source_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigStoragePoolSource;cdecl;external;
(* Const before type ignored *)
function gvir_config_storage_pool_source_get_adapter(source:PGVirConfigStoragePoolSource):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gvir_config_storage_pool_source_set_adapter(source:PGVirConfigStoragePoolSource; adapter:Pchar);cdecl;external;
(* Const before type ignored *)
function gvir_config_storage_pool_source_get_device_path(source:PGVirConfigStoragePoolSource):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gvir_config_storage_pool_source_set_device_path(source:PGVirConfigStoragePoolSource; device_path:Pchar);cdecl;external;
(* Const before type ignored *)
function gvir_config_storage_pool_source_get_directory(source:PGVirConfigStoragePoolSource):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gvir_config_storage_pool_source_set_directory(source:PGVirConfigStoragePoolSource; directory:Pchar);cdecl;external;
(* Const before type ignored *)
function gvir_config_storage_pool_source_get_format(source:PGVirConfigStoragePoolSource):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gvir_config_storage_pool_source_set_format(source:PGVirConfigStoragePoolSource; format:Pchar);cdecl;external;
(* Const before type ignored *)
function gvir_config_storage_pool_source_get_host(source:PGVirConfigStoragePoolSource):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gvir_config_storage_pool_source_set_host(source:PGVirConfigStoragePoolSource; host:Pchar);cdecl;external;
(* Const before type ignored *)
function gvir_config_storage_pool_source_get_name(source:PGVirConfigStoragePoolSource):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gvir_config_storage_pool_source_set_name(source:PGVirConfigStoragePoolSource; name:Pchar);cdecl;external;
(* Const before type ignored *)
function gvir_config_storage_pool_source_get_product(source:PGVirConfigStoragePoolSource):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gvir_config_storage_pool_source_set_product(source:PGVirConfigStoragePoolSource; product:Pchar);cdecl;external;
(* Const before type ignored *)
function gvir_config_storage_pool_source_get_vendor(source:PGVirConfigStoragePoolSource):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gvir_config_storage_pool_source_set_vendor(source:PGVirConfigStoragePoolSource; vendor:Pchar);cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_STORAGE_POOL_SOURCE : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_STORAGE_POOL_SOURCE:=gvir_config_storage_pool_source_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_STORAGE_POOL_SOURCE(obj : longint) : longint;
begin
  GVIR_CONFIG_STORAGE_POOL_SOURCE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_STORAGE_POOL_SOURCE,GVirConfigStoragePoolSource);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_STORAGE_POOL_SOURCE_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_STORAGE_POOL_SOURCE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_STORAGE_POOL_SOURCE,GVirConfigStoragePoolSourceClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_STORAGE_POOL_SOURCE(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_STORAGE_POOL_SOURCE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_STORAGE_POOL_SOURCE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_STORAGE_POOL_SOURCE_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_STORAGE_POOL_SOURCE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_STORAGE_POOL_SOURCE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_STORAGE_POOL_SOURCE_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_STORAGE_POOL_SOURCE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_STORAGE_POOL_SOURCE,GVirConfigStoragePoolSourceClass);
end;


end.
