unit cpl_spawn;

interface

uses
  fp_gdal;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*********************************************************************
 * $Id$
 *
 * Project:  CPL - Common Portability Library
 * Purpose:  Implement CPLSystem().
 * Author:   Even Rouault, <even dot rouault at spatialys.com>
 *
 **********************************************************************
 * Copyright (c) 2013, Even Rouault <even dot rouault at spatialys.com>
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
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *************************************************************************** }
{$ifndef CPL_SPAWN_H_INCLUDED}
{$define CPL_SPAWN_H_INCLUDED}
{$include "cpl_vsi.h"}
{ --------------------------------------------------------------------  }
{      Spawn a process.                                                 }
{ --------------------------------------------------------------------  }

function CPLSpawn(papszArgv:PPchar; fin:PVSILFILE; fout:PVSILFILE; bDisplayErr:longint):longint;cdecl;external libgdal;
{$ifdef WIN32}
{$include <windows.h>}
type
  PCPL_FILE_HANDLE = ^TCPL_FILE_HANDLE;
  TCPL_FILE_HANDLE = THANDLE;

const
  CPL_FILE_INVALID_HANDLE = CPL_NULLPTR;  
type
  PCPL_PID = ^TCPL_PID;
  TCPL_PID = TDWORD;
{$else}
{$include <sys/types.h>}
type
  PCPL_FILE_HANDLE = ^TCPL_FILE_HANDLE;
  TCPL_FILE_HANDLE = longint;

const
  CPL_FILE_INVALID_HANDLE = -(1);  
type
  PCPL_PID = ^TCPL_PID;
  TCPL_PID = Tpid_t;
{$endif}
type

function CPLSpawnAsync(pfnMain:function (para1:TCPL_FILE_HANDLE; para2:TCPL_FILE_HANDLE):longint; papszArgv:PPchar; bCreateInputPipe:longint; bCreateOutputPipe:longint; bCreateErrorPipe:longint; 
           papszOptions:PPchar):PCPLSpawnedProcess;cdecl;external libgdal;
function CPLSpawnAsyncGetChildProcessId(p:PCPLSpawnedProcess):TCPL_PID;cdecl;external libgdal;
function CPLSpawnAsyncFinish(p:PCPLSpawnedProcess; bWait:longint; bKill:longint):longint;cdecl;external libgdal;
function CPLSpawnAsyncGetInputFileHandle(p:PCPLSpawnedProcess):TCPL_FILE_HANDLE;cdecl;external libgdal;
function CPLSpawnAsyncGetOutputFileHandle(p:PCPLSpawnedProcess):TCPL_FILE_HANDLE;cdecl;external libgdal;
function CPLSpawnAsyncGetErrorFileHandle(p:PCPLSpawnedProcess):TCPL_FILE_HANDLE;cdecl;external libgdal;
procedure CPLSpawnAsyncCloseInputFileHandle(p:PCPLSpawnedProcess);cdecl;external libgdal;
procedure CPLSpawnAsyncCloseOutputFileHandle(p:PCPLSpawnedProcess);cdecl;external libgdal;
procedure CPLSpawnAsyncCloseErrorFileHandle(p:PCPLSpawnedProcess);cdecl;external libgdal;
function CPLPipeRead(fin:TCPL_FILE_HANDLE; data:pointer; length:longint):longint;cdecl;external libgdal;
function CPLPipeWrite(fout:TCPL_FILE_HANDLE; data:pointer; length:longint):longint;cdecl;external libgdal;
{$endif}
{ CPL_SPAWN_H_INCLUDED }

// === Konventiert am: 2-10-26 16:32:58 ===


implementation



end.
