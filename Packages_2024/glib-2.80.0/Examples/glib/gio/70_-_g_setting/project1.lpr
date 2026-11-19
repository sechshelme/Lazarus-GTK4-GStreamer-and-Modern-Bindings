program project1;

uses
  fp_glib2;

  procedure on_gtk_changed(settings: PGSettings; key: Pgchar; user_data: Tgpointer); cdecl;
  var
    val: PGVariant;
    val_str: Pgchar;
  begin
    val := g_settings_get_value(settings, key);
    val_str := g_variant_print(val, True);

    g_printf('[GTK-DIALOG-UPDATE] "%s" -> %s'#10, key, val_str);

    g_free(val_str);
    g_variant_unref(val);
  end;

  procedure main;
  const
    SCHEMA_ID = 'org.gtk.Settings.FileChooser';
  var
    source: PGSettingsSchemaSource;
    schema: PGSettingsSchema;
    settings: PGSettings;
    loop: PGMainLoop;
    last_folder: Pgchar;
  begin
    source := g_settings_schema_source_get_default;
    schema := g_settings_schema_source_lookup(source, SCHEMA_ID, True);
    if schema = nil then begin
      g_printf('Fehler: Schema "%s" nicht gefunden.'#10, SCHEMA_ID);
      Exit;
    end;
    g_settings_schema_unref(schema);

    settings := g_settings_new(SCHEMA_ID);

    last_folder := g_settings_get_string(settings, 'last-folder-uri');
    g_printf('Letzter Ordner: %s'#10, last_folder);
    g_free(last_folder);

    g_signal_connect(settings, 'changed', G_CALLBACK(@on_gtk_changed), nil);

    loop := g_main_loop_new(nil, False);
    g_printf('Lausche auf GTK-Dateidialog... (Öffne in irgendeinem Programm "Datei öffnen" und ändere die Fenstergrösse oder drücke Strg+H)'#10);

    g_main_loop_run(loop);

    g_main_loop_unref(loop);
    g_object_unref(settings);
  end;

begin
  main;
end.

