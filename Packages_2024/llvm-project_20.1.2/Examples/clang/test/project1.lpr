program project1;

uses
  fp_clang,
  fp_llvm,
  SysUtils; // Für allgemeine Hilfsfunktionen falls nötig

const
  sourcePath = 'test.c';

  function inspect_ast(cursor: TCXCursor; parent: TCXCursor; client_data: TCXClientData): Longint; cdecl;
  var
    location: TCXSourceLocation;
    kind: TCXCursorKind;
    name, filename: pchar;
    spelling, cx_filename_str: TCXString;
    kind_spelling: TCXString;
    cx_file: TCXFile = nil;
    curstr: String;
    line, column: Cardinal;
    depth: Integer;
    ancestor: TCXCursor;
  begin
    location := clang_getCursorLocation(cursor);

    // 1. Erst die Location auflösen, um cx_file zu prüfen
    clang_getSpellingLocation(location, @cx_file, @line, @column, nil);

    // 2. Sicherstellen, dass es kein System-Header ist
    if clang_Location_isInSystemHeader(location) <> 0 then begin
      Exit(Longint(CXChildVisit_Continue));
    end;

    kind := clang_getCursorKind(cursor);
    spelling := clang_getCursorSpelling(cursor);
    name := clang_getCString(spelling);

    // 3. Dateinamen DYNAMISCH ermitteln
    if cx_file <> nil then begin
      cx_filename_str := clang_getFileName(cx_file);
      filename := clang_getCString(cx_filename_str);
      // Hier wird jetzt der echte, dynamische Pfad/Dateiname ausgegeben!
      Write(filename, ':', line:3, ':', column:2);
      clang_disposeString(cx_filename_str);
    end else begin
      Write('[Compiler Built-in]:':20);
    end;

    // 4. Clang-Knoten-Typ holen
    kind_spelling := clang_getCursorKindSpelling(kind);
    curstr := clang_getCString(kind_spelling);
    Write('  (', curstr:22, ')  ');

    // 5. Echte Baumtiefe ermitteln
    depth := 0;
    ancestor := parent;
    while (clang_Cursor_isNull(ancestor) = 0) and (clang_isTranslationUnit(clang_getCursorKind(ancestor)) = 0) do
    begin
      inc(depth);
      ancestor := clang_getCursorSemanticParent(ancestor);
    end;

    // Struktur-Einrückung
    for depth := 1 to depth do Write('  ');
    WriteLn('-> ', name);

    clang_disposeString(kind_spelling);
    clang_disposeString(spelling);

    Result := Longint(CXChildVisit_Recurse);
  end;

procedure main;
var
  index: TCXIndex;
  tu: TCXTranslationUnit;
  root_cursor: TCXCursor;
const
  arg: array of pchar = (
    '-I/usr/include');

begin
  index := clang_createIndex(0, 1);
  tu := clang_parseTranslationUnit(index, sourcePath, PPChar(arg), Length(arg), nil, 0, CXTranslationUnit_None);
  //    tu := clang_parseTranslationUnit(index, sourcePath, nil, 0, nil, 0, CXTranslationUnit_None);

  if tu = nil then begin
    WriteLn('Fehler beim Parsen.');
    Exit;
  end;

  root_cursor := clang_getTranslationUnitCursor(tu);
  clang_visitChildren(root_cursor, @inspect_ast, nil);

  clang_disposeTranslationUnit(tu);
  clang_disposeIndex(index);
end;

begin
  main;
end.

