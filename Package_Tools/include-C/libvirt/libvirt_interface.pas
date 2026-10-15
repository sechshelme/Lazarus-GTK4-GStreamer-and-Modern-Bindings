unit libvirt_interface;

interface

uses
  fp_virt, libvirt_host;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PPvirInterfacePtr = ^PvirInterfacePtr;
  PvirInterfacePtr = ^TvirInterfacePtr;
  TvirInterfacePtr = type Pointer;

function virInterfaceGetConnect(iface: TvirInterfacePtr): TvirConnectPtr; cdecl; external libvirt;
function virConnectNumOfInterfaces(conn: TvirConnectPtr): longint; cdecl; external libvirt;
function virConnectListInterfaces(conn: TvirConnectPtr; names: PPchar; maxnames: longint): longint; cdecl; external libvirt;
function virConnectNumOfDefinedInterfaces(conn: TvirConnectPtr): longint; cdecl; external libvirt;
function virConnectListDefinedInterfaces(conn: TvirConnectPtr; names: PPchar; maxnames: longint): longint; cdecl; external libvirt;

type
  PvirConnectListAllInterfacesFlags = ^TvirConnectListAllInterfacesFlags;
  TvirConnectListAllInterfacesFlags = longint;
const
  VIR_CONNECT_LIST_INTERFACES_INACTIVE = 1 shl 0;
  VIR_CONNECT_LIST_INTERFACES_ACTIVE = 1 shl 1;

function virConnectListAllInterfaces(conn: TvirConnectPtr; ifaces: PPvirInterfacePtr; flags: dword): longint; cdecl; external libvirt;
function virInterfaceLookupByName(conn: TvirConnectPtr; name: pchar): TvirInterfacePtr; cdecl; external libvirt;
function virInterfaceLookupByMACString(conn: TvirConnectPtr; mac: pchar): TvirInterfacePtr; cdecl; external libvirt;
function virInterfaceGetName(iface: TvirInterfacePtr): pchar; cdecl; external libvirt;
function virInterfaceGetMACString(iface: TvirInterfacePtr): pchar; cdecl; external libvirt;

type
  PvirInterfaceXMLFlags = ^TvirInterfaceXMLFlags;
  TvirInterfaceXMLFlags = longint;
const
  VIR_INTERFACE_XML_INACTIVE = 1 shl 0;

type
  PvirInterfaceDefineFlags = ^TvirInterfaceDefineFlags;
  TvirInterfaceDefineFlags = longint;
const
  VIR_INTERFACE_DEFINE_VALIDATE = 1 shl 0;

function virInterfaceGetXMLDesc(iface: TvirInterfacePtr; flags: dword): pchar; cdecl; external libvirt;
function virInterfaceDefineXML(conn: TvirConnectPtr; xmlDesc: pchar; flags: dword): TvirInterfacePtr; cdecl; external libvirt;
function virInterfaceUndefine(iface: TvirInterfacePtr): longint; cdecl; external libvirt;
function virInterfaceCreate(iface: TvirInterfacePtr; flags: dword): longint; cdecl; external libvirt;
function virInterfaceDestroy(iface: TvirInterfacePtr; flags: dword): longint; cdecl; external libvirt;
function virInterfaceRef(iface: TvirInterfacePtr): longint; cdecl; external libvirt;
function virInterfaceFree(iface: TvirInterfacePtr): longint; cdecl; external libvirt;
function virInterfaceChangeBegin(conn: TvirConnectPtr; flags: dword): longint; cdecl; external libvirt;
function virInterfaceChangeCommit(conn: TvirConnectPtr; flags: dword): longint; cdecl; external libvirt;
function virInterfaceChangeRollback(conn: TvirConnectPtr; flags: dword): longint; cdecl; external libvirt;
function virInterfaceIsActive(iface: TvirInterfacePtr): longint; cdecl; external libvirt;

// === Konventiert am: 14-10-26 19:34:40 ===


implementation



end.
