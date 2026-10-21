{$IFDEF read_interface}


procedure vnc_util_set_debug(enabled: Tgboolean); cdecl; external libgvnc;
function vnc_util_get_debug: Tgboolean; cdecl; external libgvnc;
function vnc_util_get_version: Tgint; cdecl; external libgvnc;
function vnc_util_get_version_string: Pgchar; cdecl; external libgvnc;
function vnc_util_check_version(major: Tgint; minor: Tgint; micro: Tgint): Tgboolean; cdecl; external libgvnc;

const
  VNC_PADDING = 4;
  VNC_PADDING_LARGE = 20;

  // === Konventiert am: 20-10-26 19:49:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
