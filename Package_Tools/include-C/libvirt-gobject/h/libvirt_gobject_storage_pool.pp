
unit libvirt_gobject_storage_pool;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gobject_storage_pool.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gobject_storage_pool.h
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
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGError  = ^GError;
PGList  = ^GList;
PGVirConfigStoragePool  = ^GVirConfigStoragePool;
PGVirConfigStorageVol  = ^GVirConfigStorageVol;
PGVirStoragePool  = ^GVirStoragePool;
PGVirStoragePoolClass  = ^GVirStoragePoolClass;
PGVirStoragePoolInfo  = ^GVirStoragePoolInfo;
PGVirStoragePoolPrivate  = ^GVirStoragePoolPrivate;
PGVirStoragePoolState  = ^GVirStoragePoolState;
PGVirStorageVol  = ^GVirStorageVol;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gobject-storage_pool.c: libvirt gobject integration
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
(** unsupported pragma#pragma once*)

{ was #define dname def_expr }
function GVIR_TYPE_STORAGE_POOL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_STORAGE_POOL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_STORAGE_POOL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_STORAGE_POOL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_STORAGE_POOL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_STORAGE_POOL_GET_CLASS(obj : longint) : longint;

{ was #define dname def_expr }
function GVIR_TYPE_STORAGE_POOL_INFO : longint; { return type might be wrong }

{ was #define dname def_expr }
function GVIR_TYPE_STORAGE_POOL_HANDLE : longint; { return type might be wrong }

type
{ Do not add fields to this struct  }
  PGVirStoragePool = ^TGVirStoragePool;
  TGVirStoragePool = record
      parent : TGObject;
      priv : PGVirStoragePoolPrivate;
    end;

  PGVirStoragePoolClass = ^TGVirStoragePoolClass;
  TGVirStoragePoolClass = record
      parent_class : TGObjectClass;
      padding : array[0..19] of Tgpointer;
    end;

{ Not running  }
{ Initializing pool, not available  }
{ Running normally  }
{ Running degraded  }
{ Running, but not accessible  }

  PGVirStoragePoolState = ^TGVirStoragePoolState;
  TGVirStoragePoolState =  Longint;
  Const
    GVIR_STORAGE_POOL_STATE_INACTIVE = 0;
    GVIR_STORAGE_POOL_STATE_BUILDING = 1;
    GVIR_STORAGE_POOL_STATE_RUNNING = 2;
    GVIR_STORAGE_POOL_STATE_DEGRADED = 3;
    GVIR_STORAGE_POOL_STATE_INACCESSIBLE = 4;
;
type
{ the state  }
{ Logical size bytes  }
{ Current allocation bytes  }
{ Remaining free space bytes  }
  PGVirStoragePoolInfo = ^TGVirStoragePoolInfo;
  TGVirStoragePoolInfo = record
      state : TGVirStoragePoolState;
      capacity : Tguint64;
      allocation : Tguint64;
      available : Tguint64;
    end;


function gvir_storage_pool_get_type:TGType;cdecl;external;
function gvir_storage_pool_info_get_type:TGType;cdecl;external;
function gvir_storage_pool_handle_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gvir_storage_pool_get_name(pool:PGVirStoragePool):Pgchar;cdecl;external;
(* Const before type ignored *)
function gvir_storage_pool_get_uuid(pool:PGVirStoragePool):Pgchar;cdecl;external;
function gvir_storage_pool_get_active(pool:PGVirStoragePool):Tgboolean;cdecl;external;
function gvir_storage_pool_get_persistent(pool:PGVirStoragePool):Tgboolean;cdecl;external;
function gvir_storage_pool_get_config(pool:PGVirStoragePool; flags:Tguint; err:PPGError):PGVirConfigStoragePool;cdecl;external;
function gvir_storage_pool_get_info(pool:PGVirStoragePool; err:PPGError):PGVirStoragePoolInfo;cdecl;external;
function gvir_storage_pool_refresh(pool:PGVirStoragePool; cancellable:PGCancellable; err:PPGError):Tgboolean;cdecl;external;
procedure gvir_storage_pool_refresh_async(pool:PGVirStoragePool; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gvir_storage_pool_refresh_finish(pool:PGVirStoragePool; result:PGAsyncResult; err:PPGError):Tgboolean;cdecl;external;
function gvir_storage_pool_get_volumes(pool:PGVirStoragePool):PGList;cdecl;external;
(* Const before type ignored *)
function gvir_storage_pool_get_volume(pool:PGVirStoragePool; name:Pgchar):PGVirStorageVol;cdecl;external;
function gvir_storage_pool_create_volume(pool:PGVirStoragePool; conf:PGVirConfigStorageVol; err:PPGError):PGVirStorageVol;cdecl;external;
function gvir_storage_pool_build(pool:PGVirStoragePool; flags:Tguint; err:PPGError):Tgboolean;cdecl;external;
procedure gvir_storage_pool_build_async(pool:PGVirStoragePool; flags:Tguint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gvir_storage_pool_build_finish(pool:PGVirStoragePool; result:PGAsyncResult; err:PPGError):Tgboolean;cdecl;external;
function gvir_storage_pool_undefine(pool:PGVirStoragePool; err:PPGError):Tgboolean;cdecl;external;
procedure gvir_storage_pool_undefine_async(pool:PGVirStoragePool; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gvir_storage_pool_undefine_finish(pool:PGVirStoragePool; result:PGAsyncResult; err:PPGError):Tgboolean;cdecl;external;
function gvir_storage_pool_start(pool:PGVirStoragePool; flags:Tguint; err:PPGError):Tgboolean;cdecl;external;
procedure gvir_storage_pool_start_async(pool:PGVirStoragePool; flags:Tguint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gvir_storage_pool_start_finish(pool:PGVirStoragePool; result:PGAsyncResult; err:PPGError):Tgboolean;cdecl;external;
function gvir_storage_pool_stop(pool:PGVirStoragePool; err:PPGError):Tgboolean;cdecl;external;
procedure gvir_storage_pool_stop_async(pool:PGVirStoragePool; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gvir_storage_pool_stop_finish(pool:PGVirStoragePool; result:PGAsyncResult; err:PPGError):Tgboolean;cdecl;external;
function gvir_storage_pool_delete(pool:PGVirStoragePool; flags:Tguint; err:PPGError):Tgboolean;cdecl;external;
procedure gvir_storage_pool_delete_async(pool:PGVirStoragePool; flags:Tguint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gvir_storage_pool_delete_finish(pool:PGVirStoragePool; result:PGAsyncResult; err:PPGError):Tgboolean;cdecl;external;
function gvir_storage_pool_get_autostart(pool:PGVirStoragePool; err:PPGError):Tgboolean;cdecl;external;
function gvir_storage_pool_set_autostart(pool:PGVirStoragePool; autostart:Tgboolean; err:PPGError):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_TYPE_STORAGE_POOL : longint; { return type might be wrong }
  begin
    GVIR_TYPE_STORAGE_POOL:=gvir_storage_pool_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_STORAGE_POOL(obj : longint) : longint;
begin
  GVIR_STORAGE_POOL:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_TYPE_STORAGE_POOL,GVirStoragePool);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_STORAGE_POOL_CLASS(klass : longint) : longint;
begin
  GVIR_STORAGE_POOL_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_TYPE_STORAGE_POOL,GVirStoragePoolClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_STORAGE_POOL(obj : longint) : longint;
begin
  GVIR_IS_STORAGE_POOL:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_TYPE_STORAGE_POOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_STORAGE_POOL_CLASS(klass : longint) : longint;
begin
  GVIR_IS_STORAGE_POOL_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_TYPE_STORAGE_POOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_STORAGE_POOL_GET_CLASS(obj : longint) : longint;
begin
  GVIR_STORAGE_POOL_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_TYPE_STORAGE_POOL,GVirStoragePoolClass);
end;

{ was #define dname def_expr }
function GVIR_TYPE_STORAGE_POOL_INFO : longint; { return type might be wrong }
  begin
    GVIR_TYPE_STORAGE_POOL_INFO:=gvir_storage_pool_info_get_type;
  end;

{ was #define dname def_expr }
function GVIR_TYPE_STORAGE_POOL_HANDLE : longint; { return type might be wrong }
  begin
    GVIR_TYPE_STORAGE_POOL_HANDLE:=gvir_storage_pool_handle_get_type;
  end;


end.
