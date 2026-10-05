unit CXSourceLocation;

interface

uses
  fp_clang, CXFile, CXString;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PCXSourceLocation = ^TCXSourceLocation;
  TCXSourceLocation = record
    ptr_data: array[0..1] of pointer;
    int_data: dword;
  end;

  PCXSourceRange = ^TCXSourceRange;
  TCXSourceRange = record
    ptr_data: array[0..1] of pointer;
    begin_int_data: dword;
    end_int_data: dword;
  end;

function clang_getNullLocation: TCXSourceLocation; cdecl; external libclang;
function clang_equalLocations(loc1: TCXSourceLocation; loc2: TCXSourceLocation): dword; cdecl; external libclang;
function clang_isBeforeInTranslationUnit(loc1: TCXSourceLocation; loc2: TCXSourceLocation): dword; cdecl; external libclang;
function clang_Location_isInSystemHeader(location: TCXSourceLocation): longint; cdecl; external libclang;
function clang_Location_isFromMainFile(location: TCXSourceLocation): longint; cdecl; external libclang;
function clang_getNullRange: TCXSourceRange; cdecl; external libclang;
function clang_getRange(begin_: TCXSourceLocation; end_: TCXSourceLocation): TCXSourceRange; cdecl; external libclang;
function clang_equalRanges(range1: TCXSourceRange; range2: TCXSourceRange): dword; cdecl; external libclang;
function clang_Range_isNull(range: TCXSourceRange): longint; cdecl; external libclang;
procedure clang_getExpansionLocation(location: TCXSourceLocation; file_: PCXFile; line: Pdword; column: Pdword; offset: Pdword); cdecl; external libclang;
procedure clang_getPresumedLocation(location: TCXSourceLocation; filename: PCXString; line: Pdword; column: Pdword); cdecl; external libclang;
procedure clang_getInstantiationLocation(location: TCXSourceLocation; file_: PCXFile; line: Pdword; column: Pdword; offset: Pdword); cdecl; external libclang;
procedure clang_getSpellingLocation(location: TCXSourceLocation; file_: PCXFile; line: Pdword; column: Pdword; offset: Pdword); cdecl; external libclang;
procedure clang_getFileLocation(location: TCXSourceLocation; file_: PCXFile; line: Pdword; column: Pdword; offset: Pdword); cdecl; external libclang;
function clang_getRangeStart(range: TCXSourceRange): TCXSourceLocation; cdecl; external libclang;
function clang_getRangeEnd(range: TCXSourceRange): TCXSourceLocation; cdecl; external libclang;

type
  PCXSourceRangeList = ^TCXSourceRangeList;
  TCXSourceRangeList = record
    count: dword;
    ranges: PCXSourceRange;
  end;

procedure clang_disposeSourceRangeList(ranges: PCXSourceRangeList); cdecl; external libclang;

// === Konventiert am: 4-10-26 17:29:51 ===


implementation



end.
