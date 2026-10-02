/**********************************************************************
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
 ****************************************************************************/

#ifndef CPL_STRING_H_INCLUDED
#define CPL_STRING_H_INCLUDED

#include "cpl_error.h"
#include "cpl_conv.h"
#include "cpl_vsi.h"

#include <stdbool.h>

/**
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
 */



char  **CSLAddString(char **papszStrList,
                            const char *pszNewString) ;
char  **
CSLAddStringMayFail(char **papszStrList,
                    const char *pszNewString) ;
int  CSLCount(CSLConstList papszStrList);
const char  *CSLGetField(CSLConstList, int);
void   CSLDestroy(char **papszStrList);
char  **CSLDuplicate(CSLConstList papszStrList) ;
char  **CSLMerge(char **papszOrig,
                        CSLConstList papszOverride) ;

char  **CSLTokenizeString(const char *pszString) ;
char  **
CSLTokenizeStringComplex(const char *pszString, const char *pszDelimiter,
                         int bHonourStrings,
                         int bAllowEmptyTokens) ;
char  **CSLTokenizeString2(const char *pszString,
                                  const char *pszDelimiter,
                                  int nCSLTFlags) ;

/** Flag for CSLTokenizeString2() to honour strings */
#define CSLT_HONOURSTRINGS 0x0001
/** Flag for CSLTokenizeString2() to allow empty tokens */
#define CSLT_ALLOWEMPTYTOKENS 0x0002
/** Flag for CSLTokenizeString2() to preserve quotes */
#define CSLT_PRESERVEQUOTES 0x0004
/** Flag for CSLTokenizeString2() to preserve escape characters */
#define CSLT_PRESERVEESCAPES 0x0008
/** Flag for CSLTokenizeString2() to strip leading spaces */
#define CSLT_STRIPLEADSPACES 0x0010
/** Flag for CSLTokenizeString2() to strip trailaing spaces */
#define CSLT_STRIPENDSPACES 0x0020

int  CSLPrint(CSLConstList papszStrList, FILE *fpOut);
char  **CSLLoad(const char *pszFname) ;
char  **CSLLoad2(const char *pszFname, int nMaxLines, int nMaxCols,
                        CSLConstList papszOptions) ;
int  CSLSave(CSLConstList papszStrList, const char *pszFname);

char  **
CSLInsertStrings(char **papszStrList, int nInsertAtLineNo,
                 CSLConstList papszNewLines) ;
char  **CSLInsertString(char **papszStrList, int nInsertAtLineNo,
                               const char *pszNewLine) ;
char  **
CSLRemoveStrings(char **papszStrList, int nFirstLineToDelete, int nNumToRemove,
                 char ***ppapszRetStrings) ;
int  CSLFindString(CSLConstList papszList, const char *pszTarget);
int  CSLFindStringCaseSensitive(CSLConstList papszList,
                                       const char *pszTarget);
int  CSLPartialFindString(CSLConstList papszHaystack,
                                 const char *pszNeedle);
int  CSLFindName(CSLConstList papszStrList, const char *pszName);
int  CSLFetchBoolean(CSLConstList papszStrList, const char *pszKey,
                            int bDefault);

/* TODO: Deprecate CSLTestBoolean.  Remove in GDAL 3.x. */
int  CSLTestBoolean(const char *pszValue);
/* Do not use CPLTestBoolean in C++ code.  Use CPLTestBool. */
int  CPLTestBoolean(const char *pszValue);

bool  CPLTestBool(const char *pszValue);
bool  CPLFetchBool(CSLConstList papszStrList, const char *pszKey,
                          bool bDefault);

const char  *CPLParseNameValue(const char *pszNameValue, char **ppszKey);

const char  *CSLFetchNameValue(CSLConstList papszStrList,
                                      const char *pszName);
const char  *CSLFetchNameValueDef(CSLConstList papszStrList,
                                         const char *pszName,
                                         const char *pszDefault);
char  **CSLFetchNameValueMultiple(CSLConstList papszStrList,
                                         const char *pszName);
char  **CSLAddNameValue(char **papszStrList, const char *pszName,
                               const char *pszValue) ;
char  **CSLSetNameValue(char **papszStrList, const char *pszName,
                               const char *pszValue) ;
void  CSLSetNameValueSeparator(char **papszStrList,
                                      const char *pszSeparator);

char  **CSLParseCommandLine(const char *pszCommandLine);

/** Scheme for CPLEscapeString()/CPLUnescapeString() for backlash quoting */
#define CPLES_BackslashQuotable 0
/** Scheme for CPLEscapeString()/CPLUnescapeString() for XML */
#define CPLES_XML 1
/** Scheme for CPLEscapeString()/CPLUnescapeString() for URL */
#define CPLES_URL 2
/** Scheme for CPLEscapeString()/CPLUnescapeString() for SQL */
#define CPLES_SQL 3
/** Scheme for CPLEscapeString()/CPLUnescapeString() for CSV */
#define CPLES_CSV 4
/** Scheme for CPLEscapeString()/CPLUnescapeString() for XML (preserves quotes)
 */
#define CPLES_XML_BUT_QUOTES 5
/** Scheme for CPLEscapeString()/CPLUnescapeString() for CSV (forced quoting) */
#define CPLES_CSV_FORCE_QUOTING 6
/** Scheme for CPLEscapeString()/CPLUnescapeString() for SQL identifiers */
#define CPLES_SQLI 7

char  *CPLEscapeString(const char *pszString, int nLength,
                              int nScheme) ;
char  *CPLUnescapeString(const char *pszString, int *pnLength,
                                int nScheme) ;

char  *CPLBinaryToHex(int nBytes,
                             const GByte *pabyData) ;
GByte  *CPLHexToBinary(const char *pszHex,
                              int *pnBytes) ;

char  *CPLBase64Encode(int nBytes,
                              const GByte *pabyData) ;
int  CPLBase64DecodeInPlace(GByte *pszBase64) ;

/** Type of value */
typedef enum
{
    CPL_VALUE_STRING, /**< String */
    CPL_VALUE_REAL,   /**< Real number */
    CPL_VALUE_INTEGER /**< Integer */
} CPLValueType;

CPLValueType  CPLGetValueType(const char *pszValue);

size_t  CPLStrlcpy(char *pszDest, const char *pszSrc, size_t nDestSize);
size_t  CPLStrlcat(char *pszDest, const char *pszSrc, size_t nDestSize);
size_t  CPLStrnlen(const char *pszStr, size_t nMaxLen);

/* -------------------------------------------------------------------- */
/*      Locale independent formatting functions.                        */
/* -------------------------------------------------------------------- */
int  CPLvsnprintf(char *str, size_t size,
                         const char *fmt, va_list args)
   ;

/* ALIAS_CPLSNPRINTF_AS_SNPRINTF might be defined to enable GCC 7 */
/* -Wformat-truncation= warnings, but shouldn't be set for normal use */
#if defined(ALIAS_CPLSNPRINTF_AS_SNPRINTF)
#define CPLsnprintf snprintf
#else
int  CPLsnprintf(char *str, size_t size,
                        const char *fmt, ...)
   ;
#endif

int  CPLsprintf(char *str, const char *fmt, ...)
 ;
#endif
/*! @endcond */
int  CPLprintf(const char *fmt, ...)
 ;

/* For some reason Doxygen_Suppress is needed to avoid warning. Not sure why */
/*! @cond Doxygen_Suppress */
/* caution: only works with limited number of formats */
int  CPLsscanf(const char *str, const char *fmt,
                      ...) ;
/*! @endcond */

const char  *CPLSPrintf(const char *fmt, ...)
  ;
char  **CSLAppendPrintf(char **papszStrList,
                               const char *fmt, ...)
  ;
int  CPLVASPrintf(char **buf, const char *fmt,
                         va_list args);

/* -------------------------------------------------------------------- */
/*      RFC 23 character set conversion/recoding API (cpl_recode.cpp).  */
/* -------------------------------------------------------------------- */
/** Encoding of the current locale */
#define CPL_ENC_LOCALE ""
/** UTF-8 encoding */
#define CPL_ENC_UTF8 "UTF-8"
/** UTF-16 encoding */
#define CPL_ENC_UTF16 "UTF-16"
/** UCS-2 encoding */
#define CPL_ENC_UCS2 "UCS-2"
/** UCS-4 encoding */
#define CPL_ENC_UCS4 "UCS-4"
/** ASCII encoding */
#define CPL_ENC_ASCII "ASCII"
/** ISO-8859-1 (LATIN1) encoding */
#define CPL_ENC_ISO8859_1 "ISO-8859-1"

int  CPLEncodingCharSize(const char *pszEncoding);
/*! @cond Doxygen_Suppress */
void  CPLClearRecodeWarningFlags(void);
/*! @endcond */
char  *CPLRecode(const char *pszSource, const char *pszSrcEncoding,
                        const char *pszDstEncoding)
     ;
char  *
CPLRecodeFromWChar(const wchar_t *pwszSource, const char *pszSrcEncoding,
                   const char *pszDstEncoding) ;
wchar_t  *
CPLRecodeToWChar(const char *pszSource, const char *pszSrcEncoding,
                 const char *pszDstEncoding) ;
int  CPLIsUTF8(const char *pabyData, int nLen);
bool  CPLIsASCII(const char *pabyData, size_t nLen);
char  *CPLForceToASCII(const char *pabyData, int nLen,
                              char chReplacementChar) ;
int  CPLStrlenUTF8(const char *pszUTF8Str);
int  CPLCanRecode(const char *pszTestStr, const char *pszSrcEncoding,
                         const char *pszDstEncoding) ;


/************************************************************************/
/*                              CPLString                               */
/************************************************************************/




