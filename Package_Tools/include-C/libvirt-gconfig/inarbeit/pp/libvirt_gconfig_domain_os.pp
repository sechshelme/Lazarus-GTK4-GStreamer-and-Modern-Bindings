
unit libvirt_gconfig_domain_os;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_domain_os.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_domain_os.h
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
PGVirConfigDomainOs  = ^GVirConfigDomainOs;
PGVirConfigDomainOsBootDevice  = ^GVirConfigDomainOsBootDevice;
PGVirConfigDomainOsClass  = ^GVirConfigDomainOsClass;
PGVirConfigDomainOsFirmware  = ^GVirConfigDomainOsFirmware;
PGVirConfigDomainOsPrivate  = ^GVirConfigDomainOsPrivate;
PGVirConfigDomainOsSmBiosMode  = ^GVirConfigDomainOsSmBiosMode;
PGVirConfigDomainOsType  = ^GVirConfigDomainOsType;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-os.c: libvirt domain OS configuration
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
function GVIR_CONFIG_TYPE_DOMAIN_OS : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_OS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_OS_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_OS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_OS_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_OS_GET_CLASS(obj : longint) : longint;

type
{ Do not add fields to this struct  }
  PGVirConfigDomainOs = ^TGVirConfigDomainOs;
  TGVirConfigDomainOs = record
      parent : TGVirConfigObject;
      priv : PGVirConfigDomainOsPrivate;
    end;

  PGVirConfigDomainOsClass = ^TGVirConfigDomainOsClass;
  TGVirConfigDomainOsClass = record
      parent_class : TGVirConfigObjectClass;
      padding : array[0..19] of Tgpointer;
    end;


  PGVirConfigDomainOsType = ^TGVirConfigDomainOsType;
  TGVirConfigDomainOsType =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_OS_TYPE_HVM = 0;
    GVIR_CONFIG_DOMAIN_OS_TYPE_LINUX = 1;
    GVIR_CONFIG_DOMAIN_OS_TYPE_EXE = 2;
    GVIR_CONFIG_DOMAIN_OS_TYPE_XEN = 3;
    GVIR_CONFIG_DOMAIN_OS_TYPE_UML = 4;
;
type
  PGVirConfigDomainOsSmBiosMode = ^TGVirConfigDomainOsSmBiosMode;
  TGVirConfigDomainOsSmBiosMode =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_OS_SMBIOS_MODE_EMULATE = 0;
    GVIR_CONFIG_DOMAIN_OS_SMBIOS_MODE_HOST = 1;
    GVIR_CONFIG_DOMAIN_OS_SMBIOS_MODE_SYSINFO = 2;
;
type
  PGVirConfigDomainOsBootDevice = ^TGVirConfigDomainOsBootDevice;
  TGVirConfigDomainOsBootDevice =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_OS_BOOT_DEVICE_FD = 0;
    GVIR_CONFIG_DOMAIN_OS_BOOT_DEVICE_HD = 1;
    GVIR_CONFIG_DOMAIN_OS_BOOT_DEVICE_CDROM = 2;
    GVIR_CONFIG_DOMAIN_OS_BOOT_DEVICE_NETWORK = 3;
;
type
  PGVirConfigDomainOsFirmware = ^TGVirConfigDomainOsFirmware;
  TGVirConfigDomainOsFirmware =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_OS_FIRMWARE_BIOS = 0;
    GVIR_CONFIG_DOMAIN_OS_FIRMWARE_EFI = 1;
;

function gvir_config_domain_os_get_type:TGType;cdecl;external;
function gvir_config_domain_os_new:PGVirConfigDomainOs;cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_os_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainOs;cdecl;external;
procedure gvir_config_domain_os_set_os_type(os:PGVirConfigDomainOs; _type:TGVirConfigDomainOsType);cdecl;external;
function gvir_config_domain_os_get_os_type(os:PGVirConfigDomainOs):TGVirConfigDomainOsType;cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_os_get_arch(os:PGVirConfigDomainOs):Pchar;cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_os_get_machine(os:PGVirConfigDomainOs):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gvir_config_domain_os_set_arch(os:PGVirConfigDomainOs; arch:Pchar);cdecl;external;
function gvir_config_domain_os_get_boot_devices(os:PGVirConfigDomainOs):PGList;cdecl;external;
procedure gvir_config_domain_os_set_boot_devices(os:PGVirConfigDomainOs; boot_devices:PGList);cdecl;external;
(* Const before type ignored *)
procedure gvir_config_domain_os_set_kernel(os:PGVirConfigDomainOs; kernel:Pchar);cdecl;external;
(* Const before type ignored *)
procedure gvir_config_domain_os_set_ramdisk(os:PGVirConfigDomainOs; ramdisk:Pchar);cdecl;external;
(* Const before type ignored *)
procedure gvir_config_domain_os_set_cmdline(os:PGVirConfigDomainOs; cmdline:Pchar);cdecl;external;
(* Const before type ignored *)
procedure gvir_config_domain_os_set_init(os:PGVirConfigDomainOs; init:Pchar);cdecl;external;
(* Const before type ignored *)
procedure gvir_config_domain_os_set_loader(os:PGVirConfigDomainOs; loader:Pchar);cdecl;external;
(* Const before type ignored *)
procedure gvir_config_domain_os_set_machine(os:PGVirConfigDomainOs; machine:Pchar);cdecl;external;
procedure gvir_config_domain_os_set_smbios_mode(os:PGVirConfigDomainOs; mode:TGVirConfigDomainOsSmBiosMode);cdecl;external;
procedure gvir_config_domain_os_enable_boot_menu(os:PGVirConfigDomainOs; enable:Tgboolean);cdecl;external;
procedure gvir_config_domain_os_bios_enable_serial(os:PGVirConfigDomainOs; enable:Tgboolean);cdecl;external;
function gvir_config_domain_os_get_firmware(os:PGVirConfigDomainOs):TGVirConfigDomainOsFirmware;cdecl;external;
procedure gvir_config_domain_os_set_firmware(os:PGVirConfigDomainOs; firmware:TGVirConfigDomainOsFirmware);cdecl;external;
(* Const before type ignored *)
procedure gvir_config_domain_os_enable_firmware_feature(os:PGVirConfigDomainOs; name:Pchar; enable:Tgboolean);cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_OS : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_DOMAIN_OS:=gvir_config_domain_os_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_OS(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_OS:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_DOMAIN_OS,GVirConfigDomainOs);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_OS_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_OS_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_DOMAIN_OS,GVirConfigDomainOsClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_OS(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_OS:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_DOMAIN_OS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_OS_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_OS_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_DOMAIN_OS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_OS_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_OS_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_DOMAIN_OS,GVirConfigDomainOsClass);
end;


end.
