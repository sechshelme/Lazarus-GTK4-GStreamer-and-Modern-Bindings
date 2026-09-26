unit atspi_hyperlink;

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
{$ifndef _ATSPI_HYPERLINK_H_}
{$define _ATSPI_HYPERLINK_H_}
{$include "glib-object.h"}
{$include "atspi-constants.h"}
{$include "atspi-text.h" /* for AtspiRange */}
{$include "atspi-types.h"}

type
  PAtspiHyperlink = ^TAtspiHyperlink;
  TAtspiHyperlink = record
      parent : TAtspiObject;
    end;

  PAtspiHyperlinkClass = ^TAtspiHyperlinkClass;
  TAtspiHyperlinkClass = record
      parent_class : TAtspiObjectClass;
    end;


function atspi_hyperlink_get_type:TGType;cdecl;external libatspi;
function _atspi_hyperlink_new(app:PAtspiApplication; path:Pgchar):PAtspiHyperlink;cdecl;external libatspi;
function atspi_hyperlink_get_n_anchors(obj:PAtspiHyperlink; error:PPGError):Tgint;cdecl;external libatspi;
function atspi_hyperlink_get_uri(obj:PAtspiHyperlink; i:longint; error:PPGError):Pgchar;cdecl;external libatspi;
function atspi_hyperlink_get_object(obj:PAtspiHyperlink; i:Tgint; error:PPGError):PAtspiAccessible;cdecl;external libatspi;
function atspi_hyperlink_get_index_range(obj:PAtspiHyperlink; error:PPGError):PAtspiRange;cdecl;external libatspi;
function atspi_hyperlink_get_start_index(obj:PAtspiHyperlink; error:PPGError):Tgint;cdecl;external libatspi;
function atspi_hyperlink_get_end_index(obj:PAtspiHyperlink; error:PPGError):Tgint;cdecl;external libatspi;
function atspi_hyperlink_is_valid(obj:PAtspiHyperlink; error:PPGError):Tgboolean;cdecl;external libatspi;
{$endif}
{ _ATSPI_HYPERLINK_H_  }

// === Konventiert am: 26-9-26 13:07:46 ===

function ATSPI_TYPE_HYPERLINK : TGType;
function ATSPI_HYPERLINK(obj : Pointer) : PAtspiHyperlink;
function ATSPI_HYPERLINK_CLASS(klass : Pointer) : PAtspiHyperlinkClass;
function ATSPI_IS_HYPERLINK(obj : Pointer) : Tgboolean;
function ATSPI_IS_HYPERLINK_CLASS(klass : Pointer) : Tgboolean;
function ATSPI_HYPERLINK_GET_CLASS(obj : Pointer) : PAtspiHyperlinkClass;

implementation

function ATSPI_TYPE_HYPERLINK : TGType;
  begin
    ATSPI_TYPE_HYPERLINK:=atspi_hyperlink_get_type;
  end;

function ATSPI_HYPERLINK(obj : Pointer) : PAtspiHyperlink;
begin
  Result := PAtspiHyperlink(g_type_check_instance_cast(obj, ATSPI_TYPE_HYPERLINK));
end;

function ATSPI_HYPERLINK_CLASS(klass : Pointer) : PAtspiHyperlinkClass;
begin
  Result := PAtspiHyperlinkClass(g_type_check_class_cast(klass, ATSPI_TYPE_HYPERLINK));
end;

function ATSPI_IS_HYPERLINK(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  ATSPI_TYPE_HYPERLINK);
end;

function ATSPI_IS_HYPERLINK_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  ATSPI_TYPE_HYPERLINK);
end;

function ATSPI_HYPERLINK_GET_CLASS(obj : Pointer) : PAtspiHyperlinkClass;
begin
  Result := PAtspiHyperlinkClass(PGTypeInstance(obj)^.g_class);
end;



end.
