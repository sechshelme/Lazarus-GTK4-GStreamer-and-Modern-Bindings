
unit cpl_conv;
interface

{
  Automatically converted by H2Pas 1.0.0 from cpl_conv.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cpl_conv.h
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
PCPLFileFinder  = ^CPLFileFinder;
PCPLSharedFileInfo  = ^CPLSharedFileInfo;
Pdouble  = ^double;
PFILE  = ^FILE;
Plongint  = ^longint;
Psize_t  = ^size_t;
Ptm  = ^tm;
PVSILFILE  = ^VSILFILE;
PVSIStatBuf  = ^VSIStatBuf;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*****************************************************************************
 * $Id$
 *
 * Project:  CPL - Common Portability Library
 * Purpose:  Convenience functions declarations.
 *           This is intended to remain light weight.
 * Author:   Frank Warmerdam, warmerdam@pobox.com
 *
 ******************************************************************************
 * Copyright (c) 1998, Frank Warmerdam
 * Copyright (c) 2007-2013, Even Rouault <even dot rouault at spatialys.com>
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
{$ifndef CPL_CONV_H_INCLUDED}
{$define CPL_CONV_H_INCLUDED}
{$include "cpl_port.h"}
{$include "cpl_vsi.h"}
{$include "cpl_error.h"}
{*
 * \file cpl_conv.h
 *
 * Various convenience functions for CPL.
 *
  }
{ --------------------------------------------------------------------  }
{      Runtime check of various configuration items.                    }
{ --------------------------------------------------------------------  }
{! @cond Doxygen_Suppress  }

procedure CPLVerifyConfiguration;cdecl;external;
{! @endcond  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function CPLGetConfigOption(para1:Pchar; para2:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function CPLGetThreadLocalConfigOption(para1:Pchar; para2:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function CPLGetGlobalConfigOption(para1:Pchar; para2:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure CPLSetConfigOption(para1:Pchar; para2:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure CPLSetThreadLocalConfigOption(pszKey:Pchar; pszValue:Pchar);cdecl;external;
{* Callback for CPLSubscribeToSetConfigOption()  }
(* Const before type ignored *)
(* Const before type ignored *)
type

  TCPLSetConfigOptionSubscriber = procedure (pszKey:Pchar; pszValue:Pchar; bThreadLocal:Tbool; pUserData:pointer);cdecl;

function CPLSubscribeToSetConfigOption(pfnCallback:TCPLSetConfigOptionSubscriber; pUserData:pointer):longint;cdecl;external;
procedure CPLUnsubscribeToSetConfigOption(nSubscriberId:longint);cdecl;external;
{! @cond Doxygen_Suppress  }
procedure CPLFreeConfig;cdecl;external;
{! @endcond  }
function CPLGetConfigOptions:^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
procedure CPLSetConfigOptions(papszConfigOptions:PPchar);cdecl;external;
function CPLGetThreadLocalConfigOptions:^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
procedure CPLSetThreadLocalConfigOptions(papszConfigOptions:PPchar);cdecl;external;
(* Const before type ignored *)
procedure CPLLoadConfigOptionsFromFile(pszFilename:Pchar; bOverrideEnvVars:longint);cdecl;external;
procedure CPLLoadConfigOptionsFromPredefinedFiles;cdecl;external;
{ --------------------------------------------------------------------  }
{      Safe malloc() API.  Thin cover over VSI functions with fatal     }
{      error reporting if memory allocation fails.                      }
{ --------------------------------------------------------------------  }
function CPLMalloc(para1:Tsize_t):pointer;cdecl;external;
function CPLCalloc(para1:Tsize_t; para2:Tsize_t):pointer;cdecl;external;
function CPLRealloc(para1:pointer; para2:Tsize_t):pointer;cdecl;external;
(* Const before type ignored *)
function CPLStrdup(para1:Pchar):Pchar;cdecl;external;
function CPLStrlwr(para1:Pchar):Pchar;cdecl;external;
{* Alias of VSIFree()  }
const
  CPLFree = VSIFree;  
{ --------------------------------------------------------------------  }
{      Read a line from a text file, and strip of CR/LF.                }
{ --------------------------------------------------------------------  }

function CPLFGets(para1:Pchar; para2:longint; para3:PFILE):Pchar;cdecl;external;
(* Const before type ignored *)
function CPLReadLine(para1:PFILE):Pchar;cdecl;external;
(* Const before type ignored *)
function CPLReadLineL(para1:PVSILFILE):Pchar;cdecl;external;
(* Const before type ignored *)
function CPLReadLine2L(para1:PVSILFILE; para2:longint; para3:TCSLConstList):Pchar;cdecl;external;
(* Const before type ignored *)
function CPLReadLine3L(para1:PVSILFILE; para2:longint; para3:Plongint; para4:TCSLConstList):Pchar;cdecl;external;
{ --------------------------------------------------------------------  }
{      Convert ASCII string to floating point number                   }
{      (THESE FUNCTIONS ARE NOT LOCALE AWARE!).                         }
{ --------------------------------------------------------------------  }
(* Const before type ignored *)
function CPLAtof(para1:Pchar):Tdouble;cdecl;external;
(* Const before type ignored *)
function CPLAtofDelim(para1:Pchar; para2:char):Tdouble;cdecl;external;
(* Const before type ignored *)
function CPLStrtod(para1:Pchar; para2:PPchar):Tdouble;cdecl;external;
(* Const before type ignored *)
function CPLStrtodDelim(para1:Pchar; para2:PPchar; para3:char):Tdouble;cdecl;external;
(* Const before type ignored *)
function CPLStrtof(para1:Pchar; para2:PPchar):single;cdecl;external;
(* Const before type ignored *)
function CPLStrtofDelim(para1:Pchar; para2:PPchar; para3:char):single;cdecl;external;
{ --------------------------------------------------------------------  }
{      Convert number to string.  This function is locale agnostic      }
{      (i.e. it will support "," or "." regardless of current locale)   }
{ --------------------------------------------------------------------  }
(* Const before type ignored *)
function CPLAtofM(para1:Pchar):Tdouble;cdecl;external;
{ --------------------------------------------------------------------  }
{      Read a numeric value from an ASCII character string.             }
{ --------------------------------------------------------------------  }
(* Const before type ignored *)
function CPLScanString(para1:Pchar; para2:longint; para3:longint; para4:longint):Pchar;cdecl;external;
(* Const before type ignored *)
function CPLScanDouble(para1:Pchar; para2:longint):Tdouble;cdecl;external;
(* Const before type ignored *)
function CPLScanLong(para1:Pchar; para2:longint):longint;cdecl;external;
(* Const before type ignored *)
function CPLScanULong(para1:Pchar; para2:longint):dword;cdecl;external;
(* Const before type ignored *)
function CPLScanUIntBig(para1:Pchar; para2:longint):TGUIntBig;cdecl;external;
(* Const before type ignored *)
function CPLAtoGIntBig(pszString:Pchar):TGIntBig;cdecl;external;
(* Const before type ignored *)
function CPLAtoGIntBigEx(pszString:Pchar; bWarn:longint; pbOverflow:Plongint):TGIntBig;cdecl;external;
(* Const before type ignored *)
function CPLScanPointer(para1:Pchar; para2:longint):pointer;cdecl;external;
{ --------------------------------------------------------------------  }
{      Print a value to an ASCII character string.                      }
{ --------------------------------------------------------------------  }
(* Const before type ignored *)
function CPLPrintString(para1:Pchar; para2:Pchar; para3:longint):longint;cdecl;external;
(* Const before type ignored *)
function CPLPrintStringFill(para1:Pchar; para2:Pchar; para3:longint):longint;cdecl;external;
function CPLPrintInt32(para1:Pchar; para2:TGInt32; para3:longint):longint;cdecl;external;
function CPLPrintUIntBig(para1:Pchar; para2:TGUIntBig; para3:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CPLPrintDouble(para1:Pchar; para2:Pchar; para3:Tdouble; para4:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function CPLPrintTime(para1:Pchar; para2:longint; para3:Pchar; para4:Ptm; para5:Pchar):longint;cdecl;external;
function CPLPrintPointer(para1:Pchar; para2:pointer; para3:longint):longint;cdecl;external;
{ --------------------------------------------------------------------  }
{      Fetch a function from DLL / so.                                  }
{ --------------------------------------------------------------------  }
(* Const before type ignored *)
(* Const before type ignored *)
function CPLGetSymbol(para1:Pchar; para2:Pchar):pointer;cdecl;external;
{ --------------------------------------------------------------------  }
{      Fetch executable path.                                           }
{ --------------------------------------------------------------------  }
function CPLGetExecPath(pszPathBuf:Pchar; nMaxLength:longint):longint;cdecl;external;
{ --------------------------------------------------------------------  }
{      Filename handling functions.                                     }
{ --------------------------------------------------------------------  }
(* Const before type ignored *)
(* Const before type ignored *)
function CPLGetPath(para1:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CPLGetDirname(para1:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CPLGetFilename(para1:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CPLGetBasename(para1:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CPLGetExtension(para1:Pchar):Pchar;cdecl;external;
function CPLGetCurrentDir:Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function CPLFormFilename(pszPath:Pchar; pszBasename:Pchar; pszExtension:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function CPLFormCIFilename(pszPath:Pchar; pszBasename:Pchar; pszExtension:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function CPLResetExtension(para1:Pchar; para2:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function CPLProjectRelativeFilename(pszProjectDir:Pchar; pszSecondaryFilename:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function CPLIsFilenameRelative(pszFilename:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function CPLExtractRelativePath(para1:Pchar; para2:Pchar; para3:Plongint):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CPLCleanTrailingSlash(para1:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CPLCorrespondingPaths(pszOldFilename:Pchar; pszNewFilename:Pchar; papszFileList:PPchar):^Pchar;cdecl;external;
function CPLCheckForFile(pszFilename:Pchar; papszSiblingList:PPchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CPLGenerateTempFilename(pszStem:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CPLExpandTilde(pszFilename:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function CPLGetHomeDir:Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function CPLLaunderForFilename(pszName:Pchar; pszOutputPath:Pchar):Pchar;cdecl;external;
{ --------------------------------------------------------------------  }
{      Find File Function                                               }
{ --------------------------------------------------------------------  }
{* Callback for CPLPushFileFinder  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
type
  PCPLFileFinder = ^TCPLFileFinder;
  TCPLFileFinder = function (para1:Pchar; para2:Pchar):Pchar;cdecl;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function CPLFindFile(pszClass:Pchar; pszBasename:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function CPLDefaultFindFile(pszClass:Pchar; pszBasename:Pchar):Pchar;cdecl;external;
procedure CPLPushFileFinder(pfnFinder:TCPLFileFinder);cdecl;external;
function CPLPopFileFinder:TCPLFileFinder;cdecl;external;
(* Const before type ignored *)
procedure CPLPushFinderLocation(para1:Pchar);cdecl;external;
procedure CPLPopFinderLocation;cdecl;external;
procedure CPLFinderClean;cdecl;external;
{ --------------------------------------------------------------------  }
{      Safe version of stat() that works properly on stuff like "C:".   }
{ --------------------------------------------------------------------  }
(* Const before type ignored *)
function CPLStat(para1:Pchar; para2:PVSIStatBuf):longint;cdecl;external;
{ --------------------------------------------------------------------  }
{      Reference counted file handle manager.  Makes sharing file       }
{      handles more practical.                                          }
{ --------------------------------------------------------------------  }
{* Information on a shared file  }
{*< File pointer  }
{*< Reference counter  }
{*< Whether fp must be interpreted as VSIFILE*  }
{*< Filename  }
{*< Access mode  }
type
  PCPLSharedFileInfo = ^TCPLSharedFileInfo;
  TCPLSharedFileInfo = record
      fp : PFILE;
      nRefCount : longint;
      bLarge : longint;
      pszFilename : Pchar;
      pszAccess : Pchar;
    end;
(* Const before type ignored *)
(* Const before type ignored *)

function CPLOpenShared(para1:Pchar; para2:Pchar; para3:longint):PFILE;cdecl;external;
procedure CPLCloseShared(para1:PFILE);cdecl;external;
function CPLGetSharedList(para1:Plongint):PCPLSharedFileInfo;cdecl;external;
procedure CPLDumpSharedList(para1:PFILE);cdecl;external;
{! @cond Doxygen_Suppress  }
procedure CPLCleanupSharedFileMutex;cdecl;external;
{! @endcond  }
{ --------------------------------------------------------------------  }
{      DMS to Dec to DMS conversion.                                    }
{ --------------------------------------------------------------------  }
(* Const before type ignored *)
function CPLDMSToDec(is:Pchar):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CPLDecToDMS(dfAngle:Tdouble; pszAxis:Pchar; nPrecision:longint):Pchar;cdecl;external;
function CPLPackedDMSToDec(para1:Tdouble):Tdouble;cdecl;external;
function CPLDecToPackedDMS(dfDec:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
procedure CPLStringToComplex(pszString:Pchar; pdfReal:Pdouble; pdfImag:Pdouble);cdecl;external;
{ --------------------------------------------------------------------  }
{      Misc other functions.                                            }
{ --------------------------------------------------------------------  }
(* Const before type ignored *)
function CPLUnlinkTree(para1:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CPLCopyFile(pszNewPath:Pchar; pszOldPath:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CPLCopyTree(pszNewPath:Pchar; pszOldPath:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CPLMoveFile(pszNewPath:Pchar; pszOldPath:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CPLSymlink(pszOldPath:Pchar; pszNewPath:Pchar; papszOptions:TCSLConstList):longint;cdecl;external;
{ --------------------------------------------------------------------  }
{      ZIP Creation.                                                    }
{ --------------------------------------------------------------------  }
{! @cond Doxygen_Suppress  }
{$define CPL_ZIP_API_OFFERED}
{! @endcond  }
(* Const before type ignored *)
function CPLCreateZip(pszZipFilename:Pchar; papszOptions:PPchar):pointer;cdecl;external;
(* Const before type ignored *)
function CPLCreateFileInZip(hZip:pointer; pszFilename:Pchar; papszOptions:PPchar):TCPLErr;cdecl;external;
(* Const before type ignored *)
function CPLWriteFileInZip(hZip:pointer; pBuffer:pointer; nBufferSize:longint):TCPLErr;cdecl;external;
function CPLCloseFileInZip(hZip:pointer):TCPLErr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CPLAddFileInZip(hZip:pointer; pszArchiveFilename:Pchar; pszInputFilename:Pchar; fpInput:PVSILFILE; papszOptions:TCSLConstList; 
           pProgressFunc:TGDALProgressFunc; pProgressData:pointer):TCPLErr;cdecl;external;
function CPLCloseZip(hZip:pointer):TCPLErr;cdecl;external;
{ --------------------------------------------------------------------  }
{      ZLib compression                                                 }
{ --------------------------------------------------------------------  }
(* Const before type ignored *)
function CPLZLibDeflate(ptr:pointer; nBytes:Tsize_t; nLevel:longint; outptr:pointer; nOutAvailableBytes:Tsize_t; 
           pnOutBytes:Psize_t):pointer;cdecl;external;
(* Const before type ignored *)
function CPLZLibInflate(ptr:pointer; nBytes:Tsize_t; outptr:pointer; nOutAvailableBytes:Tsize_t; pnOutBytes:Psize_t):pointer;cdecl;external;
{ --------------------------------------------------------------------  }
{      XML validation.                                                  }
{ --------------------------------------------------------------------  }
(* Const before type ignored *)
(* Const before type ignored *)
function CPLValidateXML(pszXMLFilename:Pchar; pszXSDFilename:Pchar; papszOptions:TCSLConstList):longint;cdecl;external;
{ --------------------------------------------------------------------  }
{      Locale handling. Prevents parallel executions of setlocale().    }
{ --------------------------------------------------------------------  }
(* Const before type ignored *)
function CPLsetlocale(category:longint; locale:Pchar):Pchar;cdecl;external;
{! @cond Doxygen_Suppress  }
procedure CPLCleanupSetlocaleMutex;cdecl;external;
{! @endcond  }
{!
    CPLIsPowerOfTwo()
    @param i - tested number
    @return TRUE if i is power of two otherwise return FALSE
 }
function CPLIsPowerOfTwo(i:dword):longint;cdecl;external;
{ --------------------------------------------------------------------  }
{      C++ object for temporarily forcing a LC_NUMERIC locale to "C".   }
{ --------------------------------------------------------------------  }
{! @endcond }
{$endif}
{ ndef CPL_CONV_H_INCLUDED  }

implementation


end.
