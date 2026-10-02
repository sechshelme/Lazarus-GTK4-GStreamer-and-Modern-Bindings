
unit cpl_minizip_unzip;
interface

{
  Automatically converted by H2Pas 1.0.0 from cpl_minizip_unzip.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cpl_minizip_unzip.h
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
Plongint  = ^longint;
Ptm_unz  = ^tm_unz;
Ptm_unz_s  = ^tm_unz_s;
PuLong64  = ^uLong64;
Punz_file_info  = ^unz_file_info;
Punz_file_info_s  = ^unz_file_info_s;
Punz_file_pos  = ^unz_file_pos;
Punz_file_pos_s  = ^unz_file_pos_s;
Punz_global_info  = ^unz_global_info;
Punz_global_info_s  = ^unz_global_info_s;
PunzFile  = ^unzFile;
Pzlib_filefunc_def  = ^zlib_filefunc_def;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ $Id$  }
{ Modified version by Even Rouault. :
     - Addition of cpl_unzGetCurrentFileZStreamPos
     - Decoration of symbol names unz* -> cpl_unz*
     - Undef EXPORT so that we are sure the symbols are not exported
     - Add support for ZIP64

 * Copyright (c) 2008, Even Rouault <even dot rouault at spatialys.com>

   Original licence available in port/LICENCE_minizip
 }
{ unzip.h -- IO for uncompress .zip files using zlib
   Version 1.01e, February 12th, 2005

   Copyright (C) 1998-2005 Gilles Vollant

   This unzip package allow extract file from .ZIP file, compatible with
  PKZip 2.04g WinZip, InfoZip tools and compatible.

   Multi volume ZipFile (span) are not supported.
   Encryption compatible with pkzip 2.04g only supported
   Old compressions used by old PKZip 1.x are not supported

   I WAIT FEEDBACK at mail info@winimage.com
   Visit also http://www.winimage.com/zLibDll/unzip.htm for evolution

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
{$ifndef CPL_MINIZIP_UNZIP_H_INCLUDED}
{$define CPL_MINIZIP_UNZIP_H_INCLUDED}
{$ifndef DOXYGEN_SKIP}
{$include "cpl_vsi.h"}

const
  uLong64 = vsi_l_offset;  
{$ifndef _ZLIB_H}
{$include "cpl_zlib_header.h"  // to avoid warnings when including zlib.h}
{$endif}
type
  PunzFile = ^TunzFile;
  TunzFile = Tvoidp;

const
  UNZ_OK = 0;  
  UNZ_END_OF_LIST_OF_FILE = -(100);  
  UNZ_ERRNO = Z_ERRNO;  
  UNZ_EOF = 0;  
  UNZ_PARAMERROR = -(102);  
  UNZ_BADZIPFILE = -(103);  
  UNZ_INTERNALERROR = -(104);  
  UNZ_CRCERROR = -(105);  
{ tm_unz contain date/time info  }
{ seconds after the minute - [0,59]  }
{ minutes after the hour - [0,59]  }
{ hours since midnight - [0,23]  }
{ day of the month - [1,31]  }
{ months since January - [0,11]  }
{ years - [1980..2044]  }
type
  Ptm_unz_s = ^Ttm_unz_s;
  Ttm_unz_s = record
      tm_sec : TuInt;
      tm_min : TuInt;
      tm_hour : TuInt;
      tm_mday : TuInt;
      tm_mon : TuInt;
      tm_year : TuInt;
    end;
  Ttm_unz = Ttm_unz_s;
  Ptm_unz = ^Ttm_unz;
{ unz_global_info structure contain global data about the ZIPfile
       These data comes from the end of central dir  }
{ total number of entries in
                                 the central dir on this disk  }
{ size of the global comment of the zipfile  }

  Punz_global_info_s = ^Tunz_global_info_s;
  Tunz_global_info_s = record
      number_entry : TuLong64;
      size_comment : TuLong;
    end;
  Tunz_global_info = Tunz_global_info_s;
  Punz_global_info = ^Tunz_global_info;
{ unz_file_info contain information about a file in the zipfile  }
{ version made by                 2 bytes  }
{ version needed to extract       2 bytes  }
{ general purpose bit flag        2 bytes  }
{ compression method              2 bytes  }
{ last mod file date in Dos fmt   4 bytes  }
{ crc-32                          4 bytes  }
{ compressed size                 4 bytes  }
{ uncompressed size               4 bytes  }
{ filename length                 2 bytes  }
{ absolute offset in the file where file_extra is located  }
{ extra field length              2 bytes  }
{ file comment length             2 bytes  }
{ disk number start               2 bytes  }
{ internal file attributes        2 bytes  }
{ external file attributes        4 bytes  }

  Punz_file_info_s = ^Tunz_file_info_s;
  Tunz_file_info_s = record
      version : TuLong;
      version_needed : TuLong;
      flag : TuLong;
      compression_method : TuLong;
      dosDate : TuLong;
      crc : TuLong;
      compressed_size : TuLong64;
      uncompressed_size : TuLong64;
      size_filename : TuLong;
      file_extra_abs_offset : TuLong64;
      size_file_extra : TuLong;
      size_file_comment : TuLong;
      disk_num_start : TuLong;
      internal_fa : TuLong;
      external_fa : TuLong;
      tmu_date : Ttm_unz;
    end;
  Tunz_file_info = Tunz_file_info_s;
  Punz_file_info = ^Tunz_file_info;
(* Const before type ignored *)
(* Const before type ignored *)

function cpl_unzStringFileNameCompare(fileName1:Pchar; fileName2:Pchar; iCaseSensitivity:longint):longint;cdecl;external;
{
       Compare two filename (fileName1,fileName2).
       If iCaseSenisivity = 1, comparison is case sensitivity (like strcmp)
       If iCaseSenisivity = 2, comparison is not case sensitivity (like strcmpi
                                    or strcasecmp)
       If iCaseSenisivity = 0, case sensitivity is default of your operating
       system (like 1 on Unix, 2 on Windows)
     }
(* Const before type ignored *)
function cpl_unzOpen(path:Pchar):TunzFile;cdecl;external;
{
      Open a Zip file. path contain the full pathname (by example,
         on a Windows XP computer "c:\\zlib\\zlib113.zip" or on an Unix computer
         "zlib/zlib113.zip".
         If the zipfile cannot be opened (file don't exist or in not valid), the
           return value is NULL.
         Else, the return value is a unzFile Handle, usable with other function
           of this unzip package.
     }
(* Const before type ignored *)
function cpl_unzOpen2(path:Pchar; pzlib_filefunc_def:Pzlib_filefunc_def):TunzFile;cdecl;external;
{
       Open a Zip file, like unzOpen, but provide a set of file low level API
          for read/write the zip file (see ioapi.h)
     }
function cpl_unzClose(file:TunzFile):longint;cdecl;external;
{
      Close a ZipFile opened with unzipOpen.
      If there is files inside the .Zip opened with unzOpenCurrentFile (see
      later), these files MUST be closed with unzipCloseCurrentFile before call
      unzipClose. return UNZ_OK if there is no problem.  }
function cpl_unzGetGlobalInfo(file:TunzFile; pglobal_info:Punz_global_info):longint;cdecl;external;
{
      Write info about the ZipFile in the *pglobal_info structure.
      No preparation of the structure is needed
      return UNZ_OK if there is no problem.  }
function cpl_unzGetGlobalComment(file:TunzFile; szComment:Pchar; uSizeBuf:TuLong):longint;cdecl;external;
{
      Get the global comment string of the ZipFile, in the szComment buffer.
      uSizeBuf is the size of the szComment buffer.
      return the number of byte copied or an error code <0
     }
{************************************************************************* }
{ Unzip package allow you browse the directory of the zipfile  }
function cpl_unzGoToFirstFile(file:TunzFile):longint;cdecl;external;
{
      Set the current file of the zipfile to the first file.
      return UNZ_OK if there is no problem
     }
function cpl_unzGoToNextFile(file:TunzFile):longint;cdecl;external;
{
      Set the current file of the zipfile to the next file.
      return UNZ_OK if there is no problem
      return UNZ_END_OF_LIST_OF_FILE if the actual file was the latest.
     }
(* Const before type ignored *)
function cpl_unzLocateFile(file:TunzFile; szFileName:Pchar; iCaseSensitivity:longint):longint;cdecl;external;
{
      Try locate the file szFileName in the zipfile.
      For the iCaseSensitivity signification, see unzStringFileNameCompare

      return value :
      UNZ_OK if the file is found. It becomes the current file.
      UNZ_END_OF_LIST_OF_FILE if the file is not found
     }
{ ******************************************  }
{ Ryan supplied functions  }
{ unz_file_info contain information about a file in the zipfile  }
{ offset in zip file directory  }
{ # of file  }
type
  Punz_file_pos_s = ^Tunz_file_pos_s;
  Tunz_file_pos_s = record
      pos_in_zip_directory : TuLong64;
      num_of_file : TuLong64;
    end;
  Tunz_file_pos = Tunz_file_pos_s;
  Punz_file_pos = ^Tunz_file_pos;

function cpl_unzGetFilePos(file:TunzFile; file_pos:Punz_file_pos):longint;cdecl;external;
function cpl_unzGoToFilePos(file:TunzFile; file_pos:Punz_file_pos):longint;cdecl;external;
{ ******************************************  }
function cpl_unzGetCurrentFileInfo(file:TunzFile; pfile_info:Punz_file_info; szFileName:Pchar; fileNameBufferSize:TuLong; extraField:pointer; 
           extraFieldBufferSize:TuLong; szComment:Pchar; commentBufferSize:TuLong):longint;cdecl;external;
{
      Get Info about the current file
      if pfile_info!=NULL, the *pfile_info structure will contain some info
      about the current file if szFileName!=NULL, the filename string will be
      copied in szFileName (fileNameBufferSize is the size of the buffer) if
      extraField!=NULL, the extra field information will be copied in extraField
                (extraFieldBufferSize is the size of the buffer).
                This is the Central-header version of the extra field
      if szComment!=NULL, the comment string of the file will be copied in
      szComment (commentBufferSize is the size of the buffer)
     }
{* Addition for GDAL : START  }
function cpl_unzGetCurrentFileZStreamPos(file:TunzFile):TuLong64;cdecl;external;
function cpl_unzGetLocalHeaderPos(file:TunzFile; pos_local_header:PuLong64):longint;cdecl;external;
function cpl_unzCurrentFileInfoFromLocalHeader(file:TunzFile; pos_local_header:TuLong64; pfile_info:Punz_file_info; szFileName:Pchar; fileNameBufferSize:Tsize_t; 
           posData:PuLong64):longint;cdecl;external;
{* Addition for GDAL : END  }
{************************************************************************* }
{ for reading the content of the current zipfile, you can open it, read
       data from it, and close it (you can close it before reading all the file)
        }
function cpl_unzOpenCurrentFile(file:TunzFile):longint;cdecl;external;
{
      Open for reading data the current file in the zipfile.
      If there is no error, the return value is UNZ_OK.
     }
(* Const before type ignored *)
function cpl_unzOpenCurrentFilePassword(file:TunzFile; password:Pchar):longint;cdecl;external;
{
      Open for reading data the current file in the zipfile.
      password is a crypting password
      If there is no error, the return value is UNZ_OK.
     }
function cpl_unzOpenCurrentFile2(file:TunzFile; method:Plongint; level:Plongint; raw:longint):longint;cdecl;external;
{
      Same than unzOpenCurrentFile, but open for read raw the file (not
      uncompress) if raw==1 *method will receive method of compression, *level
      will receive level of compression note : you can set level parameter as
      NULL (if you did not want known level, but you CANNOT set method parameter
      as NULL
     }
(* Const before type ignored *)
function cpl_unzOpenCurrentFile3(file:TunzFile; method:Plongint; level:Plongint; raw:longint; password:Pchar):longint;cdecl;external;
{
      Same than unzOpenCurrentFile, but open for read raw the file (not
      uncompress) if raw==1 *method will receive method of compression, *level
      will receive level of compression note : you can set level parameter as
      NULL (if you did not want known level, but you CANNOT set method parameter
      as NULL
     }
function cpl_unzCloseCurrentFile(file:TunzFile):longint;cdecl;external;
{
      Close the file in zip opened with unzOpenCurrentFile
      Return UNZ_CRCERROR if all the file was read but the CRC is not good
     }
function cpl_unzReadCurrentFile(file:TunzFile; buf:Tvoidp; len:dword):longint;cdecl;external;
{
      Read bytes from the current file (opened by unzOpenCurrentFile)
      buf contain buffer where data must be copied
      len the size of buf.

      return the number of byte copied if some bytes are copied
      return 0 if the end of file was reached
      return <0 with error code if there is an error
        (UNZ_ERRNO for IO error, or zLib error for uncompress error)
     }
function cpl_unztell(file:TunzFile):Tz_off_t;cdecl;external;
{
      Give the current position in uncompressed data
     }
function cpl_unzeof(file:TunzFile):longint;cdecl;external;
{
      return 1 if the end of file was reached, 0 elsewhere
     }
function cpl_unzGetLocalExtrafield(file:TunzFile; buf:Tvoidp; len:dword):longint;cdecl;external;
{
      Read extra field from the current file (opened by unzOpenCurrentFile)
      This is the local-header version of the extra field (sometimes, there is
        more info in the local-header version than in the central-header)

      if buf==NULL, it return the size of the local extra field

      if buf!=NULL, len is the size of the buffer, the extra header is copied in
        buf.
      the return value is the number of bytes copied in buf, or (if <0)
        the error code
     }
{************************************************************************* }
{ Get the current file offset  }
function cpl_unzGetOffset(file:TunzFile):TuLong64;cdecl;external;
{ Set the current file offset  }
function cpl_unzSetOffset(file:TunzFile; pos:TuLong64):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ #ifndef DOXYGEN_SKIP  }
{$endif}
{ CPL_MINIZIP_UNZIP_H_INCLUDED  }

implementation


end.
