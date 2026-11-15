unit mbpixbuf;

interface

uses
  x, xlib, fp_mb;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PMBPixbufTransform = ^TMBPixbufTransform;
  TMBPixbufTransform = longint;
const
  MBPIXBUF_TRANS_ROTATE_90 = 0;
  MBPIXBUF_TRANS_ROTATE_180 = 1;
  MBPIXBUF_TRANS_ROTATE_270 = 2;
  MBPIXBUF_TRANS_FLIP_VERT = 3;
  MBPIXBUF_TRANS_FLIP_HORIZ = 4;

type
  Pmb_pixbuf_col = ^Tmb_pixbuf_col;
  Tmb_pixbuf_col = record
    r: longint;
    g: longint;
    b: longint;
    pixel: dword;
  end;
  TMBPixbufColor = Tmb_pixbuf_col;
  PMBPixbufColor = ^TMBPixbufColor;

  PMBPixbuf = ^TMBPixbuf;
  TMBPixbuf = record
    dpy: PDisplay;
    scr: longint;
    vis: PVisual;
    root: TWindow;
    depth: longint;
    root_cmap: TColormap;
    byte_order: longint;
    num_of_cols: longint;
    gc: TGC;
    palette: PMBPixbufColor;
    have_shm: TBool;
    internal_bytespp: longint;
  end;

  PMBPixbufImage = ^TMBPixbufImage;
  TMBPixbufImage = record
    width: longint;
    height: longint;
    rgba: pbyte;
    has_alpha: longint;
    ximg: PXImage;
    internal_bytespp: longint;
  end;

function mb_pixbuf_new(display: PDisplay; screen: longint): PMBPixbuf; cdecl; external libmb;
function mb_pixbuf_new_extended(dpy: PDisplay; scr: longint; vis: PVisual; depth: longint): PMBPixbuf; cdecl; external libmb;
procedure mb_pixbuf_destroy(pixbuf: PMBPixbuf); cdecl; external libmb;
function mb_pixbuf_lookup_x_pixel(pixbuf: PMBPixbuf; r: longint; g: longint; b: longint; a: longint): dword; cdecl; external libmb;
function mb_pixbuf_img_new(pb: PMBPixbuf; width: longint; height: longint): PMBPixbufImage; cdecl; external libmb; deprecated;
function mb_pixbuf_img_rgba_new(pixbuf: PMBPixbuf; width: longint; height: longint): PMBPixbufImage; cdecl; external libmb;
function mb_pixbuf_img_rgb_new(pixbuf: PMBPixbuf; width: longint; height: longint): PMBPixbufImage; cdecl; external libmb;
function mb_pixbuf_img_new_from_drawable(pixbuf: PMBPixbuf; drawable: TDrawable; mask: TDrawable; source_x: longint; source_y: longint;
  source_w: longint; source_h: longint): PMBPixbufImage; cdecl; external libmb; deprecated;
function mb_pixbuf_img_new_from_x_drawable(pixbuf: PMBPixbuf; drawable: TDrawable; mask: TDrawable; source_x: longint; source_y: longint;
  source_w: longint; source_h: longint; want_alpha: TBool): PMBPixbufImage; cdecl; external libmb;
function mb_pixbuf_img_new_from_file(pixbuf: PMBPixbuf; filename: Pchar): PMBPixbufImage; cdecl; external libmb;
function mb_pixbuf_img_new_from_data(pixbuf: PMBPixbuf; data: pbyte; width: longint; height: longint; has_alpha: TBool): PMBPixbufImage; cdecl; external libmb;
function mb_pixbuf_img_new_from_int_data(pixbuf: PMBPixbuf; data: Plongint; width: longint; height: longint): PMBPixbufImage; cdecl; external libmb;
function mb_pixbuf_img_new_from_long_data(pixbuf: PMBPixbuf; data: Pdword; width: longint; height: longint): PMBPixbufImage; cdecl; external libmb;
procedure mb_pixbuf_img_free(pixbuf: PMBPixbuf; image: PMBPixbufImage); cdecl; external libmb;
procedure mb_pixbuf_img_render_to_drawable(pixbuf: PMBPixbuf; image: PMBPixbufImage; drw: TDrawable; drw_x: longint; drw_y: longint); cdecl; external libmb;
procedure mb_pixbuf_img_render_to_drawable_with_gc(pixbuf: PMBPixbuf; image: PMBPixbufImage; drw: TDrawable; drw_x: longint; drw_y: longint;
  gc: TGC); cdecl; external libmb;
procedure mb_pixbuf_img_render_to_mask(pixbuf: PMBPixbuf; image: PMBPixbufImage; mask: TDrawable; mask_x: longint; mask_y: longint); cdecl; external libmb;
function mb_pixbuf_img_clone(pixbuf: PMBPixbuf; image: PMBPixbufImage): PMBPixbufImage; cdecl; external libmb;
procedure mb_pixbuf_img_fill(pixbuf: PMBPixbuf; image: PMBPixbufImage; r: longint; g: longint; b: longint;
  a: longint); cdecl; external libmb;
procedure mb_pixbuf_img_plot_pixel(pixbuf: PMBPixbuf; image: PMBPixbufImage; x: longint; y: longint; r: byte;
  g: byte; b: byte); cdecl; external libmb;
procedure mb_pixbuf_img_get_pixel(pixbuf: PMBPixbuf; image: PMBPixbufImage; x: longint; y: longint; r: pbyte;
  g: pbyte; b: pbyte; a: pbyte); cdecl; external libmb;
function mb_pixbuf_img_data(pixbuf: PMBPixbuf; image: PMBPixbufImage): pbyte; cdecl; external libmb;
procedure mb_pixbuf_img_plot_pixel_with_alpha(pixbuf: PMBPixbuf; image: PMBPixbufImage; x: longint; y: longint; r: byte;
  g: byte; b: byte; a: byte); cdecl; external libmb;
procedure mb_pixbuf_img_copy(pixbuf: PMBPixbuf; dest: PMBPixbufImage; src: PMBPixbufImage; sx: longint; sy: longint;
  sw: longint; sh: longint; dx: longint; dy: longint); cdecl; external libmb;
procedure mb_pixbuf_img_copy_composite(pixbuf: PMBPixbuf; dest: PMBPixbufImage; src: PMBPixbufImage; sx: longint; sy: longint;
  sw: longint; sh: longint; dx: longint; dy: longint); cdecl; external libmb;
procedure mb_pixbuf_img_copy_composite_with_alpha(pixbuf: PMBPixbuf; dest: PMBPixbufImage; src: PMBPixbufImage; sx: longint; sy: longint;
  sw: longint; sh: longint; dx: longint; dy: longint; overall_alpha: longint); cdecl; external libmb;
procedure mb_pixbuf_img_composite(pb: PMBPixbuf; dest: PMBPixbufImage; src: PMBPixbufImage; dx: longint; dy: longint); cdecl; external libmb; deprecated;
function mb_pixbuf_img_scale(pixbuf: PMBPixbuf; image: PMBPixbufImage; new_width: longint; new_height: longint): PMBPixbufImage; cdecl; external libmb;
function mb_pixbuf_img_scale_down(pixbuf: PMBPixbuf; image: PMBPixbufImage; new_width: longint; new_height: longint): PMBPixbufImage; cdecl; external libmb;
function mb_pixbuf_img_scale_up(pixbuf: PMBPixbuf; image: PMBPixbufImage; new_width: longint; new_height: longint): PMBPixbufImage; cdecl; external libmb;
function mb_pixbuf_img_transform(pixbuf: PMBPixbuf; image: PMBPixbufImage; transform: TMBPixbufTransform): PMBPixbufImage; cdecl; external libmb;

procedure mb_pixbuf_img_set_pixel_alpha(i: PMBPixbufImage; x, y: longint; a: byte); inline;

function mb_pixbuf_img_get_width(image: PMBPixbufImage): longint; inline;
function mb_pixbuf_img_get_height(image: PMBPixbufImage): longint; inline;
function mb_pixbuf_get_depth(pb: PMBPixbuf): longint; inline;
function mb_pixbuf_img_has_alpha(image: PMBPixbufImage): longbool; inline;


// === Konventiert am: 15-11-26 17:35:29 ===


implementation

procedure mb_pixbuf_img_set_pixel_alpha(i: PMBPixbufImage; x, y: longint; a: byte); inline;
var
  bytespp: longint;
begin
  if longbool(i^.has_alpha) then  begin
    bytespp := i^.internal_bytespp + 1;
    i^.rgba[((y * i^.width * bytespp) + (x * bytespp)) + i^.internal_bytespp] := a;
  end;
end;

function mb_pixbuf_img_get_width(image: PMBPixbufImage): longint; inline;
begin
  Result := image^.width;
end;

function mb_pixbuf_img_get_height(image: PMBPixbufImage): longint; inline;
begin
  Result := image^.height;
end;

function mb_pixbuf_get_depth(pb: PMBPixbuf): longint; inline;
begin
  Result := pb^.depth;
end;

function mb_pixbuf_img_has_alpha(image: PMBPixbufImage): longbool; inline;
begin
  Result := longbool(image^.has_alpha);
end;

end.
