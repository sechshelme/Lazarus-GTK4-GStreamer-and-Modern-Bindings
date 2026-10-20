
unit vncversion;
interface

{
  Automatically converted by H2Pas 1.0.0 from vncversion.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    vncversion.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GTK VNC Widget
 *
 * Copyright (C) 2009-2010 Daniel P. Berrange <dan@berrange.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.0 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301 USA
  }
{$ifndef VNC_VERSION_H}
{$define VNC_VERSION_H}
{$include <glib.h>}

const
  VNC_MAJOR_VERSION = 1;  
  VNC_MINOR_VERSION = 3;  
  VNC_MICRO_VERSION = 1;  
{
#define VNC_CHECK_VERSION(major, minor, micro) \
        (VNC_MAJOR_VERSION > (major) || \
         (VNC_MAJOR_VERSION == (major) && VNC_MINOR_VERSION > (minor)) || \
         (VNC_MAJOR_VERSION == (major) && VNC_MINOR_VERSION == (minor) && \
          VNC_MICRO_VERSION >= (micro)))

 }
{$endif}
{ VNC_VERSION_H  }

implementation


end.
