unit libvirt_network;

interface

uses
  fp_virt, libvirt_host, libvirt_common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PvirNetworkXMLFlags = ^TvirNetworkXMLFlags;
  TvirNetworkXMLFlags = longint;
const
  VIR_NETWORK_XML_INACTIVE = 1 shl 0;

type
  PPvirNetworkPtr = ^PvirNetworkPtr;
  PvirNetworkPtr = ^TvirNetworkPtr;
  TvirNetworkPtr = type Pointer;

  PPvirNetworkPortPtr = ^PvirNetworkPortPtr;
  PvirNetworkPortPtr = ^TvirNetworkPortPtr;
  TvirNetworkPortPtr = type Pointer;

function virNetworkGetConnect(network: TvirNetworkPtr): TvirConnectPtr; cdecl; external libvirt;
function virConnectNumOfNetworks(conn: TvirConnectPtr): longint; cdecl; external libvirt;
function virConnectListNetworks(conn: TvirConnectPtr; names: PPchar; maxnames: longint): longint; cdecl; external libvirt;
function virConnectNumOfDefinedNetworks(conn: TvirConnectPtr): longint; cdecl; external libvirt;
function virConnectListDefinedNetworks(conn: TvirConnectPtr; names: PPchar; maxnames: longint): longint; cdecl; external libvirt;
type
  PvirConnectListAllNetworksFlags = ^TvirConnectListAllNetworksFlags;
  TvirConnectListAllNetworksFlags = longint;
const
  VIR_CONNECT_LIST_NETWORKS_INACTIVE = 1 shl 0;
  VIR_CONNECT_LIST_NETWORKS_ACTIVE = 1 shl 1;
  VIR_CONNECT_LIST_NETWORKS_PERSISTENT = 1 shl 2;
  VIR_CONNECT_LIST_NETWORKS_TRANSIENT = 1 shl 3;
  VIR_CONNECT_LIST_NETWORKS_AUTOSTART = 1 shl 4;
  VIR_CONNECT_LIST_NETWORKS_NO_AUTOSTART = 1 shl 5;

function virConnectListAllNetworks(conn: TvirConnectPtr; nets: PPvirNetworkPtr; flags: dword): longint; cdecl; external libvirt;

function virNetworkLookupByName(conn: TvirConnectPtr; name: pchar): TvirNetworkPtr; cdecl; external libvirt;
function virNetworkLookupByUUID(conn: TvirConnectPtr; uuid: pbyte): TvirNetworkPtr; cdecl; external libvirt;
function virNetworkLookupByUUIDString(conn: TvirConnectPtr; uuid: pchar): TvirNetworkPtr; cdecl; external libvirt;

type
  PvirNetworkCreateFlags = ^TvirNetworkCreateFlags;
  TvirNetworkCreateFlags = longint;
const
  VIR_NETWORK_CREATE_VALIDATE = 1 shl 0;

function virNetworkCreateXML(conn: TvirConnectPtr; xmlDesc: pchar): TvirNetworkPtr; cdecl; external libvirt;
function virNetworkCreateXMLFlags(conn: TvirConnectPtr; xmlDesc: pchar; flags: dword): TvirNetworkPtr; cdecl; external libvirt;

type
  PvirNetworkDefineFlags = ^TvirNetworkDefineFlags;
  TvirNetworkDefineFlags = longint;
const
  VIR_NETWORK_DEFINE_VALIDATE = 1 shl 0;

function virNetworkDefineXML(conn: TvirConnectPtr; xmlDesc: pchar): TvirNetworkPtr; cdecl; external libvirt;
function virNetworkDefineXMLFlags(conn: TvirConnectPtr; xmlDesc: pchar; flags: dword): TvirNetworkPtr; cdecl; external libvirt;
function virNetworkUndefine(network: TvirNetworkPtr): longint; cdecl; external libvirt;

type
  PvirNetworkUpdateCommand = ^TvirNetworkUpdateCommand;
  TvirNetworkUpdateCommand = longint;
const
  VIR_NETWORK_UPDATE_COMMAND_NONE = 0;
  VIR_NETWORK_UPDATE_COMMAND_MODIFY = 1;
  VIR_NETWORK_UPDATE_COMMAND_DELETE = 2;
  VIR_NETWORK_UPDATE_COMMAND_ADD_LAST = 3;
  VIR_NETWORK_UPDATE_COMMAND_ADD_FIRST = 4;
  VIR_NETWORK_UPDATE_COMMAND_LAST = 5;

type
  PvirNetworkUpdateSection = ^TvirNetworkUpdateSection;
  TvirNetworkUpdateSection = longint;
const
  VIR_NETWORK_SECTION_NONE = 0;
  VIR_NETWORK_SECTION_BRIDGE = 1;
  VIR_NETWORK_SECTION_DOMAIN = 2;
  VIR_NETWORK_SECTION_IP = 3;
  VIR_NETWORK_SECTION_IP_DHCP_HOST = 4;
  VIR_NETWORK_SECTION_IP_DHCP_RANGE = 5;
  VIR_NETWORK_SECTION_FORWARD = 6;
  VIR_NETWORK_SECTION_FORWARD_INTERFACE = 7;
  VIR_NETWORK_SECTION_FORWARD_PF = 8;
  VIR_NETWORK_SECTION_PORTGROUP = 9;
  VIR_NETWORK_SECTION_DNS_HOST = 10;
  VIR_NETWORK_SECTION_DNS_TXT = 11;
  VIR_NETWORK_SECTION_DNS_SRV = 12;
  VIR_NETWORK_SECTION_LAST = 13;

type
  PvirNetworkUpdateFlags = ^TvirNetworkUpdateFlags;
  TvirNetworkUpdateFlags = longint;
const
  VIR_NETWORK_UPDATE_AFFECT_CURRENT = 0;
  VIR_NETWORK_UPDATE_AFFECT_LIVE = 1 shl 0;
  VIR_NETWORK_UPDATE_AFFECT_CONFIG = 1 shl 1;

function virNetworkUpdate(network: TvirNetworkPtr; command: dword; section: dword; parentIndex: longint; xml: pchar;
  flags: dword): longint; cdecl; external libvirt;
function virNetworkCreate(network: TvirNetworkPtr): longint; cdecl; external libvirt;
function virNetworkDestroy(network: TvirNetworkPtr): longint; cdecl; external libvirt;
function virNetworkRef(network: TvirNetworkPtr): longint; cdecl; external libvirt;
function virNetworkFree(network: TvirNetworkPtr): longint; cdecl; external libvirt;
function virNetworkGetName(network: TvirNetworkPtr): pchar; cdecl; external libvirt;
function virNetworkGetUUID(network: TvirNetworkPtr; uuid: pbyte): longint; cdecl; external libvirt;
function virNetworkGetUUIDString(network: TvirNetworkPtr; buf: pchar): longint; cdecl; external libvirt;
function virNetworkGetXMLDesc(network: TvirNetworkPtr; flags: dword): pchar; cdecl; external libvirt;
function virNetworkGetBridgeName(network: TvirNetworkPtr): pchar; cdecl; external libvirt;
function virNetworkGetAutostart(network: TvirNetworkPtr; autostart: Plongint): longint; cdecl; external libvirt;
function virNetworkSetAutostart(network: TvirNetworkPtr; autostart: longint): longint; cdecl; external libvirt;
function virNetworkIsActive(net: TvirNetworkPtr): longint; cdecl; external libvirt;
function virNetworkIsPersistent(net: TvirNetworkPtr): longint; cdecl; external libvirt;

type
  PvirNetworkEventLifecycleType = ^TvirNetworkEventLifecycleType;
  TvirNetworkEventLifecycleType = longint;
const
  VIR_NETWORK_EVENT_DEFINED = 0;
  VIR_NETWORK_EVENT_UNDEFINED = 1;
  VIR_NETWORK_EVENT_STARTED = 2;
  VIR_NETWORK_EVENT_STOPPED = 3;
  VIR_NETWORK_EVENT_LAST = 4;

type
  TvirConnectNetworkEventLifecycleCallback = procedure(conn: TvirConnectPtr; net: TvirNetworkPtr; event: longint; detail: longint; opaque: pointer); cdecl;

type
  PvirNetworkEventID = ^TvirNetworkEventID;
  TvirNetworkEventID = longint;
const
  VIR_NETWORK_EVENT_ID_LIFECYCLE = 0;
  VIR_NETWORK_EVENT_ID_METADATA_CHANGE = 1;
  VIR_NETWORK_EVENT_ID_LAST = 2;

type
  PvirIPAddrType = ^TvirIPAddrType;
  TvirIPAddrType = longint;
const
  VIR_IP_ADDR_TYPE_IPV4 = 0;
  VIR_IP_ADDR_TYPE_IPV6 = 1;
  VIR_IP_ADDR_TYPE_LAST = 2;

type
  PvirNetworkDHCPLease = ^TvirNetworkDHCPLease;
  TvirNetworkDHCPLease = record
    iface: pchar;
    expirytime: int64;
    _type: longint;
    mac: pchar;
    iaid: pchar;
    ipaddr: pchar;
    prefix: dword;
    hostname: pchar;
    clientid: pchar;
  end;
  PPvirNetworkDHCPLeasePtr = ^PvirNetworkDHCPLeasePtr;
  PvirNetworkDHCPLeasePtr = ^TvirNetworkDHCPLeasePtr;
  TvirNetworkDHCPLeasePtr = PvirNetworkDHCPLease;

procedure virNetworkDHCPLeaseFree(lease: TvirNetworkDHCPLeasePtr); cdecl; external libvirt;
function virNetworkGetDHCPLeases(network: TvirNetworkPtr; mac: pchar; leases: PPvirNetworkDHCPLeasePtr; flags: dword): longint; cdecl; external libvirt;

type
  TvirConnectNetworkEventGenericCallback = procedure(conn: TvirConnectPtr; net: TvirNetworkPtr; opaque: pointer); cdecl;

function virConnectNetworkEventRegisterAny(conn: TvirConnectPtr; net: TvirNetworkPtr; eventID: longint; cb: TvirConnectNetworkEventGenericCallback; opaque: pointer;
  freecb: TvirFreeCallback): longint; cdecl; external libvirt;
function virConnectNetworkEventDeregisterAny(conn: TvirConnectPtr; callbackID: longint): longint; cdecl; external libvirt;
function virNetworkPortLookupByUUID(net: TvirNetworkPtr; uuid: pbyte): TvirNetworkPortPtr; cdecl; external libvirt;
function virNetworkPortLookupByUUIDString(net: TvirNetworkPtr; uuidstr: pchar): TvirNetworkPortPtr; cdecl; external libvirt;

type
  PvirNetworkPortCreateFlags = ^TvirNetworkPortCreateFlags;
  TvirNetworkPortCreateFlags = longint;
const
  VIR_NETWORK_PORT_CREATE_RECLAIM = 1 shl 0;
  VIR_NETWORK_PORT_CREATE_VALIDATE = 1 shl 1;

function virNetworkPortCreateXML(net: TvirNetworkPtr; xmldesc: pchar; flags: dword): TvirNetworkPortPtr; cdecl; external libvirt;
function virNetworkPortGetNetwork(port: TvirNetworkPortPtr): TvirNetworkPtr; cdecl; external libvirt;
function virNetworkPortGetXMLDesc(port: TvirNetworkPortPtr; flags: dword): pchar; cdecl; external libvirt;
function virNetworkPortGetUUID(port: TvirNetworkPortPtr; uuid: pbyte): longint; cdecl; external libvirt;
function virNetworkPortGetUUIDString(port: TvirNetworkPortPtr; buf: pchar): longint; cdecl; external libvirt;

const
  VIR_NETWORK_PORT_BANDWIDTH_IN_AVERAGE = 'inbound.average';
  VIR_NETWORK_PORT_BANDWIDTH_IN_PEAK = 'inbound.peak';
  VIR_NETWORK_PORT_BANDWIDTH_IN_BURST = 'inbound.burst';
  VIR_NETWORK_PORT_BANDWIDTH_IN_FLOOR = 'inbound.floor';
  VIR_NETWORK_PORT_BANDWIDTH_OUT_AVERAGE = 'outbound.average';
  VIR_NETWORK_PORT_BANDWIDTH_OUT_PEAK = 'outbound.peak';
  VIR_NETWORK_PORT_BANDWIDTH_OUT_BURST = 'outbound.burst';

function virNetworkPortSetParameters(port: TvirNetworkPortPtr; params: TvirTypedParameterPtr; nparams: longint; flags: dword): longint; cdecl; external libvirt;
function virNetworkPortGetParameters(port: TvirNetworkPortPtr; params: PvirTypedParameterPtr; nparams: Plongint; flags: dword): longint; cdecl; external libvirt;
function virNetworkPortDelete(port: TvirNetworkPortPtr; flags: dword): longint; cdecl; external libvirt;
function virNetworkListAllPorts(network: TvirNetworkPtr; ports: PPvirNetworkPortPtr; flags: dword): longint; cdecl; external libvirt;
function virNetworkPortFree(port: TvirNetworkPortPtr): longint; cdecl; external libvirt;
function virNetworkPortRef(port: TvirNetworkPortPtr): longint; cdecl; external libvirt;

type
  PvirNetworkMetadataType = ^TvirNetworkMetadataType;
  TvirNetworkMetadataType = longint;
const
  VIR_NETWORK_METADATA_DESCRIPTION = 0;
  VIR_NETWORK_METADATA_TITLE = 1;
  VIR_NETWORK_METADATA_ELEMENT = 2;
  VIR_NETWORK_METADATA_LAST = 3;

function virNetworkSetMetadata(network: TvirNetworkPtr; _type: longint; metadata: pchar; key: pchar; uri: pchar;
  flags: dword): longint; cdecl; external libvirt;
function virNetworkGetMetadata(network: TvirNetworkPtr; _type: longint; uri: pchar; flags: dword): pchar; cdecl; external libvirt;

type
  TvirConnectNetworkEventMetadataChangeCallback = procedure(conn: TvirConnectPtr; net: TvirNetworkPtr; _type: longint; nsuri: pchar; opaque: pointer); cdecl;

  // === Konventiert am: 14-10-26 19:34:35 ===


implementation


end.
