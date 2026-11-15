unit xsettings_client;

interface

uses
  fp_mb;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2001 Red Hat, Inc.
 *
 * Permission to use, copy, modify, distribute, and sell this software and its
 * documentation for any purpose is hereby granted without fee, provided that
 * the above copyright notice appear in all copies and that both that
 * copyright notice and this permission notice appear in supporting
 * documentation, and that the name of Red Hat not be used in advertising or
 * publicity pertaining to distribution of the software without specific,
 * written prior permission.  Red Hat makes no representations about the
 * suitability of this software for any purpose.  It is provided "as is"
 * without express or implied warranty.
 *
 * RED HAT DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING ALL
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL RED HAT
 * BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION
 * OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN 
 * CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 * Author:  Owen Taylor, Red Hat, Inc.
  }
{$ifndef XSETTINGS_CLIENT_H}
{$define XSETTINGS_CLIENT_H}
{$include <X11/Xlib.h>}
{$include "xsettings-common.h"}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
type

  PXSettingsAction = ^TXSettingsAction;
  TXSettingsAction =  Longint;
  Const
    XSETTINGS_ACTION_NEW = 0;
    XSETTINGS_ACTION_CHANGED = 1;
    XSETTINGS_ACTION_DELETED = 2;
;
type

  TXSettingsNotifyFunc = procedure (name:Pchar; action:TXSettingsAction; setting:PXSettingsSetting; cb_data:pointer);cdecl;

  TXSettingsWatchFunc = procedure (window:TWindow; is_start:TBool; mask:longint; cb_data:pointer);cdecl;

  TXSettingsGrabFunc = procedure (display:PDisplay);cdecl;

function xsettings_client_new(display:PDisplay; screen:longint; notify:TXSettingsNotifyFunc; watch:TXSettingsWatchFunc; cb_data:pointer):PXSettingsClient;cdecl;external libmb;
procedure xsettings_client_set_grab_func(client:PXSettingsClient; grab:TXSettingsGrabFunc);cdecl;external libmb;
procedure xsettings_client_set_ungrab_func(client:PXSettingsClient; ungrab:TXSettingsGrabFunc);cdecl;external libmb;
procedure xsettings_client_destroy(client:PXSettingsClient);cdecl;external libmb;
function xsettings_client_process_event(client:PXSettingsClient; xev:PXEvent):TBool;cdecl;external libmb;
function xsettings_client_get_setting(client:PXSettingsClient; name:Pchar; setting:PPXSettingsSetting):TXSettingsResult;cdecl;external libmb;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ XSETTINGS_CLIENT_H  }

// === Konventiert am: 15-11-26 17:34:46 ===


implementation



end.
