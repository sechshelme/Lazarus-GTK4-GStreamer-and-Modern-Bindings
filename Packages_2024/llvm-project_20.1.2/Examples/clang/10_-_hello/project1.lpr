program project1;

uses
  fp_clang,
  fp_llvm;

const
  sourcePath = '../test_file.c';

type
  TNodeStack = record
    Cursors: array [0..512] of TCXCursor;
    Count: integer;
  end;
  PNodeStack = ^TNodeStack;

  function inspect_ast(cursor: TCXCursor; parent: TCXCursor; client_data: TCXClientData): TCXChildVisitResult; cdecl;
  var
    location: TCXSourceLocation;
    kind: TCXCursorKind;
    name, filename: pchar;
    spelling, cx_filename_str: TCXString;
    kind_spelling: TCXString;
    cx_file: TCXFile = nil;
    line, column: cardinal;
  const
     stack: TNodeStack=();
  begin
    location := clang_getCursorLocation(cursor);
    clang_getSpellingLocation(location, @cx_file, @line, @column, nil);

    if clang_Location_isInSystemHeader(location) <> 0 then begin
      Exit(CXChildVisit_Continue);
    end;

    while (stack.Count > 0) and (clang_equalCursors(stack.Cursors[stack.Count - 1], parent) = 0) do begin
      Dec(stack.Count);
    end;

    kind := clang_getCursorKind(cursor);
    spelling := clang_getCursorSpelling(cursor);
    name := clang_getCString(spelling);

    if cx_file <> nil then begin
      cx_filename_str := clang_getFileName(cx_file);
      filename := clang_getCString(cx_filename_str);
      Write(filename, ':', line: 3, ':', column: 2);
      clang_disposeString(cx_filename_str);
    end else begin
      Write('[Compiler Built-in]:': 20);
    end;

    kind_spelling := clang_getCursorKindSpelling(kind);
    Write('  (', clang_getCString(kind_spelling): 22, ')  ');
    clang_disposeString(kind_spelling);

    Write(StringOfChar(' ', stack.Count * 2));
    WriteLn('-> ', name);

    clang_disposeString(spelling);

    if stack.Count < 512 then begin
      stack.Cursors[stack.Count] := cursor;
      Inc(stack.Count);
    end;

    Result := CXChildVisit_Recurse;
  end;

  procedure main;
  var
    index: TCXIndex;
    tu: TCXTranslationUnit;
    root_cursor: TCXCursor;
  const
    arg: array of pchar = ('-I/usr/include');

  begin
    index := clang_createIndex(0, 1);
    tu := clang_parseTranslationUnit(index, sourcePath, PPChar(arg), Length(arg), nil, 0, CXTranslationUnit_None);

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
