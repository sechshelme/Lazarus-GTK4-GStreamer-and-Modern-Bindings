{$IFDEF read_interface}


type
  TCXDiagnosticSeverity = longint;
const
  CXDiagnostic_Ignored = 0;
  CXDiagnostic_Note = 1;
  CXDiagnostic_Warning = 2;
  CXDiagnostic_Error = 3;
  CXDiagnostic_Fatal = 4;

type
  PCXDiagnostic = ^TCXDiagnostic;
  TCXDiagnostic = pointer;

  PCXDiagnosticSet = ^TCXDiagnosticSet;
  TCXDiagnosticSet = pointer;

function clang_getNumDiagnosticsInSet(Diags: TCXDiagnosticSet): dword; cdecl; external libclang;
function clang_getDiagnosticInSet(Diags: TCXDiagnosticSet; Index: dword): TCXDiagnostic; cdecl; external libclang;

type
  PCXLoadDiag_Error = ^TCXLoadDiag_Error;
  TCXLoadDiag_Error = longint;
const
  CXLoadDiag_None = 0;
  CXLoadDiag_Unknown = 1;
  CXLoadDiag_CannotLoad = 2;
  CXLoadDiag_InvalidFile = 3;

function clang_loadDiagnostics(file_: pchar; error: PCXLoadDiag_Error; errorString: PCXString): TCXDiagnosticSet; cdecl; external libclang;
procedure clang_disposeDiagnosticSet(Diags: TCXDiagnosticSet); cdecl; external libclang;
function clang_getChildDiagnostics(D: TCXDiagnostic): TCXDiagnosticSet; cdecl; external libclang;
procedure clang_disposeDiagnostic(Diagnostic: TCXDiagnostic); cdecl; external libclang;

type
  TCXDiagnosticDisplayOptions = longint;
const
  CXDiagnostic_DisplaySourceLocation = $01;
  CXDiagnostic_DisplayColumn = $02;
  CXDiagnostic_DisplaySourceRanges = $04;
  CXDiagnostic_DisplayOption = $08;
  CXDiagnostic_DisplayCategoryId = $10;
  CXDiagnostic_DisplayCategoryName = $20;

function clang_formatDiagnostic(Diagnostic: TCXDiagnostic; Options: dword): TCXString; cdecl; external libclang;
function clang_defaultDiagnosticDisplayOptions: dword; cdecl; external libclang;
function clang_getDiagnosticSeverity(para1: TCXDiagnostic): TCXDiagnosticSeverity; cdecl; external libclang;
function clang_getDiagnosticLocation(para1: TCXDiagnostic): TCXSourceLocation; cdecl; external libclang;
function clang_getDiagnosticSpelling(para1: TCXDiagnostic): TCXString; cdecl; external libclang;
function clang_getDiagnosticOption(Diag: TCXDiagnostic; Disable: PCXString): TCXString; cdecl; external libclang;
function clang_getDiagnosticCategory(para1: TCXDiagnostic): dword; cdecl; external libclang;
function clang_getDiagnosticCategoryName(Category: dword): TCXString; cdecl; external libclang; deprecated;
function clang_getDiagnosticCategoryText(para1: TCXDiagnostic): TCXString; cdecl; external libclang;
function clang_getDiagnosticNumRanges(para1: TCXDiagnostic): dword; cdecl; external libclang;
function clang_getDiagnosticRange(Diagnostic: TCXDiagnostic; Range: dword): TCXSourceRange; cdecl; external libclang;
function clang_getDiagnosticNumFixIts(Diagnostic: TCXDiagnostic): dword; cdecl; external libclang;
function clang_getDiagnosticFixIt(Diagnostic: TCXDiagnostic; FixIt: dword; ReplacementRange: PCXSourceRange): TCXString; cdecl; external libclang;

// === Konventiert am: 4-10-26 17:29:58 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
