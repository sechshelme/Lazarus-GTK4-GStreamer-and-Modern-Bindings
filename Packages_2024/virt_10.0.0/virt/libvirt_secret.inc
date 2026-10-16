{$IFDEF read_interface}


type
  PPvirSecretPtr = ^PvirSecretPtr;
  PvirSecretPtr = ^TvirSecretPtr;
  TvirSecretPtr = type Pointer;

type
  PvirSecretUsageType = ^TvirSecretUsageType;
  TvirSecretUsageType = longint;
const
  VIR_SECRET_USAGE_TYPE_NONE = 0;
  VIR_SECRET_USAGE_TYPE_VOLUME = 1;
  VIR_SECRET_USAGE_TYPE_CEPH = 2;
  VIR_SECRET_USAGE_TYPE_ISCSI = 3;
  VIR_SECRET_USAGE_TYPE_TLS = 4;
  VIR_SECRET_USAGE_TYPE_VTPM = 5;
  VIR_SECRET_USAGE_TYPE_LAST = 6;

function virSecretGetConnect(secret: TvirSecretPtr): TvirConnectPtr; cdecl; external libvirt;
function virConnectNumOfSecrets(conn: TvirConnectPtr): longint; cdecl; external libvirt;
function virConnectListSecrets(conn: TvirConnectPtr; uuids: PPchar; maxuuids: longint): longint; cdecl; external libvirt;

type
  PvirConnectListAllSecretsFlags = ^TvirConnectListAllSecretsFlags;
  TvirConnectListAllSecretsFlags = longint;
const
  VIR_CONNECT_LIST_SECRETS_EPHEMERAL = 1 shl 0;
  VIR_CONNECT_LIST_SECRETS_NO_EPHEMERAL = 1 shl 1;
  VIR_CONNECT_LIST_SECRETS_PRIVATE = 1 shl 2;
  VIR_CONNECT_LIST_SECRETS_NO_PRIVATE = 1 shl 3;

function virConnectListAllSecrets(conn: TvirConnectPtr; secrets: PPvirSecretPtr; flags: dword): longint; cdecl; external libvirt;
function virSecretLookupByUUID(conn: TvirConnectPtr; uuid: pbyte): TvirSecretPtr; cdecl; external libvirt;
function virSecretLookupByUUIDString(conn: TvirConnectPtr; uuid: pchar): TvirSecretPtr; cdecl; external libvirt;
function virSecretLookupByUsage(conn: TvirConnectPtr; usageType: longint; usageID: pchar): TvirSecretPtr; cdecl; external libvirt;

type
  PvirSecretDefineFlags = ^TvirSecretDefineFlags;
  TvirSecretDefineFlags = longint;
const
  VIR_SECRET_DEFINE_VALIDATE = 1 shl 0;

function virSecretDefineXML(conn: TvirConnectPtr; xml: pchar; flags: dword): TvirSecretPtr; cdecl; external libvirt;
function virSecretGetUUID(secret: TvirSecretPtr; buf: pbyte): longint; cdecl; external libvirt;
function virSecretGetUUIDString(secret: TvirSecretPtr; buf: pchar): longint; cdecl; external libvirt;
function virSecretGetUsageType(secret: TvirSecretPtr): longint; cdecl; external libvirt;
function virSecretGetUsageID(secret: TvirSecretPtr): pchar; cdecl; external libvirt;
function virSecretGetXMLDesc(secret: TvirSecretPtr; flags: dword): pchar; cdecl; external libvirt;
function virSecretSetValue(secret: TvirSecretPtr; value: pbyte; value_size: Tsize_t; flags: dword): longint; cdecl; external libvirt;
function virSecretGetValue(secret: TvirSecretPtr; value_size: Psize_t; flags: dword): pbyte; cdecl; external libvirt;
function virSecretUndefine(secret: TvirSecretPtr): longint; cdecl; external libvirt;
function virSecretRef(secret: TvirSecretPtr): longint; cdecl; external libvirt;
function virSecretFree(secret: TvirSecretPtr): longint; cdecl; external libvirt;

type
  PvirSecretEventID = ^TvirSecretEventID;
  TvirSecretEventID = longint;
const
  VIR_SECRET_EVENT_ID_LIFECYCLE = 0;
  VIR_SECRET_EVENT_ID_VALUE_CHANGED = 1;
  VIR_SECRET_EVENT_ID_LAST = 2;

type
  TvirConnectSecretEventGenericCallback = procedure(conn: TvirConnectPtr; secret: TvirSecretPtr; opaque: pointer); cdecl;

function virConnectSecretEventRegisterAny(conn: TvirConnectPtr; secret: TvirSecretPtr; eventID: longint; cb: TvirConnectSecretEventGenericCallback; opaque: pointer;
  freecb: TvirFreeCallback): longint; cdecl; external libvirt;
function virConnectSecretEventDeregisterAny(conn: TvirConnectPtr; callbackID: longint): longint; cdecl; external libvirt;

type
  PvirSecretEventLifecycleType = ^TvirSecretEventLifecycleType;
  TvirSecretEventLifecycleType = longint;
const
  VIR_SECRET_EVENT_DEFINED = 0;
  VIR_SECRET_EVENT_UNDEFINED = 1;
  VIR_SECRET_EVENT_LAST = 2;

type
  TvirConnectSecretEventLifecycleCallback = procedure(conn: TvirConnectPtr; secret: TvirSecretPtr; event: longint; detail: longint; opaque: pointer); cdecl;

  // === Konventiert am: 14-10-26 19:34:26 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
