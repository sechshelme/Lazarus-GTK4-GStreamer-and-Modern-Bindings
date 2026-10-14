
unit libvirt_domain_checkpoint;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_domain_checkpoint.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_domain_checkpoint.h
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
PvirDomainCheckpoint  = ^virDomainCheckpoint;
PvirDomainCheckpointCreateFlags  = ^virDomainCheckpointCreateFlags;
PvirDomainCheckpointDeleteFlags  = ^virDomainCheckpointDeleteFlags;
PvirDomainCheckpointListFlags  = ^virDomainCheckpointListFlags;
PvirDomainCheckpointPtr  = ^virDomainCheckpointPtr;
PvirDomainCheckpointXMLFlags  = ^virDomainCheckpointXMLFlags;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-domain-checkpoint.h
 * Summary: APIs for management of domain checkpoints
 * Description: Provides APIs for the management of domain checkpoints
 *
 * Copyright (C) 2006-2019 Red Hat, Inc.
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
{$ifndef LIBVIRT_DOMAIN_CHECKPOINT_H}
{$define LIBVIRT_DOMAIN_CHECKPOINT_H}
{$ifndef __VIR_LIBVIRT_H_INCLUDES__}
{$error "Don't include this file directly, only use libvirt/libvirt.h"}
{$endif}
{*
 * virDomainCheckpoint:
 *
 * A virDomainCheckpoint is a private structure representing a checkpoint of
 * a domain.  A checkpoint is useful for tracking which portions of the
 * domain disks have been altered since a point in time, but by itself does
 * not allow reverting back to that point in time.
 *
 * Since: 5.2.0
  }
type
{*
 * virDomainCheckpointPtr:
 *
 * A virDomainCheckpointPtr is pointer to a virDomainCheckpoint
 * private structure, and is the type used to reference a domain
 * checkpoint in the API.
 *
 * Since: 5.2.0
  }

  PvirDomainCheckpointPtr = ^TvirDomainCheckpointPtr;
  TvirDomainCheckpointPtr = PvirDomainCheckpoint;
(* Const before type ignored *)

function virDomainCheckpointGetName(checkpoint:TvirDomainCheckpointPtr):Pchar;cdecl;external;
function virDomainCheckpointGetDomain(checkpoint:TvirDomainCheckpointPtr):TvirDomainPtr;cdecl;external;
function virDomainCheckpointGetConnect(checkpoint:TvirDomainCheckpointPtr):TvirConnectPtr;cdecl;external;
{*
 * virDomainCheckpointCreateFlags:
 *
 * Since: 5.6.0
  }
{ Restore or alter
                                                            metadata (Since: 5.6.0)  }
{ use guest agent to
                                                            quiesce all mounted
                                                            file systems within
                                                            the domain (Since: 5.6.0)  }
{ validate disk data state
                                                                     when redefining a checkpoint (Since: 6.10.0)  }
type
  PvirDomainCheckpointCreateFlags = ^TvirDomainCheckpointCreateFlags;
  TvirDomainCheckpointCreateFlags =  Longint;
  Const
    VIR_DOMAIN_CHECKPOINT_CREATE_REDEFINE = 1 shl 0;
    VIR_DOMAIN_CHECKPOINT_CREATE_QUIESCE = 1 shl 1;
    VIR_DOMAIN_CHECKPOINT_CREATE_REDEFINE_VALIDATE = 1 shl 2;
;
{ Create a checkpoint using the current VM state.  }
(* Const before type ignored *)

function virDomainCheckpointCreateXML(domain:TvirDomainPtr; xmlDesc:Pchar; flags:dword):TvirDomainCheckpointPtr;cdecl;external;
{*
 * virDomainCheckpointXMLFlags:
 *
 * Since: 5.6.0
  }
{ Include sensitive data (Since: 5.6.0)  }
{ Suppress <domain>
                                                       subelement (Since: 5.6.0)  }
{ Include dynamic
                                                       per-<disk> size (Since: 5.6.0)  }
type
  PvirDomainCheckpointXMLFlags = ^TvirDomainCheckpointXMLFlags;
  TvirDomainCheckpointXMLFlags =  Longint;
  Const
    VIR_DOMAIN_CHECKPOINT_XML_SECURE = 1 shl 0;
    VIR_DOMAIN_CHECKPOINT_XML_NO_DOMAIN = 1 shl 1;
    VIR_DOMAIN_CHECKPOINT_XML_SIZE = 1 shl 2;
;
{ Dump the XML of a checkpoint  }

function virDomainCheckpointGetXMLDesc(checkpoint:TvirDomainCheckpointPtr; flags:dword):Pchar;cdecl;external;
{*
 * virDomainCheckpointListFlags:
 *
 * Flags valid for virDomainListAllCheckpoints() and
 * virDomainCheckpointListAllChildren().  Note that the interpretation of
 * flag (1<<0) depends on which function it is passed to; but serves
 * to toggle the per-call default of whether the listing is shallow or
 * recursive.  Remaining bits come in groups; if all bits from a group
 * are 0, then that group is not used to filter results.
 *
 * Since: 5.6.0
  }
{ Filter by checkpoints
                                                          with no parents, when
                                                          listing a domain (Since: 5.6.0)  }
{ List all descendants,
                                                          not just children, when
                                                          listing a checkpoint (Since: 5.6.0)  }
{ Ensure parents occur
                                                          before children in
                                                          the resulting list (Since: 5.6.0)  }
{ Filter by checkpoints
                                                          with no children (Since: 5.6.0)  }
{ Filter by checkpoints
                                                          that have children (Since: 5.6.0)  }
type
  PvirDomainCheckpointListFlags = ^TvirDomainCheckpointListFlags;
  TvirDomainCheckpointListFlags =  Longint;
  Const
    VIR_DOMAIN_CHECKPOINT_LIST_ROOTS = 1 shl 0;
    VIR_DOMAIN_CHECKPOINT_LIST_DESCENDANTS = 1 shl 0;
    VIR_DOMAIN_CHECKPOINT_LIST_TOPOLOGICAL = 1 shl 1;
    VIR_DOMAIN_CHECKPOINT_LIST_LEAVES = 1 shl 2;
    VIR_DOMAIN_CHECKPOINT_LIST_NO_LEAVES = 1 shl 3;
;
{ Get all checkpoint objects for this domain  }

function virDomainListAllCheckpoints(domain:TvirDomainPtr; checkpoints:PPvirDomainCheckpointPtr; flags:dword):longint;cdecl;external;
{ Get all checkpoint object children for this checkpoint  }
function virDomainCheckpointListAllChildren(checkpoint:TvirDomainCheckpointPtr; children:PPvirDomainCheckpointPtr; flags:dword):longint;cdecl;external;
{ Get a handle to a named checkpoint  }
(* Const before type ignored *)
function virDomainCheckpointLookupByName(domain:TvirDomainPtr; name:Pchar; flags:dword):TvirDomainCheckpointPtr;cdecl;external;
{ Get a handle to the parent checkpoint, if one exists  }
function virDomainCheckpointGetParent(checkpoint:TvirDomainCheckpointPtr; flags:dword):TvirDomainCheckpointPtr;cdecl;external;
{*
 * virDomainCheckpointDeleteFlags:
 *
 * Delete a checkpoint
 *
 * Since: 5.6.0
  }
{ Also delete children (Since: 5.6.0)  }
{ Delete just metadata (Since: 5.6.0)  }
{ Delete just children (Since: 5.6.0)  }
type
  PvirDomainCheckpointDeleteFlags = ^TvirDomainCheckpointDeleteFlags;
  TvirDomainCheckpointDeleteFlags =  Longint;
  Const
    VIR_DOMAIN_CHECKPOINT_DELETE_CHILDREN = 1 shl 0;
    VIR_DOMAIN_CHECKPOINT_DELETE_METADATA_ONLY = 1 shl 1;
    VIR_DOMAIN_CHECKPOINT_DELETE_CHILDREN_ONLY = 1 shl 2;
;

function virDomainCheckpointDelete(checkpoint:TvirDomainCheckpointPtr; flags:dword):longint;cdecl;external;
function virDomainCheckpointRef(checkpoint:TvirDomainCheckpointPtr):longint;cdecl;external;
function virDomainCheckpointFree(checkpoint:TvirDomainCheckpointPtr):longint;cdecl;external;
{$endif}
{ LIBVIRT_DOMAIN_CHECKPOINT_H  }

implementation


end.
