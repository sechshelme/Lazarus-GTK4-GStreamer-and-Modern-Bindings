{$IFDEF read_interface}


type
  PGVirStreamPrivate = type Pointer;

  PGVirStream = ^TGVirStream;
  TGVirStream = record
    parent_instance: TGIOStream;
    priv: PGVirStreamPrivate;
  end;

  PGVirStreamClass = ^TGVirStreamClass;
  TGVirStreamClass = record
    parent_class: TGIOStreamClass;
    padding: array[0..19] of Tgpointer;
  end;

  TGVirStreamSinkFunc = function(stream: PGVirStream; buf: Pgchar; nbytes: Tgsize; user_data: Tgpointer): Tgint; cdecl;
  TGVirStreamSourceFunc = function(stream: PGVirStream; buf: Pgchar; nbytes: Tgsize; user_data: Tgpointer): Tgint; cdecl;

function gvir_stream_get_type: TGType; cdecl; external libvirtgobject;
function gvir_stream_handle_get_type: TGType; cdecl; external libvirtgobject;
type
  PGVirStreamIOCondition = ^TGVirStreamIOCondition;
  TGVirStreamIOCondition = longint;
const
  GVIR_STREAM_IO_CONDITION_READABLE = 1 shl 0;
  GVIR_STREAM_IO_CONDITION_WRITABLE = 1 shl 1;
  GVIR_STREAM_IO_CONDITION_HANGUP = 1 shl 2;
  GVIR_STREAM_IO_CONDITION_ERROR = 1 shl 3;

type
  TGVirStreamIOFunc = function(stream: PGVirStream; cond: TGVirStreamIOCondition; opaque: Tgpointer): Tgboolean; cdecl;

function gvir_stream_add_watch(stream: PGVirStream; cond: TGVirStreamIOCondition; func: TGVirStreamIOFunc; opaque: Tgpointer): Tguint; cdecl; external libvirtgobject;
function gvir_stream_add_watch_full(stream: PGVirStream; priority: Tgint; cond: TGVirStreamIOCondition; func: TGVirStreamIOFunc; opaque: Tgpointer;
  notify: TGDestroyNotify): Tguint; cdecl; external libvirtgobject;
function gvir_stream_receive_all(stream: PGVirStream; cancellable: PGCancellable; func: TGVirStreamSinkFunc; user_data: Tgpointer; error: PPGError): Tgssize; cdecl; external libvirtgobject;
function gvir_stream_receive(stream: PGVirStream; buffer: Pgchar; size: Tgsize; cancellable: PGCancellable; error: PPGError): Tgssize; cdecl; external libvirtgobject;
function gvir_stream_send_all(stream: PGVirStream; cancellable: PGCancellable; func: TGVirStreamSourceFunc; user_data: Tgpointer; error: PPGError): Tgssize; cdecl; external libvirtgobject;
function gvir_stream_send(stream: PGVirStream; buffer: Pgchar; size: Tgsize; cancellable: PGCancellable; error: PPGError): Tgssize; cdecl; external libvirtgobject;

// === Konventiert am: 18-10-26 19:31:24 ===

function GVIR_TYPE_STREAM: TGType;
function GVIR_STREAM(obj: Pointer): PGVirStream;
function GVIR_STREAM_CLASS(klass: Pointer): PGVirStreamClass;
function GVIR_IS_STREAM(obj: Pointer): Tgboolean;
function GVIR_IS_STREAM_CLASS(klass: Pointer): Tgboolean;
function GVIR_STREAM_GET_CLASS(obj: Pointer): PGVirStreamClass;

function GVIR_TYPE_STREAM_HANDLE: TGType;


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_TYPE_STREAM: TGType;
begin
  GVIR_TYPE_STREAM := gvir_stream_get_type;
end;

function GVIR_STREAM(obj: Pointer): PGVirStream;
begin
  Result := PGVirStream(g_type_check_instance_cast(obj, GVIR_TYPE_STREAM));
end;

function GVIR_STREAM_CLASS(klass: Pointer): PGVirStreamClass;
begin
  Result := PGVirStreamClass(g_type_check_class_cast(klass, GVIR_TYPE_STREAM));
end;

function GVIR_IS_STREAM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_TYPE_STREAM);
end;

function GVIR_IS_STREAM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_TYPE_STREAM);
end;

function GVIR_STREAM_GET_CLASS(obj: Pointer): PGVirStreamClass;
begin
  Result := PGVirStreamClass(PGTypeInstance(obj)^.g_class);
end;


function GVIR_TYPE_STREAM_HANDLE: TGType;
begin
  GVIR_TYPE_STREAM_HANDLE := gvir_stream_handle_get_type;
end;


{$ENDIF read_implementation}
