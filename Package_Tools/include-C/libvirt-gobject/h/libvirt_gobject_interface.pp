
unit libvirt_gobject_interface;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gobject_interface.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gobject_interface.h
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
Pgchar  = ^gchar;
PGError  = ^GError;
PGVirConfigInterface  = ^GVirConfigInterface;
PGVirInterface  = ^GVirInterface;
PGVirInterfaceClass  = ^GVirInterfaceClass;
PGVirInterfacePrivate  = ^GVirInterfacePrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gobject-interface.c: libvirt gobject integration
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
function GVIR_TYPE_INTERFACE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_INTERFACE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_INTERFACE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_INTERFACE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_INTERFACE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_INTERFACE_GET_CLASS(obj : longint) : longint;

{ was #define dname def_expr }
function GVIR_TYPE_INTERFACE_HANDLE : longint; { return type might be wrong }

type
{ Do not add fields to this struct  }
  PGVirInterface = ^TGVirInterface;
  TGVirInterface = record
      parent : TGObject;
      priv : PGVirInterfacePrivate;
    end;

  PGVirInterfaceClass = ^TGVirInterfaceClass;
  TGVirInterfaceClass = record
      parent_class : TGObjectClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_interface_get_type:TGType;cdecl;external;
function gvir_interface_handle_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gvir_interface_get_name(iface:PGVirInterface):Pgchar;cdecl;external;
(* Const before type ignored *)
function gvir_interface_get_mac(iface:PGVirInterface):Pgchar;cdecl;external;
function gvir_interface_get_config(iface:PGVirInterface; flags:Tguint; err:PPGError):PGVirConfigInterface;cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_TYPE_INTERFACE : longint; { return type might be wrong }
  begin
    GVIR_TYPE_INTERFACE:=gvir_interface_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_INTERFACE(obj : longint) : longint;
begin
  GVIR_INTERFACE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_TYPE_INTERFACE,GVirInterface);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_INTERFACE_CLASS(klass : longint) : longint;
begin
  GVIR_INTERFACE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_TYPE_INTERFACE,GVirInterfaceClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_INTERFACE(obj : longint) : longint;
begin
  GVIR_IS_INTERFACE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_TYPE_INTERFACE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_INTERFACE_CLASS(klass : longint) : longint;
begin
  GVIR_IS_INTERFACE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_TYPE_INTERFACE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_INTERFACE_GET_CLASS(obj : longint) : longint;
begin
  GVIR_INTERFACE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_TYPE_INTERFACE,GVirInterfaceClass);
end;

{ was #define dname def_expr }
function GVIR_TYPE_INTERFACE_HANDLE : longint; { return type might be wrong }
  begin
    GVIR_TYPE_INTERFACE_HANDLE:=gvir_interface_handle_get_type;
  end;


end.
