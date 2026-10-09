{$IFDEF read_interface}


function objc_sync_enter(obj: Tid): longint; cdecl; external libobjc;
function objc_sync_exit(obj: Tid): longint; cdecl; external libobjc;

const
  OBJC_SYNC_SUCCESS = 0;
  OBJC_SYNC_NOT_OWNING_THREAD_ERROR = -(1);
  OBJC_SYNC_TIMED_OUT = -(2);
  OBJC_SYNC_NOT_INITIALIZED = -(3);

  // === Konventiert am: 31-1-26 15:22:11 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
