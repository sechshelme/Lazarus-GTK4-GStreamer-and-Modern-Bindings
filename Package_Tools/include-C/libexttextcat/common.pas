unit common;

interface

uses
  fp_exetextcat;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C++; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*-  }
{$ifndef _COMMON_H_}
{$define _COMMON_H_}
{*
 * common.h
 *
 * Copyright (C) 2003 WiseGuys Internet B.V.
 *
 * THE BSD LICENSE
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 
 * - Redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer.
 * 
 * - Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the
 * distribution.
 * 
 * - Neither the name of the WiseGuys Internet B.V. nor the names of
 * its contributors may be used to endorse or promote products derived
 * from this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  }
{$include <stdio.h>}
{$include <stdlib.h>}
{$if defined(_MSC_VER) && _MSC_VER < 1600}
type
  Pint8_t = ^Tint8_t;
  Tint8_t = shortint;

  Puint8_t = ^Tuint8_t;
  Tuint8_t = byte;

  Pint16_t = ^Tint16_t;
  Tint16_t = smallint;

  Puint16_t = ^Tuint16_t;
  Tuint16_t = word;

  Pint32_t = ^Tint32_t;
  Tint32_t = longint;

  Puint32_t = ^Tuint32_t;
  Tuint32_t = dword;

  Pint64_t = ^Tint64_t;
  Tint64_t = int64;

  Puint64_t = ^Tuint64_t;
  Tuint64_t = qword;
{$else}
{$include <stdint.h>}
{$endif}
type
  Puint4 = ^Tuint4;
  Tuint4 = Tuint32_t;

  Puint2 = ^Tuint2;
  Tuint2 = Tuint16_t;

  Puchar = ^Tuchar;
  Tuchar = Tuint8_t;

  Psint4 = ^Tsint4;
  Tsint4 = Tint32_t;

  Psint2 = ^Tsint2;
  Tsint2 = Tint16_t;

  Pschar = ^Tschar;
  Tschar = Tint8_t;

  Pboole = ^Tboole;
  Tboole = Tint8_t;

function wg_getline(line:Pchar; size:longint; fp:PFILE):Pchar;cdecl;external libexttextcat;
function wg_split(result:PPchar; dest:Pchar; src:Pchar; maxsegments:longint):dword;cdecl;external libexttextcat;
function wg_strgmov(dest:Pchar; src:Pchar; destlimit:Pchar):Pchar;cdecl;external libexttextcat;
function wg_trim(dest:Pchar; src:Pchar):Pchar;cdecl;external libexttextcat;
{ C++ end of extern C conditionnal removed }
{$endif}
{ vim:set shiftwidth=4 softtabstop=4 expandtab:  }

// === Konventiert am: 9-11-26 19:45:39 ===


implementation



end.
