unit atspi_image;

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
{$ifndef _ATSPI_IMAGE_H_}
{$define _ATSPI_IMAGE_H_}
{$include "glib-object.h"}
{$include "atspi-constants.h"}
{$include "atspi-types.h"}

function atspi_image_get_type:TGType;cdecl;external libatspi;
type
  PAtspiImage = ^TAtspiImage;
  TAtspiImage = record
      parent : TGTypeInterface;
    end;


function atspi_image_get_image_description(obj:PAtspiImage; error:PPGError):Pgchar;cdecl;external libatspi;
function atspi_image_get_image_size(obj:PAtspiImage; error:PPGError):PAtspiPoint;cdecl;external libatspi;
function atspi_image_get_image_position(obj:PAtspiImage; ctype:TAtspiCoordType; error:PPGError):PAtspiPoint;cdecl;external libatspi;
function atspi_image_get_image_extents(obj:PAtspiImage; ctype:TAtspiCoordType; error:PPGError):PAtspiRect;cdecl;external libatspi;
function atspi_image_get_image_locale(obj:PAtspiImage; error:PPGError):Pgchar;cdecl;external libatspi;
{$endif}
{ _ATSPI_IMAGE_H_  }

// === Konventiert am: 26-9-26 13:06:00 ===

function ATSPI_TYPE_IMAGE : TGType;
function ATSPI_IMAGE(obj : Pointer) : PAtspiImage;
function ATSPI_IS_IMAGE(obj : Pointer) : Tgboolean;
function ATSPI_IMAGE_GET_IFACE(obj : Pointer) : PAtspiImage;

implementation

function ATSPI_TYPE_IMAGE : TGType;
  begin
    ATSPI_TYPE_IMAGE:=atspi_image_get_type;
  end;

function ATSPI_IMAGE(obj : Pointer) : PAtspiImage;
begin
  Result := PAtspiImage(g_type_check_instance_cast(obj, ATSPI_TYPE_IMAGE));
end;

function ATSPI_IS_IMAGE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  ATSPI_TYPE_IMAGE);
end;

function ATSPI_IMAGE_GET_IFACE(obj : Pointer) : PAtspiImage;
begin
  Result := g_type_interface_peek(obj, ATSPI_TYPE_IMAGE);
end;



end.
