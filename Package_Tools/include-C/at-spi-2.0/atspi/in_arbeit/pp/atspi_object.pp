
unit atspi_object;
interface

{
  Automatically converted by H2Pas 1.0.0 from atspi_object.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    atspi_object.h
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
PAtspiApplication  = ^AtspiApplication;
PAtspiObject  = ^AtspiObject;
PAtspiObjectClass  = ^AtspiObjectClass;
Pchar  = ^char;
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
{$ifndef _ATSPI_OBJECT_H_}
{$define _ATSPI_OBJECT_H_}
{$include "glib-object.h"}
{$include "atspi-application.h"}
{$include "atspi-types.h"}

{ was #define dname def_expr }
function ATSPI_TYPE_OBJECT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_OBJECT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_OBJECT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_OBJECT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_OBJECT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_OBJECT_GET_CLASS(obj : longint) : longint;

type
  PAtspiObject = ^TAtspiObject;
  TAtspiObject = record
      parent : TGObject;
      app : PAtspiApplication;
      path : Pchar;
    end;

  PAtspiObjectClass = ^TAtspiObjectClass;
  TAtspiObjectClass = record
      parent_class : TGObjectClass;
    end;


function atspi_object_get_type:TGType;cdecl;external;
{$endif}
{ _ATSPI_OBJECT_H_  }

implementation

{ was #define dname def_expr }
function ATSPI_TYPE_OBJECT : longint; { return type might be wrong }
  begin
    ATSPI_TYPE_OBJECT:=atspi_object_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_OBJECT(obj : longint) : longint;
begin
  ATSPI_OBJECT:=G_TYPE_CHECK_INSTANCE_CAST(obj,ATSPI_TYPE_OBJECT,AtspiObject);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_OBJECT_CLASS(klass : longint) : longint;
begin
  ATSPI_OBJECT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,ATSPI_TYPE_OBJECT,AtspiObjectClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_OBJECT(obj : longint) : longint;
begin
  ATSPI_IS_OBJECT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,ATSPI_TYPE_OBJECT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_OBJECT_CLASS(klass : longint) : longint;
begin
  ATSPI_IS_OBJECT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,ATSPI_TYPE_OBJECT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_OBJECT_GET_CLASS(obj : longint) : longint;
begin
  ATSPI_OBJECT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,ATSPI_TYPE_OBJECT,AtspiObjectClass);
end;


end.
