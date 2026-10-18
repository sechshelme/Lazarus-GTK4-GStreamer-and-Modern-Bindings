
unit libvirt_gobject_domain_snapshot;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gobject_domain_snapshot.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gobject_domain_snapshot.h
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
Pgboolean  = ^gboolean;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGError  = ^GError;
PGVirConfigDomainSnapshot  = ^GVirConfigDomainSnapshot;
PGVirDomainSnapshot  = ^GVirDomainSnapshot;
PGVirDomainSnapshotClass  = ^GVirDomainSnapshotClass;
PGVirDomainSnapshotDeleteFlags  = ^GVirDomainSnapshotDeleteFlags;
PGVirDomainSnapshotPrivate  = ^GVirDomainSnapshotPrivate;
PGVirDomainSnapshotRevertFlags  = ^GVirDomainSnapshotRevertFlags;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gobject-domain_snapshot.c: libvirt gobject integration
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
function GVIR_TYPE_DOMAIN_SNAPSHOT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_DOMAIN_SNAPSHOT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_DOMAIN_SNAPSHOT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_DOMAIN_SNAPSHOT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_DOMAIN_SNAPSHOT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_DOMAIN_SNAPSHOT_GET_CLASS(obj : longint) : longint;

{ was #define dname def_expr }
function GVIR_TYPE_DOMAIN_SNAPSHOT_HANDLE : longint; { return type might be wrong }

type
{ Do not add fields to this struct  }
  PGVirDomainSnapshot = ^TGVirDomainSnapshot;
  TGVirDomainSnapshot = record
      parent : TGObject;
      priv : PGVirDomainSnapshotPrivate;
    end;

  PGVirDomainSnapshotClass = ^TGVirDomainSnapshotClass;
  TGVirDomainSnapshotClass = record
      parent_class : TGObjectClass;
      padding : array[0..19] of Tgpointer;
    end;

{*
 * GVirDomainSnapshotDeleteFlags:
 * @GVIR_DOMAIN_SNAPSHOT_DELETE_CHILDREN: Also delete children
 * @GVIR_DOMAIN_SNAPSHOT_DELETE_METADATA_ONLY: Delete just metadata
 * @GVIR_DOMAIN_SNAPSHOT_DELETE_CHILDREN_ONLY: Delete just children
  }

  PGVirDomainSnapshotDeleteFlags = ^TGVirDomainSnapshotDeleteFlags;
  TGVirDomainSnapshotDeleteFlags =  Longint;
  Const
    GVIR_DOMAIN_SNAPSHOT_DELETE_CHILDREN = 1;
    GVIR_DOMAIN_SNAPSHOT_DELETE_METADATA_ONLY = 2;
    GVIR_DOMAIN_SNAPSHOT_DELETE_CHILDREN_ONLY = 4;
;
{*
 * GVirDomainSnapshotRevertFlags:
 * @GVIR_DOMAIN_SNAPSHOT_REVERT_RUNNING: Run after revert
 * @GVIR_DOMAIN_SNAPSHOT_REVERT_PAUSED: Pause after revert
 * @GVIR_DOMAIN_SNAPSHOT_REVERT_FORCE: Allow risky reverts
  }
type
  PGVirDomainSnapshotRevertFlags = ^TGVirDomainSnapshotRevertFlags;
  TGVirDomainSnapshotRevertFlags =  Longint;
  Const
    GVIR_DOMAIN_SNAPSHOT_REVERT_RUNNING = 1;
    GVIR_DOMAIN_SNAPSHOT_REVERT_PAUSED = 2;
    GVIR_DOMAIN_SNAPSHOT_REVERT_FORCE = 4;
;

function gvir_domain_snapshot_get_type:TGType;cdecl;external;
function gvir_domain_snapshot_handle_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gvir_domain_snapshot_get_name(snapshot:PGVirDomainSnapshot):Pgchar;cdecl;external;
function gvir_domain_snapshot_get_config(snapshot:PGVirDomainSnapshot; flags:Tguint; err:PPGError):PGVirConfigDomainSnapshot;cdecl;external;
function gvir_domain_snapshot_delete(snapshot:PGVirDomainSnapshot; flags:Tguint; error:PPGError):Tgboolean;cdecl;external;
procedure gvir_domain_snapshot_delete_async(snapshot:PGVirDomainSnapshot; flags:Tguint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gvir_domain_snapshot_delete_finish(snapshot:PGVirDomainSnapshot; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
function gvir_domain_snapshot_get_is_current(snapshot:PGVirDomainSnapshot; flags:Tguint; is_current:Pgboolean; error:PPGError):Tgboolean;cdecl;external;
function gvir_domain_snapshot_revert_to(snapshot:PGVirDomainSnapshot; flags:Tguint; error:PPGError):Tgboolean;cdecl;external;
procedure gvir_domain_snapshot_revert_to_async(snapshot:PGVirDomainSnapshot; flags:Tguint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gvir_domain_snapshot_revert_to_finish(snapshot:PGVirDomainSnapshot; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
function gvir_domain_snapshot_set_config(snapshot:PGVirDomainSnapshot; conf:PGVirConfigDomainSnapshot; error:PPGError):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_TYPE_DOMAIN_SNAPSHOT : longint; { return type might be wrong }
  begin
    GVIR_TYPE_DOMAIN_SNAPSHOT:=gvir_domain_snapshot_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_DOMAIN_SNAPSHOT(obj : longint) : longint;
begin
  GVIR_DOMAIN_SNAPSHOT:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_TYPE_DOMAIN_SNAPSHOT,GVirDomainSnapshot);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_DOMAIN_SNAPSHOT_CLASS(klass : longint) : longint;
begin
  GVIR_DOMAIN_SNAPSHOT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_TYPE_DOMAIN_SNAPSHOT,GVirDomainSnapshotClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_DOMAIN_SNAPSHOT(obj : longint) : longint;
begin
  GVIR_IS_DOMAIN_SNAPSHOT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_TYPE_DOMAIN_SNAPSHOT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_DOMAIN_SNAPSHOT_CLASS(klass : longint) : longint;
begin
  GVIR_IS_DOMAIN_SNAPSHOT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_TYPE_DOMAIN_SNAPSHOT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_DOMAIN_SNAPSHOT_GET_CLASS(obj : longint) : longint;
begin
  GVIR_DOMAIN_SNAPSHOT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_TYPE_DOMAIN_SNAPSHOT,GVirDomainSnapshotClass);
end;

{ was #define dname def_expr }
function GVIR_TYPE_DOMAIN_SNAPSHOT_HANDLE : longint; { return type might be wrong }
  begin
    GVIR_TYPE_DOMAIN_SNAPSHOT_HANDLE:=gvir_domain_snapshot_handle_get_type;
  end;


end.
