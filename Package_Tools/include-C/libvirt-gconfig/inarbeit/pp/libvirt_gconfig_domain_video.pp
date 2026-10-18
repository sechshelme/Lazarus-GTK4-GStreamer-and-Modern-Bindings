
unit libvirt_gconfig_domain_video;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gconfig_domain_video.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gconfig_domain_video.h
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
Pgchar  = ^gchar;
PGError  = ^GError;
PGVirConfigDomainVideo  = ^GVirConfigDomainVideo;
PGVirConfigDomainVideoClass  = ^GVirConfigDomainVideoClass;
PGVirConfigDomainVideoModel  = ^GVirConfigDomainVideoModel;
PGVirConfigDomainVideoPrivate  = ^GVirConfigDomainVideoPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gconfig-domain-video.h: libvirt domain video configuration
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
function GVIR_CONFIG_TYPE_DOMAIN_VIDEO : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_VIDEO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_VIDEO_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_VIDEO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_VIDEO_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_VIDEO_GET_CLASS(obj : longint) : longint;

type
{ Do not add fields to this struct  }
  PGVirConfigDomainVideo = ^TGVirConfigDomainVideo;
  TGVirConfigDomainVideo = record
      parent : TGVirConfigDomainDevice;
      priv : PGVirConfigDomainVideoPrivate;
    end;

  PGVirConfigDomainVideoClass = ^TGVirConfigDomainVideoClass;
  TGVirConfigDomainVideoClass = record
      parent_class : TGVirConfigDomainDeviceClass;
      padding : array[0..19] of Tgpointer;
    end;


  PGVirConfigDomainVideoModel = ^TGVirConfigDomainVideoModel;
  TGVirConfigDomainVideoModel =  Longint;
  Const
    GVIR_CONFIG_DOMAIN_VIDEO_MODEL_VGA = 0;
    GVIR_CONFIG_DOMAIN_VIDEO_MODEL_CIRRUS = 1;
    GVIR_CONFIG_DOMAIN_VIDEO_MODEL_VMVGA = 2;
    GVIR_CONFIG_DOMAIN_VIDEO_MODEL_XEN = 3;
    GVIR_CONFIG_DOMAIN_VIDEO_MODEL_VBOX = 4;
    GVIR_CONFIG_DOMAIN_VIDEO_MODEL_QXL = 5;
    GVIR_CONFIG_DOMAIN_VIDEO_MODEL_VIRTIO = 6;
    GVIR_CONFIG_DOMAIN_VIDEO_MODEL_BOCHS = 7;
;

function gvir_config_domain_video_get_type:TGType;cdecl;external;
function gvir_config_domain_video_new:PGVirConfigDomainVideo;cdecl;external;
(* Const before type ignored *)
function gvir_config_domain_video_new_from_xml(xml:Pgchar; error:PPGError):PGVirConfigDomainVideo;cdecl;external;
function gvir_config_domain_video_get_model(video:PGVirConfigDomainVideo):TGVirConfigDomainVideoModel;cdecl;external;
procedure gvir_config_domain_video_set_model(video:PGVirConfigDomainVideo; model:TGVirConfigDomainVideoModel);cdecl;external;
procedure gvir_config_domain_video_set_vram(video:PGVirConfigDomainVideo; kbytes:Tguint);cdecl;external;
procedure gvir_config_domain_video_set_ram(video:PGVirConfigDomainVideo; kbytes:Tguint);cdecl;external;
procedure gvir_config_domain_video_set_vgamem(video:PGVirConfigDomainVideo; kbytes:Tguint);cdecl;external;
procedure gvir_config_domain_video_set_heads(video:PGVirConfigDomainVideo; head_count:Tguint);cdecl;external;
procedure gvir_config_domain_video_set_accel3d(video:PGVirConfigDomainVideo; accel3d:Tgboolean);cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_CONFIG_TYPE_DOMAIN_VIDEO : longint; { return type might be wrong }
  begin
    GVIR_CONFIG_TYPE_DOMAIN_VIDEO:=gvir_config_domain_video_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_VIDEO(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_VIDEO:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_CONFIG_TYPE_DOMAIN_VIDEO,GVirConfigDomainVideo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_VIDEO_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_VIDEO_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_CONFIG_TYPE_DOMAIN_VIDEO,GVirConfigDomainVideoClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_VIDEO(obj : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_VIDEO:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_CONFIG_TYPE_DOMAIN_VIDEO);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_IS_DOMAIN_VIDEO_CLASS(klass : longint) : longint;
begin
  GVIR_CONFIG_IS_DOMAIN_VIDEO_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_CONFIG_TYPE_DOMAIN_VIDEO);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_CONFIG_DOMAIN_VIDEO_GET_CLASS(obj : longint) : longint;
begin
  GVIR_CONFIG_DOMAIN_VIDEO_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_CONFIG_TYPE_DOMAIN_VIDEO,GVirConfigDomainVideoClass);
end;


end.
