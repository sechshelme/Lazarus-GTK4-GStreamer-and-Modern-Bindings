program project1;

uses
  fp_glib2,
  fp_cairo,
  fp_GTK4,
  fp_gtkchart;

const
  appDataKey = 'anyKey';

const
  VIEWPORT_WIDTH = 25;

  function CreateLineChart: PGtkWidget;
  var
    line_chart: PGtkWidget;
  begin
    line_chart := gtk_chart_new;
    gtk_chart_set_type(GTK_CHART(line_chart), GTK_CHART_TYPE_LINE);
    gtk_chart_set_color(GTK_CHART(line_chart), 'line_color', 'red');
    gtk_chart_set_title(GTK_CHART(line_chart), 'Line Chart');
    gtk_chart_set_x_min(GTK_CHART(line_chart), 0.0);
    gtk_chart_set_x_max(GTK_CHART(line_chart), VIEWPORT_WIDTH);
    gtk_chart_set_y_min(GTK_CHART(line_chart), -3.5);
    gtk_chart_set_y_max(GTK_CHART(line_chart), 3.5);
    gtk_widget_set_hexpand(line_chart, True);
    gtk_widget_set_vexpand(line_chart, True);
    Result := line_chart;
  end;

  function CreateBarChart: PGtkWidget;
  var
    column_chart: PGtkWidget;
    i: integer;
  const
    days: array of pchar = ('Montag', 'Dienstag', 'Mittwoch', 'Donnerstag', 'Freitag', 'Samstag', 'Sonntag');

  begin
    column_chart := gtk_chart_new;
    gtk_chart_set_type(GTK_CHART(column_chart), GTK_CHART_TYPE_COLUMN);
    gtk_chart_set_title(GTK_CHART(column_chart), 'Column Chart');
    gtk_widget_set_hexpand(column_chart, True);
    gtk_widget_set_vexpand(column_chart, True);

    for i := 0 to Length(days) - 1 do begin
      gtk_chart_add_column(GTK_CHART(column_chart), Random * 9.0, '#2ECC71', days[i]);
    end;
    Result := column_chart;
  end;

  procedure plot_line_chart_timeout(user_data: Tgpointer);
  var
    chart: PGtkChart absolute user_data;
    y: double;
  const
    x: double = 0.0;
  begin
    y := 3.0 * sin(x);

    if x > gtk_chart_get_x_max(chart) then begin
      gtk_chart_set_x_min(chart, x - VIEWPORT_WIDTH);
      gtk_chart_set_x_max(chart, x);
    end;

    gtk_chart_plot_point(chart, x, y);
    x += 0.1;
  end;

  function on_tick(widget: PGtkWidget; frame_clock: PGdkFrameClock; user_data: Tgpointer): Tgboolean; cdecl;
  begin
    plot_line_chart_timeout(user_data);
    gtk_widget_queue_draw(widget);
    Result := G_SOURCE_CONTINUE;
  end;

  procedure quit_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    window: PGtkWindow absolute user_data;
  begin
    gtk_window_destroy(window);
  end;

  procedure activate_cp(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, box, button, chart_area, header_bar, new_button: PGtkWidget;
  begin
    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);

    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'PLplot demo');
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 480);

    header_bar := gtk_header_bar_new;
    gtk_window_set_titlebar(GTK_WINDOW(window), header_bar);
    new_button := gtk_button_new_with_label('new');
    gtk_header_bar_pack_end(GTK_HEADER_BAR(header_bar), new_button);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);

    chart_area := CreateLineChart;
    gtk_widget_add_tick_callback(chart_area, @on_tick, chart_area, nil);
    gtk_box_append(GTK_BOX(box), chart_area);

    chart_area := CreateBarChart;
    gtk_box_append(GTK_BOX(box), chart_area);

    button := gtk_button_new_with_label('Quit');
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_cp), window);
    gtk_box_append(GTK_BOX(box), button);

    gtk_window_set_child(GTK_WINDOW(window), box);
    gtk_window_present(GTK_WINDOW(window));
  end;

  procedure main;
  var
    app: PGtkApplication;
  begin
    Randomize;

    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate_cp), nil);
    g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
  end;

begin
  main;
end.
