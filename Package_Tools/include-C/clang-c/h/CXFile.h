/*===-- clang-c/CXFile.h - C Index File ---------------------------*- C -*-===*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* This header provides the interface to C Index files.                       *|
|*                                                                            *|
\*===----------------------------------------------------------------------===*/

#ifndef LLVM_CLANG_C_CXFILE_H
#define LLVM_CLANG_C_CXFILE_H

#include <time.h>

#include "clang-c/CXString.h"
#include "clang-c/ExternC.h"
#include "clang-c/Platform.h"



/**
 * \defgroup CINDEX_FILES File manipulation routines
 *
 * @{
 */

/**
 * A particular source file that is part of a translation unit.
 */
typedef void *CXFile;

/**
 * Retrieve the complete file and path name of the given file.
 */
extern CXString clang_getFileName(CXFile SFile);

/**
 * Retrieve the last modification time of the given file.
 */
extern time_t clang_getFileTime(CXFile SFile);

/**
 * Uniquely identifies a CXFile, that refers to the same underlying file,
 * across an indexing session.
 */
typedef struct {
  unsigned long long data[3];
} CXFileUniqueID;

/**
 * Retrieve the unique ID for the given \c file.
 *
 * \param file the file to get the ID for.
 * \param outID stores the returned CXFileUniqueID.
 * \returns If there was a failure getting the unique ID, returns non-zero,
 * otherwise returns 0.
 */
extern int clang_getFileUniqueID(CXFile file, CXFileUniqueID *outID);

/**
 * Returns non-zero if the \c file1 and \c file2 point to the same file,
 * or they are both NULL.
 */
extern int clang_File_isEqual(CXFile file1, CXFile file2);

/**
 * Returns the real path name of \c file.
 *
 * An empty string may be returned. Use \c clang_getFileName() in that case.
 */
extern CXString clang_File_tryGetRealPathName(CXFile file);

/**
 * @}
 */



#endif
