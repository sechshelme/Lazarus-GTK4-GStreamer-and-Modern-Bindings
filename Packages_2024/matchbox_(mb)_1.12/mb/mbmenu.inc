{$IFDEF read_interface}


type
  PMBMenuColorElement = ^TMBMenuColorElement;
  TMBMenuColorElement = longint;
const
  MBMENU_SET_BG_COL = 0;
  MBMENU_SET_FG_COL = 1;
  MBMENU_SET_HL_COL = 2;
  MBMENU_SET_BD_COL = 3;

type
  PMBMenuItemAddFlags = ^TMBMenuItemAddFlags;
  TMBMenuItemAddFlags = longint;
const
  MBMENU_NO_SORT = 1 shl 1;
  MBMENU_PREPEND = 1 shl 2;

const
  MBMENU_ITEM_APP = 0;
  MBMENU_ITEM_FOLDER = 1;
  MBMENU_ITEM_SEPERATOR = 2;

const
  MBMENU_FG_COL = 1 shl 1;
  MBMENU_BG_COL = 1 shl 2;
  MBMENU_HL_COL = 1 shl 3;
  MBMENU_BD_COL = 1 shl 4;
  MBMENU_FONT = 1 shl 5;
  MBMENU_BD_SZ = 1 shl 6;
  MBMENU_ICON_SZ = 1 shl 7;
  MBMENU_ICON_FN = 1 shl 8;
  MBMENU_ICON_FOLDER_FN = 1 shl 9;
  MBMENU_TRANS = 1 shl 10;
  MBMENU_BG_FN = 1 shl 11;
  MBMENU_BEVEL = 1 shl 12;

type
  Pmenu_options = ^Tmenu_options;
  Tmenu_options = record
    fontname: Pchar;
    foreground_col_spec: Pchar;
    background_col_spec: Pchar;
    highlight_col_spec: Pchar;
    border_col_spec: Pchar;
    border_size: longint;
    icon_dimention: longint;
    default_icon_filename: Pchar;
    default_folder_icon_filename: Pchar;
    bg_img_filename: Pchar;
    transparency_level: longint;
    bevel_size: longint;
  end;
  TMBMenuOptions = Tmenu_options;
  PMBMenuOptions = ^TMBMenuOptions;

  Pmenuitem = ^Tmenuitem;
  Pmenu = ^Tmenu;
  Tmenu = record
    title: Pchar;
    items: Pmenuitem;
    active_item: Pmenuitem;
    too_big_start_item: Pmenuitem;
    too_big_end_item: Pmenuitem;
    parent_item: Pmenuitem;
    x: longint;
    y: longint;
    width: longint;
    height: longint;
    depth: longint;
    win: TWindow;
    mask_gc: TGC;
    too_big: TBool;
    active_item_drw: PMBDrawable;
    backing: PMBDrawable;
  end;
  TMBMenuMenu = Tmenu;
  PMBMenuMenu = ^TMBMenuMenu;

  Tmenuitem = record
    _type: longint;
    title: Pchar;
    cb: procedure(item: Pmenuitem); cdecl;
    cb_data: pointer;
    info: Pchar;
    icon_fn: Pchar;
    img: PMBPixbufImage;
    child: PMBMenuMenu;
    next_item: Pmenuitem;
    y: longint;
    h: longint;
  end;
  TMBMenuItem = Tmenuitem;
  PMBMenuItem = ^TMBMenuItem;

  Pmbmemu = ^Tmbmemu;
  Tmbmemu = record
    dpy: PDisplay;
    root: TWindow;
    screen: longint;
    font: PMBFont;
    fg_col: PMBColor;
    bg_col: PMBColor;
    hl_col: PMBColor;
    bd_col: PMBColor;
    gc: TGC;
    have_highlight_col: TBool;
    options: longint;
    border_width: longint;
    inner_border_width: longint;
    border_cols: array[0..2] of TXColor;
    trans: longint;
    icon_dimention: longint;
    pb: PMBPixbuf;
    img_default_folder: PMBPixbufImage;
    img_default_app: PMBPixbufImage;
    img_bg: PMBPixbufImage;
    arrow_icon: TPixmap;
    arrow_mask: TPixmap;
    bg_pixmap: TPixmap;
    bg_pixmap_mask: TPixmap;
    rootmenu: Pmenu;
    xmenu_is_active: TBool;
    active: array[0..9] of Pmenu;
    active_depth: longint;
    atom_mbtheme: TAtom;
    keyboard_focus_menu: Pmenu;
    xsettings_client: PXSettingsClient;
  end;
  TMBMenu = Tmbmemu;
  PMBMenu = ^TMBMenu;

  TMBMenuActivateCB = procedure(item: PMBMenuItem); cdecl;

function mb_menu_new(dpy: PDisplay; screen: longint): PMBMenu; cdecl; external libmb;
function mb_menu_set_font(mbmenu: PMBMenu; font_desc: Pchar): TBool; cdecl; external libmb;
function mb_menu_set_default_icons(mbmenu: PMBMenu; folder: Pchar; app: Pchar): TBool; cdecl; external libmb;
procedure mb_menu_set_icon_size(mbmenu: PMBMenu; size: longint); cdecl; external libmb;
procedure mb_menu_set_col(mbmenu: PMBMenu; element: TMBMenuColorElement; col_spec: Pchar); cdecl; external libmb;
procedure mb_menu_set_trans(mbmenu: PMBMenu; trans: longint); cdecl; external libmb;
function mb_menu_get_root_menu(mbmenu: PMBMenu): PMBMenuMenu; cdecl; external libmb;
function mb_menu_get_root_menu_size(mbmenu: PMBMenu; width: Plongint; height: Plongint): TBool; cdecl; external libmb;
procedure mb_menu_add_seperator_to_menu(mbmenu: PMBMenu; menu: PMBMenuMenu; flags: longint); cdecl; external libmb;
function mb_menu_add_path(mbmenu: PMBMenu; path: Pchar; icon_path: Pchar; flags: longint): PMBMenuMenu; cdecl; external libmb;
procedure mb_menu_remove_menu(mbmenu: PMBMenu; menu: PMBMenuMenu); cdecl; external libmb;
procedure mb_menu_free(mbmenu: PMBMenu); cdecl; external libmb;
function mb_menu_is_active(mbmenu: PMBMenu): TBool; cdecl; external libmb;
procedure mb_menu_activate(mbmenu: PMBMenu; x: longint; y: longint); cdecl; external libmb;
procedure mb_menu_deactivate(mbmenu: PMBMenu); cdecl; external libmb;
procedure mb_menu_handle_xevent(mbmenu: PMBMenu; xevent: PXEvent); cdecl; external libmb;
function mb_menu_new_item(mbmenu: PMBMenu; menu: PMBMenuMenu; title: Pchar; activate_callback: TMBMenuActivateCB; user_data: pointer;
  flags: TMBMenuItemAddFlags): PMBMenuItem; cdecl; external libmb;

type
  Tmenu_add = procedure(item: PMBMenuItem); cdecl;

function mb_menu_add_item_to_menu(mbmenu: PMBMenu; menu: PMBMenuMenu; title: Pchar; icon: Pchar; info: Pchar;
  cmd: Tmenu_add; cb_data: pointer; flags: longint): PMBMenuItem; cdecl; external libmb;
procedure mb_menu_item_icon_set(mbmenu: PMBMenu; item: PMBMenuItem; img: PMBPixbufImage); cdecl; external libmb;
function mb_menu_item_get_user_data(item: PMBMenuItem): pointer; cdecl; external libmb;
procedure mb_menu_item_remove(mbmenu: PMBMenu; menu: PMBMenuMenu; item: PMBMenuItem); cdecl; external libmb;
procedure mb_menu_dump(mbmenu: PMBMenu; menu: PMBMenuMenu); cdecl; external libmb;

// === Konventiert am: 15-11-26 17:34:55 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
