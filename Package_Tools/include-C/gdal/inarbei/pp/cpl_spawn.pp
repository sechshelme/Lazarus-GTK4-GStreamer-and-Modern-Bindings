
unit cpl_spawn;
interface

{
  Automatically converted by H2Pas 1.0.0 from cpl_spawn.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cpl_spawn.h
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
PCPL_FILE_HANDLE  = ^CPL_FILE_HANDLE;
PCPL_PID  = ^CPL_PID;
PCPLSpawnedProcess  = ^CPLSpawnedProcess;
PVSILFILE  = ^VSILFILE;
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
(* Const before type ignored *)
(* Const before declarator ignored *)

function CPLSpawn(papszArgv:PPchar; fin:PVSILFILE; fout:PVSILFILE; bDisplayErr:longint):longint;cdecl;external;
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
(* Const before type ignored *)
(* Const before declarator ignored *)

function CPLSpawnAsync(pfnMain:function (para1:TCPL_FILE_HANDLE; para2:TCPL_FILE_HANDLE):longint; papszArgv:PPchar; bCreateInputPipe:longint; bCreateOutputPipe:longint; bCreateErrorPipe:longint; 
           papszOptions:PPchar):PCPLSpawnedProcess;cdecl;external;
function CPLSpawnAsyncGetChildProcessId(p:PCPLSpawnedProcess):TCPL_PID;cdecl;external;
function CPLSpawnAsyncFinish(p:PCPLSpawnedProcess; bWait:longint; bKill:longint):longint;cdecl;external;
function CPLSpawnAsyncGetInputFileHandle(p:PCPLSpawnedProcess):TCPL_FILE_HANDLE;cdecl;external;
function CPLSpawnAsyncGetOutputFileHandle(p:PCPLSpawnedProcess):TCPL_FILE_HANDLE;cdecl;external;
function CPLSpawnAsyncGetErrorFileHandle(p:PCPLSpawnedProcess):TCPL_FILE_HANDLE;cdecl;external;
procedure CPLSpawnAsyncCloseInputFileHandle(p:PCPLSpawnedProcess);cdecl;external;
procedure CPLSpawnAsyncCloseOutputFileHandle(p:PCPLSpawnedProcess);cdecl;external;
procedure CPLSpawnAsyncCloseErrorFileHandle(p:PCPLSpawnedProcess);cdecl;external;
function CPLPipeRead(fin:TCPL_FILE_HANDLE; data:pointer; length:longint):longint;cdecl;external;
(* Const before type ignored *)
function CPLPipeWrite(fout:TCPL_FILE_HANDLE; data:pointer; length:longint):longint;cdecl;external;
{$endif}
{ CPL_SPAWN_H_INCLUDED }

implementation


end.
