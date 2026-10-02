unit cpl_http;

interface

uses
  fp_gdal;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*****************************************************************************
 * $Id$
 *
 * Project:  Common Portability Library
 * Purpose:  Function wrapper for libcurl HTTP access.
 * Author:   Frank Warmerdam, warmerdam@pobox.com
 *
 ******************************************************************************
 * Copyright (c) 2006, Frank Warmerdam
 * Copyright (c) 2009, Even Rouault <even dot rouault at spatialys.com>
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
{$ifndef CPL_HTTP_H_INCLUDED}
{$define CPL_HTTP_H_INCLUDED}
{$include "cpl_conv.h"}
{$include "cpl_string.h"}
{$include "cpl_progress.h"}
{$include "cpl_vsi.h"}
{*
 * \file cpl_http.h
 *
 * Interface for downloading HTTP, FTP documents
  }
{! @cond Doxygen_Suppress  }
{$ifndef CPL_HTTP_MAX_RETRY}

const
  CPL_HTTP_MAX_RETRY = 0;  
{$endif}
{$ifndef CPL_HTTP_RETRY_DELAY}

const
  CPL_HTTP_RETRY_DELAY = 30.0;  
{$endif}
{! @endcond  }
{! Describe a part of a multipart message  }
{! NULL terminated array of headers  }{! Buffer with data of the part      }{! Buffer length                     }type
  PCPLMimePart = ^TCPLMimePart;
  TCPLMimePart = record
      papszHeaders : ^Pchar;
      pabyData : PGByte;
      nDataLen : longint;
    end;
{! Describe the result of a CPLHTTPFetch() call  }
{! cURL error code : 0=success, non-zero if request failed  }
{! Content-Type of the response  }
{! Error message from curl, or NULL  }
{! Length of the pabyData buffer  }
{! Allocated size of the pabyData buffer  }
{! Buffer with downloaded data  }
{! Headers returned  }
{! Number of parts in a multipart message  }
{! Array of parts (resolved by CPLHTTPParseMultipartMime())  }

  PCPLHTTPResult = ^TCPLHTTPResult;
  TCPLHTTPResult = record
      nStatus : longint;
      pszContentType : Pchar;
      pszErrBuf : Pchar;
      nDataLen : longint;
      nDataAlloc : longint;
      pabyData : PGByte;
      papszHeaders : ^Pchar;
      nMimePartCount : longint;
      pasMimePart : PCPLMimePart;
    end;
{! @cond Doxygen_Suppress  }

  TCPLHTTPFetchWriteFunc = function (pBuffer:pointer; nSize:Tsize_t; nMemb:Tsize_t; pWriteArg:pointer):Tsize_t;cdecl;
{! @endcond  }

function CPLHTTPEnabled:longint;cdecl;external libgdal;
function CPLHTTPFetch(pszURL:Pchar; papszOptions:TCSLConstList):PCPLHTTPResult;cdecl;external libgdal;
function CPLHTTPFetchEx(pszURL:Pchar; papszOptions:TCSLConstList; pfnProgress:TGDALProgressFunc; pProgressArg:pointer; pfnWrite:TCPLHTTPFetchWriteFunc; 
           pWriteArg:pointer):PCPLHTTPResult;cdecl;external libgdal;
function CPLHTTPMultiFetch(papszURL:PPchar; nURLCount:longint; nMaxSimultaneous:longint; papszOptions:TCSLConstList):^PCPLHTTPResult;cdecl;external libgdal;
procedure CPLHTTPCleanup;cdecl;external libgdal;
procedure CPLHTTPDestroyResult(psResult:PCPLHTTPResult);cdecl;external libgdal;
procedure CPLHTTPDestroyMultiResult(papsResults:PPCPLHTTPResult; nCount:longint);cdecl;external libgdal;
function CPLHTTPParseMultipartMime(psResult:PCPLHTTPResult):longint;cdecl;external libgdal;
procedure CPLHTTPSetDefaultUserAgent(pszUserAgent:Pchar);cdecl;external libgdal;
{ --------------------------------------------------------------------  }
{ To install an alternate network layer to the default Curl one         }
{ --------------------------------------------------------------------  }
{* Callback function to process network requests.
 *
 * If CLOSE_PERSISTENT is found in papszOptions, no network request should be
 * issued, but a dummy non-null CPLHTTPResult* should be returned by the
 * callback.
 *
 * Its first arguments are the same as CPLHTTPFetchEx()
 * @param pszURL See CPLHTTPFetchEx()
 * @param papszOptions See CPLHTTPFetchEx()
 * @param pfnProgress See CPLHTTPFetchEx()
 * @param pProgressArg See CPLHTTPFetchEx()
 * @param pfnWrite See CPLHTTPFetchEx()
 * @param pWriteArg See CPLHTTPFetchEx()
 * @param pUserData user data value that was passed during
 * CPLHTTPPushFetchCallback()
 * @return nullptr if the request cannot be processed, in which case the
 * previous handler will be used.
  }
type
  PCPLHTTPFetchCallbackFunc = ^TCPLHTTPFetchCallbackFunc;
  TCPLHTTPFetchCallbackFunc = function (pszURL:Pchar; papszOptions:TCSLConstList; pfnProgress:TGDALProgressFunc; pProgressArg:pointer; pfnWrite:TCPLHTTPFetchWriteFunc; 
               pWriteArg:pointer; pUserData:pointer):PCPLHTTPResult;cdecl;

procedure CPLHTTPSetFetchCallback(pFunc:TCPLHTTPFetchCallbackFunc; pUserData:pointer);cdecl;external libgdal;
function CPLHTTPPushFetchCallback(pFunc:TCPLHTTPFetchCallbackFunc; pUserData:pointer):longint;cdecl;external libgdal;
function CPLHTTPPopFetchCallback:longint;cdecl;external libgdal;
{ --------------------------------------------------------------------  }
{      The following is related to OAuth2 authorization around          }
{      google services like fusion tables, and potentially others       }
{      in the future.  Code in cpl_google_oauth2.cpp.                   }
{                                                                       }
{      These services are built on CPL HTTP services.                   }
{ --------------------------------------------------------------------  }
function GOA2GetAuthorizationURL(pszScope:Pchar):Pchar;cdecl;external libgdal;
function GOA2GetRefreshToken(pszAuthToken:Pchar; pszScope:Pchar):Pchar;cdecl;external libgdal;
function GOA2GetAccessToken(pszRefreshToken:Pchar; pszScope:Pchar):Pchar;cdecl;external libgdal;
function GOA2GetAccessTokenFromServiceAccount(pszPrivateKey:Pchar; pszClientEmail:Pchar; pszScope:Pchar; papszAdditionalClaims:TCSLConstList; papszOptions:TCSLConstList):^Pchar;cdecl;external libgdal;
function GOA2GetAccessTokenFromCloudEngineVM(papszOptions:TCSLConstList):^Pchar;cdecl;external libgdal;
{$endif}
{ ndef CPL_HTTP_H_INCLUDED  }

// === Konventiert am: 2-10-26 15:57:06 ===


implementation



end.
