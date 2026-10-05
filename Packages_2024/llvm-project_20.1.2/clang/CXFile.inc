{$IFDEF read_interface}


type
  PCXFile = ^TCXFile;
  TCXFile = pointer;

function clang_getFileName(SFile: TCXFile): TCXString; cdecl; external libclang;
function clang_getFileTime(SFile: TCXFile): Ttime_t; cdecl; external libclang;

type
  PCXFileUniqueID = ^TCXFileUniqueID;
  TCXFileUniqueID = record
    data: array[0..2] of qword;
  end;

function clang_getFileUniqueID(file_: TCXFile; outID: PCXFileUniqueID): longint; cdecl; external libclang;
function clang_File_isEqual(file1: TCXFile; file2: TCXFile): longint; cdecl; external libclang;
function clang_File_tryGetRealPathName(file_: TCXFile): TCXString; cdecl; external libclang;

// === Konventiert am: 4-10-26 17:29:53 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
