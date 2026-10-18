unit libvirt_gobject_manager;

interface

uses
  fp_glib2, fp_virt_glib;

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


function gvir_manager_get_type:TGType;cdecl;external libvirtgobject;
function gvir_manager_new:PGVirManager;cdecl;external libvirtgobject;
procedure gvir_manager_add_connection(man:PGVirManager; conn:PGVirConnection);cdecl;external libvirtgobject;
procedure gvir_manager_remove_connection(man:PGVirManager; conn:PGVirConnection);cdecl;external libvirtgobject;
function gvir_manager_get_connections(man:PGVirManager):PGList;cdecl;external libvirtgobject;
function gvir_manager_find_connection_by_uri(man:PGVirManager; uri:Pgchar):PGVirConnection;cdecl;external libvirtgobject;

// === Konventiert am: 18-10-26 19:32:12 ===

function GVIR_TYPE_MANAGER : TGType;
function GVIR_MANAGER(obj : Pointer) : PGVirManager;
function GVIR_MANAGER_CLASS(klass : Pointer) : PGVirManagerClass;
function GVIR_IS_MANAGER(obj : Pointer) : Tgboolean;
function GVIR_IS_MANAGER_CLASS(klass : Pointer) : Tgboolean;
function GVIR_MANAGER_GET_CLASS(obj : Pointer) : PGVirManagerClass;

implementation

function GVIR_TYPE_MANAGER : TGType;
  begin
    GVIR_TYPE_MANAGER:=gvir_manager_get_type;
  end;

function GVIR_MANAGER(obj : Pointer) : PGVirManager;
begin
  Result := PGVirManager(g_type_check_instance_cast(obj, GVIR_TYPE_MANAGER));
end;

function GVIR_MANAGER_CLASS(klass : Pointer) : PGVirManagerClass;
begin
  Result := PGVirManagerClass(g_type_check_class_cast(klass, GVIR_TYPE_MANAGER));
end;

function GVIR_IS_MANAGER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GVIR_TYPE_MANAGER);
end;

function GVIR_IS_MANAGER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GVIR_TYPE_MANAGER);
end;

function GVIR_MANAGER_GET_CLASS(obj : Pointer) : PGVirManagerClass;
begin
  Result := PGVirManagerClass(PGTypeInstance(obj)^.g_class);
end;



end.
