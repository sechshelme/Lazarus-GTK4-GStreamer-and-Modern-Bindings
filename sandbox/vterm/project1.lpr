program project1;
uses
  fp_vterm;

  function damage_cp(rect: TVTermRect; user: pointer): longint; cdecl;
  begin
    Result := 1;
  end;

  function moverect_cp(dest: TVTermRect; src: TVTermRect; user: pointer): longint; cdecl;
  begin
    Result := 1;
  end;

  function movecursor_cp(pos: TVTermPos; oldpos: TVTermPos; visible: longint; user: pointer): longint; cdecl;
  begin
    Result := 1;
  end;

  function settermprop_cp(prop: TVTermProp; val: PVTermValue; user: pointer): longint; cdecl;
  begin
    Result := 1;
  end;

  function bell_cp(user: pointer): longint; cdecl;
  begin
    Result := 1;
  end;

  procedure main;
  const
    rows = 25;
    cols = 80;
  var
    vt: PVTerm;
    screen: PVTermScreen;
    cb_screen: TVTermScreenCallbacks;
    r, c: integer;
    p: TVTermPos;
    cell: TVTermScreenCell;
  const
    input_data = 'Hallo Welt! '#27'[31mDieser Text ist virtuell Rot!'#27'[0m';
  begin
    with cb_screen do begin
      damage := @damage_cp;
      moverect := @moverect_cp;
      movecursor := @movecursor_cp;
      settermprop := @settermprop_cp;
      bell := @bell_cp;
    end;

    vt := vterm_new(rows, cols);
    if vt = nil then begin
      WriteLn('Fehler beim Erstellen von VTerm');
      Exit;;
    end;

    screen := vterm_obtain_screen(vt);
    vterm_screen_enable_altscreen(screen, 1);
    vterm_screen_set_callbacks(screen, @cb_screen, nil);
    vterm_screen_reset(screen, 1);

    vterm_input_write(vt, input_data, strlen(input_data));
    vterm_input_write(vt, input_data, strlen(input_data));

    WriteLn('--- Inhalt des virtuellen Bildschirms ---');
    for  r := 0 to 5 - 1 do begin
      for  c := 0 to cols - 1 do begin
        p.row := r;
        p.col := c;
        if vterm_screen_get_cell(screen, p, @cell) <> 0 then begin
          if cell.chars[0] <> 0 then begin
            Write(char(cell.chars[0]));
          end else begin
            Write(' ');
          end;
        end;
      end;

      WriteLn;
    end;
    WriteLn('-----------------------------------------');

    vterm_free(vt);
  end;

begin
  main;
end.
