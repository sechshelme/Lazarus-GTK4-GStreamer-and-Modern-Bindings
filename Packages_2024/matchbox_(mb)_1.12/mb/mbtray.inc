{$IFDEF read_interface}


type
  PMBTrayApp = type Pointer;

  TMBTrayBackgroundCB = procedure(user_data: pointer); cdecl;
  TMBTrayAppResizeCB = procedure(mb: PMBTrayApp; width: longint; height: longint); cdecl;
  TMBTrayAppPaintCB = procedure(mb: PMBTrayApp; drawable: TDrawable); cdecl;
  TMBTrayAppContextCB = procedure(mb: PMBTrayApp); cdecl;
  TMBTrayAppButtonEventCB = procedure(mb_tray_app: PMBTrayApp; x: longint; y: longint; is_release: TBool); cdecl;
  TMBTrayAppXEventCB = procedure(mb_tray_app: PMBTrayApp; event: PXEvent); cdecl;
  TMBTrayAppThemeChangeCB = procedure(mb_tray_app: PMBTrayApp; theme_name: Pchar); cdecl;
  TMBTrayAppPollCB = procedure(mb_tray_app: PMBTrayApp); cdecl;

function mb_tray_app_new(app_name: pbyte; resize_cb: TMBTrayAppResizeCB; paint_cb: TMBTrayAppPaintCB; argc: Plongint; argv: PPPchar): PMBTrayApp; cdecl; external libmb;
function mb_tray_app_new_with_display(app_name: pbyte; resize_cb: TMBTrayAppResizeCB; paint_cb: TMBTrayAppPaintCB; argc: Plongint; argv: PPPchar;
  display: PDisplay): PMBTrayApp; cdecl; external libmb;
procedure mb_tray_app_set_xevent_callback(mb_tray_app: PMBTrayApp; xevent_cb: TMBTrayAppXEventCB); cdecl; external libmb;
procedure mb_tray_app_set_button_callback(mb_tray_app: PMBTrayApp; button_cb: TMBTrayAppButtonEventCB); cdecl; external libmb;
procedure mb_tray_app_set_theme_change_callback(mb_tray_app: PMBTrayApp; theme_cb: TMBTrayAppThemeChangeCB); cdecl; external libmb;
procedure mb_tray_app_set_timeout_callback(mb_tray_app: PMBTrayApp; poll_cb: TMBTrayAppPollCB; tv: Ptimeval); cdecl; external libmb;
procedure mb_tray_app_set_resize_callback(mb_tray_app: PMBTrayApp; resize_cb: TMBTrayAppResizeCB); cdecl; external libmb;
procedure mb_tray_app_set_paint_callback(mb_tray_app: PMBTrayApp; paint_cb: TMBTrayAppPaintCB); cdecl; external libmb;
procedure mb_tray_app_set_context_callback(mb_tray_app: PMBTrayApp; context_cb: TMBTrayAppContextCB); cdecl; external libmb;
procedure mb_tray_app_request_size(mb_tray_app: PMBTrayApp; width: longint; height: longint); cdecl; external libmb;
procedure mb_tray_app_request_offset(mb_tray_app: PMBTrayApp; offset: longint); cdecl; external libmb;
procedure mb_tray_app_set_poll_timeout(mb_tray_app: PMBTrayApp; tv: Ptimeval); cdecl; external libmb;
procedure mb_tray_app_repaint(mb_tray_app: PMBTrayApp); cdecl; external libmb;
procedure mb_tray_app_tray_send_message(mb_tray_app: PMBTrayApp; msg: pbyte; timeout: longint); cdecl; external libmb;
procedure mb_tray_app_set_name(mb_tray_app: PMBTrayApp; name: pbyte); cdecl; external libmb;
procedure mb_tray_app_set_context_info(mb_tray_app: PMBTrayApp; info: pbyte); cdecl; external libmb;
procedure mb_tray_app_set_icon(mb_tray_app: PMBTrayApp; pixbuf: PMBPixbuf; image: PMBPixbufImage); cdecl; external libmb;
procedure mb_tray_app_set_session(mb_tray_app: PMBTrayApp; val: TBool); cdecl; external libmb;
function mb_tray_app_get_session(mb_tray_app: PMBTrayApp): TBool; cdecl; external libmb;
function mb_tray_app_get_absolute_coords(mb_tray_app: PMBTrayApp; x: Plongint; y: Plongint): TBool; cdecl; external libmb;
procedure mb_tray_app_set_user_data(mb_tray_app: PMBTrayApp; data: pointer); cdecl; external libmb;
function mb_tray_app_get_user_data(mb_tray_app: PMBTrayApp): pointer; cdecl; external libmb;
function mb_tray_app_tray_is_vertical(mb_tray_app: PMBTrayApp): TBool; cdecl; external libmb;
function mb_tray_app_get_background(mb_tray_app: PMBTrayApp; pixbuf: PMBPixbuf): PMBPixbufImage; cdecl; external libmb;
function mb_tray_app_get_theme_name(mb_tray_app: PMBTrayApp): Pchar; cdecl; external libmb;
function mb_tray_app_get_xevent_mask(mb_tray_app: PMBTrayApp): longint; cdecl; external libmb;
procedure mb_tray_app_set_xevent_mask(mb_tray_app: PMBTrayApp; mask: longint); cdecl; external libmb;
function mb_tray_app_xdisplay(mb_tray_app: PMBTrayApp): PDisplay; cdecl; external libmb;
function mb_tray_app_xscreen(mb_tray_app: PMBTrayApp): longint; cdecl; external libmb;
function mb_tray_app_xrootwin(mb_tray_app: PMBTrayApp): TWindow; cdecl; external libmb;
function mb_tray_app_xwin(mb_tray_app: PMBTrayApp): TWindow; cdecl; external libmb;
function mb_tray_app_width(mb_tray_app: PMBTrayApp): longint; cdecl; external libmb;
function mb_tray_app_height(mb_tray_app: PMBTrayApp): longint; cdecl; external libmb;
function mb_tray_app_offset(mb_tray_app: PMBTrayApp): longint; cdecl; external libmb;
procedure mb_tray_app_main_init(mb_tray_app: PMBTrayApp); cdecl; external libmb;
procedure mb_tray_app_main(mb_tray_app: PMBTrayApp); cdecl; external libmb;
procedure mb_tray_app_hide(mb_tray_app: PMBTrayApp); cdecl; external libmb;
procedure mb_tray_app_unhide(mb_tray_app: PMBTrayApp); cdecl; external libmb;
procedure mb_tray_app_main_quit(mb_tray_app: PMBTrayApp); cdecl; external libmb;
procedure mb_tray_handle_xevent(mb_tray_app: PMBTrayApp; xevent: PXEvent); cdecl; external libmb;

function mb_tray_init(dpy: PDisplay; win: TWindow): longint; cdecl; external libmb;
function mb_tray_get_window: TWindow; cdecl; external libmb;
procedure mb_tray_init_session_info(d: PDisplay; win: TWindow; argv: PPchar; argc: longint); cdecl; external libmb;
procedure mb_tray_handle_event(dpy: PDisplay; win: TWindow; an_event: PXEvent); cdecl; external libmb;
procedure mb_tray_send_message(d: PDisplay; win: TWindow; msg: pbyte; timeout: longint); cdecl; external libmb;
procedure mb_tray_map_window(dpy: PDisplay; win: TWindow); cdecl; external libmb;
procedure mb_tray_bg_change_cb_set(bg_changed_cb: TMBTrayBackgroundCB; user_data: pointer); cdecl; external libmb;
function mb_tray_get_bg_col(dpy: PDisplay; xcol: PXColor): TBool; cdecl; external libmb;
procedure mb_tray_window_icon_set(dpy: PDisplay; win_panel: TWindow; img: PMBPixbufImage); cdecl; external libmb;
procedure mb_tray_unmap_window(dpy: PDisplay; win: TWindow); cdecl; external libmb;
function mb_tray_get_bg_img(pb: PMBPixbuf; win: TWindow): PMBPixbufImage; cdecl; external libmb;

// === Konventiert am: 15-11-26 17:34:52 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
