unit atspi_document;

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
{$ifndef _ATSPI_DOCUMENT_H_}
{$define _ATSPI_DOCUMENT_H_}
{$include "glib-object.h"}
{$include "atspi-constants.h"}
{$include "atspi-types.h"}

function atspi_document_get_type:TGType;cdecl;external libatspi;
{*
 * AtspiTextSelection:
 * @start_object: the AtspiAccessible containing the start of the selection.
 * @start_offset: the text offset of the beginning of the selection within
 *                @start_object.
 * @end_object: the AtspiAccessible containing the end of the selection.
 * @end_offset: the text offset of the end of the selection within @end_object.
 * @start_is_active: a gboolean indicating whether the start of the selection
 *                  is the active point.
 *
 * This structure represents a single  text selection within a document. This
 * selection is defined by two points in the content, where each one is defined
 * by an AtkObject supporting the AtkText interface and a character offset
 * relative to it.
 *
 * The end object must appear after the start object in the accessibility tree,
 * i.e. the end object must be reachable from the start object by navigating
 * forward (next, first child etc).
 *
 * This struct also contains a @start_is_active boolean, to communicate if the
 * start of the selection is the active point or not.
 *
 * The active point corresponds to the user's focus or point of interest. The
 * user moves the active point to expand or collapse the range. The anchor
 * point is the other point of the range and typically remains constant. In
 * most cases, anchor is the start of the range and active is the end. However,
 * when selecting backwards (e.g. pressing shift+left arrow in a text field),
 * the start of the range is the active point, as the user moves this to
 * manipulate the selection.
 *
 * Since: 2.52
  }
type
  PAtspiTextSelection = ^TAtspiTextSelection;
  TAtspiTextSelection = record
      start_object : PAtspiAccessible;
      start_offset : Tgint;
      end_object : PAtspiAccessible;
      end_offset : Tgint;
      start_is_active : Tgboolean;
    end;

  PAtspiDocument = ^TAtspiDocument;
  TAtspiDocument = record
      parent : TGTypeInterface;
    end;


function atspi_document_get_locale(obj:PAtspiDocument; error:PPGError):Pgchar;cdecl;external libatspi;
{$ifndef ATSPI_DISABLE_DEPRECATED}

function atspi_document_get_attribute_value(obj:PAtspiDocument; attribute:Pgchar; error:PPGError):Pgchar;cdecl;external libatspi;
{$endif}

function atspi_document_get_document_attribute_value(obj:PAtspiDocument; attribute:Pgchar; error:PPGError):Pgchar;cdecl;external libatspi;
{$ifndef ATSPI_DISABLE_DEPRECATED}

function atspi_document_get_attributes(obj:PAtspiDocument; error:PPGError):PGHashTable;cdecl;external libatspi;
{$endif}

function atspi_document_get_document_attributes(obj:PAtspiDocument; error:PPGError):PGHashTable;cdecl;external libatspi;
function atspi_document_get_page_count(obj:PAtspiDocument; error:PPGError):Tgint;cdecl;external libatspi;
function atspi_document_get_current_page_number(obj:PAtspiDocument; error:PPGError):Tgint;cdecl;external libatspi;
function atspi_document_get_text_selections(document:PAtspiDocument; error:PPGError):PGArray;cdecl;external libatspi;
function atspi_document_set_text_selections(document:PAtspiDocument; selections:PGArray; error:PPGError):Tgboolean;cdecl;external libatspi;
{$endif}
{ _ATSPI_DOCUMENT_H_  }

// === Konventiert am: 26-9-26 13:11:24 ===

function ATSPI_TYPE_DOCUMENT : TGType;
function ATSPI_DOCUMENT(obj : Pointer) : PAtspiDocument;
function ATSPI_IS_DOCUMENT(obj : Pointer) : Tgboolean;
function ATSPI_DOCUMENT_GET_IFACE(obj : Pointer) : PAtspiDocument;

implementation

function ATSPI_TYPE_DOCUMENT : TGType;
  begin
    ATSPI_TYPE_DOCUMENT:=atspi_document_get_type;
  end;

function ATSPI_DOCUMENT(obj : Pointer) : PAtspiDocument;
begin
  Result := PAtspiDocument(g_type_check_instance_cast(obj, ATSPI_TYPE_DOCUMENT));
end;

function ATSPI_IS_DOCUMENT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  ATSPI_TYPE_DOCUMENT);
end;

function ATSPI_DOCUMENT_GET_IFACE(obj : Pointer) : PAtspiDocument;
begin
  Result := g_type_interface_peek(obj, ATSPI_TYPE_DOCUMENT);
end;



end.
