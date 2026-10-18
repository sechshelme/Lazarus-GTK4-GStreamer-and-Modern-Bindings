unit libvirt_gconfig_domain_snapshot;

interface

uses
  fp_glib2, fp_virtgconfig;

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

function gvir_config_domain_snapshot_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_domain_snapshot_new:PGVirConfigDomainSnapshot;cdecl;external libvirtgconfig;
function gvir_config_domain_snapshot_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainSnapshot;cdecl;external libvirtgconfig;
function gvir_config_domain_snapshot_get_name(snapshot:PGVirConfigDomainSnapshot):Pchar;cdecl;external libvirtgconfig;
procedure gvir_config_domain_snapshot_set_name(snapshot:PGVirConfigDomainSnapshot; name:Pchar);cdecl;external libvirtgconfig;
function gvir_config_domain_snapshot_get_description(snapshot:PGVirConfigDomainSnapshot):Pchar;cdecl;external libvirtgconfig;
procedure gvir_config_domain_snapshot_set_description(snapshot:PGVirConfigDomainSnapshot; description:Pchar);cdecl;external libvirtgconfig;
function gvir_config_domain_snapshot_get_memory_state(snapshot:PGVirConfigDomainSnapshot):TGVirConfigDomainSnapshotMemoryState;cdecl;external libvirtgconfig;
procedure gvir_config_domain_snapshot_set_memory_state(snapshot:PGVirConfigDomainSnapshot; state:TGVirConfigDomainSnapshotMemoryState);cdecl;external libvirtgconfig;
function gvir_config_domain_snapshot_get_memory_file(snapshot:PGVirConfigDomainSnapshot):Pchar;cdecl;external libvirtgconfig;
procedure gvir_config_domain_snapshot_set_memory_file(snapshot:PGVirConfigDomainSnapshot; filename:Pchar);cdecl;external libvirtgconfig;
function gvir_config_domain_snapshot_get_creation_time(snapshot:PGVirConfigDomainSnapshot):Ttime_t;cdecl;external libvirtgconfig;
function gvir_config_domain_snapshot_get_state(snapshot:PGVirConfigDomainSnapshot):TGVirConfigDomainSnapshotDomainState;cdecl;external libvirtgconfig;
function gvir_config_domain_snapshot_get_parent(snapshot:PGVirConfigDomainSnapshot):Pchar;cdecl;external libvirtgconfig;
function gvir_config_domain_snapshot_get_domain(snapshot:PGVirConfigDomainSnapshot):PGVirConfigDomain;cdecl;external libvirtgconfig;
procedure gvir_config_domain_snapshot_set_disks(snapshot:PGVirConfigDomainSnapshot; disks:PGList);cdecl;external libvirtgconfig;
procedure gvir_config_domain_snapshot_add_disk(snapshot:PGVirConfigDomainSnapshot; disk:PGVirConfigDomainSnapshotDisk);cdecl;external libvirtgconfig;
function gvir_config_domain_snapshot_get_disks(snapshot:PGVirConfigDomainSnapshot):PGList;cdecl;external libvirtgconfig;

// === Konventiert am: 18-10-26 12:49:48 ===

function GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT : TGType;
function GVIR_CONFIG_DOMAIN_SNAPSHOT(obj : Pointer) : PGVirConfigDomainSnapshot;
function GVIR_CONFIG_DOMAIN_SNAPSHOT_CLASS(klass : Pointer) : PGVirConfigDomainSnapshotClass;
function GVIR_CONFIG_IS_DOMAIN_SNAPSHOT(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_SNAPSHOT_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_SNAPSHOT_GET_CLASS(obj : Pointer) : PGVirConfigDomainSnapshotClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT:=gvir_config_domain_snapshot_get_type;
  end;

function GVIR_CONFIG_DOMAIN_SNAPSHOT(obj : Pointer) : PGVirConfigDomainSnapshot;
begin
  Result := PGVirConfigDomainSnapshot(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT));
end;

function GVIR_CONFIG_DOMAIN_SNAPSHOT_CLASS(klass : Pointer) : PGVirConfigDomainSnapshotClass;
begin
  Result := PGVirConfigDomainSnapshotClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT));
end;

function GVIR_CONFIG_IS_DOMAIN_SNAPSHOT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT);
end;

function GVIR_CONFIG_IS_DOMAIN_SNAPSHOT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT);
end;

function GVIR_CONFIG_DOMAIN_SNAPSHOT_GET_CLASS(obj : Pointer) : PGVirConfigDomainSnapshotClass;
begin
  Result := PGVirConfigDomainSnapshotClass(PGTypeInstance(obj)^.g_class);
end;



end.
