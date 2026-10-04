unit CXFile;

interface

uses
  fp_clang, CXString;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PCXFile = ^TCXFile;
  TCXFile = pointer;

function clang_getFileName(SFile: TCXFile): TCXString; cdecl; external libgclang;
function clang_getFileTime(SFile: TCXFile): Ttime_t; cdecl; external libgclang;

type
  PCXFileUniqueID = ^TCXFileUniqueID;
  TCXFileUniqueID = record
    data: array[0..2] of qword;
  end;

function clang_getFileUniqueID(file_: TCXFile; outID: PCXFileUniqueID): longint; cdecl; external libgclang;
function clang_File_isEqual(file1: TCXFile; file2: TCXFile): longint; cdecl; external libgclang;
function clang_File_tryGetRealPathName(file_: TCXFile): TCXString; cdecl; external libgclang;

// === Konventiert am: 4-10-26 17:29:53 ===


implementation



end.
