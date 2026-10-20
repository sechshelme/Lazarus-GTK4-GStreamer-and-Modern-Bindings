unit vncutil;

interface

uses
  fp_glib2, fp_gvnc;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GTK VNC Widget
 *
 * Copyright (C) 2010 Daniel P. Berrange <dan@berrange.com>
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
{$ifndef VNC_UTIL_H}
{$define VNC_UTIL_H}
{$include <glib.h>}

procedure vnc_util_set_debug(enabled:Tgboolean);cdecl;external libgvnc;
function vnc_util_get_debug:Tgboolean;cdecl;external libgvnc;
function vnc_util_get_version:Tgint;cdecl;external libgvnc;
function vnc_util_get_version_string:Pgchar;cdecl;external libgvnc;
function vnc_util_check_version(major:Tgint; minor:Tgint; micro:Tgint):Tgboolean;cdecl;external libgvnc;
{ For normal VncXXXClass structs  }
const
  VNC_PADDING = 4;  
{ For very extensible VncXXXClass structs  }
  VNC_PADDING_LARGE = 20;  
{$endif}
{ VNC_UTIL_H  }

// === Konventiert am: 20-10-26 19:49:59 ===


implementation



end.
