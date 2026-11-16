{$IFDEF read_interface}

type
  PXSettingsClient = type Pointer;
  PPXSettingsClient = ^PXSettingsClient;

type
  PXSettingsAction = ^TXSettingsAction;
  TXSettingsAction = longint;
const
  XSETTINGS_ACTION_NEW = 0;
  XSETTINGS_ACTION_CHANGED = 1;
  XSETTINGS_ACTION_DELETED = 2;

type
  TXSettingsNotifyFunc = procedure(name: Pchar; action: TXSettingsAction; setting: PXSettingsSetting; cb_data: pointer); cdecl;
  TXSettingsWatchFunc = procedure(window: TWindow; is_start: Boolean; mask: longint; cb_data: pointer); cdecl;
  TXSettingsGrabFunc = procedure(display: PDisplay); cdecl;

function xsettings_client_new(display: PDisplay; screen: longint; notify: TXSettingsNotifyFunc; watch: TXSettingsWatchFunc; cb_data: pointer): PXSettingsClient; cdecl; external libmb;
procedure xsettings_client_set_grab_func(client: PXSettingsClient; grab: TXSettingsGrabFunc); cdecl; external libmb;
procedure xsettings_client_set_ungrab_func(client: PXSettingsClient; ungrab: TXSettingsGrabFunc); cdecl; external libmb;
procedure xsettings_client_destroy(client: PXSettingsClient); cdecl; external libmb;
function xsettings_client_process_event(client: PXSettingsClient; xev: PXEvent): TBool; cdecl; external libmb;
function xsettings_client_get_setting(client: PXSettingsClient; name: Pchar; setting: PPXSettingsSetting): TXSettingsResult; cdecl; external libmb;

// === Konventiert am: 15-11-26 17:34:46 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
