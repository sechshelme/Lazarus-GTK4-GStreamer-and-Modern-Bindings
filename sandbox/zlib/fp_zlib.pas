unit fp_zlib;

interface

const
  {$IFDEF Linux}
  libzlib = 'z';
  {$ENDIF}

  {$IFDEF Windows}
  libzlib = 'z.dll';
  {$ENDIF}

type
  {$IFDEF Linux}
  Tculong = uint64;
  Tclong = int64;
  {$ENDIF}
  {$IFDEF windows}
  Tculong = uint32;
  Tclong = int32;
  {$ENDIF}
  Pculong = ^Tculong;
  Pclong = ^Tclong;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

type
  Pz_crc_t=type Pointer;
  Pwchar_t=type Pointer;
  Tva_list=type Pointer; // ?????


// ==== zconf.h

type
  Pz_size_t = ^Tz_size_t;
  Tz_size_t = SizeUInt;

  Tz_longlong = int64;

const
  MAX_WBITS = 15;

type
  PuInt = ^TuInt;
  TuInt = UInt32;

  PuLong = ^TuLong;
  TuLong = Tculong;

  PBytef = ^TBytef;
  TBytef = Byte;

  Pcharf = ^Tcharf;
  Tcharf = char;

  Pintf = ^Tintf;
  Tintf = longint;

  PuIntf = ^TuIntf;
  TuIntf = TuInt;

  PuLongf = ^TuLongf;
  TuLongf = TuLong;

  Pvoidpc = ^Tvoidpc;
  Tvoidpc = pointer;

  Pvoidpf = ^Tvoidpf;
  Tvoidpf = pointer;

  Pvoidp = ^Tvoidp;
  Tvoidp = pointer;

  Tz_off_t = Int64;
  Tz_off64_t=Int64;

const
  SEEK_SET = 0;
  SEEK_CUR = 1;
  SEEK_END = 2;


// ==== zlib.h


const
  ZLIB_VERSION = '1.3';  
  ZLIB_VERNUM = $1300;  
  ZLIB_VER_MAJOR = 1;  
  ZLIB_VER_MINOR = 3;  
  ZLIB_VER_REVISION = 0;  
  ZLIB_VER_SUBREVISION = 0;  
type

  Talloc_func = function (opaque:Tvoidpf; items:TuInt; size:TuInt):Tvoidpf;cdecl;

  Tfree_func = procedure (opaque:Tvoidpf; address:Tvoidpf);cdecl;
  Pinternal_state = type Pointer;

  Pz_stream_s = ^Tz_stream_s;
  Tz_stream_s = record
      next_in : PBytef;
      avail_in : TuInt;
      total_in : TuLong;
      next_out : PBytef;
      avail_out : TuInt;
      total_out : TuLong;
      msg : Pchar;
      state : Pinternal_state;
      zalloc : Talloc_func;
      zfree : Tfree_func;
      opaque : Tvoidpf;
      data_type : longint;
      adler : TuLong;
      reserved : TuLong;
    end;
  Tz_stream = Tz_stream_s;
  Pz_stream = ^Tz_stream;

  Pz_streamp = ^Tz_streamp;
  Tz_streamp = Pz_stream;

  Pgz_header_s = ^Tgz_header_s;
  Tgz_header_s = record
      text : longint;
      time : TuLong;
      xflags : longint;
      os : longint;
      extra : PBytef;
      extra_len : TuInt;
      extra_max : TuInt;
      name : PBytef;
      name_max : TuInt;
      comment : PBytef;
      comm_max : TuInt;
      hcrc : longint;
      done : longint;
    end;
  Tgz_header = Tgz_header_s;
  Pgz_header = ^Tgz_header;

  Pgz_headerp = ^Tgz_headerp;
  Tgz_headerp = Pgz_header;

const
  Z_NO_FLUSH = 0;  
  Z_PARTIAL_FLUSH = 1;  
  Z_SYNC_FLUSH = 2;  
  Z_FULL_FLUSH = 3;  
  Z_FINISH = 4;  
  Z_BLOCK = 5;  
  Z_TREES = 6;  
  Z_OK = 0;
  Z_STREAM_END = 1;  
  Z_NEED_DICT = 2;  
  Z_ERRNO = -(1);  
  Z_STREAM_ERROR = -(2);  
  Z_DATA_ERROR = -(3);  
  Z_MEM_ERROR = -(4);  
  Z_BUF_ERROR = -(5);  
  Z_VERSION_ERROR = -(6);  
  Z_NO_COMPRESSION = 0;
  Z_BEST_SPEED = 1;  
  Z_BEST_COMPRESSION = 9;  
  Z_DEFAULT_COMPRESSION = -(1);  
  Z_FILTERED = 1;
  Z_HUFFMAN_ONLY = 2;  
  Z_RLE = 3;  
  Z_FIXED = 4;  
  Z_DEFAULT_STRATEGY = 0;  
  Z_BINARY = 0;
  Z_TEXT = 1;  
  Z_ASCII = Z_TEXT;
  Z_UNKNOWN = 2;  
  Z_DEFLATED = 8;
  Z_NULL = 0;

function zlibVersion:Pchar;cdecl;external libzlib;
function deflate(strm:Tz_streamp; flush:longint):longint;cdecl;external libzlib;
function deflateEnd(strm:Tz_streamp):longint;cdecl;external libzlib;
function inflate(strm:Tz_streamp; flush:longint):longint;cdecl;external libzlib;
function inflateEnd(strm:Tz_streamp):longint;cdecl;external libzlib;
function deflateSetDictionary(strm:Tz_streamp; dictionary:PBytef; dictLength:TuInt):longint;cdecl;external libzlib;
function deflateGetDictionary(strm:Tz_streamp; dictionary:PBytef; dictLength:PuInt):longint;cdecl;external libzlib;
function deflateCopy(dest:Tz_streamp; source:Tz_streamp):longint;cdecl;external libzlib;
function deflateReset(strm:Tz_streamp):longint;cdecl;external libzlib;
function deflateParams(strm:Tz_streamp; level:longint; strategy:longint):longint;cdecl;external libzlib;
function deflateTune(strm:Tz_streamp; good_length:longint; max_lazy:longint; nice_length:longint; max_chain:longint):longint;cdecl;external libzlib;
function deflateBound(strm:Tz_streamp; sourceLen:TuLong):TuLong;cdecl;external libzlib;
function deflatePending(strm:Tz_streamp; pending:Pdword; bits:Plongint):longint;cdecl;external libzlib;
function deflatePrime(strm:Tz_streamp; bits:longint; value:longint):longint;cdecl;external libzlib;
function deflateSetHeader(strm:Tz_streamp; head:Tgz_headerp):longint;cdecl;external libzlib;
function inflateSetDictionary(strm:Tz_streamp; dictionary:PBytef; dictLength:TuInt):longint;cdecl;external libzlib;
function inflateGetDictionary(strm:Tz_streamp; dictionary:PBytef; dictLength:PuInt):longint;cdecl;external libzlib;
function inflateSync(strm:Tz_streamp):longint;cdecl;external libzlib;
function inflateCopy(dest:Tz_streamp; source:Tz_streamp):longint;cdecl;external libzlib;
function inflateReset(strm:Tz_streamp):longint;cdecl;external libzlib;
function inflateReset2(strm:Tz_streamp; windowBits:longint):longint;cdecl;external libzlib;
function inflatePrime(strm:Tz_streamp; bits:longint; value:longint):longint;cdecl;external libzlib;
function inflateMark(strm:Tz_streamp):longint;cdecl;external libzlib;
function inflateGetHeader(strm:Tz_streamp; head:Tgz_headerp):longint;cdecl;external libzlib;

type
  Tin_func = function (para1:pointer; para2:PPbyte):dword;cdecl;
  Tout_func = function (para1:pointer; para2:Pbyte; para3:dword):longint;cdecl;

function inflateBack(strm:Tz_streamp; in_:Tin_func; in_desc:pointer; out_:Tout_func; out_desc:pointer):longint;cdecl;external libzlib;
function inflateBackEnd(strm:Tz_streamp):longint;cdecl;external libzlib;
function zlibCompileFlags:TuLong;cdecl;external libzlib;
function compress(dest:PBytef; destLen:PuLongf; source:PBytef; sourceLen:TuLong):longint;cdecl;external libzlib;
function compress2(dest:PBytef; destLen:PuLongf; source:PBytef; sourceLen:TuLong; level:longint):longint;cdecl;external libzlib;
function compressBound(sourceLen:TuLong):TuLong;cdecl;external libzlib;
function uncompress(dest:PBytef; destLen:PuLongf; source:PBytef; sourceLen:TuLong):longint;cdecl;external libzlib;
function uncompress2(dest:PBytef; destLen:PuLongf; source:PBytef; sourceLen:PuLong):longint;cdecl;external libzlib;

type
  PgzFile_s = ^TgzFile_s;
  TgzFile_s = record
      have : dword;
      next : Pbyte;
      pos : Tz_off64_t;
  end;

  PgzFile = ^TgzFile;
  TgzFile = PgzFile_s;

function gzdopen(fd:longint; mode:Pchar):TgzFile;cdecl;external libzlib;
function gzbuffer(file_:TgzFile; size:dword):longint;cdecl;external libzlib;
function gzsetparams(file_:TgzFile; level:longint; strategy:longint):longint;cdecl;external libzlib;
function gzread(file_:TgzFile; buf:Tvoidp; len:dword):longint;cdecl;external libzlib;
function gzfread(buf:Tvoidp; size:Tz_size_t; nitems:Tz_size_t; file_:TgzFile):Tz_size_t;cdecl;external libzlib;
function gzwrite(file_:TgzFile; buf:Tvoidpc; len:dword):longint;cdecl;external libzlib;
function gzfwrite(buf:Tvoidpc; size:Tz_size_t; nitems:Tz_size_t; file_:TgzFile):Tz_size_t;cdecl;external libzlib;
function gzprintf(file_:TgzFile; format:Pchar):longint;cdecl;varargs;external libzlib;
function gzputs(file_:TgzFile; s:Pchar):longint;cdecl;external libzlib;
function gzgets(file_:TgzFile; buf:Pchar; len:longint):Pchar;cdecl;external libzlib;
function gzputc(file_:TgzFile; c:longint):longint;cdecl;external libzlib;
function gzgetc(file_:TgzFile):longint;cdecl;external libzlib;
function gzungetc(c:longint; file_:TgzFile):longint;cdecl;external libzlib;
function gzflush(file_:TgzFile; flush:longint):longint;cdecl;external libzlib;
function gzrewind(file_:TgzFile):longint;cdecl;external libzlib;
function gzeof(file_:TgzFile):longint;cdecl;external libzlib;
function gzdirect(file_:TgzFile):longint;cdecl;external libzlib;
function gzclose(file_:TgzFile):longint;cdecl;external libzlib;
function gzclose_r(file_:TgzFile):longint;cdecl;external libzlib;
function gzclose_w(file_:TgzFile):longint;cdecl;external libzlib;
function gzerror(file_:TgzFile; errnum:Plongint):Pchar;cdecl;external libzlib;
procedure gzclearerr(file_:TgzFile);cdecl;external libzlib;
function adler32(adler:TuLong; buf:PBytef; len:TuInt):TuLong;cdecl;external libzlib;
function adler32_z(adler:TuLong; buf:PBytef; len:Tz_size_t):TuLong;cdecl;external libzlib;
function crc32(crc:TuLong; buf:PBytef; len:TuInt):TuLong;cdecl;external libzlib;
function crc32_z(crc:TuLong; buf:PBytef; len:Tz_size_t):TuLong;cdecl;external libzlib;
function crc32_combine_op(crc1:TuLong; crc2:TuLong; op:TuLong):TuLong;cdecl;external libzlib;
function deflateInit_(strm:Tz_streamp; level:longint; version:Pchar; stream_size:longint):longint;cdecl;external libzlib;
function inflateInit_(strm:Tz_streamp; version:Pchar; stream_size:longint):longint;cdecl;external libzlib;
function deflateInit2_(strm:Tz_streamp; level:longint; method:longint; windowBits:longint; memLevel:longint; 
           strategy:longint; version:Pchar; stream_size:longint):longint;cdecl;external libzlib;
function inflateInit2_(strm:Tz_streamp; windowBits:longint; version:Pchar; stream_size:longint):longint;cdecl;external libzlib;
function inflateBackInit_(strm:Tz_streamp; windowBits:longint; window:Pbyte; version:Pchar; stream_size:longint):longint;cdecl;external libzlib;

function gzgetc_(file_:TgzFile):longint;cdecl;external libzlib;
{xxxxxx
#ifdef Z_PREFIX_SET
#  undef z_gzgetc
#  define z_gzgetc(g) \
          ((g)->have ? ((g)->have--, (g)->pos++, *((g)->next)++) : (gzgetc)(g))
#else
#  define gzgetc(g) \
          ((g)->have ? ((g)->have--, (g)->pos++, *((g)->next)++) : (gzgetc)(g))
#endif

  }
function gzopen64(para1:Pchar; para2:Pchar):TgzFile;cdecl;external libzlib;
function gzseek64(para1:TgzFile; para2:Tz_off64_t; para3:longint):Tz_off64_t;cdecl;external libzlib;
function gztell64(para1:TgzFile):Tz_off64_t;cdecl;external libzlib;
function gzoffset64(para1:TgzFile):Tz_off64_t;cdecl;external libzlib;
function adler32_combine64(para1:TuLong; para2:TuLong; para3:Tz_off64_t):TuLong;cdecl;external libzlib;
function crc32_combine64(para1:TuLong; para2:TuLong; para3:Tz_off64_t):TuLong;cdecl;external libzlib;
function crc32_combine_gen64(para1:Tz_off64_t):TuLong;cdecl;external libzlib;

function gzopen(para1:Pchar; para2:Pchar):TgzFile;cdecl;external libzlib;
function gzseek(para1:TgzFile; para2:Tz_off_t; para3:longint):Tz_off_t;cdecl;external libzlib;
function gztell(para1:TgzFile):Tz_off_t;cdecl;external libzlib;
function gzoffset(para1:TgzFile):Tz_off_t;cdecl;external libzlib;
function adler32_combine(para1:TuLong; para2:TuLong; para3:Tz_off_t):TuLong;cdecl;external libzlib;
function crc32_combine(para1:TuLong; para2:TuLong; para3:Tz_off_t):TuLong;cdecl;external libzlib;
function crc32_combine_gen(para1:Tz_off_t):TuLong;cdecl;external libzlib;


function zError(para1:longint):Pchar;cdecl;external libzlib;
function inflateSyncPoint(para1:Tz_streamp):longint;cdecl;external libzlib;
function get_crc_table:Pz_crc_t;cdecl;external libzlib;
function inflateUndermine(para1:Tz_streamp; para2:longint):longint;cdecl;external libzlib;
function inflateValidate(para1:Tz_streamp; para2:longint):longint;cdecl;external libzlib;
function inflateCodesUsed(para1:Tz_streamp):dword;cdecl;external libzlib;
function inflateResetKeep(para1:Tz_streamp):longint;cdecl;external libzlib;
function deflateResetKeep(para1:Tz_streamp):longint;cdecl;external libzlib;

function gzopen_w(path:Pwchar_t; mode:Pchar):TgzFile;cdecl;external libzlib;
function gzvprintf(file_:TgzFile; format:Pchar; va:Tva_list):longint;cdecl;external libzlib;

// === Konventiert am: 12-11-26 19:43:02 ===


implementation


end.
