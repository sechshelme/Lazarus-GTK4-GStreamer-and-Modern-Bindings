unit libvirt_gconfig_domain_graphics_spice;

interface

uses
  fp_glib2, fp_virtgconfig;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-graphics-spice.h: libvirt domain SPICE confiiguration
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
 * Authors: Christophe Fergeau <cfergeau@gmail.com>
 *          Zeeshan Ali (Khattak) <zeeshanak@gnome.org>
  }
{$if !defined(__LIBVIRT_GCONFIG_H__) && !defined(LIBVIRT_GCONFIG_BUILD)}
{$error "Only <libvirt-gconfig/libvirt-gconfig.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)

type
{ Do not add fields to this struct  }
  PGVirConfigDomainGraphicsSpice = ^TGVirConfigDomainGraphicsSpice;
  TGVirConfigDomainGraphicsSpice = record
      parent : TGVirConfigDomainGraphics;
      priv : PGVirConfigDomainGraphicsSpicePrivate;
    end;

  PGVirConfigDomainGraphicsSpiceClass = ^TGVirConfigDomainGraphicsSpiceClass;
  TGVirConfigDomainGraphicsSpiceClass = record
      parent_class : TGVirConfigDomainGraphicsClass;
      padding : array[0..19] of Tgpointer;
    end;

{< nick=auto_glz > }
{< nick=auto_lz > }

  PGVirConfigDomainGraphicsSpiceImageCompression = ^TGVirConfigDomainGraphicsSpiceImageCompression;
  TGVirConfigDomainGraphicsSpiceImageCompression =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE_IMAGE_COMPRESSION_AUTO_GLZ = 0;
    GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE_IMAGE_COMPRESSION_AUTO_LZ = 1;
    GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE_IMAGE_COMPRESSION_QUIC = 2;
    GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE_IMAGE_COMPRESSION_GLZ = 3;
    GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE_IMAGE_COMPRESSION_LZ = 4;
    GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE_IMAGE_COMPRESSION_OFF = 5;
;

function gvir_config_domain_graphics_spice_get_type:TGType;cdecl;external libvirtgconfig;
function gvir_config_domain_graphics_spice_new:PGVirConfigDomainGraphicsSpice;cdecl;external libvirtgconfig;
function gvir_config_domain_graphics_spice_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainGraphicsSpice;cdecl;external libvirtgconfig;
procedure gvir_config_domain_graphics_spice_set_autoport(graphics:PGVirConfigDomainGraphicsSpice; autoport:Tgboolean);cdecl;external libvirtgconfig;
procedure gvir_config_domain_graphics_spice_set_password(graphics:PGVirConfigDomainGraphicsSpice; password:Pchar);cdecl;external libvirtgconfig;
function gvir_config_domain_graphics_spice_get_port(graphics:PGVirConfigDomainGraphicsSpice):longint;cdecl;external libvirtgconfig;
procedure gvir_config_domain_graphics_spice_set_port(graphics:PGVirConfigDomainGraphicsSpice; port:longint);cdecl;external libvirtgconfig;
procedure gvir_config_domain_graphics_spice_set_tls_port(graphics:PGVirConfigDomainGraphicsSpice; port:longint);cdecl;external libvirtgconfig;
procedure gvir_config_domain_graphics_spice_set_image_compression(graphics:PGVirConfigDomainGraphicsSpice; compression:TGVirConfigDomainGraphicsSpiceImageCompression);cdecl;external libvirtgconfig;
function gvir_config_domain_graphics_spice_get_image_compression(graphics:PGVirConfigDomainGraphicsSpice):longint;cdecl;external libvirtgconfig;
procedure gvir_config_domain_graphics_spice_set_gl(graphics:PGVirConfigDomainGraphicsSpice; gl:Tgboolean);cdecl;external libvirtgconfig;

// === Konventiert am: 18-10-26 12:43:40 ===

function GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SPICE : TGType;
function GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE(obj : Pointer) : PGVirConfigDomainGraphicsSpice;
function GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE_CLASS(klass : Pointer) : PGVirConfigDomainGraphicsSpiceClass;
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_SPICE(obj : Pointer) : Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_SPICE_CLASS(klass : Pointer) : Tgboolean;
function GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE_GET_CLASS(obj : Pointer) : PGVirConfigDomainGraphicsSpiceClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SPICE : TGType;
  begin
    GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SPICE:=gvir_config_domain_graphics_spice_get_type;
  end;

function GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE(obj : Pointer) : PGVirConfigDomainGraphicsSpice;
begin
  Result := PGVirConfigDomainGraphicsSpice(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SPICE));
end;

function GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE_CLASS(klass : Pointer) : PGVirConfigDomainGraphicsSpiceClass;
begin
  Result := PGVirConfigDomainGraphicsSpiceClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SPICE));
end;

function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_SPICE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SPICE);
end;

function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_SPICE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SPICE);
end;

function GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE_GET_CLASS(obj : Pointer) : PGVirConfigDomainGraphicsSpiceClass;
begin
  Result := PGVirConfigDomainGraphicsSpiceClass(PGTypeInstance(obj)^.g_class);
end;



end.
