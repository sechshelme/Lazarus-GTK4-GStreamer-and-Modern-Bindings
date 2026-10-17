unit libvirt_gconfig_domain_disk_driver;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-disk-driver.h: libvirt disk driver configuration
 *
 * Copyright (C) 2011, 2013 Red Hat, Inc.
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
 * Author: Christophe Fergeau <cfergeau@redhat.com>
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)

type
{ Do not add fields to this struct  }
  PGVirConfigDomainDiskDriver = ^TGVirConfigDomainDiskDriver;
  TGVirConfigDomainDiskDriver = record
      parent : TGVirConfigObject;
      priv : PGVirConfigDomainDiskDriverPrivate;
    end;

  PGVirConfigDomainDiskDriverClass = ^TGVirConfigDomainDiskDriverClass;
  TGVirConfigDomainDiskDriverClass = record
      parent_class : TGVirConfigObjectClass;
      padding : array[0..19] of Tgpointer;
    end;


  PGVirConfigDomainDiskCacheType = ^TGVirConfigDomainDiskCacheType;
  TGVirConfigDomainDiskCacheType =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_DISK_CACHE_DEFAULT = 0;
    GVIR_CONFIG_DOMAIN_DISK_CACHE_NONE = 1;
    GVIR_CONFIG_DOMAIN_DISK_CACHE_WRITETHROUGH = 2;
    GVIR_CONFIG_DOMAIN_DISK_CACHE_WRITEBACK = 3;
    GVIR_CONFIG_DOMAIN_DISK_CACHE_DIRECTSYNC = 4;
    GVIR_CONFIG_DOMAIN_DISK_CACHE_UNSAFE = 5;
;
type
  PGVirConfigDomainDiskFormat = ^TGVirConfigDomainDiskFormat;
  TGVirConfigDomainDiskFormat =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_DISK_FORMAT_RAW = 0;
    GVIR_CONFIG_DOMAIN_DISK_FORMAT_DIR = 1;
    GVIR_CONFIG_DOMAIN_DISK_FORMAT_BOCHS = 2;
    GVIR_CONFIG_DOMAIN_DISK_FORMAT_CLOOP = 3;
    GVIR_CONFIG_DOMAIN_DISK_FORMAT_COW = 4;
    GVIR_CONFIG_DOMAIN_DISK_FORMAT_DMG = 5;
    GVIR_CONFIG_DOMAIN_DISK_FORMAT_ISO = 6;
    GVIR_CONFIG_DOMAIN_DISK_FORMAT_QCOW = 7;
    GVIR_CONFIG_DOMAIN_DISK_FORMAT_QCOW2 = 8;
    GVIR_CONFIG_DOMAIN_DISK_FORMAT_QED = 9;
    GVIR_CONFIG_DOMAIN_DISK_FORMAT_VMDK = 10;
    GVIR_CONFIG_DOMAIN_DISK_FORMAT_VPC = 11;
    GVIR_CONFIG_DOMAIN_DISK_FORMAT_FAT = 12;
    GVIR_CONFIG_DOMAIN_DISK_FORMAT_VHD = 13;
;
type
  PGVirConfigDomainDiskDriverErrorPolicy = ^TGVirConfigDomainDiskDriverErrorPolicy;
  TGVirConfigDomainDiskDriverErrorPolicy =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_DISK_DRIVER_ERROR_POLICY_STOP = 0;
    GVIR_CONFIG_DOMAIN_DISK_DRIVER_ERROR_POLICY_REPORT = 1;
    GVIR_CONFIG_DOMAIN_DISK_DRIVER_ERROR_POLICY_IGNORE = 2;
    GVIR_CONFIG_DOMAIN_DISK_DRIVER_ERROR_POLICY_ENOSPACE = 3;
;
type
  PGVirConfigDomainDiskDriverIoPolicy = ^TGVirConfigDomainDiskDriverIoPolicy;
  TGVirConfigDomainDiskDriverIoPolicy =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_DISK_DRIVER_IO_POLICY_THREADS = 0;
    GVIR_CONFIG_DOMAIN_DISK_DRIVER_IO_POLICY_NATIVE = 1;
;
type
  PGVirConfigDomainDiskDriverDiscard = ^TGVirConfigDomainDiskDriverDiscard;
  TGVirConfigDomainDiskDriverDiscard =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_DISK_DRIVER_DISCARD_UNMAP = 0;
    GVIR_CONFIG_DOMAIN_DISK_DRIVER_DISCARD_IGNORE = 1;
;

function gvir_config_domain_disk_driver_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_domain_disk_driver_new:PGVirConfigDomainDiskDriver;cdecl;external libvirtgconfig;
function gvir_config_domain_disk_driver_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainDiskDriver;cdecl;external libvirtgconfig;
procedure gvir_config_domain_disk_driver_set_cache(driver:PGVirConfigDomainDiskDriver; cache_type:TGVirConfigDomainDiskCacheType);cdecl;external libvirtgconfig;
function gvir_config_domain_disk_driver_get_cache(driver:PGVirConfigDomainDiskDriver):TGVirConfigDomainDiskCacheType;cdecl;external libvirtgconfig;
procedure gvir_config_domain_disk_driver_set_name(driver:PGVirConfigDomainDiskDriver; name:Pchar);cdecl;external libvirtgconfig;
function gvir_config_domain_disk_driver_get_name(driver:PGVirConfigDomainDiskDriver):Pchar;cdecl;external libvirtgconfig;
procedure gvir_config_domain_disk_driver_set_error_policy(driver:PGVirConfigDomainDiskDriver; policy:TGVirConfigDomainDiskDriverErrorPolicy);cdecl;external libvirtgconfig;
function gvir_config_domain_disk_driver_get_error_policy(driver:PGVirConfigDomainDiskDriver):TGVirConfigDomainDiskDriverErrorPolicy;cdecl;external libvirtgconfig;
procedure gvir_config_domain_disk_driver_set_format(driver:PGVirConfigDomainDiskDriver; format:TGVirConfigDomainDiskFormat);cdecl;external libvirtgconfig;
function gvir_config_domain_disk_driver_get_format(driver:PGVirConfigDomainDiskDriver):TGVirConfigDomainDiskFormat;cdecl;external libvirtgconfig;
procedure gvir_config_domain_disk_driver_set_io_policy(driver:PGVirConfigDomainDiskDriver; policy:TGVirConfigDomainDiskDriverIoPolicy);cdecl;external libvirtgconfig;
function gvir_config_domain_disk_driver_get_io_policy(driver:PGVirConfigDomainDiskDriver):TGVirConfigDomainDiskDriverIoPolicy;cdecl;external libvirtgconfig;
procedure gvir_config_domain_disk_driver_set_copy_on_read(driver:PGVirConfigDomainDiskDriver; copy_on_read:Tgboolean);cdecl;external libvirtgconfig;
function gvir_config_domain_disk_driver_get_copy_on_read(driver:PGVirConfigDomainDiskDriver):Tgboolean;cdecl;external libvirtgconfig;
procedure gvir_config_domain_disk_driver_set_discard(driver:PGVirConfigDomainDiskDriver; discard:TGVirConfigDomainDiskDriverDiscard);cdecl;external libvirtgconfig;
function gvir_config_domain_disk_driver_get_discard(driver:PGVirConfigDomainDiskDriver):TGVirConfigDomainDiskDriverDiscard;cdecl;external libvirtgconfig;

// === Konventiert am: 17-10-26 20:09:04 ===

function GVIR_CONFIG_TYPE_DOMAIN_DISK_DRIVER : TGType;
function GVIR_CONFIG_DOMAIN_DISK_DRIVER(obj : Pointer) : PGVirConfigDomainDiskDriver;
function GVIR_CONFIG_DOMAIN_DISK_DRIVER_CLASS(klass : Pointer) : PGVirConfigDomainDiskDriverClass;
function GVIR_CONFIG_IS_DOMAIN_DISK_DRIVER(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_DISK_DRIVER_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_DISK_DRIVER_GET_CLASS(obj : Pointer) : PGVirConfigDomainDiskDriverClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_DISK_DRIVER : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_DISK_DRIVER:=gvir_config_domain_disk_driver_get_type;
  end;

function GVIR_CONFIG_DOMAIN_DISK_DRIVER(obj : Pointer) : PGVirConfigDomainDiskDriver;
begin
  Result := PGVirConfigDomainDiskDriver(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_DISK_DRIVER));
end;

function GVIR_CONFIG_DOMAIN_DISK_DRIVER_CLASS(klass : Pointer) : PGVirConfigDomainDiskDriverClass;
begin
  Result := PGVirConfigDomainDiskDriverClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_DISK_DRIVER));
end;

function GVIR_CONFIG_IS_DOMAIN_DISK_DRIVER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_DISK_DRIVER);
end;

function GVIR_CONFIG_IS_DOMAIN_DISK_DRIVER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_DISK_DRIVER);
end;

function GVIR_CONFIG_DOMAIN_DISK_DRIVER_GET_CLASS(obj : Pointer) : PGVirConfigDomainDiskDriverClass;
begin
  Result := PGVirConfigDomainDiskDriverClass(PGTypeInstance(obj)^.g_class);
end;



end.
