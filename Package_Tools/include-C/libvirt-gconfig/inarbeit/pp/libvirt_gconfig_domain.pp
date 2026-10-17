
unit libvirt_gconfig_domain;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_domain.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_domain
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
PGList  = ^GList;
PGVirConfigDomain  = ^GVirConfigDomain;
PGVirConfigDomainClass  = ^GVirConfigDomainClass;
PGVirConfigDomainClock  = ^GVirConfigDomainClock;
PGVirConfigDomainCpu  = ^GVirConfigDomainCpu;
PGVirConfigDomainDevice  = ^GVirConfigDomainDevice;
PGVirConfigDomainLifecycleAction  = ^GVirConfigDomainLifecycleAction;
PGVirConfigDomainLifecycleEvent  = ^GVirConfigDomainLifecycleEvent;
PGVirConfigDomainOs  = ^GVirConfigDomainOs;
PGVirConfigDomainPowerManagement  = ^GVirConfigDomainPowerManagement;
PGVirConfigDomainPrivate  = ^GVirConfigDomainPrivate;
PGVirConfigDomainSeclabel  = ^GVirConfigDomainSeclabel;
PGVirConfigDomainVirtType  = ^GVirConfigDomainVirtType;
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

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_GET_CLASS(obj : longint) : longint;

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

function gvir_config_domain_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomain;cdecl;external;
function gvir_config_domain_new:PGVirConfigDomain;cdecl;external;
function gvir_config_domain_get_virt_type(domain:PGVirConfigDomain):TGVirConfigDomainVirtType;cdecl;external;
procedure gvir_config_domain_set_virt_type(domain:PGVirConfigDomain; _type:TGVirConfigDomainVirtType);cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_get_name(domain:PGVirConfigDomain):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gvir_config_domain_set_name(domain:PGVirConfigDomain; name:Pchar);cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_get_uuid(domain:PGVirConfigDomain):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gvir_config_domain_set_uuid(domain:PGVirConfigDomain; uuid:Pchar);cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_get_description(domain:PGVirConfigDomain):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gvir_config_domain_set_description(domain:PGVirConfigDomain; description:Pchar);cdecl;external;
function gvir_config_domain_get_memory(domain:PGVirConfigDomain):Tguint64;cdecl;external;
procedure gvir_config_domain_set_memory(domain:PGVirConfigDomain; memory:Tguint64);cdecl;external;
function gvir_config_domain_get_current_memory(domain:PGVirConfigDomain):Tguint64;cdecl;external;
procedure gvir_config_domain_set_current_memory(domain:PGVirConfigDomain; memory:Tguint64);cdecl;external;
function gvir_config_domain_get_vcpus(domain:PGVirConfigDomain):Tguint64;cdecl;external;
procedure gvir_config_domain_set_vcpus(domain:PGVirConfigDomain; vcpu_count:Tguint64);cdecl;external;
function gvir_config_domain_get_features(domain:PGVirConfigDomain):TGStrv;cdecl;external;
(* Const before type ignored *)
procedure gvir_config_domain_set_features(domain:PGVirConfigDomain; features:TGStrv);cdecl;external;
function gvir_config_domain_get_clock(domain:PGVirConfigDomain):PGVirConfigDomainClock;cdecl;external;
procedure gvir_config_domain_set_clock(domain:PGVirConfigDomain; klock:PGVirConfigDomainClock);cdecl;external;
function gvir_config_domain_get_os(domain:PGVirConfigDomain):PGVirConfigDomainOs;cdecl;external;
procedure gvir_config_domain_set_os(domain:PGVirConfigDomain; os:PGVirConfigDomainOs);cdecl;external;
procedure gvir_config_domain_set_seclabel(domain:PGVirConfigDomain; seclabel:PGVirConfigDomainSeclabel);cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_get_title(domain:PGVirConfigDomain):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gvir_config_domain_set_title(domain:PGVirConfigDomain; title:Pchar);cdecl;external;
procedure gvir_config_domain_set_devices(domain:PGVirConfigDomain; devices:PGList);cdecl;external;
procedure gvir_config_domain_add_device(domain:PGVirConfigDomain; device:PGVirConfigDomainDevice);cdecl;external;
function gvir_config_domain_get_devices(domain:PGVirConfigDomain):PGList;cdecl;external;
procedure gvir_config_domain_set_lifecycle(domain:PGVirConfigDomain; event:TGVirConfigDomainLifecycleEvent; action:TGVirConfigDomainLifecycleAction);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gvir_config_domain_set_custom_xml_ns_children(domain:PGVirConfigDomain; xml:Pgchar; ns:Pgchar; ns_uri:Pgchar; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gvir_config_domain_set_custom_xml(domain:PGVirConfigDomain; xml:Pgchar; ns:Pgchar; ns_uri:Pgchar; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_get_custom_xml(domain:PGVirConfigDomain; ns_uri:Pgchar):Pgchar;cdecl;external;
function gvir_config_domain_get_cpu(domain:PGVirConfigDomain):PGVirConfigDomainCpu;cdecl;external;
procedure gvir_config_domain_set_cpu(domain:PGVirConfigDomain; cpu:PGVirConfigDomainCpu);cdecl;external;
procedure gvir_config_domain_set_power_management(domain:PGVirConfigDomain; pm:PGVirConfigDomainPowerManagement);cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_DOMAIN:=gvir_config_domain_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_DOMAIN,GVirConfigDomain);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_DOMAIN,GVirConfigDomainClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_DOMAIN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_DOMAIN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_DOMAIN,GVirConfigDomainClass);
end;


end.
