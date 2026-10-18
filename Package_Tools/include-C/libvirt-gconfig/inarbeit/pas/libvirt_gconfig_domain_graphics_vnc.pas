unit libvirt_gconfig_domain_graphics_vnc;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-graphics-vnc.h: libvirt domain VNC graphics configuration
 *
 * Copyright (C) 2011 Red Hat, Inc.
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
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)

type
{ Do not add fields to this struct  }
  PGVirConfigDomainGraphicsVnc = ^TGVirConfigDomainGraphicsVnc;
  TGVirConfigDomainGraphicsVnc = record
      parent : TGVirConfigDomainGraphics;
      priv : PGVirConfigDomainGraphicsVncPrivate;
    end;

  PGVirConfigDomainGraphicsVncClass = ^TGVirConfigDomainGraphicsVncClass;
  TGVirConfigDomainGraphicsVncClass = record
      parent_class : TGVirConfigDomainGraphicsClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_domain_graphics_vnc_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_domain_graphics_vnc_new:PGVirConfigDomainGraphicsVnc;cdecl;external libvirtgconfig;
function gvir_config_domain_graphics_vnc_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainGraphicsVnc;cdecl;external libvirtgconfig;
function gvir_config_domain_graphics_vnc_get_socket(graphics:PGVirConfigDomainGraphicsVnc):Pchar;cdecl;external libvirtgconfig;
procedure gvir_config_domain_graphics_vnc_set_socket(graphics:PGVirConfigDomainGraphicsVnc; socket:Pchar);cdecl;external libvirtgconfig;
procedure gvir_config_domain_graphics_vnc_set_autoport(graphics:PGVirConfigDomainGraphicsVnc; autoport:Tgboolean);cdecl;external libvirtgconfig;
function gvir_config_domain_graphics_vnc_get_port(graphics:PGVirConfigDomainGraphicsVnc):longint;cdecl;external libvirtgconfig;
procedure gvir_config_domain_graphics_vnc_set_port(graphics:PGVirConfigDomainGraphicsVnc; port:longint);cdecl;external libvirtgconfig;
procedure gvir_config_domain_graphics_vnc_set_password(graphics:PGVirConfigDomainGraphicsVnc; password:Pchar);cdecl;external libvirtgconfig;

// === Konventiert am: 18-10-26 12:43:36 ===

function GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_VNC : TGType;
function GVIR_CONFIG_DOMAIN_GRAPHICS_VNC(obj : Pointer) : PGVirConfigDomainGraphicsVnc;
function GVIR_CONFIG_DOMAIN_GRAPHICS_VNC_CLASS(klass : Pointer) : PGVirConfigDomainGraphicsVncClass;
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_VNC(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_VNC_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_GRAPHICS_VNC_GET_CLASS(obj : Pointer) : PGVirConfigDomainGraphicsVncClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_VNC : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_VNC:=gvir_config_domain_graphics_vnc_get_type;
  end;

function GVIR_CONFIG_DOMAIN_GRAPHICS_VNC(obj : Pointer) : PGVirConfigDomainGraphicsVnc;
begin
  Result := PGVirConfigDomainGraphicsVnc(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_VNC));
end;

function GVIR_CONFIG_DOMAIN_GRAPHICS_VNC_CLASS(klass : Pointer) : PGVirConfigDomainGraphicsVncClass;
begin
  Result := PGVirConfigDomainGraphicsVncClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_VNC));
end;

function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_VNC(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_VNC);
end;

function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_VNC_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_VNC);
end;

function GVIR_CONFIG_DOMAIN_GRAPHICS_VNC_GET_CLASS(obj : Pointer) : PGVirConfigDomainGraphicsVncClass;
begin
  Result := PGVirConfigDomainGraphicsVncClass(PGTypeInstance(obj)^.g_class);
end;



end.
