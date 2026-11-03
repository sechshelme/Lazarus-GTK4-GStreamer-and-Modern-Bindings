{$IFDEF read_interface}


type
  Tevhttp_request_kind = longint;

const
  EVHTTP_REQUEST = 0;
  EVHTTP_RESPONSE = 1;

type
  Pevhttp_uri = type Pointer;
  Pevhttp = type Pointer;
  Pevhttp_bound_socket = type Pointer;
  Pevhttp_connection = type Pointer;

type
  Tevhttp_cmd_type = longint;

const
  EVHTTP_REQ_GET = 1 shl 0;
  EVHTTP_REQ_POST = 1 shl 1;
  EVHTTP_REQ_HEAD = 1 shl 2;
  EVHTTP_REQ_PUT = 1 shl 3;
  EVHTTP_REQ_DELETE = 1 shl 4;
  EVHTTP_REQ_OPTIONS = 1 shl 5;
  EVHTTP_REQ_TRACE = 1 shl 6;
  EVHTTP_REQ_CONNECT = 1 shl 7;
  EVHTTP_REQ_PATCH = 1 shl 8;

type
  Tevhttp_request_error = longint;

const
  EVREQ_HTTP_TIMEOUT = 0;
  EVREQ_HTTP_EOF = 1;
  EVREQ_HTTP_INVALID_HEADER = 2;
  EVREQ_HTTP_BUFFER_ERROR = 3;
  EVREQ_HTTP_REQUEST_CANCEL = 4;
  EVREQ_HTTP_DATA_TOO_LONG = 5;

// =========

const
  EVHTTP_REQ_OWN_CONNECTION = $0001;
  EVHTTP_PROXY_REQUEST = $0002;
  EVHTTP_USER_OWNED = $0004;
  EVHTTP_REQ_DEFER_FREE = $0008;
  EVHTTP_REQ_NEEDS_FREE = $0010;

type
  Pevhttp_request = ^Tevhttp_request;
  Tevhttp_request = bitpacked record
    next: record
      tqe_next: Pevhttp_request;
      tqe_prev: ^Pevhttp_request;
      end;
    evcon: Pevhttp_connection;
    flags: longint;
    input_headers: Pevkeyvalq;
    output_headers: Pevkeyvalq;
    remote_host: pchar;
    remote_port: Tev_uint16_t;
    host_cache: pchar;
    kind: Tevhttp_request_kind;
    _type: Tevhttp_cmd_type;
    headers_size: Tsize_t;
    body_size: Tsize_t;
    uri: pchar;
    uri_elems: Pevhttp_uri;
    major: char;
    minor: char;
    response_code: longint;
    response_code_line: pchar;
    input_buffer: Pevbuffer;
    ntoread: Tev_int64_t;
    chunked: 0..1;
    userdone: 0..1;
    output_buffer: Pevbuffer;
    cb: procedure(para1: Pevhttp_request; para2: pointer); cdecl;
    cb_arg: pointer;
    chunk_cb: procedure(para1: Pevhttp_request; para2: pointer); cdecl;
    header_cb: function(para1: Pevhttp_request; para2: pointer): longint; cdecl;
    error_cb: procedure(para1: Tevhttp_request_error; para2: pointer); cdecl;
    on_complete_cb: procedure(para1: Pevhttp_request; para2: pointer); cdecl;
    on_complete_cb_arg: pointer;
  end;


  // === Konventiert am: 26-8-25 19:37:50 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
