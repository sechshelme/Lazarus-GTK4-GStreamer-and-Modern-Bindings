program project1;

//    glib-compile-schemas .

uses
  fp_glib2;

  procedure on_nemo_changed(settings: PGSettings; key: Pgchar; user_data: Tgpointer); cdecl;
  var
    val: PGVariant;
    val_str: Pgchar;
  begin
    val := g_settings_get_value(settings, key);
    val_str := g_variant_print(val, True);

    g_print('[NEMO-UPDATE] "%s" -> %s'#10, key, val_str);

    g_free(val_str);
    g_variant_unref(val);
  end;

  procedure main;
  const
    SCHEMA_ID = 'org.nemo.window-state';
  var
    source: PGSettingsSchemaSource;
    schema: PGSettingsSchema;
    settings: PGSettings;
    geom: Pgchar;
    is_max: Tgboolean;
    loop: PGMainLoop;
  begin
    source := g_settings_schema_source_get_default();
    schema := g_settings_schema_source_lookup(source, SCHEMA_ID, True);
    if schema = nil then begin
      g_print('Fehler: Schema "%s" nicht gefunden (ist Nemo installiert?).'#10, SCHEMA_ID);
      Exit;
    end;
    g_settings_schema_unref(schema);

    settings := g_settings_new(SCHEMA_ID);

    geom := g_settings_get_string(settings, 'geometry');
    is_max := g_settings_get_boolean(settings, 'maximized');
    g_print('Aktuelle Nemo-Geometrie: %s | Maximiert: %d'#10, geom, is_max);
    g_free(geom);

    g_signal_connect(settings, 'changed', G_CALLBACK(@on_nemo_changed), nil);

    loop := g_main_loop_new(nil, False);
    g_print('Lausche auf Nemo... (Öffne Nemo und verschiebe/vergrössere das Fenster)'#10);

    g_main_loop_run(loop);

    g_main_loop_unref(loop);
    g_object_unref(settings);
  end;

begin
  main;
end.
