unit mbutil;

interface

uses
  fp_mb;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _MBUTIL_H_}
{$define _MBUTIL_H_}
{ libmb
 * Copyright (C) 2002 Matthew Allum
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
{$include <stdio.h>}
{$include <unistd.h>}
{$include <stdlib.h>}
{$include <string.h>}
{$include <sys/types.h>}
{$include <sys/stat.h>}
{$include <dirent.h>}
{$include <signal.h>}
{$include <errno.h>}
{$include <sys/wait.h>}
{$include <X11/Xlib.h>}
{$include <X11/Xutil.h>}
{$include <X11/Xatom.h>}
{$include <libmb/mbconfig.h>}
{*
 * @defgroup util Various Utility functions
 * @brief Misc useful functions used by various parts of matchbox. 
 *
 * @
  }
{ C++ extern C conditionnal removed }
{*
 * Exec a command similar to how a shell would, mainly passing quotes. 
 *
 * @param cmd command string. 
 * @returns exec() result
  }

function mb_exec(cmd:Pchar):longint;cdecl;external libmb;
{* 
 * Get window ID of app with specified binary name 
 *
 * @param dpy X11 Display
 * @param bin_name name of executable ( argv[0] )
 * @returns X11 window ID or None if not found. 
 }
function mb_single_instance_get_window(dpy:PDisplay; bin_name:Pchar):TWindow;cdecl;external libmb;
{* 
 * Test to see if an app is in 'startup' phase 
 *
 * @param dpy X11 Display
 * @param bin_name name of executable ( argv[0] ) 
 * @returns True / False
 }
function mb_single_instance_is_starting(dpy:PDisplay; bin_name:Pchar):TBool;cdecl;external libmb;
{* 
 * Safely returns the current HOME directory or /tmp if not set. 
 * You should not free the value returned. 
 *
 * @returns home directory or /tmp if not set
  }
function mb_util_get_homedir:Pchar;cdecl;external libmb;
{* 
 * Raise/Activate an existing window 
 *
 * @param dpy X11 Display
 * @param win Window ID to 'activate'
  }
procedure mb_util_window_activate(dpy:PDisplay; win:TWindow);cdecl;external libmb;
{*
 * Get root pixmap if set 
 *
 * @param dpy X11 Display
 * @returns Pixmap of root window or None if not set. 
  }
function mb_util_get_root_pixmap(dpy:PDisplay):TPixmap;cdecl;external libmb;
{*
 * Get a full theme path from its name. The function allocates memory
 * for the returned data, this should be freed by the caller.
 *
 * @param theme_name Theme name. 
 * @returns full pull to theme directory or NULL
  }
function mb_util_get_theme_full_path(theme_name:Pchar):Pchar;cdecl;external libmb;
{* XXX To document XXX  }
procedure mb_util_animate_startup(dpy:PDisplay; x:longint; y:longint; width:longint; height:longint);cdecl;external libmb;
function mb_want_warnings:longint;cdecl;external libmb;
{ C++ end of extern C conditionnal removed }
{* @  }
{$endif}

// === Konventiert am: 15-11-26 17:34:48 ===


implementation



end.
