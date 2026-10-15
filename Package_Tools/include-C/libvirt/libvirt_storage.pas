unit libvirt_storage;

interface

uses
  fp_virt, libvirt_host, libvirt_common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PPvirStoragePoolPtr = ^PvirStoragePoolPtr;
  PvirStoragePoolPtr = ^TvirStoragePoolPtr;
  TvirStoragePoolPtr = type Pointer;

type
  PvirStoragePoolState = ^TvirStoragePoolState;
  TvirStoragePoolState = longint;
const
  VIR_STORAGE_POOL_INACTIVE = 0;
  VIR_STORAGE_POOL_BUILDING = 1;
  VIR_STORAGE_POOL_RUNNING = 2;
  VIR_STORAGE_POOL_DEGRADED = 3;
  VIR_STORAGE_POOL_INACCESSIBLE = 4;
  VIR_STORAGE_POOL_STATE_LAST = 5;

type
  PvirStoragePoolBuildFlags = ^TvirStoragePoolBuildFlags;
  TvirStoragePoolBuildFlags = longint;
const
  VIR_STORAGE_POOL_BUILD_NEW = 0;
  VIR_STORAGE_POOL_BUILD_REPAIR = 1 shl 0;
  VIR_STORAGE_POOL_BUILD_RESIZE = 1 shl 1;
  VIR_STORAGE_POOL_BUILD_NO_OVERWRITE = 1 shl 2;
  VIR_STORAGE_POOL_BUILD_OVERWRITE = 1 shl 3;

type
  PvirStoragePoolDeleteFlags = ^TvirStoragePoolDeleteFlags;
  TvirStoragePoolDeleteFlags = longint;
const
  VIR_STORAGE_POOL_DELETE_NORMAL = 0;
  VIR_STORAGE_POOL_DELETE_ZEROED = 1 shl 0;

type
  PvirStoragePoolCreateFlags = ^TvirStoragePoolCreateFlags;
  TvirStoragePoolCreateFlags = longint;
const
  VIR_STORAGE_POOL_CREATE_NORMAL = 0;
  VIR_STORAGE_POOL_CREATE_WITH_BUILD = 1 shl 0;
  VIR_STORAGE_POOL_CREATE_WITH_BUILD_OVERWRITE = 1 shl 1;
  VIR_STORAGE_POOL_CREATE_WITH_BUILD_NO_OVERWRITE = 1 shl 2;

type
  PvirStoragePoolInfo = ^TvirStoragePoolInfo;
  TvirStoragePoolInfo = record
    state: longint;
    capacity: qword;
    allocation: qword;
    available: qword;
  end;
  PvirStoragePoolInfoPtr = ^TvirStoragePoolInfoPtr;
  TvirStoragePoolInfoPtr = PvirStoragePoolInfo;

  PPvirStorageVolPtr = ^PvirStorageVolPtr;
  PvirStorageVolPtr = ^TvirStorageVolPtr;
  TvirStorageVolPtr = type Pointer;

type
  PvirStorageVolType = ^TvirStorageVolType;
  TvirStorageVolType = longint;
const
  VIR_STORAGE_VOL_FILE = 0;
  VIR_STORAGE_VOL_BLOCK = 1;
  VIR_STORAGE_VOL_DIR = 2;
  VIR_STORAGE_VOL_NETWORK = 3;
  VIR_STORAGE_VOL_NETDIR = 4;
  VIR_STORAGE_VOL_PLOOP = 5;
  VIR_STORAGE_VOL_LAST = 6;

type
  PvirStorageVolDeleteFlags = ^TvirStorageVolDeleteFlags;
  TvirStorageVolDeleteFlags = longint;
const
  VIR_STORAGE_VOL_DELETE_NORMAL = 0;
  VIR_STORAGE_VOL_DELETE_ZEROED = 1 shl 0;
  VIR_STORAGE_VOL_DELETE_WITH_SNAPSHOTS = 1 shl 1;

type
  PvirStorageVolWipeAlgorithm = ^TvirStorageVolWipeAlgorithm;
  TvirStorageVolWipeAlgorithm = longint;
const
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

type
  PvirStorageVolInfoFlags = ^TvirStorageVolInfoFlags;
  TvirStorageVolInfoFlags = longint;
const
  VIR_STORAGE_VOL_USE_ALLOCATION = 0;
  VIR_STORAGE_VOL_GET_PHYSICAL = 1 shl 0;

type
  PvirStorageVolInfo = ^TvirStorageVolInfo;
  TvirStorageVolInfo = record
    _type: longint;
    capacity: qword;
    allocation: qword;
  end;
  PvirStorageVolInfoPtr = ^TvirStorageVolInfoPtr;
  TvirStorageVolInfoPtr = PvirStorageVolInfo;

type
  PvirStorageXMLFlags = ^TvirStorageXMLFlags;
  TvirStorageXMLFlags = longint;
const
  VIR_STORAGE_XML_INACTIVE = 1 shl 0;

function virStoragePoolGetConnect(pool: TvirStoragePoolPtr): TvirConnectPtr; cdecl; external libvirt;
function virConnectGetStoragePoolCapabilities(conn: TvirConnectPtr; flags: dword): pchar; cdecl; external libvirt;
function virConnectNumOfStoragePools(conn: TvirConnectPtr): longint; cdecl; external libvirt;
function virConnectListStoragePools(conn: TvirConnectPtr; names: PPchar; maxnames: longint): longint; cdecl; external libvirt;
function virConnectNumOfDefinedStoragePools(conn: TvirConnectPtr): longint; cdecl; external libvirt;
function virConnectListDefinedStoragePools(conn: TvirConnectPtr; names: PPchar; maxnames: longint): longint; cdecl; external libvirt;

type
  PvirConnectListAllStoragePoolsFlags = ^TvirConnectListAllStoragePoolsFlags;
  TvirConnectListAllStoragePoolsFlags = longint;
const
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

function virConnectListAllStoragePools(conn: TvirConnectPtr; pools: PPvirStoragePoolPtr; flags: dword): longint; cdecl; external libvirt;
function virConnectFindStoragePoolSources(conn: TvirConnectPtr; _type: pchar; srcSpec: pchar; flags: dword): pchar; cdecl; external libvirt;

function virStoragePoolLookupByName(conn: TvirConnectPtr; name: pchar): TvirStoragePoolPtr; cdecl; external libvirt;
function virStoragePoolLookupByUUID(conn: TvirConnectPtr; uuid: pbyte): TvirStoragePoolPtr; cdecl; external libvirt;
function virStoragePoolLookupByUUIDString(conn: TvirConnectPtr; uuid: pchar): TvirStoragePoolPtr; cdecl; external libvirt;
function virStoragePoolLookupByVolume(vol: TvirStorageVolPtr): TvirStoragePoolPtr; cdecl; external libvirt;
function virStoragePoolLookupByTargetPath(conn: TvirConnectPtr; path: pchar): TvirStoragePoolPtr; cdecl; external libvirt;

type
  PvirStoragePoolDefineFlags = ^TvirStoragePoolDefineFlags;
  TvirStoragePoolDefineFlags = longint;
const
  VIR_STORAGE_POOL_DEFINE_VALIDATE = 1 shl 0;

function virStoragePoolCreateXML(conn: TvirConnectPtr; xmlDesc: pchar; flags: dword): TvirStoragePoolPtr; cdecl; external libvirt;
function virStoragePoolDefineXML(conn: TvirConnectPtr; xmlDesc: pchar; flags: dword): TvirStoragePoolPtr; cdecl; external libvirt;
function virStoragePoolBuild(pool: TvirStoragePoolPtr; flags: dword): longint; cdecl; external libvirt;
function virStoragePoolUndefine(pool: TvirStoragePoolPtr): longint; cdecl; external libvirt;
function virStoragePoolCreate(pool: TvirStoragePoolPtr; flags: dword): longint; cdecl; external libvirt;
function virStoragePoolDestroy(pool: TvirStoragePoolPtr): longint; cdecl; external libvirt;
function virStoragePoolDelete(pool: TvirStoragePoolPtr; flags: dword): longint; cdecl; external libvirt;
function virStoragePoolRef(pool: TvirStoragePoolPtr): longint; cdecl; external libvirt;
function virStoragePoolFree(pool: TvirStoragePoolPtr): longint; cdecl; external libvirt;
function virStoragePoolRefresh(pool: TvirStoragePoolPtr; flags: dword): longint; cdecl; external libvirt;

function virStoragePoolGetName(pool: TvirStoragePoolPtr): pchar; cdecl; external libvirt;
function virStoragePoolGetUUID(pool: TvirStoragePoolPtr; uuid: pbyte): longint; cdecl; external libvirt;
function virStoragePoolGetUUIDString(pool: TvirStoragePoolPtr; buf: pchar): longint; cdecl; external libvirt;
function virStoragePoolGetInfo(vol: TvirStoragePoolPtr; info: TvirStoragePoolInfoPtr): longint; cdecl; external libvirt;
function virStoragePoolGetXMLDesc(pool: TvirStoragePoolPtr; flags: dword): pchar; cdecl; external libvirt;
function virStoragePoolGetAutostart(pool: TvirStoragePoolPtr; autostart: Plongint): longint; cdecl; external libvirt;
function virStoragePoolSetAutostart(pool: TvirStoragePoolPtr; autostart: longint): longint; cdecl; external libvirt;

function virStoragePoolNumOfVolumes(pool: TvirStoragePoolPtr): longint; cdecl; external libvirt;
function virStoragePoolListVolumes(pool: TvirStoragePoolPtr; names: PPchar; maxnames: longint): longint; cdecl; external libvirt;
function virStoragePoolListAllVolumes(pool: TvirStoragePoolPtr; vols: PPvirStorageVolPtr; flags: dword): longint; cdecl; external libvirt;
function virStorageVolGetConnect(vol: TvirStorageVolPtr): TvirConnectPtr; cdecl; external libvirt;

function virStorageVolLookupByName(pool: TvirStoragePoolPtr; name: pchar): TvirStorageVolPtr; cdecl; external libvirt;
function virStorageVolLookupByKey(conn: TvirConnectPtr; key: pchar): TvirStorageVolPtr; cdecl; external libvirt;
function virStorageVolLookupByPath(conn: TvirConnectPtr; path: pchar): TvirStorageVolPtr; cdecl; external libvirt;
function virStorageVolGetName(vol: TvirStorageVolPtr): pchar; cdecl; external libvirt;
function virStorageVolGetKey(vol: TvirStorageVolPtr): pchar; cdecl; external libvirt;

type
  PvirStorageVolCreateFlags = ^TvirStorageVolCreateFlags;
  TvirStorageVolCreateFlags = longint;
const
  VIR_STORAGE_VOL_CREATE_PREALLOC_METADATA = 1 shl 0;
  VIR_STORAGE_VOL_CREATE_REFLINK = 1 shl 1;
  VIR_STORAGE_VOL_CREATE_VALIDATE = 1 shl 2;

function virStorageVolCreateXML(pool: TvirStoragePoolPtr; xmldesc: pchar; flags: dword): TvirStorageVolPtr; cdecl; external libvirt;
function virStorageVolCreateXMLFrom(pool: TvirStoragePoolPtr; xmldesc: pchar; clonevol: TvirStorageVolPtr; flags: dword): TvirStorageVolPtr; cdecl; external libvirt;

type
  PvirStorageVolDownloadFlags = ^TvirStorageVolDownloadFlags;
  TvirStorageVolDownloadFlags = longint;
const
  VIR_STORAGE_VOL_DOWNLOAD_SPARSE_STREAM = 1 shl 0;

function virStorageVolDownload(vol: TvirStorageVolPtr; stream: TvirStreamPtr; offset: qword; length: qword; flags: dword): longint; cdecl; external libvirt;

type
  PvirStorageVolUploadFlags = ^TvirStorageVolUploadFlags;
  TvirStorageVolUploadFlags = longint;
const
  VIR_STORAGE_VOL_UPLOAD_SPARSE_STREAM = 1 shl 0;

function virStorageVolUpload(vol: TvirStorageVolPtr; stream: TvirStreamPtr; offset: qword; length: qword; flags: dword): longint; cdecl; external libvirt;
function virStorageVolDelete(vol: TvirStorageVolPtr; flags: dword): longint; cdecl; external libvirt;
function virStorageVolWipe(vol: TvirStorageVolPtr; flags: dword): longint; cdecl; external libvirt;
function virStorageVolWipePattern(vol: TvirStorageVolPtr; algorithm: dword; flags: dword): longint; cdecl; external libvirt;
function virStorageVolRef(vol: TvirStorageVolPtr): longint; cdecl; external libvirt;
function virStorageVolFree(vol: TvirStorageVolPtr): longint; cdecl; external libvirt;
function virStorageVolGetInfo(vol: TvirStorageVolPtr; info: TvirStorageVolInfoPtr): longint; cdecl; external libvirt;
function virStorageVolGetInfoFlags(vol: TvirStorageVolPtr; info: TvirStorageVolInfoPtr; flags: dword): longint; cdecl; external libvirt;
function virStorageVolGetXMLDesc(pool: TvirStorageVolPtr; flags: dword): pchar; cdecl; external libvirt;
function virStorageVolGetPath(vol: TvirStorageVolPtr): pchar; cdecl; external libvirt;

type
  PvirStorageVolResizeFlags = ^TvirStorageVolResizeFlags;
  TvirStorageVolResizeFlags = longint;
const
  VIR_STORAGE_VOL_RESIZE_ALLOCATE = 1 shl 0;
  VIR_STORAGE_VOL_RESIZE_DELTA = 1 shl 1;
  VIR_STORAGE_VOL_RESIZE_SHRINK = 1 shl 2;

function virStorageVolResize(vol: TvirStorageVolPtr; capacity: qword; flags: dword): longint; cdecl; external libvirt;
function virStoragePoolIsActive(pool: TvirStoragePoolPtr): longint; cdecl; external libvirt;
function virStoragePoolIsPersistent(pool: TvirStoragePoolPtr): longint; cdecl; external libvirt;

type
  PvirStoragePoolEventID = ^TvirStoragePoolEventID;
  TvirStoragePoolEventID = longint;
const
  VIR_STORAGE_POOL_EVENT_ID_LIFECYCLE = 0;
  VIR_STORAGE_POOL_EVENT_ID_REFRESH = 1;
  VIR_STORAGE_POOL_EVENT_ID_LAST = 2;

type
  TvirConnectStoragePoolEventGenericCallback = procedure(conn: TvirConnectPtr; pool: TvirStoragePoolPtr; opaque: pointer); cdecl;

function virConnectStoragePoolEventRegisterAny(conn: TvirConnectPtr; pool: TvirStoragePoolPtr; eventID: longint; cb: TvirConnectStoragePoolEventGenericCallback; opaque: pointer;
  freecb: TvirFreeCallback): longint; cdecl; external libvirt;
function virConnectStoragePoolEventDeregisterAny(conn: TvirConnectPtr; callbackID: longint): longint; cdecl; external libvirt;

type
  PvirStoragePoolEventLifecycleType = ^TvirStoragePoolEventLifecycleType;
  TvirStoragePoolEventLifecycleType = longint;
const
  VIR_STORAGE_POOL_EVENT_DEFINED = 0;
  VIR_STORAGE_POOL_EVENT_UNDEFINED = 1;
  VIR_STORAGE_POOL_EVENT_STARTED = 2;
  VIR_STORAGE_POOL_EVENT_STOPPED = 3;
  VIR_STORAGE_POOL_EVENT_CREATED = 4;
  VIR_STORAGE_POOL_EVENT_DELETED = 5;
  VIR_STORAGE_POOL_EVENT_LAST = 6;

type
  TvirConnectStoragePoolEventLifecycleCallback = procedure(conn: TvirConnectPtr; pool: TvirStoragePoolPtr; event: longint; detail: longint; opaque: pointer); cdecl;

  // === Konventiert am: 14-10-26 19:34:23 ===


implementation

end.
