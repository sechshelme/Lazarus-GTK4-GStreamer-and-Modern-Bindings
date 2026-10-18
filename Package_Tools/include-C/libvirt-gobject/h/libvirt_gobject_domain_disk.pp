
unit libvirt_gobject_domain_disk;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gobject_domain_disk.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gobject_domain_disk.h
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
PGError  = ^GError;
PGVirDomainDisk  = ^GVirDomainDisk;
PGVirDomainDiskClass  = ^GVirDomainDiskClass;
PGVirDomainDiskPrivate  = ^GVirDomainDiskPrivate;
PGVirDomainDiskStats  = ^GVirDomainDiskStats;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gobject-domain-disk.h: libvirt gobject integration
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
 * Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  }
{$if !defined(__LIBVIRT_GOBJECT_H__) && !defined(LIBVIRT_GOBJECT_BUILD)}
{$error "Only <libvirt-gobject/libvirt-gobject.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)

{ was #define dname def_expr }
function GVIR_TYPE_DOMAIN_DISK : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_DOMAIN_DISK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_DOMAIN_DISK_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_DOMAIN_DISK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_DOMAIN_DISK_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_DOMAIN_DISK_GET_CLASS(obj : longint) : longint;

{ was #define dname def_expr }
function GVIR_TYPE_DOMAIN_DISK_STATS : longint; { return type might be wrong }

type
{ number of read requests  }
{ number of read bytes  }
{ number of write requests  }
{ number of written bytes  }
{ In Xen this returns the mysterious 'oo_req'.  }
  PGVirDomainDiskStats = ^TGVirDomainDiskStats;
  TGVirDomainDiskStats = record
      rd_req : Tgint64;
      rd_bytes : Tgint64;
      wr_req : Tgint64;
      wr_bytes : Tgint64;
      errs : Tgint64;
    end;

{ Do not add fields to this struct  }
  PGVirDomainDisk = ^TGVirDomainDisk;
  TGVirDomainDisk = record
      parent : TGVirDomainDevice;
      priv : PGVirDomainDiskPrivate;
    end;

  PGVirDomainDiskClass = ^TGVirDomainDiskClass;
  TGVirDomainDiskClass = record
      parent_class : TGVirDomainDeviceClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_domain_disk_get_type:TGType;cdecl;external;
function gvir_domain_disk_stats_get_type:TGType;cdecl;external;
function gvir_domain_disk_get_stats(self:PGVirDomainDisk; err:PPGError):PGVirDomainDiskStats;cdecl;external;
function gvir_domain_disk_resize(self:PGVirDomainDisk; size:Tguint64; flags:Tguint; err:PPGError):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_TYPE_DOMAIN_DISK : longint; { return type might be wrong }
  begin
    GVIR_TYPE_DOMAIN_DISK:=gvir_domain_disk_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_DOMAIN_DISK(obj : longint) : longint;
begin
  GVIR_DOMAIN_DISK:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_TYPE_DOMAIN_DISK,GVirDomainDisk);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_DOMAIN_DISK_CLASS(klass : longint) : longint;
begin
  GVIR_DOMAIN_DISK_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_TYPE_DOMAIN_DISK,GVirDomainDiskClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_DOMAIN_DISK(obj : longint) : longint;
begin
  GVIR_IS_DOMAIN_DISK:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_TYPE_DOMAIN_DISK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_DOMAIN_DISK_CLASS(klass : longint) : longint;
begin
  GVIR_IS_DOMAIN_DISK_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_TYPE_DOMAIN_DISK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_DOMAIN_DISK_GET_CLASS(obj : longint) : longint;
begin
  GVIR_DOMAIN_DISK_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_TYPE_DOMAIN_DISK,GVirDomainDiskClass);
end;

{ was #define dname def_expr }
function GVIR_TYPE_DOMAIN_DISK_STATS : longint; { return type might be wrong }
  begin
    GVIR_TYPE_DOMAIN_DISK_STATS:=gvir_domain_disk_stats_get_type;
  end;


end.
