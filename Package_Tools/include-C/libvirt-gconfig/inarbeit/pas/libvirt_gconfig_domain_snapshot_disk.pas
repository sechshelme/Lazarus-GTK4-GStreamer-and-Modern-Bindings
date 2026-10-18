unit libvirt_gconfig_domain_snapshot_disk;

interface

uses
  fp_glib2, fp_virtgconfig;

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


function gvir_config_domain_snapshot_disk_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_domain_snapshot_disk_new:PGVirConfigDomainSnapshotDisk;cdecl;external libvirtgconfig;
function gvir_config_domain_snapshot_disk_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainSnapshotDisk;cdecl;external libvirtgconfig;
function gvir_config_domain_snapshot_disk_get_name(disk:PGVirConfigDomainSnapshotDisk):Pchar;cdecl;external libvirtgconfig;
procedure gvir_config_domain_snapshot_disk_set_name(disk:PGVirConfigDomainSnapshotDisk; name:Pchar);cdecl;external libvirtgconfig;
function gvir_config_domain_snapshot_disk_get_snapshot_type(disk:PGVirConfigDomainSnapshotDisk):TGVirConfigDomainDiskSnapshotType;cdecl;external libvirtgconfig;
procedure gvir_config_domain_snapshot_disk_set_snapshot_type(disk:PGVirConfigDomainSnapshotDisk; _type:TGVirConfigDomainDiskSnapshotType);cdecl;external libvirtgconfig;
function gvir_config_domain_snapshot_disk_get_source_file(disk:PGVirConfigDomainSnapshotDisk):Pchar;cdecl;external libvirtgconfig;
procedure gvir_config_domain_snapshot_disk_set_source_file(disk:PGVirConfigDomainSnapshotDisk; filename:Pchar);cdecl;external libvirtgconfig;
function gvir_config_domain_snapshot_disk_get_driver_format(disk:PGVirConfigDomainSnapshotDisk):TGVirConfigDomainDiskFormat;cdecl;external libvirtgconfig;
procedure gvir_config_domain_snapshot_disk_set_driver_format(disk:PGVirConfigDomainSnapshotDisk; format:TGVirConfigDomainDiskFormat);cdecl;external libvirtgconfig;

// === Konventiert am: 18-10-26 12:49:46 ===

function GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT_DISK : TGType;
function GVIR_CONFIG_DOMAIN_SNAPSHOT_DISK(obj : Pointer) : PGVirConfigDomainSnapshotDisk;
function GVIR_CONFIG_DOMAIN_SNAPSHOT_DISK_CLASS(klass : Pointer) : PGVirConfigDomainSnapshotDiskClass;
function GVIR_CONFIG_IS_DOMAIN_SNAPSHOT_DISK(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_SNAPSHOT_DISK_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_SNAPSHOT_DISK_GET_CLASS(obj : Pointer) : PGVirConfigDomainSnapshotDiskClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT_DISK : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT_DISK:=gvir_config_domain_snapshot_disk_get_type;
  end;

function GVIR_CONFIG_DOMAIN_SNAPSHOT_DISK(obj : Pointer) : PGVirConfigDomainSnapshotDisk;
begin
  Result := PGVirConfigDomainSnapshotDisk(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT_DISK));
end;

function GVIR_CONFIG_DOMAIN_SNAPSHOT_DISK_CLASS(klass : Pointer) : PGVirConfigDomainSnapshotDiskClass;
begin
  Result := PGVirConfigDomainSnapshotDiskClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT_DISK));
end;

function GVIR_CONFIG_IS_DOMAIN_SNAPSHOT_DISK(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT_DISK);
end;

function GVIR_CONFIG_IS_DOMAIN_SNAPSHOT_DISK_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT_DISK);
end;

function GVIR_CONFIG_DOMAIN_SNAPSHOT_DISK_GET_CLASS(obj : Pointer) : PGVirConfigDomainSnapshotDiskClass;
begin
  Result := PGVirConfigDomainSnapshotDiskClass(PGTypeInstance(obj)^.g_class);
end;



end.
