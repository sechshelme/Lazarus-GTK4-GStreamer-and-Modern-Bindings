{$IFDEF read_interface}


type
  PPvirDomainSnapshotPtr = ^PvirDomainSnapshotPtr;
  PvirDomainSnapshotPtr = ^TvirDomainSnapshotPtr;
  TvirDomainSnapshotPtr = type Pointer;

function virDomainSnapshotGetName(snapshot: TvirDomainSnapshotPtr): pchar; cdecl; external libvirt;
function virDomainSnapshotGetDomain(snapshot: TvirDomainSnapshotPtr): TvirDomainPtr; cdecl; external libvirt;
function virDomainSnapshotGetConnect(snapshot: TvirDomainSnapshotPtr): TvirConnectPtr; cdecl; external libvirt;

type
  PvirDomainSnapshotCreateFlags = ^TvirDomainSnapshotCreateFlags;
  TvirDomainSnapshotCreateFlags = longint;
const
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

function virDomainSnapshotCreateXML(domain: TvirDomainPtr; xmlDesc: pchar; flags: dword): TvirDomainSnapshotPtr; cdecl; external libvirt;

type
  PvirDomainSnapshotXMLFlags = ^TvirDomainSnapshotXMLFlags;
  TvirDomainSnapshotXMLFlags = longint;
const
  VIR_DOMAIN_SNAPSHOT_XML_SECURE = VIR_DOMAIN_XML_SECURE;

function virDomainSnapshotGetXMLDesc(snapshot: TvirDomainSnapshotPtr; flags: dword): pchar; cdecl; external libvirt;

type
  PvirDomainSnapshotListFlags = ^TvirDomainSnapshotListFlags;
  TvirDomainSnapshotListFlags = longint;
const
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

function virDomainSnapshotNum(domain: TvirDomainPtr; flags: dword): longint; cdecl; external libvirt;
function virDomainSnapshotListNames(domain: TvirDomainPtr; names: PPchar; nameslen: longint; flags: dword): longint; cdecl; external libvirt;
function virDomainListAllSnapshots(domain: TvirDomainPtr; snaps: PPvirDomainSnapshotPtr; flags: dword): longint; cdecl; external libvirt;
function virDomainSnapshotNumChildren(snapshot: TvirDomainSnapshotPtr; flags: dword): longint; cdecl; external libvirt;
function virDomainSnapshotListChildrenNames(snapshot: TvirDomainSnapshotPtr; names: PPchar; nameslen: longint; flags: dword): longint; cdecl; external libvirt;
function virDomainSnapshotListAllChildren(snapshot: TvirDomainSnapshotPtr; snaps: PPvirDomainSnapshotPtr; flags: dword): longint; cdecl; external libvirt;
function virDomainSnapshotLookupByName(domain: TvirDomainPtr; name: pchar; flags: dword): TvirDomainSnapshotPtr; cdecl; external libvirt;
function virDomainHasCurrentSnapshot(domain: TvirDomainPtr; flags: dword): longint; cdecl; external libvirt;
function virDomainSnapshotCurrent(domain: TvirDomainPtr; flags: dword): TvirDomainSnapshotPtr; cdecl; external libvirt;
function virDomainSnapshotGetParent(snapshot: TvirDomainSnapshotPtr; flags: dword): TvirDomainSnapshotPtr; cdecl; external libvirt;
function virDomainSnapshotIsCurrent(snapshot: TvirDomainSnapshotPtr; flags: dword): longint; cdecl; external libvirt;
function virDomainSnapshotHasMetadata(snapshot: TvirDomainSnapshotPtr; flags: dword): longint; cdecl; external libvirt;

type
  PvirDomainSnapshotRevertFlags = ^TvirDomainSnapshotRevertFlags;
  TvirDomainSnapshotRevertFlags = longint;
const
  VIR_DOMAIN_SNAPSHOT_REVERT_RUNNING = 1 shl 0;
  VIR_DOMAIN_SNAPSHOT_REVERT_PAUSED = 1 shl 1;
  VIR_DOMAIN_SNAPSHOT_REVERT_FORCE = 1 shl 2;
  VIR_DOMAIN_SNAPSHOT_REVERT_RESET_NVRAM = 1 shl 3;

function virDomainRevertToSnapshot(snapshot: TvirDomainSnapshotPtr; flags: dword): longint; cdecl; external libvirt;

type
  PvirDomainSnapshotDeleteFlags = ^TvirDomainSnapshotDeleteFlags;
  TvirDomainSnapshotDeleteFlags = longint;
const
  VIR_DOMAIN_SNAPSHOT_DELETE_CHILDREN = 1 shl 0;
  VIR_DOMAIN_SNAPSHOT_DELETE_METADATA_ONLY = 1 shl 1;
  VIR_DOMAIN_SNAPSHOT_DELETE_CHILDREN_ONLY = 1 shl 2;

function virDomainSnapshotDelete(snapshot: TvirDomainSnapshotPtr; flags: dword): longint; cdecl; external libvirt;
function virDomainSnapshotRef(snapshot: TvirDomainSnapshotPtr): longint; cdecl; external libvirt;
function virDomainSnapshotFree(snapshot: TvirDomainSnapshotPtr): longint; cdecl; external libvirt;

// === Konventiert am: 14-10-26 19:34:47 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
