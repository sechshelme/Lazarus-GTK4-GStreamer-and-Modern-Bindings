{$IFDEF read_interface}


type
  PCXString = ^TCXString;
  TCXString = record
    data: pointer;
    private_flags: dword;
  end;

  PCXStringSet = ^TCXStringSet;
  TCXStringSet = record
    Strings: PCXString;
    Count: dword;
  end;

function clang_getCString(_string: TCXString): pchar; cdecl; external libclang;
procedure clang_disposeString(_string: TCXString); cdecl; external libclang;
procedure clang_disposeStringSet(set_: PCXStringSet); cdecl; external libclang;

// === Konventiert am: 4-10-26 17:29:49 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
