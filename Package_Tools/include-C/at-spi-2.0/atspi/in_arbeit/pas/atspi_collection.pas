unit atspi_collection;

interface

uses
  fp_glib2, fp_atspi;

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

function atspi_collection_get_type:TGType;cdecl;external libatspi;
type
  PAtspiCollection = ^TAtspiCollection;
  TAtspiCollection = record
      parent : TGTypeInterface;
    end;


function atspi_collection_is_ancestor_of(collection:PAtspiCollection; test:PAtspiAccessible; error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_collection_get_matches(collection:PAtspiCollection; rule:PAtspiMatchRule; sortby:TAtspiCollectionSortOrder; count:Tgint; traverse:Tgboolean; 
           error:PPGError):PGArray;cdecl;external libatspi;
function atspi_collection_get_matches_to(collection:PAtspiCollection; current_object:PAtspiAccessible; rule:PAtspiMatchRule; sortby:TAtspiCollectionSortOrder; tree:TAtspiCollectionTreeTraversalType; 
           limit_scope:Tgboolean; count:Tgint; traverse:Tgboolean; error:PPGError):PGArray;cdecl;external libatspi;
function atspi_collection_get_matches_from(collection:PAtspiCollection; current_object:PAtspiAccessible; rule:PAtspiMatchRule; sortby:TAtspiCollectionSortOrder; tree:TAtspiCollectionTreeTraversalType; 
           count:Tgint; traverse:Tgboolean; error:PPGError):PGArray;cdecl;external libatspi;
function atspi_collection_get_active_descendant(collection:PAtspiCollection; error:PPGError):PAtspiAccessible;cdecl;external libatspi;
{$endif}
{ _ATSPI_COLLECTION_H_  }

// === Konventiert am: 26-9-26 12:56:37 ===

function ATSPI_TYPE_COLLECTION : TGType;
function ATSPI_IS_COLLECTION(obj : Pointer) : P;;
function ATSPI_COLLECTION(obj : Pointer) : Tgboolean;
function ATSPI_COLLECTION_GET_IFACE(obj : Pointer) : PAtspiCollection;

implementation

function ATSPI_TYPE_COLLECTION : TGType;
  begin
    ATSPI_TYPE_COLLECTION:=atspi_collection_get_type;
  end;

function ATSPI_IS_COLLECTION(obj : Pointer) : P;;
begin
  Result := P;(g_type_check_instance_cast(obj, ATSPI_TYPE_COLLECTION));
end;

function ATSPI_COLLECTION(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  ATSPI_TYPE_COLLECTION);
end;

function ATSPI_COLLECTION_GET_IFACE(obj : Pointer) : PAtspiCollection;
begin
  Result := g_type_interface_peek(obj, ATSPI_TYPE_COLLECTION);
end;



end.
