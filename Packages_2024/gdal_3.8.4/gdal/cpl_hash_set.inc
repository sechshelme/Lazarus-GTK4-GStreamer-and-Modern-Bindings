{$IFDEF read_interface}


type
  PCPLHashSet = type Pointer;

  TCPLHashSetHashFunc = function(elt: pointer): Tculong; cdecl;
  TCPLHashSetEqualFunc = function(elt1: pointer; elt2: pointer): longint; cdecl;
  TCPLHashSetFreeEltFunc = procedure(elt: pointer); cdecl;
  TCPLHashSetIterEltFunc = function(elt: pointer; user_data: pointer): longint; cdecl;

function CPLHashSetNew(fnHashFunc: TCPLHashSetHashFunc; fnEqualFunc: TCPLHashSetEqualFunc; fnFreeEltFunc: TCPLHashSetFreeEltFunc): PCPLHashSet; cdecl; external libgdal;
procedure CPLHashSetDestroy(set_: PCPLHashSet); cdecl; external libgdal;
procedure CPLHashSetClear(set_: PCPLHashSet); cdecl; external libgdal;
function CPLHashSetSize(set_: PCPLHashSet): longint; cdecl; external libgdal;
procedure CPLHashSetForeach(set_: PCPLHashSet; fnIterFunc: TCPLHashSetIterEltFunc; user_data: pointer); cdecl; external libgdal;
function CPLHashSetInsert(set_: PCPLHashSet; elt: pointer): longint; cdecl; external libgdal;
function CPLHashSetLookup(set_: PCPLHashSet; elt: pointer): pointer; cdecl; external libgdal;
function CPLHashSetRemove(set_: PCPLHashSet; elt: pointer): longint; cdecl; external libgdal;
function CPLHashSetRemoveDeferRehash(set_: PCPLHashSet; elt: pointer): longint; cdecl; external libgdal;
function CPLHashSetHashPointer(elt: pointer): Tculong; cdecl; external libgdal;
function CPLHashSetEqualPointer(elt1: pointer; elt2: pointer): longint; cdecl; external libgdal;
function CPLHashSetHashStr(pszStr: pointer): Tculong; cdecl; external libgdal;
function CPLHashSetEqualStr(pszStr1: pointer; pszStr2: pointer): longint; cdecl; external libgdal;

// === Konventiert am: 2-10-26 15:57:13 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
