
unit libvirt_gconfig_domain_snapshot_disk;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_domain_snapshot_disk.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_domain_snapshot_disk.h
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
PGVirConfigDomainSnapshotDisk  = ^GVirConfigDomainSnapshotDisk;
PGVirConfigDomainSnapshotDiskClass  = ^GVirConfigDomainSnapshotDiskClass;
PGVirConfigDomainSnapshotDiskPrivate  = ^GVirConfigDomainSnapshotDiskPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-snapshot-disk.h: libvirt snapshot disk configuration
 *
 * Copyright (C) 2010-2013 Red Hat, Inc.
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
function GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT_DISK : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_SNAPSHOT_DISK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_SNAPSHOT_DISK_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_SNAPSHOT_DISK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_SNAPSHOT_DISK_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_SNAPSHOT_DISK_GET_CLASS(obj : longint) : longint;

type
{ Do not add fields to this struct  }
  PGVirConfigDomainSnapshotDisk = ^TGVirConfigDomainSnapshotDisk;
  TGVirConfigDomainSnapshotDisk = record
      parent : TGVirConfigObject;
      priv : PGVirConfigDomainSnapshotDiskPrivate;
    end;

  PGVirConfigDomainSnapshotDiskClass = ^TGVirConfigDomainSnapshotDiskClass;
  TGVirConfigDomainSnapshotDiskClass = record
      parent_class : TGVirConfigObjectClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_domain_snapshot_disk_get_type:TGType;cdecl;external;
function gvir_config_domain_snapshot_disk_new:PGVirConfigDomainSnapshotDisk;cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_snapshot_disk_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainSnapshotDisk;cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_snapshot_disk_get_name(disk:PGVirConfigDomainSnapshotDisk):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gvir_config_domain_snapshot_disk_set_name(disk:PGVirConfigDomainSnapshotDisk; name:Pchar);cdecl;external;
function gvir_config_domain_snapshot_disk_get_snapshot_type(disk:PGVirConfigDomainSnapshotDisk):TGVirConfigDomainDiskSnapshotType;cdecl;external;
procedure gvir_config_domain_snapshot_disk_set_snapshot_type(disk:PGVirConfigDomainSnapshotDisk; _type:TGVirConfigDomainDiskSnapshotType);cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_snapshot_disk_get_source_file(disk:PGVirConfigDomainSnapshotDisk):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gvir_config_domain_snapshot_disk_set_source_file(disk:PGVirConfigDomainSnapshotDisk; filename:Pchar);cdecl;external;
function gvir_config_domain_snapshot_disk_get_driver_format(disk:PGVirConfigDomainSnapshotDisk):TGVirConfigDomainDiskFormat;cdecl;external;
procedure gvir_config_domain_snapshot_disk_set_driver_format(disk:PGVirConfigDomainSnapshotDisk; format:TGVirConfigDomainDiskFormat);cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT_DISK : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT_DISK:=gvir_config_domain_snapshot_disk_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_SNAPSHOT_DISK(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_SNAPSHOT_DISK:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT_DISK,GVirConfigDomainSnapshotDisk);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_SNAPSHOT_DISK_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_SNAPSHOT_DISK_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT_DISK,GVirConfigDomainSnapshotDiskClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_SNAPSHOT_DISK(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_SNAPSHOT_DISK:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT_DISK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_SNAPSHOT_DISK_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_SNAPSHOT_DISK_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT_DISK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_SNAPSHOT_DISK_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_SNAPSHOT_DISK_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT_DISK,GVirConfigDomainSnapshotDiskClass);
end;


end.
