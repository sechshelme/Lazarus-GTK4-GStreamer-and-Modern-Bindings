program project1;

uses
  fp_vips,
  fp_glib2;

  procedure main;
  var
    in_, inverted, base_srgb, black_screen, text_mask, alpha_mask, text_rgba, text_final, out_: PVipsImage;
  begin
    if vips_init(argv[0]) <> 0 then begin
      vips_error_exit(nil);
    end;

    in_ := vips_image_new_from_file('in.jpg', nil);
    if in_ = nil then begin
      vips_error_exit(nil);
    end;

    vips_invert(in_, @inverted, nil);
    vips_colourspace(inverted, @base_srgb, VIPS_INTERPRETATION_sRGB, nil);

    vips_text(@text_mask, 'Hallo Welt!', 'width', 100, 'dpi', 200, nil);
    vips_linear1(text_mask, @alpha_mask, 1.0, 0, nil);

    vips_black(@black_screen, vips_image_get_width(alpha_mask), vips_image_get_height(alpha_mask), 'bands', 3, nil);
    vips_bandjoin2(black_screen, alpha_mask, @text_rgba, nil);

    if vips_copy(text_rgba, @text_final, 'interpretation', VIPS_INTERPRETATION_sRGB, nil) <> 0 then begin
      vips_error_exit(nil);
    end;

    if vips_composite2(base_srgb, text_final, @out_, VIPS_BLEND_MODE_OVER, 'x' + '', 110, 'y' + '', 90, nil) <> 0 then  begin
      vips_error_exit(nil);
    end;

    vips_image_write_to_file(out_, 'out.jpg', nil);

    g_object_unref(in_);
    g_object_unref(inverted);
    g_object_unref(base_srgb);
    g_object_unref(text_mask);
    g_object_unref(alpha_mask);
    g_object_unref(black_screen);
    g_object_unref(text_rgba);
    g_object_unref(text_final);
    g_object_unref(out_);

    vips_shutdown;
  end;

begin
  main;
end.
