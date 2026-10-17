unit libvirt_gconfig_domain_filesys;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-filesys.h: libvirt domain filesystem configuration
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
  PGVirConfigDomainFilesys = ^TGVirConfigDomainFilesys;
  TGVirConfigDomainFilesys = record
      parent : TGVirConfigDomainDevice;
      priv : PGVirConfigDomainFilesysPrivate;
    end;

  PGVirConfigDomainFilesysClass = ^TGVirConfigDomainFilesysClass;
  TGVirConfigDomainFilesysClass = record
      parent_class : TGVirConfigDomainDeviceClass;
      padding : array[0..19] of Tgpointer;
    end;


  PGVirConfigDomainFilesysType = ^TGVirConfigDomainFilesysType;
  TGVirConfigDomainFilesysType =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_FILESYS_MOUNT = 0;
    GVIR_CONFIG_DOMAIN_FILESYS_BLOCK = 1;
    GVIR_CONFIG_DOMAIN_FILESYS_FILE = 2;
    GVIR_CONFIG_DOMAIN_FILESYS_TEMPLATE = 3;
    GVIR_CONFIG_DOMAIN_FILESYS_RAM = 4;
    GVIR_CONFIG_DOMAIN_FILESYS_BIND = 5;
;
type
  PGVirConfigDomainFilesysAccessType = ^TGVirConfigDomainFilesysAccessType;
  TGVirConfigDomainFilesysAccessType =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_FILESYS_ACCESS_PASSTHROUGH = 0;
    GVIR_CONFIG_DOMAIN_FILESYS_ACCESS_MAPPED = 1;
    GVIR_CONFIG_DOMAIN_FILESYS_ACCESS_SQUASH = 2;
;
type
  PGVirConfigDomainFilesysDriverType = ^TGVirConfigDomainFilesysDriverType;
  TGVirConfigDomainFilesysDriverType =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_FILESYS_DRIVER_DEFAULT = 0;
    GVIR_CONFIG_DOMAIN_FILESYS_DRIVER_PATH = 1;
    GVIR_CONFIG_DOMAIN_FILESYS_DRIVER_HANDLE = 2;
    GVIR_CONFIG_DOMAIN_FILESYS_DRIVER_LOOP = 3;
    GVIR_CONFIG_DOMAIN_FILESYS_DRIVER_NBD = 4;
    GVIR_CONFIG_DOMAIN_FILESYS_DRIVER_PLOOP = 5;
;

function gvir_config_domain_filesys_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_domain_filesys_new:PGVirConfigDomainFilesys;cdecl;external libvirtgconfig;
function gvir_config_domain_filesys_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainFilesys;cdecl;external libvirtgconfig;
procedure gvir_config_domain_filesys_set_type(filesys:PGVirConfigDomainFilesys; _type:TGVirConfigDomainFilesysType);cdecl;external libvirtgconfig;
procedure gvir_config_domain_filesys_set_access_type(filesys:PGVirConfigDomainFilesys; _type:TGVirConfigDomainFilesysAccessType);cdecl;external libvirtgconfig;
procedure gvir_config_domain_filesys_set_driver_type(filesys:PGVirConfigDomainFilesys; _type:TGVirConfigDomainFilesysDriverType);cdecl;external libvirtgconfig;
procedure gvir_config_domain_filesys_set_driver_format(filesys:PGVirConfigDomainFilesys; format:TGVirConfigDomainDiskFormat);cdecl;external libvirtgconfig;
procedure gvir_config_domain_filesys_set_source(filesys:PGVirConfigDomainFilesys; source:Pchar);cdecl;external libvirtgconfig;
procedure gvir_config_domain_filesys_set_ram_usage(filesys:PGVirConfigDomainFilesys; bytes:Tguint64);cdecl;external libvirtgconfig;
procedure gvir_config_domain_filesys_set_target(filesys:PGVirConfigDomainFilesys; target:Pchar);cdecl;external libvirtgconfig;
procedure gvir_config_domain_filesys_set_readonly(filesys:PGVirConfigDomainFilesys; readonly:Tgboolean);cdecl;external libvirtgconfig;

// === Konventiert am: 17-10-26 20:09:00 ===

function GVIR_CONFIG_TYPE_DOMAIN_FILESYS : TGType;
function GVIR_CONFIG_DOMAIN_FILESYS(obj : Pointer) : PGVirConfigDomainFilesys;
function GVIR_CONFIG_DOMAIN_FILESYS_CLASS(klass : Pointer) : PGVirConfigDomainFilesysClass;
function GVIR_CONFIG_IS_DOMAIN_FILESYS(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_FILESYS_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_FILESYS_GET_CLASS(obj : Pointer) : PGVirConfigDomainFilesysClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_FILESYS : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_FILESYS:=gvir_config_domain_filesys_get_type;
  end;

function GVIR_CONFIG_DOMAIN_FILESYS(obj : Pointer) : PGVirConfigDomainFilesys;
begin
  Result := PGVirConfigDomainFilesys(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_FILESYS));
end;

function GVIR_CONFIG_DOMAIN_FILESYS_CLASS(klass : Pointer) : PGVirConfigDomainFilesysClass;
begin
  Result := PGVirConfigDomainFilesysClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_FILESYS));
end;

function GVIR_CONFIG_IS_DOMAIN_FILESYS(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_FILESYS);
end;

function GVIR_CONFIG_IS_DOMAIN_FILESYS_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_FILESYS);
end;

function GVIR_CONFIG_DOMAIN_FILESYS_GET_CLASS(obj : Pointer) : PGVirConfigDomainFilesysClass;
begin
  Result := PGVirConfigDomainFilesysClass(PGTypeInstance(obj)^.g_class);
end;



end.
