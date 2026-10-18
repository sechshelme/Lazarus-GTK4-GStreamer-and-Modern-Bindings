unit libvirt_gobject_secret;

interface

uses
  fp_glib2, fp_virt_glib;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gobject-secret.c: libvirt gobject integration
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
function GVIR_TYPE_SECRET_HANDLE : longint; { return type might be wrong }

type
{ Do not add fields to this struct  }
  PGVirSecret = ^TGVirSecret;
  TGVirSecret = record
      parent : TGObject;
      priv : PGVirSecretPrivate;
    end;

  PGVirSecretClass = ^TGVirSecretClass;
  TGVirSecretClass = record
      parent_class : TGObjectClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_secret_get_type:TGType;cdecl;external libvirtgobject;
function gvir_secret_handle_get_type:TGType;cdecl;external libvirtgobject;
function gvir_secret_get_name(secret:PGVirSecret):Pgchar;cdecl;external libvirtgobject;
function gvir_secret_get_uuid(secret:PGVirSecret):Pgchar;cdecl;external libvirtgobject;
function gvir_secret_get_config(secret:PGVirSecret; flags:Tguint; err:PPGError):PGVirConfigSecret;cdecl;external libvirtgobject;

// === Konventiert am: 18-10-26 19:31:48 ===

function GVIR_TYPE_SECRET : TGType;
function GVIR_SECRET(obj : Pointer) : PGVirSecret;
function GVIR_SECRET_CLASS(klass : Pointer) : PGVirSecretClass;
function GVIR_IS_SECRET(obj : Pointer) : Tgboolean;
function GVIR_IS_SECRET_CLASS(klass : Pointer) : Tgboolean;
function GVIR_SECRET_GET_CLASS(obj : Pointer) : PGVirSecretClass;

implementation

function GVIR_TYPE_SECRET : TGType;
  begin
    GVIR_TYPE_SECRET:=gvir_secret_get_type;
  end;

function GVIR_SECRET(obj : Pointer) : PGVirSecret;
begin
  Result := PGVirSecret(g_type_check_instance_cast(obj, GVIR_TYPE_SECRET));
end;

function GVIR_SECRET_CLASS(klass : Pointer) : PGVirSecretClass;
begin
  Result := PGVirSecretClass(g_type_check_class_cast(klass, GVIR_TYPE_SECRET));
end;

function GVIR_IS_SECRET(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_TYPE_SECRET);
end;

function GVIR_IS_SECRET_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_TYPE_SECRET);
end;

function GVIR_SECRET_GET_CLASS(obj : Pointer) : PGVirSecretClass;
begin
  Result := PGVirSecretClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname def_expr }
function GVIR_TYPE_SECRET_HANDLE : longint; { return type might be wrong }
  begin
    GVIR_TYPE_SECRET_HANDLE:=gvir_secret_handle_get_type;
  end;


end.
