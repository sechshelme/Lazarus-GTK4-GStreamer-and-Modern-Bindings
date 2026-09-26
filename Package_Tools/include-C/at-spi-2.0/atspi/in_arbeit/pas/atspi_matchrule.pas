unit atspi_matchrule;

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
{$ifndef _ATSPI_MATCH_RULE_H_}
{$define _ATSPI_MATCH_RULE_H_}
{$include "glib-object.h"}
{$include "atspi-constants.h"}
{$include "atspi-stateset.h"}
{$include "atspi-types.h"}

type
  PAtspiMatchRule = ^TAtspiMatchRule;
  TAtspiMatchRule = record
      parent : TGObject;
      states : PAtspiStateSet;
      statematchtype : TAtspiCollectionMatchType;
      attributes : PGHashTable;
      attributematchtype : TAtspiCollectionMatchType;
      interfaces : PGArray;
      interfacematchtype : TAtspiCollectionMatchType;
      roles : array[0..3] of Tgint;
      rolematchtype : TAtspiCollectionMatchType;
      invert : Tgboolean;
    end;

  PAtspiMatchRuleClass = ^TAtspiMatchRuleClass;
  TAtspiMatchRuleClass = record
      parent_class : TGObjectClass;
    end;


function atspi_match_rule_get_type:TGType;cdecl;external libatspi;
function atspi_match_rule_new(states:PAtspiStateSet; statematchtype:TAtspiCollectionMatchType; attributes:PGHashTable; attributematchtype:TAtspiCollectionMatchType; roles:PGArray; 
           rolematchtype:TAtspiCollectionMatchType; interfaces:PGArray; interfacematchtype:TAtspiCollectionMatchType; invert:Tgboolean):PAtspiMatchRule;cdecl;external libatspi;
{$endif}
{ _ATSPI_MATCH_RULE_H_  }

// === Konventiert am: 26-9-26 13:04:57 ===

function ATSPI_TYPE_MATCH_RULE : TGType;
function ATSPI_MATCH_RULE(obj : Pointer) : PAtspiMatchRule;
function ATSPI_MATCH_RULE_CLASS(klass : Pointer) : PAtspiMatchRuleClass;
function ATSPI_IS_MATCH_RULE(obj : Pointer) : Tgboolean;
function ATSPI_IS_MATCH_RULE_CLASS(klass : Pointer) : Tgboolean;
function ATSPI_MATCH_RULE_GET_CLASS(obj : Pointer) : PAtspiMatchRuleClass;

implementation

function ATSPI_TYPE_MATCH_RULE : TGType;
  begin
    ATSPI_TYPE_MATCH_RULE:=atspi_match_rule_get_type;
  end;

function ATSPI_MATCH_RULE(obj : Pointer) : PAtspiMatchRule;
begin
  Result := PAtspiMatchRule(g_type_check_instance_cast(obj, ATSPI_TYPE_MATCH_RULE));
end;

function ATSPI_MATCH_RULE_CLASS(klass : Pointer) : PAtspiMatchRuleClass;
begin
  Result := PAtspiMatchRuleClass(g_type_check_class_cast(klass, ATSPI_TYPE_MATCH_RULE));
end;

function ATSPI_IS_MATCH_RULE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  ATSPI_TYPE_MATCH_RULE);
end;

function ATSPI_IS_MATCH_RULE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  ATSPI_TYPE_MATCH_RULE);
end;

function ATSPI_MATCH_RULE_GET_CLASS(obj : Pointer) : PAtspiMatchRuleClass;
begin
  Result := PAtspiMatchRuleClass(PGTypeInstance(obj)^.g_class);
end;



end.
