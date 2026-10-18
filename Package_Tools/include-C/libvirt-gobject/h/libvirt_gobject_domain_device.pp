
unit libvirt_gobject_domain_device;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gobject_domain_device.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gobject_domain_device.h
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
PGVirConfigDomainDevice  = ^GVirConfigDomainDevice;
PGVirDomain  = ^GVirDomain;
PGVirDomainDevice  = ^GVirDomainDevice;
PGVirDomainDeviceClass  = ^GVirDomainDeviceClass;
PGVirDomainDevicePrivate  = ^GVirDomainDevicePrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gobject-domain-device.h: libvirt gobject integration
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
{$include <libvirt-gobject/libvirt-gobject-domain.h>}

{ was #define dname def_expr }
function GVIR_TYPE_DOMAIN_DEVICE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_DOMAIN_DEVICE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_DOMAIN_DEVICE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_DOMAIN_DEVICE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_DOMAIN_DEVICE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_DOMAIN_DEVICE_GET_CLASS(obj : longint) : longint;

type
{ Do not add fields to this struct  }
  PGVirDomainDevice = ^TGVirDomainDevice;
  TGVirDomainDevice = record
      parent : TGObject;
      priv : PGVirDomainDevicePrivate;
    end;

  PGVirDomainDeviceClass = ^TGVirDomainDeviceClass;
  TGVirDomainDeviceClass = record
      parent_class : TGObjectClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_domain_device_get_type:TGType;cdecl;external;
function gvir_domain_device_get_domain(device:PGVirDomainDevice):PGVirDomain;cdecl;external;
function gvir_domain_device_get_config(device:PGVirDomainDevice):PGVirConfigDomainDevice;cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_TYPE_DOMAIN_DEVICE : longint; { return type might be wrong }
  begin
    GVIR_TYPE_DOMAIN_DEVICE:=gvir_domain_device_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_DOMAIN_DEVICE(obj : longint) : longint;
begin
  GVIR_DOMAIN_DEVICE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_TYPE_DOMAIN_DEVICE,GVirDomainDevice);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_DOMAIN_DEVICE_CLASS(klass : longint) : longint;
begin
  GVIR_DOMAIN_DEVICE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_TYPE_DOMAIN_DEVICE,GVirDomainDeviceClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_DOMAIN_DEVICE(obj : longint) : longint;
begin
  GVIR_IS_DOMAIN_DEVICE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_TYPE_DOMAIN_DEVICE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_DOMAIN_DEVICE_CLASS(klass : longint) : longint;
begin
  GVIR_IS_DOMAIN_DEVICE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_TYPE_DOMAIN_DEVICE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_DOMAIN_DEVICE_GET_CLASS(obj : longint) : longint;
begin
  GVIR_DOMAIN_DEVICE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_TYPE_DOMAIN_DEVICE,GVirDomainDeviceClass);
end;


end.
