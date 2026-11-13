program project1;

uses
  fp_zlib;

  procedure main;
  const
    original_text: PChar =
      'Hallo Linux! Das ist ein kleiner Test mit zlib. '#10 +
      'Wiederholungen lassen sich besonders gut komprimieren. '#10 +
      'Hallo Linux! Das ist ein kleiner Test mit zlib.';
  var
    original_length, uncompressed_length: SizeInt;
    compressed_length: TuLong;
    compressed_data: array of Char;
    uncompressed_data: array of Char;
    status: longint;
  begin
    WriteLn('Version: ',zlibVersion);
    WriteLn;

    original_length := Length(original_text) + 1;

    compressed_length := compressBound(original_length);
    SetLength(compressed_data, compressed_length);

    status := compress(PBytef(compressed_data), @compressed_length, PBytef(original_text), original_length);
    if status <> Z_OK then begin
      WriteLn('Fehler beim Komprimieren! Code: ', status);
      Exit;
    end;

    WriteLn('Originalgrösse:     ', original_length);
    WriteLn('Komprimiert:        ', compressed_length);

    uncompressed_length := original_length;
    SetLength(uncompressed_data, uncompressed_length);

    status := uncompress(PBytef(uncompressed_data), @uncompressed_length, PBytef(compressed_data), compressed_length);
    if status <> Z_OK then begin
      WriteLn('Fehler beim Entpacken! Code: ', status);
      Exit;
    end;

    WriteLn('Entpackter Text:    '#10, PChar(uncompressed_data));
  end;

begin
  main;
end.

