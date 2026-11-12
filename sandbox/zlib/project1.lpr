program project1;

uses
  fp_zlib;

  procedure main;
  const
    original: PChar =
      'Hallo Linux! Das ist ein kleiner Test mit zlib. '#10 +
      'Wiederholungen lassen sich besonders gut komprimieren. '#10 +
      'Hallo Linux! Das ist ein kleiner Test mit zlib.';
  var
    original_laenge, entpackt_laenge: SizeInt;
    komprimiert_laenge: TuLong;
    komprimiert: array of PChar;
    entpackt: array of PChar;
    status: longint;
  begin
    original_laenge := Length(original) + 1;

    komprimiert_laenge := compressBound(original_laenge);
    SetLength(komprimiert, komprimiert_laenge);

    status := compress(PBytef(komprimiert), @komprimiert_laenge, PBytef(original), original_laenge);
    if status <> Z_OK then begin
      WriteLn('Fehler beim Komprimieren! Code: ', status);
      Exit;;
    end;

    WriteLn('Originalgrösse:     ', original_laenge);
    WriteLn('Komprimiert:        ', komprimiert_laenge);

    entpackt_laenge := original_laenge;
    SetLength(entpackt, entpackt_laenge);

    status := uncompress(PBytef(entpackt), @entpackt_laenge, PBytef(komprimiert), komprimiert_laenge);
    if status <> Z_OK then begin
      WriteLn('Fehler beim Entpacken! Code: ', status);
      Exit;
    end;

    WriteLn('Entpackter Text:    '#10, PChar(entpackt));
  end;

begin
  main;
end.
