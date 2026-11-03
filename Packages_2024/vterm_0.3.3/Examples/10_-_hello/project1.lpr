program project1;

uses
  Crt,
  fp_vterm;

type
  TAppData = record
    screen: PVTermScreen;
  end;
  PAppData = ^TAppData;

  function damage_cp(rect: TVTermRect; user: pointer): longint; cdecl;
  var
    appData: PAppData absolute user;
    x, y: longint;
    tpos: TVTermPos;
    cell: TVTermScreenCell;
  begin
    for y := rect.start_row to rect.end_row - 1 do begin
      for x := rect.start_col to rect.end_col - 1 do begin
        tpos.col := x;
        tpos.row := y;
        if vterm_screen_get_cell(appData^.screen, tpos, @cell) <> 0 then begin
          GotoXY(x + 1, y + 1);
          TextColor(cell.fg.indexed.idx mod 16);
          TextBackground(cell.bg.indexed.idx mod 16);
          Write(char(cell.chars[0]));
        end;
      end;
    end;

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


  function CreateColorGrid16x16: string;
  var
    row, col: integer;
    bgColor, fgColor: integer;
    blockStr: string;
  begin
    Result := '';

    for row := 0 to 15 do begin
      for col := 0 to 15 do begin
        if col < 8 then  begin
          fgColor := col + 30;
        end else begin
          fgColor := col + 82;
        end;
        if row < 8 then  begin
          bgColor := row + 40;
        end else begin
          bgColor := row + 92;
        end;
        WriteStr(blockStr, #27, '[', fgColor, ';', bgColor, 'mXX');
        Result := Result + blockStr;

      end;
      Result := Result + #27 + '[0m' + #13 + #10;
    end;
  end;

  procedure main;
  const
    rows = 25;
    cols = 80;
  var
    appData: TAppData;
    vt: PVTerm;
    cb_screen: TVTermScreenCallbacks;
    s: string;
  const
    hello_red = 'Hallo Welt! '#27'[31mDieser Text ist virtuell Rot!'#27'[0m'#13#10;
    hello_green = 'Hallo Welt! '#27'[32mDieser Text ist virtuell Grün!'#27'[0m'#13#10;
    hello_blue = 'Hallo Welt! '#27'[34mDieser Text ist virtuell Grün!'#27'[0m'#13#10;
  begin
    ClrScr;

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

    appData.screen := vterm_obtain_screen(vt);
    vterm_screen_enable_altscreen(appData.screen, 1);
    vterm_screen_set_callbacks(appData.screen, @cb_screen, @appData);
    vterm_screen_reset(appData.screen, 1);

    vterm_input_write(vt, hello_red, strlen(hello_red));
    vterm_input_write(vt, hello_green, strlen(hello_green));
    vterm_input_write(vt, hello_blue, strlen(hello_blue));

    s := CreateColorGrid16x16;
    vterm_input_write(vt, PChar(s), Length(s));
    vterm_free(vt);

    WriteLn(#27 + '[0m' + #13 + #10);
  end;

begin
  main;
end.
