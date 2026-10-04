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


enum CXChildVisitResult inspect_ast(CXCursor cursor, CXCursor parent, CXClientData client_data) {
    // 1. Die genaue Quellcode-Position des aktuellen Elements ermitteln
    CXSourceLocation location = clang_getCursorLocation(cursor);

    // 2. Prüfen, ob das Element aus einem System-Header (wie stdio.h) stammt
    if (clang_Location_isInSystemHeader(location)) {
        // Ignorieren und mit dem nächsten Element fortfahren
        return CXChildVisit_Continue;
    }

    // Ab hier wird nur noch dein eigener Code verarbeitet!
    enum CXCursorKind kind = clang_getCursorKind(cursor);
    CXString spelling = clang_getCursorSpelling(cursor);
    const char* name = clang_getCString(spelling);

    if (kind == CXCursor_FunctionDecl) {
        printf("Eigene C-Funktion gefunden: %s\n", name);
    } else if (kind == CXCursor_VarDecl) {
        printf("Eigene Variable deklariert: %s\n", name);
    }

    clang_disposeString(spelling);
    return CXChildVisit_Recurse;
}


  procedure main;
  begin
    // 1. Index erstellen
    CXIndex index = clang_createIndex(0, 0);

    // 2. C-Datei parsen (Erstellt die "Translation Unit")
    CXTranslationUnit tu = clang_parseTranslationUnit(
        index, "main.c", NULL, 0, NULL, 0, CXTranslationUnit_None
    );

    if (tu == NULL) {
        printf("Fehler beim Parsen.\n");
        return 1;
    }

    // 3. Den Wurzelknoten des AST holen
    CXCursor root_cursor = clang_getTranslationUnitCursor(tu);

    // 4. Den Baum abwandern und unsere Funktion aufrufen
    clang_visitChildren(root_cursor, inspect_ast, NULL);

    // Speicher freigeben
    clang_disposeTranslationUnit(tu);
    clang_disposeIndex(index);
    return 0;
  end;

begin
  main;
end.
