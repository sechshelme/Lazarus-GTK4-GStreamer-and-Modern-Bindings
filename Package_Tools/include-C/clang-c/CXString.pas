unit CXString;

interface

uses
  fp_clang;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


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

function clang_getCString(_string: TCXString): pchar; cdecl; external libgclang;
procedure clang_disposeString(_string: TCXString); cdecl; external libgclang;
procedure clang_disposeStringSet(set_: PCXStringSet); cdecl; external libgclang;

// === Konventiert am: 4-10-26 17:29:49 ===


implementation



end.
