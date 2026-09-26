
unit atspi_application;
interface

{
  Automatically converted by H2Pas 1.0.0 from atspi_application.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    atspi_application.h
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
PAtspiAccessible  = ^AtspiAccessible;
PAtspiApplication  = ^AtspiApplication;
PAtspiApplicationClass  = ^AtspiApplicationClass;
Pchar  = ^char;
PDBusConnection  = ^DBusConnection;
Pgchar  = ^gchar;
PGHashTable  = ^GHashTable;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * AT-SPI - Assistive Technology Service Provider Interface
 * (Gnome Accessibility Project; http://developer.gnome.org/projects/gap)
 *
 * Copyright 2002 Ximian, Inc.
 *           2002 Sun Microsystems Inc.
 *
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
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef _ATSPI_APPLICATION_H_}
{$define _ATSPI_APPLICATION_H_}
{$include <dbus/dbus.h>}
{$include "atspi-accessible.h"}
{$include "atspi-types.h"}
{$include <sys/time.h>}

{ was #define dname def_expr }
function ATSPI_TYPE_APPLICATION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_APPLICATION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_APPLICATION_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_APPLICATION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_APPLICATION_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_APPLICATION_GET_CLASS(obj : longint) : longint;

type
  PAtspiApplication = ^TAtspiApplication;
  TAtspiApplication = record
      parent : TGObject;
      hash : PGHashTable;
      bus_name : Pchar;
      bus : PDBusConnection;
      root : PAtspiAccessible;
      cache : TAtspiCache;
      toolkit_name : Pgchar;
      toolkit_version : Pgchar;
      atspi_version : Pgchar;
      time_added : Ttimeval;
    end;

  PAtspiApplicationClass = ^TAtspiApplicationClass;
  TAtspiApplicationClass = record
      parent_class : TGObjectClass;
    end;

(* Const before type ignored *)

function _atspi_application_new(bus_name:Pchar):PAtspiApplication;cdecl;external;
function atspi_application_get_type:TGType;cdecl;external;
{$endif}
{ _ATSPI_APPLICATION_H_  }

implementation

{ was #define dname def_expr }
function ATSPI_TYPE_APPLICATION : longint; { return type might be wrong }
  begin
    ATSPI_TYPE_APPLICATION:=atspi_application_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_APPLICATION(obj : longint) : longint;
begin
  ATSPI_APPLICATION:=G_TYPE_CHECK_INSTANCE_CAST(obj,ATSPI_TYPE_APPLICATION,AtspiApplication);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_APPLICATION_CLASS(klass : longint) : longint;
begin
  ATSPI_APPLICATION_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,ATSPI_TYPE_APPLICATION,AtspiAccessibleClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_APPLICATION(obj : longint) : longint;
begin
  ATSPI_IS_APPLICATION:=G_TYPE_CHECK_INSTANCE_TYPE(obj,ATSPI_TYPE_APPLICATION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_APPLICATION_CLASS(klass : longint) : longint;
begin
  ATSPI_IS_APPLICATION_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,ATSPI_TYPE_APPLICATION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_APPLICATION_GET_CLASS(obj : longint) : longint;
begin
  ATSPI_APPLICATION_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,ATSPI_TYPE_APPLICATION,AtspiAccessibleClass);
end;


end.
