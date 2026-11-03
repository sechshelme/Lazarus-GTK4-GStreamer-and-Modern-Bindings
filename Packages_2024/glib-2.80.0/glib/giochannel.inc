
{$IFDEF read_interface}

type
  PGIOError = ^TGIOError;
  TGIOError = longint;

const
  G_IO_ERROR_NONE = 0;
  G_IO_ERROR_AGAIN = 1;
  G_IO_ERROR_INVAL = 2;
  G_IO_ERROR_UNKNOWN = 3;

type
  PGIOChannelError = ^TGIOChannelError;
  TGIOChannelError = longint;

const
  G_IO_CHANNEL_ERROR_FBIG = 0;
  G_IO_CHANNEL_ERROR_INVAL = 1;
  G_IO_CHANNEL_ERROR_IO = 2;
  G_IO_CHANNEL_ERROR_ISDIR = 3;
  G_IO_CHANNEL_ERROR_NOSPC = 4;
  G_IO_CHANNEL_ERROR_NXIO = 5;
  G_IO_CHANNEL_ERROR_OVERFLOW = 6;
  G_IO_CHANNEL_ERROR_PIPE = 7;
  G_IO_CHANNEL_ERROR_FAILED = 8;

type
  PGIOStatus = ^TGIOStatus;
  TGIOStatus = longint;

const
  G_IO_STATUS_ERROR = 0;
  G_IO_STATUS_NORMAL = 1;
  G_IO_STATUS_EOF = 2;
  G_IO_STATUS_AGAIN = 3;

type
  PGSeekType = ^TGSeekType;
  TGSeekType = longint;

const
  G_SEEK_CUR = 0;
  G_SEEK_SET = 1;
  G_SEEK_END = 2;

type
  PGIOFlags = ^TGIOFlags;
  TGIOFlags = longint;

const
  G_IO_FLAG_NONE = 0;
  G_IO_FLAG_APPEND = 1 shl 0;
  G_IO_FLAG_NONBLOCK = 1 shl 1;
  G_IO_FLAG_IS_READABLE = 1 shl 2;
  G_IO_FLAG_IS_WRITABLE = 1 shl 3;
  G_IO_FLAG_IS_WRITEABLE = 1 shl 3;
  G_IO_FLAG_IS_SEEKABLE = 1 shl 4;
  G_IO_FLAG_MASK = (1 shl 5) - 1;
  G_IO_FLAG_GET_MASK = G_IO_FLAG_MASK;
  G_IO_FLAG_SET_MASK = G_IO_FLAG_APPEND or G_IO_FLAG_NONBLOCK;

type

  TGIOChannel = bitpacked record
    ref_count: Tgint;
    funcs: ^TGIOFuncs;
    encoding: Pgchar;
    read_cd: TGIConv;
    write_cd: TGIConv;
    line_term: Pgchar;
    line_term_len: Tguint;
    buf_size: Tgsize;
    read_buf: PGString;
    encoded_read_buf: PGString;
    write_buf: PGString;
    partial_write_buf: array[0..5] of Tgchar;

    use_buffer     : 0..1;	//* The encoding uses the buffers */
    do_encode      : 0..1;	//* The encoding uses the GIConv coverters */
    close_on_unref : 0..1;	//* Close the channel on final unref */
    is_readable    : 0..1;	//* Cached GIOFlag */
    is_writeable   : 0..1;	//* ditto */
    is_seekable    : 0..1;	//* ditto */

(*        ?????????????????
    guint use_buffer     : 1;	/* The encoding uses the buffers */
    guint do_encode      : 1;	/* The encoding uses the GIConv coverters */
    guint close_on_unref : 1;	/* Close the channel on final unref */
    guint is_readable    : 1;	/* Cached GIOFlag */
    guint is_writeable   : 1;	/* ditto */
    guint is_seekable    : 1;	/* ditto */
*)
//     flag0: word;

    reserved1: Tgpointer;
    reserved2: Tgpointer;
  end;
  PGIOChannel = ^TGIOChannel;

  TGIOFunc = function(Source: PGIOChannel; condition: TGIOCondition; Data: Tgpointer): Tgboolean; cdecl;
  PGIOFuncs = ^TGIOFuncs;

  TGIOFuncs = record
    io_read: function(channel: PGIOChannel; buf: Pgchar; Count: Tgsize; bytes_read: Pgsize; err: PPGError): TGIOStatus; cdecl;
    io_write: function(channel: PGIOChannel; buf: Pgchar; Count: Tgsize; bytes_written: Pgsize; err: PPGError): TGIOStatus; cdecl;
    io_seek: function(channel: PGIOChannel; offset: Tgint64; _type: TGSeekType; err: PPGError): TGIOStatus; cdecl;
    io_close: function(channel: PGIOChannel; err: PPGError): TGIOStatus; cdecl;
    io_create_watch: function(channel: PGIOChannel; condition: TGIOCondition): PGSource; cdecl;
    io_free: procedure(channel: PGIOChannel); cdecl;
    io_set_flags: function(channel: PGIOChannel; flags: TGIOFlags; err: PPGError): TGIOStatus; cdecl;
    io_get_flags: function(channel: PGIOChannel): TGIOFlags; cdecl;
  end;

procedure g_io_channel_init(channel: PGIOChannel); cdecl; external libglib2;
function g_io_channel_ref(channel: PGIOChannel): PGIOChannel; cdecl; external libglib2;
procedure g_io_channel_unref(channel: PGIOChannel); cdecl; external libglib2;
function g_io_channel_read(channel: PGIOChannel; buf: Pgchar; Count: Tgsize; bytes_read: Pgsize): TGIOError; cdecl; external libglib2; deprecated 'GLIB_DEPRECATED_FOR(g_io_channel_read_chars)';
function g_io_channel_write(channel: PGIOChannel; buf: Pgchar; Count: Tgsize; bytes_written: Pgsize): TGIOError; cdecl; external libglib2; deprecated 'GLIB_DEPRECATED_FOR(g_io_channel_write_chars)';
function g_io_channel_seek(channel: PGIOChannel; offset: Tgint64; _type: TGSeekType): TGIOError; cdecl; external libglib2; deprecated 'GLIB_DEPRECATED_FOR(g_io_channel_seek_position)';
procedure g_io_channel_close(channel: PGIOChannel); cdecl; external libglib2;
function g_io_channel_shutdown(channel: PGIOChannel; flush: Tgboolean; err: PPGError): TGIOStatus; cdecl; external libglib2; deprecated 'GLIB_DEPRECATED_FOR(g_io_channel_shutdown)';
function g_io_add_watch_full(channel: PGIOChannel; priority: Tgint; condition: TGIOCondition; func: TGIOFunc; user_data: Tgpointer;
  notify: TGDestroyNotify): Tguint; cdecl; external libglib2;
function g_io_create_watch(channel: PGIOChannel; condition: TGIOCondition): PGSource; cdecl; external libglib2;
function g_io_add_watch(channel: PGIOChannel; condition: TGIOCondition; func: TGIOFunc; user_data: Tgpointer): Tguint; cdecl; external libglib2;
procedure g_io_channel_set_buffer_size(channel: PGIOChannel; size: Tgsize); cdecl; external libglib2;
function g_io_channel_get_buffer_size(channel: PGIOChannel): Tgsize; cdecl; external libglib2;
function g_io_channel_get_buffer_condition(channel: PGIOChannel): TGIOCondition; cdecl; external libglib2;
function g_io_channel_set_flags(channel: PGIOChannel; flags: TGIOFlags; error: PPGError): TGIOStatus; cdecl; external libglib2;
function g_io_channel_get_flags(channel: PGIOChannel): TGIOFlags; cdecl; external libglib2;
procedure g_io_channel_set_line_term(channel: PGIOChannel; line_term: Pgchar; length: Tgint); cdecl; external libglib2;
function g_io_channel_get_line_term(channel: PGIOChannel; length: Pgint): Pgchar; cdecl; external libglib2;
procedure g_io_channel_set_buffered(channel: PGIOChannel; buffered: Tgboolean); cdecl; external libglib2;
function g_io_channel_get_buffered(channel: PGIOChannel): Tgboolean; cdecl; external libglib2;
function g_io_channel_set_encoding(channel: PGIOChannel; encoding: Pgchar; error: PPGError): TGIOStatus; cdecl; external libglib2;
function g_io_channel_get_encoding(channel: PGIOChannel): Pgchar; cdecl; external libglib2;
procedure g_io_channel_set_close_on_unref(channel: PGIOChannel; do_close: Tgboolean); cdecl; external libglib2;
function g_io_channel_get_close_on_unref(channel: PGIOChannel): Tgboolean; cdecl; external libglib2;
function g_io_channel_flush(channel: PGIOChannel; error: PPGError): TGIOStatus; cdecl; external libglib2;
function g_io_channel_read_line(channel: PGIOChannel; str_return: PPgchar; length: Pgsize; terminator_pos: Pgsize; error: PPGError): TGIOStatus; cdecl; external libglib2;
function g_io_channel_read_line_string(channel: PGIOChannel; buffer: PGString; terminator_pos: Pgsize; error: PPGError): TGIOStatus; cdecl; external libglib2;
function g_io_channel_read_to_end(channel: PGIOChannel; str_return: PPgchar; length: Pgsize; error: PPGError): TGIOStatus; cdecl; external libglib2;
function g_io_channel_read_chars(channel: PGIOChannel; buf: Pgchar; Count: Tgsize; bytes_read: Pgsize; error: PPGError): TGIOStatus; cdecl; external libglib2;
function g_io_channel_read_unichar(channel: PGIOChannel; thechar: Pgunichar; error: PPGError): TGIOStatus; cdecl; external libglib2;
function g_io_channel_write_chars(channel: PGIOChannel; buf: Pgchar; Count: Tgssize; bytes_written: Pgsize; error: PPGError): TGIOStatus; cdecl; external libglib2;
function g_io_channel_write_unichar(channel: PGIOChannel; thechar: Tgunichar; error: PPGError): TGIOStatus; cdecl; external libglib2;
function g_io_channel_seek_position(channel: PGIOChannel; offset: Tgint64; _type: TGSeekType; error: PPGError): TGIOStatus; cdecl; external libglib2;
function g_io_channel_new_file(filename: Pgchar; mode: Pgchar; error: PPGError): PGIOChannel; cdecl; external libglib2;
function g_io_channel_error_quark: TGQuark; cdecl; external libglib2;
function g_io_channel_error_from_errno(en: Tgint): TGIOChannelError; cdecl; external libglib2;
function g_io_channel_unix_new(fd: longint): PGIOChannel; cdecl; external libglib2;
function g_io_channel_unix_get_fd(channel: PGIOChannel): Tgint; cdecl; external libglib2;

var
  g_io_watch_funcs: TGSourceFuncs; cvar;external libglib2;
  {$ifdef win32}
const
  G_WIN32_MSG_HANDLE = 19981206;

procedure g_io_channel_win32_make_pollfd(channel: PGIOChannel; condition: TGIOCondition; fd: PGPollFD); cdecl; external libglib2;
function g_io_channel_win32_poll(fds: PGPollFD; n_fds: Tgint; timeout_: Tgint): Tgint; cdecl; external libglib2;

function g_io_channel_win32_new_messages(hwnd: Tgsize): PGIOChannel; cdecl; external libglib2;
function g_io_channel_win32_new_fd(fd: Tgint): PGIOChannel; cdecl; external libglib2;
function g_io_channel_win32_get_fd(channel: PGIOChannel): Tgint; cdecl; external libglib2;
function g_io_channel_win32_new_socket(socket: Tgint): PGIOChannel; cdecl; external libglib2;
function g_io_channel_win32_new_stream_socket(socket: Integer): PGIOChannel; cdecl; external libglib2; deprecated 'GLIB_DEPRECATED_FOR(g_io_channel_win32_new_socket)';
procedure g_io_channel_win32_set_debug(channel: PGIOChannel; flag: Tgboolean); cdecl; external libglib2;
{$endif}

function G_IO_CHANNEL_ERROR: TGQuark;

// === Konventiert am: 8-8-24 19:34:54 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_IO_CHANNEL_ERROR: TGQuark;
begin
  G_IO_CHANNEL_ERROR := g_io_channel_error_quark;
end;



{$ENDIF read_implementation}
