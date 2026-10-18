unit libvirt_gconfig_domain_parallel;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-parallel.h: libvirt domain parallel configuration
 *
 * Copyright (C) 2011-2012 Red Hat, Inc.
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
  PGVirConfigDomainParallel = ^TGVirConfigDomainParallel;
  TGVirConfigDomainParallel = record
      parent : TGVirConfigDomainChardev;
      priv : PGVirConfigDomainParallelPrivate;
    end;

  PGVirConfigDomainParallelClass = ^TGVirConfigDomainParallelClass;
  TGVirConfigDomainParallelClass = record
      parent_class : TGVirConfigDomainChardevClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_domain_parallel_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_domain_parallel_new:PGVirConfigDomainParallel;cdecl;external libvirtgconfig;
function gvir_config_domain_parallel_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainParallel;cdecl;external libvirtgconfig;

// === Konventiert am: 18-10-26 12:47:16 ===

function GVIR_CONFIG_TYPE_DOMAIN_PARALLEL : TGType;
function GVIR_CONFIG_DOMAIN_PARALLEL(obj : Pointer) : PGVirConfigDomainParallel;
function GVIR_CONFIG_DOMAIN_PARALLEL_CLASS(klass : Pointer) : PGVirConfigDomainParallelClass;
function GVIR_CONFIG_IS_DOMAIN_PARALLEL(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_PARALLEL_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_PARALLEL_GET_CLASS(obj : Pointer) : PGVirConfigDomainParallelClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_PARALLEL : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_PARALLEL:=gvir_config_domain_parallel_get_type;
  end;

function GVIR_CONFIG_DOMAIN_PARALLEL(obj : Pointer) : PGVirConfigDomainParallel;
begin
  Result := PGVirConfigDomainParallel(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_PARALLEL));
end;

function GVIR_CONFIG_DOMAIN_PARALLEL_CLASS(klass : Pointer) : PGVirConfigDomainParallelClass;
begin
  Result := PGVirConfigDomainParallelClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_PARALLEL));
end;

function GVIR_CONFIG_IS_DOMAIN_PARALLEL(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_PARALLEL);
end;

function GVIR_CONFIG_IS_DOMAIN_PARALLEL_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_PARALLEL);
end;

function GVIR_CONFIG_DOMAIN_PARALLEL_GET_CLASS(obj : Pointer) : PGVirConfigDomainParallelClass;
begin
  Result := PGVirConfigDomainParallelClass(PGTypeInstance(obj)^.g_class);
end;



end.
