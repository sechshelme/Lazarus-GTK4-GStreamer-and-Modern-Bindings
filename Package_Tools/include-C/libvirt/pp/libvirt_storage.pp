
unit libvirt_storage;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_storage.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_storage.h
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
Pbyte  = ^byte;
Pchar  = ^char;
Plongint  = ^longint;
PvirConnectListAllStoragePoolsFlags  = ^virConnectListAllStoragePoolsFlags;
PvirStoragePool  = ^virStoragePool;
PvirStoragePoolBuildFlags  = ^virStoragePoolBuildFlags;
PvirStoragePoolCreateFlags  = ^virStoragePoolCreateFlags;
PvirStoragePoolDefineFlags  = ^virStoragePoolDefineFlags;
PvirStoragePoolDeleteFlags  = ^virStoragePoolDeleteFlags;
PvirStoragePoolEventID  = ^virStoragePoolEventID;
PvirStoragePoolEventLifecycleType  = ^virStoragePoolEventLifecycleType;
PvirStoragePoolInfo  = ^virStoragePoolInfo;
PvirStoragePoolInfoPtr  = ^virStoragePoolInfoPtr;
PvirStoragePoolPtr  = ^virStoragePoolPtr;
PvirStoragePoolState  = ^virStoragePoolState;
PvirStorageVol  = ^virStorageVol;
PvirStorageVolCreateFlags  = ^virStorageVolCreateFlags;
PvirStorageVolDeleteFlags  = ^virStorageVolDeleteFlags;
PvirStorageVolDownloadFlags  = ^virStorageVolDownloadFlags;
PvirStorageVolInfo  = ^virStorageVolInfo;
PvirStorageVolInfoFlags  = ^virStorageVolInfoFlags;
PvirStorageVolInfoPtr  = ^virStorageVolInfoPtr;
PvirStorageVolPtr  = ^virStorageVolPtr;
PvirStorageVolResizeFlags  = ^virStorageVolResizeFlags;
PvirStorageVolType  = ^virStorageVolType;
PvirStorageVolUploadFlags  = ^virStorageVolUploadFlags;
PvirStorageVolWipeAlgorithm  = ^virStorageVolWipeAlgorithm;
PvirStorageXMLFlags  = ^virStorageXMLFlags;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-storage.h
 * Summary: APIs for management of storage pools and volumes
 * Description: Provides APIs for the management of storage pools and volumes
 *
 * Copyright (C) 2006-2016 Red Hat, Inc.
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
{$ifndef LIBVIRT_STORAGE_H}
{$define LIBVIRT_STORAGE_H}
{$ifndef __VIR_LIBVIRT_H_INCLUDES__}
{$error "Don't include this file directly, only use libvirt/libvirt.h"}
{$endif}
{*
 * virStoragePool:
 *
 * a virStoragePool is a private structure representing a storage pool
 *
 * Since: 0.4.1
  }
type
{*
 * virStoragePoolPtr:
 *
 * a virStoragePoolPtr is pointer to a virStoragePool private structure, this is the
 * type used to reference a storage pool in the API.
 *
 * Since: 0.4.1
  }

  PvirStoragePoolPtr = ^TvirStoragePoolPtr;
  TvirStoragePoolPtr = PvirStoragePool;
{*
 * virStoragePoolState:
 *
 * Since: 0.4.1
  }
{ Not running (Since: 0.4.1)  }
{ Initializing pool, not available (Since: 0.4.1)  }
{ Running normally (Since: 0.4.1)  }
{ Running degraded (Since: 0.4.1)  }
{ Running, but not accessible (Since: 0.8.2)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 0.9.10)  }
{$endif}
type
  PvirStoragePoolState = ^TvirStoragePoolState;
  TvirStoragePoolState =  Longint;
  Const
    VIR_STORAGE_POOL_INACTIVE = 0;
    VIR_STORAGE_POOL_BUILDING = 1;
    VIR_STORAGE_POOL_RUNNING = 2;
    VIR_STORAGE_POOL_DEGRADED = 3;
    VIR_STORAGE_POOL_INACCESSIBLE = 4;
    VIR_STORAGE_POOL_STATE_LAST = 5;
;
{*
 * virStoragePoolBuildFlags:
 *
 * Since: 0.4.1
  }
{ Regular build from scratch (Since: 0.4.1)  }
{ Repair / reinitialize (Since: 0.4.1)  }
{ Extend existing pool (Since: 0.4.1)  }
{ Do not overwrite existing pool (Since: 0.9.5)  }
{ Overwrite data (Since: 0.9.5)  }
type
  PvirStoragePoolBuildFlags = ^TvirStoragePoolBuildFlags;
  TvirStoragePoolBuildFlags =  Longint;
  Const
    VIR_STORAGE_POOL_BUILD_NEW = 0;
    VIR_STORAGE_POOL_BUILD_REPAIR = 1 shl 0;
    VIR_STORAGE_POOL_BUILD_RESIZE = 1 shl 1;
    VIR_STORAGE_POOL_BUILD_NO_OVERWRITE = 1 shl 2;
    VIR_STORAGE_POOL_BUILD_OVERWRITE = 1 shl 3;
;
{*
 * virStoragePoolDeleteFlags:
 *
 * Since: 0.4.1
  }
{ Delete metadata only    (fast) (Since: 0.4.1)  }
{ Clear all data to zeros (slow) (Since: 0.4.1)  }
type
  PvirStoragePoolDeleteFlags = ^TvirStoragePoolDeleteFlags;
  TvirStoragePoolDeleteFlags =  Longint;
  Const
    VIR_STORAGE_POOL_DELETE_NORMAL = 0;
    VIR_STORAGE_POOL_DELETE_ZEROED = 1 shl 0;
;
{*
 * virStoragePoolCreateFlags:
 *
 * Since: 1.3.1
  }
{ Create the pool but do not perform pool build (Since: 1.3.1)  }
{ Create the pool and perform pool build without any flags (Since: 1.3.1)  }
{ Create the pool and perform pool build using the
     * VIR_STORAGE_POOL_BUILD_OVERWRITE flag. This is mutually
     * exclusive to VIR_STORAGE_POOL_CREATE_WITH_BUILD_NO_OVERWRITE
     *
     * Since: 1.3.1
      }
{ Create the pool and perform pool build using the
     * VIR_STORAGE_POOL_BUILD_NO_OVERWRITE flag. This is mutually
     * exclusive to VIR_STORAGE_POOL_CREATE_WITH_BUILD_OVERWRITE
     *
     * Since: 1.3.1
      }
type
  PvirStoragePoolCreateFlags = ^TvirStoragePoolCreateFlags;
  TvirStoragePoolCreateFlags =  Longint;
  Const
    VIR_STORAGE_POOL_CREATE_NORMAL = 0;
    VIR_STORAGE_POOL_CREATE_WITH_BUILD = 1 shl 0;
    VIR_STORAGE_POOL_CREATE_WITH_BUILD_OVERWRITE = 1 shl 1;
    VIR_STORAGE_POOL_CREATE_WITH_BUILD_NO_OVERWRITE = 1 shl 2;
;
{*
 * virStoragePoolInfo:
 *
 * Since: 0.4.1
  }
type
{ virStoragePoolState flags  }
{ Logical size bytes  }
{ Current allocation bytes  }
{ Remaining free space bytes  }
  PvirStoragePoolInfo = ^TvirStoragePoolInfo;
  TvirStoragePoolInfo = record
      state : longint;
      capacity : qword;
      allocation : qword;
      available : qword;
    end;

{*
 * virStoragePoolInfoPtr:
 *
 * Since: 0.4.1
  }

  PvirStoragePoolInfoPtr = ^TvirStoragePoolInfoPtr;
  TvirStoragePoolInfoPtr = PvirStoragePoolInfo;
{*
 * virStorageVol:
 *
 * a virStorageVol is a private structure representing a storage volume
 *
 * Since: 0.4.1
  }
{*
 * virStorageVolPtr:
 *
 * a virStorageVolPtr is pointer to a virStorageVol private structure, this is the
 * type used to reference a storage volume in the API.
 *
 * Since: 0.4.1
  }

  PvirStorageVolPtr = ^TvirStorageVolPtr;
  TvirStorageVolPtr = PvirStorageVol;
{*
 * virStorageVolType:
 *
 * Since: 0.4.1
  }
{ Regular file based volumes (Since: 0.4.1)  }
{ Block based volumes (Since: 0.4.1)  }
{ Directory-passthrough based volume (Since: 0.9.5)  }
{ Network volumes like RBD (RADOS Block Device) (Since: 0.9.13)  }
{ Network accessible directory that can
                                   * contain other network volumes (Since: 1.2.0)  }
{ Ploop based volumes (Since: 1.3.4)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 0.9.10)  }
{$endif}
type
  PvirStorageVolType = ^TvirStorageVolType;
  TvirStorageVolType =  Longint;
  Const
    VIR_STORAGE_VOL_FILE = 0;
    VIR_STORAGE_VOL_BLOCK = 1;
    VIR_STORAGE_VOL_DIR = 2;
    VIR_STORAGE_VOL_NETWORK = 3;
    VIR_STORAGE_VOL_NETDIR = 4;
    VIR_STORAGE_VOL_PLOOP = 5;
    VIR_STORAGE_VOL_LAST = 6;
;
{*
 * virStorageVolDeleteFlags:
 *
 * Since: 0.4.1
  }
{ Delete metadata only    (fast) (Since: 0.4.1)  }
{ Clear all data to zeros (slow) (Since: 0.4.1)  }
{ Force removal of volume, even if in use (Since: 1.2.21)  }
type
  PvirStorageVolDeleteFlags = ^TvirStorageVolDeleteFlags;
  TvirStorageVolDeleteFlags =  Longint;
  Const
    VIR_STORAGE_VOL_DELETE_NORMAL = 0;
    VIR_STORAGE_VOL_DELETE_ZEROED = 1 shl 0;
    VIR_STORAGE_VOL_DELETE_WITH_SNAPSHOTS = 1 shl 1;
;
{*
 * virStorageVolWipeAlgorithm:
 *
 * Since: 0.9.10
  }
{ 1-pass, all zeroes (Since: 0.9.10)  }
{ 4-pass  NNSA Policy Letter
                                          NAP-14.1-C (XVI-8) (Since: 0.9.10)  }
{ 4-pass DoD 5220.22-M section
                                         8-306 procedure (Since: 0.9.10)  }
{ 9-pass method recommended by the
                                         German Center of Security in
                                         Information Technologies (Since: 0.9.10)  }
{ The canonical 35-pass sequence (Since: 0.9.10)  }
{ 7-pass method described by
                                              Bruce Schneier in "Applied
                                              Cryptography" (1996) (Since: 0.9.10)  }
{ 7-pass random data (Since: 0.9.10)  }
{ 33-pass random data (Since: 0.9.10)  }
{ 1-pass random data (Since: 0.9.10)  }
{ 1-pass, trim all data on the
                                          volume by using TRIM or DISCARD (Since: 1.3.2)  }
{$ifdef VIR_ENUM_SENTINELS}
{
     * NB: this enum value will increase over time as new algorithms are
     * added to the libvirt API. It reflects the last algorithm supported
     * by this version of the libvirt API.
     *
     * Since: 0.9.10
      }
{$endif}
type
  PvirStorageVolWipeAlgorithm = ^TvirStorageVolWipeAlgorithm;
  TvirStorageVolWipeAlgorithm =  Longint;
  Const
    VIR_STORAGE_VOL_WIPE_ALG_ZERO = 0;
    VIR_STORAGE_VOL_WIPE_ALG_NNSA = 1;
    VIR_STORAGE_VOL_WIPE_ALG_DOD = 2;
    VIR_STORAGE_VOL_WIPE_ALG_BSI = 3;
    VIR_STORAGE_VOL_WIPE_ALG_GUTMANN = 4;
    VIR_STORAGE_VOL_WIPE_ALG_SCHNEIER = 5;
    VIR_STORAGE_VOL_WIPE_ALG_PFITZNER7 = 6;
    VIR_STORAGE_VOL_WIPE_ALG_PFITZNER33 = 7;
    VIR_STORAGE_VOL_WIPE_ALG_RANDOM = 8;
    VIR_STORAGE_VOL_WIPE_ALG_TRIM = 9;
    VIR_STORAGE_VOL_WIPE_ALG_LAST = 10;
;
{*
 * virStorageVolInfoFlags:
 *
 * Since: 3.0.0
  }
{ (Since: 3.0.0)  }
{ Return the physical size in allocation (Since: 3.0.0)  }
type
  PvirStorageVolInfoFlags = ^TvirStorageVolInfoFlags;
  TvirStorageVolInfoFlags =  Longint;
  Const
    VIR_STORAGE_VOL_USE_ALLOCATION = 0;
    VIR_STORAGE_VOL_GET_PHYSICAL = 1 shl 0;
;
{*
 * virStorageVolInfo:
 *
 * Since: 0.4.1
  }
type
{ virStorageVolType flags  }
{ Logical size bytes  }
{ Current allocation bytes  }
  PvirStorageVolInfo = ^TvirStorageVolInfo;
  TvirStorageVolInfo = record
      _type : longint;
      capacity : qword;
      allocation : qword;
    end;

{*
 * virStorageVolInfoPtr:
 *
 * Since: 0.4.1
  }

  PvirStorageVolInfoPtr = ^TvirStorageVolInfoPtr;
  TvirStorageVolInfoPtr = PvirStorageVolInfo;
{*
 * virStorageXMLFlags:
 *
 * Since: 0.9.13
  }
{ dump inactive pool/volume information (Since: 0.9.13)  }

  PvirStorageXMLFlags = ^TvirStorageXMLFlags;
  TvirStorageXMLFlags =  Longint;
  Const
    VIR_STORAGE_XML_INACTIVE = 1 shl 0;
;
{
 * Get connection from pool.
  }

function virStoragePoolGetConnect(pool:TvirStoragePoolPtr):TvirConnectPtr;cdecl;external;
{ Storage Pool capabilities  }
function virConnectGetStoragePoolCapabilities(conn:TvirConnectPtr; flags:dword):Pchar;cdecl;external;
{
 * List active storage pools
  }
function virConnectNumOfStoragePools(conn:TvirConnectPtr):longint;cdecl;external;
(* Const before declarator ignored *)
function virConnectListStoragePools(conn:TvirConnectPtr; names:PPchar; maxnames:longint):longint;cdecl;external;
{
 * List inactive storage pools
  }
function virConnectNumOfDefinedStoragePools(conn:TvirConnectPtr):longint;cdecl;external;
(* Const before declarator ignored *)
function virConnectListDefinedStoragePools(conn:TvirConnectPtr; names:PPchar; maxnames:longint):longint;cdecl;external;
{
 * virConnectListAllStoragePoolsFlags:
 *
 * Flags used to tune pools returned by virConnectListAllStoragePools().
 * Note that these flags come in groups; if all bits from a group are 0,
 * then that group is not used to filter results.
 *
 * Since: 0.10.2
  }
{ (Since: 0.10.2)  }
{ (Since: 0.10.2)  }
{ (Since: 0.10.2)  }
{ (Since: 0.10.2)  }
{ (Since: 0.10.2)  }
{ (Since: 0.10.2)  }
{ (Since: 0.10.2)  }
{ (Since: 0.10.2)  }
{ (Since: 0.10.2)  }
{ (Since: 0.10.2)  }
{ (Since: 0.10.2)  }
{ (Since: 0.10.2)  }
{ (Since: 0.10.2)  }
{ (Since: 0.10.2)  }
{ (Since: 0.10.2)  }
{ (Since: 0.10.2)  }
{ (Since: 1.2.1)  }
{ (Since: 1.2.8)  }
{ (Since: 3.1.0)  }
{ (Since: 5.6.0)  }
type
  PvirConnectListAllStoragePoolsFlags = ^TvirConnectListAllStoragePoolsFlags;
  TvirConnectListAllStoragePoolsFlags =  Longint;
  Const
    VIR_CONNECT_LIST_STORAGE_POOLS_INACTIVE = 1 shl 0;
    VIR_CONNECT_LIST_STORAGE_POOLS_ACTIVE = 1 shl 1;
    VIR_CONNECT_LIST_STORAGE_POOLS_PERSISTENT = 1 shl 2;
    VIR_CONNECT_LIST_STORAGE_POOLS_TRANSIENT = 1 shl 3;
    VIR_CONNECT_LIST_STORAGE_POOLS_AUTOSTART = 1 shl 4;
    VIR_CONNECT_LIST_STORAGE_POOLS_NO_AUTOSTART = 1 shl 5;
    VIR_CONNECT_LIST_STORAGE_POOLS_DIR = 1 shl 6;
    VIR_CONNECT_LIST_STORAGE_POOLS_FS = 1 shl 7;
    VIR_CONNECT_LIST_STORAGE_POOLS_NETFS = 1 shl 8;
    VIR_CONNECT_LIST_STORAGE_POOLS_LOGICAL = 1 shl 9;
    VIR_CONNECT_LIST_STORAGE_POOLS_DISK = 1 shl 10;
    VIR_CONNECT_LIST_STORAGE_POOLS_ISCSI = 1 shl 11;
    VIR_CONNECT_LIST_STORAGE_POOLS_SCSI = 1 shl 12;
    VIR_CONNECT_LIST_STORAGE_POOLS_MPATH = 1 shl 13;
    VIR_CONNECT_LIST_STORAGE_POOLS_RBD = 1 shl 14;
    VIR_CONNECT_LIST_STORAGE_POOLS_SHEEPDOG = 1 shl 15;
    VIR_CONNECT_LIST_STORAGE_POOLS_GLUSTER = 1 shl 16;
    VIR_CONNECT_LIST_STORAGE_POOLS_ZFS = 1 shl 17;
    VIR_CONNECT_LIST_STORAGE_POOLS_VSTORAGE = 1 shl 18;
    VIR_CONNECT_LIST_STORAGE_POOLS_ISCSI_DIRECT = 1 shl 19;
;

function virConnectListAllStoragePools(conn:TvirConnectPtr; pools:PPvirStoragePoolPtr; flags:dword):longint;cdecl;external;
{
 * Query a host for storage pools of a particular type
  }
(* Const before type ignored *)
(* Const before type ignored *)
function virConnectFindStoragePoolSources(conn:TvirConnectPtr; _type:Pchar; srcSpec:Pchar; flags:dword):Pchar;cdecl;external;
{
 * Lookup pool by name or uuid
  }
(* Const before type ignored *)
function virStoragePoolLookupByName(conn:TvirConnectPtr; name:Pchar):TvirStoragePoolPtr;cdecl;external;
(* Const before type ignored *)
function virStoragePoolLookupByUUID(conn:TvirConnectPtr; uuid:Pbyte):TvirStoragePoolPtr;cdecl;external;
(* Const before type ignored *)
function virStoragePoolLookupByUUIDString(conn:TvirConnectPtr; uuid:Pchar):TvirStoragePoolPtr;cdecl;external;
function virStoragePoolLookupByVolume(vol:TvirStorageVolPtr):TvirStoragePoolPtr;cdecl;external;
(* Const before type ignored *)
function virStoragePoolLookupByTargetPath(conn:TvirConnectPtr; path:Pchar):TvirStoragePoolPtr;cdecl;external;
{*
 * virStoragePoolDefineFlags:
 *
 * Since: 7.7.0
  }
{ Validate the XML document against schema (Since: 7.7.0)  }
type
  PvirStoragePoolDefineFlags = ^TvirStoragePoolDefineFlags;
  TvirStoragePoolDefineFlags =  Longint;
  Const
    VIR_STORAGE_POOL_DEFINE_VALIDATE = 1 shl 0;
;
{
 * Creating/destroying pools
  }
(* Const before type ignored *)

function virStoragePoolCreateXML(conn:TvirConnectPtr; xmlDesc:Pchar; flags:dword):TvirStoragePoolPtr;cdecl;external;
(* Const before type ignored *)
function virStoragePoolDefineXML(conn:TvirConnectPtr; xmlDesc:Pchar; flags:dword):TvirStoragePoolPtr;cdecl;external;
function virStoragePoolBuild(pool:TvirStoragePoolPtr; flags:dword):longint;cdecl;external;
function virStoragePoolUndefine(pool:TvirStoragePoolPtr):longint;cdecl;external;
function virStoragePoolCreate(pool:TvirStoragePoolPtr; flags:dword):longint;cdecl;external;
function virStoragePoolDestroy(pool:TvirStoragePoolPtr):longint;cdecl;external;
function virStoragePoolDelete(pool:TvirStoragePoolPtr; flags:dword):longint;cdecl;external;
function virStoragePoolRef(pool:TvirStoragePoolPtr):longint;cdecl;external;
function virStoragePoolFree(pool:TvirStoragePoolPtr):longint;cdecl;external;
function virStoragePoolRefresh(pool:TvirStoragePoolPtr; flags:dword):longint;cdecl;external;
{
 * StoragePool information
  }
(* Const before type ignored *)
function virStoragePoolGetName(pool:TvirStoragePoolPtr):Pchar;cdecl;external;
function virStoragePoolGetUUID(pool:TvirStoragePoolPtr; uuid:Pbyte):longint;cdecl;external;
function virStoragePoolGetUUIDString(pool:TvirStoragePoolPtr; buf:Pchar):longint;cdecl;external;
function virStoragePoolGetInfo(vol:TvirStoragePoolPtr; info:TvirStoragePoolInfoPtr):longint;cdecl;external;
function virStoragePoolGetXMLDesc(pool:TvirStoragePoolPtr; flags:dword):Pchar;cdecl;external;
function virStoragePoolGetAutostart(pool:TvirStoragePoolPtr; autostart:Plongint):longint;cdecl;external;
function virStoragePoolSetAutostart(pool:TvirStoragePoolPtr; autostart:longint):longint;cdecl;external;
{
 * List/lookup storage volumes within a pool
  }
function virStoragePoolNumOfVolumes(pool:TvirStoragePoolPtr):longint;cdecl;external;
(* Const before declarator ignored *)
function virStoragePoolListVolumes(pool:TvirStoragePoolPtr; names:PPchar; maxnames:longint):longint;cdecl;external;
function virStoragePoolListAllVolumes(pool:TvirStoragePoolPtr; vols:PPvirStorageVolPtr; flags:dword):longint;cdecl;external;
function virStorageVolGetConnect(vol:TvirStorageVolPtr):TvirConnectPtr;cdecl;external;
{
 * Lookup volumes based on various attributes
  }
(* Const before type ignored *)
function virStorageVolLookupByName(pool:TvirStoragePoolPtr; name:Pchar):TvirStorageVolPtr;cdecl;external;
(* Const before type ignored *)
function virStorageVolLookupByKey(conn:TvirConnectPtr; key:Pchar):TvirStorageVolPtr;cdecl;external;
(* Const before type ignored *)
function virStorageVolLookupByPath(conn:TvirConnectPtr; path:Pchar):TvirStorageVolPtr;cdecl;external;
(* Const before type ignored *)
function virStorageVolGetName(vol:TvirStorageVolPtr):Pchar;cdecl;external;
(* Const before type ignored *)
function virStorageVolGetKey(vol:TvirStorageVolPtr):Pchar;cdecl;external;
{*
 * virStorageVolCreateFlags:
 *
 * Since: 1.0.1
  }
{ (Since: 1.0.1)  }
{ perform a btrfs lightweight copy (Since: 1.2.13)  }
{ Validate the XML document against schema (Since: 8.10.0)  }
type
  PvirStorageVolCreateFlags = ^TvirStorageVolCreateFlags;
  TvirStorageVolCreateFlags =  Longint;
  Const
    VIR_STORAGE_VOL_CREATE_PREALLOC_METADATA = 1 shl 0;
    VIR_STORAGE_VOL_CREATE_REFLINK = 1 shl 1;
    VIR_STORAGE_VOL_CREATE_VALIDATE = 1 shl 2;
;
(* Const before type ignored *)

function virStorageVolCreateXML(pool:TvirStoragePoolPtr; xmldesc:Pchar; flags:dword):TvirStorageVolPtr;cdecl;external;
(* Const before type ignored *)
function virStorageVolCreateXMLFrom(pool:TvirStoragePoolPtr; xmldesc:Pchar; clonevol:TvirStorageVolPtr; flags:dword):TvirStorageVolPtr;cdecl;external;
{*
 * virStorageVolDownloadFlags:
 *
 * Since: 3.4.0
  }
{ Use sparse stream (Since: 3.4.0)  }
type
  PvirStorageVolDownloadFlags = ^TvirStorageVolDownloadFlags;
  TvirStorageVolDownloadFlags =  Longint;
  Const
    VIR_STORAGE_VOL_DOWNLOAD_SPARSE_STREAM = 1 shl 0;
;

function virStorageVolDownload(vol:TvirStorageVolPtr; stream:TvirStreamPtr; offset:qword; length:qword; flags:dword):longint;cdecl;external;
{*
 * virStorageVolUploadFlags:
 *
 * Since: 3.4.0
  }
{ Use sparse stream (Since: 3.4.0)  }
type
  PvirStorageVolUploadFlags = ^TvirStorageVolUploadFlags;
  TvirStorageVolUploadFlags =  Longint;
  Const
    VIR_STORAGE_VOL_UPLOAD_SPARSE_STREAM = 1 shl 0;
;

function virStorageVolUpload(vol:TvirStorageVolPtr; stream:TvirStreamPtr; offset:qword; length:qword; flags:dword):longint;cdecl;external;
function virStorageVolDelete(vol:TvirStorageVolPtr; flags:dword):longint;cdecl;external;
function virStorageVolWipe(vol:TvirStorageVolPtr; flags:dword):longint;cdecl;external;
function virStorageVolWipePattern(vol:TvirStorageVolPtr; algorithm:dword; flags:dword):longint;cdecl;external;
function virStorageVolRef(vol:TvirStorageVolPtr):longint;cdecl;external;
function virStorageVolFree(vol:TvirStorageVolPtr):longint;cdecl;external;
function virStorageVolGetInfo(vol:TvirStorageVolPtr; info:TvirStorageVolInfoPtr):longint;cdecl;external;
function virStorageVolGetInfoFlags(vol:TvirStorageVolPtr; info:TvirStorageVolInfoPtr; flags:dword):longint;cdecl;external;
function virStorageVolGetXMLDesc(pool:TvirStorageVolPtr; flags:dword):Pchar;cdecl;external;
function virStorageVolGetPath(vol:TvirStorageVolPtr):Pchar;cdecl;external;
{*
 * virStorageVolResizeFlags:
 *
 * Since: 0.9.10
  }
{ force allocation of new size (Since: 0.9.10)  }
{ size is relative to current (Since: 0.9.10)  }
{ allow decrease in capacity (Since: 0.9.10)  }
type
  PvirStorageVolResizeFlags = ^TvirStorageVolResizeFlags;
  TvirStorageVolResizeFlags =  Longint;
  Const
    VIR_STORAGE_VOL_RESIZE_ALLOCATE = 1 shl 0;
    VIR_STORAGE_VOL_RESIZE_DELTA = 1 shl 1;
    VIR_STORAGE_VOL_RESIZE_SHRINK = 1 shl 2;
;

function virStorageVolResize(vol:TvirStorageVolPtr; capacity:qword; flags:dword):longint;cdecl;external;
function virStoragePoolIsActive(pool:TvirStoragePoolPtr):longint;cdecl;external;
function virStoragePoolIsPersistent(pool:TvirStoragePoolPtr):longint;cdecl;external;
{*
 * VIR_STORAGE_POOL_EVENT_CALLBACK:
 *
 * Used to cast the event specific callback into the generic one
 * for use for virConnectStoragePoolEventRegisterAny()
 *
 * Since: 2.0.0
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function VIR_STORAGE_POOL_EVENT_CALLBACK(cb : longint) : TvirConnectStoragePoolEventGenericCallback;

{*
 * virStoragePoolEventID:
 *
 * An enumeration of supported eventId parameters for
 * virConnectStoragePoolEventRegisterAny(). Each event id determines which
 * signature of callback function will be used.
 *
 * Since: 2.0.0
  }
{ virConnectStoragePoolEventLifecycleCallback (Since: 2.0.0)  }
{ virConnectStoragePoolEventGenericCallback (Since: 2.0.0)  }
{$ifdef VIR_ENUM_SENTINELS}
{
     * NB: this enum value will increase over time as new events are
     * added to the libvirt API. It reflects the last event ID supported
     * by this version of the libvirt API.
     *
     * Since: 2.0.0
      }
{$endif}
type
  PvirStoragePoolEventID = ^TvirStoragePoolEventID;
  TvirStoragePoolEventID =  Longint;
  Const
    VIR_STORAGE_POOL_EVENT_ID_LIFECYCLE = 0;
    VIR_STORAGE_POOL_EVENT_ID_REFRESH = 1;
    VIR_STORAGE_POOL_EVENT_ID_LAST = 2;
;
{*
 * virConnectStoragePoolEventGenericCallback:
 * @conn: the connection pointer
 * @pool: the pool pointer
 * @opaque: application specified data
 *
 * A generic storage pool event callback handler, for use with
 * virConnectStoragePoolEventRegisterAny(). Specific events usually
 * have a customization with extra parameters, often with @opaque being
 * passed in a different parameter position; use
 * VIR_STORAGE_POOL_EVENT_CALLBACK() when registering an appropriate handler.
 *
 * Since: 2.0.0
  }
type

  TvirConnectStoragePoolEventGenericCallback = procedure (conn:TvirConnectPtr; pool:TvirStoragePoolPtr; opaque:pointer);cdecl;
{ Use VIR_STORAGE_POOL_EVENT_CALLBACK() to cast the 'cb' parameter   }
{ optional, to filter  }

function virConnectStoragePoolEventRegisterAny(conn:TvirConnectPtr; pool:TvirStoragePoolPtr; eventID:longint; cb:TvirConnectStoragePoolEventGenericCallback; opaque:pointer; 
           freecb:TvirFreeCallback):longint;cdecl;external;
function virConnectStoragePoolEventDeregisterAny(conn:TvirConnectPtr; callbackID:longint):longint;cdecl;external;
{*
 * virStoragePoolEventLifecycleType:
 *
 * a virStoragePoolEventLifecycleType is emitted during storage pool
 * lifecycle events
 *
 * Since: 2.0.0
  }
{ (Since: 2.0.0)  }
{ (Since: 2.0.0)  }
{ (Since: 2.0.0)  }
{ (Since: 2.0.0)  }
{ (Since: 3.8.0)  }
{ (Since: 3.8.0)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 2.0.0)  }
{$endif}
type
  PvirStoragePoolEventLifecycleType = ^TvirStoragePoolEventLifecycleType;
  TvirStoragePoolEventLifecycleType =  Longint;
  Const
    VIR_STORAGE_POOL_EVENT_DEFINED = 0;
    VIR_STORAGE_POOL_EVENT_UNDEFINED = 1;
    VIR_STORAGE_POOL_EVENT_STARTED = 2;
    VIR_STORAGE_POOL_EVENT_STOPPED = 3;
    VIR_STORAGE_POOL_EVENT_CREATED = 4;
    VIR_STORAGE_POOL_EVENT_DELETED = 5;
    VIR_STORAGE_POOL_EVENT_LAST = 6;
;
{*
 * virConnectStoragePoolEventLifecycleCallback:
 * @conn: connection object
 * @pool: pool on which the event occurred
 * @event: The specific virStoragePoolEventLifecycleType which occurred
 * @detail: contains some details on the reason of the event (currently unused)
 * @opaque: application specified data
 *
 * This callback is called when a pool lifecycle action is performed, like start
 * or stop.
 *
 * The callback signature to use when registering for an event of type
 * VIR_STORAGE_POOL_EVENT_ID_LIFECYCLE with
 * virConnectStoragePoolEventRegisterAny()
 *
 * Since: 2.0.0
  }
type

  TvirConnectStoragePoolEventLifecycleCallback = procedure (conn:TvirConnectPtr; pool:TvirStoragePoolPtr; event:longint; detail:longint; opaque:pointer);cdecl;
{$endif}
{ LIBVIRT_STORAGE_H  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function VIR_STORAGE_POOL_EVENT_CALLBACK(cb : longint) : TvirConnectStoragePoolEventGenericCallback;
begin
  VIR_STORAGE_POOL_EVENT_CALLBACK:=TvirConnectStoragePoolEventGenericCallback(cb);
end;


end.
