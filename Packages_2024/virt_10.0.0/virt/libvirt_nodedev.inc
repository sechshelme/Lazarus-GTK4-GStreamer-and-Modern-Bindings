{$IFDEF read_interface}


type
  PPvirNodeDevicePtr = ^PvirNodeDevicePtr;
  PvirNodeDevicePtr = ^TvirNodeDevicePtr;
  TvirNodeDevicePtr = type Pointer;

function virNodeNumOfDevices(conn: TvirConnectPtr; cap: pchar; flags: dword): longint; cdecl; external libvirt;
function virNodeListDevices(conn: TvirConnectPtr; cap: pchar; names: PPchar; maxnames: longint; flags: dword): longint; cdecl; external libvirt;

type
  PvirConnectListAllNodeDeviceFlags = ^TvirConnectListAllNodeDeviceFlags;
  TvirConnectListAllNodeDeviceFlags = longint;
const
  VIR_CONNECT_LIST_NODE_DEVICES_CAP_SYSTEM = 1 shl 0;
  VIR_CONNECT_LIST_NODE_DEVICES_CAP_PCI_DEV = 1 shl 1;
  VIR_CONNECT_LIST_NODE_DEVICES_CAP_USB_DEV = 1 shl 2;
  VIR_CONNECT_LIST_NODE_DEVICES_CAP_USB_INTERFACE = 1 shl 3;
  VIR_CONNECT_LIST_NODE_DEVICES_CAP_NET = 1 shl 4;
  VIR_CONNECT_LIST_NODE_DEVICES_CAP_SCSI_HOST = 1 shl 5;
  VIR_CONNECT_LIST_NODE_DEVICES_CAP_SCSI_TARGET = 1 shl 6;
  VIR_CONNECT_LIST_NODE_DEVICES_CAP_SCSI = 1 shl 7;
  VIR_CONNECT_LIST_NODE_DEVICES_CAP_STORAGE = 1 shl 8;
  VIR_CONNECT_LIST_NODE_DEVICES_CAP_FC_HOST = 1 shl 9;
  VIR_CONNECT_LIST_NODE_DEVICES_CAP_VPORTS = 1 shl 10;
  VIR_CONNECT_LIST_NODE_DEVICES_CAP_SCSI_GENERIC = 1 shl 11;
  VIR_CONNECT_LIST_NODE_DEVICES_CAP_DRM = 1 shl 12;
  VIR_CONNECT_LIST_NODE_DEVICES_CAP_MDEV_TYPES = 1 shl 13;
  VIR_CONNECT_LIST_NODE_DEVICES_CAP_MDEV = 1 shl 14;
  VIR_CONNECT_LIST_NODE_DEVICES_CAP_CCW_DEV = 1 shl 15;
  VIR_CONNECT_LIST_NODE_DEVICES_CAP_CSS_DEV = 1 shl 16;
  VIR_CONNECT_LIST_NODE_DEVICES_CAP_VDPA = 1 shl 17;
  VIR_CONNECT_LIST_NODE_DEVICES_CAP_AP_CARD = 1 shl 18;
  VIR_CONNECT_LIST_NODE_DEVICES_CAP_AP_QUEUE = 1 shl 19;
  VIR_CONNECT_LIST_NODE_DEVICES_CAP_AP_MATRIX = 1 shl 20;
  VIR_CONNECT_LIST_NODE_DEVICES_CAP_VPD = 1 shl 21;
  VIR_CONNECT_LIST_NODE_DEVICES_INACTIVE = 1 shl 30;
  VIR_CONNECT_LIST_NODE_DEVICES_ACTIVE = 1 shl 31;

function virConnectListAllNodeDevices(conn: TvirConnectPtr; devices: PPvirNodeDevicePtr; flags: dword): longint; cdecl; external libvirt;
function virNodeDeviceLookupByName(conn: TvirConnectPtr; name: pchar): TvirNodeDevicePtr; cdecl; external libvirt;
function virNodeDeviceLookupSCSIHostByWWN(conn: TvirConnectPtr; wwnn: pchar; wwpn: pchar; flags: dword): TvirNodeDevicePtr; cdecl; external libvirt;
function virNodeDeviceGetName(dev: TvirNodeDevicePtr): pchar; cdecl; external libvirt;
function virNodeDeviceGetParent(dev: TvirNodeDevicePtr): pchar; cdecl; external libvirt;
function virNodeDeviceNumOfCaps(dev: TvirNodeDevicePtr): longint; cdecl; external libvirt;
function virNodeDeviceListCaps(dev: TvirNodeDevicePtr; names: PPchar; maxnames: longint): longint; cdecl; external libvirt;
function virNodeDeviceGetXMLDesc(dev: TvirNodeDevicePtr; flags: dword): pchar; cdecl; external libvirt;
function virNodeDeviceRef(dev: TvirNodeDevicePtr): longint; cdecl; external libvirt;
function virNodeDeviceFree(dev: TvirNodeDevicePtr): longint; cdecl; external libvirt;
function virNodeDeviceDettach(dev: TvirNodeDevicePtr): longint; cdecl; external libvirt;
function virNodeDeviceDetachFlags(dev: TvirNodeDevicePtr; driverName: pchar; flags: dword): longint; cdecl; external libvirt;
function virNodeDeviceReAttach(dev: TvirNodeDevicePtr): longint; cdecl; external libvirt;
function virNodeDeviceReset(dev: TvirNodeDevicePtr): longint; cdecl; external libvirt;

type
  PvirNodeDeviceCreateXMLFlags = ^TvirNodeDeviceCreateXMLFlags;
  TvirNodeDeviceCreateXMLFlags = longint;
const
  VIR_NODE_DEVICE_CREATE_XML_VALIDATE = 1 shl 0;

function virNodeDeviceCreateXML(conn: TvirConnectPtr; xmlDesc: pchar; flags: dword): TvirNodeDevicePtr; cdecl; external libvirt;
function virNodeDeviceDestroy(dev: TvirNodeDevicePtr): longint; cdecl; external libvirt;

type
  PvirNodeDeviceDefineXMLFlags = ^TvirNodeDeviceDefineXMLFlags;
  TvirNodeDeviceDefineXMLFlags = longint;
const
  VIR_NODE_DEVICE_DEFINE_XML_VALIDATE = 1 shl 0;

function virNodeDeviceDefineXML(conn: TvirConnectPtr; xmlDesc: pchar; flags: dword): TvirNodeDevicePtr; cdecl; external libvirt;
function virNodeDeviceUndefine(dev: TvirNodeDevicePtr; flags: dword): longint; cdecl; external libvirt;
function virNodeDeviceCreate(dev: TvirNodeDevicePtr; flags: dword): longint; cdecl; external libvirt;
function virNodeDeviceSetAutostart(dev: TvirNodeDevicePtr; autostart: longint): longint; cdecl; external libvirt;
function virNodeDeviceGetAutostart(dev: TvirNodeDevicePtr; autostart: Plongint): longint; cdecl; external libvirt;
function virNodeDeviceIsPersistent(dev: TvirNodeDevicePtr): longint; cdecl; external libvirt;
function virNodeDeviceIsActive(dev: TvirNodeDevicePtr): longint; cdecl; external libvirt;

type
  PvirNodeDeviceEventID = ^TvirNodeDeviceEventID;
  TvirNodeDeviceEventID = longint;
const
  VIR_NODE_DEVICE_EVENT_ID_LIFECYCLE = 0;
  VIR_NODE_DEVICE_EVENT_ID_UPDATE = 1;
  VIR_NODE_DEVICE_EVENT_ID_LAST = 2;

type
  TvirConnectNodeDeviceEventGenericCallback = procedure(conn: TvirConnectPtr; dev: TvirNodeDevicePtr; opaque: pointer); cdecl;

function virConnectNodeDeviceEventRegisterAny(conn: TvirConnectPtr; dev: TvirNodeDevicePtr; eventID: longint; cb: TvirConnectNodeDeviceEventGenericCallback; opaque: pointer;
  freecb: TvirFreeCallback): longint; cdecl; external libvirt;
function virConnectNodeDeviceEventDeregisterAny(conn: TvirConnectPtr; callbackID: longint): longint; cdecl; external libvirt;

type
  PvirNodeDeviceEventLifecycleType = ^TvirNodeDeviceEventLifecycleType;
  TvirNodeDeviceEventLifecycleType = longint;
const
  VIR_NODE_DEVICE_EVENT_CREATED = 0;
  VIR_NODE_DEVICE_EVENT_DELETED = 1;
  VIR_NODE_DEVICE_EVENT_DEFINED = 2;
  VIR_NODE_DEVICE_EVENT_UNDEFINED = 3;
  VIR_NODE_DEVICE_EVENT_LAST = 4;

type
  TvirConnectNodeDeviceEventLifecycleCallback = procedure(conn: TvirConnectPtr; dev: TvirNodeDevicePtr; event: longint; detail: longint; opaque: pointer); cdecl;

  // === Konventiert am: 14-10-26 19:34:33 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
