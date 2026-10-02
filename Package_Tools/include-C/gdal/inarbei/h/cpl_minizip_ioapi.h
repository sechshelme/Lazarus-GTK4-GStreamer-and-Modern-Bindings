/* $Id$ */

/* Modified version by Even Rouault. :
      - change fill_fopen_filefunc to cpl_fill_fopen_filefunc
      - Add support for ZIP64

 * Copyright (c) 2008-2012, Even Rouault <even dot rouault at spatialys.com>

   Original licence available in port/LICENCE_minizip
*/

/* ioapi.h -- IO base function header for compress/uncompress .zip
   files using zlib + zip or unzip API

   Version 1.01e, February 12th, 2005

   Copyright (C) 1998-2005 Gilles Vollant
*/

#ifndef CPL_MINIZIP_IOAPI_H_INCLUDED
#define CPL_MINIZIP_IOAPI_H_INCLUDED

#ifndef DOXYGEN_SKIP

#include "cpl_vsi.h"
#include "zlib.h"

#define uLong64 vsi_l_offset

#define ZLIB_FILEFUNC_SEEK_CUR (1)
#define ZLIB_FILEFUNC_SEEK_END (2)
#define ZLIB_FILEFUNC_SEEK_SET (0)

#define ZLIB_FILEFUNC_MODE_READ (1)
#define ZLIB_FILEFUNC_MODE_WRITE (2)
#define ZLIB_FILEFUNC_MODE_READWRITEFILTER (3)

#define ZLIB_FILEFUNC_MODE_EXISTING (4)
#define ZLIB_FILEFUNC_MODE_CREATE (8)

#ifndef 



    typedef voidpf( *open_file_func)(voidpf opaque,
                                              const char *filename, int mode);
    typedef uLong( *read_file_func)(voidpf opaque, voidpf stream,
                                             void *buf, uLong size);
    typedef uLong( *write_file_func)(voidpf opaque, voidpf stream,
                                              const void *buf, uLong size);
    typedef uLong64( *tell_file_func)(voidpf opaque, voidpf stream);
    typedef long( *seek_file_func)(voidpf opaque, voidpf stream,
                                            uLong64 offset, int origin);
    typedef int( *close_file_func)(voidpf opaque, voidpf stream);
    typedef int( *testerror_file_func)(voidpf opaque, voidpf stream);

    typedef struct zlib_filefunc_def_s
    {
        open_file_func zopen_file;
        read_file_func zread_file;
        write_file_func zwrite_file;
        tell_file_func ztell_file;
        seek_file_func zseek_file;
        close_file_func zclose_file;
        testerror_file_func zerror_file;
        voidpf opaque;
    } zlib_filefunc_def;

    void cpl_fill_fopen_filefunc(zlib_filefunc_def *pzlib_filefunc_def);


#define ZREAD64 ZREAD
#define ZWRITE64 ZWRITE
#define ZTELL64 ZTELL
#define ZSEEK64 ZSEEK
#define ZCLOSE64 ZCLOSE
#define ZERROR64 ZERROR


