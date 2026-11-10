
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

  {$IFDEF Linux}
  Tglong = int64;
  Tgulong = int64;
  {$ENDIF}
  {$IFDEF Windows}
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
  PPgdouble = ^Pgdouble;

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



//const
//  G_MINFLOAT = FLT_MIN;
//  G_MAXFLOAT = FLT_MAX;
//  G_MINDOUBLE = DBL_MIN;
//  G_MAXDOUBLE = DBL_MAX;
//  G_MINSHORT = SHRT_MIN;
//  G_MAXSHORT = SHRT_MAX;
//  G_MAXUSHORT = USHRT_MAX;
//  G_MININT = INT_MIN;
//  G_MAXINT = INT_MAX;
//  G_MAXUINT = UINT_MAX;
//  G_MINLONG = LONG_MIN;
//  G_MAXLONG = LONG_MAX;
//  G_MAXULONG = ULONG_MAX;

const
  G_MINFLOAT = 5.0e-324;
  G_MAXFLOAT = 1.7e308;
  G_MINDOUBLE = G_MINFLOAT;
  G_MAXDOUBLE = G_MAXFLOAT;
  G_MAXSHORT = 32767;
  G_MINSHORT = -G_MAXSHORT - 1;
  G_MAXUSHORT = 2 * G_MAXSHORT + 1;
  G_MAXINT = 2147483647;
  G_MININT = -G_MAXINT - 1;
  G_MAXUINT = 4294967295;
  G_MINLONG = G_MININT;
  G_MAXLONG = G_MAXINT;
  G_MAXULONG = G_MAXUINT;


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
  G_GINT64_MODIFIER = 'l';
  G_GINT64_FORMAT = 'li';
  G_GUINT64_FORMAT = 'lu';

  GLIB_SIZEOF_VOID_P = 8;
  GLIB_SIZEOF_LONG = 8;
  GLIB_SIZEOF_SIZE_T = 8;
  GLIB_SIZEOF_SSIZE_T = 8;
  {$ENDIF}
  {$IFDEF Windows}
  G_GINT64_MODIFIER = 'll';
  G_GINT64_FORMAT = 'lli';
  G_GUINT64_FORMAT = 'llu';

  GLIB_SIZEOF_VOID_P = 8;
  GLIB_SIZEOF_LONG = 4;
  GLIB_SIZEOF_SIZE_T = 8;
  GLIB_SIZEOF_SSIZE_T = 8;
  {$ENDIF}

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
  TGPid = Int32;
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

  function GPOINTER_TO_INT(p: Tgpointer): Tgint64;
  function GPOINTER_TO_UINT(p: Tgpointer): Tguint64;
  function GINT_TO_POINTER(i: Tgint64): Tgpointer;
  function GUINT_TO_POINTER(u: Tguint64): Tgpointer;

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
  function GSSIZE_TO_LE(val: Tgsize): Tgssize;
  function GSIZE_TO_BE(val: Tgsize): Tgsize;
  function GSSIZE_TO_BE(val: Tgsize): Tgssize;

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
  G_GOFFSET_CONSTANT := G_GINT64_CONSTANT(val);
end;

function GPOINTER_TO_INT(p: Tgpointer): Tgint64;
begin
  GPOINTER_TO_INT := Tgint64(p);
end;

function GPOINTER_TO_UINT(p: Tgpointer): Tguint64;
begin
  GPOINTER_TO_UINT := Tguint64(p);
end;

function GINT_TO_POINTER(i: Tgint64): Tgpointer;
begin
  GINT_TO_POINTER := Tgpointer(i);
end;

function GUINT_TO_POINTER(u: Tguint64): Tgpointer;
begin
  GUINT_TO_POINTER := Tgpointer(u);
end;

function GINT16_TO_LE(val: Tgint16): Tgint16;
begin
  GINT16_TO_LE := Tgint16(val);
end;

function GUINT16_TO_LE(val: Tguint16): Tguint16;
begin
  GUINT16_TO_LE := Tguint16(val);
end;

function GINT16_TO_BE(val: Tgint16): Tgint16;
begin
  GINT16_TO_BE := Tgint16(GUINT16_SWAP_LE_BE(val));
end;

function GUINT16_TO_BE(val: Tguint16): Tguint16;
begin
  GUINT16_TO_BE := GUINT16_SWAP_LE_BE(val);
end;

function GINT32_TO_LE(val: Tgint32): Tgint32;
begin
  GINT32_TO_LE := Tgint32(val);
end;

function GUINT32_TO_LE(val: Tguint32): Tguint32;
begin
  GUINT32_TO_LE := Tguint32(val);
end;

function GINT32_TO_BE(val: Tgint32): Tgint32;
begin
  GINT32_TO_BE := Tgint32(GUINT32_SWAP_LE_BE(val));
end;

function GUINT32_TO_BE(val: Tguint32): Tguint32;
begin
  GUINT32_TO_BE := GUINT32_SWAP_LE_BE(val);
end;

function GINT64_TO_LE(val: Tgint64): Tgint64;
begin
  GINT64_TO_LE := Tgint64(val);
end;

function GUINT64_TO_LE(val: Tguint64): Tguint64;
begin
  GUINT64_TO_LE := Tguint64(val);
end;

function GINT64_TO_BE(val: Tgint64): Tgint64;
begin
  GINT64_TO_BE := Tgint64(GUINT64_SWAP_LE_BE(val));
end;

function GUINT64_TO_BE(val: Tguint64): Tguint64;
begin
  GUINT64_TO_BE := GUINT64_SWAP_LE_BE(val);
end;

function GLONG_TO_LE(val: Tglong): Tglong;
begin
  GLONG_TO_LE := Tglong(GINT64_TO_LE(val));
end;

function GULONG_TO_LE(val: Tgulong): Tgulong;
begin
  GULONG_TO_LE := Tgulong(GUINT64_TO_LE(val));
end;

function GLONG_TO_BE(val: Tglong): Tglong;
begin
  GLONG_TO_BE := Tglong(GINT64_TO_BE(val));
end;

function GULONG_TO_BE(val: Tgulong): Tgulong;
begin
  GULONG_TO_BE := Tgulong(GUINT64_TO_BE(val));
end;

function GINT_TO_LE(val: Tgint): Tgint;
begin
  GINT_TO_LE := Tgint(GINT32_TO_LE(val));
end;

function GUINT_TO_LE(val: Tguint): Tguint;
begin
  GUINT_TO_LE := Tguint(GUINT32_TO_LE(val));
end;

function GINT_TO_BE(val: Tgint): Tgint;
begin
  GINT_TO_BE := Tgint(GINT32_TO_BE(val));
end;

function GUINT_TO_BE(val: Tguint): Tguint;
begin
  GUINT_TO_BE := Tguint(GUINT32_TO_BE(val));
end;

function GSIZE_TO_LE(val: Tgsize): Tgsize;
begin
  GSIZE_TO_LE := Tgsize(GUINT64_TO_LE(val));
end;

function GSSIZE_TO_LE(val: Tgsize): Tgssize;
begin
  GSSIZE_TO_LE := Tgssize(GINT64_TO_LE(val));
end;

function GSIZE_TO_BE(val: Tgsize): Tgsize;
begin
  GSIZE_TO_BE := Tgsize(GUINT64_TO_BE(val));
end;

function GSSIZE_TO_BE(val: Tgsize): Tgssize;
begin
  GSSIZE_TO_BE := Tgssize(GINT64_TO_BE(val));
end;


{$ENDIF read_implementation}
