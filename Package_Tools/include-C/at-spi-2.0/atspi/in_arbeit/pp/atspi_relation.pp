
unit atspi_relation;
interface

{
  Automatically converted by H2Pas 1.0.0 from atspi_relation.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    atspi_relation.h
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
PAtspiRelation  = ^AtspiRelation;
PAtspiRelationClass  = ^AtspiRelationClass;
PDBusMessageIter  = ^DBusMessageIter;
PGArray  = ^GArray;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * AT-SPI - Assistive Technology Service Provider Interface
 * (Gnome Accessibility Project; http://developer.gnome.org/projects/gap)
 *
 * Copyright 2002 Ximian, Inc.
 *           2002 Sun Microsystems Inc.
 * Copyright 2010, 2011 Novell, Inc.
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
{$ifndef _ATSPI_RELATION_H_}
{$define _ATSPI_RELATION_H_}
{$include "glib-object.h"}
{$include "atspi-constants.h"}

{ was #define dname def_expr }
function ATSPI_TYPE_RELATION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_RELATION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_RELATION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_RELATION_GET_IFACE(obj : longint) : longint;

function atspi_relation_get_type:TGType;cdecl;external;
type
  PAtspiRelation = ^TAtspiRelation;
  TAtspiRelation = record
      parent : TGObject;
      relation_type : TAtspiRelationType;
      targets : PGArray;
    end;

  PAtspiRelationClass = ^TAtspiRelationClass;
  TAtspiRelationClass = record
      parent_class : TGObjectClass;
    end;


function atspi_relation_get_relation_type(obj:PAtspiRelation):TAtspiRelationType;cdecl;external;
function atspi_relation_get_n_targets(obj:PAtspiRelation):Tgint;cdecl;external;
function atspi_relation_get_target(obj:PAtspiRelation; i:Tgint):PAtspiAccessible;cdecl;external;
{ private  }
function _atspi_relation_new_from_iter(iter:PDBusMessageIter):PAtspiRelation;cdecl;external;
{$endif}
{ _ATSPI_RELATION_H_  }

implementation

{ was #define dname def_expr }
function ATSPI_TYPE_RELATION : longint; { return type might be wrong }
  begin
    ATSPI_TYPE_RELATION:=atspi_relation_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_RELATION(obj : longint) : longint;
begin
  ATSPI_RELATION:=G_TYPE_CHECK_INSTANCE_CAST(obj,ATSPI_TYPE_RELATION,AtspiRelation);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_RELATION(obj : longint) : longint;
begin
  ATSPI_IS_RELATION:=G_TYPE_CHECK_INSTANCE_TYPE(obj,ATSPI_TYPE_RELATION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_RELATION_GET_IFACE(obj : longint) : longint;
begin
  ATSPI_RELATION_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,ATSPI_TYPE_RELATION,AtspiRelation);
end;


end.
