
unit libvirt_domain_snapshot;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_domain_snapshot.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_domain_snapshot.h
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
PvirDomainSnapshot  = ^virDomainSnapshot;
PvirDomainSnapshotCreateFlags  = ^virDomainSnapshotCreateFlags;
PvirDomainSnapshotDeleteFlags  = ^virDomainSnapshotDeleteFlags;
PvirDomainSnapshotListFlags  = ^virDomainSnapshotListFlags;
PvirDomainSnapshotPtr  = ^virDomainSnapshotPtr;
PvirDomainSnapshotRevertFlags  = ^virDomainSnapshotRevertFlags;
PvirDomainSnapshotXMLFlags  = ^virDomainSnapshotXMLFlags;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-domain-snapshot.h
 * Summary: APIs for management of domain snapshots
 * Description: Provides APIs for the management of domain snapshots
 *
 * Copyright (C) 2006-2014 Red Hat, Inc.
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
 * License along with this library.  If not, see
 * <http://www.gnu.org/licenses/>.
  }
{$ifndef LIBVIRT_DOMAIN_SNAPSHOT_H}
{$define LIBVIRT_DOMAIN_SNAPSHOT_H}
{$ifndef __VIR_LIBVIRT_H_INCLUDES__}
{$error "Don't include this file directly, only use libvirt/libvirt.h"}
{$endif}
{*
 * virDomainSnapshot:
 *
 * A virDomainSnapshot is a private structure representing a snapshot of
 * a domain.  A snapshot captures the state of the domain at a point in
 * time, with the intent that the guest can be reverted back to that
 * state at a later time.
 *
 * Since: 0.8.0
  }
type
{*
 * virDomainSnapshotPtr:
 *
 * A virDomainSnapshotPtr is pointer to a virDomainSnapshot private structure,
 * and is the type used to reference a domain snapshot in the API.
 *
 * Since: 0.8.0
  }

  PvirDomainSnapshotPtr = ^TvirDomainSnapshotPtr;
  TvirDomainSnapshotPtr = PvirDomainSnapshot;
(* Const before type ignored *)

function virDomainSnapshotGetName(snapshot:TvirDomainSnapshotPtr):Pchar;cdecl;external;
function virDomainSnapshotGetDomain(snapshot:TvirDomainSnapshotPtr):TvirDomainPtr;cdecl;external;
function virDomainSnapshotGetConnect(snapshot:TvirDomainSnapshotPtr):TvirConnectPtr;cdecl;external;
{*
 * virDomainSnapshotCreateFlags:
 *
 * Since: 0.9.5
  }
{ Restore or alter
                                                          metadata (Since: 0.9.5)  }
{ With redefine, make
                                                          snapshot current (Since: 0.9.5)  }
{ Make snapshot without
                                                          remembering it (Since: 0.9.5)  }
{ Stop running guest
                                                          after snapshot (Since: 0.9.5)  }
{ disk snapshot, not
                                                          full system (Since: 0.9.5)  }
{ reuse any existing
                                                          external files (Since: 0.9.10)  }
{ use guest agent to
                                                          quiesce all mounted
                                                          file systems within
                                                          the domain (Since: 0.9.10)  }
{ atomically avoid
                                                          partial changes (Since: 0.9.11)  }
{ create the snapshot
                                                          while the guest is
                                                          running (Since: 1.0.1)  }
{ validate the XML
                                                          against the schema (Since: 5.6.0)  }
type
  PvirDomainSnapshotCreateFlags = ^TvirDomainSnapshotCreateFlags;
  TvirDomainSnapshotCreateFlags =  Longint;
  Const
    VIR_DOMAIN_SNAPSHOT_CREATE_REDEFINE = 1 shl 0;
    VIR_DOMAIN_SNAPSHOT_CREATE_CURRENT = 1 shl 1;
    VIR_DOMAIN_SNAPSHOT_CREATE_NO_METADATA = 1 shl 2;
    VIR_DOMAIN_SNAPSHOT_CREATE_HALT = 1 shl 3;
    VIR_DOMAIN_SNAPSHOT_CREATE_DISK_ONLY = 1 shl 4;
    VIR_DOMAIN_SNAPSHOT_CREATE_REUSE_EXT = 1 shl 5;
    VIR_DOMAIN_SNAPSHOT_CREATE_QUIESCE = 1 shl 6;
    VIR_DOMAIN_SNAPSHOT_CREATE_ATOMIC = 1 shl 7;
    VIR_DOMAIN_SNAPSHOT_CREATE_LIVE = 1 shl 8;
    VIR_DOMAIN_SNAPSHOT_CREATE_VALIDATE = 1 shl 9;
;
{ Take a snapshot of the current VM state  }
(* Const before type ignored *)

function virDomainSnapshotCreateXML(domain:TvirDomainPtr; xmlDesc:Pchar; flags:dword):TvirDomainSnapshotPtr;cdecl;external;
{*
 * virDomainSnapshotXMLFlags:
 *
 * Since: 5.1.0
  }
{ dump security sensitive information too (Since: 5.1.0)  }
type
  PvirDomainSnapshotXMLFlags = ^TvirDomainSnapshotXMLFlags;
  TvirDomainSnapshotXMLFlags =  Longint;
  Const
    VIR_DOMAIN_SNAPSHOT_XML_SECURE = VIR_DOMAIN_XML_SECURE;
;
{ Dump the XML of a snapshot  }

function virDomainSnapshotGetXMLDesc(snapshot:TvirDomainSnapshotPtr; flags:dword):Pchar;cdecl;external;
{*
 * virDomainSnapshotListFlags:
 *
 * Flags valid for virDomainSnapshotNum(),
 * virDomainSnapshotListNames(), virDomainSnapshotNumChildren(), and
 * virDomainSnapshotListChildrenNames(), virDomainListAllSnapshots(),
 * and virDomainSnapshotListAllChildren().  Note that the interpretation
 * of flag (1<<0) depends on which function it is passed to; but serves
 * to toggle the per-call default of whether the listing is shallow or
 * recursive.  Remaining bits come in groups; if all bits from a group are
 * 0, then that group is not used to filter results.
 *
 * Since: 0.9.5
  }
{ Filter by snapshots
                                                        with no parents, when
                                                        listing a domain (Since: 0.9.5)  }
{ List all descendants,
                                                        not just children, when
                                                        listing a snapshot (Since: 0.9.7)  }
{ Filter by snapshots
                                                        with no children (Since: 0.9.7)  }
{ Filter by snapshots
                                                        that have children (Since: 0.9.13)  }
{ Filter by snapshots
                                                        which have metadata (Since: 0.9.5)  }
{ Filter by snapshots
                                                        with no metadata (Since: 0.9.13)  }
{ Filter by snapshots
                                                        taken while guest was
                                                        shut off (Since: 1.0.1)  }
{ Filter by snapshots
                                                        taken while guest was
                                                        active, and with
                                                        memory state (Since: 1.0.1)  }
{ Filter by snapshots
                                                        taken while guest was
                                                        active, but without
                                                        memory state (Since: 1.0.1)  }
{ Filter by snapshots
                                                        stored internal to
                                                        disk images (Since: 1.0.1)  }
{ Filter by snapshots
                                                        that use files external
                                                        to disk images (Since: 1.0.1)  }
{ Ensure parents occur
                                                         before children in
                                                         the resulting list (Since: 5.2.0)  }
type
  PvirDomainSnapshotListFlags = ^TvirDomainSnapshotListFlags;
  TvirDomainSnapshotListFlags =  Longint;
  Const
    VIR_DOMAIN_SNAPSHOT_LIST_ROOTS = 1 shl 0;
    VIR_DOMAIN_SNAPSHOT_LIST_DESCENDANTS = 1 shl 0;
    VIR_DOMAIN_SNAPSHOT_LIST_LEAVES = 1 shl 2;
    VIR_DOMAIN_SNAPSHOT_LIST_NO_LEAVES = 1 shl 3;
    VIR_DOMAIN_SNAPSHOT_LIST_METADATA = 1 shl 1;
    VIR_DOMAIN_SNAPSHOT_LIST_NO_METADATA = 1 shl 4;
    VIR_DOMAIN_SNAPSHOT_LIST_INACTIVE = 1 shl 5;
    VIR_DOMAIN_SNAPSHOT_LIST_ACTIVE = 1 shl 6;
    VIR_DOMAIN_SNAPSHOT_LIST_DISK_ONLY = 1 shl 7;
    VIR_DOMAIN_SNAPSHOT_LIST_INTERNAL = 1 shl 8;
    VIR_DOMAIN_SNAPSHOT_LIST_EXTERNAL = 1 shl 9;
    VIR_DOMAIN_SNAPSHOT_LIST_TOPOLOGICAL = 1 shl 10;
;
{ Return the number of snapshots for this domain  }

function virDomainSnapshotNum(domain:TvirDomainPtr; flags:dword):longint;cdecl;external;
{ Get the names of all snapshots for this domain  }
function virDomainSnapshotListNames(domain:TvirDomainPtr; names:PPchar; nameslen:longint; flags:dword):longint;cdecl;external;
{ Get all snapshot objects for this domain  }
function virDomainListAllSnapshots(domain:TvirDomainPtr; snaps:PPvirDomainSnapshotPtr; flags:dword):longint;cdecl;external;
{ Return the number of child snapshots for this snapshot  }
function virDomainSnapshotNumChildren(snapshot:TvirDomainSnapshotPtr; flags:dword):longint;cdecl;external;
{ Get the names of all child snapshots for this snapshot  }
function virDomainSnapshotListChildrenNames(snapshot:TvirDomainSnapshotPtr; names:PPchar; nameslen:longint; flags:dword):longint;cdecl;external;
{ Get all snapshot object children for this snapshot  }
function virDomainSnapshotListAllChildren(snapshot:TvirDomainSnapshotPtr; snaps:PPvirDomainSnapshotPtr; flags:dword):longint;cdecl;external;
{ Get a handle to a named snapshot  }
(* Const before type ignored *)
function virDomainSnapshotLookupByName(domain:TvirDomainPtr; name:Pchar; flags:dword):TvirDomainSnapshotPtr;cdecl;external;
{ Check whether a domain has a snapshot which is currently used  }
function virDomainHasCurrentSnapshot(domain:TvirDomainPtr; flags:dword):longint;cdecl;external;
{ Get a handle to the current snapshot  }
function virDomainSnapshotCurrent(domain:TvirDomainPtr; flags:dword):TvirDomainSnapshotPtr;cdecl;external;
{ Get a handle to the parent snapshot, if one exists  }
function virDomainSnapshotGetParent(snapshot:TvirDomainSnapshotPtr; flags:dword):TvirDomainSnapshotPtr;cdecl;external;
{ Determine if a snapshot is the current snapshot of its domain.   }
function virDomainSnapshotIsCurrent(snapshot:TvirDomainSnapshotPtr; flags:dword):longint;cdecl;external;
{ Determine if a snapshot has associated libvirt metadata that would
 * prevent the deletion of its domain.   }
function virDomainSnapshotHasMetadata(snapshot:TvirDomainSnapshotPtr; flags:dword):longint;cdecl;external;
{*
 * virDomainSnapshotRevertFlags:
 *
 * Since: 0.9.5
  }
{ Run after revert (Since: 0.9.5)  }
{ Pause after revert (Since: 0.9.5)  }
{ Allow risky reverts (Since: 0.9.7)  }
{ Re-initialize NVRAM from template (Since: 8.1.0)  }
type
  PvirDomainSnapshotRevertFlags = ^TvirDomainSnapshotRevertFlags;
  TvirDomainSnapshotRevertFlags =  Longint;
  Const
    VIR_DOMAIN_SNAPSHOT_REVERT_RUNNING = 1 shl 0;
    VIR_DOMAIN_SNAPSHOT_REVERT_PAUSED = 1 shl 1;
    VIR_DOMAIN_SNAPSHOT_REVERT_FORCE = 1 shl 2;
    VIR_DOMAIN_SNAPSHOT_REVERT_RESET_NVRAM = 1 shl 3;
;
{ Revert the domain to a point-in-time snapshot.  The
 * state of the guest after this call will be the state
 * of the guest when the snapshot in question was taken
  }

function virDomainRevertToSnapshot(snapshot:TvirDomainSnapshotPtr; flags:dword):longint;cdecl;external;
{*
 * virDomainSnapshotDeleteFlags:
 *
 * Delete a snapshot
 *
 * Since: 0.8.0
  }
{ Also delete children (Since: 0.8.0)  }
{ Delete just metadata (Since: 0.9.5)  }
{ Delete just children (Since: 0.9.5)  }
type
  PvirDomainSnapshotDeleteFlags = ^TvirDomainSnapshotDeleteFlags;
  TvirDomainSnapshotDeleteFlags =  Longint;
  Const
    VIR_DOMAIN_SNAPSHOT_DELETE_CHILDREN = 1 shl 0;
    VIR_DOMAIN_SNAPSHOT_DELETE_METADATA_ONLY = 1 shl 1;
    VIR_DOMAIN_SNAPSHOT_DELETE_CHILDREN_ONLY = 1 shl 2;
;

function virDomainSnapshotDelete(snapshot:TvirDomainSnapshotPtr; flags:dword):longint;cdecl;external;
function virDomainSnapshotRef(snapshot:TvirDomainSnapshotPtr):longint;cdecl;external;
function virDomainSnapshotFree(snapshot:TvirDomainSnapshotPtr):longint;cdecl;external;
{$endif}
{ LIBVIRT_DOMAIN_SNAPSHOT_H  }

implementation


end.
