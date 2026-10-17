
unit libvirt_gconfig_domain_disk;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_domain_disk.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_domain_disk
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
PGVirConfigDomainDisk  = ^GVirConfigDomainDisk;
PGVirConfigDomainDiskBus  = ^GVirConfigDomainDiskBus;
PGVirConfigDomainDiskClass  = ^GVirConfigDomainDiskClass;
PGVirConfigDomainDiskDriver  = ^GVirConfigDomainDiskDriver;
PGVirConfigDomainDiskGuestDeviceType  = ^GVirConfigDomainDiskGuestDeviceType;
PGVirConfigDomainDiskPrivate  = ^GVirConfigDomainDiskPrivate;
PGVirConfigDomainDiskSnapshotType  = ^GVirConfigDomainDiskSnapshotType;
PGVirConfigDomainDiskStartupPolicy  = ^GVirConfigDomainDiskStartupPolicy;
PGVirConfigDomainDiskType  = ^GVirConfigDomainDiskType;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-disk.h: libvirt domain disk configuration
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
 * Author: Christophe Fergeau <cfergeau@gmail.com>
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)
{$include <libvirt-gconfig/libvirt-gconfig-domain-disk-driver.h>}

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_DISK : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_DISK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_DISK_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_DISK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_DISK_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_DISK_GET_CLASS(obj : longint) : longint;

type
{ Do not add fields to this struct  }
  PGVirConfigDomainDisk = ^TGVirConfigDomainDisk;
  TGVirConfigDomainDisk = record
      parent : TGVirConfigDomainDevice;
      priv : PGVirConfigDomainDiskPrivate;
    end;

  PGVirConfigDomainDiskClass = ^TGVirConfigDomainDiskClass;
  TGVirConfigDomainDiskClass = record
      parent_class : TGVirConfigDomainDeviceClass;
      padding : array[0..19] of Tgpointer;
    end;


  PGVirConfigDomainDiskType = ^TGVirConfigDomainDiskType;
  TGVirConfigDomainDiskType =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_DISK_FILE = 0;
    GVIR_CONFIG_DOMAIN_DISK_BLOCK = 1;
    GVIR_CONFIG_DOMAIN_DISK_DIR = 2;
    GVIR_CONFIG_DOMAIN_DISK_NETWORK = 3;
;
type
  PGVirConfigDomainDiskBus = ^TGVirConfigDomainDiskBus;
  TGVirConfigDomainDiskBus =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_DISK_BUS_IDE = 0;
    GVIR_CONFIG_DOMAIN_DISK_BUS_FDC = 1;
    GVIR_CONFIG_DOMAIN_DISK_BUS_SCSI = 2;
    GVIR_CONFIG_DOMAIN_DISK_BUS_VIRTIO = 3;
    GVIR_CONFIG_DOMAIN_DISK_BUS_XEN = 4;
    GVIR_CONFIG_DOMAIN_DISK_BUS_USB = 5;
    GVIR_CONFIG_DOMAIN_DISK_BUS_UML = 6;
    GVIR_CONFIG_DOMAIN_DISK_BUS_SATA = 7;
;
type
  PGVirConfigDomainDiskGuestDeviceType = ^TGVirConfigDomainDiskGuestDeviceType;
  TGVirConfigDomainDiskGuestDeviceType =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_DISK_GUEST_DEVICE_DISK = 0;
    GVIR_CONFIG_DOMAIN_DISK_GUEST_DEVICE_FLOPPY = 1;
    GVIR_CONFIG_DOMAIN_DISK_GUEST_DEVICE_CDROM = 2;
;
type
  PGVirConfigDomainDiskSnapshotType = ^TGVirConfigDomainDiskSnapshotType;
  TGVirConfigDomainDiskSnapshotType =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_DISK_SNAPSHOT_NO = 0;
    GVIR_CONFIG_DOMAIN_DISK_SNAPSHOT_INTERNAL = 1;
    GVIR_CONFIG_DOMAIN_DISK_SNAPSHOT_EXTERNAL = 2;
;
type
  PGVirConfigDomainDiskStartupPolicy = ^TGVirConfigDomainDiskStartupPolicy;
  TGVirConfigDomainDiskStartupPolicy =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_DISK_STARTUP_POLICY_MANDATORY = 0;
    GVIR_CONFIG_DOMAIN_DISK_STARTUP_POLICY_REQUISITE = 1;
    GVIR_CONFIG_DOMAIN_DISK_STARTUP_POLICY_OPTIONAL = 2;
;
{ backward compatibility  }
  GVIR_CONFIG_DOMAIN_DISK_FORMAT_AIO = GVIR_CONFIG_DOMAIN_DISK_FORMAT_RAW;  

function gvir_config_domain_disk_get_type:TGType;cdecl;external;
function gvir_config_domain_disk_new:PGVirConfigDomainDisk;cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_disk_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainDisk;cdecl;external;
procedure gvir_config_domain_disk_set_type(disk:PGVirConfigDomainDisk; _type:TGVirConfigDomainDiskType);cdecl;external;
procedure gvir_config_domain_disk_set_guest_device_type(disk:PGVirConfigDomainDisk; _type:TGVirConfigDomainDiskGuestDeviceType);cdecl;external;
procedure gvir_config_domain_disk_set_snapshot_type(disk:PGVirConfigDomainDisk; _type:TGVirConfigDomainDiskSnapshotType);cdecl;external;
procedure gvir_config_domain_disk_set_startup_policy(disk:PGVirConfigDomainDisk; policy:TGVirConfigDomainDiskStartupPolicy);cdecl;external;
(* Const before type ignored *)
procedure gvir_config_domain_disk_set_source(disk:PGVirConfigDomainDisk; source:Pchar);cdecl;external;
{xxxxxG_DEPRECATED_FOR(gvir_config_domain_disk_driver_set_cache) }
procedure gvir_config_domain_disk_set_driver_cache(disk:PGVirConfigDomainDisk; cache_type:TGVirConfigDomainDiskCacheType);cdecl;external;
{xxxxxG_DEPRECATED_FOR(gvir_config_domain_disk_driver_set_name) }
(* Const before type ignored *)
procedure gvir_config_domain_disk_set_driver_name(disk:PGVirConfigDomainDisk; driver_name:Pchar);cdecl;external;
{xxxxxG_DEPRECATED_FOR(gvir_config_domain_disk_driver_set_format) }
(* Const before type ignored *)
procedure gvir_config_domain_disk_set_driver_type(disk:PGVirConfigDomainDisk; driver_type:Pchar);cdecl;external;
{xxxxxG_DEPRECATED_FOR(gvir_config_domain_disk_driver_set_format) }
procedure gvir_config_domain_disk_set_driver_format(disk:PGVirConfigDomainDisk; format:TGVirConfigDomainDiskFormat);cdecl;external;
procedure gvir_config_domain_disk_set_target_bus(disk:PGVirConfigDomainDisk; bus:TGVirConfigDomainDiskBus);cdecl;external;
(* Const before type ignored *)
procedure gvir_config_domain_disk_set_target_dev(disk:PGVirConfigDomainDisk; dev:Pchar);cdecl;external;
procedure gvir_config_domain_disk_set_driver(disk:PGVirConfigDomainDisk; driver:PGVirConfigDomainDiskDriver);cdecl;external;
function gvir_config_domain_disk_get_driver(disk:PGVirConfigDomainDisk):PGVirConfigDomainDiskDriver;cdecl;external;
function gvir_config_domain_disk_get_disk_type(disk:PGVirConfigDomainDisk):TGVirConfigDomainDiskType;cdecl;external;
function gvir_config_domain_disk_get_guest_device_type(disk:PGVirConfigDomainDisk):TGVirConfigDomainDiskGuestDeviceType;cdecl;external;
function gvir_config_domain_disk_get_snapshot_type(disk:PGVirConfigDomainDisk):TGVirConfigDomainDiskSnapshotType;cdecl;external;
function gvir_config_domain_disk_get_startup_policy(disk:PGVirConfigDomainDisk):TGVirConfigDomainDiskStartupPolicy;cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_disk_get_source(disk:PGVirConfigDomainDisk):Pchar;cdecl;external;
{xxxxxG_DEPRECATED_FOR(gvir_config_domain_disk_driver_get_cache) }
function gvir_config_domain_disk_get_driver_cache(disk:PGVirConfigDomainDisk):TGVirConfigDomainDiskCacheType;cdecl;external;
{xxxxxG_DEPRECATED_FOR(gvir_config_domain_disk_driver_get_name) }
(* Const before type ignored *)
function gvir_config_domain_disk_get_driver_name(disk:PGVirConfigDomainDisk):Pchar;cdecl;external;
{xxxxxG_DEPRECATED_FOR(gvir_config_domain_disk_driver_get_format) }
(* Const before type ignored *)
function gvir_config_domain_disk_get_driver_type(disk:PGVirConfigDomainDisk):Pchar;cdecl;external;
{xxxxxG_DEPRECATED_FOR(gvir_config_domain_disk_driver_get_format) }
function gvir_config_domain_disk_get_driver_format(disk:PGVirConfigDomainDisk):TGVirConfigDomainDiskFormat;cdecl;external;
function gvir_config_domain_disk_get_target_bus(disk:PGVirConfigDomainDisk):TGVirConfigDomainDiskBus;cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_disk_get_target_dev(disk:PGVirConfigDomainDisk):Pchar;cdecl;external;
procedure gvir_config_domain_disk_set_readonly(disk:PGVirConfigDomainDisk; readonly:Tgboolean);cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_DISK : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_DOMAIN_DISK:=gvir_config_domain_disk_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_DISK(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_DISK:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_DOMAIN_DISK,GVirConfigDomainDisk);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_DISK_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_DISK_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_DOMAIN_DISK,GVirConfigDomainDiskClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_DISK(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_DISK:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_DOMAIN_DISK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_DISK_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_DISK_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_DOMAIN_DISK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_DISK_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_DISK_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_DOMAIN_DISK,GVirConfigDomainDiskClass);
end;


end.
