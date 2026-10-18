
unit libvirt_gconfig_domain_timer;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_domain_timer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_domain_timer
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
PGVirConfigDomainTimer  = ^GVirConfigDomainTimer;
PGVirConfigDomainTimerClass  = ^GVirConfigDomainTimerClass;
PGVirConfigDomainTimerPrivate  = ^GVirConfigDomainTimerPrivate;
PGVirConfigDomainTimerTickPolicy  = ^GVirConfigDomainTimerTickPolicy;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-timer.h: libvirt domain timer configuration
 *
 * Copyright (C) 2011, 2014 Red Hat, Inc.
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
function GVIR_CONFIG_TYPE_DOMAIN_TIMER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_TIMER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_TIMER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_TIMER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_TIMER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_TIMER_GET_CLASS(obj : longint) : longint;

type
{ Do not add fields to this struct  }
  PGVirConfigDomainTimer = ^TGVirConfigDomainTimer;
  TGVirConfigDomainTimer = record
      parent : TGVirConfigObject;
      priv : PGVirConfigDomainTimerPrivate;
    end;

  PGVirConfigDomainTimerClass = ^TGVirConfigDomainTimerClass;
  TGVirConfigDomainTimerClass = record
      parent_class : TGVirConfigObjectClass;
      padding : array[0..19] of Tgpointer;
    end;


  PGVirConfigDomainTimerTickPolicy = ^TGVirConfigDomainTimerTickPolicy;
  TGVirConfigDomainTimerTickPolicy =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_TIMER_TICK_POLICY_DELAY = 0;
    GVIR_CONFIG_DOMAIN_TIMER_TICK_POLICY_CATCHUP = 1;
    GVIR_CONFIG_DOMAIN_TIMER_TICK_POLICY_MERGE = 2;
    GVIR_CONFIG_DOMAIN_TIMER_TICK_POLICY_DISCARD = 3;
;

function gvir_config_domain_timer_get_type:TGType;cdecl;external;
function gvir_config_domain_timer_get_tick_policy(timer:PGVirConfigDomainTimer):TGVirConfigDomainTimerTickPolicy;cdecl;external;
procedure gvir_config_domain_timer_set_tick_policy(timer:PGVirConfigDomainTimer; policy:TGVirConfigDomainTimerTickPolicy);cdecl;external;
function gvir_config_domain_timer_get_present(timer:PGVirConfigDomainTimer):Tgboolean;cdecl;external;
procedure gvir_config_domain_timer_set_present(timer:PGVirConfigDomainTimer; present:Tgboolean);cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_TIMER : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_DOMAIN_TIMER:=gvir_config_domain_timer_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_TIMER(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_TIMER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_DOMAIN_TIMER,GVirConfigDomainTimer);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_TIMER_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_TIMER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_DOMAIN_TIMER,GVirConfigDomainTimerClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_TIMER(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_TIMER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_DOMAIN_TIMER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_TIMER_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_TIMER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_DOMAIN_TIMER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_TIMER_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_TIMER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_DOMAIN_TIMER,GVirConfigDomainTimerClass);
end;


end.
