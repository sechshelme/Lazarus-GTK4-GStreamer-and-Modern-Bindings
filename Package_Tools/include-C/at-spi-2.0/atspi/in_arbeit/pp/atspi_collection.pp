
unit atspi_collection;
interface

{
  Automatically converted by H2Pas 1.0.0 from atspi_collection.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    atspi_collection.h
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
PAtspiCollection  = ^AtspiCollection;
PAtspiMatchRule  = ^AtspiMatchRule;
PGArray  = ^GArray;
PGError  = ^GError;
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
{$ifndef _ATSPI_COLLECTION_H_}
{$define _ATSPI_COLLECTION_H_}
{$include "glib-object.h"}
{$include "atspi-constants.h"}
{$include "atspi-matchrule.h"}
{$include "atspi-types.h"}

{ was #define dname def_expr }
function ATSPI_TYPE_COLLECTION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_COLLECTION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_COLLECTION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_COLLECTION_GET_IFACE(obj : longint) : longint;

function atspi_collection_get_type:TGType;cdecl;external;
type
  PAtspiCollection = ^TAtspiCollection;
  TAtspiCollection = record
      parent : TGTypeInterface;
    end;


function atspi_collection_is_ancestor_of(collection:PAtspiCollection; test:PAtspiAccessible; error:PPGError):Tgboolean;cdecl;external;
function atspi_collection_get_matches(collection:PAtspiCollection; rule:PAtspiMatchRule; sortby:TAtspiCollectionSortOrder; count:Tgint; traverse:Tgboolean; 
           error:PPGError):PGArray;cdecl;external;
function atspi_collection_get_matches_to(collection:PAtspiCollection; current_object:PAtspiAccessible; rule:PAtspiMatchRule; sortby:TAtspiCollectionSortOrder; tree:TAtspiCollectionTreeTraversalType; 
           limit_scope:Tgboolean; count:Tgint; traverse:Tgboolean; error:PPGError):PGArray;cdecl;external;
function atspi_collection_get_matches_from(collection:PAtspiCollection; current_object:PAtspiAccessible; rule:PAtspiMatchRule; sortby:TAtspiCollectionSortOrder; tree:TAtspiCollectionTreeTraversalType; 
           count:Tgint; traverse:Tgboolean; error:PPGError):PGArray;cdecl;external;
function atspi_collection_get_active_descendant(collection:PAtspiCollection; error:PPGError):PAtspiAccessible;cdecl;external;
{$endif}
{ _ATSPI_COLLECTION_H_  }

implementation

{ was #define dname def_expr }
function ATSPI_TYPE_COLLECTION : longint; { return type might be wrong }
  begin
    ATSPI_TYPE_COLLECTION:=atspi_collection_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_COLLECTION(obj : longint) : longint;
begin
  ATSPI_IS_COLLECTION:=G_TYPE_CHECK_INSTANCE_TYPE(obj,ATSPI_TYPE_COLLECTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_COLLECTION(obj : longint) : longint;
begin
  ATSPI_COLLECTION:=G_TYPE_CHECK_INSTANCE_CAST(obj,ATSPI_TYPE_COLLECTION,AtspiCollection);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_COLLECTION_GET_IFACE(obj : longint) : longint;
begin
  ATSPI_COLLECTION_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,ATSPI_TYPE_COLLECTION,AtspiCollection);
end;


end.
