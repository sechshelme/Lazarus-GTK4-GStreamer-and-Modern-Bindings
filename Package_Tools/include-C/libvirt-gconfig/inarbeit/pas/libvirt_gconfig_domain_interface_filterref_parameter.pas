unit libvirt_gconfig_domain_interface_filterref_parameter;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-interface-filterref-parameter.h:
 * libvirt filterref parameters
 *
 * Copyright (C) 2013 Red Hat, Inc.
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
 * Authors: Ian Main <imain@redhat.com>
 *          Daniel P. Berrange <berrange@redhat.com>
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)

type
{ Do not add fields to this struct  }
  PGVirConfigDomainInterfaceFilterrefParameter = ^TGVirConfigDomainInterfaceFilterrefParameter;
  TGVirConfigDomainInterfaceFilterrefParameter = record
      parent : TGVirConfigObject;
      priv : PGVirConfigDomainInterfaceFilterrefParameterPrivate;
    end;

  PGVirConfigDomainInterfaceFilterrefParameterClass = ^TGVirConfigDomainInterfaceFilterrefParameterClass;
  TGVirConfigDomainInterfaceFilterrefParameterClass = record
      parent_class : TGVirConfigObjectClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_domain_interface_filterref_parameter_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_domain_interface_filterref_parameter_new:PGVirConfigDomainInterfaceFilterrefParameter;cdecl;external libvirtgconfig;
function gvir_config_domain_interface_filterref_parameter_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainInterfaceFilterrefParameter;cdecl;external libvirtgconfig;
procedure gvir_config_domain_interface_filterref_parameter_set_name(parameter:PGVirConfigDomainInterfaceFilterrefParameter; name:Pgchar);cdecl;external libvirtgconfig;
procedure gvir_config_domain_interface_filterref_parameter_set_value(parameter:PGVirConfigDomainInterfaceFilterrefParameter; value:Pgchar);cdecl;external libvirtgconfig;
function gvir_config_domain_interface_filterref_parameter_get_name(parameter:PGVirConfigDomainInterfaceFilterrefParameter):Pgchar;cdecl;external libvirtgconfig;
function gvir_config_domain_interface_filterref_parameter_get_value(parameter:PGVirConfigDomainInterfaceFilterrefParameter):Pgchar;cdecl;external libvirtgconfig;

// === Konventiert am: 18-10-26 12:43:16 ===

function GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_FILTERREF_PARAMETER : TGType;
function GVIR_CONFIG_DOMAIN_INTERFACE_FILTERREF_PARAMETER(obj : Pointer) : PGVirConfigDomainInterfaceFilterrefParameter;
function GVIR_CONFIG_DOMAIN_INTERFACE_FILTERREF_PARAMETER_CLASS(klass : Pointer) : PGVirConfigDomainInterfaceFilterrefParameterClass;
function GVIR_CONFIG_IS_DOMAIN_INTERFACE_FILTERREF_PARAMETER(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_INTERFACE_FILTERREF_PARAMETER_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_INTERFACE_FILTERREF_PARAMETER_GET_CLASS(obj : Pointer) : PGVirConfigDomainInterfaceFilterrefParameterClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_FILTERREF_PARAMETER : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_FILTERREF_PARAMETER:=gvir_config_domain_interface_filterref_parameter_get_type;
  end;

function GVIR_CONFIG_DOMAIN_INTERFACE_FILTERREF_PARAMETER(obj : Pointer) : PGVirConfigDomainInterfaceFilterrefParameter;
begin
  Result := PGVirConfigDomainInterfaceFilterrefParameter(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_FILTERREF_PARAMETER));
end;

function GVIR_CONFIG_DOMAIN_INTERFACE_FILTERREF_PARAMETER_CLASS(klass : Pointer) : PGVirConfigDomainInterfaceFilterrefParameterClass;
begin
  Result := PGVirConfigDomainInterfaceFilterrefParameterClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_FILTERREF_PARAMETER));
end;

function GVIR_CONFIG_IS_DOMAIN_INTERFACE_FILTERREF_PARAMETER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_FILTERREF_PARAMETER);
end;

function GVIR_CONFIG_IS_DOMAIN_INTERFACE_FILTERREF_PARAMETER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_FILTERREF_PARAMETER);
end;

function GVIR_CONFIG_DOMAIN_INTERFACE_FILTERREF_PARAMETER_GET_CLASS(obj : Pointer) : PGVirConfigDomainInterfaceFilterrefParameterClass;
begin
  Result := PGVirConfigDomainInterfaceFilterrefParameterClass(PGTypeInstance(obj)^.g_class);
end;



end.
