program project1;


// gsettings list-schemas
// gsettings list-keys org.gtk.Settings.FileChooser
// gsettings list-recursively org.gtk.Settings.FileChooser



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

  procedure Print_and_Clear(title: Pgchar; schemas: PPgchar);
  var
    nr: PPgchar;
  begin
    g_printf('--- %s ---'#10, title);
    if schemas <> nil then begin
      Sort(schemas);
      nr := schemas;
      while nr^ <> nil do begin
        g_printf('  %s'#10, nr^);
        Inc(nr);
      end;
      g_strfreev(schemas);
    end;
  end;

  procedure ListAll(source: PGSettingsSchemaSource);
  var
    non_relocatable, relocatable: PPgchar;
  begin
    g_settings_schema_source_list_schemas(source, True, @non_relocatable, @relocatable);

    Print_and_Clear('list-relocatable-schemas', relocatable);
    Print_and_Clear('schemas', non_relocatable);
  end;

  procedure main;
  const
    SCHEMA_ID = 'org.gtk.Settings.FileChooser';
  var
    source: PGSettingsSchemaSource;
  begin
    source := g_settings_schema_source_get_default;
    if source <> nil then begin
      ListAll(source);
    end;
  end;

begin
  main;
end.
