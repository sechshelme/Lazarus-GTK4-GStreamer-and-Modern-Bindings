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
    //    Exit(1);

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


function CreateColorGrid16x16: String;
var
  row, col: Integer;
  bgColor, fgColor: Integer;
  blockStr: String;
begin
  Result := '';

  // 16 Zeilen nach unten
  for row := 0 to 15 do begin
    // 16 Spalten nach rechts
    for col := 0 to 15 do begin
      bgColor := col;
      fgColor := row;

      if bgColor = fgColor then
        fgColor := (fgColor + 8) mod 16;

//      WriteStr(blockStr, #27, '[38;5;', fgColor, ';48;5;', bgColor, 'm◆ ');
      WriteStr(blockStr, #27, '[38;5;', fgColor, ';48;5;', bgColor, 'mX ');
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
    r, c: integer;
    p: TVTermPos;
    cell: TVTermScreenCell;
    BaseAddr: pbyte;
    s: String;
  const
    input_data1 = 'Hallo Welt! '#27'[32mDieser Text ist virtuell Rot!'#27'[0m'#13#10;
    input_data2 = 'Hallo Welt! '#27'[33mDieser Text ist virtuell Grün!'#27'[0m'#13#10;
    //    input_data = 'Hallo';
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

    vterm_input_write(vt, input_data1, strlen(input_data1));
    vterm_input_write(vt, input_data2, strlen(input_data2));

    s:=CreateColorGrid16x16;
    vterm_input_write(vt, PChar( s), Length(s));


    //WriteLn('sizeof TVTermScreenCell: ', SizeOf(TVTermScreenCell));
    //WriteLn('sizeof TVTermColor: ', SizeOf(TVTermColor));
    //WriteLn('sizeof TVTermScreenCellAttrs: ', SizeOf(TVTermScreenCellAttrs));
    //
    //BaseAddr := pbyte(@Cell);
    //
    //WriteLn('Offsets fuer VTermScreenCell in Pascal:');
    //WriteLn('--------------------------------------');
    //
    //// Abstand der Feld-Adresse von der Basis-Adresse berechnen
    //WriteLn('chars:  Offset = ', pbyte(@Cell.chars) - BaseAddr, ' Bytes');
    //WriteLn('width:  Offset = ', pbyte(@Cell.width) - BaseAddr, ' Bytes');
    //WriteLn('attrs:  Offset = ', pbyte(@Cell.attrs) - BaseAddr, ' Bytes');
    //WriteLn('fg:     Offset = ', pbyte(@Cell.fg) - BaseAddr, ' Bytes');
    //WriteLn('bg:     Offset = ', pbyte(@Cell.bg) - BaseAddr, ' Bytes');
    //
    //WriteLn;
    //WriteLn('Gesamtgroesse des Records: ', SizeOf(TVTermScreenCell), ' Bytes');


//    WriteLn(s);


    vterm_free(vt);
  end;

begin
  main;
end.
