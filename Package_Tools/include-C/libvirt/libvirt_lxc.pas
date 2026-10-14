unit libvirt_lxc;

interface

uses
  fp_virt;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- c -*-
 * libvirt-lxc.h: Interfaces specific for LXC driver
 * Summary: lxc specific interfaces
 * Description: Provides the interfaces of the libvirt library to handle
 *              LXC specific methods
 *
 * Copyright (C) 2012-2013 Red Hat, Inc.
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
{$ifndef LIBVIRT_LXC_H}
{$define LIBVIRT_LXC_H}
{$include <libvirt/libvirt.h>}

function virDomainLxcOpenNamespace(domain:TvirDomainPtr; fdlist:PPlongint; flags:dword):longint;cdecl;external libvirt;
function virDomainLxcEnterNamespace(domain:TvirDomainPtr; nfdlist:dword; fdlist:Plongint; noldfdlist:Pdword; oldfdlist:PPlongint; 
           flags:dword):longint;cdecl;external libvirt;
function virDomainLxcEnterSecurityLabel(model:TvirSecurityModelPtr; _label:TvirSecurityLabelPtr; oldlabel:TvirSecurityLabelPtr; flags:dword):longint;cdecl;external libvirt;
function virDomainLxcEnterCGroup(domain:TvirDomainPtr; flags:dword):longint;cdecl;external libvirt;
{$endif}
{ LIBVIRT_LXC_H  }

// === Konventiert am: 14-10-26 19:34:37 ===


implementation



end.
