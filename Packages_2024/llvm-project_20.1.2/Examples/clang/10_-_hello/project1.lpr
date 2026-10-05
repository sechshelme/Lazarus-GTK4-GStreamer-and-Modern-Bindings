program project1;

uses
  fp_clang,
  fp_llvm;

const
  sourcePath = 'test.c';

  function inspect_ast(cursor: TCXCursor; parent: TCXCursor; client_data: TCXClientData): TCXChildVisitResult; cdecl;
  const
    counter: integer = 0;
  var
    location: TCXSourceLocation;
    kind: TCXCursorKind;
    name, filename: pchar;
    spelling, cx_filename_str: TCXString;
    cx_file: TCXFile = nil;
    curstr: String;
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
      Write(filename: 56, '   ');
    end else begin
      Write('[Compiler Built-in]': 56, '   ');
    end;

    Write('  (', kind:4, ')  ');

    case kind of
      CXCursor_FunctionDecl: begin
          curstr:='function';
      end;
      CXCursor_CallExpr: begin
          curstr:='call';
      end;
      CXCursor_CompoundStmt: begin
          curstr:='{}';
      end;
      CXCursor_ReturnStmt: begin
          curstr:='return';
      end;
      CXCursor_VarDecl: begin
        curstr:='variables';
      end;
      CXCursor_StringLiteral: begin
        curstr:='string';
      end;
      else begin
        curstr:='(unknow)';
      end;
    end;

    WriteLn(curstr,'   ', name);


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
