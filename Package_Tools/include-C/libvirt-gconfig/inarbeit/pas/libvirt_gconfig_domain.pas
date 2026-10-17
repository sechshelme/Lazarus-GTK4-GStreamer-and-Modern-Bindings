unit libvirt_gconfig_domain;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain.h: libvirt domain configuration
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
{$include <libvirt-gconfig/libvirt-gconfig-domain-clock.h>}
{$include <libvirt-gconfig/libvirt-gconfig-domain-os.h>}
{$include <libvirt-gconfig/libvirt-gconfig-domain-device.h>}
{$include <libvirt-gconfig/libvirt-gconfig-domain-seclabel.h>}
{$include <libvirt-gconfig/libvirt-gconfig-domain-cpu.h>}
{$include <libvirt-gconfig/libvirt-gconfig-domain-power-management.h>}

type
{ Do not add fields to this struct  }
  PGVirConfigDomain = ^TGVirConfigDomain;
  TGVirConfigDomain = record
      parent : TGVirConfigObject;
      priv : PGVirConfigDomainPrivate;
    end;

  PGVirConfigDomainClass = ^TGVirConfigDomainClass;
  TGVirConfigDomainClass = record
      parent_class : TGVirConfigObjectClass;
      padding : array[0..19] of Tgpointer;
    end;


  PGVirConfigDomainVirtType = ^TGVirConfigDomainVirtType;
  TGVirConfigDomainVirtType =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_VIRT_QEMU = 0;
    GVIR_CONFIG_DOMAIN_VIRT_KQEMU = 1;
    GVIR_CONFIG_DOMAIN_VIRT_KVM = 2;
    GVIR_CONFIG_DOMAIN_VIRT_XEN = 3;
    GVIR_CONFIG_DOMAIN_VIRT_LXC = 4;
    GVIR_CONFIG_DOMAIN_VIRT_UML = 5;
    GVIR_CONFIG_DOMAIN_VIRT_OPENVZ = 6;
    GVIR_CONFIG_DOMAIN_VIRT_VSERVER = 7;
    GVIR_CONFIG_DOMAIN_VIRT_LDOM = 8;
    GVIR_CONFIG_DOMAIN_VIRT_TEST = 9;
    GVIR_CONFIG_DOMAIN_VIRT_VMWARE = 10;
    GVIR_CONFIG_DOMAIN_VIRT_HYPERV = 11;
    GVIR_CONFIG_DOMAIN_VIRT_VBOX = 12;
    GVIR_CONFIG_DOMAIN_VIRT_ONE = 13;
    GVIR_CONFIG_DOMAIN_VIRT_PHYP = 14;
;
{< nick=on_poweroff > }
{< nick=on_reboot > }
{< nick=on_crash > }
type
  PGVirConfigDomainLifecycleEvent = ^TGVirConfigDomainLifecycleEvent;
  TGVirConfigDomainLifecycleEvent =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_LIFECYCLE_ON_POWEROFF = 0;
    GVIR_CONFIG_DOMAIN_LIFECYCLE_ON_REBOOT = 1;
    GVIR_CONFIG_DOMAIN_LIFECYCLE_ON_CRASH = 2;
;
type
  PGVirConfigDomainLifecycleAction = ^TGVirConfigDomainLifecycleAction;
  TGVirConfigDomainLifecycleAction =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_LIFECYCLE_DESTROY = 0;
    GVIR_CONFIG_DOMAIN_LIFECYCLE_RESTART = 1;
    GVIR_CONFIG_DOMAIN_LIFECYCLE_PRESERVE = 2;
    GVIR_CONFIG_DOMAIN_LIFECYCLE_RENAME_RESTART = 3;
    GVIR_CONFIG_DOMAIN_LIFECYCLE_COREDUMP_DESTROY = 4;
    GVIR_CONFIG_DOMAIN_LIFECYCLE_COREDUMP_RESTART = 5;
;

function gvir_config_domain_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_domain_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomain;cdecl;external libvirtgconfig;
function gvir_config_domain_new:PGVirConfigDomain;cdecl;external libvirtgconfig;
function gvir_config_domain_get_virt_type(domain:PGVirConfigDomain):TGVirConfigDomainVirtType;cdecl;external libvirtgconfig;
procedure gvir_config_domain_set_virt_type(domain:PGVirConfigDomain; _type:TGVirConfigDomainVirtType);cdecl;external libvirtgconfig;
function gvir_config_domain_get_name(domain:PGVirConfigDomain):Pchar;cdecl;external libvirtgconfig;
procedure gvir_config_domain_set_name(domain:PGVirConfigDomain; name:Pchar);cdecl;external libvirtgconfig;
function gvir_config_domain_get_uuid(domain:PGVirConfigDomain):Pchar;cdecl;external libvirtgconfig;
procedure gvir_config_domain_set_uuid(domain:PGVirConfigDomain; uuid:Pchar);cdecl;external libvirtgconfig;
function gvir_config_domain_get_description(domain:PGVirConfigDomain):Pchar;cdecl;external libvirtgconfig;
procedure gvir_config_domain_set_description(domain:PGVirConfigDomain; description:Pchar);cdecl;external libvirtgconfig;
function gvir_config_domain_get_memory(domain:PGVirConfigDomain):Tguint64;cdecl;external libvirtgconfig;
procedure gvir_config_domain_set_memory(domain:PGVirConfigDomain; memory:Tguint64);cdecl;external libvirtgconfig;
function gvir_config_domain_get_current_memory(domain:PGVirConfigDomain):Tguint64;cdecl;external libvirtgconfig;
procedure gvir_config_domain_set_current_memory(domain:PGVirConfigDomain; memory:Tguint64);cdecl;external libvirtgconfig;
function gvir_config_domain_get_vcpus(domain:PGVirConfigDomain):Tguint64;cdecl;external libvirtgconfig;
procedure gvir_config_domain_set_vcpus(domain:PGVirConfigDomain; vcpu_count:Tguint64);cdecl;external libvirtgconfig;
function gvir_config_domain_get_features(domain:PGVirConfigDomain):TGStrv;cdecl;external libvirtgconfig;
procedure gvir_config_domain_set_features(domain:PGVirConfigDomain; features:TGStrv);cdecl;external libvirtgconfig;
function gvir_config_domain_get_clock(domain:PGVirConfigDomain):PGVirConfigDomainClock;cdecl;external libvirtgconfig;
procedure gvir_config_domain_set_clock(domain:PGVirConfigDomain; klock:PGVirConfigDomainClock);cdecl;external libvirtgconfig;
function gvir_config_domain_get_os(domain:PGVirConfigDomain):PGVirConfigDomainOs;cdecl;external libvirtgconfig;
procedure gvir_config_domain_set_os(domain:PGVirConfigDomain; os:PGVirConfigDomainOs);cdecl;external libvirtgconfig;
procedure gvir_config_domain_set_seclabel(domain:PGVirConfigDomain; seclabel:PGVirConfigDomainSeclabel);cdecl;external libvirtgconfig;
function gvir_config_domain_get_title(domain:PGVirConfigDomain):Pchar;cdecl;external libvirtgconfig;
procedure gvir_config_domain_set_title(domain:PGVirConfigDomain; title:Pchar);cdecl;external libvirtgconfig;
procedure gvir_config_domain_set_devices(domain:PGVirConfigDomain; devices:PGList);cdecl;external libvirtgconfig;
procedure gvir_config_domain_add_device(domain:PGVirConfigDomain; device:PGVirConfigDomainDevice);cdecl;external libvirtgconfig;
function gvir_config_domain_get_devices(domain:PGVirConfigDomain):PGList;cdecl;external libvirtgconfig;
procedure gvir_config_domain_set_lifecycle(domain:PGVirConfigDomain; event:TGVirConfigDomainLifecycleEvent; action:TGVirConfigDomainLifecycleAction);cdecl;external libvirtgconfig;
function gvir_config_domain_set_custom_xml_ns_children(domain:PGVirConfigDomain; xml:Pgchar; ns:Pgchar; ns_uri:Pgchar; error:PPGError):Tgboolean;cdecl;external libvirtgconfig;
function gvir_config_domain_set_custom_xml(domain:PGVirConfigDomain; xml:Pgchar; ns:Pgchar; ns_uri:Pgchar; error:PPGError):Tgboolean;cdecl;external libvirtgconfig;
function gvir_config_domain_get_custom_xml(domain:PGVirConfigDomain; ns_uri:Pgchar):Pgchar;cdecl;external libvirtgconfig;
function gvir_config_domain_get_cpu(domain:PGVirConfigDomain):PGVirConfigDomainCpu;cdecl;external libvirtgconfig;
procedure gvir_config_domain_set_cpu(domain:PGVirConfigDomain; cpu:PGVirConfigDomainCpu);cdecl;external libvirtgconfig;
procedure gvir_config_domain_set_power_management(domain:PGVirConfigDomain; pm:PGVirConfigDomainPowerManagement);cdecl;external libvirtgconfig;

// === Konventiert am: 17-10-26 19:56:21 ===

function GVIR_CONFIG_TYPE_DOMAIN : TGType;
function GVIR_CONFIG_DOMAIN(obj : Pointer) : PGVirConfigDomain;
function GVIR_CONFIG_DOMAIN_CLASS(klass : Pointer) : PGVirConfigDomainClass;
function GVIR_CONFIG_IS_DOMAIN(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_GET_CLASS(obj : Pointer) : PGVirConfigDomainClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN:=gvir_config_domain_get_type;
  end;

function GVIR_CONFIG_DOMAIN(obj : Pointer) : PGVirConfigDomain;
begin
  Result := PGVirConfigDomain(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN));
end;

function GVIR_CONFIG_DOMAIN_CLASS(klass : Pointer) : PGVirConfigDomainClass;
begin
  Result := PGVirConfigDomainClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN));
end;

function GVIR_CONFIG_IS_DOMAIN(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN);
end;

function GVIR_CONFIG_IS_DOMAIN_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN);
end;

function GVIR_CONFIG_DOMAIN_GET_CLASS(obj : Pointer) : PGVirConfigDomainClass;
begin
  Result := PGVirConfigDomainClass(PGTypeInstance(obj)^.g_class);
end;



end.
