
unit textcat;
interface

{
  Automatically converted by H2Pas 1.0.0 from textcat.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    textcat
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
Pcandidate_t  = ^candidate_t;
Pchar  = ^char;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C++; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*-  }
{$ifndef _TEXTCAT_H_}
{$define _TEXTCAT_H_}
{ 
 * textcat.h -- routines for categorizing text
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
{$include "exttextcat-version.h"}
{$include "common.h"}
{$include "textcat_properties.h"}

const
  TEXTCAT_RESULT_UNKNOWN_STR = 'UNKNOWN';  
  TEXTCAT_RESULT_SHORT_STR = 'SHORT';  
  TEXTCAT_RESULT_UNKNOWN = 0;  
  TEXTCAT_RESULT_SHORT = -(2);  
{ Old deprecated bad spelling.  }
  _TEXTCAT_RESULT_UNKOWN = TEXTCAT_RESULT_UNKNOWN_STR;  
  _TEXTCAT_RESULT_SHORT = TEXTCAT_RESULT_SHORT_STR;  
  TEXTCAT_RESULT_UNKOWN = TEXTCAT_RESULT_UNKNOWN;  
(* Const before type ignored *)
type
  Pcandidate_t = ^Tcandidate_t;
  Tcandidate_t = record
      score : longint;
      name : Pchar;
    end;
{*
     * textcat_Init() - Initialize the text classifier. The textfile
     * conffile should contain a list of fingerprint filenames and
     * identification strings for the categories.  The filenames should be
     * reachable from the current working directory. The identification
     * strings will are used in the classification output.
     * 
     * Returns: handle on success, NULL on error. (At the moment, the
     * only way errors can occur, is when the library cannot read the
     * conffile, or one of the fingerprint files listed in it.)
     *
     * Replace older function (and has exacly the same behaviour)
     * see below
      }
(* Const before type ignored *)

function textcat_Init(conffile:Pchar):pointer;cdecl;external;
{*
     * special_textcat_Init() - Initialize the text classifier. This function
     * prepare the classifier as needed by OpenOffice.org. The textfile
     * conffile should contain a list of utf8 fingerprint filenames and
     * identification strings for the categories.prefix will be
     * prepended to the filenames to locate the files. The identification
     * strings will be used in the classification output.
     * 
     * Returns: handle on success, NULL on error. (At the moment, the
     * only way errors can occur, is when the library cannot read the
     * conffile, or one of the fingerprint files listed in it.)
      }
(* Const before type ignored *)
(* Const before type ignored *)
function special_textcat_Init(conffile:Pchar; prefix:Pchar):pointer;cdecl;external;
function textcat_SetProperty(handle:pointer; _property:Ttextcat_Property; value:Tsint4):longint;cdecl;external;
{*
     * textcat_Done() - Free up resources for handle
      }
procedure textcat_Done(handle:pointer);cdecl;external;
{*
     * textcat_Classify() - Give the most likely categories for buffer
     * with length size.
     *
     * Returns: string containing a list of category id's, each one
     * between square brackets, "UNKNOWN" when not recognized, "SHORT" if the
     * document was too short to make a reliable assessment.
     *
     * Performace note: longer buffers take longer to process. However,
     * for many uses it is not necessary to categorize the whole buffer.
     * For language classification, a few hundred bytes will suffice.  
      }
(* Const before type ignored *)
function textcat_Classify(handle:pointer; buffer:Pchar; size:Tsize_t):Pchar;cdecl;external;
{*
     * textcat_GetClassifyFullOutput() - Create a classifier output handler
      }
function textcat_GetClassifyFullOutput(handle:pointer):Pcandidate_t;cdecl;external;
{*
     * textcat_ReleaseClassifyFullOutput() - Free up resources for the
     * classifier output handler
      }
procedure textcat_ReleaseClassifyFullOutput(handle:pointer; candidates:Pcandidate_t);cdecl;external;
{*
     * textcat_ClassifyFull() - Give the most likely categories for buffer
     * with length size.
     *
     * Returns: the numbers of results.
     *
     * Performace note: longer buffers take longer to process. However,
     * for many uses it is not necessary to categorize the whole buffer.
     * For language classification, a few hundred bytes will suffice.
      }
(* Const before type ignored *)
function textcat_ClassifyFull(handle:pointer; buffer:Pchar; size:Tsize_t; candidates:Pcandidate_t):longint;cdecl;external;
{*
     * textcat_Version() - Returns a string describing the version of this
     * classifier.
      }
(* Const before type ignored *)
function textcat_Version:Pchar;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ vim:set shiftwidth=4 softtabstop=4 expandtab:  }

implementation


end.
