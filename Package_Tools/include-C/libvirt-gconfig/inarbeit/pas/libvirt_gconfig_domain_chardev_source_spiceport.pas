unit libvirt_gconfig_domain_chardev_source_spiceport;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-chardev-source-spiceport.h: libvirt domain chardev spiceport configuration
 *
 * Copyright (C) 2014 Red Hat, Inc.
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
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)

type
{ Do not add fields to this struct  }
  PGVirConfigDomainChardevSourceSpicePort = ^TGVirConfigDomainChardevSourceSpicePort;
  TGVirConfigDomainChardevSourceSpicePort = record
      parent : TGVirConfigDomainChardevSource;
      priv : PGVirConfigDomainChardevSourceSpicePortPrivate;
    end;

  PGVirConfigDomainChardevSourceSpicePortClass = ^TGVirConfigDomainChardevSourceSpicePortClass;
  TGVirConfigDomainChardevSourceSpicePortClass = record
      parent_class : TGVirConfigDomainChardevSourceClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_domain_chardev_source_spiceport_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_domain_chardev_source_spiceport_new:PGVirConfigDomainChardevSourceSpicePort;cdecl;external libvirtgconfig;
function gvir_config_domain_chardev_source_spiceport_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainChardevSourceSpicePort;cdecl;external libvirtgconfig;
procedure gvir_config_domain_chardev_source_spiceport_set_channel(port:PGVirConfigDomainChardevSourceSpicePort; channel:Pchar);cdecl;external libvirtgconfig;
function gvir_config_domain_chardev_source_spiceport_get_channel(port:PGVirConfigDomainChardevSourceSpicePort):Pgchar;cdecl;external libvirtgconfig;

// === Konventiert am: 17-10-26 20:00:03 ===

function GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_SPICE_PORT : TGType;
function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_SPICE_PORT(obj : Pointer) : PGVirConfigDomainChardevSourceSpicePort;
function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_SPICE_PORT_CLASS(klass : Pointer) : PGVirConfigDomainChardevSourceSpicePortClass;
function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_SPICE_PORT(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_SPICE_PORT_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_SPICE_PORT_GET_CLASS(obj : Pointer) : PGVirConfigDomainChardevSourceSpicePortClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_SPICE_PORT : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_SPICE_PORT:=gvir_config_domain_chardev_source_spiceport_get_type;
  end;

function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_SPICE_PORT(obj : Pointer) : PGVirConfigDomainChardevSourceSpicePort;
begin
  Result := PGVirConfigDomainChardevSourceSpicePort(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_SPICE_PORT));
end;

function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_SPICE_PORT_CLASS(klass : Pointer) : PGVirConfigDomainChardevSourceSpicePortClass;
begin
  Result := PGVirConfigDomainChardevSourceSpicePortClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_SPICE_PORT));
end;

function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_SPICE_PORT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_SPICE_PORT);
end;

function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_SPICE_PORT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_SPICE_PORT);
end;

function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_SPICE_PORT_GET_CLASS(obj : Pointer) : PGVirConfigDomainChardevSourceSpicePortClass;
begin
  Result := PGVirConfigDomainChardevSourceSpicePortClass(PGTypeInstance(obj)^.g_class);
end;



end.
