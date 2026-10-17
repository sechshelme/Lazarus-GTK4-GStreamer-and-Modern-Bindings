unit libvirt_gconfig_domain_chardev_source_unix;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-chardev-source-unix.h: libvirt domain chardev unix configuration
 *
 * Copyright (C) 2012 Red Hat, Inc.
 * Copyright (C) 2015 T A Mahadevan.
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
 * Author: T A Mahadevan <ta.mahadevan@gmail.com>
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)

type
{ Do not add fields to this struct  }
  PGVirConfigDomainChardevSourceUnix = ^TGVirConfigDomainChardevSourceUnix;
  TGVirConfigDomainChardevSourceUnix = record
      parent : TGVirConfigDomainChardevSource;
      priv : PGVirConfigDomainChardevSourceUnixPrivate;
    end;

  PGVirConfigDomainChardevSourceUnixClass = ^TGVirConfigDomainChardevSourceUnixClass;
  TGVirConfigDomainChardevSourceUnixClass = record
      parent_class : TGVirConfigDomainChardevSourceClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_domain_chardev_source_unix_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_domain_chardev_source_unix_new:PGVirConfigDomainChardevSourceUnix;cdecl;external libvirtgconfig;
function gvir_config_domain_chardev_source_unix_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainChardevSourceUnix;cdecl;external libvirtgconfig;

// === Konventiert am: 17-10-26 19:59:55 ===

function GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_UNIX : TGType;
function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_UNIX(obj : Pointer) : PGVirConfigDomainChardevSourceUnix;
function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_UNIX_CLASS(klass : Pointer) : PGVirConfigDomainChardevSourceUnixClass;
function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_UNIX(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_UNIX_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_UNIX_GET_CLASS(obj : Pointer) : PGVirConfigDomainChardevSourceUnixClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_UNIX : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_UNIX:=gvir_config_domain_chardev_source_unix_get_type;
  end;

function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_UNIX(obj : Pointer) : PGVirConfigDomainChardevSourceUnix;
begin
  Result := PGVirConfigDomainChardevSourceUnix(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_UNIX));
end;

function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_UNIX_CLASS(klass : Pointer) : PGVirConfigDomainChardevSourceUnixClass;
begin
  Result := PGVirConfigDomainChardevSourceUnixClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_UNIX));
end;

function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_UNIX(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_UNIX);
end;

function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_UNIX_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_UNIX);
end;

function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_UNIX_GET_CLASS(obj : Pointer) : PGVirConfigDomainChardevSourceUnixClass;
begin
  Result := PGVirConfigDomainChardevSourceUnixClass(PGTypeInstance(obj)^.g_class);
end;



end.
