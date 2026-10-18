
unit libvirt_gconfig_storage_vol;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_storage_vol.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_storage_vol
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
PGVirConfigStorageVol  = ^GVirConfigStorageVol;
PGVirConfigStorageVolBackingStore  = ^GVirConfigStorageVolBackingStore;
PGVirConfigStorageVolClass  = ^GVirConfigStorageVolClass;
PGVirConfigStorageVolPrivate  = ^GVirConfigStorageVolPrivate;
PGVirConfigStorageVolTarget  = ^GVirConfigStorageVolTarget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-storage-vol.c: libvirt storage volume configuration
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
{$include <libvirt-gconfig/libvirt-gconfig-storage-vol-backing-store.h>}
{$include <libvirt-gconfig/libvirt-gconfig-storage-vol-target.h>}

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_STORAGE_VOL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_STORAGE_VOL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_STORAGE_VOL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_STORAGE_VOL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_STORAGE_VOL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_STORAGE_VOL_GET_CLASS(obj : longint) : longint;

type
{ Do not add fields to this struct  }
  PGVirConfigStorageVol = ^TGVirConfigStorageVol;
  TGVirConfigStorageVol = record
      parent : TGVirConfigObject;
      priv : PGVirConfigStorageVolPrivate;
    end;

  PGVirConfigStorageVolClass = ^TGVirConfigStorageVolClass;
  TGVirConfigStorageVolClass = record
      parent_class : TGVirConfigObjectClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_storage_vol_get_type:TGType;cdecl;external;
function gvir_config_storage_vol_new:PGVirConfigStorageVol;cdecl;external;
(* Const before type ignored *)
function gvir_config_storage_vol_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigStorageVol;cdecl;external;
procedure gvir_config_storage_vol_set_allocation(vol:PGVirConfigStorageVol; allocation:Tguint64);cdecl;external;
procedure gvir_config_storage_vol_set_backing_store(vol:PGVirConfigStorageVol; backing_store:PGVirConfigStorageVolBackingStore);cdecl;external;
procedure gvir_config_storage_vol_set_capacity(vol:PGVirConfigStorageVol; capacity:Tguint64);cdecl;external;
(* Const before type ignored *)
procedure gvir_config_storage_vol_set_name(vol:PGVirConfigStorageVol; name:Pchar);cdecl;external;
procedure gvir_config_storage_vol_set_target(vol:PGVirConfigStorageVol; target:PGVirConfigStorageVolTarget);cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_STORAGE_VOL : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_STORAGE_VOL:=gvir_config_storage_vol_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_STORAGE_VOL(obj : longint) : longint;
begin
  GVIR_CONFIG_STORAGE_VOL:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_STORAGE_VOL,GVirConfigStorageVol);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_STORAGE_VOL_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_STORAGE_VOL_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_STORAGE_VOL,GVirConfigStorageVolClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_STORAGE_VOL(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_STORAGE_VOL:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_STORAGE_VOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_STORAGE_VOL_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_STORAGE_VOL_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_STORAGE_VOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_STORAGE_VOL_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_STORAGE_VOL_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_STORAGE_VOL,GVirConfigStorageVolClass);
end;


end.
