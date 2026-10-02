
unit cpl_string;
interface

{
  Automatically converted by H2Pas 1.0.0 from cpl_string.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cpl_string.h
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
PCPLValueType  = ^CPLValueType;
PFILE  = ^FILE;
PGByte  = ^GByte;
Plongint  = ^longint;
Pwchar_t  = ^wchar_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*********************************************************************
 * $Id$
 *
 * Name:     cpl_string.h
 * Project:  CPL - Common Portability Library
 * Purpose:  String and StringList functions.
 * Author:   Daniel Morissette, dmorissette@mapgears.com
 *
 **********************************************************************
 * Copyright (c) 1998, Daniel Morissette
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
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *************************************************************************** }
{$ifndef CPL_STRING_H_INCLUDED}
{$define CPL_STRING_H_INCLUDED}
{$include "cpl_error.h"}
{$include "cpl_conv.h"}
{$include "cpl_vsi.h"}
{$include <stdbool.h>}
{*
 * \file cpl_string.h
 *
 * Various convenience functions for working with strings and string lists.
 *
 * A StringList is just an array of strings with the last pointer being
 * NULL.  An empty StringList may be either a NULL pointer, or a pointer to
 * a pointer memory location with a NULL value.
 *
 * A common convention for StringLists is to use them to store name/value
 * lists.  In this case the contents are treated like a dictionary of
 * name/value pairs.  The actual data is formatted with each string having
 * the format "<name>:<value>" (though "=" is also an acceptable separator).
 * A number of the functions in the file operate on name/value style
 * string lists (such as CSLSetNameValue(), and CSLFetchNameValue()).
 *
 * To some extent the CPLStringList C++ class can be used to abstract
 * managing string lists a bit but still be able to return them from C
 * functions.
 *
  }
(* Const before type ignored *)

function CSLAddString(papszStrList:PPchar; pszNewString:Pchar):^Pchar;cdecl;external;
(* Const before type ignored *)
function CSLAddStringMayFail(papszStrList:PPchar; pszNewString:Pchar):^Pchar;cdecl;external;
function CSLCount(papszStrList:TCSLConstList):longint;cdecl;external;
(* Const before type ignored *)
function CSLGetField(para1:TCSLConstList; para2:longint):Pchar;cdecl;external;
procedure CSLDestroy(papszStrList:PPchar);cdecl;external;
function CSLDuplicate(papszStrList:TCSLConstList):^Pchar;cdecl;external;
function CSLMerge(papszOrig:PPchar; papszOverride:TCSLConstList):^Pchar;cdecl;external;
(* Const before type ignored *)
function CSLTokenizeString(pszString:Pchar):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CSLTokenizeStringComplex(pszString:Pchar; pszDelimiter:Pchar; bHonourStrings:longint; bAllowEmptyTokens:longint):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CSLTokenizeString2(pszString:Pchar; pszDelimiter:Pchar; nCSLTFlags:longint):^Pchar;cdecl;external;
{* Flag for CSLTokenizeString2() to honour strings  }
const
  CSLT_HONOURSTRINGS = $0001;  
{* Flag for CSLTokenizeString2() to allow empty tokens  }
  CSLT_ALLOWEMPTYTOKENS = $0002;  
{* Flag for CSLTokenizeString2() to preserve quotes  }
  CSLT_PRESERVEQUOTES = $0004;  
{* Flag for CSLTokenizeString2() to preserve escape characters  }
  CSLT_PRESERVEESCAPES = $0008;  
{* Flag for CSLTokenizeString2() to strip leading spaces  }
  CSLT_STRIPLEADSPACES = $0010;  
{* Flag for CSLTokenizeString2() to strip trailaing spaces  }
  CSLT_STRIPENDSPACES = $0020;  

function CSLPrint(papszStrList:TCSLConstList; fpOut:PFILE):longint;cdecl;external;
(* Const before type ignored *)
function CSLLoad(pszFname:Pchar):^Pchar;cdecl;external;
(* Const before type ignored *)
function CSLLoad2(pszFname:Pchar; nMaxLines:longint; nMaxCols:longint; papszOptions:TCSLConstList):^Pchar;cdecl;external;
(* Const before type ignored *)
function CSLSave(papszStrList:TCSLConstList; pszFname:Pchar):longint;cdecl;external;
function CSLInsertStrings(papszStrList:PPchar; nInsertAtLineNo:longint; papszNewLines:TCSLConstList):^Pchar;cdecl;external;
(* Const before type ignored *)
function CSLInsertString(papszStrList:PPchar; nInsertAtLineNo:longint; pszNewLine:Pchar):^Pchar;cdecl;external;
function CSLRemoveStrings(papszStrList:PPchar; nFirstLineToDelete:longint; nNumToRemove:longint; ppapszRetStrings:PPPchar):^Pchar;cdecl;external;
(* Const before type ignored *)
function CSLFindString(papszList:TCSLConstList; pszTarget:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function CSLFindStringCaseSensitive(papszList:TCSLConstList; pszTarget:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function CSLPartialFindString(papszHaystack:TCSLConstList; pszNeedle:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function CSLFindName(papszStrList:TCSLConstList; pszName:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function CSLFetchBoolean(papszStrList:TCSLConstList; pszKey:Pchar; bDefault:longint):longint;cdecl;external;
{ TODO: Deprecate CSLTestBoolean.  Remove in GDAL 3.x.  }
(* Const before type ignored *)
function CSLTestBoolean(pszValue:Pchar):longint;cdecl;external;
{ Do not use CPLTestBoolean in C++ code.  Use CPLTestBool.  }
(* Const before type ignored *)
function CPLTestBoolean(pszValue:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function CPLTestBool(pszValue:Pchar):Tbool;cdecl;external;
(* Const before type ignored *)
function CPLFetchBool(papszStrList:TCSLConstList; pszKey:Pchar; bDefault:Tbool):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CPLParseNameValue(pszNameValue:Pchar; ppszKey:PPchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CSLFetchNameValue(papszStrList:TCSLConstList; pszName:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function CSLFetchNameValueDef(papszStrList:TCSLConstList; pszName:Pchar; pszDefault:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function CSLFetchNameValueMultiple(papszStrList:TCSLConstList; pszName:Pchar):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CSLAddNameValue(papszStrList:PPchar; pszName:Pchar; pszValue:Pchar):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CSLSetNameValue(papszStrList:PPchar; pszName:Pchar; pszValue:Pchar):^Pchar;cdecl;external;
(* Const before type ignored *)
procedure CSLSetNameValueSeparator(papszStrList:PPchar; pszSeparator:Pchar);cdecl;external;
(* Const before type ignored *)
function CSLParseCommandLine(pszCommandLine:Pchar):^Pchar;cdecl;external;
{* Scheme for CPLEscapeString()/CPLUnescapeString() for backlash quoting  }
const
  CPLES_BackslashQuotable = 0;  
{* Scheme for CPLEscapeString()/CPLUnescapeString() for XML  }
  CPLES_XML = 1;  
{* Scheme for CPLEscapeString()/CPLUnescapeString() for URL  }
  CPLES_URL = 2;  
{* Scheme for CPLEscapeString()/CPLUnescapeString() for SQL  }
  CPLES_SQL = 3;  
{* Scheme for CPLEscapeString()/CPLUnescapeString() for CSV  }
  CPLES_CSV = 4;  
{* Scheme for CPLEscapeString()/CPLUnescapeString() for XML (preserves quotes)
  }
  CPLES_XML_BUT_QUOTES = 5;  
{* Scheme for CPLEscapeString()/CPLUnescapeString() for CSV (forced quoting)  }
  CPLES_CSV_FORCE_QUOTING = 6;  
{* Scheme for CPLEscapeString()/CPLUnescapeString() for SQL identifiers  }
  CPLES_SQLI = 7;  
(* Const before type ignored *)

function CPLEscapeString(pszString:Pchar; nLength:longint; nScheme:longint):Pchar;cdecl;external;
(* Const before type ignored *)
function CPLUnescapeString(pszString:Pchar; pnLength:Plongint; nScheme:longint):Pchar;cdecl;external;
(* Const before type ignored *)
function CPLBinaryToHex(nBytes:longint; pabyData:PGByte):Pchar;cdecl;external;
(* Const before type ignored *)
function CPLHexToBinary(pszHex:Pchar; pnBytes:Plongint):PGByte;cdecl;external;
(* Const before type ignored *)
function CPLBase64Encode(nBytes:longint; pabyData:PGByte):Pchar;cdecl;external;
function CPLBase64DecodeInPlace(pszBase64:PGByte):longint;cdecl;external;
{* Type of value  }
{*< String  }
{*< Real number  }
{*< Integer  }
type
  PCPLValueType = ^TCPLValueType;
  TCPLValueType =  Longint;
  Const
    CPL_VALUE_STRING = 0;
    CPL_VALUE_REAL = 1;
    CPL_VALUE_INTEGER = 2;
;
(* Const before type ignored *)

function CPLGetValueType(pszValue:Pchar):TCPLValueType;cdecl;external;
(* Const before type ignored *)
function CPLStrlcpy(pszDest:Pchar; pszSrc:Pchar; nDestSize:Tsize_t):Tsize_t;cdecl;external;
(* Const before type ignored *)
function CPLStrlcat(pszDest:Pchar; pszSrc:Pchar; nDestSize:Tsize_t):Tsize_t;cdecl;external;
(* Const before type ignored *)
function CPLStrnlen(pszStr:Pchar; nMaxLen:Tsize_t):Tsize_t;cdecl;external;
{ --------------------------------------------------------------------  }
{      Locale independent formatting functions.                         }
{ --------------------------------------------------------------------  }
(* Const before type ignored *)
function CPLvsnprintf(str:Pchar; size:Tsize_t; fmt:Pchar; args:Tva_list):longint;cdecl;external;
{ ALIAS_CPLSNPRINTF_AS_SNPRINTF might be defined to enable GCC 7  }
{ -Wformat-truncation= warnings, but shouldn't be set for normal use  }
{$if defined(ALIAS_CPLSNPRINTF_AS_SNPRINTF)}

const
  CPLsnprintf = snprintf;  
{$else}
(* Const before type ignored *)

function CPLsnprintf(str:Pchar; size:Tsize_t; fmt:Pchar; args:array of const):longint;cdecl;external;
function CPLsnprintf(str:Pchar; size:Tsize_t; fmt:Pchar):longint;cdecl;external;
{$endif}
(* Const before type ignored *)

function CPLsprintf(str:Pchar; fmt:Pchar; args:array of const):longint;cdecl;external;
function CPLsprintf(str:Pchar; fmt:Pchar):longint;cdecl;external;
{$endif}
{! @endcond  }
(* Const before type ignored *)

function CPLprintf(fmt:Pchar; args:array of const):longint;cdecl;external;
function CPLprintf(fmt:Pchar):longint;cdecl;external;
{ For some reason Doxygen_Suppress is needed to avoid warning. Not sure why  }
{! @cond Doxygen_Suppress  }
{ caution: only works with limited number of formats  }
(* Const before type ignored *)
(* Const before type ignored *)
function CPLsscanf(str:Pchar; fmt:Pchar; args:array of const):longint;cdecl;external;
function CPLsscanf(str:Pchar; fmt:Pchar):longint;cdecl;external;
{! @endcond  }
(* Const before type ignored *)
(* Const before type ignored *)
function CPLSPrintf(fmt:Pchar; args:array of const):Pchar;cdecl;external;
function CPLSPrintf(fmt:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function CSLAppendPrintf(papszStrList:PPchar; fmt:Pchar; args:array of const):^Pchar;cdecl;external;
function CSLAppendPrintf(papszStrList:PPchar; fmt:Pchar):^Pchar;cdecl;external;
(* Const before type ignored *)
function CPLVASPrintf(buf:PPchar; fmt:Pchar; args:Tva_list):longint;cdecl;external;
{ --------------------------------------------------------------------  }
{      RFC 23 character set conversion/recoding API (cpl_recode.cpp).   }
{ --------------------------------------------------------------------  }
{* Encoding of the current locale  }
const
  CPL_ENC_LOCALE = '';  
{* UTF-8 encoding  }
  CPL_ENC_UTF8 = 'UTF-8';  
{* UTF-16 encoding  }
  CPL_ENC_UTF16 = 'UTF-16';  
{* UCS-2 encoding  }
  CPL_ENC_UCS2 = 'UCS-2';  
{* UCS-4 encoding  }
  CPL_ENC_UCS4 = 'UCS-4';  
{* ASCII encoding  }
  CPL_ENC_ASCII = 'ASCII';  
{* ISO-8859-1 (LATIN1) encoding  }
  CPL_ENC_ISO8859_1 = 'ISO-8859-1';  
(* Const before type ignored *)

function CPLEncodingCharSize(pszEncoding:Pchar):longint;cdecl;external;
{! @cond Doxygen_Suppress  }
procedure CPLClearRecodeWarningFlags;cdecl;external;
{! @endcond  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function CPLRecode(pszSource:Pchar; pszSrcEncoding:Pchar; pszDstEncoding:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function CPLRecodeFromWChar(pwszSource:Pwchar_t; pszSrcEncoding:Pchar; pszDstEncoding:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function CPLRecodeToWChar(pszSource:Pchar; pszSrcEncoding:Pchar; pszDstEncoding:Pchar):Pwchar_t;cdecl;external;
(* Const before type ignored *)
function CPLIsUTF8(pabyData:Pchar; nLen:longint):longint;cdecl;external;
(* Const before type ignored *)
function CPLIsASCII(pabyData:Pchar; nLen:Tsize_t):Tbool;cdecl;external;
(* Const before type ignored *)
function CPLForceToASCII(pabyData:Pchar; nLen:longint; chReplacementChar:char):Pchar;cdecl;external;
(* Const before type ignored *)
function CPLStrlenUTF8(pszUTF8Str:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function CPLCanRecode(pszTestStr:Pchar; pszSrcEncoding:Pchar; pszDstEncoding:Pchar):longint;cdecl;external;
{********************************************************************** }
{                              CPLString                                }
{********************************************************************** }

implementation


end.
