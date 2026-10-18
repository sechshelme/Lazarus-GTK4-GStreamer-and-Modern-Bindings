unit libvirt_gconfig_storage_vol;

interface

uses
  fp_glib2, fp_virtgconfig;

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


function gvir_config_storage_vol_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_storage_vol_new:PGVirConfigStorageVol;cdecl;external libvirtgconfig;
function gvir_config_storage_vol_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigStorageVol;cdecl;external libvirtgconfig;
procedure gvir_config_storage_vol_set_allocation(vol:PGVirConfigStorageVol; allocation:Tguint64);cdecl;external libvirtgconfig;
procedure gvir_config_storage_vol_set_backing_store(vol:PGVirConfigStorageVol; backing_store:PGVirConfigStorageVolBackingStore);cdecl;external libvirtgconfig;
procedure gvir_config_storage_vol_set_capacity(vol:PGVirConfigStorageVol; capacity:Tguint64);cdecl;external libvirtgconfig;
procedure gvir_config_storage_vol_set_name(vol:PGVirConfigStorageVol; name:Pchar);cdecl;external libvirtgconfig;
procedure gvir_config_storage_vol_set_target(vol:PGVirConfigStorageVol; target:PGVirConfigStorageVolTarget);cdecl;external libvirtgconfig;

// === Konventiert am: 18-10-26 12:52:48 ===

function GVIR_CONFIG_TYPE_STORAGE_VOL : TGType;
function GVIR_CONFIG_STORAGE_VOL(obj : Pointer) : PGVirConfigStorageVol;
function GVIR_CONFIG_STORAGE_VOL_CLASS(klass : Pointer) : PGVirConfigStorageVolClass;
function GVIR_CONFIG_IS_STORAGE_VOL(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_STORAGE_VOL_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_STORAGE_VOL_GET_CLASS(obj : Pointer) : PGVirConfigStorageVolClass;

implementation

function GVIR_CONFIG_TYPE_STORAGE_VOL : TGType;
  begin
    GVIR_CONFIG_TYPE_STORAGE_VOL:=gvir_config_storage_vol_get_type;
  end;

function GVIR_CONFIG_STORAGE_VOL(obj : Pointer) : PGVirConfigStorageVol;
begin
  Result := PGVirConfigStorageVol(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_STORAGE_VOL));
end;

function GVIR_CONFIG_STORAGE_VOL_CLASS(klass : Pointer) : PGVirConfigStorageVolClass;
begin
  Result := PGVirConfigStorageVolClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_STORAGE_VOL));
end;

function GVIR_CONFIG_IS_STORAGE_VOL(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_STORAGE_VOL);
end;

function GVIR_CONFIG_IS_STORAGE_VOL_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_STORAGE_VOL);
end;

function GVIR_CONFIG_STORAGE_VOL_GET_CLASS(obj : Pointer) : PGVirConfigStorageVolClass;
begin
  Result := PGVirConfigStorageVolClass(PGTypeInstance(obj)^.g_class);
end;



end.
