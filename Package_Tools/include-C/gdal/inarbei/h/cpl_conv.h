/******************************************************************************
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
 ****************************************************************************/

#ifndef CPL_CONV_H_INCLUDED
#define CPL_CONV_H_INCLUDED

#include "cpl_port.h"
#include "cpl_vsi.h"
#include "cpl_error.h"

/**
 * \file cpl_conv.h
 *
 * Various convenience functions for CPL.
 *
 */

/* -------------------------------------------------------------------- */
/*      Runtime check of various configuration items.                   */
/* -------------------------------------------------------------------- */


/*! @cond Doxygen_Suppress */
void  CPLVerifyConfiguration(void);
/*! @endcond */

const char  * CPLGetConfigOption(const char *, const char *)
    ;
const char  * CPLGetThreadLocalConfigOption(
    const char *, const char *) ;
const char  *
CPLGetGlobalConfigOption(const char *, const char *) ;
void   CPLSetConfigOption(const char *, const char *);
void   CPLSetThreadLocalConfigOption(const char *pszKey,
                                                       const char *pszValue);

/** Callback for CPLSubscribeToSetConfigOption() */
typedef void (*CPLSetConfigOptionSubscriber)(const char *pszKey,
                                             const char *pszValue,
                                             bool bThreadLocal,
                                             void *pUserData);
int  CPLSubscribeToSetConfigOption(
    CPLSetConfigOptionSubscriber pfnCallback, void *pUserData);
void  CPLUnsubscribeToSetConfigOption(int nSubscriberId);

/*! @cond Doxygen_Suppress */
void   CPLFreeConfig(void);
/*! @endcond */
char  **CPLGetConfigOptions(void);
void  CPLSetConfigOptions(const char *const *papszConfigOptions);
char  **CPLGetThreadLocalConfigOptions(void);
void 
CPLSetThreadLocalConfigOptions(const char *const *papszConfigOptions);
void  CPLLoadConfigOptionsFromFile(const char *pszFilename,
                                          int bOverrideEnvVars);
void  CPLLoadConfigOptionsFromPredefinedFiles(void);

/* -------------------------------------------------------------------- */
/*      Safe malloc() API.  Thin cover over VSI functions with fatal    */
/*      error reporting if memory allocation fails.                     */
/* -------------------------------------------------------------------- */
void  *CPLMalloc(size_t) ;
void  *CPLCalloc(size_t, size_t) ;
void  *CPLRealloc(void *, size_t) ;
char  *
CPLStrdup(const char *)  ;
char  *CPLStrlwr(char *);

/** Alias of VSIFree() */
#define CPLFree VSIFree

/* -------------------------------------------------------------------- */
/*      Read a line from a text file, and strip of CR/LF.               */
/* -------------------------------------------------------------------- */
char  *CPLFGets(char *, int, FILE *);
const char  *CPLReadLine(FILE *);
const char  *CPLReadLineL(VSILFILE *);
const char  *CPLReadLine2L(VSILFILE *, int, CSLConstList);
const char  *CPLReadLine3L(VSILFILE *, int, int *, CSLConstList);

/* -------------------------------------------------------------------- */
/*      Convert ASCII string to floating point number                  */
/*      (THESE FUNCTIONS ARE NOT LOCALE AWARE!).                        */
/* -------------------------------------------------------------------- */
double  CPLAtof(const char *);
double  CPLAtofDelim(const char *, char);
double  CPLStrtod(const char *, char **);
double  CPLStrtodDelim(const char *, char **, char);
float  CPLStrtof(const char *, char **);
float  CPLStrtofDelim(const char *, char **, char);

/* -------------------------------------------------------------------- */
/*      Convert number to string.  This function is locale agnostic     */
/*      (i.e. it will support "," or "." regardless of current locale)  */
/* -------------------------------------------------------------------- */
double  CPLAtofM(const char *);

/* -------------------------------------------------------------------- */
/*      Read a numeric value from an ASCII character string.            */
/* -------------------------------------------------------------------- */
char  *CPLScanString(const char *, int, int, int);
double  CPLScanDouble(const char *, int);
long  CPLScanLong(const char *, int);
unsigned long  CPLScanULong(const char *, int);
GUIntBig  CPLScanUIntBig(const char *, int);
GIntBig  CPLAtoGIntBig(const char *pszString);
GIntBig  CPLAtoGIntBigEx(const char *pszString, int bWarn,
                                int *pbOverflow);
void  *CPLScanPointer(const char *, int);

/* -------------------------------------------------------------------- */
/*      Print a value to an ASCII character string.                     */
/* -------------------------------------------------------------------- */
int  CPLPrintString(char *, const char *, int);
int  CPLPrintStringFill(char *, const char *, int);
int  CPLPrintInt32(char *, GInt32, int);
int  CPLPrintUIntBig(char *, GUIntBig, int);
int  CPLPrintDouble(char *, const char *, double, const char *);
int  CPLPrintTime(char *, int, const char *, const struct tm *,
                         const char *);
int  CPLPrintPointer(char *, void *, int);

/* -------------------------------------------------------------------- */
/*      Fetch a function from DLL / so.                                 */
/* -------------------------------------------------------------------- */

void  *CPLGetSymbol(const char *, const char *);

/* -------------------------------------------------------------------- */
/*      Fetch executable path.                                          */
/* -------------------------------------------------------------------- */
int  CPLGetExecPath(char *pszPathBuf, int nMaxLength);

/* -------------------------------------------------------------------- */
/*      Filename handling functions.                                    */
/* -------------------------------------------------------------------- */
const char  *
CPLGetPath(const char *)  ;
const char  *
CPLGetDirname(const char *)  ;
const char  *
CPLGetFilename(const char *)  ;
const char  *
CPLGetBasename(const char *)  ;
const char  *
CPLGetExtension(const char *)  ;
char  *CPLGetCurrentDir(void);
const char  *CPLFormFilename(
    const char *pszPath, const char *pszBasename,
    const char *pszExtension)  ;
const char  *CPLFormCIFilename(
    const char *pszPath, const char *pszBasename,
    const char *pszExtension)  ;
const char  *CPLResetExtension(const char *, const char *)
     ;
const char  *CPLProjectRelativeFilename(const char *pszProjectDir,
                                               const char *pszSecondaryFilename)
     ;
int  CPLIsFilenameRelative(const char *pszFilename);
const char  *CPLExtractRelativePath(const char *, const char *, int *)
     ;
const char  *
CPLCleanTrailingSlash(const char *)  ;
char  **
CPLCorrespondingPaths(const char *pszOldFilename, const char *pszNewFilename,
                      char **papszFileList) ;
int  CPLCheckForFile(char *pszFilename, char **papszSiblingList);

const char  *CPLGenerateTempFilename(const char *pszStem)
     ;
const char  *CPLExpandTilde(const char *pszFilename)
     ;
const char  *CPLGetHomeDir(void) ;
const char  *
CPLLaunderForFilename(const char *pszName,
                      const char *pszOutputPath) ;

/* -------------------------------------------------------------------- */
/*      Find File Function                                              */
/* -------------------------------------------------------------------- */

/** Callback for CPLPushFileFinder */
typedef char const *(*CPLFileFinder)(const char *, const char *);

const char  *CPLFindFile(const char *pszClass, const char *pszBasename);
const char  *CPLDefaultFindFile(const char *pszClass,
                                       const char *pszBasename);
void  CPLPushFileFinder(CPLFileFinder pfnFinder);
CPLFileFinder  CPLPopFileFinder(void);
void  CPLPushFinderLocation(const char *);
void  CPLPopFinderLocation(void);
void  CPLFinderClean(void);

/* -------------------------------------------------------------------- */
/*      Safe version of stat() that works properly on stuff like "C:".  */
/* -------------------------------------------------------------------- */
int  CPLStat(const char *, VSIStatBuf *) ;

/* -------------------------------------------------------------------- */
/*      Reference counted file handle manager.  Makes sharing file      */
/*      handles more practical.                                         */
/* -------------------------------------------------------------------- */

/** Information on a shared file */
typedef struct
{
    FILE *fp;          /**< File pointer */
    int nRefCount;     /**< Reference counter */
    int bLarge;        /**< Whether fp must be interpreted as VSIFILE* */
    char *pszFilename; /**< Filename */
    char *pszAccess;   /**< Access mode */
} CPLSharedFileInfo;

FILE  *CPLOpenShared(const char *, const char *, int);
void  CPLCloseShared(FILE *);
CPLSharedFileInfo  *CPLGetSharedList(int *);
void  CPLDumpSharedList(FILE *);
/*! @cond Doxygen_Suppress */
void  CPLCleanupSharedFileMutex(void);
/*! @endcond */

/* -------------------------------------------------------------------- */
/*      DMS to Dec to DMS conversion.                                   */
/* -------------------------------------------------------------------- */
double  CPLDMSToDec(const char *is);
const char  *CPLDecToDMS(double dfAngle, const char *pszAxis,
                                int nPrecision);
double  CPLPackedDMSToDec(double);
double  CPLDecToPackedDMS(double dfDec);

void  CPLStringToComplex(const char *pszString, double *pdfReal,
                                double *pdfImag);

/* -------------------------------------------------------------------- */
/*      Misc other functions.                                           */
/* -------------------------------------------------------------------- */
int  CPLUnlinkTree(const char *);
int  CPLCopyFile(const char *pszNewPath, const char *pszOldPath);
int  CPLCopyTree(const char *pszNewPath, const char *pszOldPath);
int  CPLMoveFile(const char *pszNewPath, const char *pszOldPath);
int  CPLSymlink(const char *pszOldPath, const char *pszNewPath,
                       CSLConstList papszOptions);

/* -------------------------------------------------------------------- */
/*      ZIP Creation.                                                   */
/* -------------------------------------------------------------------- */

/*! @cond Doxygen_Suppress */
#define CPL_ZIP_API_OFFERED
/*! @endcond */
void  *CPLCreateZip(const char *pszZipFilename, char **papszOptions);
CPLErr  CPLCreateFileInZip(void *hZip, const char *pszFilename,
                                  char **papszOptions);
CPLErr  CPLWriteFileInZip(void *hZip, const void *pBuffer,
                                 int nBufferSize);
CPLErr  CPLCloseFileInZip(void *hZip);
CPLErr  CPLAddFileInZip(void *hZip, const char *pszArchiveFilename,
                               const char *pszInputFilename, VSILFILE *fpInput,
                               CSLConstList papszOptions,
                               GDALProgressFunc pProgressFunc,
                               void *pProgressData);
CPLErr  CPLCloseZip(void *hZip);

/* -------------------------------------------------------------------- */
/*      ZLib compression                                                */
/* -------------------------------------------------------------------- */

void  *CPLZLibDeflate(const void *ptr, size_t nBytes, int nLevel,
                             void *outptr, size_t nOutAvailableBytes,
                             size_t *pnOutBytes);
void  *CPLZLibInflate(const void *ptr, size_t nBytes, void *outptr,
                             size_t nOutAvailableBytes, size_t *pnOutBytes);

/* -------------------------------------------------------------------- */
/*      XML validation.                                                 */
/* -------------------------------------------------------------------- */
int  CPLValidateXML(const char *pszXMLFilename,
                           const char *pszXSDFilename,
                           CSLConstList papszOptions);

/* -------------------------------------------------------------------- */
/*      Locale handling. Prevents parallel executions of setlocale().   */
/* -------------------------------------------------------------------- */
char *CPLsetlocale(int category, const char *locale);
/*! @cond Doxygen_Suppress */
void CPLCleanupSetlocaleMutex(void);
/*! @endcond */

/*!
    CPLIsPowerOfTwo()
    @param i - tested number
    @return TRUE if i is power of two otherwise return FALSE
*/
int  CPLIsPowerOfTwo(unsigned int i);



/* -------------------------------------------------------------------- */
/*      C++ object for temporarily forcing a LC_NUMERIC locale to "C".  */
/* -------------------------------------------------------------------- */

//! @endcond



#endif /* ndef CPL_CONV_H_INCLUDED */
