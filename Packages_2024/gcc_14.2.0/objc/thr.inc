{$IFDEF read_interface}


var
  __objc_thread_exit_status: longint; cvar;external libobjc;

const
  OBJC_THREAD_INTERACTIVE_PRIORITY = 2;
  OBJC_THREAD_BACKGROUND_PRIORITY = 1;
  OBJC_THREAD_LOW_PRIORITY = 0;

type
  Pobjc_thread_t = ^Tobjc_thread_t;
  Tobjc_thread_t = pointer;

  Tobjc_mutex = record
    owner: Tobjc_thread_t;
    depth: longint;
    backend: pointer;
  end;
  Pobjc_mutex = ^Tobjc_mutex;

  Pobjc_mutex_t = ^Tobjc_mutex_t;
  Tobjc_mutex_t = Pobjc_mutex;

  Tobjc_condition = record
    backend: pointer;
  end;
  Pobjc_condition = ^Tobjc_condition;

  Pobjc_condition_t = ^Tobjc_condition_t;
  Tobjc_condition_t = Pobjc_condition;

function objc_mutex_allocate: Tobjc_mutex_t; cdecl; external libobjc;
function objc_mutex_deallocate(mutex: Tobjc_mutex_t): longint; cdecl; external libobjc;
function objc_mutex_lock(mutex: Tobjc_mutex_t): longint; cdecl; external libobjc;
function objc_mutex_unlock(mutex: Tobjc_mutex_t): longint; cdecl; external libobjc;
function objc_mutex_trylock(mutex: Tobjc_mutex_t): longint; cdecl; external libobjc;
function objc_condition_allocate: Tobjc_condition_t; cdecl; external libobjc;
function objc_condition_deallocate(condition: Tobjc_condition_t): longint; cdecl; external libobjc;
function objc_condition_wait(condition: Tobjc_condition_t; mutex: Tobjc_mutex_t): longint; cdecl; external libobjc;
function objc_condition_signal(condition: Tobjc_condition_t): longint; cdecl; external libobjc;
function objc_condition_broadcast(condition: Tobjc_condition_t): longint; cdecl; external libobjc;
function objc_thread_detach(selector: TSEL; obj: Tid; argument: Tid): Tobjc_thread_t; cdecl; external libobjc;
procedure objc_thread_yield; cdecl; external libobjc;
function objc_thread_exit: longint; cdecl; external libobjc;
function objc_thread_set_priority(priority: longint): longint; cdecl; external libobjc;
function objc_thread_get_priority: longint; cdecl; external libobjc;
function objc_thread_get_data: pointer; cdecl; external libobjc;
function objc_thread_set_data(value: pointer): longint; cdecl; external libobjc;
function objc_thread_id: Tobjc_thread_t; cdecl; external libobjc;
procedure objc_thread_add; cdecl; external libobjc;
procedure objc_thread_remove; cdecl; external libobjc;

type
  Tobjc_thread_callback = procedure(para1: pointer); cdecl;

function objc_set_thread_callback(func: Tobjc_thread_callback): Tobjc_thread_callback; cdecl; external libobjc;
function __objc_init_thread_system: longint; cdecl; external libobjc;

// === Konventiert am: 31-1-26 15:22:17 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
