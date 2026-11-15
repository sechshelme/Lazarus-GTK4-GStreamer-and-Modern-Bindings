unit mbpixbuf;

interface

uses
  fp_mb;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _HAVE_MBPIXBUF_H}
{$define _HAVE_MBPIXBUF_H}
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
{$include <stdlib.h>}
{$include <string.h>}
{$include <unistd.h>}
{$include <signal.h>}
{$ifdef USE_PNG}
{$include <png.h>}
{$endif}
{$include <X11/Xlib.h>}
{$include <X11/Xutil.h>}
{$include <X11/Xatom.h>}
{ XXX if have_shm  }
{$include <sys/ipc.h>}
{$include <sys/shm.h>}
{$include <sys/time.h>}
{$include <X11/extensions/XShm.h>}
{$include <X11/Xmd.h> }
{$ifdef USE_JPG}
{$include "jpeglib.h"}
{$endif}
{ C++ extern C conditionnal removed }
{*
 * @defgroup MBPixbuf MBPixbuf - Simple image manipulation tools
 * @brief mbpixbuf contains simple image manipulation and composition 
 * functions for client side images.
 *
 * Example: Simple example to load an image and display it on root window.
 * 
 * <pre>
 * 
 *  #include <libmb/mb.h>
 *
 *  int 
 *  main(int argc, char **argv)
 *  
 *    Display       *dpy;
 *    Window         win_root;
 *    XEvent         xevent;
 *    MBPixbufImage *img, *img_scaled;
 *    MBPixbuf      *pb;
 *
 *    if (argc < 2) 
 *       fprintf(stderr, "usage: %s image file\\n", argv[0]); exit(1); 
 *
 *    dpy = XOpenDisplay(NULL);
 *    
 *    pb = mb_pixbuf_new(dpy, DefaultScreen(dpy));
 *    
 *    img = mb_pixbuf_img_new_from_file(pb, argv[1]);
 *
 *    if (!img)  fprintf(stderr, "image load failed\\n"); exit(1); 
 *
 *    img_scaled = mb_pixbuf_img_scale(pb, img, 
 *                                     DisplayWidth(dpy), DisplayHeight(dpy));
 *
 *    if (!img_scaled)  fprintf(stderr, "image scale failed\\n"); exit(1); 
 *
 *    mb_pixbuf_img_free(pb, img);   
 *
 *    mb_pixbuf_img_render_to_drawable(pb, img_scaled,
 *                                     RootWindow(dpy, DefaultScreen(dpy))
 *				     0, 0);
 *    for (;;) 
 *       XNextEvent(dpy, &xevent);
 *
 *    exit(0);
 *  
 *
 * </pre>
 *
 * Notes: if the enviromental varible 'MBPIXBUF_NO_SHM' is set, the MIT-SHM 
 * extension will not be used.       
 *
 * @
  }
{*
 * @typedef MBPixbufTransform
 *
 * enumerated types for #mb_pixbuf_img_transform
  }
type
  PMBPixbufTransform = ^TMBPixbufTransform;
  TMBPixbufTransform =  Longint;
  Const
    MBPIXBUF_TRANS_ROTATE_90 = 0;
    MBPIXBUF_TRANS_ROTATE_180 = 1;
    MBPIXBUF_TRANS_ROTATE_270 = 2;
    MBPIXBUF_TRANS_FLIP_VERT = 3;
    MBPIXBUF_TRANS_FLIP_HORIZ = 4;
;
type
  Pmb_pixbuf_col = ^Tmb_pixbuf_col;
  Tmb_pixbuf_col = record
      r : longint;
      g : longint;
      b : longint;
      pixel : dword;
    end;
  TMBPixbufColor = Tmb_pixbuf_col;
  PMBPixbufColor = ^TMBPixbufColor;
{*
 * @typedef MBPixbuf
 *
 * Opaque structure used for all operations. 
  }
  PMBPixbuf = ^TMBPixbuf;
  TMBPixbuf = record
      dpy : PDisplay;
      scr : longint;
      vis : PVisual;
      root : TWindow;
      depth : longint;
      root_cmap : TColormap;
      byte_order : longint;
      num_of_cols : longint;
      gc : TGC;
      palette : PMBPixbufColor;
      have_shm : TBool;
      internal_bytespp : longint;
    end;
{*
 * @typedef MBPixbufImage
 *
 * Type for representing an mbpixbuf image.
 * Its not recommended you touch this directly. 
  }
{*< width in pixels of image  }
{*< height in pixels of image  }
{*< rgb(a) raw image data  }
{*< has alpha channel flag  }
{*< ximage, if set  }

  PMBPixbufImage = ^TMBPixbufImage;
  TMBPixbufImage = record
      width : longint;
      height : longint;
      rgba : Pbyte;
      has_alpha : longint;
      ximg : PXImage;
      internal_bytespp : longint;
    end;
{ macros  }
{* xxxxxxxx

#define mb_pixbuf_img_set_pixel_alpha(i, x, y, a)  \
  if ((i)->has_alpha) (i)->rgba[(((y)*(i)->width*(i->internal_bytespp+1))+((x)*(i->internal_bytespp+1)))+i->internal_bytespp] = a;    \




  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function mb_pixbuf_img_get_width(image : longint) : longint;

{*
 * @def mb_pixbuf_img_get_height 
 *
 * returns image height
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mb_pixbuf_img_get_height(image : longint) : longint;

{*
 * @def mb_pixbuf_get_depth
 *
 * returns pixbuf instance depth
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mb_pixbuf_get_depth(pb : longint) : longint;

{*
 * @def mb_pixbuf_img_has_alpha 
 *
 * Returns True if image has an alpha channel. 
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mb_pixbuf_img_has_alpha(image : longint) : longint;

{*
 * Constructs a new MBPixbuf instance
 *
 * @param display 
 * @param screen 
 * @returns a #MBPixbuf object
  }
function mb_pixbuf_new(display:PDisplay; screen:longint):PMBPixbuf;cdecl;external libmb;
{*
 * Constructs a new MBPixbuf instance with non default depth and visual
 *
 * @param dpy X display 
 * @param scr X Screen 
 * @param vis X Visual to use
 * @param depth Depth to use
 * @returns a #MBPixbuf object
  }
function mb_pixbuf_new_extended(dpy:PDisplay; scr:longint; vis:PVisual; depth:longint):PMBPixbuf;cdecl;external libmb;
{*
 * Destroys a new MBPixbuf instance
 *
 * @param pixbuf MBPixbuf object
  }
procedure mb_pixbuf_destroy(pixbuf:PMBPixbuf);cdecl;external libmb;
{* 
 * Get the X pixel representation for a given color
 * 
 * @param pixbuf mbpixbuf object
 * @param r red component of color
 * @param g green component of color
 * @param b blue component of color
 * @param a alpha component
 *
 * @returns x pixel value 
  }
function mb_pixbuf_lookup_x_pixel(pixbuf:PMBPixbuf; r:longint; g:longint; b:longint; a:longint):dword;cdecl;external libmb;
{*
 * DEPRECIATED. Use #mb_pixbuf_img_rgb_new, #mb_pixbuf_img_rgba_new instead. 
 *
  }
function mb_pixbuf_img_new(pb:PMBPixbuf; width:longint; height:longint):PMBPixbufImage;cdecl;external libmb;
{*
 * Constructs a new blank mbpixbuf image with an alpha channel.
 *
 * @param pixbuf mbpixbuf object
 * @param width  width in pixels of new image
 * @param height  height in pixels of new image
 * @returns a MBPixbufImage object
  }
function mb_pixbuf_img_rgba_new(pixbuf:PMBPixbuf; width:longint; height:longint):PMBPixbufImage;cdecl;external libmb;
{*
 * Constructs a new blank mbpixbuf image without an alpha channel.
 *
 * @param pixbuf mbpixbuf object
 * @param width  width in pixels of new image
 * @param height height in pixels of new image
 * @returns a MBPixbufImage object
  }
function mb_pixbuf_img_rgb_new(pixbuf:PMBPixbuf; width:longint; height:longint):PMBPixbufImage;cdecl;external libmb;
{*
 *  Depreicated. use #mb_pixbuf_img_new_from_x_drawable instead.
  }
function mb_pixbuf_img_new_from_drawable(pixbuf:PMBPixbuf; drawable:TDrawable; mask:TDrawable; source_x:longint; source_y:longint; 
           source_w:longint; source_h:longint):PMBPixbufImage;cdecl;external libmb;
{*
 * Constructs a new blank mbpixbuf image with/without an alpha channel.
 *
 * @param pixbuf   mbpixbuf object
 * @param drawable an X drawable ( window or pixmap )
 * @param mask     set to none if alpha channel not required
 * @param source_x x co-ord of X drawable 
 * @param source_y y co-ord of X drawable 
 * @param source_w width of X drawable 
 * @param source_h height of X drawable
 * @param want_alpha force created image to have an ( empty ) alpha channel
 *        even if no mask is supplied.  
 * @returns a MBPixbufImage object, NULL on faliure
  }
function mb_pixbuf_img_new_from_x_drawable(pixbuf:PMBPixbuf; drawable:TDrawable; mask:TDrawable; source_x:longint; source_y:longint; 
           source_w:longint; source_h:longint; want_alpha:TBool):PMBPixbufImage;cdecl;external libmb;
{*
 * Creates an mbpixbuf image from a file on disk.
 * Supports PNG, JPEGS and XPMS. 
 *
 * @param pixbuf mbpixbuf object
 * @param filename full filename of image to be loaded
 * @returns a MBPixbufImage object, NULL on faliure
  }
function mb_pixbuf_img_new_from_file(pixbuf:PMBPixbuf; filename:Pchar):PMBPixbufImage;cdecl;external libmb;
{*
 * Creates an mbpixbuf image from arbituary supplied rgb(a) data
 *
 * @param pixbuf mbpixbuf object
 * @param data rgb(a) data
 * @param width image width
 * @param height image height
 * @param has_alpha True if data has alpha component
 * @returns a MBPixbufImage object, NULL on faliure
  }
function mb_pixbuf_img_new_from_data(pixbuf:PMBPixbuf; data:Pbyte; width:longint; height:longint; has_alpha:TBool):PMBPixbufImage;cdecl;external libmb;
{*
 * Creates an mbpixbuf image from arbituary supplied INT ARGB data
 *
 * @param pixbuf mbpixbuf object
 * @param data argb data
 * @param width image width
 * @param height image height
 * @returns a MBPixbufImage object, NULL on faliure
  }
function mb_pixbuf_img_new_from_int_data(pixbuf:PMBPixbuf; data:Plongint; width:longint; height:longint):PMBPixbufImage;cdecl;external libmb;
{*
 * Creates an mbpixbuf image from arbituary supplied long ARGB data.
 *
 * Useful for example to parse _NET_WM_ICON image data, which XLib kindly
 * returns in long arrays instead of int arrays.
 *
 * @param pixbuf mbpixbuf object
 * @param data argb data
 * @param width image width
 * @param height image height
 * @returns a MBPixbufImage object, NULL on faliure
  }
function mb_pixbuf_img_new_from_long_data(pixbuf:PMBPixbuf; data:Pdword; width:longint; height:longint):PMBPixbufImage;cdecl;external libmb;
{*
 * Frees up  a mbpixbuf image.
 *
 * @param pixbuf mbpixbuf object
 * @param image image to free
  }
procedure mb_pixbuf_img_free(pixbuf:PMBPixbuf; image:PMBPixbufImage);cdecl;external libmb;
{*
 * Renders a mbpixbuf image to an X Drawable. 
 *
 * @param pixbuf mbpixbuf object
 * @param image mbpixbuf image to render
 * @param drw X11 drawable ( window or pixmap ) to render roo. 
 * @param drw_x X co-ord on drawable to render too. 
 * @param drw_y Y co-ord on drawable to render too. 
  }
procedure mb_pixbuf_img_render_to_drawable(pixbuf:PMBPixbuf; image:PMBPixbufImage; drw:TDrawable; drw_x:longint; drw_y:longint);cdecl;external libmb;
{*
 * Renders a mbpixbuf image to an X Drawable with a specified. 
 * X Graphics Context ( GC ).
 *
 * @param pixbuf mbpixbuf object
 * @param image mbpixbuf image to render
 * @param drw X11 drawable ( window or pixmap ) to render roo. 
 * @param drw_x X co-ord on drawable to render too. 
 * @param drw_y Y co-ord on drawable to render too. 
 * @param gc X11 GC to use on drawable.
  }
procedure mb_pixbuf_img_render_to_drawable_with_gc(pixbuf:PMBPixbuf; image:PMBPixbufImage; drw:TDrawable; drw_x:longint; drw_y:longint; 
            gc:TGC);cdecl;external libmb;
{*
 * Renders alpha component  mbpixbuf image to an X Bitmap. 
 *
 * @param pixbuf mbpixbuf object
 * @param image mbpixbuf image to render
 * @param mask X11 bitmap. 
 * @param mask_x X co-ord on drawable to render too. 
 * @param mask_y Y co-ord on drawable to render too. 
  }
procedure mb_pixbuf_img_render_to_mask(pixbuf:PMBPixbuf; image:PMBPixbufImage; mask:TDrawable; mask_x:longint; mask_y:longint);cdecl;external libmb;
{*
 * Clones a exisiting mbpixbuf image
 *
 * @param pixbuf mbpixbuf object
 * @param image image to clone
 * @returns a new cloned image
  }
function mb_pixbuf_img_clone(pixbuf:PMBPixbuf; image:PMBPixbufImage):PMBPixbufImage;cdecl;external libmb;
{*
 * Fills an image with specified color / alpha level. 
 *
 * @param pixbuf mbpixbuf object
 * @param image image to fill.
 * @param r red component of color
 * @param g green component of color
 * @param b blue component of color
 * @param a alpha component
  }
procedure mb_pixbuf_img_fill(pixbuf:PMBPixbuf; image:PMBPixbufImage; r:longint; g:longint; b:longint; 
            a:longint);cdecl;external libmb;
{*
 * Plots a pixel on specified image. Note: on a RGBA image the alpha channel is
 * left as-is.
 *
 * @param pixbuf mbpixbuf object
 * @param image destination image
 * @param x X co-ord on destination image
 * @param y Y co-ord on destination image
 * @param r red component of color
 * @param g green component of color
 * @param b blue component of color
  }
procedure mb_pixbuf_img_plot_pixel(pixbuf:PMBPixbuf; image:PMBPixbufImage; x:longint; y:longint; r:byte; 
            g:byte; b:byte);cdecl;external libmb;
{*
 * Gets the component values for a specified pixel
 *
 * @param pixbuf mbpixbuf object
 * @param image destination image
 * @param x X co-ord on destination image
 * @param y Y co-ord on destination image
 * @param r red component of color
 * @param g green component of color
 * @param b blue component of color
 * @param a alpha component of pixel
  }
procedure mb_pixbuf_img_get_pixel(pixbuf:PMBPixbuf; image:PMBPixbufImage; x:longint; y:longint; r:Pbyte; 
            g:Pbyte; b:Pbyte; a:Pbyte);cdecl;external libmb;
{*
 * Gets rgb(a) internal data representation of an image
 *
 * @param pixbuf mbpixbuf object
 * @param image destination image
 * @returns rgb(a) data 
  }
function mb_pixbuf_img_data(pixbuf:PMBPixbuf; image:PMBPixbufImage):Pbyte;cdecl;external libmb;
{*
 * Plots a pixel on specified image with alpha channel value. 
 *
 * @param pixbuf mbpixbuf object
 * @param image destination image
 * @param x X co-ord on destination image
 * @param y Y co-ord on destination image
 * @param r red component of color
 * @param g green component of color
 * @param b blue component of color
 * @param a alpha component
  }
procedure mb_pixbuf_img_plot_pixel_with_alpha(pixbuf:PMBPixbuf; image:PMBPixbufImage; x:longint; y:longint; r:byte; 
            g:byte; b:byte; a:byte);cdecl;external libmb;
{*
 * Copys an specified area of an image to another. 
 * No Alpha composition is performed. 
 *
 * @param pixbuf mbpixbuf object
 * @param dest destination image
 * @param src  source image
 * @param sx   source area X co-ord
 * @param sy   source area Y co-ord
 * @param sw   source area width. 
 * @param sh   source area height. 
 * @param dx   destination image X co-ord. 
 * @param dy   destination image Y co-ord. 
  }
procedure mb_pixbuf_img_copy(pixbuf:PMBPixbuf; dest:PMBPixbufImage; src:PMBPixbufImage; sx:longint; sy:longint; 
            sw:longint; sh:longint; dx:longint; dy:longint);cdecl;external libmb;
{*
 * Alpha composites an specified area of an image with another. 
 *
 * @param pixbuf mbpixbuf object
 * @param dest destination image
 * @param src  source image
 * @param sx   source area X co-ord
 * @param sy   source area Y co-ord
 * @param sw   source area width. 
 * @param sh   source area height. 
 * @param dx   destination image X co-ord. 
 * @param dy   destination image Y co-ord. 
  }
procedure mb_pixbuf_img_copy_composite(pixbuf:PMBPixbuf; dest:PMBPixbufImage; src:PMBPixbufImage; sx:longint; sy:longint; 
            sw:longint; sh:longint; dx:longint; dy:longint);cdecl;external libmb;
{*
 * Like #mb_pixbuf_img_copy_composite but sets an overall alpha value
 *
 * @param pixbuf mbpixbuf object
 * @param dest destination image
 * @param src  source image
 * @param sx   source area X co-ord
 * @param sy   source area Y co-ord
 * @param sw   source area width. 
 * @param sh   source area height. 
 * @param dx   destination image X co-ord. 
 * @param dy   destination image Y co-ord. 
 * @param overall_alpha The overall alpha value to set after composition. 
  }
procedure mb_pixbuf_img_copy_composite_with_alpha(pixbuf:PMBPixbuf; dest:PMBPixbufImage; src:PMBPixbufImage; sx:longint; sy:longint; 
            sw:longint; sh:longint; dx:longint; dy:longint; overall_alpha:longint);cdecl;external libmb;
{*
 * DEPRECATED. Use #mb_pixbuf_img_copy_composite instead. 
 *
  }
procedure mb_pixbuf_img_composite(pb:PMBPixbuf; dest:PMBPixbufImage; src:PMBPixbufImage; dx:longint; dy:longint);cdecl;external libmb;
{*
 * Scales an image arbitually. 
 *
 * @param pixbuf mbpixbuf object
 * @param image mbpixbuf image to scale
 * @param new_width new image width
 * @param new_height new image height
 * @returns a new scaled image
  }
function mb_pixbuf_img_scale(pixbuf:PMBPixbuf; image:PMBPixbufImage; new_width:longint; new_height:longint):PMBPixbufImage;cdecl;external libmb;
function mb_pixbuf_img_scale_down(pixbuf:PMBPixbuf; image:PMBPixbufImage; new_width:longint; new_height:longint):PMBPixbufImage;cdecl;external libmb;
function mb_pixbuf_img_scale_up(pixbuf:PMBPixbuf; image:PMBPixbufImage; new_width:longint; new_height:longint):PMBPixbufImage;cdecl;external libmb;
{*
 * Performs a basic transform on an image. 
 *
 * @param pixbuf mbpixbuf object
 * @param image mbpixbuf image to scale
 * @param transform the type of transform to perform
 * @returns a new transformed image
  }
function mb_pixbuf_img_transform(pixbuf:PMBPixbuf; image:PMBPixbufImage; transform:TMBPixbufTransform):PMBPixbufImage;cdecl;external libmb;
{* @  }
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 15-11-26 17:35:29 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mb_pixbuf_img_get_width(image : longint) : longint;
begin
  mb_pixbuf_img_get_width:=image^.width;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mb_pixbuf_img_get_height(image : longint) : longint;
begin
  mb_pixbuf_img_get_height:=image^.height;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mb_pixbuf_get_depth(pb : longint) : longint;
begin
  mb_pixbuf_get_depth:=pb^.depth;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mb_pixbuf_img_has_alpha(image : longint) : longint;
begin
  mb_pixbuf_img_has_alpha:=image^.has_alpha;
end;


end.
