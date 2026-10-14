unit libvirt_qemu;

interface

uses
  fp_virt;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- c -*-
 * libvirt-qemu.h: Interfaces specific for QEMU/KVM driver
 * Summary: qemu specific interfaces
 * Description: Provides the interfaces of the libvirt library to handle
 *              qemu specific methods
 *
 * Copyright (C) 2010-2014 Red Hat, Inc.
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
{$ifndef LIBVIRT_QEMU_H}
{$define LIBVIRT_QEMU_H}
{$include <libvirt/libvirt.h>}
{*
 * virDomainQemuMonitorCommandFlags:
 *
 * Since: 0.8.8
  }
{ (Since: 0.8.8)  }
{ cmd is in HMP (Since: 0.8.8)  }
type
  PvirDomainQemuMonitorCommandFlags = ^TvirDomainQemuMonitorCommandFlags;
  TvirDomainQemuMonitorCommandFlags =  Longint;
  Const
    VIR_DOMAIN_QEMU_MONITOR_COMMAND_DEFAULT = 0;
    VIR_DOMAIN_QEMU_MONITOR_COMMAND_HMP = 1 shl 0;
;

function virDomainQemuMonitorCommand(domain:TvirDomainPtr; cmd:Pchar; result:PPchar; flags:dword):longint;cdecl;external libvirt;
function virDomainQemuMonitorCommandWithFiles(domain:TvirDomainPtr; cmd:Pchar; ninfiles:dword; infiles:Plongint; noutfiles:Pdword; 
           outfiles:PPlongint; result:PPchar; flags:dword):longint;cdecl;external libvirt;
function virDomainQemuAttach(domain:TvirConnectPtr; pid_value:dword; flags:dword):TvirDomainPtr;cdecl;external libvirt;
{*
 * virDomainQemuAgentCommandTimeoutValues:
 *
 * Since: 0.10.0
  }
{ (Since: 0.10.0)  }
{ (Since: 0.10.0)  }
{ (Since: 0.10.0)  }
{ (Since: 0.10.0)  }
{ (Since: 1.2.15)  }
type
  PvirDomainQemuAgentCommandTimeoutValues = ^TvirDomainQemuAgentCommandTimeoutValues;
  TvirDomainQemuAgentCommandTimeoutValues =  Longint;
  Const
    VIR_DOMAIN_QEMU_AGENT_COMMAND_MIN = VIR_DOMAIN_AGENT_RESPONSE_TIMEOUT_BLOCK;
    VIR_DOMAIN_QEMU_AGENT_COMMAND_BLOCK = VIR_DOMAIN_AGENT_RESPONSE_TIMEOUT_BLOCK;
    VIR_DOMAIN_QEMU_AGENT_COMMAND_DEFAULT = VIR_DOMAIN_AGENT_RESPONSE_TIMEOUT_DEFAULT;
    VIR_DOMAIN_QEMU_AGENT_COMMAND_NOWAIT = VIR_DOMAIN_AGENT_RESPONSE_TIMEOUT_NOWAIT;
    VIR_DOMAIN_QEMU_AGENT_COMMAND_SHUTDOWN = 60;
;

function virDomainQemuAgentCommand(domain:TvirDomainPtr; cmd:Pchar; timeout:longint; flags:dword):Pchar;cdecl;external libvirt;
{*
 * virConnectDomainQemuMonitorEventCallback:
 * @conn: the connection pointer
 * @dom: the domain pointer
 * @event: the name of the event
 * @seconds: the qemu timestamp of the event: seconds since Epoch, or -1 if
 *           not available
 * @micros: the qemu timestamp of the event: microseconds within the second
 * @details: the JSON details of the event, if any were given
 * @opaque: application specified data
 *
 * The callback signature to use when registering for a qemu monitor
 * event with virConnectDomainQemuMonitorEventRegister().
 *
 * Since: 1.2.3
  }
type

  TvirConnectDomainQemuMonitorEventCallback = procedure (conn:TvirConnectPtr; dom:TvirDomainPtr; event:Pchar; seconds:int64; micros:dword; 
                details:Pchar; opaque:pointer);cdecl;
{*
 * virConnectDomainQemuMonitorEventRegisterFlags:
 *
 * Since: 1.2.3
  }
{ Event filter is a regex rather than a literal string (Since: 1.2.3)  }
{ Event filter is case insensitive (Since: 1.2.3)  }

  PvirConnectDomainQemuMonitorEventRegisterFlags = ^TvirConnectDomainQemuMonitorEventRegisterFlags;
  TvirConnectDomainQemuMonitorEventRegisterFlags =  Longint;
  Const
    VIR_CONNECT_DOMAIN_QEMU_MONITOR_EVENT_REGISTER_REGEX = 1 shl 0;
    VIR_CONNECT_DOMAIN_QEMU_MONITOR_EVENT_REGISTER_NOCASE = 1 shl 1;
;

function virConnectDomainQemuMonitorEventRegister(conn:TvirConnectPtr; dom:TvirDomainPtr; event:Pchar; cb:TvirConnectDomainQemuMonitorEventCallback; opaque:pointer; 
           freecb:TvirFreeCallback; flags:dword):longint;cdecl;external libvirt;
function virConnectDomainQemuMonitorEventDeregister(conn:TvirConnectPtr; callbackID:longint):longint;cdecl;external libvirt;
{$endif}
{ LIBVIRT_QEMU_H  }

// === Konventiert am: 14-10-26 19:34:28 ===


implementation



end.
