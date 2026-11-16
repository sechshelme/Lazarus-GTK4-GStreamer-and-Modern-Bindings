program project1;

uses
  x, xlib, ctypes,
  fp_mb;

  procedure main;
  var
    dpy: PDisplay;
    screen: cint;
    root, win: TWindow;
    pb: PMBPixbuf;
    img: PMBPixbufImage;
    x, y: integer;
    r, g, b: byte;
    font: PMBFont;
    color: PMBColor;
    drw: PMBDrawable;
    gc: TGC;
    ev: TXEvent;
  const
    width = 500;
    height = 300;
  begin
    dpy := XOpenDisplay(nil);
    if dpy = nil then begin
      WriteLn('"Fehler: X11-Display konnte nicht geöffnet werden.');
      Exit;;
    end;

    screen := DefaultScreen(dpy);
    root := RootWindow(dpy, screen);

    win := XCreateSimpleWindow(dpy, root, 100, 100, width, height, 1, BlackPixel(dpy, screen), WhitePixel(dpy, screen));

    XStoreName(dpy, win, 'libmatchbox1 Farbverlauf & Text');
    XSelectInput(dpy, win, ExposureMask or KeyPressMask);
    XMapWindow(dpy, win);

    pb := mb_pixbuf_new(dpy, screen);
    if pb = nil then begin
      WriteLn('Fehler: MBPixbuf konnte nicht erstellt werden.');
      XCloseDisplay(dpy);
      Exit;;
    end;

    img := mb_pixbuf_img_rgba_new(pb, width, height);
    for y := 0 to height - 1 do begin
      for x := 0 to width - 1 do begin
        r := (x * 255) div width;
        g := (y * 255) div height;
        b := 128;
        mb_pixbuf_img_plot_pixel(pb, img, x, y, r, g, b);
      end;
    end;

    font := mb_font_new_from_string(dpy, 'Sans Bold 20');
    if font = nil then begin
      WriteLn('Fehler: Schriftart konnte nicht geladen werden.');
      XCloseDisplay(dpy);
      Exit;
    end;

    color := mb_col_new_from_spec(pb, '#ffffff');
    mb_font_set_color(font, color);

    drw := mb_drawable_new(pb, width, height);
    gc := XCreateGC(dpy, win, 0, nil);

    while True do begin
      XNextEvent(dpy, @ev);
      case ev._type of
        Expose: begin
          mb_pixbuf_img_render_to_drawable(pb, img, mb_drawable_pixmap(drw), 0, 0);
          color := mb_col_new_from_spec(pb, '#FFFFFF');
          mb_font_set_color(font, color);
          mb_col_unref(color);
          mb_font_render_simple(font, drw, 30, 50, width - 60, 'Hallo aus libmatchbox1!', MB_ENCODING_UTF8, MB_FONT_RENDER_OPTS_CLIP_TRAIL);
          color := mb_col_new_from_spec(pb, '#000000');
          mb_font_set_color(font, color);
          mb_col_unref(color);
          mb_font_render_simple(font, drw, 30, 90, width - 60, 'Geglättete Pango-Schrift in X11.', MB_ENCODING_UTF8, MB_FONT_RENDER_OPTS_CLIP_TRAIL);
          XCopyArea(dpy, mb_drawable_pixmap(drw), win, gc, 0, 0, width, height, 0, 0);
        end;
        KeyPress: begin
          break;
        end;
      end;
    end;

    XFreeGC(dpy, gc);
    mb_drawable_unref(drw);
    mb_font_unref(font);
    mb_pixbuf_img_free(pb, img);
    XFree(pb);
    XDestroyWindow(dpy, win);
    XCloseDisplay(dpy);
  end;

begin
  main;
end.
