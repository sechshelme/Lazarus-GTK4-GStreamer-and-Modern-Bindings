unit libvirt_gobject_storage_vol;

interface

uses
  fp_glib2, fp_virt_glib;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gobject-storage_vol.c: libvirt gobject integration
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
{$if !defined(__LIBVIRT_GOBJECT_H__) && !defined(LIBVIRT_GOBJECT_BUILD)}
{$error "Only <libvirt-gobject/libvirt-gobject.h> can be included directly."}
{$endif}
{$include <libvirt/libvirt.h>}
(** unsupported pragma#pragma once*)

{ was #define dname def_expr }
function GVIR_TYPE_STORAGE_VOL_INFO : longint; { return type might be wrong }

{ was #define dname def_expr }
function GVIR_TYPE_STORAGE_VOL_HANDLE : longint; { return type might be wrong }

type
{ Do not add fields to this struct  }
  PGVirStorageVol = ^TGVirStorageVol;
  TGVirStorageVol = record
      parent : TGObject;
      priv : PGVirStorageVolPrivate;
    end;

  PGVirStorageVolClass = ^TGVirStorageVolClass;
  TGVirStorageVolClass = record
      parent_class : TGObjectClass;
      padding : array[0..19] of Tgpointer;
    end;

{ Regular file based volume  }
{ Block based volume  }
{ Directory-passthrough based volume  }

  PGVirStorageVolType = ^TGVirStorageVolType;
  TGVirStorageVolType =  Longint;
  Const
    GVIR_STORAGE_VOL_STATE_FILE = 0;
    GVIR_STORAGE_VOL_STATE_BLOCK = 1;
    GVIR_STORAGE_VOL_STATE_DIR = 2;
;
{*
 * GVirStorageVolResizeFlags:
 * @GVIR_STORAGE_VOL_RESIZE_NONE: No flags
 * @GVIR_STORAGE_VOL_RESIZE_ALLOCATE: force allocation of new size
 * @GVIR_STORAGE_VOL_RESIZE_DELTA: size is relative to current
 * @GVIR_STORAGE_VOL_RESIZE_SHRINK: allow decrease in capacity. This combined
 * with #GVIR_STORAGE_VOL_RESIZE_DELTA, implies a negative delta.
  }
type
  PGVirStorageVolResizeFlags = ^TGVirStorageVolResizeFlags;
  TGVirStorageVolResizeFlags =  Longint;
  Const
    GVIR_STORAGE_VOL_RESIZE_NONE = 0;
    GVIR_STORAGE_VOL_RESIZE_ALLOCATE = VIR_STORAGE_VOL_RESIZE_ALLOCATE;
    GVIR_STORAGE_VOL_RESIZE_DELTA = VIR_STORAGE_VOL_RESIZE_DELTA;
    GVIR_STORAGE_VOL_RESIZE_SHRINK = VIR_STORAGE_VOL_RESIZE_SHRINK;
;
type
{ Type flags  }
{ Logical size bytes  }
{ Current allocation bytes  }
  PGVirStorageVolInfo = ^TGVirStorageVolInfo;
  TGVirStorageVolInfo = record
      _type : TGVirStorageVolType;
      capacity : Tguint64;
      allocation : Tguint64;
    end;


function gvir_storage_vol_get_type:TGType;cdecl;external libvirtgobject;
function gvir_storage_vol_info_get_type:TGType;cdecl;external libvirtgobject;
function gvir_storage_vol_handle_get_type:TGType;cdecl;external libvirtgobject;
function gvir_storage_vol_get_name(vol:PGVirStorageVol):Pgchar;cdecl;external libvirtgobject;
function gvir_storage_vol_get_path(vol:PGVirStorageVol; error:PPGError):Pgchar;cdecl;external libvirtgobject;
function gvir_storage_vol_delete(vol:PGVirStorageVol; flags:Tguint; err:PPGError):Tgboolean;cdecl;external libvirtgobject;
function gvir_storage_vol_get_config(vol:PGVirStorageVol; flags:Tguint; err:PPGError):PGVirConfigStorageVol;cdecl;external libvirtgobject;
function gvir_storage_vol_get_info(vol:PGVirStorageVol; err:PPGError):PGVirStorageVolInfo;cdecl;external libvirtgobject;
function gvir_storage_vol_resize(vol:PGVirStorageVol; capacity:Tguint64; flags:Tguint; err:PPGError):Tgboolean;cdecl;external libvirtgobject;
function gvir_storage_vol_download(vol:PGVirStorageVol; stream:PGVirStream; offset:Tguint64; length:Tguint64; flags:Tguint; 
           err:PPGError):Tgboolean;cdecl;external libvirtgobject;
function gvir_storage_vol_upload(vol:PGVirStorageVol; stream:PGVirStream; offset:Tguint64; length:Tguint64; flags:Tguint; 
           err:PPGError):Tgboolean;cdecl;external libvirtgobject;

// === Konventiert am: 18-10-26 19:31:34 ===

function GVIR_TYPE_STORAGE_VOL : TGType;
function GVIR_STORAGE_VOL(obj : Pointer) : PGVirStorageVol;
function GVIR_STORAGE_VOL_CLASS(klass : Pointer) : PGVirStorageVolClass;
function GVIR_IS_STORAGE_VOL(obj : Pointer) : Tgboolean;
function GVIR_IS_STORAGE_VOL_CLASS(klass : Pointer) : Tgboolean;
function GVIR_STORAGE_VOL_GET_CLASS(obj : Pointer) : PGVirStorageVolClass;

implementation

function GVIR_TYPE_STORAGE_VOL : TGType;
  begin
    GVIR_TYPE_STORAGE_VOL:=gvir_storage_vol_get_type;
  end;

function GVIR_STORAGE_VOL(obj : Pointer) : PGVirStorageVol;
begin
  Result := PGVirStorageVol(g_type_check_instance_cast(obj, GVIR_TYPE_STORAGE_VOL));
end;

function GVIR_STORAGE_VOL_CLASS(klass : Pointer) : PGVirStorageVolClass;
begin
  Result := PGVirStorageVolClass(g_type_check_class_cast(klass, GVIR_TYPE_STORAGE_VOL));
end;

function GVIR_IS_STORAGE_VOL(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_TYPE_STORAGE_VOL);
end;

function GVIR_IS_STORAGE_VOL_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_TYPE_STORAGE_VOL);
end;

function GVIR_STORAGE_VOL_GET_CLASS(obj : Pointer) : PGVirStorageVolClass;
begin
  Result := PGVirStorageVolClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname def_expr }
function GVIR_TYPE_STORAGE_VOL_INFO : longint; { return type might be wrong }
  begin
    GVIR_TYPE_STORAGE_VOL_INFO:=gvir_storage_vol_info_get_type;
  end;

{ was #define dname def_expr }
function GVIR_TYPE_STORAGE_VOL_HANDLE : longint; { return type might be wrong }
  begin
    GVIR_TYPE_STORAGE_VOL_HANDLE:=gvir_storage_vol_handle_get_type;
  end;


end.
