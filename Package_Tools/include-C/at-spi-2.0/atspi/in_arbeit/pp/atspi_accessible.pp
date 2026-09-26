
unit atspi_accessible;
interface

{
  Automatically converted by H2Pas 1.0.0 from atspi_accessible.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    atspi_accessible.h
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
PAtspiAccessibleClass  = ^AtspiAccessibleClass;
PAtspiAccessiblePrivate  = ^AtspiAccessiblePrivate;
PAtspiAction  = ^AtspiAction;
PAtspiApplication  = ^AtspiApplication;
PAtspiCollection  = ^AtspiCollection;
PAtspiComponent  = ^AtspiComponent;
PAtspiDocument  = ^AtspiDocument;
PAtspiEditableText  = ^AtspiEditableText;
PAtspiHyperlink  = ^AtspiHyperlink;
PAtspiHypertext  = ^AtspiHypertext;
PAtspiImage  = ^AtspiImage;
PAtspiSelection  = ^AtspiSelection;
PAtspiStateSet  = ^AtspiStateSet;
PAtspiTable  = ^AtspiTable;
PAtspiTableCell  = ^AtspiTableCell;
PAtspiText  = ^AtspiText;
PAtspiValue  = ^AtspiValue;
Pchar  = ^char;
PGArray  = ^GArray;
Pgchar  = ^gchar;
PGError  = ^GError;
PGHashTable  = ^GHashTable;
PGPtrArray  = ^GPtrArray;
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
{$ifndef _ATSPI_ACCESSIBLE_H_}
{$define _ATSPI_ACCESSIBLE_H_}
{$include "glib-object.h"}
{$include "atspi-application.h"}
{$include "atspi-constants.h"}
{$include "atspi-object.h"}
{$include "atspi-stateset.h"}
{$include "atspi-types.h"}

{ was #define dname def_expr }
function ATSPI_TYPE_ACCESSIBLE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_ACCESSIBLE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_ACCESSIBLE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_ACCESSIBLE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_ACCESSIBLE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_ACCESSIBLE_GET_CLASS(obj : longint) : longint;

type
  PAtspiAccessible = ^TAtspiAccessible;
  TAtspiAccessible = record
      parent : TAtspiObject;
      accessible_parent : PAtspiAccessible;
      children : PGPtrArray;
      role : TAtspiRole;
      interfaces : Tgint;
      name : Pchar;
      description : Pchar;
      states : PAtspiStateSet;
      attributes : PGHashTable;
      cached_properties : Tguint;
      priv : PAtspiAccessiblePrivate;
    end;

  PAtspiAccessibleClass = ^TAtspiAccessibleClass;
  TAtspiAccessibleClass = record
      parent_class : TAtspiObjectClass;
      region_changed : procedure (accessible:PAtspiAccessible; current_offset:Tgint; last_offset:Tgint);cdecl;
      mode_changed : procedure (accessible:PAtspiAccessible; enabled:Tgboolean);cdecl;
    end;


function atspi_accessible_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function _atspi_accessible_new(app:PAtspiApplication; path:Pgchar):PAtspiAccessible;cdecl;external;
function atspi_accessible_get_name(obj:PAtspiAccessible; error:PPGError):Pgchar;cdecl;external;
function atspi_accessible_get_description(obj:PAtspiAccessible; error:PPGError):Pgchar;cdecl;external;
function atspi_accessible_get_parent(obj:PAtspiAccessible; error:PPGError):PAtspiAccessible;cdecl;external;
function atspi_accessible_get_child_count(obj:PAtspiAccessible; error:PPGError):Tgint;cdecl;external;
function atspi_accessible_get_child_at_index(obj:PAtspiAccessible; child_index:Tgint; error:PPGError):PAtspiAccessible;cdecl;external;
function atspi_accessible_get_index_in_parent(obj:PAtspiAccessible; error:PPGError):Tgint;cdecl;external;
function atspi_accessible_get_relation_set(obj:PAtspiAccessible; error:PPGError):PGArray;cdecl;external;
function atspi_accessible_get_role(obj:PAtspiAccessible; error:PPGError):TAtspiRole;cdecl;external;
function atspi_accessible_get_role_name(obj:PAtspiAccessible; error:PPGError):Pgchar;cdecl;external;
function atspi_accessible_get_localized_role_name(obj:PAtspiAccessible; error:PPGError):Pgchar;cdecl;external;
function atspi_accessible_get_state_set(obj:PAtspiAccessible):PAtspiStateSet;cdecl;external;
function atspi_accessible_get_attributes(obj:PAtspiAccessible; error:PPGError):PGHashTable;cdecl;external;
function atspi_accessible_get_attributes_as_array(obj:PAtspiAccessible; error:PPGError):PGArray;cdecl;external;
function atspi_accessible_get_toolkit_name(obj:PAtspiAccessible; error:PPGError):Pgchar;cdecl;external;
function atspi_accessible_get_toolkit_version(obj:PAtspiAccessible; error:PPGError):Pgchar;cdecl;external;
function atspi_accessible_get_atspi_version(obj:PAtspiAccessible; error:PPGError):Pgchar;cdecl;external;
function atspi_accessible_get_id(obj:PAtspiAccessible; error:PPGError):Tgint;cdecl;external;
function atspi_accessible_get_application(obj:PAtspiAccessible; error:PPGError):PAtspiAccessible;cdecl;external;
{$ifndef ATSPI_DISABLE_DEPRECATED}

function atspi_accessible_get_action(obj:PAtspiAccessible):PAtspiAction;cdecl;external;
function atspi_accessible_get_collection(obj:PAtspiAccessible):PAtspiCollection;cdecl;external;
function atspi_accessible_get_component(obj:PAtspiAccessible):PAtspiComponent;cdecl;external;
function atspi_accessible_get_document(obj:PAtspiAccessible):PAtspiDocument;cdecl;external;
function atspi_accessible_get_editable_text(obj:PAtspiAccessible):PAtspiEditableText;cdecl;external;
function atspi_accessible_get_hyperlink(obj:PAtspiAccessible):PAtspiHyperlink;cdecl;external;
function atspi_accessible_get_hypertext(obj:PAtspiAccessible):PAtspiHypertext;cdecl;external;
function atspi_accessible_get_image(obj:PAtspiAccessible):PAtspiImage;cdecl;external;
function atspi_accessible_get_selection(obj:PAtspiAccessible):PAtspiSelection;cdecl;external;
function atspi_accessible_get_table(obj:PAtspiAccessible):PAtspiTable;cdecl;external;
function atspi_accessible_get_table_cell(obj:PAtspiAccessible):PAtspiTableCell;cdecl;external;
function atspi_accessible_get_text(obj:PAtspiAccessible):PAtspiText;cdecl;external;
function atspi_accessible_get_value(obj:PAtspiAccessible):PAtspiValue;cdecl;external;
{$endif}

function atspi_accessible_get_action_iface(obj:PAtspiAccessible):PAtspiAction;cdecl;external;
function atspi_accessible_get_collection_iface(obj:PAtspiAccessible):PAtspiCollection;cdecl;external;
function atspi_accessible_get_component_iface(obj:PAtspiAccessible):PAtspiComponent;cdecl;external;
function atspi_accessible_get_document_iface(obj:PAtspiAccessible):PAtspiDocument;cdecl;external;
function atspi_accessible_get_editable_text_iface(obj:PAtspiAccessible):PAtspiEditableText;cdecl;external;
function atspi_accessible_get_hypertext_iface(obj:PAtspiAccessible):PAtspiHypertext;cdecl;external;
function atspi_accessible_get_image_iface(obj:PAtspiAccessible):PAtspiImage;cdecl;external;
function atspi_accessible_get_selection_iface(obj:PAtspiAccessible):PAtspiSelection;cdecl;external;
function atspi_accessible_get_table_iface(obj:PAtspiAccessible):PAtspiTable;cdecl;external;
function atspi_accessible_get_text_iface(obj:PAtspiAccessible):PAtspiText;cdecl;external;
function atspi_accessible_get_value_iface(obj:PAtspiAccessible):PAtspiValue;cdecl;external;
function atspi_accessible_get_interfaces(obj:PAtspiAccessible):PGArray;cdecl;external;
(* Const before type ignored *)
function atspi_accessible_get_object_locale(accessible:PAtspiAccessible; error:PPGError):Pgchar;cdecl;external;
procedure atspi_accessible_set_cache_mask(accessible:PAtspiAccessible; mask:TAtspiCache);cdecl;external;
procedure atspi_accessible_clear_cache(obj:PAtspiAccessible);cdecl;external;
procedure atspi_accessible_clear_cache_single(obj:PAtspiAccessible);cdecl;external;
function atspi_accessible_get_process_id(accessible:PAtspiAccessible; error:PPGError):Tguint;cdecl;external;
function atspi_accessible_get_accessible_id(obj:PAtspiAccessible; error:PPGError):Pgchar;cdecl;external;
function atspi_accessible_get_help_text(obj:PAtspiAccessible; error:PPGError):Pgchar;cdecl;external;
{ private  }
procedure _atspi_accessible_add_cache(accessible:PAtspiAccessible; flag:TAtspiCache);cdecl;external;
function _atspi_accessible_get_cache_mask(accessible:PAtspiAccessible):TAtspiCache;cdecl;external;
function _atspi_accessible_test_cache(accessible:PAtspiAccessible; flag:TAtspiCache):Tgboolean;cdecl;external;
{$endif}
{ _ATSPI_ACCESSIBLE_H_  }

implementation

{ was #define dname def_expr }
function ATSPI_TYPE_ACCESSIBLE : longint; { return type might be wrong }
  begin
    ATSPI_TYPE_ACCESSIBLE:=atspi_accessible_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_ACCESSIBLE(obj : longint) : longint;
begin
  ATSPI_ACCESSIBLE:=G_TYPE_CHECK_INSTANCE_CAST(obj,ATSPI_TYPE_ACCESSIBLE,AtspiAccessible);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_ACCESSIBLE_CLASS(klass : longint) : longint;
begin
  ATSPI_ACCESSIBLE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,ATSPI_TYPE_ACCESSIBLE,AtspiAccessibleClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_ACCESSIBLE(obj : longint) : longint;
begin
  ATSPI_IS_ACCESSIBLE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,ATSPI_TYPE_ACCESSIBLE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_ACCESSIBLE_CLASS(klass : longint) : longint;
begin
  ATSPI_IS_ACCESSIBLE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,ATSPI_TYPE_ACCESSIBLE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_ACCESSIBLE_GET_CLASS(obj : longint) : longint;
begin
  ATSPI_ACCESSIBLE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,ATSPI_TYPE_ACCESSIBLE,AtspiAccessibleClass);
end;


end.
