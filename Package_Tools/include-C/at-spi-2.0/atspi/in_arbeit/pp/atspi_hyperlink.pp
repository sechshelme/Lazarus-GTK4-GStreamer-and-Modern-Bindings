
unit atspi_hyperlink;
interface

{
  Automatically converted by H2Pas 1.0.0 from atspi_hyperlink.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    atspi_hyperlink.h
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
PAtspiHyperlink  = ^AtspiHyperlink;
PAtspiHyperlinkClass  = ^AtspiHyperlinkClass;
PAtspiRange  = ^AtspiRange;
Pgchar  = ^gchar;
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
{$ifndef _ATSPI_HYPERLINK_H_}
{$define _ATSPI_HYPERLINK_H_}
{$include "glib-object.h"}
{$include "atspi-constants.h"}
{$include "atspi-text.h" /* for AtspiRange */}
{$include "atspi-types.h"}

{ was #define dname def_expr }
function ATSPI_TYPE_HYPERLINK : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_HYPERLINK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_HYPERLINK_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_HYPERLINK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_HYPERLINK_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_HYPERLINK_GET_CLASS(obj : longint) : longint;

type
  PAtspiHyperlink = ^TAtspiHyperlink;
  TAtspiHyperlink = record
      parent : TAtspiObject;
    end;

  PAtspiHyperlinkClass = ^TAtspiHyperlinkClass;
  TAtspiHyperlinkClass = record
      parent_class : TAtspiObjectClass;
    end;


function atspi_hyperlink_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function _atspi_hyperlink_new(app:PAtspiApplication; path:Pgchar):PAtspiHyperlink;cdecl;external;
function atspi_hyperlink_get_n_anchors(obj:PAtspiHyperlink; error:PPGError):Tgint;cdecl;external;
function atspi_hyperlink_get_uri(obj:PAtspiHyperlink; i:longint; error:PPGError):Pgchar;cdecl;external;
function atspi_hyperlink_get_object(obj:PAtspiHyperlink; i:Tgint; error:PPGError):PAtspiAccessible;cdecl;external;
function atspi_hyperlink_get_index_range(obj:PAtspiHyperlink; error:PPGError):PAtspiRange;cdecl;external;
function atspi_hyperlink_get_start_index(obj:PAtspiHyperlink; error:PPGError):Tgint;cdecl;external;
function atspi_hyperlink_get_end_index(obj:PAtspiHyperlink; error:PPGError):Tgint;cdecl;external;
function atspi_hyperlink_is_valid(obj:PAtspiHyperlink; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ _ATSPI_HYPERLINK_H_  }

implementation

{ was #define dname def_expr }
function ATSPI_TYPE_HYPERLINK : longint; { return type might be wrong }
  begin
    ATSPI_TYPE_HYPERLINK:=atspi_hyperlink_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_HYPERLINK(obj : longint) : longint;
begin
  ATSPI_HYPERLINK:=G_TYPE_CHECK_INSTANCE_CAST(obj,ATSPI_TYPE_HYPERLINK,AtspiHyperlink);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_HYPERLINK_CLASS(klass : longint) : longint;
begin
  ATSPI_HYPERLINK_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,ATSPI_TYPE_HYPERLINK,AtspiHyperlinkClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_HYPERLINK(obj : longint) : longint;
begin
  ATSPI_IS_HYPERLINK:=G_TYPE_CHECK_INSTANCE_TYPE(obj,ATSPI_TYPE_HYPERLINK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_HYPERLINK_CLASS(klass : longint) : longint;
begin
  ATSPI_IS_HYPERLINK_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,ATSPI_TYPE_HYPERLINK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_HYPERLINK_GET_CLASS(obj : longint) : longint;
begin
  ATSPI_HYPERLINK_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,ATSPI_TYPE_HYPERLINK,AtspiHyperlinkClass);
end;


end.
