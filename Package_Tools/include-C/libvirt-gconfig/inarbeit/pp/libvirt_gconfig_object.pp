
unit libvirt_gconfig_object;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_object.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_object.h
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
PGVirConfigObject  = ^GVirConfigObject;
PGVirConfigObjectClass  = ^GVirConfigObjectClass;
PGVirConfigObjectPrivate  = ^GVirConfigObjectPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-object.h: base object for XML configuration
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
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_OBJECT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_OBJECT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_OBJECT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_OBJECT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_OBJECT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_OBJECT_GET_CLASS(obj : longint) : longint;

type
{ Do not add fields to this struct  }
  PGVirConfigObject = ^TGVirConfigObject;
  TGVirConfigObject = record
      parent : TGObject;
      priv : PGVirConfigObjectPrivate;
    end;

  PGVirConfigObjectClass = ^TGVirConfigObjectClass;
  TGVirConfigObjectClass = record
      parent_class : TGObjectClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_object_get_type:TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gvir_config_object_new(_type:TGType; root_name:Pchar; schema:Pchar):PGVirConfigObject;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gvir_config_object_new_from_xml(_type:TGType; root_name:Pchar; schema:Pchar; xml:Pgchar; error:PPGError):PGVirConfigObject;cdecl;external;
procedure gvir_config_object_validate(config:PGVirConfigObject; err:PPGError);cdecl;external;
function gvir_config_object_to_xml(config:PGVirConfigObject):Pgchar;cdecl;external;
(* Const before type ignored *)
function gvir_config_object_get_schema(config:PGVirConfigObject):Pgchar;cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_OBJECT : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_OBJECT:=gvir_config_object_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_OBJECT(obj : longint) : longint;
begin
  GVIR_CONFIG_OBJECT:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_OBJECT,GVirConfigObject);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_OBJECT_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_OBJECT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_OBJECT,GVirConfigObjectClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_OBJECT(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_OBJECT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_OBJECT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_OBJECT_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_OBJECT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_OBJECT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_OBJECT_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_OBJECT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_OBJECT,GVirConfigObjectClass);
end;


end.
