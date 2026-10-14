unit libvirt_secret;

interface

uses
  fp_virt;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-secret.h
 * Summary: APIs for management of secrets
 * Description: Provides APIs for the management of secrets
 *
 * Copyright (C) 2006-2014, 2016 Red Hat, Inc.
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
{$ifndef LIBVIRT_SECRET_H}
{$define LIBVIRT_SECRET_H}
{$ifndef __VIR_LIBVIRT_H_INCLUDES__}
{$error "Don't include this file directly, only use libvirt/libvirt.h"}
{$endif}
{*
 * virSecret:
 *
 * A virSecret stores a secret value (e.g. a passphrase or encryption key)
 * and associated metadata.
 *
 * Since: 0.7.1
  }
type
{*
 * virSecretPtr:
 *
 * Since: 0.7.1
  }

  PvirSecretPtr = ^TvirSecretPtr;
  TvirSecretPtr = PvirSecret;
{*
 * virSecretUsageType:
 *
 * Since: 0.7.1
  }
{ (Since: 0.7.1)  }
{ (Since: 0.7.1)  }
{ (Since: 0.9.7)  }
{ (Since: 1.0.4)  }
{ (Since: 2.3.0)  }
{ (Since: 5.6.0)  }
{$ifdef VIR_ENUM_SENTINELS}
{
     * NB: this enum value will increase over time as new usage types are
     * added to the libvirt API. It reflects the last usage type supported
     * by this version of the libvirt API.
     *
     * Since: 0.9.7
      }
{$endif}
type
  PvirSecretUsageType = ^TvirSecretUsageType;
  TvirSecretUsageType =  Longint;
  Const
    VIR_SECRET_USAGE_TYPE_NONE = 0;
    VIR_SECRET_USAGE_TYPE_VOLUME = 1;
    VIR_SECRET_USAGE_TYPE_CEPH = 2;
    VIR_SECRET_USAGE_TYPE_ISCSI = 3;
    VIR_SECRET_USAGE_TYPE_TLS = 4;
    VIR_SECRET_USAGE_TYPE_VTPM = 5;
    VIR_SECRET_USAGE_TYPE_LAST = 6;
;

function virSecretGetConnect(secret:TvirSecretPtr):TvirConnectPtr;cdecl;external libvirt;
function virConnectNumOfSecrets(conn:TvirConnectPtr):longint;cdecl;external libvirt;
function virConnectListSecrets(conn:TvirConnectPtr; uuids:PPchar; maxuuids:longint):longint;cdecl;external libvirt;
{*
 * virConnectListAllSecretsFlags:
 *
 * Flags used to filter the returned secrets. Flags in each group
 * are exclusive attributes of a secret.
 *
 * Since: 0.10.2
  }
{ kept in memory, never
                                                       stored persistently (Since: 0.10.2)  }
{ (Since: 0.10.2)  }
{ not revealed to any caller
                                                       of libvirt, nor to any other
                                                       node (Since: 0.10.2)  }
{ (Since: 0.10.2)  }
type
  PvirConnectListAllSecretsFlags = ^TvirConnectListAllSecretsFlags;
  TvirConnectListAllSecretsFlags =  Longint;
  Const
    VIR_CONNECT_LIST_SECRETS_EPHEMERAL = 1 shl 0;
    VIR_CONNECT_LIST_SECRETS_NO_EPHEMERAL = 1 shl 1;
    VIR_CONNECT_LIST_SECRETS_PRIVATE = 1 shl 2;
    VIR_CONNECT_LIST_SECRETS_NO_PRIVATE = 1 shl 3;
;

function virConnectListAllSecrets(conn:TvirConnectPtr; secrets:PPvirSecretPtr; flags:dword):longint;cdecl;external libvirt;
function virSecretLookupByUUID(conn:TvirConnectPtr; uuid:Pbyte):TvirSecretPtr;cdecl;external libvirt;
function virSecretLookupByUUIDString(conn:TvirConnectPtr; uuid:Pchar):TvirSecretPtr;cdecl;external libvirt;
function virSecretLookupByUsage(conn:TvirConnectPtr; usageType:longint; usageID:Pchar):TvirSecretPtr;cdecl;external libvirt;
{*
 * virSecretDefineFlags:
 *
 * Since: 7.7.0
  }
{ Validate the XML document against schema (Since: 7.7.0)  }
type
  PvirSecretDefineFlags = ^TvirSecretDefineFlags;
  TvirSecretDefineFlags =  Longint;
  Const
    VIR_SECRET_DEFINE_VALIDATE = 1 shl 0;
;

function virSecretDefineXML(conn:TvirConnectPtr; xml:Pchar; flags:dword):TvirSecretPtr;cdecl;external libvirt;
function virSecretGetUUID(secret:TvirSecretPtr; buf:Pbyte):longint;cdecl;external libvirt;
function virSecretGetUUIDString(secret:TvirSecretPtr; buf:Pchar):longint;cdecl;external libvirt;
function virSecretGetUsageType(secret:TvirSecretPtr):longint;cdecl;external libvirt;
function virSecretGetUsageID(secret:TvirSecretPtr):Pchar;cdecl;external libvirt;
function virSecretGetXMLDesc(secret:TvirSecretPtr; flags:dword):Pchar;cdecl;external libvirt;
function virSecretSetValue(secret:TvirSecretPtr; value:Pbyte; value_size:Tsize_t; flags:dword):longint;cdecl;external libvirt;
function virSecretGetValue(secret:TvirSecretPtr; value_size:Psize_t; flags:dword):Pbyte;cdecl;external libvirt;
function virSecretUndefine(secret:TvirSecretPtr):longint;cdecl;external libvirt;
function virSecretRef(secret:TvirSecretPtr):longint;cdecl;external libvirt;
function virSecretFree(secret:TvirSecretPtr):longint;cdecl;external libvirt;
{*
 * VIR_SECRET_EVENT_CALLBACK:
 *
 * Used to cast the event specific callback into the generic one
 * for use for virConnectSecretEventRegisterAny()
 *
 * Since: 3.0.0
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function VIR_SECRET_EVENT_CALLBACK(cb : longint) : TvirConnectSecretEventGenericCallback;

{*
 * virSecretEventID:
 *
 * An enumeration of supported eventId parameters for
 * virConnectSecretEventRegisterAny(). Each event id determines which
 * signature of callback function will be used.
 *
 * Since: 3.0.0
  }
{ virConnectSecretEventLifecycleCallback (Since: 3.0.0)  }
{ virConnectSecretEventGenericCallback (Since: 3.0.0)  }
{$ifdef VIR_ENUM_SENTINELS}
{
     * NB: this enum value will increase over time as new events are
     * added to the libvirt API. It reflects the last event ID supported
     * by this version of the libvirt API.
     *
     * Since: 3.0.0
      }
{$endif}
type
  PvirSecretEventID = ^TvirSecretEventID;
  TvirSecretEventID =  Longint;
  Const
    VIR_SECRET_EVENT_ID_LIFECYCLE = 0;
    VIR_SECRET_EVENT_ID_VALUE_CHANGED = 1;
    VIR_SECRET_EVENT_ID_LAST = 2;
;
{*
 * virConnectSecretEventGenericCallback:
 * @conn: the connection pointer
 * @secret: the secret pointer
 * @opaque: application specified data
 *
 * A generic secret event callback handler, for use with
 * virConnectSecretEventRegisterAny(). Specific events usually
 * have a customization with extra parameters, often with @opaque being
 * passed in a different parameter position; use
 * VIR_SECRET_EVENT_CALLBACK() when registering an appropriate handler.
 *
 * Since: 3.0.0
  }
type

  TvirConnectSecretEventGenericCallback = procedure (conn:TvirConnectPtr; secret:TvirSecretPtr; opaque:pointer);cdecl;
{ Use VIR_SECRET_EVENT_CALLBACK() to cast the 'cb' parameter   }
{ optional, to filter  }

function virConnectSecretEventRegisterAny(conn:TvirConnectPtr; secret:TvirSecretPtr; eventID:longint; cb:TvirConnectSecretEventGenericCallback; opaque:pointer; 
           freecb:TvirFreeCallback):longint;cdecl;external libvirt;
function virConnectSecretEventDeregisterAny(conn:TvirConnectPtr; callbackID:longint):longint;cdecl;external libvirt;
{*
 * virSecretEventLifecycleType:
 *
 * a virSecretEventLifecycleType is emitted during secret
 * lifecycle events
 *
 * Since: 3.0.0
  }
{ (Since: 3.0.0)  }
{ (Since: 3.0.0)  }
{$ifdef VIR_ENUM_SENTINELS}
{ (Since: 3.0.0)  }
{$endif}
type
  PvirSecretEventLifecycleType = ^TvirSecretEventLifecycleType;
  TvirSecretEventLifecycleType =  Longint;
  Const
    VIR_SECRET_EVENT_DEFINED = 0;
    VIR_SECRET_EVENT_UNDEFINED = 1;
    VIR_SECRET_EVENT_LAST = 2;
;
{*
 * virConnectSecretEventLifecycleCallback:
 * @conn: connection object
 * @secret: secret on which the event occurred
 * @event: The specific virSecretEventLifecycleType which occurred
 * @detail: contains some details on the reason of the event (currently unused)
 * @opaque: application specified data
 *
 * This callback is called when a secret lifecycle action is performed,
 * like added or removed.
 *
 * The callback signature to use when registering for an event of type
 * VIR_SECRET_EVENT_ID_LIFECYCLE with
 * virConnectSecretEventRegisterAny()
 *
 * Since: 3.0.0
  }
type

  TvirConnectSecretEventLifecycleCallback = procedure (conn:TvirConnectPtr; secret:TvirSecretPtr; event:longint; detail:longint; opaque:pointer);cdecl;
{$endif}
{ LIBVIRT_SECRET_H  }

// === Konventiert am: 14-10-26 19:34:26 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function VIR_SECRET_EVENT_CALLBACK(cb : longint) : TvirConnectSecretEventGenericCallback;
begin
  VIR_SECRET_EVENT_CALLBACK:=TvirConnectSecretEventGenericCallback(cb);
end;


end.
