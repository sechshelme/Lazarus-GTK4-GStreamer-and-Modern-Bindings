program project1;

uses
  fp_glib2,
  fp_atspi;

  procedure on_focus_changed(event: PAtspiEvent; user_data: pointer); cdecl;
  var
    obj: PAtspiAccessible;
    name, desc: Pgchar;
  begin
    obj := event^.source;

    if obj <> nil then begin
      name := atspi_accessible_get_name(obj, nil);
      desc := atspi_accessible_get_description(obj, nil);

      g_printf('[FOKUS GEÄNDERT]'#10);
      g_printf('Element-Name: %s'#10, name);
      g_printf('Beschreibung: %s'#10#10, desc);

      g_free(name);
      g_free(desc);
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
