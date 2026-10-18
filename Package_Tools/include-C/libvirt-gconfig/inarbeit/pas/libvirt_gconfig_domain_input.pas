unit libvirt_gconfig_domain_input;

interface

uses
  fp_glib2, fp_virtgconfig;

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

function gvir_config_domain_input_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_domain_input_new:PGVirConfigDomainInput;cdecl;external libvirtgconfig;
function gvir_config_domain_input_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainInput;cdecl;external libvirtgconfig;
function gvir_config_domain_input_get_device_type(input:PGVirConfigDomainInput):TGVirConfigDomainInputDeviceType;cdecl;external libvirtgconfig;
procedure gvir_config_domain_input_set_device_type(input:PGVirConfigDomainInput; _type:TGVirConfigDomainInputDeviceType);cdecl;external libvirtgconfig;
function gvir_config_domain_input_get_bus(input:PGVirConfigDomainInput):TGVirConfigDomainInputBus;cdecl;external libvirtgconfig;
procedure gvir_config_domain_input_set_bus(input:PGVirConfigDomainInput; bus:TGVirConfigDomainInputBus);cdecl;external libvirtgconfig;

// === Konventiert am: 18-10-26 12:43:26 ===

function GVIR_CONFIG_TYPE_DOMAIN_INPUT : TGType;
function GVIR_CONFIG_DOMAIN_INPUT(obj : Pointer) : PGVirConfigDomainInput;
function GVIR_CONFIG_DOMAIN_INPUT_CLASS(klass : Pointer) : PGVirConfigDomainInputClass;
function GVIR_CONFIG_IS_DOMAIN_INPUT(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_INPUT_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_INPUT_GET_CLASS(obj : Pointer) : PGVirConfigDomainInputClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_INPUT : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_INPUT:=gvir_config_domain_input_get_type;
  end;

function GVIR_CONFIG_DOMAIN_INPUT(obj : Pointer) : PGVirConfigDomainInput;
begin
  Result := PGVirConfigDomainInput(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_INPUT));
end;

function GVIR_CONFIG_DOMAIN_INPUT_CLASS(klass : Pointer) : PGVirConfigDomainInputClass;
begin
  Result := PGVirConfigDomainInputClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_INPUT));
end;

function GVIR_CONFIG_IS_DOMAIN_INPUT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_INPUT);
end;

function GVIR_CONFIG_IS_DOMAIN_INPUT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_INPUT);
end;

function GVIR_CONFIG_DOMAIN_INPUT_GET_CLASS(obj : Pointer) : PGVirConfigDomainInputClass;
begin
  Result := PGVirConfigDomainInputClass(PGTypeInstance(obj)^.g_class);
end;



end.
