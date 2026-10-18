
unit libvirt_gobject_domain;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gobject_domain.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gobject_domain
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
PGDateTime  = ^GDateTime;
PGError  = ^GError;
PGList  = ^GList;
PGVirConfigDomain  = ^GVirConfigDomain;
PGVirConfigDomainDevice  = ^GVirConfigDomainDevice;
PGVirConfigDomainSnapshot  = ^GVirConfigDomainSnapshot;
PGVirDomain  = ^GVirDomain;
PGVirDomainClass  = ^GVirDomainClass;
PGVirDomainDeleteFlags  = ^GVirDomainDeleteFlags;
PGVirDomainInfo  = ^GVirDomainInfo;
PGVirDomainPrivate  = ^GVirDomainPrivate;
PGVirDomainRebootFlags  = ^GVirDomainRebootFlags;
PGVirDomainShutdownFlags  = ^GVirDomainShutdownFlags;
PGVirDomainSnapshot  = ^GVirDomainSnapshot;
PGVirDomainSnapshotCreateFlags  = ^GVirDomainSnapshotCreateFlags;
PGVirDomainSnapshotListFlags  = ^GVirDomainSnapshotListFlags;
PGVirDomainStartFlags  = ^GVirDomainStartFlags;
PGVirDomainState  = ^GVirDomainState;
PGVirDomainUpdateDeviceFlags  = ^GVirDomainUpdateDeviceFlags;
PGVirDomainXMLFlags  = ^GVirDomainXMLFlags;
PGVirStream  = ^GVirStream;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gobject-domain.c: libvirt gobject integration
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
{$include <libvirt-gobject/libvirt-gobject-stream.h>}
{$include <libvirt/libvirt.h>}
{$include <libvirt-gobject/libvirt-gobject-domain-snapshot.h>}

{ was #define dname def_expr }
function GVIR_TYPE_DOMAIN : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_DOMAIN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_DOMAIN_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_DOMAIN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_DOMAIN_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_DOMAIN_GET_CLASS(obj : longint) : longint;

{ was #define dname def_expr }
function GVIR_TYPE_DOMAIN_INFO : longint; { return type might be wrong }

{ was #define dname def_expr }
function GVIR_TYPE_DOMAIN_HANDLE : longint; { return type might be wrong }

type
{ Do not add fields to this struct  }
  PGVirDomain = ^TGVirDomain;
  TGVirDomain = record
      parent : TGObject;
      priv : PGVirDomainPrivate;
    end;

{ signals  }
  PGVirDomainClass = ^TGVirDomainClass;
  TGVirDomainClass = record
      parent_class : TGObjectClass;
      started : procedure (dom:PGVirDomain);cdecl;
      stopped : procedure (dom:PGVirDomain);cdecl;
      resumed : procedure (dom:PGVirDomain);cdecl;
      updated : procedure (dom:PGVirDomain);cdecl;
      suspended : procedure (dom:PGVirDomain);cdecl;
      pmsuspended : procedure (dom:PGVirDomain);cdecl;
      padding : array[0..18] of Tgpointer;
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

  PGVirDomainState = ^TGVirDomainState;
  TGVirDomainState =  Longint;
  Const
    GVIR_DOMAIN_STATE_NONE = 0;
    GVIR_DOMAIN_STATE_RUNNING = 1;
    GVIR_DOMAIN_STATE_BLOCKED = 2;
    GVIR_DOMAIN_STATE_PAUSED = 3;
    GVIR_DOMAIN_STATE_SHUTDOWN = 4;
    GVIR_DOMAIN_STATE_SHUTOFF = 5;
    GVIR_DOMAIN_STATE_CRASHED = 6;
    GVIR_DOMAIN_STATE_PMSUSPENDED = 7;
;
type
  PGVirDomainStartFlags = ^TGVirDomainStartFlags;
  TGVirDomainStartFlags =  Longint;
  Const
    GVIR_DOMAIN_START_NONE = 0;
    GVIR_DOMAIN_START_PAUSED = 1 shl 0;
    GVIR_DOMAIN_START_AUTODESTROY = 1 shl 1;
    GVIR_DOMAIN_START_BYPASS_CACHE = 1 shl 2;
    GVIR_DOMAIN_START_FORCE_BOOT = 1 shl 3;
;
{*
 * GVirDomainDeleteFlags:
 * @GVIR_DOMAIN_DELETE_NONE: No flags
 * @GVIR_DOMAIN_DELETE_SAVED_STATE: Also remove associated saved state (if present).
 * @GVIR_DOMAIN_DELETE_SNAPSHOTS_METADATA: If last use of domain, then also
 *                                         remove any snapshot metadata.
  }
type
  PGVirDomainDeleteFlags = ^TGVirDomainDeleteFlags;
  TGVirDomainDeleteFlags =  Longint;
  Const
    GVIR_DOMAIN_DELETE_NONE = 0;
    GVIR_DOMAIN_DELETE_SAVED_STATE = VIR_DOMAIN_UNDEFINE_MANAGED_SAVE;
    GVIR_DOMAIN_DELETE_SNAPSHOTS_METADATA = VIR_DOMAIN_UNDEFINE_SNAPSHOTS_METADATA;
    GVIR_DOMAIN_DELETE_REMOVE_NVRAM = VIR_DOMAIN_UNDEFINE_NVRAM;
    GVIR_DOMAIN_DELETE_KEEP_NVRAM = VIR_DOMAIN_UNDEFINE_KEEP_NVRAM;
;
{*
 * GVirDomainXMLFlags:
 * @GVIR_DOMAIN_XML_NONE: No flags
 * @GVIR_DOMAIN_XML_SECURE: Dump security sensitive information too
 * @GVIR_DOMAIN_XML_INACTIVE: Dump inactive domain information
 * @GVIR_DOMAIN_XML_UPDATE_CPU: Update guest CPU requirements according to host CPU
  }
type
  PGVirDomainXMLFlags = ^TGVirDomainXMLFlags;
  TGVirDomainXMLFlags =  Longint;
  Const
    GVIR_DOMAIN_XML_NONE = 0;
    GVIR_DOMAIN_XML_SECURE = VIR_DOMAIN_XML_SECURE;
    GVIR_DOMAIN_XML_INACTIVE = VIR_DOMAIN_XML_INACTIVE;
    GVIR_DOMAIN_XML_UPDATE_CPU = VIR_DOMAIN_XML_UPDATE_CPU;
;
{*
 * GVirDomainShutdownFlags:
 * @GVIR_DOMAIN_SHUTDOWN_NONE: No flags, hypervisor choice
 * @GVIR_DOMAIN_SHUTDOWN_ACPI_POWER_BTN: Send ACPI event
 * @GVIR_DOMAIN_SHUTDOWN_GUEST_AGENT: Use guest agent
 *
  }
type
  PGVirDomainShutdownFlags = ^TGVirDomainShutdownFlags;
  TGVirDomainShutdownFlags =  Longint;
  Const
    GVIR_DOMAIN_SHUTDOWN_NONE = 0;
    GVIR_DOMAIN_SHUTDOWN_ACPI_POWER_BTN = VIR_DOMAIN_SHUTDOWN_ACPI_POWER_BTN;
    GVIR_DOMAIN_SHUTDOWN_GUEST_AGENT = VIR_DOMAIN_SHUTDOWN_GUEST_AGENT;
;
{*
 * GVirDomainSnapshotCreateFlags:
 * @GVIR_DOMAIN_SNAPSHOT_NONE: No flags
 * @GVIR_DOMAIN_SNAPSHOT_REDEFINE: Restore or alter metadata
 * @GVIR_DOMAIN_SNAPSHOT_CURRENT: With redefine, make snapshot current
 * @GVIR_DOMAIN_SNAPSHOT_NO_METADATA: Make snapshot without remembering it
 * @GVIR_DOMAIN_SNAPSHOT_HALT: Stop running guest after snapshot
 * @GVIR_DOMAIN_SNAPSHOT_DISK_ONLY: Disk snapshot, not system checkpoint
 * @GVIR_DOMAIN_SNAPSHOT_REUSE_EXT: Reuse any existing external files
 * @GVIR_DOMAIN_SNAPSHOT_QUIESCE: Use guest agent to quiesce all mounter
 *                                file systems within the domain
 * @GVIR_DOMAIN_SNAPSHOT_ATOMIC: Atomically avoid partial changes
  }
type
  PGVirDomainSnapshotCreateFlags = ^TGVirDomainSnapshotCreateFlags;
  TGVirDomainSnapshotCreateFlags =  Longint;
  Const
    GVIR_DOMAIN_SNAPSHOT_NONE = 0;
    GVIR_DOMAIN_SNAPSHOT_REDEFINE = VIR_DOMAIN_SNAPSHOT_CREATE_REDEFINE;
    GVIR_DOMAIN_SNAPSHOT_CURRENT = VIR_DOMAIN_SNAPSHOT_CREATE_CURRENT;
    GVIR_DOMAIN_SNAPSHOT_NO_METADATA = VIR_DOMAIN_SNAPSHOT_CREATE_NO_METADATA;
    GVIR_DOMAIN_SNAPSHOT_HALT = VIR_DOMAIN_SNAPSHOT_CREATE_HALT;
    GVIR_DOMAIN_SNAPSHOT_DISK_ONLY = VIR_DOMAIN_SNAPSHOT_CREATE_DISK_ONLY;
    GVIR_DOMAIN_SNAPSHOT_REUSE_EXT = VIR_DOMAIN_SNAPSHOT_CREATE_REUSE_EXT;
    GVIR_DOMAIN_SNAPSHOT_QUIESCE = VIR_DOMAIN_SNAPSHOT_CREATE_QUIESCE;
    GVIR_DOMAIN_SNAPSHOT_ATOMIC = VIR_DOMAIN_SNAPSHOT_CREATE_ATOMIC;
;
{*
 * GVirDomainUpdateDeviceFlags:
 * @GVIR_DOMAIN_UPDATE_DEVICE_CURRENT: Update current domain state
 * @GVIR_DOMAIN_UPDATE_DEVICE_LIVE: Update state for only active domains
 * @GVIR_DOMAIN_UPDATE_DEVICE_CONFIG: Update state for persistent state only
  }
type
  PGVirDomainUpdateDeviceFlags = ^TGVirDomainUpdateDeviceFlags;
  TGVirDomainUpdateDeviceFlags =  Longint;
  Const
    GVIR_DOMAIN_UPDATE_DEVICE_CURRENT = VIR_DOMAIN_AFFECT_CURRENT;
    GVIR_DOMAIN_UPDATE_DEVICE_LIVE = VIR_DOMAIN_AFFECT_LIVE;
    GVIR_DOMAIN_UPDATE_DEVICE_CONFIG = VIR_DOMAIN_AFFECT_CONFIG;
;
{*
 * GVirDomainRebootFlags:
 * @GVIR_DOMAIN_REBOOT_NONE: No flags, hypervisor choice
 * @GVIR_DOMAIN_REBOOT_ACPI_POWER_BTN: Send ACPI event
 * @GVIR_DOMAIN_REBOOT_GUEST_AGENT: Use guest agent
 *
  }
type
  PGVirDomainRebootFlags = ^TGVirDomainRebootFlags;
  TGVirDomainRebootFlags =  Longint;
  Const
    GVIR_DOMAIN_REBOOT_NONE = 0;
    GVIR_DOMAIN_REBOOT_ACPI_POWER_BTN = VIR_DOMAIN_REBOOT_ACPI_POWER_BTN;
    GVIR_DOMAIN_REBOOT_GUEST_AGENT = VIR_DOMAIN_REBOOT_GUEST_AGENT;
;
{*
 * GVirDomainSnapshotListFlags:
 * @GVIR_DOMAIN_SNAPSHOT_LIST_ALL: List all snapshots
 * @GVIR_DOMAIN_SNAPSHOT_LIST_DESCENDANTS: List all descendants, not just
 *                                         children, when listing a snapshot.
 *                                         For historical reasons, groups do not use contiguous bits.
 * @GVIR_DOMAIN_SNAPSHOT_LIST_ROOTS: Filter by snapshots with no parents, when listing a domain
 * @GVIR_DOMAIN_SNAPSHOT_LIST_METADATA: Filter by snapshots which have metadata
 * @GVIR_DOMAIN_SNAPSHOT_LIST_LEAVES: Filter by snapshots with no children
 * @GVIR_DOMAIN_SNAPSHOT_LIST_NO_LEAVES: Filter by snapshots that have children
 * @GVIR_DOMAIN_SNAPSHOT_LIST_NO_METADATA: Filter by snapshots with no metadata
 * @GVIR_DOMAIN_SNAPSHOT_LIST_INACTIVE: Filter by snapshots taken while guest was shut off
 * @GVIR_DOMAIN_SNAPSHOT_LIST_ACTIVE: Filter by snapshots taken while guest was active, and with memory state
 * @GVIR_DOMAIN_SNAPSHOT_LIST_DISK_ONLY: Filter by snapshots taken while guest was active, but without memory state
 * @GVIR_DOMAIN_SNAPSHOT_LIST_INTERNAL: Filter by snapshots stored internal to disk images
 * @GVIR_DOMAIN_SNAPSHOT_LIST_EXTERNAL: Filter by snapshots that use files external to disk images
  }
type
  PGVirDomainSnapshotListFlags = ^TGVirDomainSnapshotListFlags;
  TGVirDomainSnapshotListFlags =  Longint;
  Const
    GVIR_DOMAIN_SNAPSHOT_LIST_ALL = 0;
    GVIR_DOMAIN_SNAPSHOT_LIST_DESCENDANTS = VIR_DOMAIN_SNAPSHOT_LIST_DESCENDANTS;
    GVIR_DOMAIN_SNAPSHOT_LIST_ROOTS = VIR_DOMAIN_SNAPSHOT_LIST_ROOTS;
    GVIR_DOMAIN_SNAPSHOT_LIST_METADATA = VIR_DOMAIN_SNAPSHOT_LIST_METADATA;
    GVIR_DOMAIN_SNAPSHOT_LIST_LEAVES = VIR_DOMAIN_SNAPSHOT_LIST_LEAVES;
    GVIR_DOMAIN_SNAPSHOT_LIST_NO_LEAVES = VIR_DOMAIN_SNAPSHOT_LIST_NO_LEAVES;
    GVIR_DOMAIN_SNAPSHOT_LIST_NO_METADATA = VIR_DOMAIN_SNAPSHOT_LIST_NO_METADATA;
    GVIR_DOMAIN_SNAPSHOT_LIST_INACTIVE = VIR_DOMAIN_SNAPSHOT_LIST_INACTIVE;
    GVIR_DOMAIN_SNAPSHOT_LIST_ACTIVE = VIR_DOMAIN_SNAPSHOT_LIST_ACTIVE;
    GVIR_DOMAIN_SNAPSHOT_LIST_DISK_ONLY = VIR_DOMAIN_SNAPSHOT_LIST_DISK_ONLY;
    GVIR_DOMAIN_SNAPSHOT_LIST_INTERNAL = VIR_DOMAIN_SNAPSHOT_LIST_INTERNAL;
    GVIR_DOMAIN_SNAPSHOT_LIST_EXTERNAL = VIR_DOMAIN_SNAPSHOT_LIST_EXTERNAL;
;
type
{ the running state  }
{ the maximum memory in KBytes allowed  }
{ the memory in KBytes used by the domain  }
{ the number of virtual CPUs for the domain  }
{ the CPU time used in nanoseconds  }
  PGVirDomainInfo = ^TGVirDomainInfo;
  TGVirDomainInfo = record
      state : TGVirDomainState;
      maxMem : Tguint64;
      memory : Tguint64;
      nrVirtCpu : Tguint16;
      cpuTime : Tguint64;
    end;


function gvir_domain_get_type:TGType;cdecl;external;
function gvir_domain_info_get_type:TGType;cdecl;external;
function gvir_domain_handle_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gvir_domain_get_name(dom:PGVirDomain):Pgchar;cdecl;external;
(* Const before type ignored *)
function gvir_domain_get_uuid(dom:PGVirDomain):Pgchar;cdecl;external;
function gvir_domain_get_id(dom:PGVirDomain; err:PPGError):Tgint;cdecl;external;
function gvir_domain_start(dom:PGVirDomain; flags:Tguint; err:PPGError):Tgboolean;cdecl;external;
procedure gvir_domain_start_async(dom:PGVirDomain; flags:Tguint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gvir_domain_start_finish(dom:PGVirDomain; result:PGAsyncResult; err:PPGError):Tgboolean;cdecl;external;
function gvir_domain_resume(dom:PGVirDomain; err:PPGError):Tgboolean;cdecl;external;
procedure gvir_domain_resume_async(dom:PGVirDomain; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gvir_domain_resume_finish(dom:PGVirDomain; result:PGAsyncResult; err:PPGError):Tgboolean;cdecl;external;
function gvir_domain_wakeup(dom:PGVirDomain; flags:Tguint; err:PPGError):Tgboolean;cdecl;external;
procedure gvir_domain_wakeup_async(dom:PGVirDomain; flags:Tguint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gvir_domain_wakeup_finish(dom:PGVirDomain; result:PGAsyncResult; err:PPGError):Tgboolean;cdecl;external;
function gvir_domain_stop(dom:PGVirDomain; flags:Tguint; err:PPGError):Tgboolean;cdecl;external;
function gvir_domain_delete(dom:PGVirDomain; flags:Tguint; err:PPGError):Tgboolean;cdecl;external;
function gvir_domain_shutdown(dom:PGVirDomain; flags:Tguint; err:PPGError):Tgboolean;cdecl;external;
function gvir_domain_reboot(dom:PGVirDomain; flags:Tguint; err:PPGError):Tgboolean;cdecl;external;
function gvir_domain_save_to_file(dom:PGVirDomain; filename:Pgchar; custom_conf:PGVirConfigDomain; flags:Tguint; err:PPGError):Tgboolean;cdecl;external;
procedure gvir_domain_save_to_file_async(dom:PGVirDomain; filename:Pgchar; custom_conf:PGVirConfigDomain; flags:Tguint; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gvir_domain_save_to_file_finish(dom:PGVirDomain; result:PGAsyncResult; err:PPGError):Tgboolean;cdecl;external;
function gvir_domain_get_info(dom:PGVirDomain; err:PPGError):PGVirDomainInfo;cdecl;external;
procedure gvir_domain_get_info_async(dom:PGVirDomain; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gvir_domain_get_info_finish(dom:PGVirDomain; result:PGAsyncResult; err:PPGError):PGVirDomainInfo;cdecl;external;
function gvir_domain_get_config(dom:PGVirDomain; flags:Tguint; err:PPGError):PGVirConfigDomain;cdecl;external;
function gvir_domain_set_config(domain:PGVirDomain; conf:PGVirConfigDomain; err:PPGError):Tgboolean;cdecl;external;
function gvir_domain_screenshot(dom:PGVirDomain; stream:PGVirStream; monitor_id:Tguint; flags:Tguint; err:PPGError):Pgchar;cdecl;external;
(* Const before type ignored *)
function gvir_domain_open_console(dom:PGVirDomain; stream:PGVirStream; devname:Pgchar; flags:Tguint; err:PPGError):Tgboolean;cdecl;external;
function gvir_domain_open_graphics(dom:PGVirDomain; idx:Tguint; fd:longint; flags:dword; err:PPGError):Tgboolean;cdecl;external;
function gvir_domain_open_graphics_fd(dom:PGVirDomain; idx:Tguint; flags:dword; err:PPGError):longint;cdecl;external;
function gvir_domain_suspend(dom:PGVirDomain; err:PPGError):Tgboolean;cdecl;external;
function gvir_domain_save(dom:PGVirDomain; flags:dword; err:PPGError):Tgboolean;cdecl;external;
procedure gvir_domain_save_async(dom:PGVirDomain; flags:dword; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gvir_domain_save_finish(dom:PGVirDomain; result:PGAsyncResult; err:PPGError):Tgboolean;cdecl;external;
function gvir_domain_get_persistent(dom:PGVirDomain):Tgboolean;cdecl;external;
function gvir_domain_get_saved(dom:PGVirDomain):Tgboolean;cdecl;external;
function gvir_domain_get_devices(domain:PGVirDomain; err:PPGError):PGList;cdecl;external;
function gvir_domain_update_device(dom:PGVirDomain; device:PGVirConfigDomainDevice; flags:Tguint; err:PPGError):Tgboolean;cdecl;external;
function gvir_domain_create_snapshot(dom:PGVirDomain; custom_conf:PGVirConfigDomainSnapshot; flags:Tguint; err:PPGError):PGVirDomainSnapshot;cdecl;external;
procedure gvir_domain_create_snapshot_async(dom:PGVirDomain; custom_conf:PGVirConfigDomainSnapshot; flags:Tguint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function gvir_domain_create_snapshot_finish(domain:PGVirDomain; result:PGAsyncResult; error:PPGError):PGVirDomainSnapshot;cdecl;external;
function gvir_domain_fetch_snapshots(dom:PGVirDomain; list_flags:Tguint; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
function gvir_domain_get_snapshots(dom:PGVirDomain):PGList;cdecl;external;
procedure gvir_domain_fetch_snapshots_async(dom:PGVirDomain; list_flags:Tguint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gvir_domain_fetch_snapshots_finish(dom:PGVirDomain; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
function gvir_domain_get_has_current_snapshot(dom:PGVirDomain; flags:Tguint; has_current_snapshot:Pgboolean; error:PPGError):Tgboolean;cdecl;external;
function gvir_domain_set_time(dom:PGVirDomain; date_time:PGDateTime; flags:Tguint; err:PPGError):Tgboolean;cdecl;external;
procedure gvir_domain_set_time_async(dom:PGVirDomain; date_time:PGDateTime; flags:Tguint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function gvir_domain_set_time_finish(dom:PGVirDomain; result:PGAsyncResult; err:PPGError):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_TYPE_DOMAIN : longint; { return type might be wrong }
  begin
    GVIR_TYPE_DOMAIN:=gvir_domain_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_DOMAIN(obj : longint) : longint;
begin
  GVIR_DOMAIN:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_TYPE_DOMAIN,GVirDomain);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_DOMAIN_CLASS(klass : longint) : longint;
begin
  GVIR_DOMAIN_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_TYPE_DOMAIN,GVirDomainClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_DOMAIN(obj : longint) : longint;
begin
  GVIR_IS_DOMAIN:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_TYPE_DOMAIN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_DOMAIN_CLASS(klass : longint) : longint;
begin
  GVIR_IS_DOMAIN_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_TYPE_DOMAIN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_DOMAIN_GET_CLASS(obj : longint) : longint;
begin
  GVIR_DOMAIN_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_TYPE_DOMAIN,GVirDomainClass);
end;

{ was #define dname def_expr }
function GVIR_TYPE_DOMAIN_INFO : longint; { return type might be wrong }
  begin
    GVIR_TYPE_DOMAIN_INFO:=gvir_domain_info_get_type;
  end;

{ was #define dname def_expr }
function GVIR_TYPE_DOMAIN_HANDLE : longint; { return type might be wrong }
  begin
    GVIR_TYPE_DOMAIN_HANDLE:=gvir_domain_handle_get_type;
  end;


end.
