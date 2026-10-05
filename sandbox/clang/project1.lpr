program project1;

uses
  CXErrorCode,
  CXString,
  CXCompilationDatabase,
  CXFile,
  CXSourceLocation,
  CXDiagnostic,
  BuildSystem,
  Index,
  Documentation,
  FatalErrorHandler,
  Rewrite,

  fp_llvm,
  fp_clang;

const
  sourcePath = '/home/tux/Schreibtisch/gtk4_2/main.c';

  function inspect_ast(cursor: TCXCursor; parent: TCXCursor; client_data: TCXClientData): TCXChildVisitResult; cdecl;
  const
    counter: integer = 0;
  var
    location: TCXSourceLocation;
    kind: TCXCursorKind;
    name, filename: pchar;
    spelling, cx_filename_str: TCXString;
    cx_file: TCXFile = nil;
  begin
    inc(counter);
    kind := clang_getCursorKind(cursor);
    spelling := clang_getCursorSpelling(cursor);
    name := clang_getCString(spelling);

    location := clang_getCursorLocation(cursor);
    clang_getSpellingLocation(location, @cx_file, nil, nil, nil);

    Write('cnt:', counter: 5);
    if cx_file <> nil then begin
      cx_filename_str := clang_getFileName(cx_file);
      filename := clang_getCString(cx_filename_str);
      Write(filename: 46, '   ');
    end else begin
      Write('[Compiler Built-in]': 46, '   ');
    end;

    case kind of
      CXCursor_FunctionDecl: begin
        WriteLn('Funktion gefunden: ', name);
      end;
      CXCursor_VarDecl: begin
        WriteLn('Variable deklariert: ', name);
      end;
      else begin
        WriteLn('kind: (', kind, ')  ', name);
      end;
    end;

    clang_disposeString(spelling);
    if cx_file <> nil then begin
      clang_disposeString(cx_filename_str);
    end;

    if clang_Location_isInSystemHeader(location) <> 0 then begin
      Exit(CXChildVisit_Continue);
    end;

    Result := CXChildVisit_Recurse;
  end;

  procedure main;
  var
    index: TCXIndex;
    tu: TCXTranslationUnit;
    root_cursor: TCXCursor;
  const
    arg: array of pchar = (
      '-I/usr/include/gtk-4.0',
      '-I/usr/include/pango-1.0',
      '-I/usr/include/glib-2.0',
      '-I/usr/lib/x86_64-linux-gnu/glib-2.0/include',
      '-I/usr/include/harfbuzz',
      '-I/usr/include/freetype2',
      '-I/usr/include/libpng16',
      '-I/usr/include/libmount',
      '-I/usr/include/blkid',
      '-I/usr/include/fribidi',
      '-I/usr/include/cairo',
      '-I/usr/include/pixman-1',
      '-I/usr/include/gdk-pixbuf-2.0',
      '-I/usr/include/x86_64-linux-gnu',
      '-I/usr/include/webp',
      '-I/usr/include/graphene-1.0',
      '-I/usr/lib/x86_64-linux-gnu/graphene-1.0/include');

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
