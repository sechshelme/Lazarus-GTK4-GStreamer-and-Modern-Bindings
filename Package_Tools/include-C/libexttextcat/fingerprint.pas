unit fingerprint;

interface

uses
  fp_exetextcat;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C++; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*-  }
{$ifndef _FINGERPRINT_H_}
{$define _FINGERPRINT_H_}
{ 
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
{$include "common.h"}
{$include "textcat_properties.h"}

function fp_Init(name:Pchar):pointer;cdecl;external libexttextcat;
procedure fp_Done(handle:pointer);cdecl;external libexttextcat;
function fp_Create(handle:pointer; buffer:Pchar; bufsize:Tuint4; maxngrams:Tuint4):longint;cdecl;external libexttextcat;
function fp_SetProperty(handle:pointer; _property:Ttextcat_Property; value:Tsint4):longint;cdecl;external libexttextcat;
function fp_Read(handle:pointer; fname:Pchar; maxngrams:longint):longint;cdecl;external libexttextcat;
function fp_Compare(cat:pointer; unknown:pointer; cutoff:longint):Tsint4;cdecl;external libexttextcat;
procedure fp_Show(handle:pointer);cdecl;external libexttextcat;
function fp_Name(handle:pointer):Pchar;cdecl;external libexttextcat;
procedure fp_Print(handle:pointer; fp:PFILE);cdecl;external libexttextcat;
{ C++ end of extern C conditionnal removed }
{$endif}
{ vim:set shiftwidth=4 softtabstop=4 expandtab:  }

// === Konventiert am: 9-11-26 19:45:32 ===


implementation



end.
