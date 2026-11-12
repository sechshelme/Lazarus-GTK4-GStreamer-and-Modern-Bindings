
unit zconf;
interface

{
  Automatically converted by H2Pas 1.0.0 from zconf.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    zconf.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PByte  = ^Byte;
PBytef  = ^Bytef;
Pcharf  = ^charf;
Pintf  = ^intf;
PuInt  = ^uInt;
PuIntf  = ^uIntf;
PuLong  = ^uLong;
PuLongf  = ^uLongf;
Pvoidp  = ^voidp;
Pvoidpc  = ^voidpc;
Pvoidpf  = ^voidpf;
Pz_crc_t  = ^z_crc_t;
Pz_size_t  = ^z_size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ zconf.h -- configuration of the zlib compression library
 * Copyright (C) 1995-2016 Jean-loup Gailly, Mark Adler
 * For conditions of distribution and use, see copyright notice in zlib.h
  }
{ @(#) $Id$  }
{$ifndef ZCONF_H}
{$define ZCONF_H}
{
 * If you *really* need a unique prefix for all types and library functions,
 * compile with -DZ_PREFIX. The "standard" zlib should be compiled without it.
 * Even better than compiling with -DZ_PREFIX would be to use configure to set
 * this permanently in zconf.h using "./configure --zprefix".
  }
{$ifdef Z_PREFIX     /* may be set to #if 1 by ./configure */}
{$define Z_PREFIX_SET}
{ all linked symbols and init macros  }

const
  _dist_code = z__dist_code;  
  _length_code = z__length_code;  
  _tr_align = z__tr_align;  
  _tr_flush_bits = z__tr_flush_bits;  
  _tr_flush_block = z__tr_flush_block;  
  _tr_init = z__tr_init;  
  _tr_stored_block = z__tr_stored_block;  
  _tr_tally = z__tr_tally;  
  adler32 = z_adler32;  
  adler32_combine = z_adler32_combine;  
  adler32_combine64 = z_adler32_combine64;  
  adler32_z = z_adler32_z;  
{$ifndef Z_SOLO}

const
  compress = z_compress;  
  compress2 = z_compress2;  
  compressBound = z_compressBound;  
{$endif}

const
  crc32 = z_crc32;  
  crc32_combine = z_crc32_combine;  
  crc32_combine64 = z_crc32_combine64;  
  crc32_combine_gen = z_crc32_combine_gen;  
  crc32_combine_gen64 = z_crc32_combine_gen64;  
  crc32_combine_op = z_crc32_combine_op;  
  crc32_z = z_crc32_z;  
  deflate = z_deflate;  
  deflateBound = z_deflateBound;  
  deflateCopy = z_deflateCopy;  
  deflateEnd = z_deflateEnd;  
  deflateGetDictionary = z_deflateGetDictionary;  
  deflateInit = z_deflateInit;  
  deflateInit2 = z_deflateInit2;  
  deflateInit2_ = z_deflateInit2_;  
  deflateInit_ = z_deflateInit_;  
  deflateParams = z_deflateParams;  
  deflatePending = z_deflatePending;  
  deflatePrime = z_deflatePrime;  
  deflateReset = z_deflateReset;  
  deflateResetKeep = z_deflateResetKeep;  
  deflateSetDictionary = z_deflateSetDictionary;  
  deflateSetHeader = z_deflateSetHeader;  
  deflateTune = z_deflateTune;  
  deflate_copyright = z_deflate_copyright;  
  get_crc_table = z_get_crc_table;  
{$ifndef Z_SOLO}

const
  gz_error = z_gz_error;  
  gz_intmax = z_gz_intmax;  
  gz_strwinerror = z_gz_strwinerror;  
  gzbuffer = z_gzbuffer;  
  gzclearerr = z_gzclearerr;  
  gzclose = z_gzclose;  
  gzclose_r = z_gzclose_r;  
  gzclose_w = z_gzclose_w;  
  gzdirect = z_gzdirect;  
  gzdopen = z_gzdopen;  
  gzeof = z_gzeof;  
  gzerror = z_gzerror;  
  gzflush = z_gzflush;  
  gzfread = z_gzfread;  
  gzfwrite = z_gzfwrite;  
  gzgetc = z_gzgetc;  
  gzgetc_ = z_gzgetc_;  
  gzgets = z_gzgets;  
  gzoffset = z_gzoffset;  
  gzoffset64 = z_gzoffset64;  
  gzopen = z_gzopen;  
  gzopen64 = z_gzopen64;  
{$ifdef _WIN32}

const
  gzopen_w = z_gzopen_w;  
{$endif}

const
  gzprintf = z_gzprintf;  
  gzputc = z_gzputc;  
  gzputs = z_gzputs;  
  gzread = z_gzread;  
  gzrewind = z_gzrewind;  
  gzseek = z_gzseek;  
  gzseek64 = z_gzseek64;  
  gzsetparams = z_gzsetparams;  
  gztell = z_gztell;  
  gztell64 = z_gztell64;  
  gzungetc = z_gzungetc;  
  gzvprintf = z_gzvprintf;  
  gzwrite = z_gzwrite;  
{$endif}

const
  inflate = z_inflate;  
  inflateBack = z_inflateBack;  
  inflateBackEnd = z_inflateBackEnd;  
  inflateBackInit = z_inflateBackInit;  
  inflateBackInit_ = z_inflateBackInit_;  
  inflateCodesUsed = z_inflateCodesUsed;  
  inflateCopy = z_inflateCopy;  
  inflateEnd = z_inflateEnd;  
  inflateGetDictionary = z_inflateGetDictionary;  
  inflateGetHeader = z_inflateGetHeader;  
  inflateInit = z_inflateInit;  
  inflateInit2 = z_inflateInit2;  
  inflateInit2_ = z_inflateInit2_;  
  inflateInit_ = z_inflateInit_;  
  inflateMark = z_inflateMark;  
  inflatePrime = z_inflatePrime;  
  inflateReset = z_inflateReset;  
  inflateReset2 = z_inflateReset2;  
  inflateResetKeep = z_inflateResetKeep;  
  inflateSetDictionary = z_inflateSetDictionary;  
  inflateSync = z_inflateSync;  
  inflateSyncPoint = z_inflateSyncPoint;  
  inflateUndermine = z_inflateUndermine;  
  inflateValidate = z_inflateValidate;  
  inflate_copyright = z_inflate_copyright;  
  inflate_fast = z_inflate_fast;  
  inflate_table = z_inflate_table;  
{$ifndef Z_SOLO}

const
  uncompress = z_uncompress;  
  uncompress2 = z_uncompress2;  
{$endif}

const
  zError = z_zError;  
{$ifndef Z_SOLO}

const
  zcalloc = z_zcalloc;  
  zcfree = z_zcfree;  
{$endif}

const
  zlibCompileFlags = z_zlibCompileFlags;  
  zlibVersion = z_zlibVersion;  
{ all zlib typedefs in zlib.h and zconf.h  }
  Byte = z_Byte;  
  Bytef = z_Bytef;  
  alloc_func = z_alloc_func;  
  charf = z_charf;  
  free_func = z_free_func;  
{$ifndef Z_SOLO}

const
  gzFile = z_gzFile;  
{$endif}

const
  gz_header = z_gz_header;  
  gz_headerp = z_gz_headerp;  
  in_func = z_in_func;  
  intf = z_intf;  
  out_func = z_out_func;  
  uInt = z_uInt;  
  uIntf = z_uIntf;  
  uLong = z_uLong;  
  uLongf = z_uLongf;  
  voidp = z_voidp;  
  voidpc = z_voidpc;  
  voidpf = z_voidpf;  
{ all zlib structs in zlib.h and zconf.h  }
  gz_header_s = z_gz_header_s;  
  internal_state = z_internal_state;  
{$endif}
{$if defined(__MSDOS__) && !defined(MSDOS)}
{$define MSDOS}
{$endif}
{$if (defined(OS_2) || defined(__OS2__)) && !defined(OS2)}
{$define OS2}
{$endif}
{$if defined(_WINDOWS) && !defined(WINDOWS)}
{$define WINDOWS}
{$endif}
{$if defined(_WIN32) || defined(_WIN32_WCE) || defined(__WIN32__)}
{$ifndef WIN32}
{$define WIN32}
{$endif}
{$endif}
{$if (defined(MSDOS) || defined(OS2) || defined(WINDOWS)) && !defined(WIN32)}
{$if !defined(__GNUC__) && !defined(__FLAT__) && !defined(__386__)}
{$ifndef SYS16BIT}
{$define SYS16BIT}
{$endif}
{$endif}
{$endif}
{
 * Compile with -DMAXSEG_64K if the alloc function cannot allocate more
 * than 64k bytes at a time (needed on systems with 16-bit int).
  }
{$ifdef Z_SOLO}
{$ifdef _WIN64}
type
  Pz_size_t = ^Tz_size_t;
  Tz_size_t = qword;
{$else}
type
  Pz_size_t = ^Tz_size_t;
  Tz_size_t = dword;
{$endif}
{$else}

const
  z_longlong = int64;  
{$if defined(NO_SIZE_T)}
type
  Pz_size_t = ^Tz_size_t;
  Tz_size_t = dword;
(*** was #elif ****){$else defined(STDC)}
{$include <stddef.h>}
type
  Pz_size_t = ^Tz_size_t;
  Tz_size_t = Tsize_t;
{$else}
type
  Pz_size_t = ^Tz_size_t;
  Tz_size_t = dword;
{$endif}
{$undef z_longlong}
{$endif}
{ Maximum value for memLevel in deflateInit2  }
{$ifndef MAX_MEM_LEVEL}
{$ifdef MAXSEG_64K}

const
  MAX_MEM_LEVEL = 8;  
{$else}

const
  MAX_MEM_LEVEL = 9;  
{$endif}
{$endif}
{ Maximum value for windowBits in deflateInit2 and inflateInit2.
 * WARNING: reducing MAX_WBITS makes minigzip unable to extract .gz files
 * created by gzip. (Files created by minigzip can still be extracted by
 * gzip.)
  }
{$ifndef MAX_WBITS}
{ 32K LZ77 window  }

const
  MAX_WBITS = 15;  
{$endif}
{ The memory requirements for deflate are (in bytes):
            (1 << (windowBits+2)) +  (1 << (memLevel+9))
 that is: 128K for windowBits=15  +  128K for memLevel = 8  (default values)
 plus a few kilobytes for small objects. For example, if you want to reduce
 the default memory requirements from 256K to 128K, compile with
     make CFLAGS="-O -DMAX_WBITS=14 -DMAX_MEM_LEVEL=7"
 Of course this will generally degrade compression (there's no free lunch).

   The memory requirements for inflate are (in bytes) 1 << windowBits
 that is, 32K for windowBits=15 (default value) plus about 7 kilobytes
 for small objects.
 }
{ Type declarations  }
{$if !defined(__MACTYPES__)}
type
  PByte = ^TByte;
  TByte = byte;
{ 8 bits  }
{$endif}
type
  PuInt = ^TuInt;
  TuInt = dword;
{ 16 bits or more  }

  PuLong = ^TuLong;
  TuLong = dword;
{ 32 bits or more  }

  PBytef = ^TBytef;
  TBytef = TByte;

  Pcharf = ^Tcharf;
  Tcharf = char;

  Pintf = ^Tintf;
  Tintf = longint;

  PuIntf = ^TuIntf;
  TuIntf = TuInt;

  PuLongf = ^TuLongf;
  TuLongf = TuLong;
{$ifdef STDC}
(* Const before declarator ignored *)

  Pvoidpc = ^Tvoidpc;
  Tvoidpc = pointer;

  Pvoidpf = ^Tvoidpf;
  Tvoidpf = pointer;

  Pvoidp = ^Tvoidp;
  Tvoidp = pointer;
{$else}
(* Const before declarator ignored *)
type
  Pvoidpc = ^Tvoidpc;
  Tvoidpc = PByte;

  Pvoidpf = ^Tvoidpf;
  Tvoidpf = PByte;

  Pvoidp = ^Tvoidp;
  Tvoidp = PByte;
{$endif}
{$ifdef Z_U4}
type
  Pz_crc_t = ^Tz_crc_t;
  Tz_crc_t = TZ_U4;
{$else}
type
  Pz_crc_t = ^Tz_crc_t;
  Tz_crc_t = dword;
{$endif}
{$if 1    /* was set to #if 1 by ./configure */}
{$define Z_HAVE_UNISTD_H}
{$endif}
{$if 1    /* was set to #if 1 by ./configure */}
{$define Z_HAVE_STDARG_H}
{$endif}
{$ifdef STDC}
{$ifndef Z_SOLO}
{$include <sys/types.h>      /* for off_t */}
{$endif}
{$endif}
{$if defined(STDC) || defined(Z_HAVE_STDARG_H)}
{$ifndef Z_SOLO}
{$include <stdarg.h>         /* for va_list */}
{$endif}
{$endif}
{$ifdef _WIN32}
{$ifndef Z_SOLO}
{$include <stddef.h>         /* for wchar_t */}
{$endif}
{$endif}
{ a little trick to accommodate both "#define _LARGEFILE64_SOURCE" and
 * "#define _LARGEFILE64_SOURCE 1" as requesting 64-bit operations, (even
 * though the former does not conform to the LFS document), but considering
 * both "#undef _LARGEFILE64_SOURCE" and "#define _LARGEFILE64_SOURCE 0" as
 * equivalently requesting no 64-bit operations
  }
{$if defined(_LARGEFILE64_SOURCE) && -_LARGEFILE64_SOURCE - -1 == 1}
{$undef _LARGEFILE64_SOURCE}
{$endif}
{$ifndef Z_HAVE_UNISTD_H}
{$ifdef __WATCOMC__}
{$define Z_HAVE_UNISTD_H}
{$endif}
{$endif}
{$ifndef Z_HAVE_UNISTD_H}
{$if defined(_LARGEFILE64_SOURCE) && !defined(_WIN32)}
{$define Z_HAVE_UNISTD_H}
{$endif}
{$endif}
{$ifndef Z_SOLO}
{$if defined(Z_HAVE_UNISTD_H)}
{$include <unistd.h>         /* for SEEK_*, off_t, and _LFS64_LARGEFILE */}
{$ifdef VMS}
{$include <unixio.h>       /* for off_t */}
{$endif}
{$ifndef z_off_t}

const
  z_off_t = off_t;  
{$endif}
{$endif}
{$endif}
{$if defined(_LFS64_LARGEFILE) && _LFS64_LARGEFILE-0}
{$define Z_LFS64}
{$endif}
{$if defined(_LARGEFILE64_SOURCE) && defined(Z_LFS64)}
{$define Z_LARGE64}
{$endif}
{$if defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS-0 == 64 && defined(Z_LFS64)}
{$define Z_WANT64}
{$endif}
{$if !defined(SEEK_SET) && !defined(Z_SOLO)}
{ Seek from beginning of file.   }

const
  SEEK_SET = 0;  
{ Seek from current position.   }
  SEEK_CUR = 1;  
{ Set file pointer to EOF plus "offset"  }
  SEEK_END = 2;  
{$endif}
{$ifndef z_off_t}

const
  z_off_t = longint;  
{$endif}
{$if !defined(_WIN32) && defined(Z_LARGE64)}

const
  z_off64_t = off64_t;  
{$else}
{$if defined(_WIN32) && !defined(__GNUC__)}

const
  z_off64_t = int64;  
{$else}

const
  z_off64_t = z_off_t;  
{$endif}
{$endif}
{ MVS linker does not support external names larger than 8 bytes  }
{$if defined(__MVS__)}
(** unsupported pragma#pragma map(deflateInit_,"DEIN")*)
(** unsupported pragma#pragma map(deflateInit2_,"DEIN2")*)
(** unsupported pragma#pragma map(deflateEnd,"DEEND")*)
(** unsupported pragma#pragma map(deflateBound,"DEBND")*)
(** unsupported pragma#pragma map(inflateInit_,"ININ")*)
(** unsupported pragma#pragma map(inflateInit2_,"ININ2")*)
(** unsupported pragma#pragma map(inflateEnd,"INEND")*)
(** unsupported pragma#pragma map(inflateSync,"INSY")*)
(** unsupported pragma#pragma map(inflateSetDictionary,"INSEDI")*)
(** unsupported pragma#pragma map(compressBound,"CMBND")*)
(** unsupported pragma#pragma map(inflate_table,"INTABL")*)
(** unsupported pragma#pragma map(inflate_fast,"INFA")*)
(** unsupported pragma#pragma map(inflate_copyright,"INCOPY")*)
{$endif}
{$endif}
{ ZCONF_H  }

implementation


end.
