
unit libvirt_gconfig_domain_input;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_domain_input.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_domain_input.h
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
PGVirConfigDomainInput  = ^GVirConfigDomainInput;
PGVirConfigDomainInputBus  = ^GVirConfigDomainInputBus;
PGVirConfigDomainInputClass  = ^GVirConfigDomainInputClass;
PGVirConfigDomainInputDeviceType  = ^GVirConfigDomainInputDeviceType;
PGVirConfigDomainInputPrivate  = ^GVirConfigDomainInputPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-input.c: libvirt domain input configuration
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

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_INPUT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_INPUT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_INPUT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_INPUT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_INPUT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_INPUT_GET_CLASS(obj : longint) : longint;

type
{ Do not add fields to this struct  }
  PGVirConfigDomainInput = ^TGVirConfigDomainInput;
  TGVirConfigDomainInput = record
      parent : TGVirConfigDomainDevice;
      priv : PGVirConfigDomainInputPrivate;
    end;

  PGVirConfigDomainInputClass = ^TGVirConfigDomainInputClass;
  TGVirConfigDomainInputClass = record
      parent_class : TGVirConfigDomainDeviceClass;
      padding : array[0..19] of Tgpointer;
    end;


  PGVirConfigDomainInputDeviceType = ^TGVirConfigDomainInputDeviceType;
  TGVirConfigDomainInputDeviceType =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_INPUT_DEVICE_MOUSE = 0;
    GVIR_CONFIG_DOMAIN_INPUT_DEVICE_TABLET = 1;
    GVIR_CONFIG_DOMAIN_INPUT_DEVICE_KEYBOARD = 2;
;
type
  PGVirConfigDomainInputBus = ^TGVirConfigDomainInputBus;
  TGVirConfigDomainInputBus =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_INPUT_BUS_PS2 = 0;
    GVIR_CONFIG_DOMAIN_INPUT_BUS_USB = 1;
    GVIR_CONFIG_DOMAIN_INPUT_BUS_XEN = 2;
;

function gvir_config_domain_input_get_type:TGType;cdecl;external;
function gvir_config_domain_input_new:PGVirConfigDomainInput;cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_input_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainInput;cdecl;external;
function gvir_config_domain_input_get_device_type(input:PGVirConfigDomainInput):TGVirConfigDomainInputDeviceType;cdecl;external;
procedure gvir_config_domain_input_set_device_type(input:PGVirConfigDomainInput; _type:TGVirConfigDomainInputDeviceType);cdecl;external;
function gvir_config_domain_input_get_bus(input:PGVirConfigDomainInput):TGVirConfigDomainInputBus;cdecl;external;
procedure gvir_config_domain_input_set_bus(input:PGVirConfigDomainInput; bus:TGVirConfigDomainInputBus);cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_INPUT : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_DOMAIN_INPUT:=gvir_config_domain_input_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_INPUT(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_INPUT:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_DOMAIN_INPUT,GVirConfigDomainInput);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_INPUT_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_INPUT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_DOMAIN_INPUT,GVirConfigDomainInputClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_INPUT(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_INPUT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_DOMAIN_INPUT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_INPUT_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_INPUT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_DOMAIN_INPUT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_INPUT_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_INPUT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_DOMAIN_INPUT,GVirConfigDomainInputClass);
end;


end.
