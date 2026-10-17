unit libvirt_gconfig_domain_chardev_source_spicevmc;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-chardev-source-spicevmc.h: libvirt domain chardev spicevmc configuration
 *
 * Copyright (C) 2012 Red Hat, Inc.
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
 * Author: Christophe Fergeau <cfergeau@redhat.com>
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)

type
{ Do not add fields to this struct  }
  PGVirConfigDomainChardevSourceSpiceVmc = ^TGVirConfigDomainChardevSourceSpiceVmc;
  TGVirConfigDomainChardevSourceSpiceVmc = record
      parent : TGVirConfigDomainChardevSource;
      priv : PGVirConfigDomainChardevSourceSpiceVmcPrivate;
    end;

  PGVirConfigDomainChardevSourceSpiceVmcClass = ^TGVirConfigDomainChardevSourceSpiceVmcClass;
  TGVirConfigDomainChardevSourceSpiceVmcClass = record
      parent_class : TGVirConfigDomainChardevSourceClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_domain_chardev_source_spicevmc_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_domain_chardev_source_spicevmc_new:PGVirConfigDomainChardevSourceSpiceVmc;cdecl;external libvirtgconfig;
function gvir_config_domain_chardev_source_spicevmc_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainChardevSourceSpiceVmc;cdecl;external libvirtgconfig;

// === Konventiert am: 17-10-26 19:59:59 ===

function GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_SPICE_VMC : TGType;
function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_SPICE_VMC(obj : Pointer) : PGVirConfigDomainChardevSourceSpiceVmc;
function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_SPICE_VMC_CLASS(klass : Pointer) : PGVirConfigDomainChardevSourceSpiceVmcClass;
function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_SPICE_VMC(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_SPICE_VMC_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_SPICE_VMC_GET_CLASS(obj : Pointer) : PGVirConfigDomainChardevSourceSpiceVmcClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_SPICE_VMC : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_SPICE_VMC:=gvir_config_domain_chardev_source_spicevmc_get_type;
  end;

function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_SPICE_VMC(obj : Pointer) : PGVirConfigDomainChardevSourceSpiceVmc;
begin
  Result := PGVirConfigDomainChardevSourceSpiceVmc(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_SPICE_VMC));
end;

function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_SPICE_VMC_CLASS(klass : Pointer) : PGVirConfigDomainChardevSourceSpiceVmcClass;
begin
  Result := PGVirConfigDomainChardevSourceSpiceVmcClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_SPICE_VMC));
end;

function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_SPICE_VMC(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_SPICE_VMC);
end;

function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_SPICE_VMC_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_SPICE_VMC);
end;

function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_SPICE_VMC_GET_CLASS(obj : Pointer) : PGVirConfigDomainChardevSourceSpiceVmcClass;
begin
  Result := PGVirConfigDomainChardevSourceSpiceVmcClass(PGTypeInstance(obj)^.g_class);
end;



end.
