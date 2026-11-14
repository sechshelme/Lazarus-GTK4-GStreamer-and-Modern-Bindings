program project1;


// gsettings list-schemas
// gsettings list-keys org.gtk.Settings.FileChooser
// gsettings list-recursively org.gtk.Settings.FileChooser


// g_settings_schema_source_new_from_directory



uses
  fp_glib2;

  function compare_strings(a: Tgconstpointer; b: Tgconstpointer; user_data: Tgpointer): Tgint; cdecl;
  var
    str_a: PPgchar absolute a;
    str_b: PPgchar absolute b;
  begin
    Result := g_strcmp0(str_a^, str_b^);
  end;

  procedure Sort(sa: PPChar);
  var
    len: Tguint;
  begin
    len := g_strv_length(sa);
    g_qsort_with_data(sa, len, SizeOf(Pgchar), @compare_strings, nil);
  end;

  procedure ListAllSchema(source: PGSettingsSchemaSource; schema_id: Pgchar);
  var
    schema: PGSettingsSchema;
    settings: PGSettings;
    keys, k: PPgchar;
    val: PGVariant;
    val_str, schema_path: Pgchar;
  begin
    schema := g_settings_schema_source_lookup(source, schema_id, True);
    if schema <> nil then begin
      schema_path := g_settings_schema_get_path(schema);
      if schema_path <> nil then begin
        settings := g_settings_new(schema_id);

        keys := g_settings_schema_list_keys(schema);
        if keys <> nil then begin
          k := keys;
          while k^ <> nil do begin
            val := g_settings_get_value(settings, k^);
            val_str := g_variant_print(val, True);
            g_printf('    %-25s = %s'#10, k^, val_str);
            g_free(val_str);
            g_variant_unref(val);
            Inc(k);
          end;
        end;

        g_strfreev(keys);
        g_object_unref(settings);
      end;;
    end;;
    g_settings_schema_unref(schema);
  end;

  procedure Print_and_Clear(title: Pgchar; source: PGSettingsSchemaSource; relocatable: PPgchar);
  var
    rel: PPgchar;
  begin
    g_printf('--- %s ---'#10, title);
    if relocatable <> nil then begin
      Sort(relocatable);
      rel := relocatable;
      while rel^ <> nil do begin
        g_printf('  %s'#10, rel^);
        ListAllSchema(source, rel^);
        Inc(rel);
      end;
      g_strfreev(relocatable);
    end;
  end;

  procedure ListAllSources(source: PGSettingsSchemaSource);
  var
    non_relocatable, relocatable: PPgchar;
  begin
    g_settings_schema_source_list_schemas(source, True, @non_relocatable, @relocatable);

    Print_and_Clear('list-relocatable-schemas', source, relocatable);
    Print_and_Clear('schemas', source, non_relocatable);
  end;

  procedure main;
  var
    source: PGSettingsSchemaSource;
  begin
    source := g_settings_schema_source_get_default;
    if source <> nil then begin
      ListAllSources(source);
    end;
  end;

begin
  main;
end.
