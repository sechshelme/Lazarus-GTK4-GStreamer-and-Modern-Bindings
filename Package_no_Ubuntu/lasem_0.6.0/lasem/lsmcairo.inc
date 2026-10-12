{$IFDEF read_interface}


procedure lsm_cairo_quadratic_curve_to(cr: Pcairo_t; x1: double; y1: double; x: double; y: double); cdecl; external liblasem;
procedure lsm_cairo_rel_quadratic_curve_to(cr: Pcairo_t; dx1: double; dy1: double; dx: double; dy: double); cdecl; external liblasem;
procedure lsm_cairo_elliptical_arc(cairo: Pcairo_t; rx: double; ry: double; x_axis_rotation: double; large_arc_flag: Tgboolean; sweep_flag: Tgboolean; x: double; y: double); cdecl; external liblasem;
procedure lsm_cairo_rel_elliptical_arc(cairo: Pcairo_t; rx: double; ry: double; x_axis_rotation: double; large_arc_flag: Tgboolean; sweep_flag: Tgboolean; dx: double; dy: double); cdecl; external liblasem;
procedure lsm_cairo_vertical(cairo: Pcairo_t; y: double); cdecl; external liblasem;
procedure lsm_cairo_rel_vertical(cairo: Pcairo_t; dy: double); cdecl; external liblasem;
procedure lsm_cairo_horizontal(cairo: Pcairo_t; x: double); cdecl; external liblasem;
procedure lsm_cairo_rel_horizontal(cairo: Pcairo_t; dx: double); cdecl; external liblasem;
procedure lsm_cairo_emit_svg_path(cr: Pcairo_t; path: pchar); cdecl; external liblasem;
procedure lsm_cairo_box_user_to_device(cairo: Pcairo_t; to_: PLsmBox; from: PLsmBox); cdecl; external liblasem;
procedure lsm_cairo_box_device_to_user(cairo: Pcairo_t; to_: PLsmBox; from: PLsmBox); cdecl; external liblasem;
procedure lsm_cairo_set_source_pixbuf(cairo: Pcairo_t; pixbuf: PGdkPixbuf; pixbuf_x: double; pixbuf_y: double); cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:10:40 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
