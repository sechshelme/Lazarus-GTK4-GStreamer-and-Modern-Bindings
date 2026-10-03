{$IFDEF read_interface}


function CPLAtomicAdd(ptr: Plongint; increment: longint): longint; cdecl; external libgdal;

function CPLAtomicInc(ptr: Plongint): longint;
function CPLAtomicDec(ptr: Plongint): longint;

function CPLAtomicCompareAndExchange(ptr: Plongint; oldval: longint; newval: longint): longint; cdecl; external libgdal;

// === Konventiert am: 2-10-26 15:57:30 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function CPLAtomicInc(ptr: Plongint): longint;
begin
  CPLAtomicInc := CPLAtomicAdd(ptr, 1);
end;

function CPLAtomicDec(ptr: Plongint): longint;
begin
  CPLAtomicDec := CPLAtomicAdd(ptr, -(1));
end;


{$ENDIF read_implementation}
