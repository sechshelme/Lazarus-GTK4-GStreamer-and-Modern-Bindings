unit libvirt_gconfig_domain_graphics_sdl;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-graphics-sdl.h: libvirt domain SDL configuration
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
  PGVirConfigDomainGraphicsSdl = ^TGVirConfigDomainGraphicsSdl;
  TGVirConfigDomainGraphicsSdl = record
      parent : TGVirConfigDomainGraphics;
      priv : PGVirConfigDomainGraphicsSdlPrivate;
    end;

  PGVirConfigDomainGraphicsSdlClass = ^TGVirConfigDomainGraphicsSdlClass;
  TGVirConfigDomainGraphicsSdlClass = record
      parent_class : TGVirConfigDomainGraphicsClass;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_config_domain_graphics_sdl_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_domain_graphics_sdl_new:PGVirConfigDomainGraphicsSdl;cdecl;external libvirtgconfig;
function gvir_config_domain_graphics_sdl_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainGraphicsSdl;cdecl;external libvirtgconfig;
procedure gvir_config_domain_graphics_sdl_set_xauthority(graphics:PGVirConfigDomainGraphicsSdl; path:Pgchar);cdecl;external libvirtgconfig;
procedure gvir_config_domain_graphics_sdl_set_display(graphics:PGVirConfigDomainGraphicsSdl; disp:Pgchar);cdecl;external libvirtgconfig;
procedure gvir_config_domain_graphics_sdl_set_fullscreen(graphics:PGVirConfigDomainGraphicsSdl; fullscreen:Tgboolean);cdecl;external libvirtgconfig;

// === Konventiert am: 17-10-26 20:08:36 ===

function GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SDL : TGType;
function GVIR_CONFIG_DOMAIN_GRAPHICS_SDL(obj : Pointer) : PGVirConfigDomainGraphicsSdl;
function GVIR_CONFIG_DOMAIN_GRAPHICS_SDL_CLASS(klass : Pointer) : PGVirConfigDomainGraphicsSdlClass;
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_SDL(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_SDL_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_GRAPHICS_SDL_GET_CLASS(obj : Pointer) : PGVirConfigDomainGraphicsSdlClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SDL : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SDL:=gvir_config_domain_graphics_sdl_get_type;
  end;

function GVIR_CONFIG_DOMAIN_GRAPHICS_SDL(obj : Pointer) : PGVirConfigDomainGraphicsSdl;
begin
  Result := PGVirConfigDomainGraphicsSdl(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SDL));
end;

function GVIR_CONFIG_DOMAIN_GRAPHICS_SDL_CLASS(klass : Pointer) : PGVirConfigDomainGraphicsSdlClass;
begin
  Result := PGVirConfigDomainGraphicsSdlClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SDL));
end;

function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_SDL(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SDL);
end;

function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_SDL_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SDL);
end;

function GVIR_CONFIG_DOMAIN_GRAPHICS_SDL_GET_CLASS(obj : Pointer) : PGVirConfigDomainGraphicsSdlClass;
begin
  Result := PGVirConfigDomainGraphicsSdlClass(PGTypeInstance(obj)^.g_class);
end;



end.
