{$IFDEF read_interface}



function aiGetLegalString: Pchar; cdecl; external libassimp;
function aiGetVersionPatch: dword; cdecl; external libassimp;
function aiGetVersionMinor: dword; cdecl; external libassimp;
function aiGetVersionMajor: dword; cdecl; external libassimp;
function aiGetVersionRevision: dword; cdecl; external libassimp;
function aiGetBranchName: Pchar; cdecl; external libassimp;

const
  ASSIMP_CFLAGS_SHARED = $1;
  ASSIMP_CFLAGS_STLPORT = $2;
  ASSIMP_CFLAGS_DEBUG = $4;
  ASSIMP_CFLAGS_NOBOOST = $8;
  ASSIMP_CFLAGS_SINGLETHREADED = $10;
  ASSIMP_CFLAGS_DOUBLE_SUPPORT = $20;

function aiGetCompileFlags: dword; cdecl; external libassimp;

// === Konventiert am: 22-11-26 17:34:08 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
