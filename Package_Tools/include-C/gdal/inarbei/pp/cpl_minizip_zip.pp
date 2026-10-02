
unit cpl_minizip_zip;
interface

{
  Automatically converted by H2Pas 1.0.0 from cpl_minizip_zip.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cpl_minizip_zip.h
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
Ptm_zip  = ^tm_zip;
Ptm_zip_s  = ^tm_zip_s;
Pzip_fileinfo  = ^zip_fileinfo;
Pzipcharpc  = ^zipcharpc;
PzipFile  = ^zipFile;
Pzlib_filefunc_def  = ^zlib_filefunc_def;
PZPOS64_T  = ^ZPOS64_T;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*****************************************************************************
 * $Id$
 *
 * Project:  CPL - Common Portability Library
 * Author:   Frank Warmerdam, warmerdam@pobox.com
 * Purpose:  Adjusted minizip "zip.h" include file for zip services.
 *
 * Modified version by Even Rouault. :
 *   - Decoration of symbol names unz* -> cpl_unz*
 *   - Undef EXPORT so that we are sure the symbols are not exported
 *   - Remove old C style function prototypes
 *   - Added CPL* simplified API at bottom.
 *
 *   Original licence available in port/LICENCE_minizip
 *
 **************************************************************************** }
{ zip.h -- IO for compress .zip files using zlib
   Version 1.01e, February 12th, 2005

   Copyright (C) 1998-2005 Gilles Vollant

   This unzip package allow creates .ZIP file, compatible with PKZip 2.04g
     WinZip, InfoZip tools and compatible.
   Multi volume ZipFile (span) are not supported.
   Encryption compatible with pkzip 2.04g only supported
   Old compressions used by old PKZip 1.x are not supported

  For uncompress .zip file, look at unzip.h

   I WAIT FEEDBACK at mail info@winimage.com
   Visit also http://www.winimage.com/zLibDll/unzip.html for evolution

   Condition of use and distribution are the same than zlib :

  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:

  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
 }
{ for more info about .ZIP format, see
      http://www.info-zip.org/pub/infozip/doc/appnote-981119-iz.zip
      http://www.info-zip.org/pub/infozip/doc/
   PkWare has also a specification at :
      ftp://ftp.pkware.com/probdesc.zip
 }
{$ifndef CPL_MINIZIP_ZIP_H_INCLUDED}
{$define CPL_MINIZIP_ZIP_H_INCLUDED}
{$ifndef DOXYGEN_SKIP}
{$include "cpl_vsi.h"}

const
  uLong64 = vsi_l_offset;  
type
  PZPOS64_T = ^TZPOS64_T;
  TZPOS64_T = Tvsi_l_offset;
{$ifndef _ZLIB_H}
{$include "cpl_zlib_header.h"  // to avoid warnings when including zlib.h}
{$endif}
{$ifndef CPL_MINIZIP_IOAPI_H_INCLUDED}
{$include "cpl_minizip_ioapi.h"}
{$endif}
{$include <stdbool.h>}
type
  PzipFile = ^TzipFile;
  TzipFile = Tvoidp;

const
  ZIP_OK = 0;  
  ZIP_EOF = 0;  
  ZIP_ERRNO = Z_ERRNO;  
  ZIP_PARAMERROR = -(102);  
  ZIP_BADZIPFILE = -(103);  
  ZIP_INTERNALERROR = -(104);  
{$ifndef DEF_MEM_LEVEL}
{$if MAX_MEM_LEVEL >= 8}

const
  DEF_MEM_LEVEL = 8;  
{$else}

const
  DEF_MEM_LEVEL = MAX_MEM_LEVEL;  
{$endif}
{$endif}
{ default memLevel  }
{ tm_zip contain date/time info  }
{ seconds after the minute - [0,59]  }
{ minutes after the hour - [0,59]  }
{ hours since midnight - [0,23]  }
{ day of the month - [1,31]  }
{ months since January - [0,11]  }
{ years - [1980..2044]  }
type
  Ptm_zip_s = ^Ttm_zip_s;
  Ttm_zip_s = record
      tm_sec : TuInt;
      tm_min : TuInt;
      tm_hour : TuInt;
      tm_mday : TuInt;
      tm_mon : TuInt;
      tm_year : TuInt;
    end;
  Ttm_zip = Ttm_zip_s;
  Ptm_zip = ^Ttm_zip;
{ date in understandable format            }
{ if dos_date == 0, tmu_date is used       }
{    uLong       flag;         }{ general purpose bit flag        2
                                             bytes  }
{ internal file attributes        2 bytes  }
{ external file attributes        4 bytes  }

  Pzip_fileinfo = ^Tzip_fileinfo;
  Tzip_fileinfo = record
      tmz_date : Ttm_zip;
      dosDate : TuLong;
      internal_fa : TuLong;
      external_fa : TuLong;
    end;
(* Const before type ignored *)

  Pzipcharpc = ^Tzipcharpc;
  Tzipcharpc = Pchar;

const
  APPEND_STATUS_CREATE = 0;  
  APPEND_STATUS_CREATEAFTER = 1;  
  APPEND_STATUS_ADDINZIP = 2;  
(* Const before type ignored *)

function cpl_zipOpen(pathname:Pchar; append:longint):TzipFile;cdecl;external;
{
      Create a zipfile.
         pathname contain on Windows XP a filename like "c:\\zlib\\zlib113.zip"
      or on an Unix computer "zlib/zlib113.zip". if the file pathname exist and
      append==APPEND_STATUS_CREATEAFTER, the zip will be created at the end of
      the file. (useful if the file contain a self extractor code) if the file
      pathname exist and append==APPEND_STATUS_ADDINZIP, we will add files in
      existing zip (be sure you don't add file that doesn't exist) If the
      zipfile cannot be opened, the return value is NULL. Else, the return value
      is a zipFile Handle, usable with other function of this zip package.
     }
{ Note : there is no delete function for a zipfile.
       If you want delete file in a zipfile, you must open a zipfile, and create
       another. Of course, you can use RAW reading and writing to copy the file
       you did not want delete.
     }
(* Const before type ignored *)
function cpl_zipOpen2(pathname:Pchar; append:longint; globalcomment:Pzipcharpc; pzlib_filefunc_def:Pzlib_filefunc_def):TzipFile;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function cpl_zipOpenNewFileInZip(file:TzipFile; filename:Pchar; zipfi:Pzip_fileinfo; extrafield_local:pointer; size_extrafield_local:TuInt; 
           extrafield_global:pointer; size_extrafield_global:TuInt; comment:Pchar; method:longint; level:longint):longint;cdecl;external;
{
      Open a file in the ZIP for writing.
      filename : the filename in zip (if NULL, '-' without quote will be used
      *zipfi contain supplemental information
      if extrafield_local!=NULL and size_extrafield_local>0, extrafield_local
        contains the extrafield data the local header
      if extrafield_global!=NULL and size_extrafield_global>0, extrafield_global
        contains the extrafield data the local header
      if comment != NULL, comment contain the comment string
      method contain the compression method (0 for store, Z_DEFLATED for
      deflate) level contain the level of compression (can be
      Z_DEFAULT_COMPRESSION)
     }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function cpl_zipOpenNewFileInZip2(file:TzipFile; filename:Pchar; zipfi:Pzip_fileinfo; extrafield_local:pointer; size_extrafield_local:TuInt; 
           extrafield_global:pointer; size_extrafield_global:TuInt; comment:Pchar; method:longint; level:longint; 
           raw:longint):longint;cdecl;external;
{
      Same than zipOpenNewFileInZip, except if raw=1, we write raw file
      }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function cpl_zipOpenNewFileInZip3(file:TzipFile; filename:Pchar; zipfi:Pzip_fileinfo; extrafield_local:pointer; size_extrafield_local:TuInt; 
           extrafield_global:pointer; size_extrafield_global:TuInt; comment:Pchar; method:longint; level:longint; 
           raw:longint; windowBits:longint; memLevel:longint; strategy:longint; password:Pchar; 
           crcForCtypting:TuLong; bZip64:Tbool; bIncludeInCentralDirectory:Tbool):longint;cdecl;external;
{
      Same than zipOpenNewFileInZip2, except
        windowBits,memLevel,,strategy : see parameter strategy in deflateInit2
        password : crypting password (NULL for no crypting)
        crcForCtypting : crc of file to compress (needed for crypting)
      }
(* Const before type ignored *)
function cpl_zipWriteInFileInZip(file:TzipFile; buf:pointer; len:dword):longint;cdecl;external;
{
      Write data in the zipfile
     }
function cpl_zipCloseFileInZip(file:TzipFile):longint;cdecl;external;
{
      Close the current file in the zipfile
     }
function cpl_zipCloseFileInZipRaw(file:TzipFile; uncompressed_size:TZPOS64_T; crc32:TuLong):longint;cdecl;external;
{
      Close the current file in the zipfile, for file opened with
        parameter raw=1 in zipOpenNewFileInZip2
      uncompressed_size and crc32 are value for the uncompressed size
     }
(* Const before type ignored *)
function cpl_zipClose(file:TzipFile; global_comment:Pchar):longint;cdecl;external;
{
      Close the zipfile
     }
{ C++ end of extern C conditionnal removed }
{$endif}
{ #ifndef DOXYGEN_SKIP  }
{$endif}
{ _zip_H  }

implementation


end.
