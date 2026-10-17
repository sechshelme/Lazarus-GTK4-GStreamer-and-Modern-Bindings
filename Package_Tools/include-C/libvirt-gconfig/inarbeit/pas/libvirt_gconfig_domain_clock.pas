unit libvirt_gconfig_domain_clock;

interface

uses
  fp_glib2, fp_virtgconfig;

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

function gvir_config_domain_clock_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_domain_clock_new:PGVirConfigDomainClock;cdecl;external libvirtgconfig;
function gvir_config_domain_clock_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainClock;cdecl;external libvirtgconfig;
function gvir_config_domain_clock_get_offset(klock:PGVirConfigDomainClock):TGVirConfigDomainClockOffset;cdecl;external libvirtgconfig;
procedure gvir_config_domain_clock_set_offset(klock:PGVirConfigDomainClock; offset:TGVirConfigDomainClockOffset);cdecl;external libvirtgconfig;
function gvir_config_domain_clock_get_timezone(klock:PGVirConfigDomainClock):Pchar;cdecl;external libvirtgconfig;
procedure gvir_config_domain_clock_set_timezone(klock:PGVirConfigDomainClock; tz:Pchar);cdecl;external libvirtgconfig;
function gvir_config_domain_clock_get_variable_offset(klock:PGVirConfigDomainClock):Tgint;cdecl;external libvirtgconfig;
procedure gvir_config_domain_clock_set_variable_offset(klock:PGVirConfigDomainClock; seconds:Tgint);cdecl;external libvirtgconfig;
procedure gvir_config_domain_clock_add_timer(klock:PGVirConfigDomainClock; timer:PGVirConfigDomainTimer);cdecl;external libvirtgconfig;

// === Konventiert am: 17-10-26 19:59:52 ===

function GVIR_CONFIG_TYPE_DOMAIN_CLOCK : TGType;
function GVIR_CONFIG_DOMAIN_CLOCK(obj : Pointer) : PGVirConfigDomainClock;
function GVIR_CONFIG_DOMAIN_CLOCK_CLASS(klass : Pointer) : PGVirConfigDomainClockClass;
function GVIR_CONFIG_IS_DOMAIN_CLOCK(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_CLOCK_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_CLOCK_GET_CLASS(obj : Pointer) : PGVirConfigDomainClockClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_CLOCK : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_CLOCK:=gvir_config_domain_clock_get_type;
  end;

function GVIR_CONFIG_DOMAIN_CLOCK(obj : Pointer) : PGVirConfigDomainClock;
begin
  Result := PGVirConfigDomainClock(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_CLOCK));
end;

function GVIR_CONFIG_DOMAIN_CLOCK_CLASS(klass : Pointer) : PGVirConfigDomainClockClass;
begin
  Result := PGVirConfigDomainClockClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_CLOCK));
end;

function GVIR_CONFIG_IS_DOMAIN_CLOCK(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_CLOCK);
end;

function GVIR_CONFIG_IS_DOMAIN_CLOCK_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_CLOCK);
end;

function GVIR_CONFIG_DOMAIN_CLOCK_GET_CLASS(obj : Pointer) : PGVirConfigDomainClockClass;
begin
  Result := PGVirConfigDomainClockClass(PGTypeInstance(obj)^.g_class);
end;



end.
