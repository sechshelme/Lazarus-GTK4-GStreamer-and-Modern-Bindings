program project1;

uses
  fp_poppler_glib,
  fp_cairo,
  fp_glib2,
  fp_GLIBTools,
  fp_GTK4;

type
  TPDFData = record
    Document: PPopplerDocument;
    Page: PPopplerPage;
    Count: integer;
  end;

var
  PDFData: TPDFData;


  procedure quit_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    window: PGtkWindow absolute user_data;
  begin
    gtk_window_destroy(window);
  end;

  procedure draw_func(drawing_area: PGtkDrawingArea; cr: Pcairo_t; Width: longint; Height: longint; user_data: Tgpointer); cdecl;
  var
    pdf_width, pdf_height, scale_x, scale_y, scale: double;
  begin
    cairo_set_source_rgb(cr, 1, 1, 1);
    cairo_paint(cr);

    poppler_page_get_size(PDFData.Page, @pdf_width, @pdf_height);

    scale_x := width / pdf_width;
    scale_y := height / pdf_height;
    if scale_x < scale_y then begin
      scale := scale_x;
    end else begin
      scale := scale_y;
    end;

    cairo_scale(cr, scale, scale);

    poppler_page_render(PDFData.Page, cr);
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer);
  var
    window, box, button, drawing_area: PGtkWidget;
  begin
    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);

    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'PDF with Poppler');
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 400);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);

    drawing_area := gtk_drawing_area_new;
    gtk_widget_set_vexpand(drawing_area, True);
    gtk_widget_set_hexpand(drawing_area, True);
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(drawing_area), @draw_func, nil, nil);
    gtk_box_append(GTK_BOX(box), drawing_area);

    button := gtk_button_new_with_label('Quit');
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_cp), window);
    gtk_box_append(GTK_BOX(box), button);

    gtk_window_set_child(GTK_WINDOW(window), box);
    gtk_window_present(GTK_WINDOW(window));
  end;

  procedure printPDFInfo(doc: PPopplerDocument);
  var
    Count: longint;
    page: PPopplerPage;
    w, h: double;
    i, j: integer;
    text: pchar;
    rectangles: PPopplerRectangle;
    n_rectangles: Tguint;
    has_text: Tgboolean;
    r: TPopplerRectangle;
  begin
    Count := poppler_document_get_n_pages(doc);
    g_printf('Pages Count: %d'#10, Count);
    for i := 0 to Count - 1 do begin
      page := poppler_document_get_page(PDFData.Document, i);
      poppler_page_get_size(page, @w, @h);
      g_printf('  %3d.  %.1f x %.1f '#10, i, w, h);

      text := poppler_page_get_text(page);
      if text <> nil then begin
        g_printf('%s'#10, text);
        g_free(text);
      end;

      has_text := poppler_page_get_text_layout(page, @rectangles, @n_rectangles);
      WriteLn(has_text);

      if has_text then begin
        g_printf('Gefundene Textrechtecke: %u'#10, n_rectangles);

        for j := 0 to n_rectangles - 1 do begin
          r := rectangles[j];
          g_printf('Rechteck %d: x1=%.2f, y1=%.2f, x2=%.2f, y2=%.2f'#10, j, r.x1, r.y1, r.x2, r.y2);
        end;
        g_free(rectangles);
      end;

      g_object_unref(page);
    end;
  end;

  procedure main;
  var
    app: PGtkApplication;
    path_uri: Pgchar;
    err: PGError = nil;
  begin
    path_uri := g_filename_to_uri('/home/tux/Downloads/1553760606.pdf', nil, @err);
    if path_uri = nil then begin
      g_printerr('g_filename_to_uri()   %s'#10, err^.message);
      g_error_free(err);
    end;

    PDFData.Document := poppler_document_new_from_file(path_uri, nil, @err);
    g_free(path_uri);
    if PDFData.Document = nil then begin
      g_printerr('poppler_document_new_from_file()   %s'#10, err^.message);
      g_error_free(err);
    end;
    printPDFInfo(PDFData.Document);

    PDFData.Page := poppler_document_get_page(PDFData.Document, 0);
    if PDFData.Page = nil then begin
      g_printerr('poppler_document_get_page()'#10);
      g_object_unref(PDFData.Document);
      g_error_free(err);
    end;

    PDFData.Count := poppler_document_get_n_pages(PDFData.Document);

    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    g_application_run(G_APPLICATION(app), argc, argv);

    g_object_unref(PDFData.Page);
    g_object_unref(PDFData.Document);
    g_object_unref(app);
  end;

begin
  main;
end.
