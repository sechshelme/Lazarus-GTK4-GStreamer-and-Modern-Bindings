unit atspi_editabletext;

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

function atspi_editable_text_get_type:TGType;cdecl;external libatspi;
type
  PAtspiEditableText = ^TAtspiEditableText;
  TAtspiEditableText = record
      parent : TGTypeInterface;
    end;


function atspi_editable_text_set_text_contents(obj:PAtspiEditableText; new_contents:Pgchar; error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_editable_text_insert_text(obj:PAtspiEditableText; position:Tgint; text:Pgchar; length:Tgint; error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_editable_text_copy_text(obj:PAtspiEditableText; start_pos:Tgint; end_pos:Tgint; error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_editable_text_cut_text(obj:PAtspiEditableText; start_pos:Tgint; end_pos:Tgint; error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_editable_text_delete_text(obj:PAtspiEditableText; start_pos:Tgint; end_pos:Tgint; error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_editable_text_paste_text(obj:PAtspiEditableText; position:Tgint; error:PPGError):Tgboolean;cdecl;external libatspi;
{$endif}
{ _ATSPI_EDITABLE_TEXT_H_  }

// === Konventiert am: 26-9-26 13:10:49 ===

function ATSPI_TYPE_EDITABLE_TEXT : TGType;
function ATSPI_EDITABLE_TEXT(obj : Pointer) : PAtspiEditableText;
function ATSPI_IS_EDITABLE_TEXT(obj : Pointer) : Tgboolean;
function ATSPI_EDITABLE_TEXT_GET_IFACE(obj : Pointer) : PAtspiEditableText;

implementation

function ATSPI_TYPE_EDITABLE_TEXT : TGType;
  begin
    ATSPI_TYPE_EDITABLE_TEXT:=atspi_editable_text_get_type;
  end;

function ATSPI_EDITABLE_TEXT(obj : Pointer) : PAtspiEditableText;
begin
  Result := PAtspiEditableText(g_type_check_instance_cast(obj, ATSPI_TYPE_EDITABLE_TEXT));
end;

function ATSPI_IS_EDITABLE_TEXT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  ATSPI_TYPE_EDITABLE_TEXT);
end;

function ATSPI_EDITABLE_TEXT_GET_IFACE(obj : Pointer) : PAtspiEditableText;
begin
  Result := g_type_interface_peek(obj, ATSPI_TYPE_EDITABLE_TEXT);
end;



end.
