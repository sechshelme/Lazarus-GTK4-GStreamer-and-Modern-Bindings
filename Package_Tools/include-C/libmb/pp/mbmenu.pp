
unit mbmenu;
interface

{
  Automatically converted by H2Pas 1.0.0 from mbmenu.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mbmenu.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PDisplay  = ^Display;
Plongint  = ^longint;
PMBColor  = ^MBColor;
PMBDrawable  = ^MBDrawable;
PMBFont  = ^MBFont;
Pmbmemu  = ^mbmemu;
PMBMenu  = ^MBMenu;
PMBMenuColorElement  = ^MBMenuColorElement;
PMBMenuItem  = ^MBMenuItem;
PMBMenuItemAddFlags  = ^MBMenuItemAddFlags;
PMBMenuMenu  = ^MBMenuMenu;
PMBMenuOptions  = ^MBMenuOptions;
PMBPixbuf  = ^MBPixbuf;
PMBPixbufImage  = ^MBPixbufImage;
Pmenu  = ^menu;
Pmenu_options  = ^menu_options;
Pmenuitem  = ^menuitem;
PXEvent  = ^XEvent;
PXSettingsClient  = ^XSettingsClient;
Pxxxxxxx  = ^xxxxxxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _MBMENU_H_}
{$define _MBMENU_H_}
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
{$include <libmb/mbconfig.h>}
{$include <stdio.h>}
{$include <unistd.h>}
{$include <stdlib.h>}
{$include <string.h>}
{$include <sys/types.h>}
{$include <sys/stat.h>}
{$include <dirent.h>}
{$include <signal.h>}
{$include <sys/wait.h>}
{$include <X11/Xlib.h>}
{$include <X11/Xutil.h>}
{$include <X11/Xatom.h>}
{$include <X11/Xresource.h>}
{$include <X11/extensions/shape.h>}
{$include <X11/Xatom.h>}
{$include <X11/keysymdef.h>}
{$include <X11/keysym.h>}
{$include <X11/Xmd.h>}
{$include <libmb/xsettings-client.h>}
{$include <libmb/mbpixbuf.h>}
{$include <libmb/mbexp.h>}
{*
 * @defgroup MBMenu MBMenu - A simple popup menu widget
 * @brief a simple independent popup menu widget, used mainly for application
 *  launchers etc.
 *
 * NOTE: Its planned that one day in the future this will be superceded by matchbox-tk. 
 * @
  }
{ 
   TODO?

   - mb_menu menu calls to mb_menu_menu ?
 }
{ C++ extern C conditionnal removed }
{*
 * @enum MBMenuColorElement
 *
 * Used to set various menu elements colours
  }type
  PMBMenuColorElement = ^TMBMenuColorElement;
  TMBMenuColorElement =  Longint;
  Const
    MBMENU_SET_BG_COL = 0;
    MBMENU_SET_FG_COL = 1;
    MBMENU_SET_HL_COL = 2;
    MBMENU_SET_BD_COL = 3;
;
{*
 * @enum MBMenuItemAddFlags
 *
 * Used to specify how an item is added to a menu
  }type
  PMBMenuItemAddFlags = ^TMBMenuItemAddFlags;
  TMBMenuItemAddFlags =  Longint;
  Const
    MBMENU_NO_SORT = 1 shl 1;
    MBMENU_PREPEND = 1 shl 2;
;
type
  Txxxxxxx =  Longint;
  Const
    MBMENU_ITEM_APP = 0;
    MBMENU_ITEM_FOLDER = 1;
    MBMENU_ITEM_SEPERATOR = 2;

{ for mb_menu_new  }
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
      fontname : Pchar;
      foreground_col_spec : Pchar;
      background_col_spec : Pchar;
      highlight_col_spec : Pchar;
      border_col_spec : Pchar;
      border_size : longint;
      icon_dimention : longint;
      default_icon_filename : Pchar;
      default_folder_icon_filename : Pchar;
      bg_img_filename : Pchar;
      transparency_level : longint;
      bevel_size : longint;
    end;
  TMBMenuOptions = Tmenu_options;
  PMBMenuOptions = ^TMBMenuOptions;
{*
 * @typedef MBMenuMenu
 *
 * Opaque type for a  menu
  }{
#ifdef USE_XFT
  XftDraw *xftdraw;
  XftDraw *shadow_xftdraw;
  XftDraw *active_xftdraw;
  int expose_cnt;
#endif
   }

  Pmenu = ^Tmenu;
  Tmenu = record
      title : Pchar;
      items : Pmenuitem;
      active_item : Pmenuitem;
      too_big_start_item : Pmenuitem;
      too_big_end_item : Pmenuitem;
      parent_item : Pmenuitem;
      x : longint;
      y : longint;
      width : longint;
      height : longint;
      depth : longint;
      win : TWindow;
      mask_gc : TGC;
      too_big : TBool;
      active_item_drw : PMBDrawable;
      backing : PMBDrawable;
    end;
  TMBMenuMenu = Tmenu;
  PMBMenuMenu = ^TMBMenuMenu;
{*
 * @typedef MBMenuItem
 *
 * Opaque type for a menu item
  }
  Pmenuitem = ^Tmenuitem;
  Tmenuitem = record
      _type : longint;
      title : Pchar;
      cb : procedure (item:Pmenuitem);cdecl;
      cb_data : pointer;
      info : Pchar;
      icon_fn : Pchar;
      img : PMBPixbufImage;
      child : PMBMenuMenu;
      next_item : Pmenuitem;
      y : longint;
      h : longint;
    end;
  TMBMenuItem = Tmenuitem;
  PMBMenuItem = ^TMBMenuItem;
{ XXX MBMenuItem  }
{*
 * @typedef MBMenu
 *
 * Opaque type for a 'top level' menu
  }{
#ifdef USE_XFT
   XftFont *xftfont;
   XftColor fg_xftcol;
   XftColor bg_xftcol;
   XftColor hl_xftcol;
   XftColor bd_xftcol;
   XftColor shadow_xftcol;
#else
   XFontStruct* font;
#endif
   XColor   fg_xcol;
   XColor   bg_xcol;
   XColor   hl_xcol;
   XColor   bd_xcol;
   }
{ X window border  }
{ Non X border  }
{ 0 - no icons, else icon size after scale  }
{ XXX Togo  }

  Pmbmemu = ^Tmbmemu;
  Tmbmemu = record
      dpy : PDisplay;
      root : TWindow;
      screen : longint;
      font : PMBFont;
      fg_col : PMBColor;
      bg_col : PMBColor;
      hl_col : PMBColor;
      bd_col : PMBColor;
      gc : TGC;
      have_highlight_col : TBool;
      options : longint;
      border_width : longint;
      inner_border_width : longint;
      border_cols : array[0..2] of TXColor;
      trans : longint;
      icon_dimention : longint;
      pb : PMBPixbuf;
      img_default_folder : PMBPixbufImage;
      img_default_app : PMBPixbufImage;
      img_bg : PMBPixbufImage;
      arrow_icon : TPixmap;
      arrow_mask : TPixmap;
      bg_pixmap : TPixmap;
      bg_pixmap_mask : TPixmap;
      rootmenu : Pmenu;
      xmenu_is_active : TBool;
      active : array[0..9] of Pmenu;
      active_depth : longint;
      atom_mbtheme : TAtom;
      keyboard_focus_menu : Pmenu;
      xsettings_client : PXSettingsClient;
    end;
  TMBMenu = Tmbmemu;
  PMBMenu = ^TMBMenu;
{*
 * @typedef MBMenuActivateCB
 *
 * Callback for an activated menu item.
  }
  TMBMenuActivateCB = procedure (item:PMBMenuItem);cdecl;
{*
 * Creates a new toplevel mbmenu instance
 *
 * @param dpy X Display
 * @param screen X Screen
 * @returns an mbmenu instance, NULL on failure. 
  }

function mb_menu_new(dpy:PDisplay; screen:longint):PMBMenu;cdecl;external;
{*
 * Sets the font used by the referenced menu
 *
 * @param mbmenu mb menu instance
 * @param font_desc font to load
 * @returns True if font loaded, False on failiure
  }
function mb_menu_set_font(mbmenu:PMBMenu; font_desc:Pchar):TBool;cdecl;external;
{*
 * Sets the default icons to be uses when not supplied by an individual item
 *
 * @param mbmenu mb menu instance
 * @param folder icon filename for folders
 * @param app    icon filename for items
 * @returns True if icons loaded ok, False on failiure
  }
function mb_menu_set_default_icons(mbmenu:PMBMenu; folder:Pchar; app:Pchar):TBool;cdecl;external;
{*
 * Sets the icon dimention in pixels used by the referenced menu instance.
 * If set to zero, icons will not be used by the menu. 
 *
 * @param mbmenu mb menu instance
 * @param size Icon dimention in pixels
  }
procedure mb_menu_set_icon_size(mbmenu:PMBMenu; size:longint);cdecl;external;
{*
 * Sets the font used by the referenced menu instance
 *
 * @param mbmenu mb menu instance
 * @param element Which part of the menu to set color
 * @param col_spec Color specification in the form #RRGGBB
  }
procedure mb_menu_set_col(mbmenu:PMBMenu; element:TMBMenuColorElement; col_spec:Pchar);cdecl;external;
{*
 * Sets the menu's transparency level. The Transparency is a HACK!, use at 
 * your own risk, its unsupported. 
 *
 * @param mbmenu mb menu instance
 * @param trans Transparency level
  }
procedure mb_menu_set_trans(mbmenu:PMBMenu; trans:longint);cdecl;external;
{*
 * Gets the top level MBMenu menu.
 * This menu is automatically created on initialisation
 *
 * @param mbmenu mb menu instance
 * @returns root menu instance. 
  }
function mb_menu_get_root_menu(mbmenu:PMBMenu):PMBMenuMenu;cdecl;external;
{*
 * Gets the top level MBMenu menu size.
 *
 * @param mbmenu mb menu instance
 * @param width pointer to populate width int
 * @param height pointer to populate height int
 * @returns True on success, False on fail ( 0x0 menu ). 
  }
function mb_menu_get_root_menu_size(mbmenu:PMBMenu; width:Plongint; height:Plongint):TBool;cdecl;external;
{*
 * Adds a seperator to a menu.
 *
 * @param mbmenu MBMenu instance
 * @param menu The menu to add the seperator too. 
 * @param flags can be 0 or MBMENU_PREPEND to prepend the seperator rather
 *        than append the seperator to the menu. 
  }
procedure mb_menu_add_seperator_to_menu(mbmenu:PMBMenu; menu:PMBMenuMenu; flags:longint);cdecl;external;
{*
 * Adds single or multiple new menus to an mbmenu instance. 
 *
 * @param mbmenu MBMenu instance
 * @param path 
 * @param icon_path 
 * @param flags can be 0 or MBMENU_PREPEND to prepend the seperator rather
 *        than append the seperator to the menu. 
 * @returns new created menu 
  }
function mb_menu_add_path(mbmenu:PMBMenu; path:Pchar; icon_path:Pchar; flags:longint):PMBMenuMenu;cdecl;external;
{*
 * Removes a menu and all of its sub menus
 *
 * @param mbmenu mb menu instance
 * @param menu menu to remove
  }
procedure mb_menu_remove_menu(mbmenu:PMBMenu; menu:PMBMenuMenu);cdecl;external;
{*
 * Free's a mbmenu toplevel instance
 *
 * @param mbmenu mbmenu instance
  }
procedure mb_menu_free(mbmenu:PMBMenu);cdecl;external;
{*
 * Checks to see if specified menu intance is active ( ie popped up )
 *
 * @param mbmenu mb menu instance
 * @returns True if menu is active, False otherwise
  }
function mb_menu_is_active(mbmenu:PMBMenu):TBool;cdecl;external;
{*
 * Checks to see if specified menu intance is active ( ie popped up )
 *
 * @param mbmenu mb menu instance
 * @param x x co-ord ( relative to root window origin ) to activate menu
 * @param y y co-ord ( relative to root window origin ) to activate menu
 *
  }
procedure mb_menu_activate(mbmenu:PMBMenu; x:longint; y:longint);cdecl;external;
{*
 * Deactivates ( hides ) a mbmenu instance.
 *
 * @param mbmenu mb menu instance
  }
procedure mb_menu_deactivate(mbmenu:PMBMenu);cdecl;external;
{*
 * Processes an X Event.
 *
 * @param mbmenu mb menu instance
 * @param xevent Xevent to process
 *
  }
procedure mb_menu_handle_xevent(mbmenu:PMBMenu; xevent:PXEvent);cdecl;external;
{*
 * Adds a new menu item to a menu. 
 *
 * @param mbmenu mb menu instance
 * @param menu menu to add the item too
 * @param title menu item title
 * @param activate_callback function to call when menu is clicked.
 * @param user_data  user data to attach to item.
 * @param flags specify how the item is added to the menu
 * @returns the created menu item or NULL on failiure. 
 *
  }
function mb_menu_new_item(mbmenu:PMBMenu; menu:PMBMenuMenu; title:Pchar; activate_callback:TMBMenuActivateCB; user_data:pointer; 
           flags:TMBMenuItemAddFlags):PMBMenuItem;cdecl;external;
{ XXX TOGO  }
function mb_menu_add_item_to_menu(mbmenu:PMBMenu; menu:PMBMenuMenu; title:Pchar; icon:Pchar; info:Pchar; 
           cmd:procedure (item:PMBMenuItem); cb_data:pointer; flags:longint):PMBMenuItem;cdecl;external;
{*
 * Adds a new menu item to a menu. 
 *
 * @param mbmenu mb menu instance
 * @param item menu item 
 * @param img mbpixbuf image to set use as item image
  }
procedure mb_menu_item_icon_set(mbmenu:PMBMenu; item:PMBMenuItem; img:PMBPixbufImage);cdecl;external;
{*
 * Gets any user data attatched to a menu item
 *
 * @param item menu item 
 * @returns void pointer to set user data.
  }
function mb_menu_item_get_user_data(item:PMBMenuItem):pointer;cdecl;external;
{*
 * Removes a menu item
 *
 * @param mbmenu mbmenu instance
 * @param menu the menu to remove from
 * @param item the menu item
  }
procedure mb_menu_item_remove(mbmenu:PMBMenu; menu:PMBMenuMenu; item:PMBMenuItem);cdecl;external;
{*
 * Dumps an mbmenu menu structure to stdout
 *
 * @param mbmenu mb menu instance
 * @param menu menu to dump 
 * 
  }
procedure mb_menu_dump(mbmenu:PMBMenu; menu:PMBMenuMenu);cdecl;external;
{ C++ end of extern C conditionnal removed }
{* @  }
{$endif}

implementation


end.
