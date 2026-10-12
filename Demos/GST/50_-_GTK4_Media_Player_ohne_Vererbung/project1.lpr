program project1;

uses
  fp_glib2,
  fp_cairo,
  fp_GTK4,
  fp_gst,

  Common,
  Streamer,
  culumn_view,
  LoadTitle,
  MenuBar,
  XML_Tools,
  LoadSaveSongs,
  Action;

  procedure on_scale_changed_cp({%H-}range: PGtkRange; user_data: Tgpointer); cdecl;
  var
    sharedWidget: PSharedWidget absolute user_data;
  begin
    sharedWidget^.IsChange := True;
  end;

  procedure action_cp(action: PGSimpleAction; {%H-}parameter: PGVariant; user_data: Tgpointer); cdecl;
  var
    action_name: string;
    app: PGApplication;
    windowList: PGList;
  begin
    app := g_application_get_default;
    windowList := gtk_application_get_windows(GTK_APPLICATION(app));

    action_name := g_action_get_name(G_ACTION(action));
    case action_name of
      'quit': begin
        gtk_window_close(GTK_WINDOW(windowList^.Data));
      end;
      else begin
        g_printf('Unbekannte Action, Name: "%s"'#10, Pgchar(action_name));
      end;
    end;
  end;


  procedure VU_draw_func(drawing_area: PGtkDrawingArea; cr: Pcairo_t; Width: longint; Height: longint; user_data: Tgpointer); cdecl;
  const
    border = 3;
  var
    Level: PLevel;
    w: Tguint32;

    function dB_to_Prozent(db: Tgdouble): Tguint32;
    begin
      Result := 300 - abs(Round(db) * 10);
    end;

  begin
    cairo_set_source_rgb(cr, 0.0, 0.0, 0.0);
    cairo_rectangle(cr, 0, 0, Width, Height);
    cairo_fill(cr);

    Level := g_object_get_data(G_OBJECT(drawing_area), LevelKey);
    if Level <> nil then begin

      w := dB_to_Prozent(Level^.L);
      cairo_set_source_rgb(cr, 1.0, 0.0, 0.0);  // Rot
      cairo_rectangle(cr, border, border, border + w, Height / 2 - 2 * border);
      cairo_fill(cr);

      w := dB_to_Prozent(Level^.R);
      cairo_set_source_rgb(cr, 1.0, 0.0, 0.0);  // Rot
      cairo_rectangle(cr, border, Height / 2 + border, border + w, Height / 2 - 2 * border);
      cairo_fill(cr);
    end;
  end;

  function CreateMediaButtons: PGtkWidget;
  begin
    Result := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 5);
    createBtnButton(Result, nil, 'media-skip-backward-symbolic', 'app.listbox.prev');
    createBtnButton(Result, nil, 'media-seek-backward-symbolic', 'app.listbox.backward');
    createBtnButton(Result, nil, 'media-playback-start-symbolic', 'app.listbox.play');
    createBtnButton(Result, nil, 'media-playback-pause-symbolic', 'app.listbox.pause');
    createBtnButton(Result, nil, 'media-playback-stop-symbolic', 'app.listbox.stop');
    createBtnButton(Result, nil, 'media-seek-forward-symbolic', 'app.listbox.forward');
    createBtnButton(Result, nil, 'media-skip-forward-symbolic', 'app.listbox.next');
  end;

  function CreateMediaControlsPanel: PGtkWidget;
  var
    buttonBox: PGtkWidget;
  begin
    Result := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 5);
    gtk_widget_set_margin_start(Result, 10);
    gtk_widget_set_margin_end(Result, 10);
    gtk_widget_set_margin_top(Result, 10);
    gtk_widget_set_margin_bottom(Result, 10);
    gtk_widget_set_valign(Result, GTK_ALIGN_START);

    buttonBox := CreateMediaButtons;
    gtk_box_append(GTK_BOX(Result), buttonBox);
  end;

  procedure sharedWidgest_free_cp(Data: Tgpointer; where_the_object_was: PGObject); cdecl;
  begin
    g_free(Data);
  end;

  procedure app_activate(app: PGtkApplication; {%H-}user_data: Tgpointer); cdecl;
  var
    mainBox, buttonBox, scrolled_window,
    mediaControlPanel, HBox, VBox, Label_Box, lab1: PGtkWidget;
    sharedWidgets: PSharedWidget;
  begin
    // --- sharedWidgets
    sharedWidgets := g_malloc(SizeOf(TSharedWidget));
    sharedWidgets^.scale_changed_id := 0;
    sharedWidgets^.IsChange := False;

    sharedWidgets^.main_window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(sharedWidgets^.main_window), 'Media Player');
    gtk_window_set_default_size(GTK_WINDOW(sharedWidgets^.main_window), 1024, 768);

    // Main-Menu anzeigen
    gtk_application_window_set_show_menubar(GTK_APPLICATION_WINDOW(sharedWidgets^.main_window), True);

    // --- MainBox
    mainBox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_widget_set_margin_start(mainBox, 10);
    gtk_widget_set_margin_end(mainBox, 10);
    gtk_widget_set_margin_top(mainBox, 10);
    gtk_widget_set_margin_bottom(mainBox, 10);

    // --- Box 1
    // Scale
    sharedWidgets^.scale := gtk_scale_new_with_range(GTK_ORIENTATION_HORIZONTAL, 0.0, 100.0, 1.0);
    gtk_scale_set_draw_value(GTK_SCALE(sharedWidgets^.scale), True);

    gtk_scale_set_value_pos(GTK_SCALE(sharedWidgets^.scale), GTK_POS_TOP);
    gtk_range_set_value(GTK_RANGE(sharedWidgets^.scale), 0.0);
    sharedWidgets^.scale_changed_id := g_signal_connect(sharedWidgets^.scale, 'value-changed', G_CALLBACK(@on_scale_changed_cp), sharedWidgets);
    gtk_box_append(GTK_BOX(mainBox), sharedWidgets^.scale);

    // --- Box 2
    HBox := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 10);
    gtk_widget_set_hexpand(HBox, True);
    gtk_box_append(GTK_BOX(mainBox), HBox);
    VBox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_box_append(GTK_BOX(HBox), VBox);

    // MediaButton
    mediaControlPanel := CreateMediaControlsPanel;
    gtk_box_append(GTK_BOX(VBox), mediaControlPanel);

    // Position/Duration
    Label_Box := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 10);
    gtk_widget_set_margin_start(Label_Box, 15);

    lab1 := gtk_label_new('Position:');
    gtk_box_append(GTK_BOX(Label_Box), lab1);
    sharedWidgets^.LabelPosition := gtk_label_new('00:00:0');
    gtk_widget_set_size_request(sharedWidgets^.LabelPosition, 60, -1);
    gtk_label_set_xalign(GTK_LABEL(sharedWidgets^.LabelPosition), 1.0);
    gtk_box_append(GTK_BOX(Label_Box), sharedWidgets^.LabelPosition);

    lab1 := gtk_label_new('Duration:');
    gtk_box_append(GTK_BOX(Label_Box), lab1);
    sharedWidgets^.LabelDuration := gtk_label_new('00:00:0');
    gtk_widget_set_size_request(sharedWidgets^.LabelDuration, 60, -1);
    gtk_label_set_xalign(GTK_LABEL(sharedWidgets^.LabelDuration), 1.0);
    gtk_box_append(GTK_BOX(Label_Box), sharedWidgets^.LabelDuration);

    gtk_box_append(GTK_BOX(VBox), Label_Box);

    // VU-Meter
    sharedWidgets^.VUMeter := gtk_drawing_area_new;
    gtk_widget_set_hexpand(sharedWidgets^.VUMeter, True);
    gtk_widget_set_size_request(sharedWidgets^.VUMeter, 100, 50);
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(sharedWidgets^.VUMeter), @VU_draw_func, nil, nil);
    gtk_box_append(GTK_BOX(HBox), sharedWidgets^.VUMeter);

    // --- Box 3
    HBox := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 10);
    gtk_widget_set_hexpand(HBox, True);
    gtk_box_append(GTK_BOX(mainBox), HBox);

    // ScrolledWindows / ColumnView
    scrolled_window := gtk_scrolled_window_new;
    gtk_scrolled_window_set_has_frame(GTK_SCROLLED_WINDOW(scrolled_window), True);
    Create_ColumnView(sharedWidgets);
    gtk_widget_set_vexpand(scrolled_window, True);
    gtk_widget_set_hexpand(scrolled_window, True);
    gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(scrolled_window), sharedWidgets^.columnView);
    gtk_box_append(GTK_BOX(HBox), scrolled_window);

    // ButtonBox
    buttonBox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_box_append(GTK_BOX(HBox), buttonBox);

    gtk_box_append(GTK_BOX(buttonBox), gtk_label_new('Edit'));

    CreateBtnButton(buttonBox, 'Append', 'list-add', 'app.listbox.add');
    CreateBtnButton(buttonBox, 'Remove', 'list-remove', 'app.listbox.remove');
    CreateBtnButton(buttonBox, 'Remove All', 'list-remove-all', 'app.listbox.removeall');
    CreateBtnButton(buttonBox, 'Down', 'view-sort-descending', 'app.listbox.down');
    CreateBtnButton(buttonBox, 'Up', 'view-sort-descending', 'app.listbox.up');

    // --- Box End
    gtk_window_set_child(GTK_WINDOW(sharedWidgets^.main_window), mainBox);
    gtk_window_present(GTK_WINDOW(sharedWidgets^.main_window));

    g_object_weak_ref(G_OBJECT(sharedWidgets^.main_Window), @sharedWidgest_free_cp, sharedWidgets);
  end;

  procedure app_startup(app: PGtkApplication; {%H-}user_data: Tgpointer); cdecl;
  var
    action: PGSimpleAction;
  begin
    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);

    gtk_application_set_menubar(GTK_APPLICATION(app), G_MENU_MODEL(CreateMenu));

    action := g_simple_action_new('quit', nil);
    g_signal_connect(action, 'activate', G_CALLBACK(@action_cp), nil);
    g_action_map_add_action(G_ACTION_MAP(app), G_ACTION(action));
    g_object_unref(action);
  end;

  procedure main(argc: Integer; argv: PPChar);
  var
    app: PGtkApplication;
  begin
    gst_init(@argc, @argv);
    app := gtk_application_new('org.gtk.mediaplayer', G_APPLICATION_DEFAULT_FLAGS);

    g_signal_connect(app, 'startup', G_CALLBACK(@app_startup), nil);
    g_signal_connect(app, 'activate', G_CALLBACK(@app_activate), nil);
    g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
  end;

begin
  main(argc, argv);
end.
