unit atspi_relation;

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
{$ifndef _ATSPI_RELATION_H_}
{$define _ATSPI_RELATION_H_}
{$include "glib-object.h"}
{$include "atspi-constants.h"}

function atspi_relation_get_type:TGType;cdecl;external libatspi;
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


function atspi_relation_get_relation_type(obj:PAtspiRelation):TAtspiRelationType;cdecl;external libatspi;
function atspi_relation_get_n_targets(obj:PAtspiRelation):Tgint;cdecl;external libatspi;
function atspi_relation_get_target(obj:PAtspiRelation; i:Tgint):PAtspiAccessible;cdecl;external libatspi;
{ private  }
function _atspi_relation_new_from_iter(iter:PDBusMessageIter):PAtspiRelation;cdecl;external libatspi;
{$endif}
{ _ATSPI_RELATION_H_  }

// === Konventiert am: 26-9-26 13:15:40 ===

function ATSPI_TYPE_RELATION : TGType;
function ATSPI_RELATION(obj : Pointer) : PAtspiRelation;
function ATSPI_IS_RELATION(obj : Pointer) : Tgboolean;
function ATSPI_RELATION_GET_IFACE(obj : Pointer) : PAtspiRelation;

implementation

function ATSPI_TYPE_RELATION : TGType;
  begin
    ATSPI_TYPE_RELATION:=atspi_relation_get_type;
  end;

function ATSPI_RELATION(obj : Pointer) : PAtspiRelation;
begin
  Result := PAtspiRelation(g_type_check_instance_cast(obj, ATSPI_TYPE_RELATION));
end;

function ATSPI_IS_RELATION(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  ATSPI_TYPE_RELATION);
end;

function ATSPI_RELATION_GET_IFACE(obj : Pointer) : PAtspiRelation;
begin
  Result := g_type_interface_peek(obj, ATSPI_TYPE_RELATION);
end;



end.
