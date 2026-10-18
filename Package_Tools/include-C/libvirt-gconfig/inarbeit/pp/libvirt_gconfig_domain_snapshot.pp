
unit libvirt_gconfig_domain_snapshot;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_domain_snapshot.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_domain_snapshot
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
PGList  = ^GList;
PGVirConfigDomain  = ^GVirConfigDomain;
PGVirConfigDomainSnapshot  = ^GVirConfigDomainSnapshot;
PGVirConfigDomainSnapshotClass  = ^GVirConfigDomainSnapshotClass;
PGVirConfigDomainSnapshotDisk  = ^GVirConfigDomainSnapshotDisk;
PGVirConfigDomainSnapshotDomainState  = ^GVirConfigDomainSnapshotDomainState;
PGVirConfigDomainSnapshotMemoryState  = ^GVirConfigDomainSnapshotMemoryState;
PGVirConfigDomainSnapshotPrivate  = ^GVirConfigDomainSnapshotPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-snapshot.h: libvirt domain snapshot configuration
 *
 * Copyright (C) 2010-2013 Red Hat, Inc.
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
 *         Christophe Fergeau <cfergeau@redhat.com>
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)
{$include <libvirt-gconfig/libvirt-gconfig-domain.h>}
{$include <libvirt-gconfig/libvirt-gconfig-domain-snapshot-disk.h>}

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_SNAPSHOT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_SNAPSHOT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_SNAPSHOT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_SNAPSHOT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_SNAPSHOT_GET_CLASS(obj : longint) : longint;

type
{ Do not add fields to this struct  }
  PGVirConfigDomainSnapshot = ^TGVirConfigDomainSnapshot;
  TGVirConfigDomainSnapshot = record
      parent : TGVirConfigObject;
      priv : PGVirConfigDomainSnapshotPrivate;
    end;

  PGVirConfigDomainSnapshotClass = ^TGVirConfigDomainSnapshotClass;
  TGVirConfigDomainSnapshotClass = record
      parent_class : TGVirConfigObjectClass;
      padding : array[0..19] of Tgpointer;
    end;

{ no state  }
{ the domain is running  }
{ the domain is blocked on resource  }
{ the domain is paused by user  }
{ the domain is being shut down  }
{ the domain is shut off  }
{ the domain is crashed  }
{ the domain is suspended by guest
                                                                 power management  }

  PGVirConfigDomainSnapshotDomainState = ^TGVirConfigDomainSnapshotDomainState;
  TGVirConfigDomainSnapshotDomainState =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_SNAPSHOT_DOMAIN_STATE_NOSTATE = 0;
    GVIR_CONFIG_DOMAIN_SNAPSHOT_DOMAIN_STATE_RUNNING = 1;
    GVIR_CONFIG_DOMAIN_SNAPSHOT_DOMAIN_STATE_BLOCKED = 2;
    GVIR_CONFIG_DOMAIN_SNAPSHOT_DOMAIN_STATE_PAUSED = 3;
    GVIR_CONFIG_DOMAIN_SNAPSHOT_DOMAIN_STATE_SHUTDOWN = 4;
    GVIR_CONFIG_DOMAIN_SNAPSHOT_DOMAIN_STATE_SHUTOFF = 5;
    GVIR_CONFIG_DOMAIN_SNAPSHOT_DOMAIN_STATE_CRASHED = 6;
    GVIR_CONFIG_DOMAIN_SNAPSHOT_DOMAIN_STATE_PMSUSPENDED = 7;
    GVIR_CONFIG_DOMAIN_SNAPSHOT_DOMAIN_STATE_DISK_SNAPSHOT = 100;
;
type
  PGVirConfigDomainSnapshotMemoryState = ^TGVirConfigDomainSnapshotMemoryState;
  TGVirConfigDomainSnapshotMemoryState =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_SNAPSHOT_MEMORY_STATE_NONE = 0;
    GVIR_CONFIG_DOMAIN_SNAPSHOT_MEMORY_STATE_INTERNAL = 1;
    GVIR_CONFIG_DOMAIN_SNAPSHOT_MEMORY_STATE_EXTERNAL = 2;
;

function gvir_config_domain_snapshot_get_type:TGType;cdecl;external;
function gvir_config_domain_snapshot_new:PGVirConfigDomainSnapshot;cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_snapshot_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainSnapshot;cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_snapshot_get_name(snapshot:PGVirConfigDomainSnapshot):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gvir_config_domain_snapshot_set_name(snapshot:PGVirConfigDomainSnapshot; name:Pchar);cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_snapshot_get_description(snapshot:PGVirConfigDomainSnapshot):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gvir_config_domain_snapshot_set_description(snapshot:PGVirConfigDomainSnapshot; description:Pchar);cdecl;external;
function gvir_config_domain_snapshot_get_memory_state(snapshot:PGVirConfigDomainSnapshot):TGVirConfigDomainSnapshotMemoryState;cdecl;external;
procedure gvir_config_domain_snapshot_set_memory_state(snapshot:PGVirConfigDomainSnapshot; state:TGVirConfigDomainSnapshotMemoryState);cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_snapshot_get_memory_file(snapshot:PGVirConfigDomainSnapshot):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gvir_config_domain_snapshot_set_memory_file(snapshot:PGVirConfigDomainSnapshot; filename:Pchar);cdecl;external;
function gvir_config_domain_snapshot_get_creation_time(snapshot:PGVirConfigDomainSnapshot):Ttime_t;cdecl;external;
function gvir_config_domain_snapshot_get_state(snapshot:PGVirConfigDomainSnapshot):TGVirConfigDomainSnapshotDomainState;cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_snapshot_get_parent(snapshot:PGVirConfigDomainSnapshot):Pchar;cdecl;external;
function gvir_config_domain_snapshot_get_domain(snapshot:PGVirConfigDomainSnapshot):PGVirConfigDomain;cdecl;external;
procedure gvir_config_domain_snapshot_set_disks(snapshot:PGVirConfigDomainSnapshot; disks:PGList);cdecl;external;
procedure gvir_config_domain_snapshot_add_disk(snapshot:PGVirConfigDomainSnapshot; disk:PGVirConfigDomainSnapshotDisk);cdecl;external;
function gvir_config_domain_snapshot_get_disks(snapshot:PGVirConfigDomainSnapshot):PGList;cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT:=gvir_config_domain_snapshot_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_SNAPSHOT(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_SNAPSHOT:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT,GVirConfigDomainSnapshot);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_SNAPSHOT_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_SNAPSHOT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT,GVirConfigDomainSnapshotClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_SNAPSHOT(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_SNAPSHOT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_SNAPSHOT_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_SNAPSHOT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_SNAPSHOT_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_SNAPSHOT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT,GVirConfigDomainSnapshotClass);
end;


end.
