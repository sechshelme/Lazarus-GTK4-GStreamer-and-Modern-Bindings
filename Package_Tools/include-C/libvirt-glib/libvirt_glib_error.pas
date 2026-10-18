unit libvirt_glib_error;

interface

uses
  fp_glib2, fp_virt_glib;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-glib-error.h: libvirt glib integration
 *
 * Copyright (C) 2008 Daniel P. Berrange
 * Copyright (C) 2010-2011 Red Hat, Inc.
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
 * License along with this library. If not, see
 * <http://www.gnu.org/licenses/>.
 *
 * Author: Daniel P. Berrange <berrange@redhat.com>
  }
(** unsupported pragma#pragma once*)
{$include <glib.h>}

function gvir_error_new(domain:TGQuark; code:Tgint; format:Pgchar; args:array of const):PGError;cdecl;external libvirtglib;
function gvir_error_new(domain:TGQuark; code:Tgint; format:Pgchar):PGError;cdecl;external libvirtglib;
function gvir_error_new_literal(domain:TGQuark; code:Tgint; message:Pgchar):PGError;cdecl;external libvirtglib;
function gvir_error_new_valist(domain:TGQuark; code:Tgint; format:Pgchar; args:Tva_list):PGError;cdecl;external libvirtglib;
procedure gvir_set_error(error:PPGError; domain:TGQuark; code:Tgint; format:Pgchar; args:array of const);cdecl;external libvirtglib;
procedure gvir_set_error(error:PPGError; domain:TGQuark; code:Tgint; format:Pgchar);cdecl;external libvirtglib;
procedure gvir_set_error_literal(error:PPGError; domain:TGQuark; code:Tgint; message:Pgchar);cdecl;external libvirtglib;
procedure gvir_set_error_valist(error:PPGError; domain:TGQuark; code:Tgint; format:Pgchar; args:Tva_list);cdecl;external libvirtglib;
procedure gvir_critical(format:Pgchar; args:array of const);cdecl;external libvirtglib;
procedure gvir_critical(format:Pgchar);cdecl;external libvirtglib;
procedure gvir_warning(format:Pgchar; args:array of const);cdecl;external libvirtglib;
procedure gvir_warning(format:Pgchar);cdecl;external libvirtglib;

// === Konventiert am: 18-10-26 17:33:00 ===


implementation



end.
