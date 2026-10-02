unit cpl_minizip_ioapi;

interface

uses
  fp_gdal;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ $Id$  }
{ Modified version by Even Rouault. :
      - change fill_fopen_filefunc to cpl_fill_fopen_filefunc
      - Add support for ZIP64

 * Copyright (c) 2008-2012, Even Rouault <even dot rouault at spatialys.com>

   Original licence available in port/LICENCE_minizip
 }
{ ioapi.h -- IO base function header for compress/uncompress .zip
   files using zlib + zip or unzip API

   Version 1.01e, February 12th, 2005

   Copyright (C) 1998-2005 Gilles Vollant
 }
{$ifndef CPL_MINIZIP_IOAPI_H_INCLUDED}
{$define CPL_MINIZIP_IOAPI_H_INCLUDED}
{$ifndef DOXYGEN_SKIP}
{$include "cpl_vsi.h"}
{$include "zlib.h"}

const
  uLong64 = vsi_l_offset;  
  ZLIB_FILEFUNC_SEEK_CUR = 1;  
  ZLIB_FILEFUNC_SEEK_END = 2;  
  ZLIB_FILEFUNC_SEEK_SET = 0;  
  ZLIB_FILEFUNC_MODE_READ = 1;  
  ZLIB_FILEFUNC_MODE_WRITE = 2;  
  ZLIB_FILEFUNC_MODE_READWRITEFILTER = 3;  
  ZLIB_FILEFUNC_MODE_EXISTING = 4;  
  ZLIB_FILEFUNC_MODE_CREATE = 8;  
{$ifndef }
type

  Topen_file_func = function (opaque:Tvoidpf; filename:Pchar; mode:longint):Tvoidpf;cdecl;

  Tread_file_func = function (opaque:Tvoidpf; stream:Tvoidpf; buf:pointer; size:TuLong):TuLong;cdecl;

  Twrite_file_func = function (opaque:Tvoidpf; stream:Tvoidpf; buf:pointer; size:TuLong):TuLong;cdecl;

  Ttell_file_func = function (opaque:Tvoidpf; stream:Tvoidpf):TuLong64;cdecl;

  Tseek_file_func = function (opaque:Tvoidpf; stream:Tvoidpf; offset:TuLong64; origin:longint):longint;cdecl;

  Tclose_file_func = function (opaque:Tvoidpf; stream:Tvoidpf):longint;cdecl;

  Ttesterror_file_func = function (opaque:Tvoidpf; stream:Tvoidpf):longint;cdecl;

  Pzlib_filefunc_def_s = ^Tzlib_filefunc_def_s;
  Tzlib_filefunc_def_s = record
      zopen_file : Topen_file_func;
      zread_file : Tread_file_func;
      zwrite_file : Twrite_file_func;
      ztell_file : Ttell_file_func;
      zseek_file : Tseek_file_func;
      zclose_file : Tclose_file_func;
      zerror_file : Ttesterror_file_func;
      opaque : Tvoidpf;
    end;
  Tzlib_filefunc_def = Tzlib_filefunc_def_s;
  Pzlib_filefunc_def = ^Tzlib_filefunc_def;

procedure cpl_fill_fopen_filefunc(pzlib_filefunc_def:Pzlib_filefunc_def);cdecl;external libgdal;
const
  ZREAD64 = ZREAD;  
  ZWRITE64 = ZWRITE;  
  ZTELL64 = ZTELL;  
  ZSEEK64 = ZSEEK;  
  ZCLOSE64 = ZCLOSE;  
  ZERROR64 = ZERROR;  

// === Konventiert am: 2-10-26 16:20:10 ===


implementation



end.
