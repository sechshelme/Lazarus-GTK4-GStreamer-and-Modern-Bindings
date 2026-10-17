unit libvirt_gconfig_domain_console;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-console.h: libvirt domain console configuration
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
  PGVirConfigDomainConsole = ^TGVirConfigDomainConsole;
  TGVirConfigDomainConsole = record
      parent : TGVirConfigDomainChardev;
      priv : PGVirConfigDomainConsolePrivate;
    end;

  PGVirConfigDomainConsoleClass = ^TGVirConfigDomainConsoleClass;
  TGVirConfigDomainConsoleClass = record
      parent_class : TGVirConfigDomainChardevClass;
      padding : array[0..19] of Tgpointer;
    end;


  PGVirConfigDomainConsoleTargetType = ^TGVirConfigDomainConsoleTargetType;
  TGVirConfigDomainConsoleTargetType =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_CONSOLE_TARGET_XEN = 0;
    GVIR_CONFIG_DOMAIN_CONSOLE_TARGET_SERIAL = 1;
    GVIR_CONFIG_DOMAIN_CONSOLE_TARGET_UML = 2;
    GVIR_CONFIG_DOMAIN_CONSOLE_TARGET_VIRTIO = 3;
    GVIR_CONFIG_DOMAIN_CONSOLE_TARGET_LXC = 4;
    GVIR_CONFIG_DOMAIN_CONSOLE_TARGET_OPENVZ = 5;
;

function gvir_config_domain_console_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_domain_console_new:PGVirConfigDomainConsole;cdecl;external libvirtgconfig;
function gvir_config_domain_console_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainConsole;cdecl;external libvirtgconfig;
procedure gvir_config_domain_console_set_target_type(console:PGVirConfigDomainConsole; _type:TGVirConfigDomainConsoleTargetType);cdecl;external libvirtgconfig;

// === Konventiert am: 17-10-26 19:59:48 ===

function GVIR_CONFIG_TYPE_DOMAIN_CONSOLE : TGType;
function GVIR_CONFIG_DOMAIN_CONSOLE(obj : Pointer) : PGVirConfigDomainConsole;
function GVIR_CONFIG_DOMAIN_CONSOLE_CLASS(klass : Pointer) : PGVirConfigDomainConsoleClass;
function GVIR_CONFIG_IS_DOMAIN_CONSOLE(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_CONSOLE_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_CONSOLE_GET_CLASS(obj : Pointer) : PGVirConfigDomainConsoleClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_CONSOLE : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_CONSOLE:=gvir_config_domain_console_get_type;
  end;

function GVIR_CONFIG_DOMAIN_CONSOLE(obj : Pointer) : PGVirConfigDomainConsole;
begin
  Result := PGVirConfigDomainConsole(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_CONSOLE));
end;

function GVIR_CONFIG_DOMAIN_CONSOLE_CLASS(klass : Pointer) : PGVirConfigDomainConsoleClass;
begin
  Result := PGVirConfigDomainConsoleClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_CONSOLE));
end;

function GVIR_CONFIG_IS_DOMAIN_CONSOLE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_CONSOLE);
end;

function GVIR_CONFIG_IS_DOMAIN_CONSOLE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_CONSOLE);
end;

function GVIR_CONFIG_DOMAIN_CONSOLE_GET_CLASS(obj : Pointer) : PGVirConfigDomainConsoleClass;
begin
  Result := PGVirConfigDomainConsoleClass(PGTypeInstance(obj)^.g_class);
end;



end.
