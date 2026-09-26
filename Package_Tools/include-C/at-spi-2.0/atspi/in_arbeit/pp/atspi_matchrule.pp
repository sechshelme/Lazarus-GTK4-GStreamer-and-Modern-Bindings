
unit atspi_matchrule;
interface

{
  Automatically converted by H2Pas 1.0.0 from atspi_matchrule.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    atspi_matchrule.h
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
PAtspiMatchRule  = ^AtspiMatchRule;
PAtspiMatchRuleClass  = ^AtspiMatchRuleClass;
PAtspiStateSet  = ^AtspiStateSet;
PGArray  = ^GArray;
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

{ was #define dname def_expr }
function ATSPI_TYPE_MATCH_RULE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_MATCH_RULE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_MATCH_RULE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_MATCH_RULE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_MATCH_RULE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_MATCH_RULE_GET_CLASS(obj : longint) : longint;

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


function atspi_match_rule_get_type:TGType;cdecl;external;
function atspi_match_rule_new(states:PAtspiStateSet; statematchtype:TAtspiCollectionMatchType; attributes:PGHashTable; attributematchtype:TAtspiCollectionMatchType; roles:PGArray; 
           rolematchtype:TAtspiCollectionMatchType; interfaces:PGArray; interfacematchtype:TAtspiCollectionMatchType; invert:Tgboolean):PAtspiMatchRule;cdecl;external;
{$endif}
{ _ATSPI_MATCH_RULE_H_  }

implementation

{ was #define dname def_expr }
function ATSPI_TYPE_MATCH_RULE : longint; { return type might be wrong }
  begin
    ATSPI_TYPE_MATCH_RULE:=atspi_match_rule_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_MATCH_RULE(obj : longint) : longint;
begin
  ATSPI_MATCH_RULE:=G_TYPE_CHECK_INSTANCE_CAST(obj,ATSPI_TYPE_MATCH_RULE,AtspiMatchRule);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_MATCH_RULE_CLASS(klass : longint) : longint;
begin
  ATSPI_MATCH_RULE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,ATSPI_TYPE_MATCH_RULE,AtspiMatchRuleClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_MATCH_RULE(obj : longint) : longint;
begin
  ATSPI_IS_MATCH_RULE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,ATSPI_TYPE_MATCH_RULE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_MATCH_RULE_CLASS(klass : longint) : longint;
begin
  ATSPI_IS_MATCH_RULE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,ATSPI_TYPE_MATCH_RULE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_MATCH_RULE_GET_CLASS(obj : longint) : longint;
begin
  ATSPI_MATCH_RULE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,ATSPI_TYPE_MATCH_RULE,AtspiMatchRuleClass);
end;


end.
