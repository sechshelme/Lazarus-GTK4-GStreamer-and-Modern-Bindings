
unit libvirt_gobject_stream;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gobject_stream.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gobject_stream.h
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
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGError  = ^GError;
PGVirStream  = ^GVirStream;
PGVirStreamClass  = ^GVirStreamClass;
PGVirStreamIOCondition  = ^GVirStreamIOCondition;
PGVirStreamPrivate  = ^GVirStreamPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gobject-stream.h: libvirt gobject integration
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
 * Authors: Daniel P. Berrange <berrange@redhat.com>
 *          Marc-André Lureau <marcandre.lureau@redhat.com>
  }
{$if !defined(__LIBVIRT_GOBJECT_H__) && !defined(LIBVIRT_GOBJECT_BUILD)}
{$error "Only <libvirt-gobject/libvirt-gobject.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)
{$include <glib-object.h>}
{$include <gio/gio.h>}

{ was #define dname def_expr }
function GVIR_TYPE_STREAM : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_STREAM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_STREAM_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_STREAM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_STREAM_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_STREAM_GET_CLASS(obj : longint) : longint;

{ was #define dname def_expr }
function GVIR_TYPE_STREAM_HANDLE : longint; { return type might be wrong }

type
{ Do not add fields to this struct  }
  PGVirStream = ^TGVirStream;
  TGVirStream = record
      parent_instance : TGIOStream;
      priv : PGVirStreamPrivate;
    end;

  PGVirStreamClass = ^TGVirStreamClass;
  TGVirStreamClass = record
      parent_class : TGIOStreamClass;
      padding : array[0..19] of Tgpointer;
    end;

{*
 * GVirStreamSinkFunc:
 * @stream: a #GVirStream
 * @buf: (out) (array length=nbytes) (transfer none): data pointer
 * @nbytes: data size
 * @user_data: user data passed to the function
 *
 * Returns: the number of bytes filled, 0 upon end
 * of file, or -1 upon error
  }
(* Const before type ignored *)

  TGVirStreamSinkFunc = function (stream:PGVirStream; buf:Pgchar; nbytes:Tgsize; user_data:Tgpointer):Tgint;cdecl;
{*
 * GVirStreamSourceFunc:
 * @stream: a #GVirStream
 * @buf: (out) (array length=nbytes) (transfer none): data pointer
 * @nbytes: data size
 * @user_data: user data passed to the function
 *
 * Returns: the number of bytes filled, 0 upon end
 * of file, or -1 upon error
  }

  TGVirStreamSourceFunc = function (stream:PGVirStream; buf:Pgchar; nbytes:Tgsize; user_data:Tgpointer):Tgint;cdecl;

function gvir_stream_get_type:TGType;cdecl;external;
function gvir_stream_handle_get_type:TGType;cdecl;external;
type
  PGVirStreamIOCondition = ^TGVirStreamIOCondition;
  TGVirStreamIOCondition =  Longint;
  Const
    GVIR_STREAM_IO_CONDITION_READABLE = 1 shl 0;
    GVIR_STREAM_IO_CONDITION_WRITABLE = 1 shl 1;
    GVIR_STREAM_IO_CONDITION_HANGUP = 1 shl 2;
    GVIR_STREAM_IO_CONDITION_ERROR = 1 shl 3;
;
type

  TGVirStreamIOFunc = function (stream:PGVirStream; cond:TGVirStreamIOCondition; opaque:Tgpointer):Tgboolean;cdecl;

function gvir_stream_add_watch(stream:PGVirStream; cond:TGVirStreamIOCondition; func:TGVirStreamIOFunc; opaque:Tgpointer):Tguint;cdecl;external;
function gvir_stream_add_watch_full(stream:PGVirStream; priority:Tgint; cond:TGVirStreamIOCondition; func:TGVirStreamIOFunc; opaque:Tgpointer; 
           notify:TGDestroyNotify):Tguint;cdecl;external;
function gvir_stream_receive_all(stream:PGVirStream; cancellable:PGCancellable; func:TGVirStreamSinkFunc; user_data:Tgpointer; error:PPGError):Tgssize;cdecl;external;
function gvir_stream_receive(stream:PGVirStream; buffer:Pgchar; size:Tgsize; cancellable:PGCancellable; error:PPGError):Tgssize;cdecl;external;
function gvir_stream_send_all(stream:PGVirStream; cancellable:PGCancellable; func:TGVirStreamSourceFunc; user_data:Tgpointer; error:PPGError):Tgssize;cdecl;external;
(* Const before type ignored *)
function gvir_stream_send(stream:PGVirStream; buffer:Pgchar; size:Tgsize; cancellable:PGCancellable; error:PPGError):Tgssize;cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_TYPE_STREAM : longint; { return type might be wrong }
  begin
    GVIR_TYPE_STREAM:=gvir_stream_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_STREAM(obj : longint) : longint;
begin
  GVIR_STREAM:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_TYPE_STREAM,GVirStream);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_STREAM_CLASS(klass : longint) : longint;
begin
  GVIR_STREAM_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_TYPE_STREAM,GVirStreamClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_STREAM(obj : longint) : longint;
begin
  GVIR_IS_STREAM:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_TYPE_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_STREAM_CLASS(klass : longint) : longint;
begin
  GVIR_IS_STREAM_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_TYPE_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_STREAM_GET_CLASS(obj : longint) : longint;
begin
  GVIR_STREAM_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_TYPE_STREAM,GVirStreamClass);
end;

{ was #define dname def_expr }
function GVIR_TYPE_STREAM_HANDLE : longint; { return type might be wrong }
  begin
    GVIR_TYPE_STREAM_HANDLE:=gvir_stream_handle_get_type;
  end;


end.
