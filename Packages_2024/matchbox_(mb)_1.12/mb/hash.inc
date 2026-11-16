{$IFDEF read_interface}


const
  HASHSIZE = 101;

type
  Phash = ^Thash;

  Thash = record
    hashtab: ^Pnlist;
    size: longint;
  end;

  Pnlist = ^Tnlist;

  Tnlist = record
    next: Pnlist;
    key: Pchar;
    value: pbyte;
  end;

function hash_new(size: longint): Phash; cdecl; external libmb;
function hashfunc(h: Phash; s: Pchar): dword; cdecl; external libmb;
function hash_lookup(h: Phash; s: Pchar): Pnlist; cdecl; external libmb;
function hash_add(h: Phash; key: Pchar; val: Pchar): Pnlist; cdecl; external libmb;
procedure hash_empty; cdecl; external libmb;
procedure hash_destroy(h: Phash); cdecl; external libmb;

// === Konventiert am: 15-11-26 17:35:07 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
