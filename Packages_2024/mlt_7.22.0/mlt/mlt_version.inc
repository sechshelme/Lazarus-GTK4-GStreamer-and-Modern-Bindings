{$IFDEF read_interface}


const
  LIBMLT_VERSION_MAJOR = 7;
  LIBMLT_VERSION_MINOR = 22;
  LIBMLT_VERSION_REVISION = 0;

function mlt_version_get_int: longint; cdecl; external libmlt;
function mlt_version_get_major: longint; cdecl; external libmlt;
function mlt_version_get_minor: longint; cdecl; external libmlt;
function mlt_version_get_revision: longint; cdecl; external libmlt;
function mlt_version_get_string: pchar; cdecl; external libmlt;

// === Konventiert am: 30-9-26 19:44:28 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
