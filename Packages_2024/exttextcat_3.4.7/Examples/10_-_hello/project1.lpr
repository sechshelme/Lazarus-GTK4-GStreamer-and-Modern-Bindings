program project1;

uses
  fp_exttextcat;

  procedure main;
  var
    handle: Pointer;
    res: PChar;
    i: integer;

  const
    test_strings: array of PChar = (
      'bli bla blo, blublu blu',
      'Willkommen in einem deutschen Text.',
      'Welcome to this small language detection experiment.',
      'Bonjour tout le monde, comment ça va aujourd''hui?',
      'Hola, qué tal? Esto es una prueba de detección.',
      'This is a short text, aber mit ein bisschen Deutsch gemischt.',
      'Улыбнись, ведь жизнь прекрасна!',
      '千里之行，始于足下。',
      'ابتسم، فالْحَيَاةُ جَمِيلَةٌ.',
      'Hi');

  begin
    chdir('/usr/share/libexttextcat');

    handle := textcat_Init('fpdb.conf');
    if handle = nil then begin
      WriteLn('Fehler: fpdb.conf konnte nicht geladen werden.');
      Exit;
    end;

    WriteLn('--- Starte automatischen Sprachtest ---'#10);

    for i := 0 to Length(test_strings) - 1 do begin
      res := textcat_Classify(handle, test_strings[i], 400);

      WriteLn('Text:    ', test_strings[i]);
      WriteLn('Sprache: ', res);
      WriteLn;
    end;

    textcat_Done(handle);
  end;

begin
  main;
end.
