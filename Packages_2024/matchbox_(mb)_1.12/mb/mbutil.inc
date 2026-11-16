{$IFDEF read_interface}



function mb_exec(cmd: Pchar): longint; cdecl; external libmb;
function mb_single_instance_get_window(dpy: PDisplay; bin_name: Pchar): TWindow; cdecl; external libmb;
function mb_single_instance_is_starting(dpy: PDisplay; bin_name: Pchar): TBool; cdecl; external libmb;
function mb_util_get_homedir: Pchar; cdecl; external libmb;
procedure mb_util_window_activate(dpy: PDisplay; win: TWindow); cdecl; external libmb;
function mb_util_get_root_pixmap(dpy: PDisplay): TPixmap; cdecl; external libmb;
function mb_util_get_theme_full_path(theme_name: Pchar): Pchar; cdecl; external libmb;
procedure mb_util_animate_startup(dpy: PDisplay; x: longint; y: longint; width: longint; height: longint); cdecl; external libmb;
function mb_want_warnings: longint; cdecl; external libmb;

// === Konventiert am: 15-11-26 17:34:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
