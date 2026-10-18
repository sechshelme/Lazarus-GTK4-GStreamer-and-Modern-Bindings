
unit libvirt_gobject_manager;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_gobject_manager.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_gobject_manager.h
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
PGList  = ^GList;
PGVirConnection  = ^GVirConnection;
PGVirManager  = ^GVirManager;
PGVirManagerClass  = ^GVirManagerClass;
PGVirManagerPrivate  = ^GVirManagerPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-gobject-manager.h: libvirt gobject integration
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
{$if !defined(__LIBVIRT_GOBJECT_H__) && !defined(LIBVIRT_GOBJECT_BUILD)}
{$error "Only <libvirt-gobject/libvirt-gobject.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)

{ was #define dname def_expr }
function GVIR_TYPE_MANAGER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_MANAGER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_MANAGER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_MANAGER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_MANAGER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_MANAGER_GET_CLASS(obj : longint) : longint;

type
{ Do not add fields to this struct  }
  PGVirManager = ^TGVirManager;
  TGVirManager = record
      parent : TGObject;
      priv : PGVirManagerPrivate;
    end;

{ Signals  }
  PGVirManagerClass = ^TGVirManagerClass;
  TGVirManagerClass = record
      parent_class : TGObjectClass;
      connection_added : procedure (man:PGVirManager; conn:PGVirConnection);cdecl;
      connection_removed : procedure (man:PGVirManager; conn:PGVirConnection);cdecl;
      padding : array[0..19] of Tgpointer;
    end;


function gvir_manager_get_type:TGType;cdecl;external;
function gvir_manager_new:PGVirManager;cdecl;external;
procedure gvir_manager_add_connection(man:PGVirManager; conn:PGVirConnection);cdecl;external;
procedure gvir_manager_remove_connection(man:PGVirManager; conn:PGVirConnection);cdecl;external;
function gvir_manager_get_connections(man:PGVirManager):PGList;cdecl;external;
(* Const before type ignored *)
function gvir_manager_find_connection_by_uri(man:PGVirManager; uri:Pgchar):PGVirConnection;cdecl;external;

implementation

{ was #define dname def_expr }
function GVIR_TYPE_MANAGER : longint; { return type might be wrong }
  begin
    GVIR_TYPE_MANAGER:=gvir_manager_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_MANAGER(obj : longint) : longint;
begin
  GVIR_MANAGER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GVIR_TYPE_MANAGER,GVirManager);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_MANAGER_CLASS(klass : longint) : longint;
begin
  GVIR_MANAGER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GVIR_TYPE_MANAGER,GVirManagerClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_MANAGER(obj : longint) : longint;
begin
  GVIR_IS_MANAGER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GVIR_TYPE_MANAGER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_IS_MANAGER_CLASS(klass : longint) : longint;
begin
  GVIR_IS_MANAGER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GVIR_TYPE_MANAGER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GVIR_MANAGER_GET_CLASS(obj : longint) : longint;
begin
  GVIR_MANAGER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GVIR_TYPE_MANAGER,GVirManagerClass);
end;


end.
