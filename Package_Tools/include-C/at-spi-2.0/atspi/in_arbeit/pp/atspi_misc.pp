
unit atspi_misc;
interface

{
  Automatically converted by H2Pas 1.0.0 from atspi_misc.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    atspi_misc.h
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
PDBusConnection  = ^DBusConnection;
Pgchar  = ^gchar;
Pgint  = ^gint;
PGMainContext  = ^GMainContext;
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
{$ifndef _ATSPI_MISC_H_}
{$define _ATSPI_MISC_H_}

function atspi_init:longint;cdecl;external;
function atspi_is_initialized:Tgboolean;cdecl;external;
procedure atspi_event_main;cdecl;external;
procedure atspi_event_quit;cdecl;external;
function atspi_exit:longint;cdecl;external;
function atspi_get_a11y_bus:PDBusConnection;cdecl;external;
procedure atspi_set_timeout(val:Tgint; startup_time:Tgint);cdecl;external;
procedure atspi_set_main_context(cnx:PGMainContext);cdecl;external;
function atspi_role_get_name(role:TAtspiRole):Pgchar;cdecl;external;
function atspi_role_get_localized_name(role:TAtspiRole):Pgchar;cdecl;external;
procedure atspi_get_version(major:Pgint; minor:Pgint; micro:Pgint);cdecl;external;
{$endif}
{ _ATSPI_MISC_H_  }

implementation


end.
