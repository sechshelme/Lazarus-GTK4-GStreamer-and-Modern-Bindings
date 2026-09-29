
unit znzlib;
interface

{
  Automatically converted by H2Pas 1.0.0 from znzlib.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    znzlib.h
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
Pchar  = ^char;
PFILE  = ^FILE;
PznzFile  = ^znzFile;
Pznzptr  = ^znzptr;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ZNZLIB_H_}
{$define _ZNZLIB_H_}
{
znzlib.h  (zipped or non-zipped library)

*****            This code is released to the public domain.            *****

*****  Author: Mark Jenkinson, FMRIB Centre, University of Oxford       *****
*****  Date:   September 2004                                           *****

*****  Neither the FMRIB Centre, the University of Oxford, nor any of   *****
*****  its employees imply any warranty of usefulness of this software  *****
*****  for any purpose, and do not assume any liability for damages,    *****
*****  incidental or otherwise, caused by any use of this document.     *****

 }
{

This library provides an interface to both compressed (gzip/zlib) and
uncompressed (normal) file IO.  The functions are written to have the
same interface as the standard file IO functions.

To use this library instead of normal file IO, the following changes
are required:
 - replace all instances of FILE* with znzFile
 - change the name of all function calls, replacing the initial character
   f with the znz  (e.g. fseek becomes znzseek)
 - add a third parameter to all calls to znzopen (previously fopen)
   that specifies whether to use compression (1) or not (0)
 - use znz_isnull rather than any (pointer == NULL) comparisons in the code

NB: seeks for writable files with compression are quite restricted

 }
{================= }
{ C++ extern C conditionnal removed }
{================= }
{$include <stdio.h>}
{$include <stdlib.h>}
{$include <string.h>}
{$include <stdarg.h>}
{ include optional check for HAVE_FDOPEN here, from deleted config.h:

   uncomment the following line if fdopen() exists for your compiler and
   compiler options
 }
{ #define HAVE_FDOPEN  }
{$if defined(WIN32) || defined(WIN64) || defined(_WIN32) || defined(_WIN64) || defined(_MSVC) || defined(_MSC_VER)}
{$include <io.h>}

const
  fseek = _fseeki64;  
  ftell = _ftelli64;  
  znz_off_t = int64;  
(*** was #elif ****){$else defined(__APPLE__) || defined(__FreeBSD__)}

const
  znz_off_t = off_t;  
{$else}
{$include <unistd.h>}
{$include <sys/types.h>}

const
  znz_off_t = off_t;  
{$endif}
{$ifdef HAVE_ZLIB}
{$if defined(ITKZLIB) && !defined(ITK_USE_SYSTEM_ZLIB)}
{$include "itk_zlib.h"}
{$else}
{$include "zlib.h"}
{$endif}
{$endif}
{$ifdef HAVE_ZLIB}
{$endif}
type
  Pznzptr = ^Tznzptr;
  Tznzptr = record
      withz : longint;
      nzfptr : PFILE;
      zfptr : TgzFile;
    end;

{ the type for all file pointers  }

  PznzFile = ^TznzFile;
  TznzFile = Pznzptr;
{ int znz_isnull(znzFile f);  }
{ int znzclose(znzFile f);  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function znz_isnull(f : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function znzclose(f : longint) : longint;

{ Note extra argument (use_compression) where
   use_compression==0 is no compression
   use_compression!=0 uses zlib (gzip) compression
 }
(* Const before type ignored *)
(* Const before type ignored *)
function znzopen(path:Pchar; mode:Pchar; use_compression:longint):TznzFile;cdecl;external;
{$ifdef COMPILE_NIFTIUNUSED_CODE}
(* Const before type ignored *)
function znzdopen(fd:longint; mode:Pchar; use_compression:longint):TznzFile;cdecl;external;
{$endif}

function Xznzclose(file:PznzFile):longint;cdecl;external;
function znzread(buf:pointer; size:Tsize_t; nmemb:Tsize_t; file:TznzFile):Tsize_t;cdecl;external;
(* Const before type ignored *)
function znzwrite(buf:pointer; size:Tsize_t; nmemb:Tsize_t; file:TznzFile):Tsize_t;cdecl;external;
function znzseek(file:TznzFile; offset:Tznz_off_t; whence:longint):Tznz_off_t;cdecl;external;
function znzrewind(stream:TznzFile):longint;cdecl;external;
function znztell(file:TznzFile):Tznz_off_t;cdecl;external;
(* Const before type ignored *)
function znzputs(str:Pchar; file:TznzFile):longint;cdecl;external;
{$ifdef COMPILE_NIFTIUNUSED_CODE}
function znzgets(str:Pchar; size:longint; file:TznzFile):Pchar;cdecl;external;
function znzputc(c:longint; file:TznzFile):longint;cdecl;external;
function znzgetc(file:TznzFile):longint;cdecl;external;
{$if !defined(WIN32)}
(* Const before type ignored *)

function znzprintf(stream:TznzFile; format:Pchar; args:array of const):longint;cdecl;external;
function znzprintf(stream:TznzFile; format:Pchar):longint;cdecl;external;
{$endif}
{$endif}
{================= }
{ C++ end of extern C conditionnal removed }
{================= }
{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function znz_isnull(f : longint) : longint;
begin
  znz_isnull:=f=NULL;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function znzclose(f : longint) : longint;
begin
  znzclose:=Xznzclose(@(f));
end;


end.
