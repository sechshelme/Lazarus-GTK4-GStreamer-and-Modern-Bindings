unit mbtray;

interface

uses
  fp_mb;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


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
{$ifndef _MB_TRAY_H_}
{$define _MB_TRAY_H_}
{$include <stdio.h>}
{$include <stdlib.h>}
{$include <sys/types.h>}
{$include <unistd.h>}
{$include <X11/Xlib.h>}
{$include <X11/Xutil.h>}
{$include <X11/Xatom.h>}
{$include <X11/Xmd.h>}
{$include <libmb/mb.h>}
{ C++ extern C conditionnal removed }
{*
 * @defgroup mbtray MBTray - System tray applet toolkit
 * @brief A simple toolkit for creating xlib based tray ( aka panel )
 * 'applets'. 
 * See <a href="http://www.freedesktop.org/standards/systemtray.html">System tray Spec</a> 
 * and <a href="http://www.freedesktop.org/standards/xembed.html">XEmbed</a> 
 * Spec for infomation on the gory details of the mechanism.
 *
 * Example: A very basic panel app. Displays an image and message when 
 *          clicked on
 * 
 * <pre>
 * 
 * #include <libmb/mb.h>
 * 
 * MBPixbuf      *Pixbuf;
 * MBPixbufImage *AppImage
 * 
 * void
 * paint_callback ( MBTrayApp *app, Drawable drw )
 * 
 *   MBPixbufImage *img_scaled;
 * 
 *   img_scaled = mb_pixbuf_img_scale (Pixbuf, AppIcon,
 * 				    mb_tray_app_width(app),
 * 				    mb_tray_app_height(app));
 * 
 *   mb_pixbuf_img_render_to_drawable (Pixbuf, img_scaled, drw, 0, 0);
 * 
 *   mb_pixbuf_img_free( Pixbuf, img_scaled );
 * 
 * 
 * void
 * button_callback (MBTrayApp *app, int x, int y, Bool is_released )
 * 
 *   if (is_released)
 *     mb_tray_app_tray_send_message(app, "Hello World!", 10);
 * 
 * 
 * int 
 * main(int argc, char **argv)
 * 
 *   MBTrayApp *app = NULL;
 * 
 *   app = mb_tray_app_new ( "Tray Demo App",
 * 			  NULL,
 * 			  paint_callback,
 * 			  &argc,
 * 			  &argv );  
 * 
 *   if (app == NULL) usage();
 *   
 *   Pixbuf = mb_pixbuf_new(mb_tray_app_xdisplay(app), 
 * 			 mb_tray_app_xscreen(app));
 * 
 *   AppImage = mb_pixbuf_img_new_from_file(Pixbuf, "some_image.png")
 * 
 *   mb_tray_app_set_button_callback (app, button_callback );
 * 
 *   mb_tray_app_main(app);
 * 
 *
 * </pre> 
 *
 * There are also numerous other examples in the matchbox distrubution source
 * ( see the util directory ).
 * These should give you more infomation on handling resizes etc. 
 *  
 * @
  }
{*
 * @typedef MBTrayApp
 *
 * Opaque structure used for representing a tray app 
  }type
{ TOGO ?  }

  TMBTrayBackgroundCB = procedure (user_data:pointer);cdecl;
{*
 * @typedef MBTrayAppResizeCB
 *
 * Callback for a resize. 
 * Is triggered when the panel resizes your application. 
  }
  TMBTrayAppResizeCB = procedure (mb:PMBTrayApp; width:longint; height:longint);cdecl;
{*
 * @typedef MBTrayAppPaintCB
 *
 * Callback for a handling a 'paint' or expose event.
 *
 * You application should paint to the supplied X Drawable. 
 * Also see #mb_tray_app_get_background for getting a #MBPixbufImg 
 * representation of the panel area below your application. Using this
 * you can alpha composite you application to the panel. 
 *
 * You should make sure you paint the entire supplied drawable. 
  }
  TMBTrayAppPaintCB = procedure (mb:PMBTrayApp; drawable:TDrawable);cdecl;
{*
 * @typedef MBTrayAppPaintCB
 *
 * Callback for a handling a 'context' message.
 *
 * if #mb_tray_set_context_info has been called, this callback will
 * be triggered when a user clicks on the bubble message context text.
 *
  }
  TMBTrayAppContextCB = procedure (mb:PMBTrayApp);cdecl;
{*
 * @typedef MBTrayAppButtonEventCB
 *
 * Callback for a button event. 
  }
  TMBTrayAppButtonEventCB = procedure (mb_tray_app:PMBTrayApp; x:longint; y:longint; is_release:TBool);cdecl;
{*
 * @typedef MBTrayAppXEventCB
 *
 * Callback for an X event. Also see #mb_tray_app_get_xevent_mask and
 * #mb_tray_app_set_xevent_mask
  }
  TMBTrayAppXEventCB = procedure (mb_tray_app:PMBTrayApp; event:PXEvent);cdecl;
{*
 * @typedef MBTrayAppThemeChangeCB
 *
 * Callback for a theme change.
  }
  TMBTrayAppThemeChangeCB = procedure (mb_tray_app:PMBTrayApp; theme_name:Pchar);cdecl;
{*
 * @typedef MBTrayAppPollCB
 *
 * Callback for a Timeout event. 
  }
  TMBTrayAppPollCB = procedure (mb_tray_app:PMBTrayApp);cdecl;
{*
 * Constructs a new tray app instance. 
 *
 * After calling this, one should then set other required callbacks
 * before starting the panels event loop with #mb_tray_app_main 
 * ( The actaul docking process occurs here ).
 *
 * The resize_cb will get called when you panel resizes your application.
 * See MBTrayAppResizeCB
 * 
 * The paint_cb will get called when your application recieves an expose 
 * expose event and should update its contents accordingly. 
 * See #MBTrayAppPaintCB
 *
 * mb_tray_app_new will check for and remove the arguments from argv;
 * <ul>
 *  <li>--display, -d &lt;Display&gt; X11 Display to connect to</li>
 *  <li>--offset,  -o &lt;+-integer&gt; requested panel position</li>
 * </ul>
 *
 * NOTES:
 * The enviromental var 'SYSTEM_TRAY_ID' will read if set. This specifys the 
 * system tray to connect to. Defaults to 1. 
 *
 * @param app_name Name of tray application
 * @param resize_cb application resize callback 
 * @param paint_cb  application paint callback 
 * @param argc      command line parameter count
 * @param argv      command line parameter vector
 * @returns a MBTrayApp object, NULL on failiure.
  }

function mb_tray_app_new(app_name:Pbyte; resize_cb:TMBTrayAppResizeCB; paint_cb:TMBTrayAppPaintCB; argc:Plongint; argv:PPPchar):PMBTrayApp;cdecl;external libmb;
{*
 * Constructs a new tray app instance. 
 *
 * Just like #mb_tray_app_new , but allow the X Display to be 
 * specified. This function is intended to aid integration with
 * toolkits like Gtk. 
 *
 * @param app_name Name of tray application
 * @param resize_cb application resize callback 
 * @param paint_cb  application paint callback 
 * @param argc      command line parameter count
 * @param argv      command line parameter vector
 * @param display   Pre-existing X Display
 * @returns a MBTrayApp object, NULL on failiure.
  }
function mb_tray_app_new_with_display(app_name:Pbyte; resize_cb:TMBTrayAppResizeCB; paint_cb:TMBTrayAppPaintCB; argc:Plongint; argv:PPPchar; 
           display:PDisplay):PMBTrayApp;cdecl;external libmb;
{*
 * Sets the callback function for any extra x event processing.
 * Also see #mb_tray_app_get_xevent_mask and #mb_tray_app_set_xevent_mask
 *
 * @param mb_tray_app Tray instance
 * @param xevent_cb x11 event callback  
  }
procedure mb_tray_app_set_xevent_callback(mb_tray_app:PMBTrayApp; xevent_cb:TMBTrayAppXEventCB);cdecl;external libmb;
{*
 * Sets the callback function for a mouse button press/release.
 *
 * @param mb_tray_app Tray instance
 * @param button_cb button callback
  }
procedure mb_tray_app_set_button_callback(mb_tray_app:PMBTrayApp; button_cb:TMBTrayAppButtonEventCB);cdecl;external libmb;
{*
 * Sets the callback function for a theme change
 *
 * @param mb_tray_app Tray instance
 * @param theme_cb theme callback
  }
procedure mb_tray_app_set_theme_change_callback(mb_tray_app:PMBTrayApp; theme_cb:TMBTrayAppThemeChangeCB);cdecl;external libmb;
{*
 * Sets the callback function for a theme change
 *
 * @param mb_tray_app Tray instance
 * @param poll_cb timeout callback
 * @param tv      a timeval struct specifying the timeout.
  }
procedure mb_tray_app_set_timeout_callback(mb_tray_app:PMBTrayApp; poll_cb:TMBTrayAppPollCB; tv:Ptimeval);cdecl;external libmb;
{*
 * Sets the callback function to be notifed when the panel app is resized.
 *
 * @param mb_tray_app Tray instance
 * @param resize_cb timeout callback
  }
procedure mb_tray_app_set_resize_callback(mb_tray_app:PMBTrayApp; resize_cb:TMBTrayAppResizeCB);cdecl;external libmb;
{*
 * Sets the callback function for panel app paint
 *
 * @param mb_tray_app Tray instance
 * @param paint_cb paint callback
  }
procedure mb_tray_app_set_paint_callback(mb_tray_app:PMBTrayApp; paint_cb:TMBTrayAppPaintCB);cdecl;external libmb;
{*
 * Sets the 'context' callback
 *
 * @param mb_tray_app Tray instance
 * @param context_cb context callback
  }
procedure mb_tray_app_set_context_callback(mb_tray_app:PMBTrayApp; context_cb:TMBTrayAppContextCB);cdecl;external libmb;
{*
 * Requests a new size for the application. It is not guarenteed
 * your app will get this size. Your application should expected
 * to handle the size supplied to it ( via the resize callback).
 *
 * You should take care with this function as not to end up in an 
 * infinite loop continually re-requesting the same failed parameters.  
 *
 * @param mb_tray_app Tray instance
 * @param width request width in pixels
 * @param height request height in pixels
  }
procedure mb_tray_app_request_size(mb_tray_app:PMBTrayApp; width:longint; height:longint);cdecl;external libmb;
{*
 * Requests the app positional offset in terms of the panels orientation 
 * from the origin of the tray.
 *
 * Note its unlikely many trays will allow free positioning. The matchbox
 * tray uses positive/negative offset values to determine what side of the
 * tray the app is located on docking. 
 *
 * @param mb_tray_app Tray instance
 * @param offset      The panel app offset
  }
procedure mb_tray_app_request_offset(mb_tray_app:PMBTrayApp; offset:longint);cdecl;external libmb;
{*
 * Set timing for any timeout callbacks.
 *
 * @param mb_tray_app Tray instance
 * @param  tv      a timeval struct specifying the timeout. Pass NUll to clear
 *                 any timeout callbacks.
  }
procedure mb_tray_app_set_poll_timeout(mb_tray_app:PMBTrayApp; tv:Ptimeval);cdecl;external libmb;
{*
 * Requests the app is repainted - the paint callback will get called.
 *
 * @param mb_tray_app Tray instance
  }
procedure mb_tray_app_repaint(mb_tray_app:PMBTrayApp);cdecl;external libmb;
{*
 * Sends a messsage to the tray, used to visually inform or notify the user. 
 *
 * @param mb_tray_app Tray instance
 * @param msg         Message to send ( assumed UTF8 )
 * @param timeout     Time in seconds for message to stay visible.
  }
procedure mb_tray_app_tray_send_message(mb_tray_app:PMBTrayApp; msg:Pbyte; timeout:longint);cdecl;external libmb;
{*
 * Sets the tray app name. 
 *
 * @param mb_tray_app Tray instance
 * @param name        The tray app name
  }
procedure mb_tray_app_set_name(mb_tray_app:PMBTrayApp; name:Pbyte);cdecl;external libmb;
{*
 * Sets text for extra button in window message. 
 *
 * @param mb_tray_app Tray instance
 * @param info        context button text
  }
procedure mb_tray_app_set_context_info(mb_tray_app:PMBTrayApp; info:Pbyte);cdecl;external libmb;
{*
 * Sets the tray app icon. 
 *
 * @param mb_tray_app Tray instance
 * @param pixbuf mbpixbuf ref
 * @param image  mbpixbuf image to set as icon
  }
procedure mb_tray_app_set_icon(mb_tray_app:PMBTrayApp; pixbuf:PMBPixbuf; image:PMBPixbufImage);cdecl;external libmb;
{*
 * Enable app to show session data so tray can 'remember it' for 
 * future sessions.
 * Defaults to True
 *
 * @param mb_tray_app Tray instance
 * @param val         Boolean indicating action
  }
procedure mb_tray_app_set_session(mb_tray_app:PMBTrayApp; val:TBool);cdecl;external libmb;
{*
 * Get session state.
 *
 * @param mb_tray_app Tray instance
 * @returns True is sessioning active, False otherwise
  }
function mb_tray_app_get_session(mb_tray_app:PMBTrayApp):TBool;cdecl;external libmb;
{*
 * Gets the tray app co-ordinates relative to the root window. 
 *
 * @param mb_tray_app Tray instance
 * @param x X co-ord
 * @param y Y co-ord
 * @returns True on success, False on faliure
  }
function mb_tray_app_get_absolute_coords(mb_tray_app:PMBTrayApp; x:Plongint; y:Plongint):TBool;cdecl;external libmb;
{*
 * Set any user data to be attached to the tray app instance
 *
 * @param mb_tray_app Tray instance
 * @param data void pointer to user data
  }
procedure mb_tray_app_set_user_data(mb_tray_app:PMBTrayApp; data:pointer);cdecl;external libmb;
{*
 * Gets any user data to be attached to the tray app instance
 *
 * @param mb_tray_app Tray instance
 * @returns the user data.
  }
function mb_tray_app_get_user_data(mb_tray_app:PMBTrayApp):pointer;cdecl;external libmb;
function mb_tray_app_tray_is_vertical(mb_tray_app:PMBTrayApp):TBool;cdecl;external libmb;
{*
 * Gets the panel background for the area covered by the tray app. 
 *
 * @param mb_tray_app Tray instance
 * @param pixbuf      mb pixbuf object
 * @returns an mbpixbuf of the panel background covered by the panel app. 
  }
function mb_tray_app_get_background(mb_tray_app:PMBTrayApp; pixbuf:PMBPixbuf):PMBPixbufImage;cdecl;external libmb;
{*
 * Returns the current theme
 *
 * @param mb_tray_app Tray instance
 * @returns the name of the current theme, or NULL if no theme is set. 
  }
function mb_tray_app_get_theme_name(mb_tray_app:PMBTrayApp):Pchar;cdecl;external libmb;
{*
 * Returns the current X Event mask used by the tray app
 *
 * @param mb_tray_app Tray instance
 * @returns the current X event mask 
  }
function mb_tray_app_get_xevent_mask(mb_tray_app:PMBTrayApp):longint;cdecl;external libmb;
{*
 * Safely sets the X Event mask used to select what events
 * the xevent callback recieves. 
 *
 * @param mb_tray_app Tray instance
 * @param mask requested X event mask 
  }
procedure mb_tray_app_set_xevent_mask(mb_tray_app:PMBTrayApp; mask:longint);cdecl;external libmb;
{*
 * Gets the tray apps X display
 *
 * @param mb_tray_app Tray instance
 * @returns An Xlib display
  }
function mb_tray_app_xdisplay(mb_tray_app:PMBTrayApp):PDisplay;cdecl;external libmb;
{*
 * Gets the tray app X screen
 *
 * @param mb_tray_app Tray instance
 * @returns An Xlib screen
  }
function mb_tray_app_xscreen(mb_tray_app:PMBTrayApp):longint;cdecl;external libmb;
{*
 * Gets the tray app root window
 *
 * @param mb_tray_app Tray instance
 * @returns An Xlib root window
  }
function mb_tray_app_xrootwin(mb_tray_app:PMBTrayApp):TWindow;cdecl;external libmb;
{*
 * Gets the tray app window
 *
 * @param mb_tray_app Tray instance
 * @returns An Xlib window
  }
function mb_tray_app_xwin(mb_tray_app:PMBTrayApp):TWindow;cdecl;external libmb;
{*
 * Gets the tray width
 *
 * @param mb_tray_app Tray instance
 * @returns the tray apps width in pixels
  }
function mb_tray_app_width(mb_tray_app:PMBTrayApp):longint;cdecl;external libmb;
{*
 * Gets the tray height
 *
 * @param mb_tray_app Tray instance
 * @returns the tray apps height in pixels
  }
function mb_tray_app_height(mb_tray_app:PMBTrayApp):longint;cdecl;external libmb;
{*
 * Gets the apps offset from the panels origin  
 *
 * @param mb_tray_app Tray instance
 * @returns the current offset
  }
function mb_tray_app_offset(mb_tray_app:PMBTrayApp):longint;cdecl;external libmb;
{*
 *
 * Inits the main loop. Only needed if you plan on not using
 * mbtrays main loop - eg if using with GTK. 
 *
 * @param mb_tray_app Tray instance
  }
procedure mb_tray_app_main_init(mb_tray_app:PMBTrayApp);cdecl;external libmb;
{*
 * Runs the tray app main loop until #mb_tray_app_main_quit is called
 *
 * @param mb_tray_app Tray instance
  }
procedure mb_tray_app_main(mb_tray_app:PMBTrayApp);cdecl;external libmb;
{*
 * Hides ( undocks ) the tray app.
 *
 * @param mb_tray_app Tray instance
  }
procedure mb_tray_app_hide(mb_tray_app:PMBTrayApp);cdecl;external libmb;
{*
 * Unhides ( redocks ) the tray app.
 *
 * @param mb_tray_app Tray instance
  }
procedure mb_tray_app_unhide(mb_tray_app:PMBTrayApp);cdecl;external libmb;
{*
 * Stops #mb_tray_app_main
 *
 * @param mb_tray_app Tray instance
  }
procedure mb_tray_app_main_quit(mb_tray_app:PMBTrayApp);cdecl;external libmb;
{*
 * Runs a single iteration of the mainloop
 *
 * @param mb_tray_app Tray instance
 * @param xevent      X event to process 
  }
procedure mb_tray_handle_xevent(mb_tray_app:PMBTrayApp; xevent:PXEvent);cdecl;external libmb;
{ ---------- Older stuff below -----------------------------------------  }
function mb_tray_init(dpy:PDisplay; win:TWindow):longint;cdecl;external libmb;
function mb_tray_get_window:TWindow;cdecl;external libmb;
procedure mb_tray_init_session_info(d:PDisplay; win:TWindow; argv:PPchar; argc:longint);cdecl;external libmb;
procedure mb_tray_handle_event(dpy:PDisplay; win:TWindow; an_event:PXEvent);cdecl;external libmb;
procedure mb_tray_send_message(d:PDisplay; win:TWindow; msg:Pbyte; timeout:longint);cdecl;external libmb;
procedure mb_tray_map_window(dpy:PDisplay; win:TWindow);cdecl;external libmb;
procedure mb_tray_bg_change_cb_set(bg_changed_cb:TMBTrayBackgroundCB; user_data:pointer);cdecl;external libmb;
function mb_tray_get_bg_col(dpy:PDisplay; xcol:PXColor):TBool;cdecl;external libmb;
procedure mb_tray_window_icon_set(dpy:PDisplay; win_panel:TWindow; img:PMBPixbufImage);cdecl;external libmb;
procedure mb_tray_unmap_window(dpy:PDisplay; win:TWindow);cdecl;external libmb;
function mb_tray_get_bg_img(pb:PMBPixbuf; win:TWindow):PMBPixbufImage;cdecl;external libmb;
{* @  }
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 15-11-26 17:34:52 ===


implementation



end.
