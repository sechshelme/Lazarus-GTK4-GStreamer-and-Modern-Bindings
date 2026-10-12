program project1;

uses
  fp_thorvg_capi;

type
  Trgb = record
    r, g, b: byte;
  end;

  procedure main;
  const
    SIZE = 256;
  var
    canvas: TTvg_Canvas;
    buffer: array[0..SIZE * SIZE - 1] of Tuint32_t;
    bg, rect, circle: TTvg_Paint;
    f: file;
    i: integer;
    rgb: Trgb;
    header, s: string;

  begin
    tvg_engine_init(0);

    canvas := tvg_swcanvas_create(0);
    tvg_swcanvas_set_target(canvas, buffer, SIZE, SIZE, SIZE, TVG_COLORSPACE_ARGB8888);

    bg := tvg_shape_new;
    tvg_shape_append_rect(bg, 0, 0, SIZE, SIZE, 0, 0, True);
    tvg_shape_set_fill_color(bg, 0, 0, 255, 255);
    tvg_canvas_add(canvas, bg);

    rect := tvg_shape_new;
    tvg_shape_append_rect(rect, 40, 40, SIZE - 80, SIZE - 80, 0, 0, True);
    tvg_shape_set_fill_color(rect, 255, 0, 0, 255);
    tvg_shape_set_stroke_width(rect, 20.0);
    tvg_shape_set_stroke_color(rect, 255, 255, 0, 255);
    tvg_canvas_add(canvas, rect);

    circle := tvg_shape_new;
    tvg_shape_append_circle(circle, SIZE / 2, SIZE / 2, 40, 40, True);
    tvg_shape_set_fill_color(circle, 0, 255, 0, 255);
    tvg_canvas_add(canvas, circle);
    tvg_shape_set_stroke_width(circle, 20.0);
    tvg_shape_set_stroke_color(circle, 0, 255, 255, 255);

    tvg_canvas_draw(canvas, True);
    tvg_canvas_sync(canvas);

    Assign(f, '/tmp/output.ppm');
    Rewrite(f, 1);
    Str(SIZE, s);

    header := 'P6'#10 + s + ' ' + s + #10'255'#10;
    BlockWrite(f, header[1], Length(header));
    for  i := 0 to SIZE * SIZE - 1 do begin
      rgb.r := (buffer[i] shr 16) and $ff;
      rgb.g := (buffer[i] shr 8) and $ff;
      rgb.b := (buffer[i]) and $ff;
      BlockWrite(f, rgb, SizeOf(Trgb));
    end;
    Close(f);
    WriteLn('Erfolg! Bild gespeichert als ''output.ppm''.');

    tvg_canvas_destroy(canvas);
    tvg_engine_term;
  end;

begin
  main;
end.
