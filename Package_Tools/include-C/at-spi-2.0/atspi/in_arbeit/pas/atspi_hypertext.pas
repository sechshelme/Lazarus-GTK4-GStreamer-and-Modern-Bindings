unit atspi_hypertext;

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
{$ifndef _ATSPI_HYPERTEXT_H_}
{$define _ATSPI_HYPERTEXT_H_}
{$include "glib-object.h"}
{$include "atspi-constants.h"}
{$include "atspi-types.h"}

function atspi_hypertext_get_type:TGType;cdecl;external libatspi;
type
  PAtspiHypertext = ^TAtspiHypertext;
  TAtspiHypertext = record
      parent : TGTypeInterface;
    end;


function atspi_hypertext_get_n_links(obj:PAtspiHypertext; error:PPGError):Tgint;cdecl;external libatspi;
function atspi_hypertext_get_link(obj:PAtspiHypertext; link_index:Tgint; error:PPGError):PAtspiHyperlink;cdecl;external libatspi;
function atspi_hypertext_get_link_index(obj:PAtspiHypertext; character_offset:Tgint; error:PPGError):Tgint;cdecl;external libatspi;
{$endif}
{ _ATSPI_HYPERTEXT_H_  }

// === Konventiert am: 26-9-26 13:06:58 ===

function ATSPI_TYPE_HYPERTEXT : TGType;
function ATSPI_HYPERTEXT(obj : Pointer) : PAtspiHypertext;
function ATSPI_IS_HYPERTEXT(obj : Pointer) : Tgboolean;
function ATSPI_HYPERTEXT_GET_IFACE(obj : Pointer) : PAtspiHypertext;

implementation

function ATSPI_TYPE_HYPERTEXT : TGType;
  begin
    ATSPI_TYPE_HYPERTEXT:=atspi_hypertext_get_type;
  end;

function ATSPI_HYPERTEXT(obj : Pointer) : PAtspiHypertext;
begin
  Result := PAtspiHypertext(g_type_check_instance_cast(obj, ATSPI_TYPE_HYPERTEXT));
end;

function ATSPI_IS_HYPERTEXT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  ATSPI_TYPE_HYPERTEXT);
end;

function ATSPI_HYPERTEXT_GET_IFACE(obj : Pointer) : PAtspiHypertext;
begin
  Result := g_type_interface_peek(obj, ATSPI_TYPE_HYPERTEXT);
end;



end.
