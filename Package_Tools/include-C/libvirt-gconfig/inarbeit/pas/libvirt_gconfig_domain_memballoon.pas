unit libvirt_gconfig_domain_memballoon;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-memballoon.h: libvirt domain memballoon configuration
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
 * Author: Daniel P. Berrange <berrange@redhat.com>
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)

type
{ Do not add fields to this struct  }
  PGVirConfigDomainMemballoon = ^TGVirConfigDomainMemballoon;
  TGVirConfigDomainMemballoon = record
      parent : TGVirConfigDomainDevice;
      priv : PGVirConfigDomainMemballoonPrivate;
    end;

  PGVirConfigDomainMemballoonClass = ^TGVirConfigDomainMemballoonClass;
  TGVirConfigDomainMemballoonClass = record
      parent_class : TGVirConfigDomainDeviceClass;
      padding : array[0..19] of Tgpointer;
    end;


  PGVirConfigDomainMemballoonModel = ^TGVirConfigDomainMemballoonModel;
  TGVirConfigDomainMemballoonModel =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_MEMBALLOON_MODEL_NONE = 0;
    GVIR_CONFIG_DOMAIN_MEMBALLOON_MODEL_VIRTIO = 1;
;

function gvir_config_domain_memballoon_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_domain_memballoon_new:PGVirConfigDomainMemballoon;cdecl;external libvirtgconfig;
function gvir_config_domain_memballoon_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainMemballoon;cdecl;external libvirtgconfig;
procedure gvir_config_domain_memballoon_set_model(memballoon:PGVirConfigDomainMemballoon; model:TGVirConfigDomainMemballoonModel);cdecl;external libvirtgconfig;

// === Konventiert am: 18-10-26 12:47:22 ===

function GVIR_CONFIG_TYPE_DOMAIN_MEMBALLOON : TGType;
function GVIR_CONFIG_DOMAIN_MEMBALLOON(obj : Pointer) : PGVirConfigDomainMemballoon;
function GVIR_CONFIG_DOMAIN_MEMBALLOON_CLASS(klass : Pointer) : PGVirConfigDomainMemballoonClass;
function GVIR_CONFIG_IS_DOMAIN_MEMBALLOON(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_MEMBALLOON_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_MEMBALLOON_GET_CLASS(obj : Pointer) : PGVirConfigDomainMemballoonClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_MEMBALLOON : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_MEMBALLOON:=gvir_config_domain_memballoon_get_type;
  end;

function GVIR_CONFIG_DOMAIN_MEMBALLOON(obj : Pointer) : PGVirConfigDomainMemballoon;
begin
  Result := PGVirConfigDomainMemballoon(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_MEMBALLOON));
end;

function GVIR_CONFIG_DOMAIN_MEMBALLOON_CLASS(klass : Pointer) : PGVirConfigDomainMemballoonClass;
begin
  Result := PGVirConfigDomainMemballoonClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_MEMBALLOON));
end;

function GVIR_CONFIG_IS_DOMAIN_MEMBALLOON(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_MEMBALLOON);
end;

function GVIR_CONFIG_IS_DOMAIN_MEMBALLOON_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_MEMBALLOON);
end;

function GVIR_CONFIG_DOMAIN_MEMBALLOON_GET_CLASS(obj : Pointer) : PGVirConfigDomainMemballoonClass;
begin
  Result := PGVirConfigDomainMemballoonClass(PGTypeInstance(obj)^.g_class);
end;



end.
