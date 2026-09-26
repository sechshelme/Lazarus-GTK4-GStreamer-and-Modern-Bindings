
unit atspi_editabletext;
interface

{
  Automatically converted by H2Pas 1.0.0 from atspi_editabletext.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    atspi_editabletext.h
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
PAtspiEditableText  = ^AtspiEditableText;
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
{$ifndef _ATSPI_EDITABLE_TEXT_H_}
{$define _ATSPI_EDITABLE_TEXT_H_}
{$include "glib-object.h"}
{$include "atspi-constants.h"}
{$include "atspi-types.h"}

{ was #define dname def_expr }
function ATSPI_TYPE_EDITABLE_TEXT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_EDITABLE_TEXT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_EDITABLE_TEXT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_EDITABLE_TEXT_GET_IFACE(obj : longint) : longint;

function atspi_editable_text_get_type:TGType;cdecl;external;
type
  PAtspiEditableText = ^TAtspiEditableText;
  TAtspiEditableText = record
      parent : TGTypeInterface;
    end;

(* Const before type ignored *)

function atspi_editable_text_set_text_contents(obj:PAtspiEditableText; new_contents:Pgchar; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function atspi_editable_text_insert_text(obj:PAtspiEditableText; position:Tgint; text:Pgchar; length:Tgint; error:PPGError):Tgboolean;cdecl;external;
function atspi_editable_text_copy_text(obj:PAtspiEditableText; start_pos:Tgint; end_pos:Tgint; error:PPGError):Tgboolean;cdecl;external;
function atspi_editable_text_cut_text(obj:PAtspiEditableText; start_pos:Tgint; end_pos:Tgint; error:PPGError):Tgboolean;cdecl;external;
function atspi_editable_text_delete_text(obj:PAtspiEditableText; start_pos:Tgint; end_pos:Tgint; error:PPGError):Tgboolean;cdecl;external;
function atspi_editable_text_paste_text(obj:PAtspiEditableText; position:Tgint; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ _ATSPI_EDITABLE_TEXT_H_  }

implementation

{ was #define dname def_expr }
function ATSPI_TYPE_EDITABLE_TEXT : longint; { return type might be wrong }
  begin
    ATSPI_TYPE_EDITABLE_TEXT:=atspi_editable_text_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_EDITABLE_TEXT(obj : longint) : longint;
begin
  ATSPI_EDITABLE_TEXT:=G_TYPE_CHECK_INSTANCE_CAST(obj,ATSPI_TYPE_EDITABLE_TEXT,AtspiEditableText);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_EDITABLE_TEXT(obj : longint) : longint;
begin
  ATSPI_IS_EDITABLE_TEXT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,ATSPI_TYPE_EDITABLE_TEXT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_EDITABLE_TEXT_GET_IFACE(obj : longint) : longint;
begin
  ATSPI_EDITABLE_TEXT_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,ATSPI_TYPE_EDITABLE_TEXT,AtspiEditableText);
end;


end.
