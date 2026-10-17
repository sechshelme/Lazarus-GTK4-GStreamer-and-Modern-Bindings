
unit libvirt_gconfig_domain_clock;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_domain_clock.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_domain_clock.h
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
PGVirConfigDomainClock  = ^GVirConfigDomainClock;
PGVirConfigDomainClockClass  = ^GVirConfigDomainClockClass;
PGVirConfigDomainClockOffset  = ^GVirConfigDomainClockOffset;
PGVirConfigDomainClockPrivate  = ^GVirConfigDomainClockPrivate;
PGVirConfigDomainTimer  = ^GVirConfigDomainTimer;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-clock.h: libvirt domain clock configuration
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
 * Author: Christophe Fergeau <cfergeau@redhat.com>
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)
{$include <libvirt-gconfig/libvirt-gconfig-domain-timer.h>}

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_CLOCK : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CLOCK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CLOCK_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_CLOCK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_CLOCK_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CLOCK_GET_CLASS(obj : longint) : longint;

type
{ Do not add fields to this struct  }
  PGVirConfigDomainClock = ^TGVirConfigDomainClock;
  TGVirConfigDomainClock = record
      parent : TGVirConfigObject;
      priv : PGVirConfigDomainClockPrivate;
    end;

  PGVirConfigDomainClockClass = ^TGVirConfigDomainClockClass;
  TGVirConfigDomainClockClass = record
      parent_class : TGVirConfigObjectClass;
      padding : array[0..19] of Tgpointer;
    end;


  PGVirConfigDomainClockOffset = ^TGVirConfigDomainClockOffset;
  TGVirConfigDomainClockOffset =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_CLOCK_UTC = 0;
    GVIR_CONFIG_DOMAIN_CLOCK_LOCALTIME = 1;
    GVIR_CONFIG_DOMAIN_CLOCK_TIMEZONE = 2;
    GVIR_CONFIG_DOMAIN_CLOCK_VARIABLE = 3;
;

function gvir_config_domain_clock_get_type:TGType;cdecl;external;
function gvir_config_domain_clock_new:PGVirConfigDomainClock;cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_clock_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainClock;cdecl;external;
function gvir_config_domain_clock_get_offset(klock:PGVirConfigDomainClock):TGVirConfigDomainClockOffset;cdecl;external;
procedure gvir_config_domain_clock_set_offset(klock:PGVirConfigDomainClock; offset:TGVirConfigDomainClockOffset);cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_clock_get_timezone(klock:PGVirConfigDomainClock):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gvir_config_domain_clock_set_timezone(klock:PGVirConfigDomainClock; tz:Pchar);cdecl;external;
function gvir_config_domain_clock_get_variable_offset(klock:PGVirConfigDomainClock):Tgint;cdecl;external;
procedure gvir_config_domain_clock_set_variable_offset(klock:PGVirConfigDomainClock; seconds:Tgint);cdecl;external;
procedure gvir_config_domain_clock_add_timer(klock:PGVirConfigDomainClock; timer:PGVirConfigDomainTimer);cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_CLOCK : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_DOMAIN_CLOCK:=gvir_config_domain_clock_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CLOCK(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_CLOCK:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_DOMAIN_CLOCK,GVirConfigDomainClock);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CLOCK_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_CLOCK_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_DOMAIN_CLOCK,GVirConfigDomainClockClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_CLOCK(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_CLOCK:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_DOMAIN_CLOCK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_CLOCK_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_CLOCK_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_DOMAIN_CLOCK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_CLOCK_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_CLOCK_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_DOMAIN_CLOCK,GVirConfigDomainClockClass);
end;


end.
