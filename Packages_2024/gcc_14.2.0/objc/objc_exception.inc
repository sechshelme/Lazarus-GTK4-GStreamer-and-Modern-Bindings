{$IFDEF read_interface}


procedure objc_exception_throw(exception: Tid); cdecl; external libobjc;

type
  Tobjc_exception_matcher = function(catch_class: TClass; exception: Tid): longint; cdecl;

function objc_setExceptionMatcher(new_matcher: Tobjc_exception_matcher): Tobjc_exception_matcher; cdecl; external libobjc;

type
  Tobjc_uncaught_exception_handler = procedure(exception: Tid); cdecl;

function objc_setUncaughtExceptionHandler(new_handler: Tobjc_uncaught_exception_handler): Tobjc_uncaught_exception_handler; cdecl; external libobjc;

// === Konventiert am: 31-1-26 15:22:08 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
