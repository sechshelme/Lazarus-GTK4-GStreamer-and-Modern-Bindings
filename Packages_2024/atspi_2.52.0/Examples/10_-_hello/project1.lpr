program project1;

uses
  fp_glib2,
  fp_atspi;

  procedure on_focus_changed(event: PAtspiEvent; user_data: pointer); cdecl;
  var
    obj: PAtspiAccessible;
    name, desc, role_name, full_text, app_name: Pgchar;
    text_iface: PAtspiText;
    app: PAtspiAccessible;
  begin
    obj := event^.source;

    if obj <> nil then begin
      name := atspi_accessible_get_name(obj, nil);
      desc := atspi_accessible_get_description(obj, nil);

      g_printf('--- Fokus gewechselt ---'#10);
      g_printf('  Element-Name: %s'#10, name);
      g_printf('  Beschreibung: %s'#10, desc);

      g_free(name);
      g_free(desc);

      role_name := atspi_accessible_get_role_name(obj, nil);
      if role_name <> nil then begin
        g_printf('  Typ (Rolle): %s'#10, role_name);
        g_free(role_name);
      end;

      app := atspi_accessible_get_application(obj, nil);
      if app <> nil then begin
        app_name := atspi_accessible_get_name(app, nil);
        g_printf('  Anwendung:    %s'#10, app_name);
        g_free(app_name);
      end;

      text_iface := atspi_accessible_get_text_iface(obj);
      if text_iface <> nil then begin
        full_text := atspi_text_get_text(text_iface, 0, -1, nil);
        if full_text <> nil then begin
          g_printf('  Inhaltstext:  %s'#10, full_text);
          g_free(full_text);
        end;
      end;

      g_printf(#10);
    end;
  end;

  procedure main;
  var
    listener: PAtspiEventListener;
    err: PGError = nil;
  begin
    atspi_init;
    listener := atspi_event_listener_new(@on_focus_changed, nil, nil);
    atspi_event_listener_register(listener, 'object:state-changed:focused', @err);

    if err <> nil then begin
      g_printerr('Fehler beim Registrieren des Listeners: %s'#10, err^.message);
      g_error_free(err);
      Exit;;
    end;

    g_printf('Listener gestartet. Wechsle den Fokus in Fenstern, um Text zu empfangen...'#10#10);
    atspi_event_main;
  end;

begin
  main;
end.
