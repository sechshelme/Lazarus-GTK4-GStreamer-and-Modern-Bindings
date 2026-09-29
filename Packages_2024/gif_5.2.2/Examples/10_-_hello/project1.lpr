program project1;

uses fp_gif;

  procedure main;
  const
    dateiname = '/home/tux/Schreibtisch/von_Git/webkit/WebKit/ManualTests/resources/3dolph.gif';
  var
    gif_datei: PGifFileType;
    fehler_code: longint;
  begin
    gif_datei := DGifOpenFileName(dateiname, @fehler_code);

    if DGifSlurp(gif_datei) = GIF_ERROR then begin
      WriteLn('Fehler beim Einlesen der GIF-Daten.');
      DGifCloseFile(gif_datei, @fehler_code);
      Exit;;
    end;

    WriteLn(gif_datei^.SWidth, ' x ', gif_datei^.SHeight, ' x ', gif_datei^.SColorResolution, '  page: ', gif_datei^.ImageCount);
    if DGifCloseFile(gif_datei, @fehler_code) = GIF_ERROR then begin
      WriteLn('Fehler beim Schliessen der Datei. Fehler-Code: ', fehler_code);
      Exit;
    end;
  end;

begin
  main;
end.
