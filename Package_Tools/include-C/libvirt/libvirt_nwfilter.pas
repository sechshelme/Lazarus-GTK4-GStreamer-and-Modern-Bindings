unit libvirt_nwfilter;

interface

uses
  fp_virt, libvirt_host;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PPvirNWFilterPtr = ^PvirNWFilterPtr;
  PvirNWFilterPtr = ^TvirNWFilterPtr;
  TvirNWFilterPtr = type Pointer;

  PPvirNWFilterBindingPtr = ^PvirNWFilterBindingPtr;
  PvirNWFilterBindingPtr = ^TvirNWFilterBindingPtr;
  TvirNWFilterBindingPtr = type Pointer;

function virConnectNumOfNWFilters(conn: TvirConnectPtr): longint; cdecl; external libvirt;
function virConnectListNWFilters(conn: TvirConnectPtr; names: PPchar; maxnames: longint): longint; cdecl; external libvirt;
function virConnectListAllNWFilters(conn: TvirConnectPtr; filters: PPvirNWFilterPtr; flags: dword): longint; cdecl; external libvirt;

function virNWFilterLookupByName(conn: TvirConnectPtr; name: pchar): TvirNWFilterPtr; cdecl; external libvirt;
function virNWFilterLookupByUUID(conn: TvirConnectPtr; uuid: pbyte): TvirNWFilterPtr; cdecl; external libvirt;
function virNWFilterLookupByUUIDString(conn: TvirConnectPtr; uuid: pchar): TvirNWFilterPtr; cdecl; external libvirt;

type
  PvirNWFilterDefineFlags = ^TvirNWFilterDefineFlags;
  TvirNWFilterDefineFlags = longint;
const
  VIR_NWFILTER_DEFINE_VALIDATE = 1 shl 0;

function virNWFilterDefineXML(conn: TvirConnectPtr; xmlDesc: pchar): TvirNWFilterPtr; cdecl; external libvirt;
function virNWFilterDefineXMLFlags(conn: TvirConnectPtr; xmlDesc: pchar; flags: dword): TvirNWFilterPtr; cdecl; external libvirt;
function virNWFilterUndefine(nwfilter: TvirNWFilterPtr): longint; cdecl; external libvirt;
function virNWFilterRef(nwfilter: TvirNWFilterPtr): longint; cdecl; external libvirt;
function virNWFilterFree(nwfilter: TvirNWFilterPtr): longint; cdecl; external libvirt;

type
  PvirNWFilterBindingCreateFlags = ^TvirNWFilterBindingCreateFlags;
  TvirNWFilterBindingCreateFlags = longint;
const
  VIR_NWFILTER_BINDING_CREATE_VALIDATE = 1 shl 0;

function virNWFilterGetName(nwfilter: TvirNWFilterPtr): pchar; cdecl; external libvirt;
function virNWFilterGetUUID(nwfilter: TvirNWFilterPtr; uuid: pbyte): longint; cdecl; external libvirt;
function virNWFilterGetUUIDString(nwfilter: TvirNWFilterPtr; buf: pchar): longint; cdecl; external libvirt;
function virNWFilterGetXMLDesc(nwfilter: TvirNWFilterPtr; flags: dword): pchar; cdecl; external libvirt;
function virNWFilterBindingLookupByPortDev(conn: TvirConnectPtr; portdev: pchar): TvirNWFilterBindingPtr; cdecl; external libvirt;
function virNWFilterBindingGetPortDev(binding: TvirNWFilterBindingPtr): pchar; cdecl; external libvirt;
function virNWFilterBindingGetFilterName(binding: TvirNWFilterBindingPtr): pchar; cdecl; external libvirt;
function virConnectListAllNWFilterBindings(conn: TvirConnectPtr; bindings: PPvirNWFilterBindingPtr; flags: dword): longint; cdecl; external libvirt;
function virNWFilterBindingCreateXML(conn: TvirConnectPtr; xml: pchar; flags: dword): TvirNWFilterBindingPtr; cdecl; external libvirt;
function virNWFilterBindingGetXMLDesc(binding: TvirNWFilterBindingPtr; flags: dword): pchar; cdecl; external libvirt;
function virNWFilterBindingDelete(binding: TvirNWFilterBindingPtr): longint; cdecl; external libvirt;
function virNWFilterBindingRef(binding: TvirNWFilterBindingPtr): longint; cdecl; external libvirt;
function virNWFilterBindingFree(binding: TvirNWFilterBindingPtr): longint; cdecl; external libvirt;

// === Konventiert am: 14-10-26 19:34:30 ===


implementation



end.
