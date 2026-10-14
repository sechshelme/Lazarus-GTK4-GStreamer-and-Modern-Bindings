
unit libvirt_nodedev;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_nodedev.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_nodedev.h
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
Plongint  = ^longint;
PvirConnectListAllNodeDeviceFlags  = ^virConnectListAllNodeDeviceFlags;
PvirNodeDevice  = ^virNodeDevice;
PvirNodeDeviceCreateXMLFlags  = ^virNodeDeviceCreateXMLFlags;
PvirNodeDeviceDefineXMLFlags  = ^virNodeDeviceDefineXMLFlags;
PvirNodeDeviceEventID  = ^virNodeDeviceEventID;
PvirNodeDeviceEventLifecycleType  = ^virNodeDeviceEventLifecycleType;
PvirNodeDevicePtr  = ^virNodeDevicePtr;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-nodedev.h
 * Summary: APIs for management of nodedevs
 * Description: Provides APIs for the management of nodedevs
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
{$ifndef LIBVIRT_NODEDEV_H}
{$define LIBVIRT_NODEDEV_H}
{$ifndef __VIR_LIBVIRT_H_INCLUDES__}
{$error "Don't include this file directly, only use libvirt/libvirt.h"}
{$endif}
{*
 * virNodeDevice:
 *
 * A virNodeDevice contains a node (host) device details.
 *
 * Since: 0.5.0
  }
type
{*
 * virNodeDevicePtr:
 *
 * A virNodeDevicePtr is a pointer to a virNodeDevice structure.  Get
 * one via virNodeDeviceLookupByName, or virNodeDeviceCreate.  Be sure
 * to call virNodeDeviceFree when done using a virNodeDevicePtr obtained
 * from any of the above functions to avoid leaking memory.
 *
 * Since: 0.5.0
  }

  PvirNodeDevicePtr = ^TvirNodeDevicePtr;
  TvirNodeDevicePtr = PvirNodeDevice;
(* Const before type ignored *)

function virNodeNumOfDevices(conn:TvirConnectPtr; cap:Pchar; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function virNodeListDevices(conn:TvirConnectPtr; cap:Pchar; names:PPchar; maxnames:longint; flags:dword):longint;cdecl;external;
{*
 * virConnectListAllNodeDeviceFlags:
 *
 * Flags used to filter either by capability or active state, the
 * returned node devices.
 *
 * Since: 0.10.2
  }
{ System capability (Since: 0.10.2)  }
{ PCI device (Since: 0.10.2)  }
{ USB device (Since: 0.10.2)  }
{ USB interface (Since: 0.10.2)  }
{ Network device (Since: 0.10.2)  }
{ SCSI Host Bus Adapter (Since: 0.10.2)  }
{ SCSI Target (Since: 0.10.2)  }
{ SCSI device (Since: 0.10.2)  }
{ Storage device (Since: 0.10.2)  }
{ FC Host Bus Adapter (Since: 1.0.4)  }
{ Capable of vport (Since: 1.0.4)  }
{ Capable of scsi_generic (Since: 1.1.0)  }
{ DRM device (Since: 3.1.0)  }
{ Capable of mediated devices (Since: 3.4.0)  }
{ Mediated device (Since: 3.4.0)  }
{ CCW device (Since: 3.4.0)  }
{ CSS device (Since: 6.8.0)  }
{ vDPA device (Since: 6.9.0)  }
{ s390 AP Card device (Since: 7.0.0)  }
{ s390 AP Queue (Since: 7.0.0)  }
{ s390 AP Matrix (Since: 7.0.0)  }
{ Device with VPD (Since: 7.9.0)  }
{ Inactive devices (Since: 7.3.0)  }
{ Active devices (Since: 7.3.0)  }
type
  PvirConnectListAllNodeDeviceFlags = ^TvirConnectListAllNodeDeviceFlags;
  TvirConnectListAllNodeDeviceFlags =  Longint;
  Const
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
;

function virConnectListAllNodeDevices(conn:TvirConnectPtr; devices:PPvirNodeDevicePtr; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
function virNodeDeviceLookupByName(conn:TvirConnectPtr; name:Pchar):TvirNodeDevicePtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function virNodeDeviceLookupSCSIHostByWWN(conn:TvirConnectPtr; wwnn:Pchar; wwpn:Pchar; flags:dword):TvirNodeDevicePtr;cdecl;external;
(* Const before type ignored *)
function virNodeDeviceGetName(dev:TvirNodeDevicePtr):Pchar;cdecl;external;
(* Const before type ignored *)
function virNodeDeviceGetParent(dev:TvirNodeDevicePtr):Pchar;cdecl;external;
function virNodeDeviceNumOfCaps(dev:TvirNodeDevicePtr):longint;cdecl;external;
(* Const before declarator ignored *)
function virNodeDeviceListCaps(dev:TvirNodeDevicePtr; names:PPchar; maxnames:longint):longint;cdecl;external;
function virNodeDeviceGetXMLDesc(dev:TvirNodeDevicePtr; flags:dword):Pchar;cdecl;external;
function virNodeDeviceRef(dev:TvirNodeDevicePtr):longint;cdecl;external;
function virNodeDeviceFree(dev:TvirNodeDevicePtr):longint;cdecl;external;
function virNodeDeviceDettach(dev:TvirNodeDevicePtr):longint;cdecl;external;
(* Const before type ignored *)
function virNodeDeviceDetachFlags(dev:TvirNodeDevicePtr; driverName:Pchar; flags:dword):longint;cdecl;external;
function virNodeDeviceReAttach(dev:TvirNodeDevicePtr):longint;cdecl;external;
function virNodeDeviceReset(dev:TvirNodeDevicePtr):longint;cdecl;external;
{*
 * virNodeDeviceCreateXMLFlags:
 *
 * Since: 8.10.0
  }
{ Validate the XML document against schema (Since: 8.10.0)  }
type
  PvirNodeDeviceCreateXMLFlags = ^TvirNodeDeviceCreateXMLFlags;
  TvirNodeDeviceCreateXMLFlags =  Longint;
  Const
    VIR_NODE_DEVICE_CREATE_XML_VALIDATE = 1 shl 0;
;
(* Const before type ignored *)

function virNodeDeviceCreateXML(conn:TvirConnectPtr; xmlDesc:Pchar; flags:dword):TvirNodeDevicePtr;cdecl;external;
function virNodeDeviceDestroy(dev:TvirNodeDevicePtr):longint;cdecl;external;
{*
 * virNodeDeviceDefineXMLFlags:
 *
 * Since: 8.10.0
  }
{ Validate the XML document against schema (Since: 8.10.0)  }
type
  PvirNodeDeviceDefineXMLFlags = ^TvirNodeDeviceDefineXMLFlags;
  TvirNodeDeviceDefineXMLFlags =  Longint;
  Const
    VIR_NODE_DEVICE_DEFINE_XML_VALIDATE = 1 shl 0;
;
(* Const before type ignored *)

function virNodeDeviceDefineXML(conn:TvirConnectPtr; xmlDesc:Pchar; flags:dword):TvirNodeDevicePtr;cdecl;external;
function virNodeDeviceUndefine(dev:TvirNodeDevicePtr; flags:dword):longint;cdecl;external;
function virNodeDeviceCreate(dev:TvirNodeDevicePtr; flags:dword):longint;cdecl;external;
function virNodeDeviceSetAutostart(dev:TvirNodeDevicePtr; autostart:longint):longint;cdecl;external;
function virNodeDeviceGetAutostart(dev:TvirNodeDevicePtr; autostart:Plongint):longint;cdecl;external;
function virNodeDeviceIsPersistent(dev:TvirNodeDevicePtr):longint;cdecl;external;
function virNodeDeviceIsActive(dev:TvirNodeDevicePtr):longint;cdecl;external;
{*
 * VIR_NODE_DEVICE_EVENT_CALLBACK:
 *
 * Used to cast the event specific callback into the generic one
 * for use for virConnectNodeDeviceEventRegisterAny()
 *
 * Since: 2.2.0
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function VIR_NODE_DEVICE_EVENT_CALLBACK(cb : longint) : TvirConnectNodeDeviceEventGenericCallback;

{*
 * virNodeDeviceEventID:
 *
 * An enumeration of supported eventId parameters for
 * virConnectNodeDeviceEventRegisterAny(). Each event id determines which
 * signature of callback function will be used.
 *
 * Since: 2.2.0
  }
{ virConnectNodeDeviceEventLifecycleCallback (Since: 2.2.0)  }
{ virConnectNodeDeviceEventGenericCallback (Since: 2.2.0)  }
{$ifdef VIR_ENUM_SENTINELS}
{
     * NB: this enum value will increase over time as new events are
     * added to the libvirt API. It reflects the last event ID supported
     * by this version of the libvirt API.
     *
     * Since: 2.2.0
      }
{$endif}
type
  PvirNodeDeviceEventID = ^TvirNodeDeviceEventID;
  TvirNodeDeviceEventID =  Longint;
  Const
    VIR_NODE_DEVICE_EVENT_ID_LIFECYCLE = 0;
    VIR_NODE_DEVICE_EVENT_ID_UPDATE = 1;
    VIR_NODE_DEVICE_EVENT_ID_LAST = 2;
;
{*
 * virConnectNodeDeviceEventGenericCallback:
 * @conn: the connection pointer
 * @dev: the node device pointer
 * @opaque: application specified data
 *
 * A generic node device event callback handler, for use with
 * virConnectNodeDeviceEventRegisterAny(). Specific events usually
 * have a customization with extra parameters, often with @opaque being
 * passed in a different parameter position; use
 * VIR_NODE_DEVICE_EVENT_CALLBACK() when registering an appropriate handler.
 *
 * Since: 2.2.0
  }
type

  TvirConnectNodeDeviceEventGenericCallback = procedure (conn:TvirConnectPtr; dev:TvirNodeDevicePtr; opaque:pointer);cdecl;
{ Use VIR_NODE_DEVICE_EVENT_CALLBACK() to cast the 'cb' parameter   }
{ optional, to filter  }

function virConnectNodeDeviceEventRegisterAny(conn:TvirConnectPtr; dev:TvirNodeDevicePtr; eventID:longint; cb:TvirConnectNodeDeviceEventGenericCallback; opaque:pointer; 
           freecb:TvirFreeCallback):longint;cdecl;external;
function virConnectNodeDeviceEventDeregisterAny(conn:TvirConnectPtr; callbackID:longint):longint;cdecl;external;
{*
 * virNodeDeviceEventLifecycleType:
 *
 * a virNodeDeviceEventLifecycleType is emitted during node device
 * lifecycle events
 *
 * Since: 2.2.0
  }
{ (Since: 2.2.0)  }
{ (Since: 2.2.0)  }
{ (Since: 7.3.0)  }
{ (Since: 7.3.0)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 2.2.0)  }
{$endif}
type
  PvirNodeDeviceEventLifecycleType = ^TvirNodeDeviceEventLifecycleType;
  TvirNodeDeviceEventLifecycleType =  Longint;
  Const
    VIR_NODE_DEVICE_EVENT_CREATED = 0;
    VIR_NODE_DEVICE_EVENT_DELETED = 1;
    VIR_NODE_DEVICE_EVENT_DEFINED = 2;
    VIR_NODE_DEVICE_EVENT_UNDEFINED = 3;
    VIR_NODE_DEVICE_EVENT_LAST = 4;
;
{*
 * virConnectNodeDeviceEventLifecycleCallback:
 * @conn: connection object
 * @dev: node device on which the event occurred
 * @event: The specific virNodeDeviceEventLifecycleType which occurred
 * @detail: contains some details on the reason of the event.
 * @opaque: application specified data
 *
 * This callback is called when a node device lifecycle action is performed,
 * like added or removed.
 *
 * The callback signature to use when registering for an event of type
 * VIR_NODE_DEVICE_EVENT_ID_LIFECYCLE with
 * virConnectNodeDeviceEventRegisterAny()
 *
 * Since: 2.2.0
  }
type

  TvirConnectNodeDeviceEventLifecycleCallback = procedure (conn:TvirConnectPtr; dev:TvirNodeDevicePtr; event:longint; detail:longint; opaque:pointer);cdecl;
{$endif}
{ LIBVIRT_NODEDEV_H  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function VIR_NODE_DEVICE_EVENT_CALLBACK(cb : longint) : TvirConnectNodeDeviceEventGenericCallback;
begin
  VIR_NODE_DEVICE_EVENT_CALLBACK:=TvirConnectNodeDeviceEventGenericCallback(cb);
end;


end.
