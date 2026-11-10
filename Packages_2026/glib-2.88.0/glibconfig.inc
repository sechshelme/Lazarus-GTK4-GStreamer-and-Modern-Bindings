
{$IFDEF read_interface}

// ==== von gtypes.h
const
  G_LITTLE_ENDIAN = 1234;
  G_BIG_ENDIAN = 4321;
  G_PDP_ENDIAN = 3412;

type
  Tgchar = AnsiChar;
  Pgchar = ^Tgchar;
  PPgchar = ^Pgchar;
  PPPgchar = ^PPgchar;

  Tgshort = int16;
  Pgshort = ^Tgshort;

  Tgint = int32;
  Pgint = ^Tgint;
  PPgint = ^Pgint;

  Tgboolean = Boolean32;
  Pgboolean = ^Tgboolean;

  Tguchar = uint8;
  Pguchar = ^Tguchar;
  PPguchar = ^Pguchar;

  Tgushort = uint16;
  Pgushort = ^Tgushort;

  {$IFDEF CPU64}
    {$IFDEF Windows}
      Tglong = int32;
      Tgulong = int32;
    {$ELSE}
      Tglong = int64;
      Tgulong = int64;
    {$ENDIF}
  {$ELSE}
    Tglong = int32;
    Tgulong = int32;
  {$ENDIF}
  Pglong = ^Tglong;
  Pgulong = ^Tgulong;

  Tguint = uint32;
  Pguint = ^Tguint;
  PPguint = ^Pguint;

  Tgfloat = single;
  Pgfloat = ^Tgfloat;
  PPgfloat = ^Pgfloat;

  Tgdouble = double;
  Pgdouble = ^Tgdouble;

const
  gFalse = Tgboolean(0);
  gTrue = not gFalse;

type
  Tgpointer = pointer;
  Pgpointer = ^Tgpointer;

  PPgconstpointer = ^Pgconstpointer;
  Pgconstpointer = ^Tgconstpointer;
  Tgconstpointer = pointer;

// =====



const
  G_MINFLOAT = 1.1754943508222875e-38;
  G_MAXFLOAT = 3.4028234663852886e+38;
  G_MINDOUBLE = 2.2250738585072014e-308;
  G_MAXDOUBLE = 1.7976931348623157e+308;

  G_MAXSHORT = 32767;
  G_MINSHORT = -G_MAXSHORT - 1;
  G_MAXUSHORT = 2 * G_MAXSHORT + 1;

  G_MAXINT = 2147483647;
  G_MININT = -G_MAXINT - 1;
  G_MAXUINT = 4294967295;

  {$IFDEF CPU64}
  {$IFDEF Windows}
  G_MINLONG = G_MININT;
  G_MAXLONG = G_MAXINT;
  G_MAXULONG = G_MAXUINT;
  {$ELSE}
  G_MAXLONG = $7FFFFFFFFFFFFFFF;
  G_MINLONG = -G_MAXLONG - 1;
  G_MAXULONG = $FFFFFFFFFFFFFFFF;
  {$ENDIF}
  {$ELSE}
  G_MINLONG = G_MININT;
  G_MAXLONG = G_MAXINT;
  G_MAXULONG = G_MAXUINT;
  {$ENDIF}

type
  Tgint8 = int8;
  Pgint8 = ^Tgint8;

  Tguint8 = uint8;
  Pguint8 = ^Tguint8;
  PPguint8 = ^Pguint8;

  Tgint16 = int16;
  Pgint16 = ^int16;

  Tguint16 = uint16;
  Pguint16 = ^Tguint16;
  PPguint16 = ^Pguint16;

const
  G_GINT16_MODIFIER = 'h';
  G_GINT16_FORMAT = 'hi';
  G_GUINT16_FORMAT = 'hu';

type
  Tgint32 = int32;
  Pgint32 = ^int32;

  Tguint32 = uint32;
  Pguint32 = ^Tguint32;
  PPguint32 = ^Pguint32;

const
  G_GINT32_MODIFIER = '';
  G_GINT32_FORMAT = 'i';
  G_GUINT32_FORMAT = 'u';
  G_HAVE_GINT64 = 1;

type
  Tgint64 = int64;
  Pgint64 = ^Tgint64;

  Tguint64 = uint64;
  Pguint64 = ^Tguint64;

const
  {$IFDEF Linux}
  {$IFDEF CPU64}
  G_GINT64_MODIFIER = 'l';
  G_GINT64_FORMAT = 'li';
  G_GUINT64_FORMAT = 'lu';
  {$ELSE}
  G_GINT64_MODIFIER = 'll';
  G_GINT64_FORMAT = 'lli';
  G_GUINT64_FORMAT = 'llu';
  {$ENDIF}
  {$ENDIF}{$IFDEF Windows}
  G_GINT64_MODIFIER = 'll';
  G_GINT64_FORMAT = 'lli';
  G_GUINT64_FORMAT = 'llu';
  {$ENDIF}
  GLIB_SIZEOF_LONG = SizeOf(Tglong);
  GLIB_SIZEOF_SIZE_T = SizeOf(SizeUInt);
  GLIB_SIZEOF_SSIZE_T = SizeOf(SizeInt);
  GLIB_SIZEOF_VOID_P = SizeOf(PtrUInt);

type
  Tgssize = SizeInt;
  Pgssize = ^Tgssize;

  Tgsize = SizeUInt;
  Pgsize = ^Tgsize;

  // ==== von gtypes.h

const
  G_MAXINT8 = Tgint8($7f);
  G_MAXUINT8 = Tguint8($ff);
  G_MININT8 = Tgint8((-(G_MAXINT8)) - 1);

  G_MAXINT16 = Tgint16($7fff);
  G_MAXUINT16 = Tguint16($ffff);
  G_MININT16 = Tgint16((-(G_MAXINT16)) - 1);

  G_MAXINT32 = Tgint32($7fffffff);
  G_MAXUINT32 = Tguint32($ffffffff);
  G_MININT32 = Tgint32((-(G_MAXINT32)) - 1);

  G_MAXINT64 = $7fffffffffffffff;
  G_MAXUINT64 = $ffffffffffffffff;
  G_MININT64 = Tgint64(-G_MAXINT64 - 1);

// ====

const
  {$IFDEF Linux}
  G_GSIZE_MODIFIER = 'l';
  G_GSSIZE_MODIFIER = 'l';
  G_GSIZE_FORMAT = 'lu';
  G_GSSIZE_FORMAT = 'li';
  G_MAXSIZE = G_MAXULONG;
  G_MINSSIZE = G_MINLONG;
  G_MAXSSIZE = G_MAXLONG;
  {$ENDIF}
  {$IFDEF Windows}
  G_GSIZE_MODIFIER = 'll';
  G_GSSIZE_MODIFIER = 'll';
  G_GSIZE_FORMAT = 'llu';
  G_GSSIZE_FORMAT = 'lli';
  G_MAXSIZE = G_MAXUINT64;
  G_MINSSIZE = G_MININT64;
  G_MAXSSIZE = G_MAXINT64;
  {$ENDIF}

type
  Tgoffset = Tgint64;
  Pgoffset = ^Tgoffset;

const
  G_MINOFFSET = G_MININT64;
  G_MAXOFFSET = G_MAXINT64;

  G_GOFFSET_MODIFIER = G_GINT64_MODIFIER;
  G_GOFFSET_FORMAT = G_GINT64_FORMAT;

  G_POLLFD_FORMAT = '%d';

type
  Tgintptr = PtrInt;
  Pgintptr = ^Tgintptr;

  Tguintptr = PtrUInt;
  Pguintptr = ^Tguintptr;

const
  {$IFDEF Linux}
  G_GINTPTR_MODIFIER = 'l';
  G_GINTPTR_FORMAT = 'li';
  G_GUINTPTR_FORMAT = 'lu';
  {$ENDIF}
  {$IFDEF Windows}
  G_GINTPTR_MODIFIER = 'll';
  G_GINTPTR_FORMAT = 'lli';
  G_GUINTPTR_FORMAT = 'llu';
  {$ENDIF}

  GLIB_MAJOR_VERSION_ = 2;
  GLIB_MINOR_VERSION_ = 80;
  GLIB_MICRO_VERSION_ = 0;
//  G_VA_COPY = va_copy;
  G_VA_COPY_AS_ARRAY = 1;
  G_HAVE_ISO_VARARGS = 1;

const
  G_HAVE_GROWING_STACK = 0;

const
  G_HAVE_GNUC_VARARGS = 1;

  {$ifdef endian_little}
  G_BYTE_ORDER = G_LITTLE_ENDIAN;
  {$else}
  G_BYTE_ORDER = G_BIG_ENDIAN;
  {$endif}

  const
  GLIB_SYSDEF_POLLIN =1;
  GLIB_SYSDEF_POLLOUT =4;
  GLIB_SYSDEF_POLLPRI =2;
  GLIB_SYSDEF_POLLHUP =16;
  GLIB_SYSDEF_POLLERR =8;
  GLIB_SYSDEF_POLLNVAL =32;

const
  {$IFDEF Linux}
  G_MODULE_SUFFIX = 'so';
  {$ENDIF}
  {$IFDEF Windows}
  G_MODULE_SUFFIX = 'dll';
  {$ENDIF}

type
  {$IFDEF Windows}
    TGPid = Pointer;
  {$ELSE}
    TGPid = int32;
  {$ENDIF}
   PGPid = ^TGPid;

const
  {$IFDEF Linux}
  G_PID_FORMAT = 'i';
  GLIB_SYSDEF_AF_UNIX = 1;
  GLIB_SYSDEF_AF_INET = 2;
  GLIB_SYSDEF_AF_INET6 = 10;
  GLIB_SYSDEF_MSG_OOB = 1;
  GLIB_SYSDEF_MSG_PEEK = 2;
  GLIB_SYSDEF_MSG_DONTROUTE = 4;
  G_DIR_SEPARATOR = '/';
  G_DIR_SEPARATOR_S = '/';
  G_SEARCHPATH_SEPARATOR = ':';
  G_SEARCHPATH_SEPARATOR_S = ':';
  {$ENDIF}
  {$IFDEF Windows}
  G_PID_FORMAT = 'p';
  GLIB_SYSDEF_AF_UNIX = 1;
  GLIB_SYSDEF_AF_INET = 2;
  GLIB_SYSDEF_AF_INET6 = 23;
  GLIB_SYSDEF_MSG_OOB = 1;
  GLIB_SYSDEF_MSG_PEEK = 2;
  GLIB_SYSDEF_MSG_DONTROUTE = 4;
  G_DIR_SEPARATOR = '\\';
  G_DIR_SEPARATOR_S = '\\';
  G_SEARCHPATH_SEPARATOR = ';';
  G_SEARCHPATH_SEPARATOR_S = ';';
  {$ENDIF}


  function G_GINT64_CONSTANT(val: Tgint64): Tgint64;
  function G_GUINT64_CONSTANT(val: Tguint64): Tguint64;
  function G_GOFFSET_CONSTANT(val: Tgint64): Tgint64;

  function GPOINTER_TO_INT(p: Tgpointer): Tgint;
  function GPOINTER_TO_UINT(p: Tgpointer): Tguint;
  function GINT_TO_POINTER(i: Tgint): Tgpointer;
  function GUINT_TO_POINTER(u: Tguint): Tgpointer;

  function GINT16_TO_LE(val: Tgint16): Tgint16;
  function GUINT16_TO_LE(val: Tguint16): Tguint16;
  function GINT16_TO_BE(val: Tgint16): Tgint16;
  function GUINT16_TO_BE(val: Tguint16): Tguint16;

  function GINT32_TO_LE(val: Tgint32): Tgint32;
  function GUINT32_TO_LE(val: Tguint32): Tguint32;
  function GINT32_TO_BE(val: Tgint32): Tgint32;
  function GUINT32_TO_BE(val: Tguint32): Tguint32;

  function GINT64_TO_LE(val: Tgint64): Tgint64;
  function GUINT64_TO_LE(val: Tguint64): Tguint64;
  function GINT64_TO_BE(val: Tgint64): Tgint64;
  function GUINT64_TO_BE(val: Tguint64): Tguint64;

  function GLONG_TO_LE(val: Tglong): Tglong;
  function GULONG_TO_LE(val: Tgulong): Tgulong;
  function GLONG_TO_BE(val: Tglong): Tglong;
  function GULONG_TO_BE(val: Tgulong): Tgulong;

  function GINT_TO_LE(val: Tgint): Tgint;
  function GUINT_TO_LE(val: Tguint): Tguint;
  function GINT_TO_BE(val: Tgint): Tgint;
  function GUINT_TO_BE(val: Tguint): Tguint;

  function GSIZE_TO_LE(val: Tgsize): Tgsize;
  function GSSIZE_TO_LE(val: Tgssize): Tgssize;
  function GSIZE_TO_BE(val: Tgsize): Tgsize;
  function GSSIZE_TO_BE(val: Tgssize): Tgssize;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_GINT64_CONSTANT(val: Tgint64): Tgint64;
begin
  Result := val;
end;

function G_GUINT64_CONSTANT(val: Tguint64): Tguint64;
begin
  Result := val;
end;

function G_GOFFSET_CONSTANT(val: Tgint64): Tgint64;
begin
  Result := val;
end;

function GPOINTER_TO_INT(p: Tgpointer): Tgint;
begin
  Result := Tgint(PtrInt(p));
end;

function GPOINTER_TO_UINT(p: Tgpointer): Tguint;
begin
  Result := Tguint(PtrUInt(p));
end;

function GINT_TO_POINTER(i: Tgint): Tgpointer;
begin
  Result := Tgpointer(PtrInt(i));
end;

function GUINT_TO_POINTER(u: Tguint): Tgpointer;
begin
  Result := Tgpointer(PtrUInt(u));
end;

function GINT16_TO_LE(val: Tgint16): Tgint16;
begin
  {$IFDEF ENDIAN_LITTLE}
  Result := val;
  {$ELSE}
  Result := SwapEndian(val);
  {$ENDIF}
end;

function GUINT16_TO_LE(val: Tguint16): Tguint16;
begin
  {$IFDEF ENDIAN_LITTLE}
  Result := val;
  {$ELSE}
  Result := SwapEndian(val);
  {$ENDIF}
end;

function GINT16_TO_BE(val: Tgint16): Tgint16;
begin
  {$IFDEF ENDIAN_LITTLE}
  Result := SwapEndian(val);
  {$ELSE}
  Result := val;
  {$ENDIF}
end;

function GUINT16_TO_BE(val: Tguint16): Tguint16;
begin
  {$IFDEF ENDIAN_LITTLE}
  Result := SwapEndian(val);
  {$ELSE}
  Result := val;
  {$ENDIF}
end;

function GINT32_TO_LE(val: Tgint32): Tgint32;
begin
  {$IFDEF ENDIAN_LITTLE}
  Result := val;
  {$ELSE}
  Result := SwapEndian(val);
  {$ENDIF}
end;

function GUINT32_TO_LE(val: Tguint32): Tguint32;
begin
  {$IFDEF ENDIAN_LITTLE}
  Result := val;
  {$ELSE}
  Result := SwapEndian(val);
  {$ENDIF}
end;

function GINT32_TO_BE(val: Tgint32): Tgint32;
begin
  {$IFDEF ENDIAN_LITTLE}
  Result := SwapEndian(val);
  {$ELSE}
  Result := val;
  {$ENDIF}
end;

function GUINT32_TO_BE(val: Tguint32): Tguint32;
begin
  {$IFDEF ENDIAN_LITTLE}
  Result := SwapEndian(val);
  {$ELSE}
  Result := val;
  {$ENDIF}
end;

function GINT64_TO_LE(val: Tgint64): Tgint64;
begin
  {$IFDEF ENDIAN_LITTLE}
  Result := val;
  {$ELSE}
  Result := SwapEndian(val);
  {$ENDIF}
end;

function GUINT64_TO_LE(val: Tguint64): Tguint64;
begin
  {$IFDEF ENDIAN_LITTLE}
  Result := val;
  {$ELSE}
  Result := SwapEndian(val);
  {$ENDIF}
end;

function GINT64_TO_BE(val: Tgint64): Tgint64;
begin
  {$IFDEF ENDIAN_LITTLE}
  Result := SwapEndian(val);
  {$ELSE}
  Result := val;
  {$ENDIF}
end;

function GUINT64_TO_BE(val: Tguint64): Tguint64;
begin
  {$IFDEF ENDIAN_LITTLE}
  Result := SwapEndian(val);
  {$ELSE}
  Result := val;
  {$ENDIF}
end;

function GLONG_TO_LE(val: Tglong): Tglong;
begin
  {$IFDEF ENDIAN_LITTLE}
  Result := val;
  {$ELSE}
  Result := SwapEndian(val);
  {$ENDIF}
end;

function GULONG_TO_LE(val: Tgulong): Tgulong;
begin
  {$IFDEF ENDIAN_LITTLE}
  Result := val;
  {$ELSE}
  Result := SwapEndian(val);
  {$ENDIF}
end;

function GLONG_TO_BE(val: Tglong): Tglong;
begin
  {$IFDEF ENDIAN_LITTLE}
  Result := SwapEndian(val);
  {$ELSE}
  Result := val;
  {$ENDIF}
end;

function GULONG_TO_BE(val: Tgulong): Tgulong;
begin
  {$IFDEF ENDIAN_LITTLE}
  Result := SwapEndian(val);
  {$ELSE}
  Result := val;
  {$ENDIF}
end;

function GINT_TO_LE(val: Tgint): Tgint;
begin
  {$IFDEF ENDIAN_LITTLE}
  Result := val;
  {$ELSE}
  Result := SwapEndian(val);
  {$ENDIF}
end;

function GUINT_TO_LE(val: Tguint): Tguint;
begin
  {$IFDEF ENDIAN_LITTLE}
  Result := val;
  {$ELSE}
  Result := SwapEndian(val);
  {$ENDIF}
end;

function GINT_TO_BE(val: Tgint): Tgint;
begin
  {$IFDEF ENDIAN_LITTLE}
  Result := SwapEndian(val);
  {$ELSE}
  Result := val;
  {$ENDIF}
end;

function GUINT_TO_BE(val: Tguint): Tguint;
begin
  {$IFDEF ENDIAN_LITTLE}
  Result := SwapEndian(val);
  {$ELSE}
  Result := val;
  {$ENDIF}
end;

function GSIZE_TO_LE(val: Tgsize): Tgsize;
begin
  {$IFDEF ENDIAN_LITTLE}
  Result := val;
  {$ELSE}
  Result := SwapEndian(val);
  {$ENDIF}
end;

function GSSIZE_TO_LE(val: Tgssize): Tgssize;
begin
  {$IFDEF ENDIAN_LITTLE}
  Result := val;
  {$ELSE}
  Result := SwapEndian(val);
  {$ENDIF}
end;

function GSIZE_TO_BE(val: Tgsize): Tgsize;
begin
  {$IFDEF ENDIAN_LITTLE}
  Result := SwapEndian(val);
  {$ELSE}
  Result := val;
  {$ENDIF}
end;

function GSSIZE_TO_BE(val: Tgssize): Tgssize;
begin
  {$IFDEF ENDIAN_LITTLE}
  Result := SwapEndian(val);
  {$ELSE}
  Result := val;
  {$ENDIF}
end;


{$ENDIF read_implementation}
