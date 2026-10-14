
unit libvirt_network;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_network.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_network.h
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
PvirConnectListAllNetworksFlags  = ^virConnectListAllNetworksFlags;
PvirIPAddrType  = ^virIPAddrType;
PvirNetwork  = ^virNetwork;
PvirNetworkCreateFlags  = ^virNetworkCreateFlags;
PvirNetworkDefineFlags  = ^virNetworkDefineFlags;
PvirNetworkDHCPLease  = ^virNetworkDHCPLease;
PvirNetworkDHCPLeasePtr  = ^virNetworkDHCPLeasePtr;
PvirNetworkEventID  = ^virNetworkEventID;
PvirNetworkEventLifecycleType  = ^virNetworkEventLifecycleType;
PvirNetworkMetadataType  = ^virNetworkMetadataType;
PvirNetworkPort  = ^virNetworkPort;
PvirNetworkPortCreateFlags  = ^virNetworkPortCreateFlags;
PvirNetworkPortPtr  = ^virNetworkPortPtr;
PvirNetworkPtr  = ^virNetworkPtr;
PvirNetworkUpdateCommand  = ^virNetworkUpdateCommand;
PvirNetworkUpdateFlags  = ^virNetworkUpdateFlags;
PvirNetworkUpdateSection  = ^virNetworkUpdateSection;
PvirNetworkXMLFlags  = ^virNetworkXMLFlags;
PvirTypedParameterPtr  = ^virTypedParameterPtr;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-network.h
 * Summary: APIs for management of networks
 * Description: Provides APIs for the management of networks
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
{$ifndef LIBVIRT_NETWORK_H}
{$define LIBVIRT_NETWORK_H}
{$ifndef __VIR_LIBVIRT_H_INCLUDES__}
{$error "Don't include this file directly, only use libvirt/libvirt.h"}
{$endif}
{*
 * virNetworkXMLFlags:
 *
 * Since: 0.9.10
  }
{ dump inactive network information (Since: 0.9.10)  }
type
  PvirNetworkXMLFlags = ^TvirNetworkXMLFlags;
  TvirNetworkXMLFlags =  Longint;
  Const
    VIR_NETWORK_XML_INACTIVE = 1 shl 0;
;
{*
 * virNetwork:
 *
 * a virNetwork is a private structure representing a virtual network.
 *
 * Since: 0.2.0
  }
type
{*
 * virNetworkPtr:
 *
 * a virNetworkPtr is pointer to a virNetwork private structure, this is the
 * type used to reference a virtual network in the API.
 *
 * Since: 0.2.0
  }

  PvirNetworkPtr = ^TvirNetworkPtr;
  TvirNetworkPtr = PvirNetwork;
{*
 * virNetworkPort:
 *
 * a virNetworkPort is a private structure representing a virtual network
 * port
 *
 * Since: 5.5.0
  }
{*
 * virNetworkPortPtr:
 *
 * a virNetworkPortPtr is pointer to a virNetworkPort private structure,
 * this is the type used to reference a virtual network port in the API.
 *
 * Since: 5.5.0
  }

  PvirNetworkPortPtr = ^TvirNetworkPortPtr;
  TvirNetworkPortPtr = PvirNetworkPort;
{
 * Get connection from network.
  }

function virNetworkGetConnect(network:TvirNetworkPtr):TvirConnectPtr;cdecl;external;
{
 * List active networks
  }
function virConnectNumOfNetworks(conn:TvirConnectPtr):longint;cdecl;external;
(* Const before declarator ignored *)
function virConnectListNetworks(conn:TvirConnectPtr; names:PPchar; maxnames:longint):longint;cdecl;external;
{
 * List inactive networks
  }
function virConnectNumOfDefinedNetworks(conn:TvirConnectPtr):longint;cdecl;external;
(* Const before declarator ignored *)
function virConnectListDefinedNetworks(conn:TvirConnectPtr; names:PPchar; maxnames:longint):longint;cdecl;external;
{*
 * virConnectListAllNetworksFlags:
 *
 * Flags used to filter the returned networks. Flags in each group
 * are exclusive attributes of a network.
 *
 * Since: 0.10.2
  }
{ (Since: 0.10.2)  }
{ (Since: 0.10.2)  }
{ (Since: 0.10.2)  }
{ (Since: 0.10.2)  }
{ (Since: 0.10.2)  }
{ (Since: 0.10.2)  }
type
  PvirConnectListAllNetworksFlags = ^TvirConnectListAllNetworksFlags;
  TvirConnectListAllNetworksFlags =  Longint;
  Const
    VIR_CONNECT_LIST_NETWORKS_INACTIVE = 1 shl 0;
    VIR_CONNECT_LIST_NETWORKS_ACTIVE = 1 shl 1;
    VIR_CONNECT_LIST_NETWORKS_PERSISTENT = 1 shl 2;
    VIR_CONNECT_LIST_NETWORKS_TRANSIENT = 1 shl 3;
    VIR_CONNECT_LIST_NETWORKS_AUTOSTART = 1 shl 4;
    VIR_CONNECT_LIST_NETWORKS_NO_AUTOSTART = 1 shl 5;
;

function virConnectListAllNetworks(conn:TvirConnectPtr; nets:PPvirNetworkPtr; flags:dword):longint;cdecl;external;
{
 * Lookup network by name or uuid
  }
(* Const before type ignored *)
function virNetworkLookupByName(conn:TvirConnectPtr; name:Pchar):TvirNetworkPtr;cdecl;external;
(* Const before type ignored *)
function virNetworkLookupByUUID(conn:TvirConnectPtr; uuid:Pbyte):TvirNetworkPtr;cdecl;external;
(* Const before type ignored *)
function virNetworkLookupByUUIDString(conn:TvirConnectPtr; uuid:Pchar):TvirNetworkPtr;cdecl;external;
{*
 * virNetworkCreateFlags:
 *
 * Since: 7.8.0
  }
{ Validate the XML document against schema (Since: 7.8.0)  }
type
  PvirNetworkCreateFlags = ^TvirNetworkCreateFlags;
  TvirNetworkCreateFlags =  Longint;
  Const
    VIR_NETWORK_CREATE_VALIDATE = 1 shl 0;
;
{
 * Create active transient network
  }
(* Const before type ignored *)

function virNetworkCreateXML(conn:TvirConnectPtr; xmlDesc:Pchar):TvirNetworkPtr;cdecl;external;
(* Const before type ignored *)
function virNetworkCreateXMLFlags(conn:TvirConnectPtr; xmlDesc:Pchar; flags:dword):TvirNetworkPtr;cdecl;external;
{*
 * virNetworkDefineFlags:
 *
 * Since: 7.7.0
  }
{ Validate the XML document against schema (Since: 7.7.0)  }
type
  PvirNetworkDefineFlags = ^TvirNetworkDefineFlags;
  TvirNetworkDefineFlags =  Longint;
  Const
    VIR_NETWORK_DEFINE_VALIDATE = 1 shl 0;
;
{
 * Define inactive persistent network
  }
(* Const before type ignored *)

function virNetworkDefineXML(conn:TvirConnectPtr; xmlDesc:Pchar):TvirNetworkPtr;cdecl;external;
(* Const before type ignored *)
function virNetworkDefineXMLFlags(conn:TvirConnectPtr; xmlDesc:Pchar; flags:dword):TvirNetworkPtr;cdecl;external;
{
 * Delete persistent network
  }
function virNetworkUndefine(network:TvirNetworkPtr):longint;cdecl;external;
{*
 * virNetworkUpdateCommand:
 *
 * describes which type of update to perform on a <network>
 * definition.
 *
 * Since: 0.10.2
  }
{ invalid (Since: 0.10.2)  }
{ modify an existing element (Since: 0.10.2)  }
{ delete an existing element (Since: 0.10.2)  }
{ add an element at end of list (Since: 0.10.2)  }
{ add an element at start of list (Since: 0.10.2)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 0.10.2)  }
{$endif}
type
  PvirNetworkUpdateCommand = ^TvirNetworkUpdateCommand;
  TvirNetworkUpdateCommand =  Longint;
  Const
    VIR_NETWORK_UPDATE_COMMAND_NONE = 0;
    VIR_NETWORK_UPDATE_COMMAND_MODIFY = 1;
    VIR_NETWORK_UPDATE_COMMAND_DELETE = 2;
    VIR_NETWORK_UPDATE_COMMAND_ADD_LAST = 3;
    VIR_NETWORK_UPDATE_COMMAND_ADD_FIRST = 4;
    VIR_NETWORK_UPDATE_COMMAND_LAST = 5;
;
{*
 * virNetworkUpdateSection:
 *
 * describes which section of a <network> definition the provided
 * xml should be applied to.
 *
 * Since: 0.10.2
  }
{ invalid (Since: 0.10.2)  }
{ <bridge> (Since: 0.10.2)  }
{ <domain> (Since: 0.10.2)  }
{ <ip> (Since: 0.10.2)  }
{ <ip>/<dhcp>/<host> (Since: 0.10.2)  }
{ <ip>/<dhcp>/<range> (Since: 0.10.2)  }
{ <forward> (Since: 0.10.2)  }
{ <forward>/<interface> (Since: 0.10.2)  }
{ <forward>/<pf> (Since: 0.10.2)  }
{ <portgroup> (Since: 0.10.2)  }
{ <dns>/<host> (Since: 0.10.2)  }
{ <dns>/<txt> (Since: 0.10.2)  }
{ <dns>/<srv> (Since: 0.10.2)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 0.10.2)  }
{$endif}
type
  PvirNetworkUpdateSection = ^TvirNetworkUpdateSection;
  TvirNetworkUpdateSection =  Longint;
  Const
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
;
{*
 * virNetworkUpdateFlags:
 *
 * Flags to control options for virNetworkUpdate()
 *
 * Since: 0.10.2
  }
{ affect live if network is active,
                                                   config if it's not active (Since: 0.10.2)  }
{ affect live state of network only (Since: 0.10.2)  }
{ affect persistent config only (Since: 0.10.2)  }
type
  PvirNetworkUpdateFlags = ^TvirNetworkUpdateFlags;
  TvirNetworkUpdateFlags =  Longint;
  Const
    VIR_NETWORK_UPDATE_AFFECT_CURRENT = 0;
    VIR_NETWORK_UPDATE_AFFECT_LIVE = 1 shl 0;
    VIR_NETWORK_UPDATE_AFFECT_CONFIG = 1 shl 1;
;
{
 * Update an existing network definition
  }
{ virNetworkUpdateCommand  }
{ virNetworkUpdateSection  }
(* Const before type ignored *)

function virNetworkUpdate(network:TvirNetworkPtr; command:dword; section:dword; parentIndex:longint; xml:Pchar; 
           flags:dword):longint;cdecl;external;
{
 * Activate persistent network
  }
function virNetworkCreate(network:TvirNetworkPtr):longint;cdecl;external;
{
 * Network destroy/free
  }
function virNetworkDestroy(network:TvirNetworkPtr):longint;cdecl;external;
function virNetworkRef(network:TvirNetworkPtr):longint;cdecl;external;
function virNetworkFree(network:TvirNetworkPtr):longint;cdecl;external;
{
 * Network information
  }
(* Const before type ignored *)
function virNetworkGetName(network:TvirNetworkPtr):Pchar;cdecl;external;
function virNetworkGetUUID(network:TvirNetworkPtr; uuid:Pbyte):longint;cdecl;external;
function virNetworkGetUUIDString(network:TvirNetworkPtr; buf:Pchar):longint;cdecl;external;
function virNetworkGetXMLDesc(network:TvirNetworkPtr; flags:dword):Pchar;cdecl;external;
function virNetworkGetBridgeName(network:TvirNetworkPtr):Pchar;cdecl;external;
function virNetworkGetAutostart(network:TvirNetworkPtr; autostart:Plongint):longint;cdecl;external;
function virNetworkSetAutostart(network:TvirNetworkPtr; autostart:longint):longint;cdecl;external;
function virNetworkIsActive(net:TvirNetworkPtr):longint;cdecl;external;
function virNetworkIsPersistent(net:TvirNetworkPtr):longint;cdecl;external;
{*
 * virNetworkEventLifecycleType:
 *
 * a virNetworkEventLifecycleType is emitted during network lifecycle events
 *
 * Since: 1.2.1
  }
{ (Since: 1.2.1)  }
{ (Since: 1.2.1)  }
{ (Since: 1.2.1)  }
{ (Since: 1.2.1)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 1.2.1)  }
{$endif}
type
  PvirNetworkEventLifecycleType = ^TvirNetworkEventLifecycleType;
  TvirNetworkEventLifecycleType =  Longint;
  Const
    VIR_NETWORK_EVENT_DEFINED = 0;
    VIR_NETWORK_EVENT_UNDEFINED = 1;
    VIR_NETWORK_EVENT_STARTED = 2;
    VIR_NETWORK_EVENT_STOPPED = 3;
    VIR_NETWORK_EVENT_LAST = 4;
;
{*
 * virConnectNetworkEventLifecycleCallback:
 * @conn: connection object
 * @net: network on which the event occurred
 * @event: The specific virNetworkEventLifecycleType which occurred
 * @detail: contains some details on the reason of the event.
 *          It will be 0 for the while.
 * @opaque: application specified data
 *
 * This callback occurs when the network is started or stopped.
 *
 * The callback signature to use when registering for an event of type
 * VIR_NETWORK_EVENT_ID_LIFECYCLE with virConnectNetworkEventRegisterAny()
 *
 * Since: 1.2.1
  }
type

  TvirConnectNetworkEventLifecycleCallback = procedure (conn:TvirConnectPtr; net:TvirNetworkPtr; event:longint; detail:longint; opaque:pointer);cdecl;
{*
 * VIR_NETWORK_EVENT_CALLBACK:
 *
 * Used to cast the event specific callback into the generic one
 * for use for virConnectNetworkEventRegisterAny()
 *
 * Since: 1.2.1
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function VIR_NETWORK_EVENT_CALLBACK(cb : longint) : TvirConnectNetworkEventGenericCallback;

{*
 * virNetworkEventID:
 *
 * An enumeration of supported eventId parameters for
 * virConnectNetworkEventRegisterAny().  Each event id determines which
 * signature of callback function will be used.
 *
 * Since: 1.2.1
  }
{ virConnectNetworkEventLifecycleCallback (Since: 1.2.1)  }
{ virConnectNetworkEventMetadataChangeCallback (Since: 9.8.0)  }
{$ifdef VIR_ENUM_SENTINELS}
{
     * NB: this enum value will increase over time as new events are
     * added to the libvirt API. It reflects the last event ID supported
     * by this version of the libvirt API.
     *
     * Since: 1.2.1
      }
{$endif}
type
  PvirNetworkEventID = ^TvirNetworkEventID;
  TvirNetworkEventID =  Longint;
  Const
    VIR_NETWORK_EVENT_ID_LIFECYCLE = 0;
    VIR_NETWORK_EVENT_ID_METADATA_CHANGE = 1;
    VIR_NETWORK_EVENT_ID_LAST = 2;
;
{*
 * virIPAddrType:
 *
 * Since: 1.2.6
  }
{ (Since: 1.2.6)  }
{ (Since: 1.2.6)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 1.2.6)  }
{$endif}
type
  PvirIPAddrType = ^TvirIPAddrType;
  TvirIPAddrType =  Longint;
  Const
    VIR_IP_ADDR_TYPE_IPV4 = 0;
    VIR_IP_ADDR_TYPE_IPV6 = 1;
    VIR_IP_ADDR_TYPE_LAST = 2;
;
{*
 * virNetworkDHCPLease:
 *
 * Since: 1.2.6
  }
type
{*
 * virNetworkDHCPLeasePtr:
 *
 * Since: 1.2.6
  }

  PvirNetworkDHCPLeasePtr = ^TvirNetworkDHCPLeasePtr;
  TvirNetworkDHCPLeasePtr = PvirNetworkDHCPLease;
{ Network interface name  }
{ Seconds since epoch  }
{ virIPAddrType  }
{ MAC address  }
{ IAID  }
{ IP address  }
{ IP address prefix  }
{ Hostname  }
{ Client ID or DUID  }
  PvirNetworkDHCPLease = ^TvirNetworkDHCPLease;
  TvirNetworkDHCPLease = record
      iface : Pchar;
      expirytime : int64;
      _type : longint;
      mac : Pchar;
      iaid : Pchar;
      ipaddr : Pchar;
      prefix : dword;
      hostname : Pchar;
      clientid : Pchar;
    end;


procedure virNetworkDHCPLeaseFree(lease:TvirNetworkDHCPLeasePtr);cdecl;external;
(* Const before type ignored *)
function virNetworkGetDHCPLeases(network:TvirNetworkPtr; mac:Pchar; leases:PPvirNetworkDHCPLeasePtr; flags:dword):longint;cdecl;external;
{*
 * virConnectNetworkEventGenericCallback:
 * @conn: the connection pointer
 * @net: the network pointer
 * @opaque: application specified data
 *
 * A generic network event callback handler, for use with
 * virConnectNetworkEventRegisterAny(). Specific events usually
 * have a customization with extra parameters, often with @opaque being
 * passed in a different parameter position; use VIR_NETWORK_EVENT_CALLBACK()
 * when registering an appropriate handler.
 *
 * Since: 1.2.1
  }
type

  TvirConnectNetworkEventGenericCallback = procedure (conn:TvirConnectPtr; net:TvirNetworkPtr; opaque:pointer);cdecl;
{ Use VIR_NETWORK_EVENT_CALLBACK() to cast the 'cb' parameter   }
{ Optional, to filter  }

function virConnectNetworkEventRegisterAny(conn:TvirConnectPtr; net:TvirNetworkPtr; eventID:longint; cb:TvirConnectNetworkEventGenericCallback; opaque:pointer; 
           freecb:TvirFreeCallback):longint;cdecl;external;
function virConnectNetworkEventDeregisterAny(conn:TvirConnectPtr; callbackID:longint):longint;cdecl;external;
(* Const before type ignored *)
function virNetworkPortLookupByUUID(net:TvirNetworkPtr; uuid:Pbyte):TvirNetworkPortPtr;cdecl;external;
(* Const before type ignored *)
function virNetworkPortLookupByUUIDString(net:TvirNetworkPtr; uuidstr:Pchar):TvirNetworkPortPtr;cdecl;external;
{*
 * virNetworkPortCreateFlags:
 *
 * Since: 5.5.0
  }
{ reclaim existing used resources (Since: 5.5.0)  }
{ Validate the XML document against schema (Since: 7.8.0)  }
type
  PvirNetworkPortCreateFlags = ^TvirNetworkPortCreateFlags;
  TvirNetworkPortCreateFlags =  Longint;
  Const
    VIR_NETWORK_PORT_CREATE_RECLAIM = 1 shl 0;
    VIR_NETWORK_PORT_CREATE_VALIDATE = 1 shl 1;
;
(* Const before type ignored *)

function virNetworkPortCreateXML(net:TvirNetworkPtr; xmldesc:Pchar; flags:dword):TvirNetworkPortPtr;cdecl;external;
function virNetworkPortGetNetwork(port:TvirNetworkPortPtr):TvirNetworkPtr;cdecl;external;
function virNetworkPortGetXMLDesc(port:TvirNetworkPortPtr; flags:dword):Pchar;cdecl;external;
function virNetworkPortGetUUID(port:TvirNetworkPortPtr; uuid:Pbyte):longint;cdecl;external;
function virNetworkPortGetUUIDString(port:TvirNetworkPortPtr; buf:Pchar):longint;cdecl;external;
{ Management of interface parameters  }
{*
 * VIR_NETWORK_PORT_BANDWIDTH_IN_AVERAGE:
 *
 * Macro represents the inbound average of NIC bandwidth, as a uint.
 *
 * Since: 5.5.0
  }
const
  VIR_NETWORK_PORT_BANDWIDTH_IN_AVERAGE = 'inbound.average';  
{*
 * VIR_NETWORK_PORT_BANDWIDTH_IN_PEAK:
 *
 * Macro represents the inbound peak of NIC bandwidth, as a uint.
 *
 * Since: 5.5.0
  }
  VIR_NETWORK_PORT_BANDWIDTH_IN_PEAK = 'inbound.peak';  
{*
 * VIR_NETWORK_PORT_BANDWIDTH_IN_BURST:
 *
 * Macro represents the inbound burst of NIC bandwidth, as a uint.
 *
 * Since: 5.5.0
  }
  VIR_NETWORK_PORT_BANDWIDTH_IN_BURST = 'inbound.burst';  
{*
 * VIR_NETWORK_PORT_BANDWIDTH_IN_FLOOR:
 *
 * Macro represents the inbound floor of NIC bandwidth, as a uint.
 *
 * Since: 5.5.0
  }
  VIR_NETWORK_PORT_BANDWIDTH_IN_FLOOR = 'inbound.floor';  
{*
 * VIR_NETWORK_PORT_BANDWIDTH_OUT_AVERAGE:
 *
 * Macro represents the outbound average of NIC bandwidth, as a uint.
 *
 * Since: 5.5.0
  }
  VIR_NETWORK_PORT_BANDWIDTH_OUT_AVERAGE = 'outbound.average';  
{*
 * VIR_NETWORK_PORT_BANDWIDTH_OUT_PEAK:
 *
 * Macro represents the outbound peak of NIC bandwidth, as a uint.
 *
 * Since: 5.5.0
  }
  VIR_NETWORK_PORT_BANDWIDTH_OUT_PEAK = 'outbound.peak';  
{*
 * VIR_NETWORK_PORT_BANDWIDTH_OUT_BURST:
 *
 * Macro represents the outbound burst of NIC bandwidth, as a uint.
 *
 * Since: 5.5.0
  }
  VIR_NETWORK_PORT_BANDWIDTH_OUT_BURST = 'outbound.burst';  

function virNetworkPortSetParameters(port:TvirNetworkPortPtr; params:TvirTypedParameterPtr; nparams:longint; flags:dword):longint;cdecl;external;
function virNetworkPortGetParameters(port:TvirNetworkPortPtr; params:PvirTypedParameterPtr; nparams:Plongint; flags:dword):longint;cdecl;external;
function virNetworkPortDelete(port:TvirNetworkPortPtr; flags:dword):longint;cdecl;external;
function virNetworkListAllPorts(network:TvirNetworkPtr; ports:PPvirNetworkPortPtr; flags:dword):longint;cdecl;external;
function virNetworkPortFree(port:TvirNetworkPortPtr):longint;cdecl;external;
function virNetworkPortRef(port:TvirNetworkPortPtr):longint;cdecl;external;
{*
 * virNetworkMetadataType:
 *
 * Since: 9.7.0
  }
{ Operate on <description> (Since: 9.7.0)  }
{ Operate on <title> (Since: 9.7.0)  }
{ Operate on <metadata> (Since: 9.7.0)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 9.7.0)  }
{$endif}
type
  PvirNetworkMetadataType = ^TvirNetworkMetadataType;
  TvirNetworkMetadataType =  Longint;
  Const
    VIR_NETWORK_METADATA_DESCRIPTION = 0;
    VIR_NETWORK_METADATA_TITLE = 1;
    VIR_NETWORK_METADATA_ELEMENT = 2;
    VIR_NETWORK_METADATA_LAST = 3;
;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function virNetworkSetMetadata(network:TvirNetworkPtr; _type:longint; metadata:Pchar; key:Pchar; uri:Pchar; 
           flags:dword):longint;cdecl;external;
(* Const before type ignored *)
function virNetworkGetMetadata(network:TvirNetworkPtr; _type:longint; uri:Pchar; flags:dword):Pchar;cdecl;external;
{*
 * virConnectNetworkEventMetadataChangeCallback:
 * @conn: connection object
 * @net: network on which the event occurred
 * @type: a value from virNetworkMetadataType
 * @nsuri: XML namespace URI
 * @opaque: application specified data
 *
 * This callback is triggered when the Network XML metadata changes
 *
 * The callback signature to use when registering for an event of type
 * VIR_NETWORK_EVENT_ID_METADATA_CHANGE with virConnectNetworkEventRegisterAny().
 *
 * Since: 9.8.0
  }
(* Const before type ignored *)
type

  TvirConnectNetworkEventMetadataChangeCallback = procedure (conn:TvirConnectPtr; net:TvirNetworkPtr; _type:longint; nsuri:Pchar; opaque:pointer);cdecl;
{$endif}
{ LIBVIRT_NETWORK_H  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function VIR_NETWORK_EVENT_CALLBACK(cb : longint) : TvirConnectNetworkEventGenericCallback;
begin
  VIR_NETWORK_EVENT_CALLBACK:=TvirConnectNetworkEventGenericCallback(cb);
end;


end.
