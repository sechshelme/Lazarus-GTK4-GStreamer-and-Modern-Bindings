/******************************************************************************
 * $Id$
 *
 * Project:  Common Portability Library
 * Purpose:  Functions for reading and scanning CSV (comma separated,
 *           variable length text files holding tables) files.
 * Author:   Frank Warmerdam, warmerdam@pobox.com
 *
 ******************************************************************************
 * Copyright (c) 1999, Frank Warmerdam
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

#ifndef CPL_CSV_H_INCLUDED
#define CPL_CSV_H_INCLUDED

#include <stdio.h>

#include "cpl_conv.h"
#include "cpl_string.h"
#include "cpl_vsi.h"
#include <stdbool.h>



typedef enum
{
    CC_ExactString,
    CC_ApproxString,
    CC_Integer
} CSVCompareCriteria;

const char  *CSVFilename(const char *);

char  CSVDetectSeperator(const char *pszLine);

char  **CSVReadParseLine(FILE *fp);
char  **CSVReadParseLine2(FILE *fp, char chDelimiter);

char  **CSVReadParseLineL(VSILFILE *fp);
char  **CSVReadParseLine2L(VSILFILE *fp, char chDelimiter);

char  **CSVReadParseLine3L(VSILFILE *fp, size_t nMaxLineSize,
                                  const char *pszDelimiter, bool bHonourStrings,
                                  bool bKeepLeadingAndClosingQuotes,
                                  bool bMergeDelimiter, bool bSkipBOM);

char  **CSVScanLines(FILE *, int, const char *, CSVCompareCriteria);
char  **CSVScanLinesL(VSILFILE *, int, const char *, CSVCompareCriteria);
char  **CSVScanFile(const char *, int, const char *, CSVCompareCriteria);
char  **CSVScanFileByName(const char *, const char *, const char *,
                                 CSVCompareCriteria);
void  CSVRewind(const char *);
char  **CSVGetNextLine(const char *);
int  CSVGetFieldId(FILE *, const char *);
int  CSVGetFieldIdL(VSILFILE *, const char *);
int  CSVGetFileFieldId(const char *, const char *);

void  CSVDeaccess(const char *);

const char  *CSVGetField(const char *, const char *, const char *,
                                CSVCompareCriteria, const char *);

#ifndef DOXYGEN_XML
void  SetCSVFilenameHook(const char *(*)(const char *));
#endif



#endif /* ndef CPL_CSV_H_INCLUDED */
