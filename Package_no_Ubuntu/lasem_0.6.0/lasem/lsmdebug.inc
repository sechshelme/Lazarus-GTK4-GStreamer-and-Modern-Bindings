{$IFDEF read_interface}


type
  PLsmDebugLevel = ^TLsmDebugLevel;
  TLsmDebugLevel = longint;

const
  LSM_DEBUG_LEVEL_NONE = 0;
  LSM_DEBUG_LEVEL_WARNING = 1;
  LSM_DEBUG_LEVEL_DEBUG = 2;
  LSM_DEBUG_LEVEL_LOG = 3;
  LSM_DEBUG_LEVEL_COUNT = 4;

type
  TLsmDebugCategory = record
    name: pchar;
    level: TLsmDebugLevel;
  end;
  PLsmDebugCategory = TLsmDebugCategory;

var
  lsm_debug_category_dom : TLsmDebugCategory;cvar;external liblasem;
  lsm_debug_category_measure : TLsmDebugCategory;cvar;external liblasem;
  lsm_debug_category_update : TLsmDebugCategory;cvar;external liblasem;
  lsm_debug_category_render : TLsmDebugCategory;cvar;external liblasem;
  lsm_debug_category_viewport : TLsmDebugCategory;cvar;external liblasem;

procedure lsm_warning(category: PLsmDebugCategory; format: pchar); varargs; cdecl; external liblasem;
procedure lsm_debug(category: PLsmDebugCategory; format: pchar); varargs; cdecl; external liblasem;
procedure lsm_log(category: PLsmDebugCategory; format: pchar); varargs; cdecl; external liblasem;
function lsm_debug_check(category: PLsmDebugCategory; level: TLsmDebugLevel): Tgboolean; cdecl; external liblasem;
procedure lsm_debug_enable(category_selection: pchar); cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:10:47 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
