
unit libvirt_gconfig_domain_disk_driver;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_domain_disk_driver.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_domain_disk_driver.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
Pgchar  = ^gchar;
PGError  = ^GError;
PGVirConfigDomainDiskCacheType  = ^GVirConfigDomainDiskCacheType;
PGVirConfigDomainDiskDriver  = ^GVirConfigDomainDiskDriver;
PGVirConfigDomainDiskDriverClass  = ^GVirConfigDomainDiskDriverClass;
PGVirConfigDomainDiskDriverDiscard  = ^GVirConfigDomainDiskDriverDiscard;
PGVirConfigDomainDiskDriverErrorPolicy  = ^GVirConfigDomainDiskDriverErrorPolicy;
PGVirConfigDomainDiskDriverIoPolicy  = ^GVirConfigDomainDiskDriverIoPolicy;
PGVirConfigDomainDiskDriverPrivate  = ^GVirConfigDomainDiskDriverPrivate;
PGVirConfigDomainDiskFormat  = ^GVirConfigDomainDiskFormat;
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

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_DISK_DRIVER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_DISK_DRIVER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_DISK_DRIVER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_DISK_DRIVER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_DISK_DRIVER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_DISK_DRIVER_GET_CLASS(obj : longint) : longint;

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

function gvir_config_domain_disk_driver_get_type:TGType;cdecl;external;
function gvir_config_domain_disk_driver_new:PGVirConfigDomainDiskDriver;cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_disk_driver_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainDiskDriver;cdecl;external;
procedure gvir_config_domain_disk_driver_set_cache(driver:PGVirConfigDomainDiskDriver; cache_type:TGVirConfigDomainDiskCacheType);cdecl;external;
function gvir_config_domain_disk_driver_get_cache(driver:PGVirConfigDomainDiskDriver):TGVirConfigDomainDiskCacheType;cdecl;external;
(* Const before type ignored *)
procedure gvir_config_domain_disk_driver_set_name(driver:PGVirConfigDomainDiskDriver; name:Pchar);cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_disk_driver_get_name(driver:PGVirConfigDomainDiskDriver):Pchar;cdecl;external;
procedure gvir_config_domain_disk_driver_set_error_policy(driver:PGVirConfigDomainDiskDriver; policy:TGVirConfigDomainDiskDriverErrorPolicy);cdecl;external;
function gvir_config_domain_disk_driver_get_error_policy(driver:PGVirConfigDomainDiskDriver):TGVirConfigDomainDiskDriverErrorPolicy;cdecl;external;
procedure gvir_config_domain_disk_driver_set_format(driver:PGVirConfigDomainDiskDriver; format:TGVirConfigDomainDiskFormat);cdecl;external;
function gvir_config_domain_disk_driver_get_format(driver:PGVirConfigDomainDiskDriver):TGVirConfigDomainDiskFormat;cdecl;external;
procedure gvir_config_domain_disk_driver_set_io_policy(driver:PGVirConfigDomainDiskDriver; policy:TGVirConfigDomainDiskDriverIoPolicy);cdecl;external;
function gvir_config_domain_disk_driver_get_io_policy(driver:PGVirConfigDomainDiskDriver):TGVirConfigDomainDiskDriverIoPolicy;cdecl;external;
procedure gvir_config_domain_disk_driver_set_copy_on_read(driver:PGVirConfigDomainDiskDriver; copy_on_read:Tgboolean);cdecl;external;
function gvir_config_domain_disk_driver_get_copy_on_read(driver:PGVirConfigDomainDiskDriver):Tgboolean;cdecl;external;
procedure gvir_config_domain_disk_driver_set_discard(driver:PGVirConfigDomainDiskDriver; discard:TGVirConfigDomainDiskDriverDiscard);cdecl;external;
function gvir_config_domain_disk_driver_get_discard(driver:PGVirConfigDomainDiskDriver):TGVirConfigDomainDiskDriverDiscard;cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_DISK_DRIVER : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_DOMAIN_DISK_DRIVER:=gvir_config_domain_disk_driver_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_DISK_DRIVER(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_DISK_DRIVER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_DOMAIN_DISK_DRIVER,GVirConfigDomainDiskDriver);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_DISK_DRIVER_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_DISK_DRIVER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_DOMAIN_DISK_DRIVER,GVirConfigDomainDiskDriverClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_DISK_DRIVER(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_DISK_DRIVER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_DOMAIN_DISK_DRIVER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_DISK_DRIVER_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_DISK_DRIVER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_DOMAIN_DISK_DRIVER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_DISK_DRIVER_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_DISK_DRIVER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_DOMAIN_DISK_DRIVER,GVirConfigDomainDiskDriverClass);
end;


end.
