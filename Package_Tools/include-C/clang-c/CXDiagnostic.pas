unit CXDiagnostic;

interface

uses
  fp_clang, CXString, CXSourceLocation;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


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

function clang_getNumDiagnosticsInSet(Diags: TCXDiagnosticSet): dword; cdecl; external libgclang;
function clang_getDiagnosticInSet(Diags: TCXDiagnosticSet; Index: dword): TCXDiagnostic; cdecl; external libgclang;

type
  PCXLoadDiag_Error = ^TCXLoadDiag_Error;
  TCXLoadDiag_Error = longint;
const
  CXLoadDiag_None = 0;
  CXLoadDiag_Unknown = 1;
  CXLoadDiag_CannotLoad = 2;
  CXLoadDiag_InvalidFile = 3;

function clang_loadDiagnostics(file_: pchar; error: PCXLoadDiag_Error; errorString: PCXString): TCXDiagnosticSet; cdecl; external libgclang;
procedure clang_disposeDiagnosticSet(Diags: TCXDiagnosticSet); cdecl; external libgclang;
function clang_getChildDiagnostics(D: TCXDiagnostic): TCXDiagnosticSet; cdecl; external libgclang;
procedure clang_disposeDiagnostic(Diagnostic: TCXDiagnostic); cdecl; external libgclang;

type
  TCXDiagnosticDisplayOptions = longint;
const
  CXDiagnostic_DisplaySourceLocation = $01;
  CXDiagnostic_DisplayColumn = $02;
  CXDiagnostic_DisplaySourceRanges = $04;
  CXDiagnostic_DisplayOption = $08;
  CXDiagnostic_DisplayCategoryId = $10;
  CXDiagnostic_DisplayCategoryName = $20;

function clang_formatDiagnostic(Diagnostic: TCXDiagnostic; Options: dword): TCXString; cdecl; external libgclang;
function clang_defaultDiagnosticDisplayOptions: dword; cdecl; external libgclang;
function clang_getDiagnosticSeverity(para1: TCXDiagnostic): TCXDiagnosticSeverity; cdecl; external libgclang;
function clang_getDiagnosticLocation(para1: TCXDiagnostic): TCXSourceLocation; cdecl; external libgclang;
function clang_getDiagnosticSpelling(para1: TCXDiagnostic): TCXString; cdecl; external libgclang;
function clang_getDiagnosticOption(Diag: TCXDiagnostic; Disable: PCXString): TCXString; cdecl; external libgclang;
function clang_getDiagnosticCategory(para1: TCXDiagnostic): dword; cdecl; external libgclang;
function clang_getDiagnosticCategoryName(Category: dword): TCXString; cdecl; external libgclang; deprecated;
function clang_getDiagnosticCategoryText(para1: TCXDiagnostic): TCXString; cdecl; external libgclang;
function clang_getDiagnosticNumRanges(para1: TCXDiagnostic): dword; cdecl; external libgclang;
function clang_getDiagnosticRange(Diagnostic: TCXDiagnostic; Range: dword): TCXSourceRange; cdecl; external libgclang;
function clang_getDiagnosticNumFixIts(Diagnostic: TCXDiagnostic): dword; cdecl; external libgclang;
function clang_getDiagnosticFixIt(Diagnostic: TCXDiagnostic; FixIt: dword; ReplacementRange: PCXSourceRange): TCXString; cdecl; external libgclang;

// === Konventiert am: 4-10-26 17:29:58 ===


implementation



end.
