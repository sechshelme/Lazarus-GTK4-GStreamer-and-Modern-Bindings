{$IFDEF read_interface}


type
  PXSettingsType = ^TXSettingsType;
  TXSettingsType = longint;
const
  XSETTINGS_TYPE_INT = 0;
  XSETTINGS_TYPE_STRING = 1;
  XSETTINGS_TYPE_COLOR = 2;

type
  PXSettingsResult = ^TXSettingsResult;
  TXSettingsResult = longint;
const
  XSETTINGS_SUCCESS = 0;
  XSETTINGS_NO_MEM = 1;
  XSETTINGS_ACCESS = 2;
  XSETTINGS_FAILED = 3;
  XSETTINGS_NO_ENTRY = 4;
  XSETTINGS_DUPLICATE_ENTRY = 5;

type
  PXSettingsBuffer = ^TXSettingsBuffer;
  TXSettingsBuffer = record
    byte_order: char;
    len: Tsize_t;
    data: pbyte;
    pos: pbyte;
  end;

  PXSettingsColor = ^TXSettingsColor;
  TXSettingsColor = record
    red: word;
    green: word;
    blue: word;
    alpha: word;
  end;

  PPXSettingsSetting = ^PXSettingsSetting;
  PXSettingsSetting = ^TXSettingsSetting;
  TXSettingsSetting = record
    name: Pchar;
    _type: TXSettingsType;
    data: record
      case longint of
        0: (v_int: longint);
        1: (v_string: Pchar);
        2: (v_color: TXSettingsColor);
      end;
    last_change_serial: dword;
  end;

  PPXSettingsList = ^PXSettingsList;
  PXSettingsList = ^TXSettingsList;
  TXSettingsList = record
    setting: PXSettingsSetting;
    next: PXSettingsList;
  end;

function xsettings_setting_copy(setting: PXSettingsSetting): PXSettingsSetting; cdecl; external libmb;
procedure xsettings_setting_free(setting: PXSettingsSetting); cdecl; external libmb;
function xsettings_setting_equal(setting_a: PXSettingsSetting; setting_b: PXSettingsSetting): longint; cdecl; external libmb;
procedure xsettings_list_free(list: PXSettingsList); cdecl; external libmb;
function xsettings_list_copy(list: PXSettingsList): PXSettingsList; cdecl; external libmb;
function xsettings_list_insert(list: PPXSettingsList; setting: PXSettingsSetting): TXSettingsResult; cdecl; external libmb;
function xsettings_list_lookup(list: PXSettingsList; name: Pchar): PXSettingsSetting; cdecl; external libmb;
function xsettings_list_delete(list: PPXSettingsList; name: Pchar): TXSettingsResult; cdecl; external libmb;
function xsettings_byte_order: char; cdecl; external libmb;
function XSETTINGS_PAD(n, m: longint): longint;


// === Konventiert am: 15-11-26 17:34:42 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function XSETTINGS_PAD(n, m: longint): longint;
begin
  XSETTINGS_PAD := ((n + m) - 1) and (not (m - 1));
end;


{$ENDIF read_implementation}
