unit xsettings_common;

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
{$ifndef XSETTINGS_COMMON_H}
{$define XSETTINGS_COMMON_H}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
type
{ Types of settings possible. Enum values correspond to
 * protocol values.
  }

  PXSettingsType = ^TXSettingsType;
  TXSettingsType =  Longint;
  Const
    XSETTINGS_TYPE_INT = 0;
    XSETTINGS_TYPE_STRING = 1;
    XSETTINGS_TYPE_COLOR = 2;
;
type
  PXSettingsResult = ^TXSettingsResult;
  TXSettingsResult =  Longint;
  Const
    XSETTINGS_SUCCESS = 0;
    XSETTINGS_NO_MEM = 1;
    XSETTINGS_ACCESS = 2;
    XSETTINGS_FAILED = 3;
    XSETTINGS_NO_ENTRY = 4;
    XSETTINGS_DUPLICATE_ENTRY = 5;
;
type
  PXSettingsBuffer = ^TXSettingsBuffer;
  TXSettingsBuffer = record
      byte_order : char;
      len : Tsize_t;
      data : Pbyte;
      pos : Pbyte;
    end;

  PXSettingsColor = ^TXSettingsColor;
  TXSettingsColor = record
      red : word;
      green : word;
      blue : word;
      alpha : word;
    end;

  PXSettingsList = ^TXSettingsList;
  TXSettingsList = record
      setting : PXSettingsSetting;
      next : PXSettingsList;
    end;

  PXSettingsSetting = ^TXSettingsSetting;
  TXSettingsSetting = record
      name : Pchar;
      _type : TXSettingsType;
      data : record
          case longint of
            0 : ( v_int : longint );
            1 : ( v_string : Pchar );
            2 : ( v_color : TXSettingsColor );
          end;
      last_change_serial : dword;
    end;


function xsettings_setting_copy(setting:PXSettingsSetting):PXSettingsSetting;cdecl;external libmb;
procedure xsettings_setting_free(setting:PXSettingsSetting);cdecl;external libmb;
function xsettings_setting_equal(setting_a:PXSettingsSetting; setting_b:PXSettingsSetting):longint;cdecl;external libmb;
procedure xsettings_list_free(list:PXSettingsList);cdecl;external libmb;
function xsettings_list_copy(list:PXSettingsList):PXSettingsList;cdecl;external libmb;
function xsettings_list_insert(list:PPXSettingsList; setting:PXSettingsSetting):TXSettingsResult;cdecl;external libmb;
function xsettings_list_lookup(list:PXSettingsList; name:Pchar):PXSettingsSetting;cdecl;external libmb;
function xsettings_list_delete(list:PPXSettingsList; name:Pchar):TXSettingsResult;cdecl;external libmb;
function xsettings_byte_order:char;cdecl;external libmb;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function XSETTINGS_PAD(n,m : longint) : longint;

{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ XSETTINGS_COMMON_H  }

// === Konventiert am: 15-11-26 17:34:42 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function XSETTINGS_PAD(n,m : longint) : longint;
begin
  XSETTINGS_PAD:=((n+m)-1) and ( not (m-1));
end;


end.
