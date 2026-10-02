
unit cpl_vsi;
interface

{
  Automatically converted by H2Pas 1.0.0 from cpl_vsi.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cpl_vsi
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
Pdword  = ^dword;
PFILE  = ^FILE;
PGByte  = ^GByte;
Plongint  = ^longint;
Psize_t  = ^size_t;
Ptime_t  = ^time_t;
Ptm  = ^tm;
Pvsi_l_offset  = ^vsi_l_offset;
PVSIDIR  = ^VSIDIR;
PVSIDIREntry  = ^VSIDIREntry;
PVSIFilesystemPluginCallbacksStruct  = ^VSIFilesystemPluginCallbacksStruct;
PVSIFilesystemPluginOpenCallback  = ^VSIFilesystemPluginOpenCallback;
PVSIFilesystemPluginReadDirCallback  = ^VSIFilesystemPluginReadDirCallback;
PVSIFilesystemPluginSiblingFilesCallback  = ^VSIFilesystemPluginSiblingFilesCallback;
PVSILFILE  = ^VSILFILE;
PVSIRangeStatus  = ^VSIRangeStatus;
PVSIStatBuf  = ^VSIStatBuf;
PVSIStatBufL  = ^VSIStatBufL;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*****************************************************************************
 * $Id$
 *
 * Project:  CPL - Common Portability Library
 * Author:   Frank Warmerdam, warmerdam@pobox.com
 * Purpose:  Include file defining Virtual File System (VSI) functions, a
 *           layer over POSIX file and other system services.
 *
 ******************************************************************************
 * Copyright (c) 1998, Frank Warmerdam
 * Copyright (c) 2008-2014, Even Rouault <even dot rouault at spatialys.com>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *************************************************************************** }
{$ifndef CPL_VSI_H_INCLUDED}
{$define CPL_VSI_H_INCLUDED}
{$include "cpl_port.h"}
{$include "cpl_progress.h"}
{$include <stdbool.h>}
{*
 * \file cpl_vsi.h
 *
 * Standard C Covers
 *
 * The VSI functions are intended to be hookable aliases for Standard C
 * I/O, memory allocation and other system functions. They are intended
 * to allow virtualization of disk I/O so that non file data sources
 * can be made to appear as files, and so that additional error trapping
 * and reporting can be interested.  The memory access API is aliased
 * so that special application memory management services can be used.
 *
 * It is intended that each of these functions retains exactly the same
 * calling pattern as the original Standard C functions they relate to.
 * This means we don't have to provide custom documentation, and also means
 * that the default implementation is very simple.
  }
{ --------------------------------------------------------------------  }
{      We need access to ``struct stat''.                               }
{ --------------------------------------------------------------------  }
{ Unix  }
{$if !defined(_WIN32)}
{$include <unistd.h>}
{$endif}
{ Windows  }
{$include <sys/stat.h>}
(* Const before type ignored *)
(* Const before type ignored *)

function VSIFOpen(para1:Pchar; para2:Pchar):PFILE;cdecl;external;
function VSIFClose(para1:PFILE):longint;cdecl;external;
function VSIFSeek(para1:PFILE; para2:longint; para3:longint):longint;cdecl;external;
function VSIFTell(para1:PFILE):longint;cdecl;external;
procedure VSIRewind(para1:PFILE);cdecl;external;
procedure VSIFFlush(para1:PFILE);cdecl;external;
function VSIFRead(para1:pointer; para2:Tsize_t; para3:Tsize_t; para4:PFILE):Tsize_t;cdecl;external;
(* Const before type ignored *)
function VSIFWrite(para1:pointer; para2:Tsize_t; para3:Tsize_t; para4:PFILE):Tsize_t;cdecl;external;
function VSIFGets(para1:Pchar; para2:longint; para3:PFILE):Pchar;cdecl;external;
(* Const before type ignored *)
function VSIFPuts(para1:Pchar; para2:PFILE):longint;cdecl;external;
(* Const before type ignored *)
function VSIFPrintf(para1:PFILE; para2:Pchar; args:array of const):longint;cdecl;external;
function VSIFPrintf(para1:PFILE; para2:Pchar):longint;cdecl;external;
function VSIFGetc(para1:PFILE):longint;cdecl;external;
function VSIFPutc(para1:longint; para2:PFILE):longint;cdecl;external;
function VSIUngetc(para1:longint; para2:PFILE):longint;cdecl;external;
function VSIFEof(para1:PFILE):longint;cdecl;external;
{! @endcond  }
{ ====================================================================  }
{      VSIStat() related.                                               }
{ ====================================================================  }
{! @cond Doxygen_Suppress  }
type
  Tstat = TVSIStatBuf;
(* Const before type ignored *)

function VSIStat(para1:Pchar; para2:PVSIStatBuf):longint;cdecl;external;
{! @endcond  }
{$ifdef _WIN32}
{ N/A on Windows  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VSI_ISLNK(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function VSI_ISREG(x : longint) : Tx;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function VSI_ISDIR(x : longint) : Tx;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function VSI_ISCHR(x : longint) : Tx;

{ N/A on Windows  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VSI_ISBLK(x : longint) : longint;

{$else}
{* Test if the file is a symbolic link  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function VSI_ISLNK(x : longint) : longint;

{* Test if the file is a regular file  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VSI_ISREG(x : longint) : longint;

{* Test if the file is a directory  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VSI_ISDIR(x : longint) : longint;

{! @cond Doxygen_Suppress  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VSI_ISCHR(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VSI_ISBLK(x : longint) : longint;

{! @endcond  }
{$endif}
{ ====================================================================  }
{      64bit stdio file access functions.  If we have a big size        }
{      defined, then provide prototypes for the large file API,         }
{      otherwise redefine to use the regular api.                       }
{ ====================================================================  }
{* Type for a file offset  }
type
  Pvsi_l_offset = ^Tvsi_l_offset;
  Tvsi_l_offset = TGUIntBig;
{* Maximum value for a file offset  }

const
  VSI_L_OFFSET_MAX = GUINTBIG_MAX;  
{* Opaque type for a FILE that implements the VSIVirtualHandle API  }
type
  TVSIVirtualHandle = TVSILFILE;
(* Const before type ignored *)
(* Const before type ignored *)

function VSIFOpenL(para1:Pchar; para2:Pchar):PVSILFILE;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function VSIFOpenExL(para1:Pchar; para2:Pchar; para3:longint):PVSILFILE;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function VSIFOpenEx2L(para1:Pchar; para2:Pchar; para3:longint; para4:TCSLConstList):PVSILFILE;cdecl;external;
function VSIFCloseL(para1:PVSILFILE):longint;cdecl;external;
function VSIFSeekL(para1:PVSILFILE; para2:Tvsi_l_offset; para3:longint):longint;cdecl;external;
function VSIFTellL(para1:PVSILFILE):Tvsi_l_offset;cdecl;external;
procedure VSIRewindL(para1:PVSILFILE);cdecl;external;
function VSIFReadL(para1:pointer; para2:Tsize_t; para3:Tsize_t; para4:PVSILFILE):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function VSIFReadMultiRangeL(nRanges:longint; ppData:Ppointer; panOffsets:Pvsi_l_offset; panSizes:Psize_t; para5:PVSILFILE):longint;cdecl;external;
(* Const before type ignored *)
function VSIFWriteL(para1:pointer; para2:Tsize_t; para3:Tsize_t; para4:PVSILFILE):Tsize_t;cdecl;external;
function VSIFEofL(para1:PVSILFILE):longint;cdecl;external;
function VSIFTruncateL(para1:PVSILFILE; para2:Tvsi_l_offset):longint;cdecl;external;
function VSIFFlushL(para1:PVSILFILE):longint;cdecl;external;
(* Const before type ignored *)
function VSIFPrintfL(para1:PVSILFILE; para2:Pchar; args:array of const):longint;cdecl;external;
function VSIFPrintfL(para1:PVSILFILE; para2:Pchar):longint;cdecl;external;
function VSIFPutcL(para1:longint; para2:PVSILFILE):longint;cdecl;external;
{* Range status  }
{*< Unknown  }
{*< Data present  }
{*< Hole  }
type
  PVSIRangeStatus = ^TVSIRangeStatus;
  TVSIRangeStatus =  Longint;
  Const
    VSI_RANGE_STATUS_UNKNOWN = 0;
    VSI_RANGE_STATUS_DATA = 1;
    VSI_RANGE_STATUS_HOLE = 2;
;

function VSIFGetRangeStatusL(fp:PVSILFILE; nStart:Tvsi_l_offset; nLength:Tvsi_l_offset):TVSIRangeStatus;cdecl;external;
(* Const before type ignored *)
function VSIIngestFile(fp:PVSILFILE; pszFilename:Pchar; ppabyRet:PPGByte; pnSize:Pvsi_l_offset; nMaxSize:TGIntBig):longint;cdecl;external;
(* Const before type ignored *)
function VSIOverwriteFile(fpTarget:PVSILFILE; pszSourceFilename:Pchar):longint;cdecl;external;
{$if defined(VSI_STAT64_T)}
{* Type for VSIStatL()  }
type
  TVSI_STAT64_T = TVSIStatBufL;
{$else}
{* Type for VSIStatL()  }

const
  VSIStatBufL = VSIStatBuf;  
{$endif}
(* Const before type ignored *)

function VSIStatL(para1:Pchar; para2:PVSIStatBufL):longint;cdecl;external;
{* Flag provided to VSIStatExL() to test if the file exists  }
const
  VSI_STAT_EXISTS_FLAG = $1;  
{* Flag provided to VSIStatExL() to query the nature (file/dir) of the file  }
  VSI_STAT_NATURE_FLAG = $2;  
{* Flag provided to VSIStatExL() to query the file size  }
  VSI_STAT_SIZE_FLAG = $4;  
{* Flag provided to VSIStatExL() to issue a VSIError in case of failure  }
  VSI_STAT_SET_ERROR_FLAG = $8;  
{* Flag provided to VSIStatExL() to only use already cached results.
 * @since GDAL 3.4
  }
  VSI_STAT_CACHE_ONLY = $10;  
(* Const before type ignored *)

function VSIStatExL(pszFilename:Pchar; psStatBuf:PVSIStatBufL; nFlags:longint):longint;cdecl;external;
(* Const before type ignored *)
function VSIIsCaseSensitiveFS(pszFilename:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function VSISupportsSparseFiles(pszPath:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function VSIIsLocal(pszPath:Pchar):Tbool;cdecl;external;
(* Const before type ignored *)
function VSIGetCanonicalFilename(pszPath:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function VSISupportsSequentialWrite(pszPath:Pchar; bAllowLocalTempFile:Tbool):Tbool;cdecl;external;
(* Const before type ignored *)
function VSISupportsRandomWrite(pszPath:Pchar; bAllowLocalTempFile:Tbool):Tbool;cdecl;external;
(* Const before type ignored *)
function VSIHasOptimizedReadMultiRange(pszPath:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function VSIGetActualURL(pszFilename:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function VSIGetSignedURL(pszFilename:Pchar; papszOptions:TCSLConstList):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function VSIGetFileSystemOptions(pszFilename:Pchar):Pchar;cdecl;external;
function VSIGetFileSystemsPrefixes:^Pchar;cdecl;external;
function VSIFGetNativeFileDescriptorL(para1:PVSILFILE):pointer;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function VSIGetFileMetadata(pszFilename:Pchar; pszDomain:Pchar; papszOptions:TCSLConstList):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function VSISetFileMetadata(pszFilename:Pchar; papszMetadata:TCSLConstList; pszDomain:Pchar; papszOptions:TCSLConstList):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure VSISetPathSpecificOption(pszPathPrefix:Pchar; pszKey:Pchar; pszValue:Pchar);cdecl;external;
(* Const before type ignored *)
procedure VSIClearPathSpecificOptions(pszPathPrefix:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function VSIGetPathSpecificOption(pszPath:Pchar; pszKey:Pchar; pszDefault:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{! @cond Doxygen_Suppress  }
{    CPL_WARN_DEPRECATED("Use VSISetPathSpecificOption instead") }
{! @endcond  }
procedure VSISetCredential(pszPathPrefix:Pchar; pszKey:Pchar; pszValue:Pchar);cdecl;external;
(* Const before type ignored *)
{! @cond Doxygen_Suppress  }
{    CPL_WARN_DEPRECATED("Use VSIClearPathSpecificOptions instead") }
{! @endcond  }
procedure VSIClearCredentials(pszPathPrefix:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{! @cond Doxygen_Suppress  }
{    CPL_WARN_DEPRECATED("Use VSIGetPathSpecificOption instead") }
{! @endcond  }
function VSIGetCredential(pszPath:Pchar; pszKey:Pchar; pszDefault:Pchar):Pchar;cdecl;external;
{ ====================================================================  }
{      Memory allocation                                                }
{ ====================================================================  }
function VSICalloc(para1:Tsize_t; para2:Tsize_t):pointer;cdecl;external;
function VSIMalloc(para1:Tsize_t):pointer;cdecl;external;
procedure VSIFree(para1:pointer);cdecl;external;
function VSIRealloc(para1:pointer; para2:Tsize_t):pointer;cdecl;external;
(* Const before type ignored *)
function VSIStrdup(para1:Pchar):Pchar;cdecl;external;
function VSIMallocAligned(nAlignment:Tsize_t; nSize:Tsize_t):pointer;cdecl;external;
function VSIMallocAlignedAuto(nSize:Tsize_t):pointer;cdecl;external;
procedure VSIFreeAligned(ptr:pointer);cdecl;external;
(* Const before type ignored *)
function VSIMallocAlignedAutoVerbose(nSize:Tsize_t; pszFile:Pchar; nLine:longint):pointer;cdecl;external;
{* VSIMallocAlignedAutoVerbose() with FILE and LINE reporting  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VSI_MALLOC_ALIGNED_AUTO_VERBOSE(size : longint) : longint;

{*
 VSIMalloc2 allocates (nSize1 * nSize2) bytes.
 In case of overflow of the multiplication, or if memory allocation fails, a
 NULL pointer is returned and a CE_Failure error is raised with CPLError().
 If nSize1 == 0 || nSize2 == 0, a NULL pointer will also be returned.
 CPLFree() or VSIFree() can be used to free memory allocated by this function.
 }
function VSIMalloc2(nSize1:Tsize_t; nSize2:Tsize_t):pointer;cdecl;external;
{*
 VSIMalloc3 allocates (nSize1 * nSize2 * nSize3) bytes.
 In case of overflow of the multiplication, or if memory allocation fails, a
 NULL pointer is returned and a CE_Failure error is raised with CPLError().
 If nSize1 == 0 || nSize2 == 0 || nSize3 == 0, a NULL pointer will also be
 returned. CPLFree() or VSIFree() can be used to free memory allocated by this
 function.
 }
function VSIMalloc3(nSize1:Tsize_t; nSize2:Tsize_t; nSize3:Tsize_t):pointer;cdecl;external;
{* VSIMallocVerbose  }
(* Const before type ignored *)
function VSIMallocVerbose(nSize:Tsize_t; pszFile:Pchar; nLine:longint):pointer;cdecl;external;
{* VSI_MALLOC_VERBOSE  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VSI_MALLOC_VERBOSE(size : longint) : longint;

{* VSIMalloc2Verbose  }
(* Const before type ignored *)
function VSIMalloc2Verbose(nSize1:Tsize_t; nSize2:Tsize_t; pszFile:Pchar; nLine:longint):pointer;cdecl;external;
{* VSI_MALLOC2_VERBOSE  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VSI_MALLOC2_VERBOSE(nSize1,nSize2 : longint) : longint;

{* VSIMalloc3Verbose  }
(* Const before type ignored *)
function VSIMalloc3Verbose(nSize1:Tsize_t; nSize2:Tsize_t; nSize3:Tsize_t; pszFile:Pchar; nLine:longint):pointer;cdecl;external;
{* VSI_MALLOC3_VERBOSE  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VSI_MALLOC3_VERBOSE(nSize1,nSize2,nSize3 : longint) : longint;

{* VSICallocVerbose  }
(* Const before type ignored *)
function VSICallocVerbose(nCount:Tsize_t; nSize:Tsize_t; pszFile:Pchar; nLine:longint):pointer;cdecl;external;
{* VSI_CALLOC_VERBOSE  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VSI_CALLOC_VERBOSE(nCount,nSize : longint) : longint;

{* VSIReallocVerbose  }
(* Const before type ignored *)
function VSIReallocVerbose(pOldPtr:pointer; nNewSize:Tsize_t; pszFile:Pchar; nLine:longint):pointer;cdecl;external;
{* VSI_REALLOC_VERBOSE  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VSI_REALLOC_VERBOSE(pOldPtr,nNewSize : longint) : longint;

{* VSIStrdupVerbose  }
(* Const before type ignored *)
(* Const before type ignored *)
function VSIStrdupVerbose(pszStr:Pchar; pszFile:Pchar; nLine:longint):Pchar;cdecl;external;
{* VSI_STRDUP_VERBOSE  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VSI_STRDUP_VERBOSE(pszStr : longint) : longint;

function CPLGetPhysicalRAM:TGIntBig;cdecl;external;
function CPLGetUsablePhysicalRAM:TGIntBig;cdecl;external;
{ ====================================================================  }
{      Other...                                                         }
{ ====================================================================  }
{* Alias of VSIReadDir()  }
const
  CPLReadDir = VSIReadDir;  
(* Const before type ignored *)

function VSIReadDir(para1:Pchar):^Pchar;cdecl;external;
(* Const before type ignored *)
function VSIReadDirRecursive(pszPath:Pchar):^Pchar;cdecl;external;
(* Const before type ignored *)
function VSIReadDirEx(pszPath:Pchar; nMaxFiles:longint):^Pchar;cdecl;external;
(* Const before type ignored *)
function VSISiblingFiles(pszPath:Pchar):^Pchar;cdecl;external;
{* Opaque type for a directory iterator  }
type
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)

function VSIOpenDir(pszPath:Pchar; nRecurseDepth:longint; papszOptions:PPchar):PVSIDIR;cdecl;external;
{! @cond Doxygen_Suppress  }
type
{! @endcond  }
{* Directory entry.  }
{* Filename  }
{* File mode. See VSI_ISREG() / VSI_ISDIR()  }
{* File size  }
{* Last modification time (seconds since 1970/01/01)  }
{* Whether nMode is known: 0 = unknown, 1 = known.  }
{* Whether nSize is known: 0 = unknown, 1 = known.  }
{* Whether nMTime is known: 0 = unknown, 1 = known.  }
{* NULL-terminated list of extra properties.  }
  PVSIDIREntry = ^TVSIDIREntry;
  TVSIDIREntry = record
      pszName : Pchar;
      nMode : longint;
      nSize : Tvsi_l_offset;
      nMTime : TGIntBig;
      bModeKnown : char;
      bSizeKnown : char;
      bMTimeKnown : char;
      papszExtra : ^Pchar;
    end;

(* Const before type ignored *)

function VSIGetNextDirEntry(dir:PVSIDIR):PVSIDIREntry;cdecl;external;
procedure VSICloseDir(dir:PVSIDIR);cdecl;external;
(* Const before type ignored *)
function VSIMkdir(pszPathname:Pchar; mode:longint):longint;cdecl;external;
(* Const before type ignored *)
function VSIMkdirRecursive(pszPathname:Pchar; mode:longint):longint;cdecl;external;
(* Const before type ignored *)
function VSIRmdir(pszDirname:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function VSIRmdirRecursive(pszDirname:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function VSIUnlink(pszFilename:Pchar):longint;cdecl;external;
function VSIUnlinkBatch(papszFiles:TCSLConstList):Plongint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function VSIRename(oldpath:Pchar; newpath:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
function VSICopyFile(pszSource:Pchar; pszTarget:Pchar; fpSource:PVSILFILE; nSourceSize:Tvsi_l_offset; papszOptions:PPchar; 
           pProgressFunc:TGDALProgressFunc; pProgressData:pointer):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
function VSISync(pszSource:Pchar; pszTarget:Pchar; papszOptions:PPchar; pProgressFunc:TGDALProgressFunc; pProgressData:pointer; 
           ppapszOutputs:PPPchar):longint;cdecl;external;
(* Const before type ignored *)
function VSIAbortPendingUploads(pszFilename:Pchar):longint;cdecl;external;
function VSIStrerror(para1:longint):Pchar;cdecl;external;
(* Const before type ignored *)
function VSIGetDiskFreeSpace(pszDirname:Pchar):TGIntBig;cdecl;external;
procedure VSINetworkStatsReset;cdecl;external;
function VSINetworkStatsGetAsSerializedJSON(papszOptions:PPchar):Pchar;cdecl;external;
{ ====================================================================  }
{      Install special file access handlers.                            }
{ ====================================================================  }
procedure VSIInstallMemFileHandler;cdecl;external;
{! @cond Doxygen_Suppress  }
procedure VSIInstallLargeFileHandler;cdecl;external;
{! @endcond  }
procedure VSIInstallSubFileHandler;cdecl;external;
procedure VSIInstallCurlFileHandler;cdecl;external;
procedure VSICurlClearCache;cdecl;external;
(* Const before type ignored *)
procedure VSICurlPartialClearCache(pszFilenamePrefix:Pchar);cdecl;external;
procedure VSIInstallCurlStreamingFileHandler;cdecl;external;
procedure VSIInstallS3FileHandler;cdecl;external;
procedure VSIInstallS3StreamingFileHandler;cdecl;external;
procedure VSIInstallGSFileHandler;cdecl;external;
procedure VSIInstallGSStreamingFileHandler;cdecl;external;
procedure VSIInstallAzureFileHandler;cdecl;external;
procedure VSIInstallAzureStreamingFileHandler;cdecl;external;
procedure VSIInstallADLSFileHandler;cdecl;external;
procedure VSIInstallOSSFileHandler;cdecl;external;
procedure VSIInstallOSSStreamingFileHandler;cdecl;external;
procedure VSIInstallSwiftFileHandler;cdecl;external;
procedure VSIInstallSwiftStreamingFileHandler;cdecl;external;
procedure VSIInstall7zFileHandler;cdecl;external;
{ No reason to export that  }
procedure VSIInstallRarFileHandler;cdecl;external;
{ No reason to export that  }
procedure VSIInstallGZipFileHandler;cdecl;external;
{ No reason to export that  }
procedure VSIInstallZipFileHandler;cdecl;external;
{ No reason to export that  }
procedure VSIInstallStdinHandler;cdecl;external;
{ No reason to export that  }
procedure VSIInstallHdfsHandler;cdecl;external;
{ No reason to export that  }
procedure VSIInstallWebHdfsHandler;cdecl;external;
{ No reason to export that  }
procedure VSIInstallStdoutHandler;cdecl;external;
{ No reason to export that  }
procedure VSIInstallSparseFileHandler;cdecl;external;
procedure VSIInstallTarFileHandler;cdecl;external;
{ No reason to export that  }
procedure VSIInstallCachedFileHandler;cdecl;external;
{ No reason to export that  }
procedure VSIInstallCryptFileHandler;cdecl;external;
(* Const before type ignored *)
procedure VSISetCryptKey(pabyKey:PGByte; nKeySize:longint);cdecl;external;
{! @cond Doxygen_Suppress  }
procedure VSICleanupFileManager;cdecl;external;
{! @endcond  }
(* Const before type ignored *)
(* Const before type ignored *)
function VSIDuplicateFileSystemHandler(pszSourceFSName:Pchar; pszNewFSName:Pchar):Tbool;cdecl;external;
(* Const before type ignored *)
function VSIFileFromMemBuffer(pszFilename:Pchar; pabyData:PGByte; nDataLength:Tvsi_l_offset; bTakeOwnership:longint):PVSILFILE;cdecl;external;
(* Const before type ignored *)
function VSIGetMemFileBuffer(pszFilename:Pchar; pnDataLength:Pvsi_l_offset; bUnlinkAndSeize:longint):PGByte;cdecl;external;
{* Callback used by VSIStdoutSetRedirection()  }
(* Const before type ignored *)
type

  TVSIWriteFunction = function (ptr:pointer; size:Tsize_t; nmemb:Tsize_t; stream:PFILE):Tsize_t;cdecl;

procedure VSIStdoutSetRedirection(pFct:TVSIWriteFunction; stream:PFILE);cdecl;external;
{*
 * Return information about a handle. Optional (driver dependent)
 * @since GDAL 3.0
  }
(* Const before type ignored *)
type

  TVSIFilesystemPluginStatCallback = function (pUserData:pointer; pszFilename:Pchar; pStatBuf:PVSIStatBufL; nFlags:longint):longint;cdecl;
{*
 * Remove handle by name. Optional
 * @since GDAL 3.0
  }
(* Const before type ignored *)

  TVSIFilesystemPluginUnlinkCallback = function (pUserData:pointer; pszFilename:Pchar):longint;cdecl;
{*
 * Rename handle. Optional
 * @since GDAL 3.0
  }
(* Const before type ignored *)
(* Const before type ignored *)

  TVSIFilesystemPluginRenameCallback = function (pUserData:pointer; oldpath:Pchar; newpath:Pchar):longint;cdecl;
{*
 * Create Directory. Optional
 * @since GDAL 3.0
  }
(* Const before type ignored *)

  TVSIFilesystemPluginMkdirCallback = function (pUserData:pointer; pszDirname:Pchar; nMode:longint):longint;cdecl;
{*
 *  Delete Directory. Optional
 * @since GDAL 3.0
  }
(* Const before type ignored *)

  TVSIFilesystemPluginRmdirCallback = function (pUserData:pointer; pszDirname:Pchar):longint;cdecl;
{*
 * List directory content. Optional
 * @since GDAL 3.0
  }
(* Const before type ignored *)

  PVSIFilesystemPluginReadDirCallback = ^TVSIFilesystemPluginReadDirCallback;
  TVSIFilesystemPluginReadDirCallback = function (pUserData:pointer; pszDirname:Pchar; nMaxFiles:longint):PPchar;cdecl;
{*
 * List related files. Must return NULL if unknown, or a list of relative
 * filenames that can be opened along the main file. If no other file than
 * pszFilename needs to be opened, return static_cast<char**>
 * (CPLCalloc(1,sizeof(char*)));
 *
 * Optional
 * @since GDAL 3.2
  }
(* Const before type ignored *)

  PVSIFilesystemPluginSiblingFilesCallback = ^TVSIFilesystemPluginSiblingFilesCallback;
  TVSIFilesystemPluginSiblingFilesCallback = function (pUserData:pointer; pszDirname:Pchar):PPchar;cdecl;
{*
 * Open a handle. Mandatory. Returns an opaque pointer that will be used in
 * subsequent file I/O calls. Should return null and/or set errno if the handle
 * does not exist or the access mode is incorrect.
 * @since GDAL 3.0
  }
(* Const before type ignored *)
(* Const before type ignored *)

  PVSIFilesystemPluginOpenCallback = ^TVSIFilesystemPluginOpenCallback;
  TVSIFilesystemPluginOpenCallback = function (pUserData:pointer; pszFilename:Pchar; pszAccess:Pchar):pointer;cdecl;
{*
 * Return current position in handle. Mandatory
 * @since GDAL 3.0
  }

  TVSIFilesystemPluginTellCallback = function (pFile:pointer):Tvsi_l_offset;cdecl;
{*
 * Seek to position in handle. Mandatory except for write only handles
 * @since GDAL 3.0
  }

  TVSIFilesystemPluginSeekCallback = function (pFile:pointer; nOffset:Tvsi_l_offset; nWhence:longint):longint;cdecl;
{*
 * Read data from current position, returns the number of blocks correctly read.
 * Mandatory except for write only handles
 * @since GDAL 3.0
  }

  TVSIFilesystemPluginReadCallback = function (pFile:pointer; pBuffer:pointer; nSize:Tsize_t; nCount:Tsize_t):Tsize_t;cdecl;
{*
 * Read from multiple offsets. Optional, will be replaced by multiple calls to
 * Read() if not provided
 * @since GDAL 3.0
  }
(* Const before type ignored *)
(* Const before type ignored *)

  TVSIFilesystemPluginReadMultiRangeCallback = function (pFile:pointer; nRanges:longint; ppData:Ppointer; panOffsets:Pvsi_l_offset; panSizes:Psize_t):longint;cdecl;
{*
 * Get empty ranges. Optional
 * @since GDAL 3.0
  }

  TVSIFilesystemPluginGetRangeStatusCallback = function (pFile:pointer; nOffset:Tvsi_l_offset; nLength:Tvsi_l_offset):TVSIRangeStatus;cdecl;
{*
 * Has end of file been reached. Mandatory? for read handles.
 * @since GDAL 3.0
  }

  TVSIFilesystemPluginEofCallback = function (pFile:pointer):longint;cdecl;
{*
 * Write bytes at current offset. Mandatory for writable handles
 * @since GDAL 3.0
  }
(* Const before type ignored *)

  TVSIFilesystemPluginWriteCallback = function (pFile:pointer; pBuffer:pointer; nSize:Tsize_t; nCount:Tsize_t):Tsize_t;cdecl;
{*
 * Sync written bytes. Optional
 * @since GDAL 3.0
  }

  TVSIFilesystemPluginFlushCallback = function (pFile:pointer):longint;cdecl;
{*
 * Truncate handle. Mandatory (driver dependent?) for write handles
  }

  TVSIFilesystemPluginTruncateCallback = function (pFile:pointer; nNewSize:Tvsi_l_offset):longint;cdecl;
{*
 * Close file handle. Optional
 * @since GDAL 3.0
  }

  TVSIFilesystemPluginCloseCallback = function (pFile:pointer):longint;cdecl;
{*
 * This optional method is called when code plans to access soon one or several
 * ranges in a file. Some file systems may be able to use this hint to
 * for example asynchronously start such requests.
 *
 * Offsets may be given in a non-increasing order, and may potentially
 * overlap.
 *
 * @param pFile File handle.
 * @param nRanges Size of the panOffsets and panSizes arrays.
 * @param panOffsets Array containing the start offset of each range.
 * @param panSizes Array containing the size (in bytes) of each range.
 * @since GDAL 3.7
  }
(* Const before type ignored *)
(* Const before type ignored *)

  TVSIFilesystemPluginAdviseReadCallback = procedure (pFile:pointer; nRanges:longint; panOffsets:Pvsi_l_offset; panSizes:Psize_t);cdecl;
{*
 * struct containing callbacks to used by the handler.
 * (rw), (r), (w) or () at the end indicate whether the given callback is
 * mandatory for reading and or writing handlers. A (?) indicates that the
 * callback might be mandatory for certain drivers only.
 * @since GDAL 3.0
  }
{*
     * Optional opaque pointer passed back to filemanager callbacks (e.g. open,
     * stat, rmdir)
      }
{*< stat handle by name (rw) }
{*< unlink handle by name () }
{*< rename handle () }
{*< make directory () }
{*< remove directory () }
{*< list directory content (r?) }
{*< open handle by name (rw)  }
{*< get current position of handle (rw)  }
{*< set current position of handle (rw)  }
{*< read from current position (r)  }
{*< read multiple blocks () }
{*< get range status ()  }
{*< has end of file been reached (r?)  }
{*< write bytes to current position (w)  }
{*< sync bytes (w)  }
{*< truncate handle (w?)  }
{*< close handle  (rw)  }
{*< buffer small reads (makes handler read only)  }
{*< max mem to use per file when buffering  }
{*< list related files }
{* The following optional member has been added in GDAL 3.7:  }
{*< AdviseRead()  }
{
        Callbacks are defined as a struct allocated by a call to
       VSIAllocFilesystemPluginCallbacksStruct in order to try to maintain ABI
       stability when eventually adding a new member. Any callbacks added to
       this struct SHOULD be added to the END of this struct
     }

  PVSIFilesystemPluginCallbacksStruct = ^TVSIFilesystemPluginCallbacksStruct;
  TVSIFilesystemPluginCallbacksStruct = record
      pUserData : pointer;
      stat : TVSIFilesystemPluginStatCallback;
      unlink : TVSIFilesystemPluginUnlinkCallback;
      rename : TVSIFilesystemPluginRenameCallback;
      mkdir : TVSIFilesystemPluginMkdirCallback;
      rmdir : TVSIFilesystemPluginRmdirCallback;
      read_dir : TVSIFilesystemPluginReadDirCallback;
      open : TVSIFilesystemPluginOpenCallback;
      tell : TVSIFilesystemPluginTellCallback;
      seek : TVSIFilesystemPluginSeekCallback;
      read : TVSIFilesystemPluginReadCallback;
      read_multi_range : TVSIFilesystemPluginReadMultiRangeCallback;
      get_range_status : TVSIFilesystemPluginGetRangeStatusCallback;
      eof : TVSIFilesystemPluginEofCallback;
      write : TVSIFilesystemPluginWriteCallback;
      flush : TVSIFilesystemPluginFlushCallback;
      truncate : TVSIFilesystemPluginTruncateCallback;
      close : TVSIFilesystemPluginCloseCallback;
      nBufferSize : Tsize_t;
      nCacheSize : Tsize_t;
      sibling_files : TVSIFilesystemPluginSiblingFilesCallback;
      advise_read : TVSIFilesystemPluginAdviseReadCallback;
    end;
{*
 * return a VSIFilesystemPluginCallbacksStruct to be populated at runtime with
 * handler callbacks
 * @since GDAL 3.0
  }

function VSIAllocFilesystemPluginCallbacksStruct:PVSIFilesystemPluginCallbacksStruct;cdecl;external;
{*
 * free resources allocated by VSIAllocFilesystemPluginCallbacksStruct
 * @since GDAL 3.0
  }
procedure VSIFreeFilesystemPluginCallbacksStruct(poCb:PVSIFilesystemPluginCallbacksStruct);cdecl;external;
{*
 * register a handler on the given prefix. All IO on datasets opened with the
 * filename /prefix/xxxxxx will go through these callbacks. pszPrefix must begin
 * and end with a '/'
 * @since GDAL 3.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
function VSIInstallPluginHandler(pszPrefix:Pchar; poCb:PVSIFilesystemPluginCallbacksStruct):longint;cdecl;external;
{ ====================================================================  }
{      Time querying.                                                   }
{ ====================================================================  }
{! @cond Doxygen_Suppress  }
function VSITime(para1:Pdword):dword;cdecl;external;
(* Const before type ignored *)
function VSICTime(para1:dword):Pchar;cdecl;external;
(* Const before type ignored *)
function VSIGMTime(pnTime:Ptime_t; poBrokenTime:Ptm):Ptm;cdecl;external;
(* Const before type ignored *)
function VSILocalTime(pnTime:Ptime_t; poBrokenTime:Ptm):Ptm;cdecl;external;
{! @endcond  }
{! @cond Doxygen_Suppress  }
{ --------------------------------------------------------------------  }
{      the following can be turned on for detailed logging of           }
{      almost all IO calls.                                             }
{ --------------------------------------------------------------------  }
{$ifdef VSI_DEBUG}
{$ifndef DEBUG}
{$define DEBUG}
{$endif}
{$include "cpl_error.h"}
{$endif}
{ ndef CPL_VSI_H_INCLUDED  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VSI_ISLNK(x : longint) : longint;
begin
  VSI_ISLNK:=0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function VSI_ISREG(x : longint) : Tx;
begin
  VSI_ISREG:=Tx(@(S_IFREG));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function VSI_ISDIR(x : longint) : Tx;
begin
  VSI_ISDIR:=Tx(@(S_IFDIR));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function VSI_ISCHR(x : longint) : Tx;
begin
  VSI_ISCHR:=Tx(@(S_IFCHR));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VSI_ISBLK(x : longint) : longint;
begin
  VSI_ISBLK:=0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VSI_ISLNK(x : longint) : longint;
begin
  VSI_ISLNK:=S_ISLNK(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VSI_ISREG(x : longint) : longint;
begin
  VSI_ISREG:=S_ISREG(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VSI_ISDIR(x : longint) : longint;
begin
  VSI_ISDIR:=S_ISDIR(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VSI_ISCHR(x : longint) : longint;
begin
  VSI_ISCHR:=S_ISCHR(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VSI_ISBLK(x : longint) : longint;
begin
  VSI_ISBLK:=S_ISBLK(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VSI_MALLOC_ALIGNED_AUTO_VERBOSE(size : longint) : longint;
begin
  VSI_MALLOC_ALIGNED_AUTO_VERBOSE:=VSIMallocAlignedAutoVerbose(size,__FILE__,__LINE__);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VSI_MALLOC_VERBOSE(size : longint) : longint;
begin
  VSI_MALLOC_VERBOSE:=VSIMallocVerbose(size,__FILE__,__LINE__);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VSI_MALLOC2_VERBOSE(nSize1,nSize2 : longint) : longint;
begin
  VSI_MALLOC2_VERBOSE:=VSIMalloc2Verbose(nSize1,nSize2,__FILE__,__LINE__);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VSI_MALLOC3_VERBOSE(nSize1,nSize2,nSize3 : longint) : longint;
begin
  VSI_MALLOC3_VERBOSE:=VSIMalloc3Verbose(nSize1,nSize2,nSize3,__FILE__,__LINE__);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VSI_CALLOC_VERBOSE(nCount,nSize : longint) : longint;
begin
  VSI_CALLOC_VERBOSE:=VSICallocVerbose(nCount,nSize,__FILE__,__LINE__);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VSI_REALLOC_VERBOSE(pOldPtr,nNewSize : longint) : longint;
begin
  VSI_REALLOC_VERBOSE:=VSIReallocVerbose(pOldPtr,nNewSize,__FILE__,__LINE__);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VSI_STRDUP_VERBOSE(pszStr : longint) : longint;
begin
  VSI_STRDUP_VERBOSE:=VSIStrdupVerbose(pszStr,__FILE__,__LINE__);
end;


end.
