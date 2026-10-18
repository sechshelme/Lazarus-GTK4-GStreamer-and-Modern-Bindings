unit libvirt_gobject_node_device;

interface

uses
  fp_glib2, fp_virt_glib;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gobject-node_device.c: libvirt gobject integration
 *
 * Copyright (C) 2010-2011 Red Hat, Inc.
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
{$if !defined(__LIBVIRT_GOBJECT_H__) && !defined(LIBVIRT_GOBJECT_BUILD)}
{$error "Only <libvirt-gobject/libvirt-gobject.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)

{ was #define dname def_expr }
function GVIR_TYPE_NODE_DEVICE_HANDLE : longint; { return type might be wrong }

type
{ Do not add fields to this struct  }
  PGVirNodeDevice = ^TGVirNodeDevice;
  TGVirNodeDevice = record
      parent : TGObject;
      priv : PGVirNodeDevicePrivate;
    end;

  PGVirNodeDeviceClass = ^TGVirNodeDeviceClass;
  TGVirNodeDeviceClass = record
      parent_class : TGObjectClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_node_device_get_type:TGType;cdecl;external libvirtgobject;
function gvir_node_device_handle_get_type:TGType;cdecl;external libvirtgobject;
function gvir_node_device_get_name(device:PGVirNodeDevice):Pgchar;cdecl;external libvirtgobject;
function gvir_node_device_get_config(device:PGVirNodeDevice; flags:Tguint; err:PPGError):PGVirConfigNodeDevice;cdecl;external libvirtgobject;

// === Konventiert am: 18-10-26 19:31:53 ===

function GVIR_TYPE_NODE_DEVICE : TGType;
function GVIR_NODE_DEVICE(obj : Pointer) : PGVirNodeDevice;
function GVIR_NODE_DEVICE_CLASS(klass : Pointer) : PGVirNodeDeviceClass;
function GVIR_IS_NODE_DEVICE(obj : Pointer) : Tgboolean;
function GVIR_IS_NODE_DEVICE_CLASS(klass : Pointer) : Tgboolean;
function GVIR_NODE_DEVICE_GET_CLASS(obj : Pointer) : PGVirNodeDeviceClass;

implementation

function GVIR_TYPE_NODE_DEVICE : TGType;
  begin
    GVIR_TYPE_NODE_DEVICE:=gvir_node_device_get_type;
  end;

function GVIR_NODE_DEVICE(obj : Pointer) : PGVirNodeDevice;
begin
  Result := PGVirNodeDevice(g_type_check_instance_cast(obj, GVIR_TYPE_NODE_DEVICE));
end;

function GVIR_NODE_DEVICE_CLASS(klass : Pointer) : PGVirNodeDeviceClass;
begin
  Result := PGVirNodeDeviceClass(g_type_check_class_cast(klass, GVIR_TYPE_NODE_DEVICE));
end;

function GVIR_IS_NODE_DEVICE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_TYPE_NODE_DEVICE);
end;

function GVIR_IS_NODE_DEVICE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_TYPE_NODE_DEVICE);
end;

function GVIR_NODE_DEVICE_GET_CLASS(obj : Pointer) : PGVirNodeDeviceClass;
begin
  Result := PGVirNodeDeviceClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname def_expr }
function GVIR_TYPE_NODE_DEVICE_HANDLE : longint; { return type might be wrong }
  begin
    GVIR_TYPE_NODE_DEVICE_HANDLE:=gvir_node_device_handle_get_type;
  end;


end.
