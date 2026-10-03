{$IFDEF read_interface}

type
  PCPLVirtualMem = type Pointer;

  TCPLVirtualMemCachePageCbk = procedure(ctxt: PCPLVirtualMem; nOffset: Tsize_t; pPageToFill: pointer; nToFill: Tsize_t; pUserData: pointer); cdecl;
  TCPLVirtualMemUnCachePageCbk = procedure(ctxt: PCPLVirtualMem; nOffset: Tsize_t; pPageToBeEvicted: pointer; nToBeEvicted: Tsize_t; pUserData: pointer); cdecl;
  TCPLVirtualMemFreeUserData = procedure(pUserData: pointer); cdecl;

type
  PCPLVirtualMemAccessMode = ^TCPLVirtualMemAccessMode;
  TCPLVirtualMemAccessMode = longint;
const
  VIRTUALMEM_READONLY = 0;
  VIRTUALMEM_READONLY_ENFORCED = 1;
  VIRTUALMEM_READWRITE = 2;

function CPLGetPageSize: Tsize_t; cdecl; external libgdal;
function CPLVirtualMemNew(nSize: Tsize_t; nCacheSize: Tsize_t; nPageSizeHint: Tsize_t; bSingleThreadUsage: longint; eAccessMode: TCPLVirtualMemAccessMode;
  pfnCachePage: TCPLVirtualMemCachePageCbk; pfnUnCachePage: TCPLVirtualMemUnCachePageCbk; pfnFreeUserData: TCPLVirtualMemFreeUserData; pCbkUserData: pointer): PCPLVirtualMem; cdecl; external libgdal;
function CPLIsVirtualMemFileMapAvailable: longint; cdecl; external libgdal;
function CPLVirtualMemFileMapNew(fp: PVSILFILE; nOffset: Tvsi_l_offset; nLength: Tvsi_l_offset; eAccessMode: TCPLVirtualMemAccessMode; pfnFreeUserData: TCPLVirtualMemFreeUserData;
  pCbkUserData: pointer): PCPLVirtualMem; cdecl; external libgdal;
function CPLVirtualMemDerivedNew(pVMemBase: PCPLVirtualMem; nOffset: Tvsi_l_offset; nSize: Tvsi_l_offset; pfnFreeUserData: TCPLVirtualMemFreeUserData; pCbkUserData: pointer): PCPLVirtualMem; cdecl; external libgdal;
procedure CPLVirtualMemFree(ctxt: PCPLVirtualMem); cdecl; external libgdal;
function CPLVirtualMemGetAddr(ctxt: PCPLVirtualMem): pointer; cdecl; external libgdal;
function CPLVirtualMemGetSize(ctxt: PCPLVirtualMem): Tsize_t; cdecl; external libgdal;
function CPLVirtualMemIsFileMapping(ctxt: PCPLVirtualMem): longint; cdecl; external libgdal;
function CPLVirtualMemGetAccessMode(ctxt: PCPLVirtualMem): TCPLVirtualMemAccessMode; cdecl; external libgdal;
function CPLVirtualMemGetPageSize(ctxt: PCPLVirtualMem): Tsize_t; cdecl; external libgdal;
function CPLVirtualMemIsAccessThreadSafe(ctxt: PCPLVirtualMem): longint; cdecl; external libgdal;
procedure CPLVirtualMemDeclareThread(ctxt: PCPLVirtualMem); cdecl; external libgdal;
procedure CPLVirtualMemUnDeclareThread(ctxt: PCPLVirtualMem); cdecl; external libgdal;
procedure CPLVirtualMemPin(ctxt: PCPLVirtualMem; pAddr: pointer; nSize: Tsize_t; bWriteOp: longint); cdecl; external libgdal;
procedure CPLVirtualMemManagerTerminate; cdecl; external libgdal;

// === Konventiert am: 2-10-26 16:32:52 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
