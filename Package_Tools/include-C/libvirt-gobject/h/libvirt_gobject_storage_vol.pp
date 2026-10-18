
unit libvirt_gobject_storage_vol;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gobject_storage_vol.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gobject_storage_vol.h
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
Pgchar  = ^gchar;
PGError  = ^GError;
PGVirConfigStorageVol  = ^GVirConfigStorageVol;
PGVirStorageVol  = ^GVirStorageVol;
PGVirStorageVolClass  = ^GVirStorageVolClass;
PGVirStorageVolInfo  = ^GVirStorageVolInfo;
PGVirStorageVolPrivate  = ^GVirStorageVolPrivate;
PGVirStorageVolResizeFlags  = ^GVirStorageVolResizeFlags;
PGVirStorageVolType  = ^GVirStorageVolType;
PGVirStream  = ^GVirStream;
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
function GVIR_TYPE_STORAGE_VOL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_STORAGE_VOL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_STORAGE_VOL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_STORAGE_VOL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_STORAGE_VOL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_STORAGE_VOL_GET_CLASS(obj : longint) : longint;

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


function gvir_storage_vol_get_type:TGType;cdecl;external;
function gvir_storage_vol_info_get_type:TGType;cdecl;external;
function gvir_storage_vol_handle_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gvir_storage_vol_get_name(vol:PGVirStorageVol):Pgchar;cdecl;external;
(* Const before type ignored *)
function gvir_storage_vol_get_path(vol:PGVirStorageVol; error:PPGError):Pgchar;cdecl;external;
function gvir_storage_vol_delete(vol:PGVirStorageVol; flags:Tguint; err:PPGError):Tgboolean;cdecl;external;
function gvir_storage_vol_get_config(vol:PGVirStorageVol; flags:Tguint; err:PPGError):PGVirConfigStorageVol;cdecl;external;
function gvir_storage_vol_get_info(vol:PGVirStorageVol; err:PPGError):PGVirStorageVolInfo;cdecl;external;
function gvir_storage_vol_resize(vol:PGVirStorageVol; capacity:Tguint64; flags:Tguint; err:PPGError):Tgboolean;cdecl;external;
function gvir_storage_vol_download(vol:PGVirStorageVol; stream:PGVirStream; offset:Tguint64; length:Tguint64; flags:Tguint; 
           err:PPGError):Tgboolean;cdecl;external;
function gvir_storage_vol_upload(vol:PGVirStorageVol; stream:PGVirStream; offset:Tguint64; length:Tguint64; flags:Tguint; 
           err:PPGError):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_TYPE_STORAGE_VOL : longint; { return type might be wrong }
  begin
    GVIR_TYPE_STORAGE_VOL:=gvir_storage_vol_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_STORAGE_VOL(obj : longint) : longint;
begin
  GVIR_STORAGE_VOL:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_TYPE_STORAGE_VOL,GVirStorageVol);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_STORAGE_VOL_CLASS(klass : longint) : longint;
begin
  GVIR_STORAGE_VOL_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_TYPE_STORAGE_VOL,GVirStorageVolClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_STORAGE_VOL(obj : longint) : longint;
begin
  GVIR_IS_STORAGE_VOL:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_TYPE_STORAGE_VOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_STORAGE_VOL_CLASS(klass : longint) : longint;
begin
  GVIR_IS_STORAGE_VOL_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_TYPE_STORAGE_VOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_STORAGE_VOL_GET_CLASS(obj : longint) : longint;
begin
  GVIR_STORAGE_VOL_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_TYPE_STORAGE_VOL,GVirStorageVolClass);
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
