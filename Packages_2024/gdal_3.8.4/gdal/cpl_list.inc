{$IFDEF read_interface}


type
  PCPLList = ^TCPLList;
  TCPLList = record
    pData: pointer;
    psNext: PCPLList;
  end;

function CPLListAppend(psList: PCPLList; pData: pointer): PCPLList; cdecl; external libgdal;
function CPLListInsert(psList: PCPLList; pData: pointer; nPosition: longint): PCPLList; cdecl; external libgdal;
function CPLListGetLast(psList: PCPLList): PCPLList; cdecl; external libgdal;
function CPLListGet(psList: PCPLList; nPosition: longint): PCPLList; cdecl; external libgdal;
function CPLListCount(psList: PCPLList): longint; cdecl; external libgdal;
function CPLListRemove(psList: PCPLList; nPosition: longint): PCPLList; cdecl; external libgdal;
procedure CPLListDestroy(psList: PCPLList); cdecl; external libgdal;
function CPLListGetNext(psElement: PCPLList): PCPLList; cdecl; external libgdal;
function CPLListGetData(psElement: PCPLList): pointer; cdecl; external libgdal;

// === Konventiert am: 2-10-26 16:20:14 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
