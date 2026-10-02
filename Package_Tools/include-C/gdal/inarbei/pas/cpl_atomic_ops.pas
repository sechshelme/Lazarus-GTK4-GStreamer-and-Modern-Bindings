unit cpl_atomic_ops;

interface

uses
  fp_gdal;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function CPLAtomicAdd(ptr: Plongint; increment: longint): longint; cdecl; external libgdal;

function CPLAtomicInc(ptr: Plongint): longint;
function CPLAtomicDec(ptr: Plongint): longint;

function CPLAtomicCompareAndExchange(ptr: Plongint; oldval: longint; newval: longint): longint; cdecl; external libgdal;

// === Konventiert am: 2-10-26 15:57:30 ===


implementation


function CPLAtomicInc(ptr: Plongint): longint;
begin
  CPLAtomicInc := CPLAtomicAdd(ptr, 1);
end;

function CPLAtomicDec(ptr: Plongint): longint;
begin
  CPLAtomicDec := CPLAtomicAdd(ptr, -(1));
end;


end.
