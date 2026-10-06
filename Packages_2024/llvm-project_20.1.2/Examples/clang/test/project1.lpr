program project1;

(*
clang -Xclang -ast-dump -fsyntax-only test.c

*)

uses
  fp_clang,
  fp_llvm;

const
  sourcePath = 'test.c';

type
  TAppData = record
    depth: PtrInt;
    AstVisitor: TCXCursorVisitor;
  end;
  PAppData = ^TAppData;

  function inspect_ast(cursor: TCXCursor; parent: TCXCursor; client_data: TCXClientData): longint; cdecl;
  var
    appData: PAppData absolute client_data;
    location: TCXSourceLocation;
    kind: TCXCursorKind;
    name, filename: pchar;
    spelling, cx_filename_str: TCXString;
    kind_spelling: TCXString;
    cx_file: TCXFile = nil;
    curstr: string;
    line, column: cardinal;
    eval_result: TCXEvalResult;
  begin
    location := clang_getCursorLocation(cursor);
    clang_getSpellingLocation(location, @cx_file, @line, @column, nil);

    if clang_Location_isInSystemHeader(location) <> 0 then begin
      Exit(longint(CXChildVisit_Continue));
    end;

    kind := clang_getCursorKind(cursor);
    spelling := clang_getCursorSpelling(cursor);
    name := clang_getCString(spelling);

    curstr := name;
    if (kind = CXCursor_IntegerLiteral) and ((curstr = '') or (curstr = '-> ')) then begin
      eval_result := clang_Cursor_Evaluate(cursor);
      if eval_result <> nil then begin
        WriteStr(curstr, clang_EvalResult_getAsInt(eval_result));
        clang_EvalResult_dispose(eval_result);
      end else begin
        curstr := '[Wert]';
      end;
    end;

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

    Write(StringOfChar(' ', appData^.depth * 2));
    WriteLn('-> ', curstr);

    clang_disposeString(spelling);

    Inc(appData^.depth);
    clang_visitChildren(cursor, appData^.AstVisitor, appData);
    Dec(appData^.depth);

    Result := longint(CXChildVisit_Continue);
  end;

  procedure main;
  var
    appData: TAppData;
    index: TCXIndex;
    tu: TCXTranslationUnit;
    root_cursor: TCXCursor;
  const
    arg: array of pchar = (
      '-I/usr/include');

  begin
    appData.depth := 0;
    appData.AstVisitor := @inspect_ast;

    index := clang_createIndex(0, 1);
    tu := clang_parseTranslationUnit(index, sourcePath, PPChar(arg), Length(arg), nil, 0, CXTranslationUnit_None);

    if tu = nil then begin
      WriteLn('Fehler beim Parsen.');
      Exit;
    end;

    root_cursor := clang_getTranslationUnitCursor(tu);

    clang_visitChildren(root_cursor, appData.AstVisitor, @appData);

    clang_disposeTranslationUnit(tu);
    clang_disposeIndex(index);
  end;

begin
  main;
end.
