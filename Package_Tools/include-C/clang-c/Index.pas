unit Index;

interface

uses
  fp_clang;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{===-- clang-c/Index.h - Indexing Public C Interface -------------*- C -*-===*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* This header provides a public interface to a Clang library for extracting  *|
|* high-level symbol information from source files without exposing the full  *|
|* Clang C++ API.                                                             *|
|*                                                                            *|
\*===----------------------------------------------------------------------=== }
{$ifndef LLVM_CLANG_C_INDEX_H}
{$define LLVM_CLANG_C_INDEX_H}
{$include "clang-c/BuildSystem.h"}
{$include "clang-c/CXDiagnostic.h"}
{$include "clang-c/CXErrorCode.h"}
{$include "clang-c/CXFile.h"}
{$include "clang-c/CXSourceLocation.h"}
{$include "clang-c/CXString.h"}
{$include "clang-c/ExternC.h"}
{$include "clang-c/Platform.h"}
{*
 * The version constants for the libclang API.
 * CINDEX_VERSION_MINOR should increase when there are API additions.
 * CINDEX_VERSION_MAJOR is intended for "major" source/ABI breaking changes.
 *
 * The policy about the libclang API was always to keep it source and ABI
 * compatible, thus CINDEX_VERSION_MAJOR is expected to remain stable.
  }

const
  CINDEX_VERSION_MAJOR = 0;  
  CINDEX_VERSION_MINOR = 64;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function CINDEX_VERSION_ENCODE(major,minor : longint) : longint;

{* \defgroup CINDEX libclang: C Interface to Clang
 *
 * The C Interface to Clang provides a relatively small API that exposes
 * facilities for parsing source code into an abstract syntax tree (AST),
 * loading already-parsed ASTs, traversing the AST, associating
 * physical source locations with elements within the AST, and other
 * facilities that support Clang-based development tools.
 *
 * This C interface to Clang will never provide all of the information
 * representation stored in Clang's C++ AST, nor should it: the intent is to
 * maintain an API that is relatively stable from one release to the next,
 * providing only the basic functionality needed to support development tools.
 *
 * To avoid namespace pollution, data types are prefixed with "CX" and
 * functions are prefixed with "clang_".
 *
 * @
  }
{*
 * An "index" that consists of a set of translation units that would
 * typically be linked together into an executable or library.
  }
type
  PCXIndex = ^TCXIndex;
  TCXIndex = pointer;
{*
 * An opaque type representing target information for a given translation
 * unit.
  }

  PCXTargetInfo = ^TCXTargetInfo;
  TCXTargetInfo = PCXTargetInfoImpl;
{*
 * A single translation unit, which resides in an index.
  }

  PCXTranslationUnit = ^TCXTranslationUnit;
  TCXTranslationUnit = PCXTranslationUnitImpl;
{*
 * Opaque pointer representing client data that will be passed through
 * to various callbacks and visitors.
  }

  PCXClientData = ^TCXClientData;
  TCXClientData = pointer;
{*
 * Provides the contents of a file that has not yet been saved to disk.
 *
 * Each CXUnsavedFile instance provides the name of a file on the
 * system along with the current contents of that file that have not
 * yet been saved to disk.
  }
{*
   * The file whose contents have not yet been saved.
   *
   * This file must already exist in the file system.
    }
{*
   * A buffer containing the unsaved contents of this file.
    }
{*
   * The length of the unsaved contents of this buffer.
    }
  PCXUnsavedFile = ^TCXUnsavedFile;
  TCXUnsavedFile = record
      Filename : Pchar;
      Contents : Pchar;
      Length : dword;
    end;

{*
 * Describes the availability of a particular entity, which indicates
 * whether the use of this entity will result in a warning or error due to
 * it being deprecated or unavailable.
  }
{*
   * The entity is available.
    }
{*
   * The entity is available, but has been deprecated (and its use is
   * not recommended).
    }
{*
   * The entity is not available; any use of it will be an error.
    }
{*
   * The entity is available, but not accessible; any use of it will be
   * an error.
    }
  TCXAvailabilityKind =  Longint;
  Const
    CXAvailability_Available = 0;
    CXAvailability_Deprecated = 1;
    CXAvailability_NotAvailable = 2;
    CXAvailability_NotAccessible = 3;

{*
 * Describes a version number of the form major.minor.subminor.
  }
{*
   * The major version number, e.g., the '10' in '10.7.3'. A negative
   * value indicates that there is no version number at all.
    }
{*
   * The minor version number, e.g., the '7' in '10.7.3'. This value
   * will be negative if no minor version number was provided, e.g., for
   * version '10'.
    }
{*
   * The subminor version number, e.g., the '3' in '10.7.3'. This value
   * will be negative if no minor or subminor version number was provided,
   * e.g., in version '10' or '10.7'.
    }
type
  PCXVersion = ^TCXVersion;
  TCXVersion = record
      Major : longint;
      Minor : longint;
      Subminor : longint;
    end;
{*
 * Describes the exception specification of a cursor.
 *
 * A negative value indicates that the cursor is not a function declaration.
  }
{*
   * The cursor has no exception specification.
    }
{*
   * The cursor has exception specification throw()
    }
{*
   * The cursor has exception specification throw(T1, T2)
    }
{*
   * The cursor has exception specification throw(...).
    }
{*
   * The cursor has exception specification basic noexcept.
    }
{*
   * The cursor has exception specification computed noexcept.
    }
{*
   * The exception specification has not yet been evaluated.
    }
{*
   * The exception specification has not yet been instantiated.
    }
{*
   * The exception specification has not been parsed yet.
    }
{*
   * The cursor has a __declspec(nothrow) exception specification.
    }
  TCXCursor_ExceptionSpecificationKind =  Longint;
  Const
    CXCursor_ExceptionSpecificationKind_None = 0;
    CXCursor_ExceptionSpecificationKind_DynamicNone = 1;
    CXCursor_ExceptionSpecificationKind_Dynamic = 2;
    CXCursor_ExceptionSpecificationKind_MSAny = 3;
    CXCursor_ExceptionSpecificationKind_BasicNoexcept = 4;
    CXCursor_ExceptionSpecificationKind_ComputedNoexcept = 5;
    CXCursor_ExceptionSpecificationKind_Unevaluated = 6;
    CXCursor_ExceptionSpecificationKind_Uninstantiated = 7;
    CXCursor_ExceptionSpecificationKind_Unparsed = 8;
    CXCursor_ExceptionSpecificationKind_NoThrow = 9;

{*
 * Provides a shared context for creating translation units.
 *
 * It provides two options:
 *
 * - excludeDeclarationsFromPCH: When non-zero, allows enumeration of "local"
 * declarations (when loading any new translation units). A "local" declaration
 * is one that belongs in the translation unit itself and not in a precompiled
 * header that was used by the translation unit. If zero, all declarations
 * will be enumerated.
 *
 * Here is an example:
 *
 * \code
 *   // excludeDeclsFromPCH = 1, displayDiagnostics=1
 *   Idx = clang_createIndex(1, 1);
 *
 *   // IndexTest.pch was produced with the following command:
 *   // "clang -x c IndexTest.h -emit-ast -o IndexTest.pch"
 *   TU = clang_createTranslationUnit(Idx, "IndexTest.pch");
 *
 *   // This will load all the symbols from 'IndexTest.pch'
 *   clang_visitChildren(clang_getTranslationUnitCursor(TU),
 *                       TranslationUnitVisitor, 0);
 *   clang_disposeTranslationUnit(TU);
 *
 *   // This will load all the symbols from 'IndexTest.c', excluding symbols
 *   // from 'IndexTest.pch'.
 *   char *args[] =  "-Xclang", "-include-pch=IndexTest.pch" ;
 *   TU = clang_createTranslationUnitFromSourceFile(Idx, "IndexTest.c", 2, args,
 *                                                  0, 0);
 *   clang_visitChildren(clang_getTranslationUnitCursor(TU),
 *                       TranslationUnitVisitor, 0);
 *   clang_disposeTranslationUnit(TU);
 * \endcode
 *
 * This process of creating the 'pch', loading it separately, and using it (via
 * -include-pch) allows 'excludeDeclsFromPCH' to remove redundant callbacks
 * (which gives the indexer the same performance benefit as the compiler).
  }

function clang_createIndex(excludeDeclarationsFromPCH:longint; displayDiagnostics:longint):TCXIndex;cdecl;external libgclang;
{*
 * Destroy the given index.
 *
 * The index must not be destroyed until all of the translation units created
 * within that index have been destroyed.
  }
procedure clang_disposeIndex(index:TCXIndex);cdecl;external libgclang;
{*
   * Use the default value of an option that may depend on the process
   * environment.
    }
{*
   * Enable the option.
    }
{*
   * Disable the option.
    }
type
  PCXChoice = ^TCXChoice;
  TCXChoice =  Longint;
  Const
    CXChoice_Default = 0;
    CXChoice_Enabled = 1;
    CXChoice_Disabled = 2;
;
{*
   * Used to indicate that no special CXIndex options are needed.
    }
{*
   * Used to indicate that threads that libclang creates for indexing
   * purposes should use background priority.
   *
   * Affects #clang_indexSourceFile, #clang_indexTranslationUnit,
   * #clang_parseTranslationUnit, #clang_saveTranslationUnit.
    }
{*
   * Used to indicate that threads that libclang creates for editing
   * purposes should use background priority.
   *
   * Affects #clang_reparseTranslationUnit, #clang_codeCompleteAt,
   * #clang_annotateTokens
    }
{*
   * Used to indicate that all threads that libclang creates should use
   * background priority.
    }
type
  PCXGlobalOptFlags = ^TCXGlobalOptFlags;
  TCXGlobalOptFlags =  Longint;
  Const
    CXGlobalOpt_None = $0;
    CXGlobalOpt_ThreadBackgroundPriorityForIndexing = $1;
    CXGlobalOpt_ThreadBackgroundPriorityForEditing = $2;
    CXGlobalOpt_ThreadBackgroundPriorityForAll = CXGlobalOpt_ThreadBackgroundPriorityForIndexing or CXGlobalOpt_ThreadBackgroundPriorityForEditing;
;
{*
 * Index initialization options.
 *
 * 0 is the default value of each member of this struct except for Size.
 * Initialize the struct in one of the following three ways to avoid adapting
 * code each time a new member is added to it:
 * \code
 * CXIndexOptions Opts;
 * memset(&Opts, 0, sizeof(Opts));
 * Opts.Size = sizeof(CXIndexOptions);
 * \endcode
 * or explicitly initialize the first data member and zero-initialize the rest:
 * \code
 * CXIndexOptions Opts =  sizeof(CXIndexOptions) ;
 * \endcode
 * or to prevent the -Wmissing-field-initializers warning for the above version:
 * \code
 * CXIndexOptions Opts;
 * Opts.Size = sizeof(CXIndexOptions);
 * \endcode
  }
{*
   * The size of struct CXIndexOptions used for option versioning.
   *
   * Always initialize this member to sizeof(CXIndexOptions), or assign
   * sizeof(CXIndexOptions) to it right after creating a CXIndexOptions object.
    }
{*
   * A CXChoice enumerator that specifies the indexing priority policy.
   * \sa CXGlobalOpt_ThreadBackgroundPriorityForIndexing
    }
{*
   * A CXChoice enumerator that specifies the editing priority policy.
   * \sa CXGlobalOpt_ThreadBackgroundPriorityForEditing
    }
{*
   * \see clang_createIndex()
    }
{*
   * \see clang_createIndex()
    }
{*
   * Store PCH in memory. If zero, PCH are stored in temporary files.
    }
{Reserved }{*
   * The path to a directory, in which to store temporary PCH files. If null or
   * empty, the default system temporary directory is used. These PCH files are
   * deleted on clean exit but stay on disk if the program crashes or is killed.
   *
   * This option is ignored if \a StorePreamblesInMemory is non-zero.
   *
   * Libclang does not create the directory at the specified path in the file
   * system. Therefore it must exist, or storing PCH files will fail.
    }
{*
   * Specifies a path which will contain log files for certain libclang
   * invocations. A null value implies that libclang invocations are not logged.
    }
type
  PCXIndexOptions = ^TCXIndexOptions;
  TCXIndexOptions = record
      Size : dword;
      ThreadBackgroundPriorityForIndexing : byte;
      ThreadBackgroundPriorityForEditing : byte;
      flag0 : word;
      PreambleStoragePath : Pchar;
      InvocationEmissionPath : Pchar;
    end;

const
  bm_CXIndexOptions_ExcludeDeclarationsFromPCH = $1;
  bp_CXIndexOptions_ExcludeDeclarationsFromPCH = 0;
  bm_CXIndexOptions_DisplayDiagnostics = $2;
  bp_CXIndexOptions_DisplayDiagnostics = 1;
  bm_CXIndexOptions_StorePreamblesInMemory = $4;
  bp_CXIndexOptions_StorePreamblesInMemory = 2;
  bm_CXIndexOptions_xxxxxx = $FFF8;
  bp_CXIndexOptions_xxxxxx = 3;

function ExcludeDeclarationsFromPCH(var a : CXIndexOptions) : dword;
procedure set_ExcludeDeclarationsFromPCH(var a : CXIndexOptions; __ExcludeDeclarationsFromPCH : dword);
function DisplayDiagnostics(var a : CXIndexOptions) : dword;
procedure set_DisplayDiagnostics(var a : CXIndexOptions; __DisplayDiagnostics : dword);
function StorePreamblesInMemory(var a : CXIndexOptions) : dword;
procedure set_StorePreamblesInMemory(var a : CXIndexOptions; __StorePreamblesInMemory : dword);
function xxxxxx(var a : CXIndexOptions) : dword;
procedure set_xxxxxx(var a : CXIndexOptions; __xxxxxx : dword);
{*
 * Provides a shared context for creating translation units.
 *
 * Call this function instead of clang_createIndex() if you need to configure
 * the additional options in CXIndexOptions.
 *
 * \returns The created index or null in case of error, such as an unsupported
 * value of options->Size.
 *
 * For example:
 * \code
 * CXIndex createIndex(const char *ApplicationTemporaryPath) 
 *   const int ExcludeDeclarationsFromPCH = 1;
 *   const int DisplayDiagnostics = 1;
 *   CXIndex Idx;
 * #if CINDEX_VERSION_MINOR >= 64
 *   CXIndexOptions Opts;
 *   memset(&Opts, 0, sizeof(Opts));
 *   Opts.Size = sizeof(CXIndexOptions);
 *   Opts.ThreadBackgroundPriorityForIndexing = 1;
 *   Opts.ExcludeDeclarationsFromPCH = ExcludeDeclarationsFromPCH;
 *   Opts.DisplayDiagnostics = DisplayDiagnostics;
 *   Opts.PreambleStoragePath = ApplicationTemporaryPath;
 *   Idx = clang_createIndexWithOptions(&Opts);
 *   if (Idx)
 *     return Idx;
 *   fprintf(stderr,
 *           "clang_createIndexWithOptions() failed. "
 *           "CINDEX_VERSION_MINOR = %d, sizeof(CXIndexOptions) = %u\n",
 *           CINDEX_VERSION_MINOR, Opts.Size);
 * #else
 *   (void)ApplicationTemporaryPath;
 * #endif
 *   Idx = clang_createIndex(ExcludeDeclarationsFromPCH, DisplayDiagnostics);
 *   clang_CXIndex_setGlobalOptions(
 *       Idx, clang_CXIndex_getGlobalOptions(Idx) |
 *                CXGlobalOpt_ThreadBackgroundPriorityForIndexing);
 *   return Idx;
 * 
 * \endcode
 *
 * \sa clang_createIndex()
  }

function clang_createIndexWithOptions(options:PCXIndexOptions):TCXIndex;cdecl;external libgclang;
{*
 * Sets general options associated with a CXIndex.
 *
 * This function is DEPRECATED. Set
 * CXIndexOptions::ThreadBackgroundPriorityForIndexing and/or
 * CXIndexOptions::ThreadBackgroundPriorityForEditing and call
 * clang_createIndexWithOptions() instead.
 *
 * For example:
 * \code
 * CXIndex idx = ...;
 * clang_CXIndex_setGlobalOptions(idx,
 *     clang_CXIndex_getGlobalOptions(idx) |
 *     CXGlobalOpt_ThreadBackgroundPriorityForIndexing);
 * \endcode
 *
 * \param options A bitmask of options, a bitwise OR of CXGlobalOpt_XXX flags.
  }
procedure clang_CXIndex_setGlobalOptions(para1:TCXIndex; options:dword);cdecl;external libgclang;
{*
 * Gets the general options associated with a CXIndex.
 *
 * This function allows to obtain the final option values used by libclang after
 * specifying the option policies via CXChoice enumerators.
 *
 * \returns A bitmask of options, a bitwise OR of CXGlobalOpt_XXX flags that
 * are associated with the given CXIndex object.
  }
function clang_CXIndex_getGlobalOptions(para1:TCXIndex):dword;cdecl;external libgclang;
{*
 * Sets the invocation emission path option in a CXIndex.
 *
 * This function is DEPRECATED. Set CXIndexOptions::InvocationEmissionPath and
 * call clang_createIndexWithOptions() instead.
 *
 * The invocation emission path specifies a path which will contain log
 * files for certain libclang invocations. A null value (default) implies that
 * libclang invocations are not logged..
  }
procedure clang_CXIndex_setInvocationEmissionPathOption(para1:TCXIndex; Path:Pchar);cdecl;external libgclang;
{*
 * Determine whether the given header is guarded against
 * multiple inclusions, either with the conventional
 * \#ifndef/\#define/\#endif macro guards or with \#pragma once.
  }
function clang_isFileMultipleIncludeGuarded(tu:TCXTranslationUnit; file:TCXFile):dword;cdecl;external libgclang;
{*
 * Retrieve a file handle within the given translation unit.
 *
 * \param tu the translation unit
 *
 * \param file_name the name of the file.
 *
 * \returns the file handle for the named file in the translation unit \p tu,
 * or a NULL file handle if the file was not a part of this translation unit.
  }
function clang_getFile(tu:TCXTranslationUnit; file_name:Pchar):TCXFile;cdecl;external libgclang;
{*
 * Retrieve the buffer associated with the given file.
 *
 * \param tu the translation unit
 *
 * \param file the file for which to retrieve the buffer.
 *
 * \param size [out] if non-NULL, will be set to the size of the buffer.
 *
 * \returns a pointer to the buffer in memory that holds the contents of
 * \p file, or a NULL pointer when the file is not loaded.
  }
function clang_getFileContents(tu:TCXTranslationUnit; file:TCXFile; size:Psize_t):Pchar;cdecl;external libgclang;
{*
 * Retrieves the source location associated with a given file/line/column
 * in a particular translation unit.
  }
function clang_getLocation(tu:TCXTranslationUnit; file:TCXFile; line:dword; column:dword):TCXSourceLocation;cdecl;external libgclang;
{*
 * Retrieves the source location associated with a given character offset
 * in a particular translation unit.
  }
function clang_getLocationForOffset(tu:TCXTranslationUnit; file:TCXFile; offset:dword):TCXSourceLocation;cdecl;external libgclang;
{*
 * Retrieve all ranges that were skipped by the preprocessor.
 *
 * The preprocessor will skip lines when they are surrounded by an
 * if/ifdef/ifndef directive whose condition does not evaluate to true.
  }
function clang_getSkippedRanges(tu:TCXTranslationUnit; file:TCXFile):PCXSourceRangeList;cdecl;external libgclang;
{*
 * Retrieve all ranges from all files that were skipped by the
 * preprocessor.
 *
 * The preprocessor will skip lines when they are surrounded by an
 * if/ifdef/ifndef directive whose condition does not evaluate to true.
  }
function clang_getAllSkippedRanges(tu:TCXTranslationUnit):PCXSourceRangeList;cdecl;external libgclang;
{*
 * Determine the number of diagnostics produced for the given
 * translation unit.
  }
function clang_getNumDiagnostics(Unit:TCXTranslationUnit):dword;cdecl;external libgclang;
{*
 * Retrieve a diagnostic associated with the given translation unit.
 *
 * \param Unit the translation unit to query.
 * \param Index the zero-based diagnostic number to retrieve.
 *
 * \returns the requested diagnostic. This diagnostic must be freed
 * via a call to \c clang_disposeDiagnostic().
  }
function clang_getDiagnostic(Unit:TCXTranslationUnit; Index:dword):TCXDiagnostic;cdecl;external libgclang;
{*
 * Retrieve the complete set of diagnostics associated with a
 *        translation unit.
 *
 * \param Unit the translation unit to query.
  }
function clang_getDiagnosticSetFromTU(Unit:TCXTranslationUnit):TCXDiagnosticSet;cdecl;external libgclang;
{*
 * \defgroup CINDEX_TRANSLATION_UNIT Translation unit manipulation
 *
 * The routines in this group provide the ability to create and destroy
 * translation units from files, either by parsing the contents of the files or
 * by reading in a serialized representation of a translation unit.
 *
 * @
  }
{*
 * Get the original translation unit source file name.
  }
function clang_getTranslationUnitSpelling(CTUnit:TCXTranslationUnit):TCXString;cdecl;external libgclang;
{*
 * Return the CXTranslationUnit for a given source file and the provided
 * command line arguments one would pass to the compiler.
 *
 * Note: The 'source_filename' argument is optional.  If the caller provides a
 * NULL pointer, the name of the source file is expected to reside in the
 * specified command line arguments.
 *
 * Note: When encountered in 'clang_command_line_args', the following options
 * are ignored:
 *
 *   '-c'
 *   '-emit-ast'
 *   '-fsyntax-only'
 *   '-o \<output file>'  (both '-o' and '\<output file>' are ignored)
 *
 * \param CIdx The index object with which the translation unit will be
 * associated.
 *
 * \param source_filename The name of the source file to load, or NULL if the
 * source file is included in \p clang_command_line_args.
 *
 * \param num_clang_command_line_args The number of command-line arguments in
 * \p clang_command_line_args.
 *
 * \param clang_command_line_args The command-line arguments that would be
 * passed to the \c clang executable if it were being invoked out-of-process.
 * These command-line options will be parsed and will affect how the translation
 * unit is parsed. Note that the following options are ignored: '-c',
 * '-emit-ast', '-fsyntax-only' (which is the default), and '-o \<output file>'.
 *
 * \param num_unsaved_files the number of unsaved file entries in \p
 * unsaved_files.
 *
 * \param unsaved_files the files that have not yet been saved to disk
 * but may be required for code completion, including the contents of
 * those files.  The contents and name of these files (as specified by
 * CXUnsavedFile) are copied when necessary, so the client only needs to
 * guarantee their validity until the call to this function returns.
  }
function clang_createTranslationUnitFromSourceFile(CIdx:TCXIndex; source_filename:Pchar; num_clang_command_line_args:longint; clang_command_line_args:PPchar; num_unsaved_files:dword; 
           unsaved_files:PCXUnsavedFile):TCXTranslationUnit;cdecl;external libgclang;
{*
 * Same as \c clang_createTranslationUnit2, but returns
 * the \c CXTranslationUnit instead of an error code.  In case of an error this
 * routine returns a \c NULL \c CXTranslationUnit, without further detailed
 * error codes.
  }
function clang_createTranslationUnit(CIdx:TCXIndex; ast_filename:Pchar):TCXTranslationUnit;cdecl;external libgclang;
{*
 * Create a translation unit from an AST file (\c -emit-ast).
 *
 * \param[out] out_TU A non-NULL pointer to store the created
 * \c CXTranslationUnit.
 *
 * \returns Zero on success, otherwise returns an error code.
  }
function clang_createTranslationUnit2(CIdx:TCXIndex; ast_filename:Pchar; out_TU:PCXTranslationUnit):TCXErrorCode;cdecl;external libgclang;
{*
 * Flags that control the creation of translation units.
 *
 * The enumerators in this enumeration type are meant to be bitwise
 * ORed together to specify which options should be used when
 * constructing the translation unit.
  }
{*
   * Used to indicate that no special translation-unit options are
   * needed.
    }
{*
   * Used to indicate that the parser should construct a "detailed"
   * preprocessing record, including all macro definitions and instantiations.
   *
   * Constructing a detailed preprocessing record requires more memory
   * and time to parse, since the information contained in the record
   * is usually not retained. However, it can be useful for
   * applications that require more detailed information about the
   * behavior of the preprocessor.
    }
{*
   * Used to indicate that the translation unit is incomplete.
   *
   * When a translation unit is considered "incomplete", semantic
   * analysis that is typically performed at the end of the
   * translation unit will be suppressed. For example, this suppresses
   * the completion of tentative declarations in C and of
   * instantiation of implicitly-instantiation function templates in
   * C++. This option is typically used when parsing a header with the
   * intent of producing a precompiled header.
    }
{*
   * Used to indicate that the translation unit should be built with an
   * implicit precompiled header for the preamble.
   *
   * An implicit precompiled header is used as an optimization when a
   * particular translation unit is likely to be reparsed many times
   * when the sources aren't changing that often. In this case, an
   * implicit precompiled header will be built containing all of the
   * initial includes at the top of the main file (what we refer to as
   * the "preamble" of the file). In subsequent parses, if the
   * preamble or the files in it have not changed, \c
   * clang_reparseTranslationUnit() will re-use the implicit
   * precompiled header to improve parsing performance.
    }
{*
   * Used to indicate that the translation unit should cache some
   * code-completion results with each reparse of the source file.
   *
   * Caching of code-completion results is a performance optimization that
   * introduces some overhead to reparsing but improves the performance of
   * code-completion operations.
    }
{*
   * Used to indicate that the translation unit will be serialized with
   * \c clang_saveTranslationUnit.
   *
   * This option is typically used when parsing a header with the intent of
   * producing a precompiled header.
    }
{*
   * DEPRECATED: Enabled chained precompiled preambles in C++.
   *
   * Note: this is a *temporary* option that is available only while
   * we are testing C++ precompiled preamble support. It is deprecated.
    }
{*
   * Used to indicate that function/method bodies should be skipped while
   * parsing.
   *
   * This option can be used to search for declarations/definitions while
   * ignoring the usages.
    }
{*
   * Used to indicate that brief documentation comments should be
   * included into the set of code completions returned from this translation
   * unit.
    }
{*
   * Used to indicate that the precompiled preamble should be created on
   * the first parse. Otherwise it will be created on the first reparse. This
   * trades runtime on the first parse (serializing the preamble takes time) for
   * reduced runtime on the second parse (can now reuse the preamble).
    }
{*
   * Do not stop processing when fatal errors are encountered.
   *
   * When fatal errors are encountered while parsing a translation unit,
   * semantic analysis is typically stopped early when compiling code. A common
   * source for fatal errors are unresolvable include files. For the
   * purposes of an IDE, this is undesirable behavior and as much information
   * as possible should be reported. Use this flag to enable this behavior.
    }
{*
   * Sets the preprocessor in a mode for parsing a single file only.
    }
{*
   * Used in combination with CXTranslationUnit_SkipFunctionBodies to
   * constrain the skipping of function bodies to the preamble.
   *
   * The function bodies of the main file are not skipped.
    }
{*
   * Used to indicate that attributed types should be included in CXType.
    }
{*
   * Used to indicate that implicit attributes should be visited.
    }
{*
   * Used to indicate that non-errors from included files should be ignored.
   *
   * If set, clang_getDiagnosticSetFromTU() will not report e.g. warnings from
   * included files anymore. This speeds up clang_getDiagnosticSetFromTU() for
   * the case where these warnings are not of interest, as for an IDE for
   * example, which typically shows only the diagnostics in the main file.
    }
{*
   * Tells the preprocessor not to skip excluded conditional blocks.
    }
type
  TCXTranslationUnit_Flags =  Longint;
  Const
    CXTranslationUnit_None = $0;
    CXTranslationUnit_DetailedPreprocessingRecord = $01;
    CXTranslationUnit_Incomplete = $02;
    CXTranslationUnit_PrecompiledPreamble = $04;
    CXTranslationUnit_CacheCompletionResults = $08;
    CXTranslationUnit_ForSerialization = $10;
    CXTranslationUnit_CXXChainedPCH = $20;
    CXTranslationUnit_SkipFunctionBodies = $40;
    CXTranslationUnit_IncludeBriefCommentsInCodeCompletion = $80;
    CXTranslationUnit_CreatePreambleOnFirstParse = $100;
    CXTranslationUnit_KeepGoing = $200;
    CXTranslationUnit_SingleFileParse = $400;
    CXTranslationUnit_LimitSkipFunctionBodiesToPreamble = $800;
    CXTranslationUnit_IncludeAttributedTypes = $1000;
    CXTranslationUnit_VisitImplicitAttributes = $2000;
    CXTranslationUnit_IgnoreNonErrorsFromIncludedFiles = $4000;
    CXTranslationUnit_RetainExcludedConditionalBlocks = $8000;

{*
 * Returns the set of flags that is suitable for parsing a translation
 * unit that is being edited.
 *
 * The set of flags returned provide options for \c clang_parseTranslationUnit()
 * to indicate that the translation unit is likely to be reparsed many times,
 * either explicitly (via \c clang_reparseTranslationUnit()) or implicitly
 * (e.g., by code completion (\c clang_codeCompletionAt())). The returned flag
 * set contains an unspecified set of optimizations (e.g., the precompiled
 * preamble) geared toward improving the performance of these routines. The
 * set of optimizations enabled may change from one version to the next.
  }

function clang_defaultEditingTranslationUnitOptions:dword;cdecl;external libgclang;
{*
 * Same as \c clang_parseTranslationUnit2, but returns
 * the \c CXTranslationUnit instead of an error code.  In case of an error this
 * routine returns a \c NULL \c CXTranslationUnit, without further detailed
 * error codes.
  }
function clang_parseTranslationUnit(CIdx:TCXIndex; source_filename:Pchar; command_line_args:PPchar; num_command_line_args:longint; unsaved_files:PCXUnsavedFile; 
           num_unsaved_files:dword; options:dword):TCXTranslationUnit;cdecl;external libgclang;
{*
 * Parse the given source file and the translation unit corresponding
 * to that file.
 *
 * This routine is the main entry point for the Clang C API, providing the
 * ability to parse a source file into a translation unit that can then be
 * queried by other functions in the API. This routine accepts a set of
 * command-line arguments so that the compilation can be configured in the same
 * way that the compiler is configured on the command line.
 *
 * \param CIdx The index object with which the translation unit will be
 * associated.
 *
 * \param source_filename The name of the source file to load, or NULL if the
 * source file is included in \c command_line_args.
 *
 * \param command_line_args The command-line arguments that would be
 * passed to the \c clang executable if it were being invoked out-of-process.
 * These command-line options will be parsed and will affect how the translation
 * unit is parsed. Note that the following options are ignored: '-c',
 * '-emit-ast', '-fsyntax-only' (which is the default), and '-o \<output file>'.
 *
 * \param num_command_line_args The number of command-line arguments in
 * \c command_line_args.
 *
 * \param unsaved_files the files that have not yet been saved to disk
 * but may be required for parsing, including the contents of
 * those files.  The contents and name of these files (as specified by
 * CXUnsavedFile) are copied when necessary, so the client only needs to
 * guarantee their validity until the call to this function returns.
 *
 * \param num_unsaved_files the number of unsaved file entries in \p
 * unsaved_files.
 *
 * \param options A bitmask of options that affects how the translation unit
 * is managed but not its compilation. This should be a bitwise OR of the
 * CXTranslationUnit_XXX flags.
 *
 * \param[out] out_TU A non-NULL pointer to store the created
 * \c CXTranslationUnit, describing the parsed code and containing any
 * diagnostics produced by the compiler.
 *
 * \returns Zero on success, otherwise returns an error code.
  }
function clang_parseTranslationUnit2(CIdx:TCXIndex; source_filename:Pchar; command_line_args:PPchar; num_command_line_args:longint; unsaved_files:PCXUnsavedFile; 
           num_unsaved_files:dword; options:dword; out_TU:PCXTranslationUnit):TCXErrorCode;cdecl;external libgclang;
{*
 * Same as clang_parseTranslationUnit2 but requires a full command line
 * for \c command_line_args including argv[0]. This is useful if the standard
 * library paths are relative to the binary.
  }
function clang_parseTranslationUnit2FullArgv(CIdx:TCXIndex; source_filename:Pchar; command_line_args:PPchar; num_command_line_args:longint; unsaved_files:PCXUnsavedFile; 
           num_unsaved_files:dword; options:dword; out_TU:PCXTranslationUnit):TCXErrorCode;cdecl;external libgclang;
{*
 * Flags that control how translation units are saved.
 *
 * The enumerators in this enumeration type are meant to be bitwise
 * ORed together to specify which options should be used when
 * saving the translation unit.
  }
{*
   * Used to indicate that no special saving options are needed.
    }
type
  TCXSaveTranslationUnit_Flags =  Longint;
  Const
    CXSaveTranslationUnit_None = $0;

{*
 * Returns the set of flags that is suitable for saving a translation
 * unit.
 *
 * The set of flags returned provide options for
 * \c clang_saveTranslationUnit() by default. The returned flag
 * set contains an unspecified set of options that save translation units with
 * the most commonly-requested data.
  }

function clang_defaultSaveOptions(TU:TCXTranslationUnit):dword;cdecl;external libgclang;
{*
 * Describes the kind of error that occurred (if any) in a call to
 * \c clang_saveTranslationUnit().
  }
{*
   * Indicates that no error occurred while saving a translation unit.
    }
{*
   * Indicates that an unknown error occurred while attempting to save
   * the file.
   *
   * This error typically indicates that file I/O failed when attempting to
   * write the file.
    }
{*
   * Indicates that errors during translation prevented this attempt
   * to save the translation unit.
   *
   * Errors that prevent the translation unit from being saved can be
   * extracted using \c clang_getNumDiagnostics() and \c clang_getDiagnostic().
    }
{*
   * Indicates that the translation unit to be saved was somehow
   * invalid (e.g., NULL).
    }
type
  TCXSaveError =  Longint;
  Const
    CXSaveError_None = 0;
    CXSaveError_Unknown = 1;
    CXSaveError_TranslationErrors = 2;
    CXSaveError_InvalidTU = 3;

{*
 * Saves a translation unit into a serialized representation of
 * that translation unit on disk.
 *
 * Any translation unit that was parsed without error can be saved
 * into a file. The translation unit can then be deserialized into a
 * new \c CXTranslationUnit with \c clang_createTranslationUnit() or,
 * if it is an incomplete translation unit that corresponds to a
 * header, used as a precompiled header when parsing other translation
 * units.
 *
 * \param TU The translation unit to save.
 *
 * \param FileName The file to which the translation unit will be saved.
 *
 * \param options A bitmask of options that affects how the translation unit
 * is saved. This should be a bitwise OR of the
 * CXSaveTranslationUnit_XXX flags.
 *
 * \returns A value that will match one of the enumerators of the CXSaveError
 * enumeration. Zero (CXSaveError_None) indicates that the translation unit was
 * saved successfully, while a non-zero value indicates that a problem occurred.
  }

function clang_saveTranslationUnit(TU:TCXTranslationUnit; FileName:Pchar; options:dword):longint;cdecl;external libgclang;
{*
 * Suspend a translation unit in order to free memory associated with it.
 *
 * A suspended translation unit uses significantly less memory but on the other
 * side does not support any other calls than \c clang_reparseTranslationUnit
 * to resume it or \c clang_disposeTranslationUnit to dispose it completely.
  }
function clang_suspendTranslationUnit(para1:TCXTranslationUnit):dword;cdecl;external libgclang;
{*
 * Destroy the specified CXTranslationUnit object.
  }
procedure clang_disposeTranslationUnit(para1:TCXTranslationUnit);cdecl;external libgclang;
{*
 * Flags that control the reparsing of translation units.
 *
 * The enumerators in this enumeration type are meant to be bitwise
 * ORed together to specify which options should be used when
 * reparsing the translation unit.
  }
{*
   * Used to indicate that no special reparsing options are needed.
    }
type
  TCXReparse_Flags =  Longint;
  Const
    CXReparse_None = $0;

{*
 * Returns the set of flags that is suitable for reparsing a translation
 * unit.
 *
 * The set of flags returned provide options for
 * \c clang_reparseTranslationUnit() by default. The returned flag
 * set contains an unspecified set of optimizations geared toward common uses
 * of reparsing. The set of optimizations enabled may change from one version
 * to the next.
  }

function clang_defaultReparseOptions(TU:TCXTranslationUnit):dword;cdecl;external libgclang;
{*
 * Reparse the source files that produced this translation unit.
 *
 * This routine can be used to re-parse the source files that originally
 * created the given translation unit, for example because those source files
 * have changed (either on disk or as passed via \p unsaved_files). The
 * source code will be reparsed with the same command-line options as it
 * was originally parsed.
 *
 * Reparsing a translation unit invalidates all cursors and source locations
 * that refer into that translation unit. This makes reparsing a translation
 * unit semantically equivalent to destroying the translation unit and then
 * creating a new translation unit with the same command-line arguments.
 * However, it may be more efficient to reparse a translation
 * unit using this routine.
 *
 * \param TU The translation unit whose contents will be re-parsed. The
 * translation unit must originally have been built with
 * \c clang_createTranslationUnitFromSourceFile().
 *
 * \param num_unsaved_files The number of unsaved file entries in \p
 * unsaved_files.
 *
 * \param unsaved_files The files that have not yet been saved to disk
 * but may be required for parsing, including the contents of
 * those files.  The contents and name of these files (as specified by
 * CXUnsavedFile) are copied when necessary, so the client only needs to
 * guarantee their validity until the call to this function returns.
 *
 * \param options A bitset of options composed of the flags in CXReparse_Flags.
 * The function \c clang_defaultReparseOptions() produces a default set of
 * options recommended for most uses, based on the translation unit.
 *
 * \returns 0 if the sources could be reparsed.  A non-zero error code will be
 * returned if reparsing was impossible, such that the translation unit is
 * invalid. In such cases, the only valid call for \c TU is
 * \c clang_disposeTranslationUnit(TU).  The error codes returned by this
 * routine are described by the \c CXErrorCode enum.
  }
function clang_reparseTranslationUnit(TU:TCXTranslationUnit; num_unsaved_files:dword; unsaved_files:PCXUnsavedFile; options:dword):longint;cdecl;external libgclang;
{*
 * Categorizes how memory is being used by a translation unit.
  }
type
  TCXTUResourceUsageKind =  Longint;
  Const
    CXTUResourceUsage_AST = 1;
    CXTUResourceUsage_Identifiers = 2;
    CXTUResourceUsage_Selectors = 3;
    CXTUResourceUsage_GlobalCompletionResults = 4;
    CXTUResourceUsage_SourceManagerContentCache = 5;
    CXTUResourceUsage_AST_SideTables = 6;
    CXTUResourceUsage_SourceManager_Membuffer_Malloc = 7;
    CXTUResourceUsage_SourceManager_Membuffer_MMap = 8;
    CXTUResourceUsage_ExternalASTSource_Membuffer_Malloc = 9;
    CXTUResourceUsage_ExternalASTSource_Membuffer_MMap = 10;
    CXTUResourceUsage_Preprocessor = 11;
    CXTUResourceUsage_PreprocessingRecord = 12;
    CXTUResourceUsage_SourceManager_DataStructures = 13;
    CXTUResourceUsage_Preprocessor_HeaderSearch = 14;
    CXTUResourceUsage_MEMORY_IN_BYTES_BEGIN = CXTUResourceUsage_AST;
    CXTUResourceUsage_MEMORY_IN_BYTES_END = CXTUResourceUsage_Preprocessor_HeaderSearch;
    CXTUResourceUsage_First = CXTUResourceUsage_AST;
    CXTUResourceUsage_Last = CXTUResourceUsage_Preprocessor_HeaderSearch;

{*
 * Returns the human-readable null-terminated C string that represents
 *  the name of the memory category.  This string should never be freed.
  }

function clang_getTUResourceUsageName(kind:TCXTUResourceUsageKind):Pchar;cdecl;external libgclang;
{ The memory usage category.  }
{ Amount of resources used.
      The units will depend on the resource kind.  }
type
  PCXTUResourceUsageEntry = ^TCXTUResourceUsageEntry;
  TCXTUResourceUsageEntry = record
      kind : TCXTUResourceUsageKind;
      amount : dword;
    end;
{*
 * The memory usage of a CXTranslationUnit, broken into categories.
  }
{ Private data member, used for queries.  }
{ The number of entries in the 'entries' array.  }
{ An array of key-value pairs, representing the breakdown of memory
            usage.  }

  PCXTUResourceUsage = ^TCXTUResourceUsage;
  TCXTUResourceUsage = record
      data : pointer;
      numEntries : dword;
      entries : PCXTUResourceUsageEntry;
    end;
{*
 * Return the memory usage of a translation unit.  This object
 *  should be released with clang_disposeCXTUResourceUsage().
  }

function clang_getCXTUResourceUsage(TU:TCXTranslationUnit):TCXTUResourceUsage;cdecl;external libgclang;
procedure clang_disposeCXTUResourceUsage(usage:TCXTUResourceUsage);cdecl;external libgclang;
{*
 * Get target information for this translation unit.
 *
 * The CXTargetInfo object cannot outlive the CXTranslationUnit object.
  }
function clang_getTranslationUnitTargetInfo(CTUnit:TCXTranslationUnit):TCXTargetInfo;cdecl;external libgclang;
{*
 * Destroy the CXTargetInfo object.
  }
procedure clang_TargetInfo_dispose(Info:TCXTargetInfo);cdecl;external libgclang;
{*
 * Get the normalized target triple as a string.
 *
 * Returns the empty string in case of any error.
  }
function clang_TargetInfo_getTriple(Info:TCXTargetInfo):TCXString;cdecl;external libgclang;
{*
 * Get the pointer width of the target in bits.
 *
 * Returns -1 in case of error.
  }
function clang_TargetInfo_getPointerWidth(Info:TCXTargetInfo):longint;cdecl;external libgclang;
{*
 * @
  }
{*
 * Describes the kind of entity that a cursor refers to.
  }
{ Declarations  }
{*
   * A declaration whose specific kind is not exposed via this
   * interface.
   *
   * Unexposed declarations have the same operations as any other kind
   * of declaration; one can extract their location information,
   * spelling, find their definitions, etc. However, the specific kind
   * of the declaration is not reported.
    }
{* A C or C++ struct.  }
{* A C or C++ union.  }
{* A C++ class.  }
{* An enumeration.  }
{*
   * A field (in C) or non-static data member (in C++) in a
   * struct, union, or C++ class.
    }
{* An enumerator constant.  }
{* A function.  }
{* A variable.  }
{* A function or method parameter.  }
{* An Objective-C \@interface.  }
{* An Objective-C \@interface for a category.  }
{* An Objective-C \@protocol declaration.  }
{* An Objective-C \@property declaration.  }
{* An Objective-C instance variable.  }
{* An Objective-C instance method.  }
{* An Objective-C class method.  }
{* An Objective-C \@implementation.  }
{* An Objective-C \@implementation for a category.  }
{* A typedef.  }
{* A C++ class method.  }
{* A C++ namespace.  }
{* A linkage specification, e.g. 'extern "C"'.  }
{* A C++ constructor.  }
{* A C++ destructor.  }
{* A C++ conversion function.  }
{* A C++ template type parameter.  }
{* A C++ non-type template parameter.  }
{* A C++ template template parameter.  }
{* A C++ function template.  }
{* A C++ class template.  }
{* A C++ class template partial specialization.  }
{* A C++ namespace alias declaration.  }
{* A C++ using directive.  }
{* A C++ using declaration.  }
{* A C++ alias declaration  }
{* An Objective-C \@synthesize definition.  }
{* An Objective-C \@dynamic definition.  }
{* An access specifier.  }
{ References  }
{ Decl references  }
{*
   * A reference to a type declaration.
   *
   * A type reference occurs anywhere where a type is named but not
   * declared. For example, given:
   *
   * \code
   * typedef unsigned size_type;
   * size_type size;
   * \endcode
   *
   * The typedef is a declaration of size_type (CXCursor_TypedefDecl),
   * while the type of the variable "size" is referenced. The cursor
   * referenced by the type of size is the typedef for size_type.
    }
{*
   * A reference to a class template, function template, template
   * template parameter, or class template partial specialization.
    }
{*
   * A reference to a namespace or namespace alias.
    }
{*
   * A reference to a member of a struct, union, or class that occurs in
   * some non-expression context, e.g., a designated initializer.
    }
{*
   * A reference to a labeled statement.
   *
   * This cursor kind is used to describe the jump to "start_over" in the
   * goto statement in the following example:
   *
   * \code
   *   start_over:
   *     ++counter;
   *
   *     goto start_over;
   * \endcode
   *
   * A label reference cursor refers to a label statement.
    }
{*
   * A reference to a set of overloaded functions or function templates
   * that has not yet been resolved to a specific function or function template.
   *
   * An overloaded declaration reference cursor occurs in C++ templates where
   * a dependent name refers to a function. For example:
   *
   * \code
   * template<typename T> void swap(T&, T&);
   *
   * struct X  ... ;
   * void swap(X&, X&);
   *
   * template<typename T>
   * void reverse(T* first, T* last) 
   *   while (first < last - 1) 
   *     swap(*first, *--last);
   *     ++first;
   *   
   * 
   *
   * struct Y  ;
   * void swap(Y&, Y&);
   * \endcode
   *
   * Here, the identifier "swap" is associated with an overloaded declaration
   * reference. In the template definition, "swap" refers to either of the two
   * "swap" functions declared above, so both results will be available. At
   * instantiation time, "swap" may also refer to other functions found via
   * argument-dependent lookup (e.g., the "swap" function at the end of the
   * example).
   *
   * The functions \c clang_getNumOverloadedDecls() and
   * \c clang_getOverloadedDecl() can be used to retrieve the definitions
   * referenced by this cursor.
    }
{*
   * A reference to a variable that occurs in some non-expression
   * context, e.g., a C++ lambda capture list.
    }
{ Error conditions  }
{ Expressions  }
{*
   * An expression whose specific kind is not exposed via this
   * interface.
   *
   * Unexposed expressions have the same operations as any other kind
   * of expression; one can extract their location information,
   * spelling, children, etc. However, the specific kind of the
   * expression is not reported.
    }
{*
   * An expression that refers to some value declaration, such
   * as a function, variable, or enumerator.
    }
{*
   * An expression that refers to a member of a struct, union,
   * class, Objective-C class, etc.
    }
{* An expression that calls a function.  }
{* An expression that sends a message to an Objective-C
   object or class.  }
{* An expression that represents a block literal.  }
{* An integer literal.
    }
{* A floating point number literal.
    }
{* An imaginary number literal.
    }
{* A string literal.
    }
{* A character literal.
    }
{* A parenthesized expression, e.g. "(1)".
   *
   * This AST node is only formed if full location information is requested.
    }
{* This represents the unary-expression's (except sizeof and
   * alignof).
    }
{* [C99 6.5.2.1] Array Subscripting.
    }
{* A builtin binary operation expression such as "x + y" or
   * "x <= y".
    }
{* Compound assignment such as "+=".
    }
{* The ?: ternary operator.
    }
{* An explicit cast in C (C99 6.5.4) or a C-style cast in C++
   * (C++ [expr.cast]), which uses the syntax (Type)expr.
   *
   * For example: (int)f.
    }
{* [C99 6.5.2.5]
    }
{* Describes an C or C++ initializer list.
    }
{* The GNU address of label extension, representing &&label.
    }
{* This is the GNU Statement Expression extension: (int X=4; X;)
    }
{* Represents a C11 generic selection.
    }
{* Implements the GNU __null extension, which is a name for a null
   * pointer constant that has integral type (e.g., int or long) and is the same
   * size and alignment as a pointer.
   *
   * The __null extension is typically only used by system headers, which define
   * NULL as __null in C++ rather than using 0 (which is an integer that may not
   * match the size of a pointer).
    }
{* C++'s static_cast<> expression.
    }
{* C++'s dynamic_cast<> expression.
    }
{* C++'s reinterpret_cast<> expression.
    }
{* C++'s const_cast<> expression.
    }
{* Represents an explicit C++ type conversion that uses "functional"
   * notion (C++ [expr.type.conv]).
   *
   * Example:
   * \code
   *   x = int(0.5);
   * \endcode
    }
{* A C++ typeid expression (C++ [expr.typeid]).
    }
{* [C++ 2.13.5] C++ Boolean Literal.
    }
{* [C++0x 2.14.7] C++ Pointer Literal.
    }
{* Represents the "this" expression in C++
    }
{* [C++ 15] C++ Throw Expression.
   *
   * This handles 'throw' and 'throw' assignment-expression. When
   * assignment-expression isn't present, Op will be null.
    }
{* A new expression for memory allocation and constructor calls, e.g:
   * "new CXXNewExpr(foo)".
    }
{* A delete expression for memory deallocation and destructor calls,
   * e.g. "delete[] pArray".
    }
{* A unary expression. (noexcept, sizeof, or other traits)
    }
{* An Objective-C string literal i.e. @"foo".
    }
{* An Objective-C \@encode expression.
    }
{* An Objective-C \@selector expression.
    }
{* An Objective-C \@protocol expression.
    }
{* An Objective-C "bridged" cast expression, which casts between
   * Objective-C pointers and C pointers, transferring ownership in the process.
   *
   * \code
   *   NSString *str = (__bridge_transfer NSString *)CFCreateString();
   * \endcode
    }
{* Represents a C++0x pack expansion that produces a sequence of
   * expressions.
   *
   * A pack expansion expression contains a pattern (which itself is an
   * expression) followed by an ellipsis. For example:
   *
   * \code
   * template<typename F, typename ...Types>
   * void forward(F f, Types &&...args) 
   *  f(static_cast<Types&&>(args)...);
   * 
   * \endcode
    }
{* Represents an expression that computes the length of a parameter
   * pack.
   *
   * \code
   * template<typename ...Types>
   * struct count 
   *   static const unsigned value = sizeof...(Types);
   * ;
   * \endcode
    }
{ Represents a C++ lambda expression that produces a local function
   * object.
   *
   * \code
   * void abssort(float *x, unsigned N) 
   *   std::sort(x, x + N,
   *             [](float a, float b) 
   *               return std::abs(a) < std::abs(b);
   *             );
   * 
   * \endcode
    }
{* Objective-c Boolean Literal.
    }
{* Represents the "self" expression in an Objective-C method.
    }
{* OpenMP 5.0 [2.1.5, Array Section].
   * OpenACC 3.3 [2.7.1, Data Specification for Data Clauses (Sub Arrays)]
    }
{* Represents an @available(...) check.
    }
{*
   * Fixed point literal
    }
{* OpenMP 5.0 [2.1.4, Array Shaping].
    }
{*
   * OpenMP 5.0 [2.1.6 Iterators]
    }
{* OpenCL's addrspace_cast<> expression.
    }
{*
   * Expression that references a C++20 concept.
    }
{*
   * Expression that references a C++20 requires expression.
    }
{*
   * Expression that references a C++20 parenthesized list aggregate
   * initializer.
    }
{*
   *  Represents a C++26 pack indexing expression.
    }
{ Statements  }
{*
   * A statement whose specific kind is not exposed via this
   * interface.
   *
   * Unexposed statements have the same operations as any other kind of
   * statement; one can extract their location information, spelling,
   * children, etc. However, the specific kind of the statement is not
   * reported.
    }
{* A labelled statement in a function.
   *
   * This cursor kind is used to describe the "start_over:" label statement in
   * the following example:
   *
   * \code
   *   start_over:
   *     ++counter;
   * \endcode
   *
    }
{* A group of statements like  stmt stmt .
   *
   * This cursor kind is used to describe compound statements, e.g. function
   * bodies.
    }
{* A case statement.
    }
{* A default statement.
    }
{* An if statement
    }
{* A switch statement.
    }
{* A while statement.
    }
{* A do statement.
    }
{* A for statement.
    }
{* A goto statement.
    }
{* An indirect goto statement.
    }
{* A continue statement.
    }
{* A break statement.
    }
{* A return statement.
    }
{* A GCC inline assembly statement extension.
    }
{* Objective-C's overall \@try-\@catch-\@finally statement.
    }
{* Objective-C's \@catch statement.
    }
{* Objective-C's \@finally statement.
    }
{* Objective-C's \@throw statement.
    }
{* Objective-C's \@synchronized statement.
    }
{* Objective-C's autorelease pool statement.
    }
{* Objective-C's collection statement.
    }
{* C++'s catch statement.
    }
{* C++'s try statement.
    }
{* C++'s for (* : *) statement.
    }
{* Windows Structured Exception Handling's try statement.
    }
{* Windows Structured Exception Handling's except statement.
    }
{* Windows Structured Exception Handling's finally statement.
    }
{* A MS inline assembly statement extension.
    }
{* The null statement ";": C99 6.8.3p3.
   *
   * This cursor kind is used to describe the null statement.
    }
{* Adaptor class for mixing declarations with statements and
   * expressions.
    }
{* OpenMP parallel directive.
    }
{* OpenMP SIMD directive.
    }
{* OpenMP for directive.
    }
{* OpenMP sections directive.
    }
{* OpenMP section directive.
    }
{* OpenMP single directive.
    }
{* OpenMP parallel for directive.
    }
{* OpenMP parallel sections directive.
    }
{* OpenMP task directive.
    }
{* OpenMP master directive.
    }
{* OpenMP critical directive.
    }
{* OpenMP taskyield directive.
    }
{* OpenMP barrier directive.
    }
{* OpenMP taskwait directive.
    }
{* OpenMP flush directive.
    }
{* Windows Structured Exception Handling's leave statement.
    }
{* OpenMP ordered directive.
    }
{* OpenMP atomic directive.
    }
{* OpenMP for SIMD directive.
    }
{* OpenMP parallel for SIMD directive.
    }
{* OpenMP target directive.
    }
{* OpenMP teams directive.
    }
{* OpenMP taskgroup directive.
    }
{* OpenMP cancellation point directive.
    }
{* OpenMP cancel directive.
    }
{* OpenMP target data directive.
    }
{* OpenMP taskloop directive.
    }
{* OpenMP taskloop simd directive.
    }
{* OpenMP distribute directive.
    }
{* OpenMP target enter data directive.
    }
{* OpenMP target exit data directive.
    }
{* OpenMP target parallel directive.
    }
{* OpenMP target parallel for directive.
    }
{* OpenMP target update directive.
    }
{* OpenMP distribute parallel for directive.
    }
{* OpenMP distribute parallel for simd directive.
    }
{* OpenMP distribute simd directive.
    }
{* OpenMP target parallel for simd directive.
    }
{* OpenMP target simd directive.
    }
{* OpenMP teams distribute directive.
    }
{* OpenMP teams distribute simd directive.
    }
{* OpenMP teams distribute parallel for simd directive.
    }
{* OpenMP teams distribute parallel for directive.
    }
{* OpenMP target teams directive.
    }
{* OpenMP target teams distribute directive.
    }
{* OpenMP target teams distribute parallel for directive.
    }
{* OpenMP target teams distribute parallel for simd directive.
    }
{* OpenMP target teams distribute simd directive.
    }
{* C++2a std::bit_cast expression.
    }
{* OpenMP master taskloop directive.
    }
{* OpenMP parallel master taskloop directive.
    }
{* OpenMP master taskloop simd directive.
    }
{* OpenMP parallel master taskloop simd directive.
    }
{* OpenMP parallel master directive.
    }
{* OpenMP depobj directive.
    }
{* OpenMP scan directive.
    }
{* OpenMP tile directive.
    }
{* OpenMP canonical loop.
    }
{* OpenMP interop directive.
    }
{* OpenMP dispatch directive.
    }
{* OpenMP masked directive.
    }
{* OpenMP unroll directive.
    }
{* OpenMP metadirective directive.
    }
{* OpenMP loop directive.
    }
{* OpenMP teams loop directive.
    }
{* OpenMP target teams loop directive.
    }
{* OpenMP parallel loop directive.
    }
{* OpenMP target parallel loop directive.
    }
{* OpenMP parallel masked directive.
    }
{* OpenMP masked taskloop directive.
    }
{* OpenMP masked taskloop simd directive.
    }
{* OpenMP parallel masked taskloop directive.
    }
{* OpenMP parallel masked taskloop simd directive.
    }
{* OpenMP error directive.
    }
{* OpenMP scope directive.
    }
{* OpenMP reverse directive.
    }
{* OpenMP interchange directive.
    }
{* OpenMP assume directive.
    }
{* OpenACC Compute Construct.
    }
{* OpenACC Loop Construct.
    }
{* OpenACC Combined Constructs.
    }
{* OpenACC data Construct.
    }
{* OpenACC enter data Construct.
    }
{* OpenACC exit data Construct.
    }
{* OpenACC host_data Construct.
    }
{* OpenACC wait Construct.
    }
{* OpenACC init Construct.
    }
{* OpenACC shutdown Construct.
    }
{* OpenACC set Construct.
    }
{* OpenACC update Construct.
    }
{*
   * Cursor that represents the translation unit itself.
   *
   * The translation unit cursor exists primarily to act as the root
   * cursor for traversing the contents of a translation unit.
    }
{ Attributes  }
{*
   * An attribute whose specific kind is not exposed via this
   * interface.
    }
{ Preprocessing  }
{ Extra Declarations  }
{*
   * A module import declaration.
    }
{*
   * A static_assert or _Static_assert node
    }
{*
   * a friend declaration.
    }
{*
   * a concept declaration.
    }
{*
   * A code completion overload candidate.
    }
type
  TCXCursorKind =  Longint;
  Const
    CXCursor_UnexposedDecl = 1;
    CXCursor_StructDecl = 2;
    CXCursor_UnionDecl = 3;
    CXCursor_ClassDecl = 4;
    CXCursor_EnumDecl = 5;
    CXCursor_FieldDecl = 6;
    CXCursor_EnumConstantDecl = 7;
    CXCursor_FunctionDecl = 8;
    CXCursor_VarDecl = 9;
    CXCursor_ParmDecl = 10;
    CXCursor_ObjCInterfaceDecl = 11;
    CXCursor_ObjCCategoryDecl = 12;
    CXCursor_ObjCProtocolDecl = 13;
    CXCursor_ObjCPropertyDecl = 14;
    CXCursor_ObjCIvarDecl = 15;
    CXCursor_ObjCInstanceMethodDecl = 16;
    CXCursor_ObjCClassMethodDecl = 17;
    CXCursor_ObjCImplementationDecl = 18;
    CXCursor_ObjCCategoryImplDecl = 19;
    CXCursor_TypedefDecl = 20;
    CXCursor_CXXMethod = 21;
    CXCursor_Namespace = 22;
    CXCursor_LinkageSpec = 23;
    CXCursor_Constructor = 24;
    CXCursor_Destructor = 25;
    CXCursor_ConversionFunction = 26;
    CXCursor_TemplateTypeParameter = 27;
    CXCursor_NonTypeTemplateParameter = 28;
    CXCursor_TemplateTemplateParameter = 29;
    CXCursor_FunctionTemplate = 30;
    CXCursor_ClassTemplate = 31;
    CXCursor_ClassTemplatePartialSpecialization = 32;
    CXCursor_NamespaceAlias = 33;
    CXCursor_UsingDirective = 34;
    CXCursor_UsingDeclaration = 35;
    CXCursor_TypeAliasDecl = 36;
    CXCursor_ObjCSynthesizeDecl = 37;
    CXCursor_ObjCDynamicDecl = 38;
    CXCursor_CXXAccessSpecifier = 39;
    CXCursor_FirstDecl = CXCursor_UnexposedDecl;
    CXCursor_LastDecl = CXCursor_CXXAccessSpecifier;
    CXCursor_FirstRef = 40;
    CXCursor_ObjCSuperClassRef = 40;
    CXCursor_ObjCProtocolRef = 41;
    CXCursor_ObjCClassRef = 42;
    CXCursor_TypeRef = 43;
    CXCursor_CXXBaseSpecifier = 44;
    CXCursor_TemplateRef = 45;
    CXCursor_NamespaceRef = 46;
    CXCursor_MemberRef = 47;
    CXCursor_LabelRef = 48;
    CXCursor_OverloadedDeclRef = 49;
    CXCursor_VariableRef = 50;
    CXCursor_LastRef = CXCursor_VariableRef;
    CXCursor_FirstInvalid = 70;
    CXCursor_InvalidFile = 70;
    CXCursor_NoDeclFound = 71;
    CXCursor_NotImplemented = 72;
    CXCursor_InvalidCode = 73;
    CXCursor_LastInvalid = CXCursor_InvalidCode;
    CXCursor_FirstExpr = 100;
    CXCursor_UnexposedExpr = 100;
    CXCursor_DeclRefExpr = 101;
    CXCursor_MemberRefExpr = 102;
    CXCursor_CallExpr = 103;
    CXCursor_ObjCMessageExpr = 104;
    CXCursor_BlockExpr = 105;
    CXCursor_IntegerLiteral = 106;
    CXCursor_FloatingLiteral = 107;
    CXCursor_ImaginaryLiteral = 108;
    CXCursor_StringLiteral = 109;
    CXCursor_CharacterLiteral = 110;
    CXCursor_ParenExpr = 111;
    CXCursor_UnaryOperator = 112;
    CXCursor_ArraySubscriptExpr = 113;
    CXCursor_BinaryOperator = 114;
    CXCursor_CompoundAssignOperator = 115;
    CXCursor_ConditionalOperator = 116;
    CXCursor_CStyleCastExpr = 117;
    CXCursor_CompoundLiteralExpr = 118;
    CXCursor_InitListExpr = 119;
    CXCursor_AddrLabelExpr = 120;
    CXCursor_StmtExpr = 121;
    CXCursor_GenericSelectionExpr = 122;
    CXCursor_GNUNullExpr = 123;
    CXCursor_CXXStaticCastExpr = 124;
    CXCursor_CXXDynamicCastExpr = 125;
    CXCursor_CXXReinterpretCastExpr = 126;
    CXCursor_CXXConstCastExpr = 127;
    CXCursor_CXXFunctionalCastExpr = 128;
    CXCursor_CXXTypeidExpr = 129;
    CXCursor_CXXBoolLiteralExpr = 130;
    CXCursor_CXXNullPtrLiteralExpr = 131;
    CXCursor_CXXThisExpr = 132;
    CXCursor_CXXThrowExpr = 133;
    CXCursor_CXXNewExpr = 134;
    CXCursor_CXXDeleteExpr = 135;
    CXCursor_UnaryExpr = 136;
    CXCursor_ObjCStringLiteral = 137;
    CXCursor_ObjCEncodeExpr = 138;
    CXCursor_ObjCSelectorExpr = 139;
    CXCursor_ObjCProtocolExpr = 140;
    CXCursor_ObjCBridgedCastExpr = 141;
    CXCursor_PackExpansionExpr = 142;
    CXCursor_SizeOfPackExpr = 143;
    CXCursor_LambdaExpr = 144;
    CXCursor_ObjCBoolLiteralExpr = 145;
    CXCursor_ObjCSelfExpr = 146;
    CXCursor_ArraySectionExpr = 147;
    CXCursor_ObjCAvailabilityCheckExpr = 148;
    CXCursor_FixedPointLiteral = 149;
    CXCursor_OMPArrayShapingExpr = 150;
    CXCursor_OMPIteratorExpr = 151;
    CXCursor_CXXAddrspaceCastExpr = 152;
    CXCursor_ConceptSpecializationExpr = 153;
    CXCursor_RequiresExpr = 154;
    CXCursor_CXXParenListInitExpr = 155;
    CXCursor_PackIndexingExpr = 156;
    CXCursor_LastExpr = CXCursor_PackIndexingExpr;
    CXCursor_FirstStmt = 200;
    CXCursor_UnexposedStmt = 200;
    CXCursor_LabelStmt = 201;
    CXCursor_CompoundStmt = 202;
    CXCursor_CaseStmt = 203;
    CXCursor_DefaultStmt = 204;
    CXCursor_IfStmt = 205;
    CXCursor_SwitchStmt = 206;
    CXCursor_WhileStmt = 207;
    CXCursor_DoStmt = 208;
    CXCursor_ForStmt = 209;
    CXCursor_GotoStmt = 210;
    CXCursor_IndirectGotoStmt = 211;
    CXCursor_ContinueStmt = 212;
    CXCursor_BreakStmt = 213;
    CXCursor_ReturnStmt = 214;
    CXCursor_GCCAsmStmt = 215;
    CXCursor_AsmStmt = CXCursor_GCCAsmStmt;
    CXCursor_ObjCAtTryStmt = 216;
    CXCursor_ObjCAtCatchStmt = 217;
    CXCursor_ObjCAtFinallyStmt = 218;
    CXCursor_ObjCAtThrowStmt = 219;
    CXCursor_ObjCAtSynchronizedStmt = 220;
    CXCursor_ObjCAutoreleasePoolStmt = 221;
    CXCursor_ObjCForCollectionStmt = 222;
    CXCursor_CXXCatchStmt = 223;
    CXCursor_CXXTryStmt = 224;
    CXCursor_CXXForRangeStmt = 225;
    CXCursor_SEHTryStmt = 226;
    CXCursor_SEHExceptStmt = 227;
    CXCursor_SEHFinallyStmt = 228;
    CXCursor_MSAsmStmt = 229;
    CXCursor_NullStmt = 230;
    CXCursor_DeclStmt = 231;
    CXCursor_OMPParallelDirective = 232;
    CXCursor_OMPSimdDirective = 233;
    CXCursor_OMPForDirective = 234;
    CXCursor_OMPSectionsDirective = 235;
    CXCursor_OMPSectionDirective = 236;
    CXCursor_OMPSingleDirective = 237;
    CXCursor_OMPParallelForDirective = 238;
    CXCursor_OMPParallelSectionsDirective = 239;
    CXCursor_OMPTaskDirective = 240;
    CXCursor_OMPMasterDirective = 241;
    CXCursor_OMPCriticalDirective = 242;
    CXCursor_OMPTaskyieldDirective = 243;
    CXCursor_OMPBarrierDirective = 244;
    CXCursor_OMPTaskwaitDirective = 245;
    CXCursor_OMPFlushDirective = 246;
    CXCursor_SEHLeaveStmt = 247;
    CXCursor_OMPOrderedDirective = 248;
    CXCursor_OMPAtomicDirective = 249;
    CXCursor_OMPForSimdDirective = 250;
    CXCursor_OMPParallelForSimdDirective = 251;
    CXCursor_OMPTargetDirective = 252;
    CXCursor_OMPTeamsDirective = 253;
    CXCursor_OMPTaskgroupDirective = 254;
    CXCursor_OMPCancellationPointDirective = 255;
    CXCursor_OMPCancelDirective = 256;
    CXCursor_OMPTargetDataDirective = 257;
    CXCursor_OMPTaskLoopDirective = 258;
    CXCursor_OMPTaskLoopSimdDirective = 259;
    CXCursor_OMPDistributeDirective = 260;
    CXCursor_OMPTargetEnterDataDirective = 261;
    CXCursor_OMPTargetExitDataDirective = 262;
    CXCursor_OMPTargetParallelDirective = 263;
    CXCursor_OMPTargetParallelForDirective = 264;
    CXCursor_OMPTargetUpdateDirective = 265;
    CXCursor_OMPDistributeParallelForDirective = 266;
    CXCursor_OMPDistributeParallelForSimdDirective = 267;
    CXCursor_OMPDistributeSimdDirective = 268;
    CXCursor_OMPTargetParallelForSimdDirective = 269;
    CXCursor_OMPTargetSimdDirective = 270;
    CXCursor_OMPTeamsDistributeDirective = 271;
    CXCursor_OMPTeamsDistributeSimdDirective = 272;
    CXCursor_OMPTeamsDistributeParallelForSimdDirective = 273;
    CXCursor_OMPTeamsDistributeParallelForDirective = 274;
    CXCursor_OMPTargetTeamsDirective = 275;
    CXCursor_OMPTargetTeamsDistributeDirective = 276;
    CXCursor_OMPTargetTeamsDistributeParallelForDirective = 277;
    CXCursor_OMPTargetTeamsDistributeParallelForSimdDirective = 278;
    CXCursor_OMPTargetTeamsDistributeSimdDirective = 279;
    CXCursor_BuiltinBitCastExpr = 280;
    CXCursor_OMPMasterTaskLoopDirective = 281;
    CXCursor_OMPParallelMasterTaskLoopDirective = 282;
    CXCursor_OMPMasterTaskLoopSimdDirective = 283;
    CXCursor_OMPParallelMasterTaskLoopSimdDirective = 284;
    CXCursor_OMPParallelMasterDirective = 285;
    CXCursor_OMPDepobjDirective = 286;
    CXCursor_OMPScanDirective = 287;
    CXCursor_OMPTileDirective = 288;
    CXCursor_OMPCanonicalLoop = 289;
    CXCursor_OMPInteropDirective = 290;
    CXCursor_OMPDispatchDirective = 291;
    CXCursor_OMPMaskedDirective = 292;
    CXCursor_OMPUnrollDirective = 293;
    CXCursor_OMPMetaDirective = 294;
    CXCursor_OMPGenericLoopDirective = 295;
    CXCursor_OMPTeamsGenericLoopDirective = 296;
    CXCursor_OMPTargetTeamsGenericLoopDirective = 297;
    CXCursor_OMPParallelGenericLoopDirective = 298;
    CXCursor_OMPTargetParallelGenericLoopDirective = 299;
    CXCursor_OMPParallelMaskedDirective = 300;
    CXCursor_OMPMaskedTaskLoopDirective = 301;
    CXCursor_OMPMaskedTaskLoopSimdDirective = 302;
    CXCursor_OMPParallelMaskedTaskLoopDirective = 303;
    CXCursor_OMPParallelMaskedTaskLoopSimdDirective = 304;
    CXCursor_OMPErrorDirective = 305;
    CXCursor_OMPScopeDirective = 306;
    CXCursor_OMPReverseDirective = 307;
    CXCursor_OMPInterchangeDirective = 308;
    CXCursor_OMPAssumeDirective = 309;
    CXCursor_OpenACCComputeConstruct = 320;
    CXCursor_OpenACCLoopConstruct = 321;
    CXCursor_OpenACCCombinedConstruct = 322;
    CXCursor_OpenACCDataConstruct = 323;
    CXCursor_OpenACCEnterDataConstruct = 324;
    CXCursor_OpenACCExitDataConstruct = 325;
    CXCursor_OpenACCHostDataConstruct = 326;
    CXCursor_OpenACCWaitConstruct = 327;
    CXCursor_OpenACCInitConstruct = 328;
    CXCursor_OpenACCShutdownConstruct = 329;
    CXCursor_OpenACCSetConstruct = 330;
    CXCursor_OpenACCUpdateConstruct = 331;
    CXCursor_LastStmt = CXCursor_OpenACCUpdateConstruct;
    CXCursor_TranslationUnit = 350;
    CXCursor_FirstAttr = 400;
    CXCursor_UnexposedAttr = 400;
    CXCursor_IBActionAttr = 401;
    CXCursor_IBOutletAttr = 402;
    CXCursor_IBOutletCollectionAttr = 403;
    CXCursor_CXXFinalAttr = 404;
    CXCursor_CXXOverrideAttr = 405;
    CXCursor_AnnotateAttr = 406;
    CXCursor_AsmLabelAttr = 407;
    CXCursor_PackedAttr = 408;
    CXCursor_PureAttr = 409;
    CXCursor_ConstAttr = 410;
    CXCursor_NoDuplicateAttr = 411;
    CXCursor_CUDAConstantAttr = 412;
    CXCursor_CUDADeviceAttr = 413;
    CXCursor_CUDAGlobalAttr = 414;
    CXCursor_CUDAHostAttr = 415;
    CXCursor_CUDASharedAttr = 416;
    CXCursor_VisibilityAttr = 417;
    CXCursor_DLLExport = 418;
    CXCursor_DLLImport = 419;
    CXCursor_NSReturnsRetained = 420;
    CXCursor_NSReturnsNotRetained = 421;
    CXCursor_NSReturnsAutoreleased = 422;
    CXCursor_NSConsumesSelf = 423;
    CXCursor_NSConsumed = 424;
    CXCursor_ObjCException = 425;
    CXCursor_ObjCNSObject = 426;
    CXCursor_ObjCIndependentClass = 427;
    CXCursor_ObjCPreciseLifetime = 428;
    CXCursor_ObjCReturnsInnerPointer = 429;
    CXCursor_ObjCRequiresSuper = 430;
    CXCursor_ObjCRootClass = 431;
    CXCursor_ObjCSubclassingRestricted = 432;
    CXCursor_ObjCExplicitProtocolImpl = 433;
    CXCursor_ObjCDesignatedInitializer = 434;
    CXCursor_ObjCRuntimeVisible = 435;
    CXCursor_ObjCBoxable = 436;
    CXCursor_FlagEnum = 437;
    CXCursor_ConvergentAttr = 438;
    CXCursor_WarnUnusedAttr = 439;
    CXCursor_WarnUnusedResultAttr = 440;
    CXCursor_AlignedAttr = 441;
    CXCursor_LastAttr = CXCursor_AlignedAttr;
    CXCursor_PreprocessingDirective = 500;
    CXCursor_MacroDefinition = 501;
    CXCursor_MacroExpansion = 502;
    CXCursor_MacroInstantiation = CXCursor_MacroExpansion;
    CXCursor_InclusionDirective = 503;
    CXCursor_FirstPreprocessing = CXCursor_PreprocessingDirective;
    CXCursor_LastPreprocessing = CXCursor_InclusionDirective;
    CXCursor_ModuleImportDecl = 600;
    CXCursor_TypeAliasTemplateDecl = 601;
    CXCursor_StaticAssert = 602;
    CXCursor_FriendDecl = 603;
    CXCursor_ConceptDecl = 604;
    CXCursor_FirstExtraDecl = CXCursor_ModuleImportDecl;
    CXCursor_LastExtraDecl = CXCursor_ConceptDecl;
    CXCursor_OverloadCandidate = 700;

{*
 * A cursor representing some element in the abstract syntax tree for
 * a translation unit.
 *
 * The cursor abstraction unifies the different kinds of entities in a
 * program--declaration, statements, expressions, references to declarations,
 * etc.--under a single "cursor" abstraction with a common set of operations.
 * Common operation for a cursor include: getting the physical location in
 * a source file where the cursor points, getting the name associated with a
 * cursor, and retrieving cursors for any child nodes of a particular cursor.
 *
 * Cursors can be produced in two specific ways.
 * clang_getTranslationUnitCursor() produces a cursor for a translation unit,
 * from which one can use clang_visitChildren() to explore the rest of the
 * translation unit. clang_getCursor() maps from a physical source location
 * to the entity that resides at that location, allowing one to map from the
 * source code into the AST.
  }
type
  PCXCursor = ^TCXCursor;
  TCXCursor = record
      kind : TCXCursorKind;
      xdata : longint;
      data : array[0..2] of pointer;
    end;
{*
 * \defgroup CINDEX_CURSOR_MANIP Cursor manipulations
 *
 * @
  }
{*
 * Retrieve the NULL cursor, which represents no entity.
  }

function clang_getNullCursor:TCXCursor;cdecl;external libgclang;
{*
 * Retrieve the cursor that represents the given translation unit.
 *
 * The translation unit cursor can be used to start traversing the
 * various declarations within the given translation unit.
  }
function clang_getTranslationUnitCursor(para1:TCXTranslationUnit):TCXCursor;cdecl;external libgclang;
{*
 * Determine whether two cursors are equivalent.
  }
function clang_equalCursors(para1:TCXCursor; para2:TCXCursor):dword;cdecl;external libgclang;
{*
 * Returns non-zero if \p cursor is null.
  }
function clang_Cursor_isNull(cursor:TCXCursor):longint;cdecl;external libgclang;
{*
 * Compute a hash value for the given cursor.
  }
function clang_hashCursor(para1:TCXCursor):dword;cdecl;external libgclang;
{*
 * Retrieve the kind of the given cursor.
  }
function clang_getCursorKind(para1:TCXCursor):TCXCursorKind;cdecl;external libgclang;
{*
 * Determine whether the given cursor kind represents a declaration.
  }
function clang_isDeclaration(para1:TCXCursorKind):dword;cdecl;external libgclang;
{*
 * Determine whether the given declaration is invalid.
 *
 * A declaration is invalid if it could not be parsed successfully.
 *
 * \returns non-zero if the cursor represents a declaration and it is
 * invalid, otherwise NULL.
  }
function clang_isInvalidDeclaration(para1:TCXCursor):dword;cdecl;external libgclang;
{*
 * Determine whether the given cursor kind represents a simple
 * reference.
 *
 * Note that other kinds of cursors (such as expressions) can also refer to
 * other cursors. Use clang_getCursorReferenced() to determine whether a
 * particular cursor refers to another entity.
  }
function clang_isReference(para1:TCXCursorKind):dword;cdecl;external libgclang;
{*
 * Determine whether the given cursor kind represents an expression.
  }
function clang_isExpression(para1:TCXCursorKind):dword;cdecl;external libgclang;
{*
 * Determine whether the given cursor kind represents a statement.
  }
function clang_isStatement(para1:TCXCursorKind):dword;cdecl;external libgclang;
{*
 * Determine whether the given cursor kind represents an attribute.
  }
function clang_isAttribute(para1:TCXCursorKind):dword;cdecl;external libgclang;
{*
 * Determine whether the given cursor has any attributes.
  }
function clang_Cursor_hasAttrs(C:TCXCursor):dword;cdecl;external libgclang;
{*
 * Determine whether the given cursor kind represents an invalid
 * cursor.
  }
function clang_isInvalid(para1:TCXCursorKind):dword;cdecl;external libgclang;
{*
 * Determine whether the given cursor kind represents a translation
 * unit.
  }
function clang_isTranslationUnit(para1:TCXCursorKind):dword;cdecl;external libgclang;
{**
 * Determine whether the given cursor represents a preprocessing
 * element, such as a preprocessor directive or macro instantiation.
  }
function clang_isPreprocessing(para1:TCXCursorKind):dword;cdecl;external libgclang;
{**
 * Determine whether the given cursor represents a currently
 *  unexposed piece of the AST (e.g., CXCursor_UnexposedStmt).
  }
function clang_isUnexposed(para1:TCXCursorKind):dword;cdecl;external libgclang;
{*
 * Describe the linkage of the entity referred to by a cursor.
  }
{* This value indicates that no linkage information is available
   * for a provided CXCursor.  }
{*
   * This is the linkage for variables, parameters, and so on that
   *  have automatic storage.  This covers normal (non-extern) local variables.
    }
{* This is the linkage for static variables and static functions.  }
{* This is the linkage for entities with external linkage that live
   * in C++ anonymous namespaces. }
{* This is the linkage for entities with true, external linkage.  }
type
  TCXLinkageKind =  Longint;
  Const
    CXLinkage_Invalid = 0;
    CXLinkage_NoLinkage = 1;
    CXLinkage_Internal = 2;
    CXLinkage_UniqueExternal = 3;
    CXLinkage_External = 4;

{*
 * Determine the linkage of the entity referred to by a given cursor.
  }

function clang_getCursorLinkage(cursor:TCXCursor):TCXLinkageKind;cdecl;external libgclang;
{* This value indicates that no visibility information is available
   * for a provided CXCursor.  }
{* Symbol not seen by the linker.  }
{* Symbol seen by the linker but resolves to a symbol inside this object.  }
{* Symbol seen by the linker and acts like a normal symbol.  }
type
  TCXVisibilityKind =  Longint;
  Const
    CXVisibility_Invalid = 0;
    CXVisibility_Hidden = 1;
    CXVisibility_Protected = 2;
    CXVisibility_Default = 3;

{*
 * Describe the visibility of the entity referred to by a cursor.
 *
 * This returns the default visibility if not explicitly specified by
 * a visibility attribute. The default visibility may be changed by
 * commandline arguments.
 *
 * \param cursor The cursor to query.
 *
 * \returns The visibility of the cursor.
  }

function clang_getCursorVisibility(cursor:TCXCursor):TCXVisibilityKind;cdecl;external libgclang;
{*
 * Determine the availability of the entity that this cursor refers to,
 * taking the current target platform into account.
 *
 * \param cursor The cursor to query.
 *
 * \returns The availability of the cursor.
  }
function clang_getCursorAvailability(cursor:TCXCursor):TCXAvailabilityKind;cdecl;external libgclang;
{*
 * Describes the availability of a given entity on a particular platform, e.g.,
 * a particular class might only be available on Mac OS 10.7 or newer.
  }
{*
   * A string that describes the platform for which this structure
   * provides availability information.
   *
   * Possible values are "ios" or "macos".
    }
{*
   * The version number in which this entity was introduced.
    }
{*
   * The version number in which this entity was deprecated (but is
   * still available).
    }
{*
   * The version number in which this entity was obsoleted, and therefore
   * is no longer available.
    }
{*
   * Whether the entity is unconditionally unavailable on this platform.
    }
{*
   * An optional message to provide to a user of this API, e.g., to
   * suggest replacement APIs.
    }
type
  PCXPlatformAvailability = ^TCXPlatformAvailability;
  TCXPlatformAvailability = record
      Platform : TCXString;
      Introduced : TCXVersion;
      Deprecated : TCXVersion;
      Obsoleted : TCXVersion;
      Unavailable : longint;
      Message : TCXString;
    end;
{*
 * Determine the availability of the entity that this cursor refers to
 * on any platforms for which availability information is known.
 *
 * \param cursor The cursor to query.
 *
 * \param always_deprecated If non-NULL, will be set to indicate whether the
 * entity is deprecated on all platforms.
 *
 * \param deprecated_message If non-NULL, will be set to the message text
 * provided along with the unconditional deprecation of this entity. The client
 * is responsible for deallocating this string.
 *
 * \param always_unavailable If non-NULL, will be set to indicate whether the
 * entity is unavailable on all platforms.
 *
 * \param unavailable_message If non-NULL, will be set to the message text
 * provided along with the unconditional unavailability of this entity. The
 * client is responsible for deallocating this string.
 *
 * \param availability If non-NULL, an array of CXPlatformAvailability instances
 * that will be populated with platform availability information, up to either
 * the number of platforms for which availability information is available (as
 * returned by this function) or \c availability_size, whichever is smaller.
 *
 * \param availability_size The number of elements available in the
 * \c availability array.
 *
 * \returns The number of platforms (N) for which availability information is
 * available (which is unrelated to \c availability_size).
 *
 * Note that the client is responsible for calling
 * \c clang_disposeCXPlatformAvailability to free each of the
 * platform-availability structures returned. There are
 * \c min(N, availability_size) such structures.
  }

function clang_getCursorPlatformAvailability(cursor:TCXCursor; always_deprecated:Plongint; deprecated_message:PCXString; always_unavailable:Plongint; unavailable_message:PCXString; 
           availability:PCXPlatformAvailability; availability_size:longint):longint;cdecl;external libgclang;
{*
 * Free the memory associated with a \c CXPlatformAvailability structure.
  }
procedure clang_disposeCXPlatformAvailability(availability:PCXPlatformAvailability);cdecl;external libgclang;
{*
 * If cursor refers to a variable declaration and it has initializer returns
 * cursor referring to the initializer otherwise return null cursor.
  }
function clang_Cursor_getVarDeclInitializer(cursor:TCXCursor):TCXCursor;cdecl;external libgclang;
{*
 * If cursor refers to a variable declaration that has global storage returns 1.
 * If cursor refers to a variable declaration that doesn't have global storage
 * returns 0. Otherwise returns -1.
  }
function clang_Cursor_hasVarDeclGlobalStorage(cursor:TCXCursor):longint;cdecl;external libgclang;
{*
 * If cursor refers to a variable declaration that has external storage
 * returns 1. If cursor refers to a variable declaration that doesn't have
 * external storage returns 0. Otherwise returns -1.
  }
function clang_Cursor_hasVarDeclExternalStorage(cursor:TCXCursor):longint;cdecl;external libgclang;
{*
 * Describe the "language" of the entity referred to by a cursor.
  }
type
  TCXLanguageKind =  Longint;
  Const
    CXLanguage_Invalid = 0;
    CXLanguage_C = 1;
    CXLanguage_ObjC = 2;
    CXLanguage_CPlusPlus = 3;

{*
 * Determine the "language" of the entity referred to by a given cursor.
  }

function clang_getCursorLanguage(cursor:TCXCursor):TCXLanguageKind;cdecl;external libgclang;
{*
 * Describe the "thread-local storage (TLS) kind" of the declaration
 * referred to by a cursor.
  }
type
  TCXTLSKind =  Longint;
  Const
    CXTLS_None = 0;
    CXTLS_Dynamic = 1;
    CXTLS_Static = 2;

{*
 * Determine the "thread-local storage (TLS) kind" of the declaration
 * referred to by a cursor.
  }

function clang_getCursorTLSKind(cursor:TCXCursor):TCXTLSKind;cdecl;external libgclang;
{*
 * Returns the translation unit that a cursor originated from.
  }
function clang_Cursor_getTranslationUnit(para1:TCXCursor):TCXTranslationUnit;cdecl;external libgclang;
{*
 * A fast container representing a set of CXCursors.
  }
type
  PCXCursorSet = ^TCXCursorSet;
  TCXCursorSet = PCXCursorSetImpl;
{*
 * Creates an empty CXCursorSet.
  }

function clang_createCXCursorSet:TCXCursorSet;cdecl;external libgclang;
{*
 * Disposes a CXCursorSet and releases its associated memory.
  }
procedure clang_disposeCXCursorSet(cset:TCXCursorSet);cdecl;external libgclang;
{*
 * Queries a CXCursorSet to see if it contains a specific CXCursor.
 *
 * \returns non-zero if the set contains the specified cursor.
  }
function clang_CXCursorSet_contains(cset:TCXCursorSet; cursor:TCXCursor):dword;cdecl;external libgclang;
{*
 * Inserts a CXCursor into a CXCursorSet.
 *
 * \returns zero if the CXCursor was already in the set, and non-zero otherwise.
  }
function clang_CXCursorSet_insert(cset:TCXCursorSet; cursor:TCXCursor):dword;cdecl;external libgclang;
{*
 * Determine the semantic parent of the given cursor.
 *
 * The semantic parent of a cursor is the cursor that semantically contains
 * the given \p cursor. For many declarations, the lexical and semantic parents
 * are equivalent (the lexical parent is returned by
 * \c clang_getCursorLexicalParent()). They diverge when declarations or
 * definitions are provided out-of-line. For example:
 *
 * \code
 * class C 
 *  void f();
 * ;
 *
 * void C::f()  
 * \endcode
 *
 * In the out-of-line definition of \c C::f, the semantic parent is
 * the class \c C, of which this function is a member. The lexical parent is
 * the place where the declaration actually occurs in the source code; in this
 * case, the definition occurs in the translation unit. In general, the
 * lexical parent for a given entity can change without affecting the semantics
 * of the program, and the lexical parent of different declarations of the
 * same entity may be different. Changing the semantic parent of a declaration,
 * on the other hand, can have a major impact on semantics, and redeclarations
 * of a particular entity should all have the same semantic context.
 *
 * In the example above, both declarations of \c C::f have \c C as their
 * semantic context, while the lexical context of the first \c C::f is \c C
 * and the lexical context of the second \c C::f is the translation unit.
 *
 * For global declarations, the semantic parent is the translation unit.
  }
function clang_getCursorSemanticParent(cursor:TCXCursor):TCXCursor;cdecl;external libgclang;
{*
 * Determine the lexical parent of the given cursor.
 *
 * The lexical parent of a cursor is the cursor in which the given \p cursor
 * was actually written. For many declarations, the lexical and semantic parents
 * are equivalent (the semantic parent is returned by
 * \c clang_getCursorSemanticParent()). They diverge when declarations or
 * definitions are provided out-of-line. For example:
 *
 * \code
 * class C 
 *  void f();
 * ;
 *
 * void C::f()  
 * \endcode
 *
 * In the out-of-line definition of \c C::f, the semantic parent is
 * the class \c C, of which this function is a member. The lexical parent is
 * the place where the declaration actually occurs in the source code; in this
 * case, the definition occurs in the translation unit. In general, the
 * lexical parent for a given entity can change without affecting the semantics
 * of the program, and the lexical parent of different declarations of the
 * same entity may be different. Changing the semantic parent of a declaration,
 * on the other hand, can have a major impact on semantics, and redeclarations
 * of a particular entity should all have the same semantic context.
 *
 * In the example above, both declarations of \c C::f have \c C as their
 * semantic context, while the lexical context of the first \c C::f is \c C
 * and the lexical context of the second \c C::f is the translation unit.
 *
 * For declarations written in the global scope, the lexical parent is
 * the translation unit.
  }
function clang_getCursorLexicalParent(cursor:TCXCursor):TCXCursor;cdecl;external libgclang;
{*
 * Determine the set of methods that are overridden by the given
 * method.
 *
 * In both Objective-C and C++, a method (aka virtual member function,
 * in C++) can override a virtual method in a base class. For
 * Objective-C, a method is said to override any method in the class's
 * base class, its protocols, or its categories' protocols, that has the same
 * selector and is of the same kind (class or instance).
 * If no such method exists, the search continues to the class's superclass,
 * its protocols, and its categories, and so on. A method from an Objective-C
 * implementation is considered to override the same methods as its
 * corresponding method in the interface.
 *
 * For C++, a virtual member function overrides any virtual member
 * function with the same signature that occurs in its base
 * classes. With multiple inheritance, a virtual member function can
 * override several virtual member functions coming from different
 * base classes.
 *
 * In all cases, this function determines the immediate overridden
 * method, rather than all of the overridden methods. For example, if
 * a method is originally declared in a class A, then overridden in B
 * (which in inherits from A) and also in C (which inherited from B),
 * then the only overridden method returned from this function when
 * invoked on C's method will be B's method. The client may then
 * invoke this function again, given the previously-found overridden
 * methods, to map out the complete method-override set.
 *
 * \param cursor A cursor representing an Objective-C or C++
 * method. This routine will compute the set of methods that this
 * method overrides.
 *
 * \param overridden A pointer whose pointee will be replaced with a
 * pointer to an array of cursors, representing the set of overridden
 * methods. If there are no overridden methods, the pointee will be
 * set to NULL. The pointee must be freed via a call to
 * \c clang_disposeOverriddenCursors().
 *
 * \param num_overridden A pointer to the number of overridden
 * functions, will be set to the number of overridden functions in the
 * array pointed to by \p overridden.
  }
procedure clang_getOverriddenCursors(cursor:TCXCursor; overridden:PPCXCursor; num_overridden:Pdword);cdecl;external libgclang;
{*
 * Free the set of overridden cursors returned by \c
 * clang_getOverriddenCursors().
  }
procedure clang_disposeOverriddenCursors(overridden:PCXCursor);cdecl;external libgclang;
{*
 * Retrieve the file that is included by the given inclusion directive
 * cursor.
  }
function clang_getIncludedFile(cursor:TCXCursor):TCXFile;cdecl;external libgclang;
{*
 * @
  }
{*
 * \defgroup CINDEX_CURSOR_SOURCE Mapping between cursors and source code
 *
 * Cursors represent a location within the Abstract Syntax Tree (AST). These
 * routines help map between cursors and the physical locations where the
 * described entities occur in the source code. The mapping is provided in
 * both directions, so one can map from source code to the AST and back.
 *
 * @
  }
{*
 * Map a source location to the cursor that describes the entity at that
 * location in the source code.
 *
 * clang_getCursor() maps an arbitrary source location within a translation
 * unit down to the most specific cursor that describes the entity at that
 * location. For example, given an expression \c x + y, invoking
 * clang_getCursor() with a source location pointing to "x" will return the
 * cursor for "x"; similarly for "y". If the cursor points anywhere between
 * "x" or "y" (e.g., on the + or the whitespace around it), clang_getCursor()
 * will return a cursor referring to the "+" expression.
 *
 * \returns a cursor representing the entity at the given source location, or
 * a NULL cursor if no such entity can be found.
  }
function clang_getCursor(para1:TCXTranslationUnit; para2:TCXSourceLocation):TCXCursor;cdecl;external libgclang;
{*
 * Retrieve the physical location of the source constructor referenced
 * by the given cursor.
 *
 * The location of a declaration is typically the location of the name of that
 * declaration, where the name of that declaration would occur if it is
 * unnamed, or some keyword that introduces that particular declaration.
 * The location of a reference is where that reference occurs within the
 * source code.
  }
function clang_getCursorLocation(para1:TCXCursor):TCXSourceLocation;cdecl;external libgclang;
{*
 * Retrieve the physical extent of the source construct referenced by
 * the given cursor.
 *
 * The extent of a cursor starts with the file/line/column pointing at the
 * first character within the source construct that the cursor refers to and
 * ends with the last character within that source construct. For a
 * declaration, the extent covers the declaration itself. For a reference,
 * the extent covers the location of the reference (e.g., where the referenced
 * entity was actually used).
  }
function clang_getCursorExtent(para1:TCXCursor):TCXSourceRange;cdecl;external libgclang;
{*
 * @
  }
{*
 * \defgroup CINDEX_TYPES Type information for CXCursors
 *
 * @
  }
{*
 * Describes the kind of type
  }
{*
   * Represents an invalid type (e.g., where no type is available).
    }
{*
   * A type whose specific kind is not exposed via this
   * interface.
    }
{ Builtin types  }
{*
   * Represents a type that was referred to using an elaborated type keyword.
   *
   * E.g., struct S, or via a qualified name, e.g., N::M::type, or both.
    }
{ OpenCL PipeType.  }
{ OpenCL builtin types.  }
{ Old aliases for AVC OpenCL extension types.  }
{ HLSL Types  }
type
  TCXTypeKind =  Longint;
  Const
    CXType_Invalid = 0;
    CXType_Unexposed = 1;
    CXType_Void = 2;
    CXType_Bool = 3;
    CXType_Char_U = 4;
    CXType_UChar = 5;
    CXType_Char16 = 6;
    CXType_Char32 = 7;
    CXType_UShort = 8;
    CXType_UInt = 9;
    CXType_ULong = 10;
    CXType_ULongLong = 11;
    CXType_UInt128 = 12;
    CXType_Char_S = 13;
    CXType_SChar = 14;
    CXType_WChar = 15;
    CXType_Short = 16;
    CXType_Int = 17;
    CXType_Long = 18;
    CXType_LongLong = 19;
    CXType_Int128 = 20;
    CXType_Float = 21;
    CXType_Double = 22;
    CXType_LongDouble = 23;
    CXType_NullPtr = 24;
    CXType_Overload = 25;
    CXType_Dependent = 26;
    CXType_ObjCId = 27;
    CXType_ObjCClass = 28;
    CXType_ObjCSel = 29;
    CXType_Float128 = 30;
    CXType_Half = 31;
    CXType_Float16 = 32;
    CXType_ShortAccum = 33;
    CXType_Accum = 34;
    CXType_LongAccum = 35;
    CXType_UShortAccum = 36;
    CXType_UAccum = 37;
    CXType_ULongAccum = 38;
    CXType_BFloat16 = 39;
    CXType_Ibm128 = 40;
    CXType_FirstBuiltin = CXType_Void;
    CXType_LastBuiltin = CXType_Ibm128;
    CXType_Complex = 100;
    CXType_Pointer = 101;
    CXType_BlockPointer = 102;
    CXType_LValueReference = 103;
    CXType_RValueReference = 104;
    CXType_Record = 105;
    CXType_Enum = 106;
    CXType_Typedef = 107;
    CXType_ObjCInterface = 108;
    CXType_ObjCObjectPointer = 109;
    CXType_FunctionNoProto = 110;
    CXType_FunctionProto = 111;
    CXType_ConstantArray = 112;
    CXType_Vector = 113;
    CXType_IncompleteArray = 114;
    CXType_VariableArray = 115;
    CXType_DependentSizedArray = 116;
    CXType_MemberPointer = 117;
    CXType_Auto = 118;
    CXType_Elaborated = 119;
    CXType_Pipe = 120;
    CXType_OCLImage1dRO = 121;
    CXType_OCLImage1dArrayRO = 122;
    CXType_OCLImage1dBufferRO = 123;
    CXType_OCLImage2dRO = 124;
    CXType_OCLImage2dArrayRO = 125;
    CXType_OCLImage2dDepthRO = 126;
    CXType_OCLImage2dArrayDepthRO = 127;
    CXType_OCLImage2dMSAARO = 128;
    CXType_OCLImage2dArrayMSAARO = 129;
    CXType_OCLImage2dMSAADepthRO = 130;
    CXType_OCLImage2dArrayMSAADepthRO = 131;
    CXType_OCLImage3dRO = 132;
    CXType_OCLImage1dWO = 133;
    CXType_OCLImage1dArrayWO = 134;
    CXType_OCLImage1dBufferWO = 135;
    CXType_OCLImage2dWO = 136;
    CXType_OCLImage2dArrayWO = 137;
    CXType_OCLImage2dDepthWO = 138;
    CXType_OCLImage2dArrayDepthWO = 139;
    CXType_OCLImage2dMSAAWO = 140;
    CXType_OCLImage2dArrayMSAAWO = 141;
    CXType_OCLImage2dMSAADepthWO = 142;
    CXType_OCLImage2dArrayMSAADepthWO = 143;
    CXType_OCLImage3dWO = 144;
    CXType_OCLImage1dRW = 145;
    CXType_OCLImage1dArrayRW = 146;
    CXType_OCLImage1dBufferRW = 147;
    CXType_OCLImage2dRW = 148;
    CXType_OCLImage2dArrayRW = 149;
    CXType_OCLImage2dDepthRW = 150;
    CXType_OCLImage2dArrayDepthRW = 151;
    CXType_OCLImage2dMSAARW = 152;
    CXType_OCLImage2dArrayMSAARW = 153;
    CXType_OCLImage2dMSAADepthRW = 154;
    CXType_OCLImage2dArrayMSAADepthRW = 155;
    CXType_OCLImage3dRW = 156;
    CXType_OCLSampler = 157;
    CXType_OCLEvent = 158;
    CXType_OCLQueue = 159;
    CXType_OCLReserveID = 160;
    CXType_ObjCObject = 161;
    CXType_ObjCTypeParam = 162;
    CXType_Attributed = 163;
    CXType_OCLIntelSubgroupAVCMcePayload = 164;
    CXType_OCLIntelSubgroupAVCImePayload = 165;
    CXType_OCLIntelSubgroupAVCRefPayload = 166;
    CXType_OCLIntelSubgroupAVCSicPayload = 167;
    CXType_OCLIntelSubgroupAVCMceResult = 168;
    CXType_OCLIntelSubgroupAVCImeResult = 169;
    CXType_OCLIntelSubgroupAVCRefResult = 170;
    CXType_OCLIntelSubgroupAVCSicResult = 171;
    CXType_OCLIntelSubgroupAVCImeResultSingleReferenceStreamout = 172;
    CXType_OCLIntelSubgroupAVCImeResultDualReferenceStreamout = 173;
    CXType_OCLIntelSubgroupAVCImeSingleReferenceStreamin = 174;
    CXType_OCLIntelSubgroupAVCImeDualReferenceStreamin = 175;
    CXType_OCLIntelSubgroupAVCImeResultSingleRefStreamout = 172;
    CXType_OCLIntelSubgroupAVCImeResultDualRefStreamout = 173;
    CXType_OCLIntelSubgroupAVCImeSingleRefStreamin = 174;
    CXType_OCLIntelSubgroupAVCImeDualRefStreamin = 175;
    CXType_ExtVector = 176;
    CXType_Atomic = 177;
    CXType_BTFTagAttributed = 178;
    CXType_HLSLResource = 179;
    CXType_HLSLAttributedResource = 180;

{*
 * Describes the calling convention of a function type
  }
{ Alias for compatibility with older versions of API.  }
type
  TCXCallingConv =  Longint;
  Const
    CXCallingConv_Default = 0;
    CXCallingConv_C = 1;
    CXCallingConv_X86StdCall = 2;
    CXCallingConv_X86FastCall = 3;
    CXCallingConv_X86ThisCall = 4;
    CXCallingConv_X86Pascal = 5;
    CXCallingConv_AAPCS = 6;
    CXCallingConv_AAPCS_VFP = 7;
    CXCallingConv_X86RegCall = 8;
    CXCallingConv_IntelOclBicc = 9;
    CXCallingConv_Win64 = 10;
    CXCallingConv_X86_64Win64 = CXCallingConv_Win64;
    CXCallingConv_X86_64SysV = 11;
    CXCallingConv_X86VectorCall = 12;
    CXCallingConv_Swift = 13;
    CXCallingConv_PreserveMost = 14;
    CXCallingConv_PreserveAll = 15;
    CXCallingConv_AArch64VectorCall = 16;
    CXCallingConv_SwiftAsync = 17;
    CXCallingConv_AArch64SVEPCS = 18;
    CXCallingConv_M68kRTD = 19;
    CXCallingConv_PreserveNone = 20;
    CXCallingConv_RISCVVectorCall = 21;
    CXCallingConv_Invalid = 100;
    CXCallingConv_Unexposed = 200;

{*
 * The type of an element in the abstract syntax tree.
 *
  }
type
  PCXType = ^TCXType;
  TCXType = record
      kind : TCXTypeKind;
      data : array[0..1] of pointer;
    end;
{*
 * Retrieve the type of a CXCursor (if any).
  }

function clang_getCursorType(C:TCXCursor):TCXType;cdecl;external libgclang;
{*
 * Pretty-print the underlying type using the rules of the
 * language of the translation unit from which it came.
 *
 * If the type is invalid, an empty string is returned.
  }
function clang_getTypeSpelling(CT:TCXType):TCXString;cdecl;external libgclang;
{*
 * Retrieve the underlying type of a typedef declaration.
 *
 * If the cursor does not reference a typedef declaration, an invalid type is
 * returned.
  }
function clang_getTypedefDeclUnderlyingType(C:TCXCursor):TCXType;cdecl;external libgclang;
{*
 * Retrieve the integer type of an enum declaration.
 *
 * If the cursor does not reference an enum declaration, an invalid type is
 * returned.
  }
function clang_getEnumDeclIntegerType(C:TCXCursor):TCXType;cdecl;external libgclang;
{*
 * Retrieve the integer value of an enum constant declaration as a signed
 *  long long.
 *
 * If the cursor does not reference an enum constant declaration, LLONG_MIN is
 * returned. Since this is also potentially a valid constant value, the kind of
 * the cursor must be verified before calling this function.
  }
function clang_getEnumConstantDeclValue(C:TCXCursor):int64;cdecl;external libgclang;
{*
 * Retrieve the integer value of an enum constant declaration as an unsigned
 *  long long.
 *
 * If the cursor does not reference an enum constant declaration, ULLONG_MAX is
 * returned. Since this is also potentially a valid constant value, the kind of
 * the cursor must be verified before calling this function.
  }
function clang_getEnumConstantDeclUnsignedValue(C:TCXCursor):qword;cdecl;external libgclang;
{*
 * Returns non-zero if the cursor specifies a Record member that is a bit-field.
  }
function clang_Cursor_isBitField(C:TCXCursor):dword;cdecl;external libgclang;
{*
 * Retrieve the bit width of a bit-field declaration as an integer.
 *
 * If the cursor does not reference a bit-field, or if the bit-field's width
 * expression cannot be evaluated, -1 is returned.
 *
 * For example:
 * \code
 * if (clang_Cursor_isBitField(Cursor)) 
 *   int Width = clang_getFieldDeclBitWidth(Cursor);
 *   if (Width != -1) 
 *     // The bit-field width is not value-dependent.
 *   
 * 
 * \endcode
  }
function clang_getFieldDeclBitWidth(C:TCXCursor):longint;cdecl;external libgclang;
{*
 * Retrieve the number of non-variadic arguments associated with a given
 * cursor.
 *
 * The number of arguments can be determined for calls as well as for
 * declarations of functions or methods. For other cursors -1 is returned.
  }
function clang_Cursor_getNumArguments(C:TCXCursor):longint;cdecl;external libgclang;
{*
 * Retrieve the argument cursor of a function or method.
 *
 * The argument cursor can be determined for calls as well as for declarations
 * of functions or methods. For other cursors and for invalid indices, an
 * invalid cursor is returned.
  }
function clang_Cursor_getArgument(C:TCXCursor; i:dword):TCXCursor;cdecl;external libgclang;
{*
 * Describes the kind of a template argument.
 *
 * See the definition of llvm::clang::TemplateArgument::ArgKind for full
 * element descriptions.
  }
{ Indicates an error case, preventing the kind from being deduced.  }
type
  TCXTemplateArgumentKind =  Longint;
  Const
    CXTemplateArgumentKind_Null = 0;
    CXTemplateArgumentKind_Type = 1;
    CXTemplateArgumentKind_Declaration = 2;
    CXTemplateArgumentKind_NullPtr = 3;
    CXTemplateArgumentKind_Integral = 4;
    CXTemplateArgumentKind_Template = 5;
    CXTemplateArgumentKind_TemplateExpansion = 6;
    CXTemplateArgumentKind_Expression = 7;
    CXTemplateArgumentKind_Pack = 8;
    CXTemplateArgumentKind_Invalid = 9;

{*
 * Returns the number of template args of a function, struct, or class decl
 * representing a template specialization.
 *
 * If the argument cursor cannot be converted into a template function
 * declaration, -1 is returned.
 *
 * For example, for the following declaration and specialization:
 *   template <typename T, int kInt, bool kBool>
 *   void foo()  ... 
 *
 *   template <>
 *   void foo<float, -7, true>();
 *
 * The value 3 would be returned from this call.
  }

function clang_Cursor_getNumTemplateArguments(C:TCXCursor):longint;cdecl;external libgclang;
{*
 * Retrieve the kind of the I'th template argument of the CXCursor C.
 *
 * If the argument CXCursor does not represent a FunctionDecl, StructDecl, or
 * ClassTemplatePartialSpecialization, an invalid template argument kind is
 * returned.
 *
 * For example, for the following declaration and specialization:
 *   template <typename T, int kInt, bool kBool>
 *   void foo()  ... 
 *
 *   template <>
 *   void foo<float, -7, true>();
 *
 * For I = 0, 1, and 2, Type, Integral, and Integral will be returned,
 * respectively.
  }
function clang_Cursor_getTemplateArgumentKind(C:TCXCursor; I:dword):TCXTemplateArgumentKind;cdecl;external libgclang;
{*
 * Retrieve a CXType representing the type of a TemplateArgument of a
 *  function decl representing a template specialization.
 *
 * If the argument CXCursor does not represent a FunctionDecl, StructDecl,
 * ClassDecl or ClassTemplatePartialSpecialization whose I'th template argument
 * has a kind of CXTemplateArgKind_Integral, an invalid type is returned.
 *
 * For example, for the following declaration and specialization:
 *   template <typename T, int kInt, bool kBool>
 *   void foo()  ... 
 *
 *   template <>
 *   void foo<float, -7, true>();
 *
 * If called with I = 0, "float", will be returned.
 * Invalid types will be returned for I == 1 or 2.
  }
function clang_Cursor_getTemplateArgumentType(C:TCXCursor; I:dword):TCXType;cdecl;external libgclang;
{*
 * Retrieve the value of an Integral TemplateArgument (of a function
 *  decl representing a template specialization) as a signed long long.
 *
 * It is undefined to call this function on a CXCursor that does not represent a
 * FunctionDecl, StructDecl, ClassDecl or ClassTemplatePartialSpecialization
 * whose I'th template argument is not an integral value.
 *
 * For example, for the following declaration and specialization:
 *   template <typename T, int kInt, bool kBool>
 *   void foo()  ... 
 *
 *   template <>
 *   void foo<float, -7, true>();
 *
 * If called with I = 1 or 2, -7 or true will be returned, respectively.
 * For I == 0, this function's behavior is undefined.
  }
function clang_Cursor_getTemplateArgumentValue(C:TCXCursor; I:dword):int64;cdecl;external libgclang;
{*
 * Retrieve the value of an Integral TemplateArgument (of a function
 *  decl representing a template specialization) as an unsigned long long.
 *
 * It is undefined to call this function on a CXCursor that does not represent a
 * FunctionDecl, StructDecl, ClassDecl or ClassTemplatePartialSpecialization or
 * whose I'th template argument is not an integral value.
 *
 * For example, for the following declaration and specialization:
 *   template <typename T, int kInt, bool kBool>
 *   void foo()  ... 
 *
 *   template <>
 *   void foo<float, 2147483649, true>();
 *
 * If called with I = 1 or 2, 2147483649 or true will be returned, respectively.
 * For I == 0, this function's behavior is undefined.
  }
function clang_Cursor_getTemplateArgumentUnsignedValue(C:TCXCursor; I:dword):qword;cdecl;external libgclang;
{*
 * Determine whether two CXTypes represent the same type.
 *
 * \returns non-zero if the CXTypes represent the same type and
 *          zero otherwise.
  }
function clang_equalTypes(A:TCXType; B:TCXType):dword;cdecl;external libgclang;
{*
 * Return the canonical type for a CXType.
 *
 * Clang's type system explicitly models typedefs and all the ways
 * a specific type can be represented.  The canonical type is the underlying
 * type with all the "sugar" removed.  For example, if 'T' is a typedef
 * for 'int', the canonical type for 'T' would be 'int'.
  }
function clang_getCanonicalType(T:TCXType):TCXType;cdecl;external libgclang;
{*
 * Determine whether a CXType has the "const" qualifier set,
 * without looking through typedefs that may have added "const" at a
 * different level.
  }
function clang_isConstQualifiedType(T:TCXType):dword;cdecl;external libgclang;
{*
 * Determine whether a  CXCursor that is a macro, is
 * function like.
  }
function clang_Cursor_isMacroFunctionLike(C:TCXCursor):dword;cdecl;external libgclang;
{*
 * Determine whether a  CXCursor that is a macro, is a
 * builtin one.
  }
function clang_Cursor_isMacroBuiltin(C:TCXCursor):dword;cdecl;external libgclang;
{*
 * Determine whether a  CXCursor that is a function declaration, is an
 * inline declaration.
  }
function clang_Cursor_isFunctionInlined(C:TCXCursor):dword;cdecl;external libgclang;
{*
 * Determine whether a CXType has the "volatile" qualifier set,
 * without looking through typedefs that may have added "volatile" at
 * a different level.
  }
function clang_isVolatileQualifiedType(T:TCXType):dword;cdecl;external libgclang;
{*
 * Determine whether a CXType has the "restrict" qualifier set,
 * without looking through typedefs that may have added "restrict" at a
 * different level.
  }
function clang_isRestrictQualifiedType(T:TCXType):dword;cdecl;external libgclang;
{*
 * Returns the address space of the given type.
  }
function clang_getAddressSpace(T:TCXType):dword;cdecl;external libgclang;
{*
 * Returns the typedef name of the given type.
  }
function clang_getTypedefName(CT:TCXType):TCXString;cdecl;external libgclang;
{*
 * For pointer types, returns the type of the pointee.
  }
function clang_getPointeeType(T:TCXType):TCXType;cdecl;external libgclang;
{*
 * Retrieve the unqualified variant of the given type, removing as
 * little sugar as possible.
 *
 * For example, given the following series of typedefs:
 *
 * \code
 * typedef int Integer;
 * typedef const Integer CInteger;
 * typedef CInteger DifferenceType;
 * \endcode
 *
 * Executing \c clang_getUnqualifiedType() on a \c CXType that
 * represents \c DifferenceType, will desugar to a type representing
 * \c Integer, that has no qualifiers.
 *
 * And, executing \c clang_getUnqualifiedType() on the type of the
 * first argument of the following function declaration:
 *
 * \code
 * void foo(const int);
 * \endcode
 *
 * Will return a type representing \c int, removing the \c const
 * qualifier.
 *
 * Sugar over array types is not desugared.
 *
 * A type can be checked for qualifiers with \c
 * clang_isConstQualifiedType(), \c clang_isVolatileQualifiedType()
 * and \c clang_isRestrictQualifiedType().
 *
 * A type that resulted from a call to \c clang_getUnqualifiedType
 * will return \c false for all of the above calls.
  }
function clang_getUnqualifiedType(CT:TCXType):TCXType;cdecl;external libgclang;
{*
 * For reference types (e.g., "const int&"), returns the type that the
 * reference refers to (e.g "const int").
 *
 * Otherwise, returns the type itself.
 *
 * A type that has kind \c CXType_LValueReference or
 * \c CXType_RValueReference is a reference type.
  }
function clang_getNonReferenceType(CT:TCXType):TCXType;cdecl;external libgclang;
{*
 * Return the cursor for the declaration of the given type.
  }
function clang_getTypeDeclaration(T:TCXType):TCXCursor;cdecl;external libgclang;
{*
 * Returns the Objective-C type encoding for the specified declaration.
  }
function clang_getDeclObjCTypeEncoding(C:TCXCursor):TCXString;cdecl;external libgclang;
{*
 * Returns the Objective-C type encoding for the specified CXType.
  }
function clang_Type_getObjCEncoding(_type:TCXType):TCXString;cdecl;external libgclang;
{*
 * Retrieve the spelling of a given CXTypeKind.
  }
function clang_getTypeKindSpelling(K:TCXTypeKind):TCXString;cdecl;external libgclang;
{*
 * Retrieve the calling convention associated with a function type.
 *
 * If a non-function type is passed in, CXCallingConv_Invalid is returned.
  }
function clang_getFunctionTypeCallingConv(T:TCXType):TCXCallingConv;cdecl;external libgclang;
{*
 * Retrieve the return type associated with a function type.
 *
 * If a non-function type is passed in, an invalid type is returned.
  }
function clang_getResultType(T:TCXType):TCXType;cdecl;external libgclang;
{*
 * Retrieve the exception specification type associated with a function type.
 * This is a value of type CXCursor_ExceptionSpecificationKind.
 *
 * If a non-function type is passed in, an error code of -1 is returned.
  }
function clang_getExceptionSpecificationType(T:TCXType):longint;cdecl;external libgclang;
{*
 * Retrieve the number of non-variadic parameters associated with a
 * function type.
 *
 * If a non-function type is passed in, -1 is returned.
  }
function clang_getNumArgTypes(T:TCXType):longint;cdecl;external libgclang;
{*
 * Retrieve the type of a parameter of a function type.
 *
 * If a non-function type is passed in or the function does not have enough
 * parameters, an invalid type is returned.
  }
function clang_getArgType(T:TCXType; i:dword):TCXType;cdecl;external libgclang;
{*
 * Retrieves the base type of the ObjCObjectType.
 *
 * If the type is not an ObjC object, an invalid type is returned.
  }
function clang_Type_getObjCObjectBaseType(T:TCXType):TCXType;cdecl;external libgclang;
{*
 * Retrieve the number of protocol references associated with an ObjC object/id.
 *
 * If the type is not an ObjC object, 0 is returned.
  }
function clang_Type_getNumObjCProtocolRefs(T:TCXType):dword;cdecl;external libgclang;
{*
 * Retrieve the decl for a protocol reference for an ObjC object/id.
 *
 * If the type is not an ObjC object or there are not enough protocol
 * references, an invalid cursor is returned.
  }
function clang_Type_getObjCProtocolDecl(T:TCXType; i:dword):TCXCursor;cdecl;external libgclang;
{*
 * Retrieve the number of type arguments associated with an ObjC object.
 *
 * If the type is not an ObjC object, 0 is returned.
  }
function clang_Type_getNumObjCTypeArgs(T:TCXType):dword;cdecl;external libgclang;
{*
 * Retrieve a type argument associated with an ObjC object.
 *
 * If the type is not an ObjC or the index is not valid,
 * an invalid type is returned.
  }
function clang_Type_getObjCTypeArg(T:TCXType; i:dword):TCXType;cdecl;external libgclang;
{*
 * Return 1 if the CXType is a variadic function type, and 0 otherwise.
  }
function clang_isFunctionTypeVariadic(T:TCXType):dword;cdecl;external libgclang;
{*
 * Retrieve the return type associated with a given cursor.
 *
 * This only returns a valid type if the cursor refers to a function or method.
  }
function clang_getCursorResultType(C:TCXCursor):TCXType;cdecl;external libgclang;
{*
 * Retrieve the exception specification type associated with a given cursor.
 * This is a value of type CXCursor_ExceptionSpecificationKind.
 *
 * This only returns a valid result if the cursor refers to a function or
 * method.
  }
function clang_getCursorExceptionSpecificationType(C:TCXCursor):longint;cdecl;external libgclang;
{*
 * Return 1 if the CXType is a POD (plain old data) type, and 0
 *  otherwise.
  }
function clang_isPODType(T:TCXType):dword;cdecl;external libgclang;
{*
 * Return the element type of an array, complex, or vector type.
 *
 * If a type is passed in that is not an array, complex, or vector type,
 * an invalid type is returned.
  }
function clang_getElementType(T:TCXType):TCXType;cdecl;external libgclang;
{*
 * Return the number of elements of an array or vector type.
 *
 * If a type is passed in that is not an array or vector type,
 * -1 is returned.
  }
function clang_getNumElements(T:TCXType):int64;cdecl;external libgclang;
{*
 * Return the element type of an array type.
 *
 * If a non-array type is passed in, an invalid type is returned.
  }
function clang_getArrayElementType(T:TCXType):TCXType;cdecl;external libgclang;
{*
 * Return the array size of a constant array.
 *
 * If a non-array type is passed in, -1 is returned.
  }
function clang_getArraySize(T:TCXType):int64;cdecl;external libgclang;
{*
 * Retrieve the type named by the qualified-id.
 *
 * If a non-elaborated type is passed in, an invalid type is returned.
  }
function clang_Type_getNamedType(T:TCXType):TCXType;cdecl;external libgclang;
{*
 * Determine if a typedef is 'transparent' tag.
 *
 * A typedef is considered 'transparent' if it shares a name and spelling
 * location with its underlying tag type, as is the case with the NS_ENUM macro.
 *
 * \returns non-zero if transparent and zero otherwise.
  }
function clang_Type_isTransparentTagTypedef(T:TCXType):dword;cdecl;external libgclang;
{*
   * Values of this type can never be null.
    }
{*
   * Values of this type can be null.
    }
{*
   * Whether values of this type can be null is (explicitly)
   * unspecified. This captures a (fairly rare) case where we
   * can't conclude anything about the nullability of the type even
   * though it has been considered.
    }
{*
   * Nullability is not applicable to this type.
    }
{*
   * Generally behaves like Nullable, except when used in a block parameter that
   * was imported into a swift async method. There, swift will assume that the
   * parameter can get null even if no error occurred. _Nullable parameters are
   * assumed to only get null on error.
    }
type
  TCXTypeNullabilityKind =  Longint;
  Const
    CXTypeNullability_NonNull = 0;
    CXTypeNullability_Nullable = 1;
    CXTypeNullability_Unspecified = 2;
    CXTypeNullability_Invalid = 3;
    CXTypeNullability_NullableResult = 4;

{*
 * Retrieve the nullability kind of a pointer type.
  }

function clang_Type_getNullability(T:TCXType):TCXTypeNullabilityKind;cdecl;external libgclang;
{*
 * List the possible error codes for \c clang_Type_getSizeOf,
 *   \c clang_Type_getAlignOf, \c clang_Type_getOffsetOf,
 *   \c clang_Cursor_getOffsetOf, and \c clang_getOffsetOfBase.
 *
 * A value of this enumeration type can be returned if the target type is not
 * a valid argument to sizeof, alignof or offsetof.
  }
{*
   * Type is of kind CXType_Invalid.
    }
{*
   * The type is an incomplete Type.
    }
{*
   * The type is a dependent Type.
    }
{*
   * The type is not a constant size type.
    }
{*
   * The Field name is not valid for this record.
    }
{*
   * The type is undeduced.
    }
type
  TCXTypeLayoutError =  Longint;
  Const
    CXTypeLayoutError_Invalid = -(1);
    CXTypeLayoutError_Incomplete = -(2);
    CXTypeLayoutError_Dependent = -(3);
    CXTypeLayoutError_NotConstantSize = -(4);
    CXTypeLayoutError_InvalidFieldName = -(5);
    CXTypeLayoutError_Undeduced = -(6);

{*
 * Return the alignment of a type in bytes as per C++[expr.alignof]
 *   standard.
 *
 * If the type declaration is invalid, CXTypeLayoutError_Invalid is returned.
 * If the type declaration is an incomplete type, CXTypeLayoutError_Incomplete
 *   is returned.
 * If the type declaration is a dependent type, CXTypeLayoutError_Dependent is
 *   returned.
 * If the type declaration is not a constant size type,
 *   CXTypeLayoutError_NotConstantSize is returned.
  }

function clang_Type_getAlignOf(T:TCXType):int64;cdecl;external libgclang;
{*
 * Return the class type of an member pointer type.
 *
 * If a non-member-pointer type is passed in, an invalid type is returned.
  }
function clang_Type_getClassType(T:TCXType):TCXType;cdecl;external libgclang;
{*
 * Return the size of a type in bytes as per C++[expr.sizeof] standard.
 *
 * If the type declaration is invalid, CXTypeLayoutError_Invalid is returned.
 * If the type declaration is an incomplete type, CXTypeLayoutError_Incomplete
 *   is returned.
 * If the type declaration is a dependent type, CXTypeLayoutError_Dependent is
 *   returned.
  }
function clang_Type_getSizeOf(T:TCXType):int64;cdecl;external libgclang;
{*
 * Return the offset of a field named S in a record of type T in bits
 *   as it would be returned by __offsetof__ as per C++11[18.2p4]
 *
 * If the cursor is not a record field declaration, CXTypeLayoutError_Invalid
 *   is returned.
 * If the field's type declaration is an incomplete type,
 *   CXTypeLayoutError_Incomplete is returned.
 * If the field's type declaration is a dependent type,
 *   CXTypeLayoutError_Dependent is returned.
 * If the field's name S is not found,
 *   CXTypeLayoutError_InvalidFieldName is returned.
  }
function clang_Type_getOffsetOf(T:TCXType; S:Pchar):int64;cdecl;external libgclang;
{*
 * Return the type that was modified by this attributed type.
 *
 * If the type is not an attributed type, an invalid type is returned.
  }
function clang_Type_getModifiedType(T:TCXType):TCXType;cdecl;external libgclang;
{*
 * Gets the type contained by this atomic type.
 *
 * If a non-atomic type is passed in, an invalid type is returned.
  }
function clang_Type_getValueType(CT:TCXType):TCXType;cdecl;external libgclang;
{*
 * Return the offset of the field represented by the Cursor.
 *
 * If the cursor is not a field declaration, -1 is returned.
 * If the cursor semantic parent is not a record field declaration,
 *   CXTypeLayoutError_Invalid is returned.
 * If the field's type declaration is an incomplete type,
 *   CXTypeLayoutError_Incomplete is returned.
 * If the field's type declaration is a dependent type,
 *   CXTypeLayoutError_Dependent is returned.
 * If the field's name S is not found,
 *   CXTypeLayoutError_InvalidFieldName is returned.
  }
function clang_Cursor_getOffsetOfField(C:TCXCursor):int64;cdecl;external libgclang;
{*
 * Determine whether the given cursor represents an anonymous
 * tag or namespace
  }
function clang_Cursor_isAnonymous(C:TCXCursor):dword;cdecl;external libgclang;
{*
 * Determine whether the given cursor represents an anonymous record
 * declaration.
  }
function clang_Cursor_isAnonymousRecordDecl(C:TCXCursor):dword;cdecl;external libgclang;
{*
 * Determine whether the given cursor represents an inline namespace
 * declaration.
  }
function clang_Cursor_isInlineNamespace(C:TCXCursor):dword;cdecl;external libgclang;
{* No ref-qualifier was provided.  }
{* An lvalue ref-qualifier was provided (\c &).  }
{* An rvalue ref-qualifier was provided (\c &&).  }
type
  TCXRefQualifierKind =  Longint;
  Const
    CXRefQualifier_None = 0;
    CXRefQualifier_LValue = 1;
    CXRefQualifier_RValue = 2;

{*
 * Returns the number of template arguments for given template
 * specialization, or -1 if type \c T is not a template specialization.
  }

function clang_Type_getNumTemplateArguments(T:TCXType):longint;cdecl;external libgclang;
{*
 * Returns the type template argument of a template class specialization
 * at given index.
 *
 * This function only returns template type arguments and does not handle
 * template template arguments or variadic packs.
  }
function clang_Type_getTemplateArgumentAsType(T:TCXType; i:dword):TCXType;cdecl;external libgclang;
{*
 * Retrieve the ref-qualifier kind of a function or method.
 *
 * The ref-qualifier is returned for C++ functions or methods. For other types
 * or non-C++ declarations, CXRefQualifier_None is returned.
  }
function clang_Type_getCXXRefQualifier(T:TCXType):TCXRefQualifierKind;cdecl;external libgclang;
{*
 * Returns 1 if the base class specified by the cursor with kind
 *   CX_CXXBaseSpecifier is virtual.
  }
function clang_isVirtualBase(para1:TCXCursor):dword;cdecl;external libgclang;
{*
 * Returns the offset in bits of a CX_CXXBaseSpecifier relative to the parent
 * class.
 *
 * Returns a small negative number if the offset cannot be computed. See
 * CXTypeLayoutError for error codes.
  }
function clang_getOffsetOfBase(Parent:TCXCursor; Base:TCXCursor):int64;cdecl;external libgclang;
{*
 * Represents the C++ access control level to a base class for a
 * cursor with kind CX_CXXBaseSpecifier.
  }
type
  TCX_CXXAccessSpecifier =  Longint;
  Const
    CX_CXXInvalidAccessSpecifier = 0;
    CX_CXXPublic = 1;
    CX_CXXProtected = 2;
    CX_CXXPrivate = 3;

{*
 * Returns the access control level for the referenced object.
 *
 * If the cursor refers to a C++ declaration, its access control level within
 * its parent scope is returned. Otherwise, if the cursor refers to a base
 * specifier or access specifier, the specifier itself is returned.
  }

function clang_getCXXAccessSpecifier(para1:TCXCursor):TCX_CXXAccessSpecifier;cdecl;external libgclang;
{*
 * Represents the storage classes as declared in the source. CX_SC_Invalid
 * was added for the case that the passed cursor in not a declaration.
  }
type
  TCX_StorageClass =  Longint;
  Const
    CX_SC_Invalid = 0;
    CX_SC_None = 1;
    CX_SC_Extern = 2;
    CX_SC_Static = 3;
    CX_SC_PrivateExtern = 4;
    CX_SC_OpenCLWorkGroupLocal = 5;
    CX_SC_Auto = 6;
    CX_SC_Register = 7;

{*
 * Represents a specific kind of binary operator which can appear at a cursor.
  }
type
  TCX_BinaryOperatorKind =  Longint;
  Const
    CX_BO_Invalid = 0;
    CX_BO_PtrMemD = 1;
    CX_BO_PtrMemI = 2;
    CX_BO_Mul = 3;
    CX_BO_Div = 4;
    CX_BO_Rem = 5;
    CX_BO_Add = 6;
    CX_BO_Sub = 7;
    CX_BO_Shl = 8;
    CX_BO_Shr = 9;
    CX_BO_Cmp = 10;
    CX_BO_LT = 11;
    CX_BO_GT = 12;
    CX_BO_LE = 13;
    CX_BO_GE = 14;
    CX_BO_EQ = 15;
    CX_BO_NE = 16;
    CX_BO_And = 17;
    CX_BO_Xor = 18;
    CX_BO_Or = 19;
    CX_BO_LAnd = 20;
    CX_BO_LOr = 21;
    CX_BO_Assign = 22;
    CX_BO_MulAssign = 23;
    CX_BO_DivAssign = 24;
    CX_BO_RemAssign = 25;
    CX_BO_AddAssign = 26;
    CX_BO_SubAssign = 27;
    CX_BO_ShlAssign = 28;
    CX_BO_ShrAssign = 29;
    CX_BO_AndAssign = 30;
    CX_BO_XorAssign = 31;
    CX_BO_OrAssign = 32;
    CX_BO_Comma = 33;
    CX_BO_LAST = CX_BO_Comma;

{*
 * \brief Returns the operator code for the binary operator.
  }

function clang_Cursor_getBinaryOpcode(C:TCXCursor):TCX_BinaryOperatorKind;cdecl;external libgclang;
{*
 * \brief Returns a string containing the spelling of the binary operator.
  }
function clang_Cursor_getBinaryOpcodeStr(Op:TCX_BinaryOperatorKind):TCXString;cdecl;external libgclang;
{*
 * Returns the storage class for a function or variable declaration.
 *
 * If the passed in Cursor is not a function or variable declaration,
 * CX_SC_Invalid is returned else the storage class.
  }
function clang_Cursor_getStorageClass(para1:TCXCursor):TCX_StorageClass;cdecl;external libgclang;
{*
 * Determine the number of overloaded declarations referenced by a
 * \c CXCursor_OverloadedDeclRef cursor.
 *
 * \param cursor The cursor whose overloaded declarations are being queried.
 *
 * \returns The number of overloaded declarations referenced by \c cursor. If it
 * is not a \c CXCursor_OverloadedDeclRef cursor, returns 0.
  }
function clang_getNumOverloadedDecls(cursor:TCXCursor):dword;cdecl;external libgclang;
{*
 * Retrieve a cursor for one of the overloaded declarations referenced
 * by a \c CXCursor_OverloadedDeclRef cursor.
 *
 * \param cursor The cursor whose overloaded declarations are being queried.
 *
 * \param index The zero-based index into the set of overloaded declarations in
 * the cursor.
 *
 * \returns A cursor representing the declaration referenced by the given
 * \c cursor at the specified \c index. If the cursor does not have an
 * associated set of overloaded declarations, or if the index is out of bounds,
 * returns \c clang_getNullCursor();
  }
function clang_getOverloadedDecl(cursor:TCXCursor; index:dword):TCXCursor;cdecl;external libgclang;
{*
 * @
  }
{*
 * \defgroup CINDEX_ATTRIBUTES Information for attributes
 *
 * @
  }
{*
 * For cursors representing an iboutletcollection attribute,
 *  this function returns the collection element type.
 *
  }
function clang_getIBOutletCollectionType(para1:TCXCursor):TCXType;cdecl;external libgclang;
{*
 * @
  }
{*
 * \defgroup CINDEX_CURSOR_TRAVERSAL Traversing the AST with cursors
 *
 * These routines provide the ability to traverse the abstract syntax tree
 * using cursors.
 *
 * @
  }
{*
 * Describes how the traversal of the children of a particular
 * cursor should proceed after visiting a particular child cursor.
 *
 * A value of this enumeration type should be returned by each
 * \c CXCursorVisitor to indicate how clang_visitChildren() proceed.
  }
{*
   * Terminates the cursor traversal.
    }
{*
   * Continues the cursor traversal with the next sibling of
   * the cursor just visited, without visiting its children.
    }
{*
   * Recursively traverse the children of this cursor, using
   * the same visitor and client data.
    }
type
  TCXChildVisitResult =  Longint;
  Const
    CXChildVisit_Break = 0;
    CXChildVisit_Continue = 1;
    CXChildVisit_Recurse = 2;

{*
 * Visitor invoked for each cursor found by a traversal.
 *
 * This visitor function will be invoked for each cursor found by
 * clang_visitCursorChildren(). Its first argument is the cursor being
 * visited, its second argument is the parent visitor for that cursor,
 * and its third argument is the client data provided to
 * clang_visitCursorChildren().
 *
 * The visitor should return one of the \c CXChildVisitResult values
 * to direct clang_visitCursorChildren().
  }
type

  TCXCursorVisitor = function (cursor:TCXCursor; parent:TCXCursor; client_data:TCXClientData):TCXChildVisitResult;cdecl;
{*
 * Visit the children of a particular cursor.
 *
 * This function visits all the direct children of the given cursor,
 * invoking the given \p visitor function with the cursors of each
 * visited child. The traversal may be recursive, if the visitor returns
 * \c CXChildVisit_Recurse. The traversal may also be ended prematurely, if
 * the visitor returns \c CXChildVisit_Break.
 *
 * \param parent the cursor whose child may be visited. All kinds of
 * cursors can be visited, including invalid cursors (which, by
 * definition, have no children).
 *
 * \param visitor the visitor function that will be invoked for each
 * child of \p parent.
 *
 * \param client_data pointer data supplied by the client, which will
 * be passed to the visitor each time it is invoked.
 *
 * \returns a non-zero value if the traversal was terminated
 * prematurely by the visitor returning \c CXChildVisit_Break.
  }

function clang_visitChildren(parent:TCXCursor; visitor:TCXCursorVisitor; client_data:TCXClientData):dword;cdecl;external libgclang;
{*
 * Visitor invoked for each cursor found by a traversal.
 *
 * This visitor block will be invoked for each cursor found by
 * clang_visitChildrenWithBlock(). Its first argument is the cursor being
 * visited, its second argument is the parent visitor for that cursor.
 *
 * The visitor should return one of the \c CXChildVisitResult values
 * to direct clang_visitChildrenWithBlock().
  }
type
  PCXCursorVisitorBlock = ^TCXCursorVisitorBlock;
  TCXCursorVisitorBlock = PCXChildVisitResult;
{*
 * Visits the children of a cursor using the specified block.  Behaves
 * identically to clang_visitChildren() in all other respects.
  }

function clang_visitChildrenWithBlock(parent:TCXCursor; block:TCXCursorVisitorBlock):dword;cdecl;external libgclang;
{*
 * @
  }
{*
 * \defgroup CINDEX_CURSOR_XREF Cross-referencing in the AST
 *
 * These routines provide the ability to determine references within and
 * across translation units, by providing the names of the entities referenced
 * by cursors, follow reference cursors to the declarations they reference,
 * and associate declarations with their definitions.
 *
 * @
  }
{*
 * Retrieve a Unified Symbol Resolution (USR) for the entity referenced
 * by the given cursor.
 *
 * A Unified Symbol Resolution (USR) is a string that identifies a particular
 * entity (function, class, variable, etc.) within a program. USRs can be
 * compared across translation units to determine, e.g., when references in
 * one translation refer to an entity defined in another translation unit.
  }
function clang_getCursorUSR(para1:TCXCursor):TCXString;cdecl;external libgclang;
{*
 * Construct a USR for a specified Objective-C class.
  }
function clang_constructUSR_ObjCClass(class_name:Pchar):TCXString;cdecl;external libgclang;
{*
 * Construct a USR for a specified Objective-C category.
  }
function clang_constructUSR_ObjCCategory(class_name:Pchar; category_name:Pchar):TCXString;cdecl;external libgclang;
{*
 * Construct a USR for a specified Objective-C protocol.
  }
function clang_constructUSR_ObjCProtocol(protocol_name:Pchar):TCXString;cdecl;external libgclang;
{*
 * Construct a USR for a specified Objective-C instance variable and
 *   the USR for its containing class.
  }
function clang_constructUSR_ObjCIvar(name:Pchar; classUSR:TCXString):TCXString;cdecl;external libgclang;
{*
 * Construct a USR for a specified Objective-C method and
 *   the USR for its containing class.
  }
function clang_constructUSR_ObjCMethod(name:Pchar; isInstanceMethod:dword; classUSR:TCXString):TCXString;cdecl;external libgclang;
{*
 * Construct a USR for a specified Objective-C property and the USR
 *  for its containing class.
  }
function clang_constructUSR_ObjCProperty(_property:Pchar; classUSR:TCXString):TCXString;cdecl;external libgclang;
{*
 * Retrieve a name for the entity referenced by this cursor.
  }
function clang_getCursorSpelling(para1:TCXCursor):TCXString;cdecl;external libgclang;
{*
 * Retrieve a range for a piece that forms the cursors spelling name.
 * Most of the times there is only one range for the complete spelling but for
 * Objective-C methods and Objective-C message expressions, there are multiple
 * pieces for each selector identifier.
 *
 * \param pieceIndex the index of the spelling name piece. If this is greater
 * than the actual number of pieces, it will return a NULL (invalid) range.
 *
 * \param options Reserved.
  }
function clang_Cursor_getSpellingNameRange(para1:TCXCursor; pieceIndex:dword; options:dword):TCXSourceRange;cdecl;external libgclang;
{*
 * Opaque pointer representing a policy that controls pretty printing
 * for \c clang_getCursorPrettyPrinted.
  }
type
  PCXPrintingPolicy = ^TCXPrintingPolicy;
  TCXPrintingPolicy = pointer;
{*
 * Properties for the printing policy.
 *
 * See \c clang::PrintingPolicy for more information.
  }
  TCXPrintingPolicyProperty =  Longint;
  Const
    CXPrintingPolicy_Indentation = 0;
    CXPrintingPolicy_SuppressSpecifiers = 1;
    CXPrintingPolicy_SuppressTagKeyword = 2;
    CXPrintingPolicy_IncludeTagDefinition = 3;
    CXPrintingPolicy_SuppressScope = 4;
    CXPrintingPolicy_SuppressUnwrittenScope = 5;
    CXPrintingPolicy_SuppressInitializers = 6;
    CXPrintingPolicy_ConstantArraySizeAsWritten = 7;
    CXPrintingPolicy_AnonymousTagLocations = 8;
    CXPrintingPolicy_SuppressStrongLifetime = 9;
    CXPrintingPolicy_SuppressLifetimeQualifiers = 10;
    CXPrintingPolicy_SuppressTemplateArgsInCXXConstructors = 11;
    CXPrintingPolicy_Bool = 12;
    CXPrintingPolicy_Restrict = 13;
    CXPrintingPolicy_Alignof = 14;
    CXPrintingPolicy_UnderscoreAlignof = 15;
    CXPrintingPolicy_UseVoidForZeroParams = 16;
    CXPrintingPolicy_TerseOutput = 17;
    CXPrintingPolicy_PolishForDeclaration = 18;
    CXPrintingPolicy_Half = 19;
    CXPrintingPolicy_MSWChar = 20;
    CXPrintingPolicy_IncludeNewlines = 21;
    CXPrintingPolicy_MSVCFormatting = 22;
    CXPrintingPolicy_ConstantsAsWritten = 23;
    CXPrintingPolicy_SuppressImplicitBase = 24;
    CXPrintingPolicy_FullyQualifiedName = 25;
    CXPrintingPolicy_LastProperty = CXPrintingPolicy_FullyQualifiedName;

{*
 * Get a property value for the given printing policy.
  }

function clang_PrintingPolicy_getProperty(Policy:TCXPrintingPolicy; _Property:TCXPrintingPolicyProperty):dword;cdecl;external libgclang;
{*
 * Set a property value for the given printing policy.
  }
procedure clang_PrintingPolicy_setProperty(Policy:TCXPrintingPolicy; _Property:TCXPrintingPolicyProperty; Value:dword);cdecl;external libgclang;
{*
 * Retrieve the default policy for the cursor.
 *
 * The policy should be released after use with \c
 * clang_PrintingPolicy_dispose.
  }
function clang_getCursorPrintingPolicy(para1:TCXCursor):TCXPrintingPolicy;cdecl;external libgclang;
{*
 * Release a printing policy.
  }
procedure clang_PrintingPolicy_dispose(Policy:TCXPrintingPolicy);cdecl;external libgclang;
{*
 * Pretty print declarations.
 *
 * \param Cursor The cursor representing a declaration.
 *
 * \param Policy The policy to control the entities being printed. If
 * NULL, a default policy is used.
 *
 * \returns The pretty printed declaration or the empty string for
 * other cursors.
  }
function clang_getCursorPrettyPrinted(Cursor:TCXCursor; Policy:TCXPrintingPolicy):TCXString;cdecl;external libgclang;
{*
 * Pretty-print the underlying type using a custom printing policy.
 *
 * If the type is invalid, an empty string is returned.
  }
function clang_getTypePrettyPrinted(CT:TCXType; cxPolicy:TCXPrintingPolicy):TCXString;cdecl;external libgclang;
{*
 * Retrieve the display name for the entity referenced by this cursor.
 *
 * The display name contains extra information that helps identify the cursor,
 * such as the parameters of a function or template or the arguments of a
 * class template specialization.
  }
function clang_getCursorDisplayName(para1:TCXCursor):TCXString;cdecl;external libgclang;
{* For a cursor that is a reference, retrieve a cursor representing the
 * entity that it references.
 *
 * Reference cursors refer to other entities in the AST. For example, an
 * Objective-C superclass reference cursor refers to an Objective-C class.
 * This function produces the cursor for the Objective-C class from the
 * cursor for the superclass reference. If the input cursor is a declaration or
 * definition, it returns that declaration or definition unchanged.
 * Otherwise, returns the NULL cursor.
  }
function clang_getCursorReferenced(para1:TCXCursor):TCXCursor;cdecl;external libgclang;
{*
 *  For a cursor that is either a reference to or a declaration
 *  of some entity, retrieve a cursor that describes the definition of
 *  that entity.
 *
 *  Some entities can be declared multiple times within a translation
 *  unit, but only one of those declarations can also be a
 *  definition. For example, given:
 *
 *  \code
 *  int f(int, int);
 *  int g(int x, int y)  return f(x, y); 
 *  int f(int a, int b)  return a + b; 
 *  int f(int, int);
 *  \endcode
 *
 *  there are three declarations of the function "f", but only the
 *  second one is a definition. The clang_getCursorDefinition()
 *  function will take any cursor pointing to a declaration of "f"
 *  (the first or fourth lines of the example) or a cursor referenced
 *  that uses "f" (the call to "f' inside "g") and will return a
 *  declaration cursor pointing to the definition (the second "f"
 *  declaration).
 *
 *  If given a cursor for which there is no corresponding definition,
 *  e.g., because there is no definition of that entity within this
 *  translation unit, returns a NULL cursor.
  }
function clang_getCursorDefinition(para1:TCXCursor):TCXCursor;cdecl;external libgclang;
{*
 * Determine whether the declaration pointed to by this cursor
 * is also a definition of that entity.
  }
function clang_isCursorDefinition(para1:TCXCursor):dword;cdecl;external libgclang;
{*
 * Retrieve the canonical cursor corresponding to the given cursor.
 *
 * In the C family of languages, many kinds of entities can be declared several
 * times within a single translation unit. For example, a structure type can
 * be forward-declared (possibly multiple times) and later defined:
 *
 * \code
 * struct X;
 * struct X;
 * struct X 
 *   int member;
 * ;
 * \endcode
 *
 * The declarations and the definition of \c X are represented by three
 * different cursors, all of which are declarations of the same underlying
 * entity. One of these cursor is considered the "canonical" cursor, which
 * is effectively the representative for the underlying entity. One can
 * determine if two cursors are declarations of the same underlying entity by
 * comparing their canonical cursors.
 *
 * \returns The canonical cursor for the entity referred to by the given cursor.
  }
function clang_getCanonicalCursor(para1:TCXCursor):TCXCursor;cdecl;external libgclang;
{*
 * If the cursor points to a selector identifier in an Objective-C
 * method or message expression, this returns the selector index.
 *
 * After getting a cursor with #clang_getCursor, this can be called to
 * determine if the location points to a selector identifier.
 *
 * \returns The selector index if the cursor is an Objective-C method or message
 * expression and the cursor is pointing to a selector identifier, or -1
 * otherwise.
  }
function clang_Cursor_getObjCSelectorIndex(para1:TCXCursor):longint;cdecl;external libgclang;
{*
 * Given a cursor pointing to a C++ method call or an Objective-C
 * message, returns non-zero if the method/message is "dynamic", meaning:
 *
 * For a C++ method: the call is virtual.
 * For an Objective-C message: the receiver is an object instance, not 'super'
 * or a specific class.
 *
 * If the method/message is "static" or the cursor does not point to a
 * method/message, it will return zero.
  }
function clang_Cursor_isDynamicCall(C:TCXCursor):longint;cdecl;external libgclang;
{*
 * Given a cursor pointing to an Objective-C message or property
 * reference, or C++ method call, returns the CXType of the receiver.
  }
function clang_Cursor_getReceiverType(C:TCXCursor):TCXType;cdecl;external libgclang;
{*
 * Property attributes for a \c CXCursor_ObjCPropertyDecl.
  }
type
  PCXObjCPropertyAttrKind = ^TCXObjCPropertyAttrKind;
  TCXObjCPropertyAttrKind =  Longint;
  Const
    CXObjCPropertyAttr_noattr = $00;
    CXObjCPropertyAttr_readonly = $01;
    CXObjCPropertyAttr_getter = $02;
    CXObjCPropertyAttr_assign = $04;
    CXObjCPropertyAttr_readwrite = $08;
    CXObjCPropertyAttr_retain = $10;
    CXObjCPropertyAttr_copy = $20;
    CXObjCPropertyAttr_nonatomic = $40;
    CXObjCPropertyAttr_setter = $80;
    CXObjCPropertyAttr_atomic = $100;
    CXObjCPropertyAttr_weak = $200;
    CXObjCPropertyAttr_strong = $400;
    CXObjCPropertyAttr_unsafe_unretained = $800;
    CXObjCPropertyAttr_class = $1000;
;
{*
 * Given a cursor that represents a property declaration, return the
 * associated property attributes. The bits are formed from
 * \c CXObjCPropertyAttrKind.
 *
 * \param reserved Reserved for future use, pass 0.
  }

function clang_Cursor_getObjCPropertyAttributes(C:TCXCursor; reserved:dword):dword;cdecl;external libgclang;
{*
 * Given a cursor that represents a property declaration, return the
 * name of the method that implements the getter.
  }
function clang_Cursor_getObjCPropertyGetterName(C:TCXCursor):TCXString;cdecl;external libgclang;
{*
 * Given a cursor that represents a property declaration, return the
 * name of the method that implements the setter, if any.
  }
function clang_Cursor_getObjCPropertySetterName(C:TCXCursor):TCXString;cdecl;external libgclang;
{*
 * 'Qualifiers' written next to the return and parameter types in
 * Objective-C method declarations.
  }
type
  PCXObjCDeclQualifierKind = ^TCXObjCDeclQualifierKind;
  TCXObjCDeclQualifierKind =  Longint;
  Const
    CXObjCDeclQualifier_None = $0;
    CXObjCDeclQualifier_In = $1;
    CXObjCDeclQualifier_Inout = $2;
    CXObjCDeclQualifier_Out = $4;
    CXObjCDeclQualifier_Bycopy = $8;
    CXObjCDeclQualifier_Byref = $10;
    CXObjCDeclQualifier_Oneway = $20;
;
{*
 * Given a cursor that represents an Objective-C method or parameter
 * declaration, return the associated Objective-C qualifiers for the return
 * type or the parameter respectively. The bits are formed from
 * CXObjCDeclQualifierKind.
  }

function clang_Cursor_getObjCDeclQualifiers(C:TCXCursor):dword;cdecl;external libgclang;
{*
 * Given a cursor that represents an Objective-C method or property
 * declaration, return non-zero if the declaration was affected by "\@optional".
 * Returns zero if the cursor is not such a declaration or it is "\@required".
  }
function clang_Cursor_isObjCOptional(C:TCXCursor):dword;cdecl;external libgclang;
{*
 * Returns non-zero if the given cursor is a variadic function or method.
  }
function clang_Cursor_isVariadic(C:TCXCursor):dword;cdecl;external libgclang;
{*
 * Returns non-zero if the given cursor points to a symbol marked with
 * external_source_symbol attribute.
 *
 * \param language If non-NULL, and the attribute is present, will be set to
 * the 'language' string from the attribute.
 *
 * \param definedIn If non-NULL, and the attribute is present, will be set to
 * the 'definedIn' string from the attribute.
 *
 * \param isGenerated If non-NULL, and the attribute is present, will be set to
 * non-zero if the 'generated_declaration' is set in the attribute.
  }
function clang_Cursor_isExternalSymbol(C:TCXCursor; language:PCXString; definedIn:PCXString; isGenerated:Pdword):dword;cdecl;external libgclang;
{*
 * Given a cursor that represents a declaration, return the associated
 * comment's source range.  The range may include multiple consecutive comments
 * with whitespace in between.
  }
function clang_Cursor_getCommentRange(C:TCXCursor):TCXSourceRange;cdecl;external libgclang;
{*
 * Given a cursor that represents a declaration, return the associated
 * comment text, including comment markers.
  }
function clang_Cursor_getRawCommentText(C:TCXCursor):TCXString;cdecl;external libgclang;
{*
 * Given a cursor that represents a documentable entity (e.g.,
 * declaration), return the associated \paragraph; otherwise return the
 * first paragraph.
  }
function clang_Cursor_getBriefCommentText(C:TCXCursor):TCXString;cdecl;external libgclang;
{*
 * @
  }
{* \defgroup CINDEX_MANGLE Name Mangling API Functions
 *
 * @
  }
{*
 * Retrieve the CXString representing the mangled name of the cursor.
  }
function clang_Cursor_getMangling(para1:TCXCursor):TCXString;cdecl;external libgclang;
{*
 * Retrieve the CXStrings representing the mangled symbols of the C++
 * constructor or destructor at the cursor.
  }
function clang_Cursor_getCXXManglings(para1:TCXCursor):PCXStringSet;cdecl;external libgclang;
{*
 * Retrieve the CXStrings representing the mangled symbols of the ObjC
 * class interface or implementation at the cursor.
  }
function clang_Cursor_getObjCManglings(para1:TCXCursor):PCXStringSet;cdecl;external libgclang;
{*
 * @
  }
{*
 * \defgroup CINDEX_MODULE Module introspection
 *
 * The functions in this group provide access to information about modules.
 *
 * @
  }
type
  PCXModule = ^TCXModule;
  TCXModule = pointer;
{*
 * Given a CXCursor_ModuleImportDecl cursor, return the associated module.
  }

function clang_Cursor_getModule(C:TCXCursor):TCXModule;cdecl;external libgclang;
{*
 * Given a CXFile header file, return the module that contains it, if one
 * exists.
  }
function clang_getModuleForFile(para1:TCXTranslationUnit; para2:TCXFile):TCXModule;cdecl;external libgclang;
{*
 * \param Module a module object.
 *
 * \returns the module file where the provided module object came from.
  }
function clang_Module_getASTFile(Module:TCXModule):TCXFile;cdecl;external libgclang;
{*
 * \param Module a module object.
 *
 * \returns the parent of a sub-module or NULL if the given module is top-level,
 * e.g. for 'std.vector' it will return the 'std' module.
  }
function clang_Module_getParent(Module:TCXModule):TCXModule;cdecl;external libgclang;
{*
 * \param Module a module object.
 *
 * \returns the name of the module, e.g. for the 'std.vector' sub-module it
 * will return "vector".
  }
function clang_Module_getName(Module:TCXModule):TCXString;cdecl;external libgclang;
{*
 * \param Module a module object.
 *
 * \returns the full name of the module, e.g. "std.vector".
  }
function clang_Module_getFullName(Module:TCXModule):TCXString;cdecl;external libgclang;
{*
 * \param Module a module object.
 *
 * \returns non-zero if the module is a system one.
  }
function clang_Module_isSystem(Module:TCXModule):longint;cdecl;external libgclang;
{*
 * \param Module a module object.
 *
 * \returns the number of top level headers associated with this module.
  }
function clang_Module_getNumTopLevelHeaders(para1:TCXTranslationUnit; Module:TCXModule):dword;cdecl;external libgclang;
{*
 * \param Module a module object.
 *
 * \param Index top level header index (zero-based).
 *
 * \returns the specified top level header associated with the module.
  }
function clang_Module_getTopLevelHeader(para1:TCXTranslationUnit; Module:TCXModule; Index:dword):TCXFile;cdecl;external libgclang;
{*
 * @
  }
{*
 * \defgroup CINDEX_CPP C++ AST introspection
 *
 * The routines in this group provide access information in the ASTs specific
 * to C++ language features.
 *
 * @
  }
{*
 * Determine if a C++ constructor is a converting constructor.
  }
function clang_CXXConstructor_isConvertingConstructor(C:TCXCursor):dword;cdecl;external libgclang;
{*
 * Determine if a C++ constructor is a copy constructor.
  }
function clang_CXXConstructor_isCopyConstructor(C:TCXCursor):dword;cdecl;external libgclang;
{*
 * Determine if a C++ constructor is the default constructor.
  }
function clang_CXXConstructor_isDefaultConstructor(C:TCXCursor):dword;cdecl;external libgclang;
{*
 * Determine if a C++ constructor is a move constructor.
  }
function clang_CXXConstructor_isMoveConstructor(C:TCXCursor):dword;cdecl;external libgclang;
{*
 * Determine if a C++ field is declared 'mutable'.
  }
function clang_CXXField_isMutable(C:TCXCursor):dword;cdecl;external libgclang;
{*
 * Determine if a C++ method is declared '= default'.
  }
function clang_CXXMethod_isDefaulted(C:TCXCursor):dword;cdecl;external libgclang;
{*
 * Determine if a C++ method is declared '= delete'.
  }
function clang_CXXMethod_isDeleted(C:TCXCursor):dword;cdecl;external libgclang;
{*
 * Determine if a C++ member function or member function template is
 * pure virtual.
  }
function clang_CXXMethod_isPureVirtual(C:TCXCursor):dword;cdecl;external libgclang;
{*
 * Determine if a C++ member function or member function template is
 * declared 'static'.
  }
function clang_CXXMethod_isStatic(C:TCXCursor):dword;cdecl;external libgclang;
{*
 * Determine if a C++ member function or member function template is
 * explicitly declared 'virtual' or if it overrides a virtual method from
 * one of the base classes.
  }
function clang_CXXMethod_isVirtual(C:TCXCursor):dword;cdecl;external libgclang;
{*
 * Determine if a C++ member function is a copy-assignment operator,
 * returning 1 if such is the case and 0 otherwise.
 *
 * > A copy-assignment operator `X::operator=` is a non-static,
 * > non-template member function of _class_ `X` with exactly one
 * > parameter of type `X`, `X&`, `const X&`, ` X&` or `const
 * >  X&`.
 *
 * That is, for example, the `operator=` in:
 *
 *    class Foo 
 *        bool operator=(const  Foo&);
 *    ;
 *
 * Is a copy-assignment operator, while the `operator=` in:
 *
 *    class Bar 
 *        bool operator=(const int&);
 *    ;
 *
 * Is not.
  }
function clang_CXXMethod_isCopyAssignmentOperator(C:TCXCursor):dword;cdecl;external libgclang;
{*
 * Determine if a C++ member function is a move-assignment operator,
 * returning 1 if such is the case and 0 otherwise.
 *
 * > A move-assignment operator `X::operator=` is a non-static,
 * > non-template member function of _class_ `X` with exactly one
 * > parameter of type `X&&`, `const X&&`, ` X&&` or `const
 * >  X&&`.
 *
 * That is, for example, the `operator=` in:
 *
 *    class Foo 
 *        bool operator=(const  Foo&&);
 *    ;
 *
 * Is a move-assignment operator, while the `operator=` in:
 *
 *    class Bar 
 *        bool operator=(const int&&);
 *    ;
 *
 * Is not.
  }
function clang_CXXMethod_isMoveAssignmentOperator(C:TCXCursor):dword;cdecl;external libgclang;
{*
 * Determines if a C++ constructor or conversion function was declared
 * explicit, returning 1 if such is the case and 0 otherwise.
 *
 * Constructors or conversion functions are declared explicit through
 * the use of the explicit specifier.
 *
 * For example, the following constructor and conversion function are
 * not explicit as they lack the explicit specifier:
 *
 *     class Foo 
 *         Foo();
 *         operator int();
 *     ;
 *
 * While the following constructor and conversion function are
 * explicit as they are declared with the explicit specifier.
 *
 *     class Foo 
 *         explicit Foo();
 *         explicit operator int();
 *     ;
 *
 * This function will return 0 when given a cursor pointing to one of
 * the former declarations and it will return 1 for a cursor pointing
 * to the latter declarations.
 *
 * The explicit specifier allows the user to specify a
 * conditional compile-time expression whose value decides
 * whether the marked element is explicit or not.
 *
 * For example:
 *
 *     constexpr bool foo(int i)  return i % 2 == 0; 
 *
 *     class Foo 
 *          explicit(foo(1)) Foo();
 *          explicit(foo(2)) operator int();
 *     
 *
 * This function will return 0 for the constructor and 1 for
 * the conversion function.
  }
function clang_CXXMethod_isExplicit(C:TCXCursor):dword;cdecl;external libgclang;
{*
 * Determine if a C++ record is abstract, i.e. whether a class or struct
 * has a pure virtual member function.
  }
function clang_CXXRecord_isAbstract(C:TCXCursor):dword;cdecl;external libgclang;
{*
 * Determine if an enum declaration refers to a scoped enum.
  }
function clang_EnumDecl_isScoped(C:TCXCursor):dword;cdecl;external libgclang;
{*
 * Determine if a C++ member function or member function template is
 * declared 'const'.
  }
function clang_CXXMethod_isConst(C:TCXCursor):dword;cdecl;external libgclang;
{*
 * Given a cursor that represents a template, determine
 * the cursor kind of the specializations would be generated by instantiating
 * the template.
 *
 * This routine can be used to determine what flavor of function template,
 * class template, or class template partial specialization is stored in the
 * cursor. For example, it can describe whether a class template cursor is
 * declared with "struct", "class" or "union".
 *
 * \param C The cursor to query. This cursor should represent a template
 * declaration.
 *
 * \returns The cursor kind of the specializations that would be generated
 * by instantiating the template \p C. If \p C is not a template, returns
 * \c CXCursor_NoDeclFound.
  }
function clang_getTemplateCursorKind(C:TCXCursor):TCXCursorKind;cdecl;external libgclang;
{*
 * Given a cursor that may represent a specialization or instantiation
 * of a template, retrieve the cursor that represents the template that it
 * specializes or from which it was instantiated.
 *
 * This routine determines the template involved both for explicit
 * specializations of templates and for implicit instantiations of the template,
 * both of which are referred to as "specializations". For a class template
 * specialization (e.g., \c std::vector<bool>), this routine will return
 * either the primary template (\c std::vector) or, if the specialization was
 * instantiated from a class template partial specialization, the class template
 * partial specialization. For a class template partial specialization and a
 * function template specialization (including instantiations), this
 * this routine will return the specialized template.
 *
 * For members of a class template (e.g., member functions, member classes, or
 * static data members), returns the specialized or instantiated member.
 * Although not strictly "templates" in the C++ language, members of class
 * templates have the same notions of specializations and instantiations that
 * templates do, so this routine treats them similarly.
 *
 * \param C A cursor that may be a specialization of a template or a member
 * of a template.
 *
 * \returns If the given cursor is a specialization or instantiation of a
 * template or a member thereof, the template or member that it specializes or
 * from which it was instantiated. Otherwise, returns a NULL cursor.
  }
function clang_getSpecializedCursorTemplate(C:TCXCursor):TCXCursor;cdecl;external libgclang;
{*
 * Given a cursor that references something else, return the source range
 * covering that reference.
 *
 * \param C A cursor pointing to a member reference, a declaration reference, or
 * an operator call.
 * \param NameFlags A bitset with three independent flags:
 * CXNameRange_WantQualifier, CXNameRange_WantTemplateArgs, and
 * CXNameRange_WantSinglePiece.
 * \param PieceIndex For contiguous names or when passing the flag
 * CXNameRange_WantSinglePiece, only one piece with index 0 is
 * available. When the CXNameRange_WantSinglePiece flag is not passed for a
 * non-contiguous names, this index can be used to retrieve the individual
 * pieces of the name. See also CXNameRange_WantSinglePiece.
 *
 * \returns The piece of the name pointed to by the given cursor. If there is no
 * name, or if the PieceIndex is out-of-range, a null-cursor will be returned.
  }
function clang_getCursorReferenceNameRange(C:TCXCursor; NameFlags:dword; PieceIndex:dword):TCXSourceRange;cdecl;external libgclang;
{*
   * Include the nested-name-specifier, e.g. Foo:: in x.Foo::y, in the
   * range.
    }
{*
   * Include the explicit template arguments, e.g. \<int> in x.f<int>,
   * in the range.
    }
{*
   * If the name is non-contiguous, return the full spanning range.
   *
   * Non-contiguous names occur in Objective-C when a selector with two or more
   * parameters is used, or in C++ when using an operator:
   * \code
   * [object doSomething:here withValue:there]; // Objective-C
   * return some_vector[1]; // C++
   * \endcode
    }
type
  TCXNameRefFlags =  Longint;
  Const
    CXNameRange_WantQualifier = $1;
    CXNameRange_WantTemplateArgs = $2;
    CXNameRange_WantSinglePiece = $4;

{*
 * @
  }
{*
 * \defgroup CINDEX_LEX Token extraction and manipulation
 *
 * The routines in this group provide access to the tokens within a
 * translation unit, along with a semantic mapping of those tokens to
 * their corresponding cursors.
 *
 * @
  }
{*
 * Describes a kind of token.
  }
{*
   * A token that contains some kind of punctuation.
    }
{*
   * A language keyword.
    }
{*
   * An identifier (that is not a keyword).
    }
{*
   * A numeric, string, or character literal.
    }
{*
   * A comment.
    }
type
  PCXTokenKind = ^TCXTokenKind;
  TCXTokenKind =  Longint;
  Const
    CXToken_Punctuation = 0;
    CXToken_Keyword = 1;
    CXToken_Identifier = 2;
    CXToken_Literal = 3;
    CXToken_Comment = 4;
;
{*
 * Describes a single preprocessing token.
  }
type
  PCXToken = ^TCXToken;
  TCXToken = record
      int_data : array[0..3] of dword;
      ptr_data : pointer;
    end;
{*
 * Get the raw lexical token starting with the given location.
 *
 * \param TU the translation unit whose text is being tokenized.
 *
 * \param Location the source location with which the token starts.
 *
 * \returns The token starting with the given location or NULL if no such token
 * exist. The returned pointer must be freed with clang_disposeTokens before the
 * translation unit is destroyed.
  }

function clang_getToken(TU:TCXTranslationUnit; Location:TCXSourceLocation):PCXToken;cdecl;external libgclang;
{*
 * Determine the kind of the given token.
  }
function clang_getTokenKind(para1:TCXToken):TCXTokenKind;cdecl;external libgclang;
{*
 * Determine the spelling of the given token.
 *
 * The spelling of a token is the textual representation of that token, e.g.,
 * the text of an identifier or keyword.
  }
function clang_getTokenSpelling(para1:TCXTranslationUnit; para2:TCXToken):TCXString;cdecl;external libgclang;
{*
 * Retrieve the source location of the given token.
  }
function clang_getTokenLocation(para1:TCXTranslationUnit; para2:TCXToken):TCXSourceLocation;cdecl;external libgclang;
{*
 * Retrieve a source range that covers the given token.
  }
function clang_getTokenExtent(para1:TCXTranslationUnit; para2:TCXToken):TCXSourceRange;cdecl;external libgclang;
{*
 * Tokenize the source code described by the given range into raw
 * lexical tokens.
 *
 * \param TU the translation unit whose text is being tokenized.
 *
 * \param Range the source range in which text should be tokenized. All of the
 * tokens produced by tokenization will fall within this source range,
 *
 * \param Tokens this pointer will be set to point to the array of tokens
 * that occur within the given source range. The returned pointer must be
 * freed with clang_disposeTokens() before the translation unit is destroyed.
 *
 * \param NumTokens will be set to the number of tokens in the \c *Tokens
 * array.
 *
  }
procedure clang_tokenize(TU:TCXTranslationUnit; Range:TCXSourceRange; Tokens:PPCXToken; NumTokens:Pdword);cdecl;external libgclang;
{*
 * Annotate the given set of tokens by providing cursors for each token
 * that can be mapped to a specific entity within the abstract syntax tree.
 *
 * This token-annotation routine is equivalent to invoking
 * clang_getCursor() for the source locations of each of the
 * tokens. The cursors provided are filtered, so that only those
 * cursors that have a direct correspondence to the token are
 * accepted. For example, given a function call \c f(x),
 * clang_getCursor() would provide the following cursors:
 *
 *   * when the cursor is over the 'f', a DeclRefExpr cursor referring to 'f'.
 *   * when the cursor is over the '(' or the ')', a CallExpr referring to 'f'.
 *   * when the cursor is over the 'x', a DeclRefExpr cursor referring to 'x'.
 *
 * Only the first and last of these cursors will occur within the
 * annotate, since the tokens "f" and "x' directly refer to a function
 * and a variable, respectively, but the parentheses are just a small
 * part of the full syntax of the function call expression, which is
 * not provided as an annotation.
 *
 * \param TU the translation unit that owns the given tokens.
 *
 * \param Tokens the set of tokens to annotate.
 *
 * \param NumTokens the number of tokens in \p Tokens.
 *
 * \param Cursors an array of \p NumTokens cursors, whose contents will be
 * replaced with the cursors corresponding to each token.
  }
procedure clang_annotateTokens(TU:TCXTranslationUnit; Tokens:PCXToken; NumTokens:dword; Cursors:PCXCursor);cdecl;external libgclang;
{*
 * Free the given set of tokens.
  }
procedure clang_disposeTokens(TU:TCXTranslationUnit; Tokens:PCXToken; NumTokens:dword);cdecl;external libgclang;
{*
 * @
  }
{*
 * \defgroup CINDEX_DEBUG Debugging facilities
 *
 * These routines are used for testing and debugging, only, and should not
 * be relied upon.
 *
 * @
  }
{ for debug/testing  }
function clang_getCursorKindSpelling(Kind:TCXCursorKind):TCXString;cdecl;external libgclang;
procedure clang_getDefinitionSpellingAndExtent(para1:TCXCursor; startBuf:PPchar; endBuf:PPchar; startLine:Pdword; startColumn:Pdword; 
            endLine:Pdword; endColumn:Pdword);cdecl;external libgclang;
procedure clang_enableStackTraces;cdecl;external libgclang;
procedure clang_executeOnThread(fn:procedure (para1:pointer); user_data:pointer; stack_size:dword);cdecl;external libgclang;
{*
 * @
  }
{*
 * \defgroup CINDEX_CODE_COMPLET Code completion
 *
 * Code completion involves taking an (incomplete) source file, along with
 * knowledge of where the user is actively editing that file, and suggesting
 * syntactically- and semantically-valid constructs that the user might want to
 * use at that particular point in the source code. These data structures and
 * routines provide support for code completion.
 *
 * @
  }
{*
 * A semantic string that describes a code-completion result.
 *
 * A semantic string that describes the formatting of a code-completion
 * result as a single "template" of text that should be inserted into the
 * source buffer when a particular code-completion result is selected.
 * Each semantic string is made up of some number of "chunks", each of which
 * contains some text along with a description of what that text means, e.g.,
 * the name of the entity being referenced, whether the text chunk is part of
 * the template, or whether it is a "placeholder" that the user should replace
 * with actual code,of a specific kind. See \c CXCompletionChunkKind for a
 * description of the different kinds of chunks.
  }
type
  PCXCompletionString = ^TCXCompletionString;
  TCXCompletionString = pointer;
{*
 * A single result of code completion.
  }
{*
   * The kind of entity that this completion refers to.
   *
   * The cursor kind will be a macro, keyword, or a declaration (one of the
   * *Decl cursor kinds), describing the entity that the completion is
   * referring to.
   *
   * \todo In the future, we would like to provide a full cursor, to allow
   * the client to extract additional information from declaration.
    }
{*
   * The code-completion string that describes how to insert this
   * code-completion result into the editing buffer.
    }

  PCXCompletionResult = ^TCXCompletionResult;
  TCXCompletionResult = record
      CursorKind : TCXCursorKind;
      CompletionString : TCXCompletionString;
    end;
{*
 * Describes a single piece of text within a code-completion string.
 *
 * Each "chunk" within a code-completion string (\c CXCompletionString) is
 * either a piece of text with a specific "kind" that describes how that text
 * should be interpreted by the client or is another completion string.
  }
{*
   * A code-completion string that describes "optional" text that
   * could be a part of the template (but is not required).
   *
   * The Optional chunk is the only kind of chunk that has a code-completion
   * string for its representation, which is accessible via
   * \c clang_getCompletionChunkCompletionString(). The code-completion string
   * describes an additional part of the template that is completely optional.
   * For example, optional chunks can be used to describe the placeholders for
   * arguments that match up with defaulted function parameters, e.g. given:
   *
   * \code
   * void f(int x, float y = 3.14, double z = 2.71828);
   * \endcode
   *
   * The code-completion string for this function would contain:
   *   - a TypedText chunk for "f".
   *   - a LeftParen chunk for "(".
   *   - a Placeholder chunk for "int x"
   *   - an Optional chunk containing the remaining defaulted arguments, e.g.,
   *       - a Comma chunk for ","
   *       - a Placeholder chunk for "float y"
   *       - an Optional chunk containing the last defaulted argument:
   *           - a Comma chunk for ","
   *           - a Placeholder chunk for "double z"
   *   - a RightParen chunk for ")"
   *
   * There are many ways to handle Optional chunks. Two simple approaches are:
   *   - Completely ignore optional chunks, in which case the template for the
   *     function "f" would only include the first parameter ("int x").
   *   - Fully expand all optional chunks, in which case the template for the
   *     function "f" would have all of the parameters.
    }
{*
   * Text that a user would be expected to type to get this
   * code-completion result.
   *
   * There will be exactly one "typed text" chunk in a semantic string, which
   * will typically provide the spelling of a keyword or the name of a
   * declaration that could be used at the current code point. Clients are
   * expected to filter the code-completion results based on the text in this
   * chunk.
    }
{*
   * Text that should be inserted as part of a code-completion result.
   *
   * A "text" chunk represents text that is part of the template to be
   * inserted into user code should this particular code-completion result
   * be selected.
    }
{*
   * Placeholder text that should be replaced by the user.
   *
   * A "placeholder" chunk marks a place where the user should insert text
   * into the code-completion template. For example, placeholders might mark
   * the function parameters for a function declaration, to indicate that the
   * user should provide arguments for each of those parameters. The actual
   * text in a placeholder is a suggestion for the text to display before
   * the user replaces the placeholder with real code.
    }
{*
   * Informative text that should be displayed but never inserted as
   * part of the template.
   *
   * An "informative" chunk contains annotations that can be displayed to
   * help the user decide whether a particular code-completion result is the
   * right option, but which is not part of the actual template to be inserted
   * by code completion.
    }
{*
   * Text that describes the current parameter when code-completion is
   * referring to function call, message send, or template specialization.
   *
   * A "current parameter" chunk occurs when code-completion is providing
   * information about a parameter corresponding to the argument at the
   * code-completion point. For example, given a function
   *
   * \code
   * int add(int x, int y);
   * \endcode
   *
   * and the source code \c add(, where the code-completion point is after the
   * "(", the code-completion string will contain a "current parameter" chunk
   * for "int x", indicating that the current argument will initialize that
   * parameter. After typing further, to \c add(17, (where the code-completion
   * point is after the ","), the code-completion string will contain a
   * "current parameter" chunk to "int y".
    }
{*
   * A left parenthesis ('('), used to initiate a function call or
   * signal the beginning of a function parameter list.
    }
{*
   * A right parenthesis (')'), used to finish a function call or
   * signal the end of a function parameter list.
    }
{*
   * A left bracket ('[').
    }
{*
   * A right bracket (']').
    }
{*
   * A left brace ('').
    }
{*
   * A right brace ('').
    }
{*
   * A left angle bracket ('<').
    }
{*
   * A right angle bracket ('>').
    }
{*
   * A comma separator (',').
    }
{*
   * Text that specifies the result type of a given result.
   *
   * This special kind of informative chunk is not meant to be inserted into
   * the text buffer. Rather, it is meant to illustrate the type that an
   * expression using the given completion string would have.
    }
{*
   * A colon (':').
    }
{*
   * A semicolon (';').
    }
{*
   * An '=' sign.
    }
{*
   * Horizontal space (' ').
    }
{*
   * Vertical space ('\\n'), after which it is generally a good idea to
   * perform indentation.
    }
  TCXCompletionChunkKind =  Longint;
  Const
    CXCompletionChunk_Optional = 0;
    CXCompletionChunk_TypedText = 1;
    CXCompletionChunk_Text = 2;
    CXCompletionChunk_Placeholder = 3;
    CXCompletionChunk_Informative = 4;
    CXCompletionChunk_CurrentParameter = 5;
    CXCompletionChunk_LeftParen = 6;
    CXCompletionChunk_RightParen = 7;
    CXCompletionChunk_LeftBracket = 8;
    CXCompletionChunk_RightBracket = 9;
    CXCompletionChunk_LeftBrace = 10;
    CXCompletionChunk_RightBrace = 11;
    CXCompletionChunk_LeftAngle = 12;
    CXCompletionChunk_RightAngle = 13;
    CXCompletionChunk_Comma = 14;
    CXCompletionChunk_ResultType = 15;
    CXCompletionChunk_Colon = 16;
    CXCompletionChunk_SemiColon = 17;
    CXCompletionChunk_Equal = 18;
    CXCompletionChunk_HorizontalSpace = 19;
    CXCompletionChunk_VerticalSpace = 20;

{*
 * Determine the kind of a particular chunk within a completion string.
 *
 * \param completion_string the completion string to query.
 *
 * \param chunk_number the 0-based index of the chunk in the completion string.
 *
 * \returns the kind of the chunk at the index \c chunk_number.
  }

function clang_getCompletionChunkKind(completion_string:TCXCompletionString; chunk_number:dword):TCXCompletionChunkKind;cdecl;external libgclang;
{*
 * Retrieve the text associated with a particular chunk within a
 * completion string.
 *
 * \param completion_string the completion string to query.
 *
 * \param chunk_number the 0-based index of the chunk in the completion string.
 *
 * \returns the text associated with the chunk at index \c chunk_number.
  }
function clang_getCompletionChunkText(completion_string:TCXCompletionString; chunk_number:dword):TCXString;cdecl;external libgclang;
{*
 * Retrieve the completion string associated with a particular chunk
 * within a completion string.
 *
 * \param completion_string the completion string to query.
 *
 * \param chunk_number the 0-based index of the chunk in the completion string.
 *
 * \returns the completion string associated with the chunk at index
 * \c chunk_number.
  }
function clang_getCompletionChunkCompletionString(completion_string:TCXCompletionString; chunk_number:dword):TCXCompletionString;cdecl;external libgclang;
{*
 * Retrieve the number of chunks in the given code-completion string.
  }
function clang_getNumCompletionChunks(completion_string:TCXCompletionString):dword;cdecl;external libgclang;
{*
 * Determine the priority of this code completion.
 *
 * The priority of a code completion indicates how likely it is that this
 * particular completion is the completion that the user will select. The
 * priority is selected by various internal heuristics.
 *
 * \param completion_string The completion string to query.
 *
 * \returns The priority of this completion string. Smaller values indicate
 * higher-priority (more likely) completions.
  }
function clang_getCompletionPriority(completion_string:TCXCompletionString):dword;cdecl;external libgclang;
{*
 * Determine the availability of the entity that this code-completion
 * string refers to.
 *
 * \param completion_string The completion string to query.
 *
 * \returns The availability of the completion string.
  }
function clang_getCompletionAvailability(completion_string:TCXCompletionString):TCXAvailabilityKind;cdecl;external libgclang;
{*
 * Retrieve the number of annotations associated with the given
 * completion string.
 *
 * \param completion_string the completion string to query.
 *
 * \returns the number of annotations associated with the given completion
 * string.
  }
function clang_getCompletionNumAnnotations(completion_string:TCXCompletionString):dword;cdecl;external libgclang;
{*
 * Retrieve the annotation associated with the given completion string.
 *
 * \param completion_string the completion string to query.
 *
 * \param annotation_number the 0-based index of the annotation of the
 * completion string.
 *
 * \returns annotation string associated with the completion at index
 * \c annotation_number, or a NULL string if that annotation is not available.
  }
function clang_getCompletionAnnotation(completion_string:TCXCompletionString; annotation_number:dword):TCXString;cdecl;external libgclang;
{*
 * Retrieve the parent context of the given completion string.
 *
 * The parent context of a completion string is the semantic parent of
 * the declaration (if any) that the code completion represents. For example,
 * a code completion for an Objective-C method would have the method's class
 * or protocol as its context.
 *
 * \param completion_string The code completion string whose parent is
 * being queried.
 *
 * \param kind DEPRECATED: always set to CXCursor_NotImplemented if non-NULL.
 *
 * \returns The name of the completion parent, e.g., "NSObject" if
 * the completion string represents a method in the NSObject class.
  }
function clang_getCompletionParent(completion_string:TCXCompletionString; kind:PCXCursorKind):TCXString;cdecl;external libgclang;
{*
 * Retrieve the brief documentation comment attached to the declaration
 * that corresponds to the given completion string.
  }
function clang_getCompletionBriefComment(completion_string:TCXCompletionString):TCXString;cdecl;external libgclang;
{*
 * Retrieve a completion string for an arbitrary declaration or macro
 * definition cursor.
 *
 * \param cursor The cursor to query.
 *
 * \returns A non-context-sensitive completion string for declaration and macro
 * definition cursors, or NULL for other kinds of cursors.
  }
function clang_getCursorCompletionString(cursor:TCXCursor):TCXCompletionString;cdecl;external libgclang;
{*
 * Contains the results of code-completion.
 *
 * This data structure contains the results of code completion, as
 * produced by \c clang_codeCompleteAt(). Its contents must be freed by
 * \c clang_disposeCodeCompleteResults.
  }
{*
   * The code-completion results.
    }
{*
   * The number of code-completion results stored in the
   * \c Results array.
    }
type
  PCXCodeCompleteResults = ^TCXCodeCompleteResults;
  TCXCodeCompleteResults = record
      Results : PCXCompletionResult;
      NumResults : dword;
    end;
{*
 * Retrieve the number of fix-its for the given completion index.
 *
 * Calling this makes sense only if CXCodeComplete_IncludeCompletionsWithFixIts
 * option was set.
 *
 * \param results The structure keeping all completion results
 *
 * \param completion_index The index of the completion
 *
 * \return The number of fix-its which must be applied before the completion at
 * completion_index can be applied
  }

function clang_getCompletionNumFixIts(results:PCXCodeCompleteResults; completion_index:dword):dword;cdecl;external libgclang;
{*
 * Fix-its that *must* be applied before inserting the text for the
 * corresponding completion.
 *
 * By default, clang_codeCompleteAt() only returns completions with empty
 * fix-its. Extra completions with non-empty fix-its should be explicitly
 * requested by setting CXCodeComplete_IncludeCompletionsWithFixIts.
 *
 * For the clients to be able to compute position of the cursor after applying
 * fix-its, the following conditions are guaranteed to hold for
 * replacement_range of the stored fix-its:
 *  - Ranges in the fix-its are guaranteed to never contain the completion
 *  point (or identifier under completion point, if any) inside them, except
 *  at the start or at the end of the range.
 *  - If a fix-it range starts or ends with completion point (or starts or
 *  ends after the identifier under completion point), it will contain at
 *  least one character. It allows to unambiguously recompute completion
 *  point after applying the fix-it.
 *
 * The intuition is that provided fix-its change code around the identifier we
 * complete, but are not allowed to touch the identifier itself or the
 * completion point. One example of completions with corrections are the ones
 * replacing '.' with '->' and vice versa:
 *
 * std::unique_ptr<std::vector<int>> vec_ptr;
 * In 'vec_ptr.^', one of the completions is 'push_back', it requires
 * replacing '.' with '->'.
 * In 'vec_ptr->^', one of the completions is 'release', it requires
 * replacing '->' with '.'.
 *
 * \param results The structure keeping all completion results
 *
 * \param completion_index The index of the completion
 *
 * \param fixit_index The index of the fix-it for the completion at
 * completion_index
 *
 * \param replacement_range The fix-it range that must be replaced before the
 * completion at completion_index can be applied
 *
 * \returns The fix-it string that must replace the code at replacement_range
 * before the completion at completion_index can be applied
  }
function clang_getCompletionFixIt(results:PCXCodeCompleteResults; completion_index:dword; fixit_index:dword; replacement_range:PCXSourceRange):TCXString;cdecl;external libgclang;
{*
 * Flags that can be passed to \c clang_codeCompleteAt() to
 * modify its behavior.
 *
 * The enumerators in this enumeration can be bitwise-OR'd together to
 * provide multiple options to \c clang_codeCompleteAt().
  }
{*
   * Whether to include macros within the set of code
   * completions returned.
    }
{*
   * Whether to include code patterns for language constructs
   * within the set of code completions, e.g., for loops.
    }
{*
   * Whether to include brief documentation within the set of code
   * completions returned.
    }
{*
   * Whether to speed up completion by omitting top- or namespace-level entities
   * defined in the preamble. There's no guarantee any particular entity is
   * omitted. This may be useful if the headers are indexed externally.
    }
{*
   * Whether to include completions with small
   * fix-its, e.g. change '.' to '->' on member access, etc.
    }
type
  TCXCodeComplete_Flags =  Longint;
  Const
    CXCodeComplete_IncludeMacros = $01;
    CXCodeComplete_IncludeCodePatterns = $02;
    CXCodeComplete_IncludeBriefComments = $04;
    CXCodeComplete_SkipPreamble = $08;
    CXCodeComplete_IncludeCompletionsWithFixIts = $10;

{*
 * Bits that represent the context under which completion is occurring.
 *
 * The enumerators in this enumeration may be bitwise-OR'd together if multiple
 * contexts are occurring simultaneously.
  }
{*
   * The context for completions is unexposed, as only Clang results
   * should be included. (This is equivalent to having no context bits set.)
    }
{*
   * Completions for any possible type should be included in the results.
    }
{*
   * Completions for any possible value (variables, function calls, etc.)
   * should be included in the results.
    }
{*
   * Completions for values that resolve to an Objective-C object should
   * be included in the results.
    }
{*
   * Completions for values that resolve to an Objective-C selector
   * should be included in the results.
    }
{*
   * Completions for values that resolve to a C++ class type should be
   * included in the results.
    }
{*
   * Completions for fields of the member being accessed using the dot
   * operator should be included in the results.
    }
{*
   * Completions for fields of the member being accessed using the arrow
   * operator should be included in the results.
    }
{*
   * Completions for properties of the Objective-C object being accessed
   * using the dot operator should be included in the results.
    }
{*
   * Completions for enum tags should be included in the results.
    }
{*
   * Completions for union tags should be included in the results.
    }
{*
   * Completions for struct tags should be included in the results.
    }
{*
   * Completions for C++ class names should be included in the results.
    }
{*
   * Completions for C++ namespaces and namespace aliases should be
   * included in the results.
    }
{*
   * Completions for C++ nested name specifiers should be included in
   * the results.
    }
{*
   * Completions for Objective-C interfaces (classes) should be included
   * in the results.
    }
{*
   * Completions for Objective-C protocols should be included in
   * the results.
    }
{*
   * Completions for Objective-C categories should be included in
   * the results.
    }
{*
   * Completions for Objective-C instance messages should be included
   * in the results.
    }
{*
   * Completions for Objective-C class messages should be included in
   * the results.
    }
{*
   * Completions for Objective-C selector names should be included in
   * the results.
    }
{*
   * Completions for preprocessor macro names should be included in
   * the results.
    }
{*
   * Natural language completions should be included in the results.
    }
{*
   * #include file completions should be included in the results.
    }
{*
   * The current context is unknown, so set all contexts.
    }
type
  TCXCompletionContext =  Longint;
  Const
    CXCompletionContext_Unexposed = 0;
    CXCompletionContext_AnyType = 1 shl 0;
    CXCompletionContext_AnyValue = 1 shl 1;
    CXCompletionContext_ObjCObjectValue = 1 shl 2;
    CXCompletionContext_ObjCSelectorValue = 1 shl 3;
    CXCompletionContext_CXXClassTypeValue = 1 shl 4;
    CXCompletionContext_DotMemberAccess = 1 shl 5;
    CXCompletionContext_ArrowMemberAccess = 1 shl 6;
    CXCompletionContext_ObjCPropertyAccess = 1 shl 7;
    CXCompletionContext_EnumTag = 1 shl 8;
    CXCompletionContext_UnionTag = 1 shl 9;
    CXCompletionContext_StructTag = 1 shl 10;
    CXCompletionContext_ClassTag = 1 shl 11;
    CXCompletionContext_Namespace = 1 shl 12;
    CXCompletionContext_NestedNameSpecifier = 1 shl 13;
    CXCompletionContext_ObjCInterface = 1 shl 14;
    CXCompletionContext_ObjCProtocol = 1 shl 15;
    CXCompletionContext_ObjCCategory = 1 shl 16;
    CXCompletionContext_ObjCInstanceMessage = 1 shl 17;
    CXCompletionContext_ObjCClassMessage = 1 shl 18;
    CXCompletionContext_ObjCSelectorName = 1 shl 19;
    CXCompletionContext_MacroName = 1 shl 20;
    CXCompletionContext_NaturalLanguage = 1 shl 21;
    CXCompletionContext_IncludedFile = 1 shl 22;
    CXCompletionContext_Unknown = (1 shl 23)-1;

{*
 * Returns a default set of code-completion options that can be
 * passed to\c clang_codeCompleteAt().
  }

function clang_defaultCodeCompleteOptions:dword;cdecl;external libgclang;
{*
 * Perform code completion at a given location in a translation unit.
 *
 * This function performs code completion at a particular file, line, and
 * column within source code, providing results that suggest potential
 * code snippets based on the context of the completion. The basic model
 * for code completion is that Clang will parse a complete source file,
 * performing syntax checking up to the location where code-completion has
 * been requested. At that point, a special code-completion token is passed
 * to the parser, which recognizes this token and determines, based on the
 * current location in the C/Objective-C/C++ grammar and the state of
 * semantic analysis, what completions to provide. These completions are
 * returned via a new \c CXCodeCompleteResults structure.
 *
 * Code completion itself is meant to be triggered by the client when the
 * user types punctuation characters or whitespace, at which point the
 * code-completion location will coincide with the cursor. For example, if \c p
 * is a pointer, code-completion might be triggered after the "-" and then
 * after the ">" in \c p->. When the code-completion location is after the ">",
 * the completion results will provide, e.g., the members of the struct that
 * "p" points to. The client is responsible for placing the cursor at the
 * beginning of the token currently being typed, then filtering the results
 * based on the contents of the token. For example, when code-completing for
 * the expression \c p->get, the client should provide the location just after
 * the ">" (e.g., pointing at the "g") to this code-completion hook. Then, the
 * client can filter the results based on the current token text ("get"), only
 * showing those results that start with "get". The intent of this interface
 * is to separate the relatively high-latency acquisition of code-completion
 * results from the filtering of results on a per-character basis, which must
 * have a lower latency.
 *
 * \param TU The translation unit in which code-completion should
 * occur. The source files for this translation unit need not be
 * completely up-to-date (and the contents of those source files may
 * be overridden via \p unsaved_files). Cursors referring into the
 * translation unit may be invalidated by this invocation.
 *
 * \param complete_filename The name of the source file where code
 * completion should be performed. This filename may be any file
 * included in the translation unit.
 *
 * \param complete_line The line at which code-completion should occur.
 *
 * \param complete_column The column at which code-completion should occur.
 * Note that the column should point just after the syntactic construct that
 * initiated code completion, and not in the middle of a lexical token.
 *
 * \param unsaved_files the Files that have not yet been saved to disk
 * but may be required for parsing or code completion, including the
 * contents of those files.  The contents and name of these files (as
 * specified by CXUnsavedFile) are copied when necessary, so the
 * client only needs to guarantee their validity until the call to
 * this function returns.
 *
 * \param num_unsaved_files The number of unsaved file entries in \p
 * unsaved_files.
 *
 * \param options Extra options that control the behavior of code
 * completion, expressed as a bitwise OR of the enumerators of the
 * CXCodeComplete_Flags enumeration. The
 * \c clang_defaultCodeCompleteOptions() function returns a default set
 * of code-completion options.
 *
 * \returns If successful, a new \c CXCodeCompleteResults structure
 * containing code-completion results, which should eventually be
 * freed with \c clang_disposeCodeCompleteResults(). If code
 * completion fails, returns NULL.
  }
function clang_codeCompleteAt(TU:TCXTranslationUnit; complete_filename:Pchar; complete_line:dword; complete_column:dword; unsaved_files:PCXUnsavedFile; 
           num_unsaved_files:dword; options:dword):PCXCodeCompleteResults;cdecl;external libgclang;
{*
 * Sort the code-completion results in case-insensitive alphabetical
 * order.
 *
 * \param Results The set of results to sort.
 * \param NumResults The number of results in \p Results.
  }
procedure clang_sortCodeCompletionResults(Results:PCXCompletionResult; NumResults:dword);cdecl;external libgclang;
{*
 * Free the given set of code-completion results.
  }
procedure clang_disposeCodeCompleteResults(Results:PCXCodeCompleteResults);cdecl;external libgclang;
{*
 * Determine the number of diagnostics produced prior to the
 * location where code completion was performed.
  }
function clang_codeCompleteGetNumDiagnostics(Results:PCXCodeCompleteResults):dword;cdecl;external libgclang;
{*
 * Retrieve a diagnostic associated with the given code completion.
 *
 * \param Results the code completion results to query.
 * \param Index the zero-based diagnostic number to retrieve.
 *
 * \returns the requested diagnostic. This diagnostic must be freed
 * via a call to \c clang_disposeDiagnostic().
  }
function clang_codeCompleteGetDiagnostic(Results:PCXCodeCompleteResults; Index:dword):TCXDiagnostic;cdecl;external libgclang;
{*
 * Determines what completions are appropriate for the context
 * the given code completion.
 *
 * \param Results the code completion results to query
 *
 * \returns the kinds of completions that are appropriate for use
 * along with the given code completion results.
  }
function clang_codeCompleteGetContexts(Results:PCXCodeCompleteResults):qword;cdecl;external libgclang;
{*
 * Returns the cursor kind for the container for the current code
 * completion context. The container is only guaranteed to be set for
 * contexts where a container exists (i.e. member accesses or Objective-C
 * message sends); if there is not a container, this function will return
 * CXCursor_InvalidCode.
 *
 * \param Results the code completion results to query
 *
 * \param IsIncomplete on return, this value will be false if Clang has complete
 * information about the container. If Clang does not have complete
 * information, this value will be true.
 *
 * \returns the container kind, or CXCursor_InvalidCode if there is not a
 * container
  }
function clang_codeCompleteGetContainerKind(Results:PCXCodeCompleteResults; IsIncomplete:Pdword):TCXCursorKind;cdecl;external libgclang;
{*
 * Returns the USR for the container for the current code completion
 * context. If there is not a container for the current context, this
 * function will return the empty string.
 *
 * \param Results the code completion results to query
 *
 * \returns the USR for the container
  }
function clang_codeCompleteGetContainerUSR(Results:PCXCodeCompleteResults):TCXString;cdecl;external libgclang;
{*
 * Returns the currently-entered selector for an Objective-C message
 * send, formatted like "initWithFoo:bar:". Only guaranteed to return a
 * non-empty string for CXCompletionContext_ObjCInstanceMessage and
 * CXCompletionContext_ObjCClassMessage.
 *
 * \param Results the code completion results to query
 *
 * \returns the selector (or partial selector) that has been entered thus far
 * for an Objective-C message send.
  }
function clang_codeCompleteGetObjCSelector(Results:PCXCodeCompleteResults):TCXString;cdecl;external libgclang;
{*
 * @
  }
{*
 * \defgroup CINDEX_MISC Miscellaneous utility functions
 *
 * @
  }
{*
 * Return a version string, suitable for showing to a user, but not
 *        intended to be parsed (the format is not guaranteed to be stable).
  }
function clang_getClangVersion:TCXString;cdecl;external libgclang;
{*
 * Enable/disable crash recovery.
 *
 * \param isEnabled Flag to indicate if crash recovery is enabled.  A non-zero
 *        value enables crash recovery, while 0 disables it.
  }
procedure clang_toggleCrashRecovery(isEnabled:dword);cdecl;external libgclang;
{*
 * Visitor invoked for each file in a translation unit
 *        (used with clang_getInclusions()).
 *
 * This visitor function will be invoked by clang_getInclusions() for each
 * file included (either at the top-level or by \#include directives) within
 * a translation unit.  The first argument is the file being included, and
 * the second and third arguments provide the inclusion stack.  The
 * array is sorted in order of immediate inclusion.  For example,
 * the first element refers to the location that included 'included_file'.
  }
type

  TCXInclusionVisitor = procedure (included_file:TCXFile; inclusion_stack:PCXSourceLocation; include_len:dword; client_data:TCXClientData);cdecl;
{*
 * Visit the set of preprocessor inclusions in a translation unit.
 *   The visitor function is called with the provided data for every included
 *   file.  This does not include headers included by the PCH file (unless one
 *   is inspecting the inclusions in the PCH file itself).
  }

procedure clang_getInclusions(tu:TCXTranslationUnit; visitor:TCXInclusionVisitor; client_data:TCXClientData);cdecl;external libgclang;
type
  PCXEvalResultKind = ^TCXEvalResultKind;
  TCXEvalResultKind =  Longint;
  Const
    CXEval_Int = 1;
    CXEval_Float = 2;
    CXEval_ObjCStrLiteral = 3;
    CXEval_StrLiteral = 4;
    CXEval_CFStr = 5;
    CXEval_Other = 6;
    CXEval_UnExposed = 0;
;
{*
 * Evaluation result of a cursor
  }
type
  PCXEvalResult = ^TCXEvalResult;
  TCXEvalResult = pointer;
{*
 * If cursor is a statement declaration tries to evaluate the
 * statement and if its variable, tries to evaluate its initializer,
 * into its corresponding type.
 * If it's an expression, tries to evaluate the expression.
  }

function clang_Cursor_Evaluate(C:TCXCursor):TCXEvalResult;cdecl;external libgclang;
{*
 * Returns the kind of the evaluated result.
  }
function clang_EvalResult_getKind(E:TCXEvalResult):TCXEvalResultKind;cdecl;external libgclang;
{*
 * Returns the evaluation result as integer if the
 * kind is Int.
  }
function clang_EvalResult_getAsInt(E:TCXEvalResult):longint;cdecl;external libgclang;
{*
 * Returns the evaluation result as a long long integer if the
 * kind is Int. This prevents overflows that may happen if the result is
 * returned with clang_EvalResult_getAsInt.
  }
function clang_EvalResult_getAsLongLong(E:TCXEvalResult):int64;cdecl;external libgclang;
{*
 * Returns a non-zero value if the kind is Int and the evaluation
 * result resulted in an unsigned integer.
  }
function clang_EvalResult_isUnsignedInt(E:TCXEvalResult):dword;cdecl;external libgclang;
{*
 * Returns the evaluation result as an unsigned integer if
 * the kind is Int and clang_EvalResult_isUnsignedInt is non-zero.
  }
function clang_EvalResult_getAsUnsigned(E:TCXEvalResult):qword;cdecl;external libgclang;
{*
 * Returns the evaluation result as double if the
 * kind is double.
  }
function clang_EvalResult_getAsDouble(E:TCXEvalResult):Tdouble;cdecl;external libgclang;
{*
 * Returns the evaluation result as a constant string if the
 * kind is other than Int or float. User must not free this pointer,
 * instead call clang_EvalResult_dispose on the CXEvalResult returned
 * by clang_Cursor_Evaluate.
  }
function clang_EvalResult_getAsStr(E:TCXEvalResult):Pchar;cdecl;external libgclang;
{*
 * Disposes the created Eval memory.
  }
procedure clang_EvalResult_dispose(E:TCXEvalResult);cdecl;external libgclang;
{*
 * @
  }
{* \defgroup CINDEX_REMAPPING Remapping functions
 *
 * @
  }
{*
 * A remapping of original source files and their translated files.
  }
type
  PCXRemapping = ^TCXRemapping;
  TCXRemapping = pointer;
{*
 * Retrieve a remapping.
 *
 * \param path the path that contains metadata about remappings.
 *
 * \returns the requested remapping. This remapping must be freed
 * via a call to \c clang_remap_dispose(). Can return NULL if an error occurred.
  }

function clang_getRemappings(path:Pchar):TCXRemapping;cdecl;external libgclang;
{*
 * Retrieve a remapping.
 *
 * \param filePaths pointer to an array of file paths containing remapping info.
 *
 * \param numFiles number of file paths.
 *
 * \returns the requested remapping. This remapping must be freed
 * via a call to \c clang_remap_dispose(). Can return NULL if an error occurred.
  }
function clang_getRemappingsFromFileList(filePaths:PPchar; numFiles:dword):TCXRemapping;cdecl;external libgclang;
{*
 * Determine the number of remappings.
  }
function clang_remap_getNumFiles(para1:TCXRemapping):dword;cdecl;external libgclang;
{*
 * Get the original and the associated filename from the remapping.
 *
 * \param original If non-NULL, will be set to the original filename.
 *
 * \param transformed If non-NULL, will be set to the filename that the original
 * is associated with.
  }
procedure clang_remap_getFilenames(para1:TCXRemapping; index:dword; original:PCXString; transformed:PCXString);cdecl;external libgclang;
{*
 * Dispose the remapping.
  }
procedure clang_remap_dispose(para1:TCXRemapping);cdecl;external libgclang;
{*
 * @
  }
{* \defgroup CINDEX_HIGH Higher level API functions
 *
 * @
  }
type
  TCXVisitorResult =  Longint;
  Const
    CXVisit_Break = 0;
    CXVisit_Continue = 1;

type
  PCXCursorAndRangeVisitor = ^TCXCursorAndRangeVisitor;
  TCXCursorAndRangeVisitor = record
      context : pointer;
      visit : function (context:pointer; para2:TCXCursor; para3:TCXSourceRange):TCXVisitorResult;cdecl;
    end;
{*
   * Function returned successfully.
    }
{*
   * One of the parameters was invalid for the function.
    }
{*
   * The function was terminated by a callback (e.g. it returned
   * CXVisit_Break)
    }

  PCXResult = ^TCXResult;
  TCXResult =  Longint;
  Const
    CXResult_Success = 0;
    CXResult_Invalid = 1;
    CXResult_VisitBreak = 2;
;
{*
 * Find references of a declaration in a specific file.
 *
 * \param cursor pointing to a declaration or a reference of one.
 *
 * \param file to search for references.
 *
 * \param visitor callback that will receive pairs of CXCursor/CXSourceRange for
 * each reference found.
 * The CXSourceRange will point inside the file; if the reference is inside
 * a macro (and not a macro argument) the CXSourceRange will be invalid.
 *
 * \returns one of the CXResult enumerators.
  }

function clang_findReferencesInFile(cursor:TCXCursor; file:TCXFile; visitor:TCXCursorAndRangeVisitor):TCXResult;cdecl;external libgclang;
{*
 * Find #import/#include directives in a specific file.
 *
 * \param TU translation unit containing the file to query.
 *
 * \param file to search for #import/#include directives.
 *
 * \param visitor callback that will receive pairs of CXCursor/CXSourceRange for
 * each directive found.
 *
 * \returns one of the CXResult enumerators.
  }
function clang_findIncludesInFile(TU:TCXTranslationUnit; file:TCXFile; visitor:TCXCursorAndRangeVisitor):TCXResult;cdecl;external libgclang;
type
  PCXCursorAndRangeVisitorBlock = ^TCXCursorAndRangeVisitorBlock;
  TCXCursorAndRangeVisitorBlock = PCXCursorAndRangeVisitorBlock;

function clang_findReferencesInFileWithBlock(para1:TCXCursor; para2:TCXFile; para3:TCXCursorAndRangeVisitorBlock):TCXResult;cdecl;external libgclang;
function clang_findIncludesInFileWithBlock(para1:TCXTranslationUnit; para2:TCXFile; para3:TCXCursorAndRangeVisitorBlock):TCXResult;cdecl;external libgclang;
{*
 * The client's data object that is associated with a CXFile.
  }
type
  PCXIdxClientFile = ^TCXIdxClientFile;
  TCXIdxClientFile = pointer;
{*
 * The client's data object that is associated with a semantic entity.
  }

  PCXIdxClientEntity = ^TCXIdxClientEntity;
  TCXIdxClientEntity = pointer;
{*
 * The client's data object that is associated with a semantic container
 * of entities.
  }

  PCXIdxClientContainer = ^TCXIdxClientContainer;
  TCXIdxClientContainer = pointer;
{*
 * The client's data object that is associated with an AST file (PCH
 * or module).
  }

  PCXIdxClientASTFile = ^TCXIdxClientASTFile;
  TCXIdxClientASTFile = pointer;
{*
 * Source location passed to index callbacks.
  }

  PCXIdxLoc = ^TCXIdxLoc;
  TCXIdxLoc = record
      ptr_data : array[0..1] of pointer;
      int_data : dword;
    end;
{*
 * Data for ppIncludedFile callback.
  }
{*
   * Location of '#' in the \#include/\#import directive.
    }
{*
   * Filename as written in the \#include/\#import directive.
    }
{*
   * The actual file that the \#include/\#import directive resolved to.
    }
{*
   * Non-zero if the directive was automatically turned into a module
   * import.
    }

  PCXIdxIncludedFileInfo = ^TCXIdxIncludedFileInfo;
  TCXIdxIncludedFileInfo = record
      hashLoc : TCXIdxLoc;
      filename : Pchar;
      file : TCXFile;
      isImport : longint;
      isAngled : longint;
      isModuleImport : longint;
    end;
{*
 * Data for IndexerCallbacks#importedASTFile.
  }
{*
   * Top level AST file containing the imported PCH, module or submodule.
    }
{*
   * The imported module or NULL if the AST file is a PCH.
    }
{*
   * Location where the file is imported. Applicable only for modules.
    }
{*
   * Non-zero if an inclusion directive was automatically turned into
   * a module import. Applicable only for modules.
    }

  PCXIdxImportedASTFileInfo = ^TCXIdxImportedASTFileInfo;
  TCXIdxImportedASTFileInfo = record
      file : TCXFile;
      module : TCXModule;
      loc : TCXIdxLoc;
      isImplicit : longint;
    end;

  PCXIdxEntityKind = ^TCXIdxEntityKind;
  TCXIdxEntityKind =  Longint;
  Const
    CXIdxEntity_Unexposed = 0;
    CXIdxEntity_Typedef = 1;
    CXIdxEntity_Function = 2;
    CXIdxEntity_Variable = 3;
    CXIdxEntity_Field = 4;
    CXIdxEntity_EnumConstant = 5;
    CXIdxEntity_ObjCClass = 6;
    CXIdxEntity_ObjCProtocol = 7;
    CXIdxEntity_ObjCCategory = 8;
    CXIdxEntity_ObjCInstanceMethod = 9;
    CXIdxEntity_ObjCClassMethod = 10;
    CXIdxEntity_ObjCProperty = 11;
    CXIdxEntity_ObjCIvar = 12;
    CXIdxEntity_Enum = 13;
    CXIdxEntity_Struct = 14;
    CXIdxEntity_Union = 15;
    CXIdxEntity_CXXClass = 16;
    CXIdxEntity_CXXNamespace = 17;
    CXIdxEntity_CXXNamespaceAlias = 18;
    CXIdxEntity_CXXStaticVariable = 19;
    CXIdxEntity_CXXStaticMethod = 20;
    CXIdxEntity_CXXInstanceMethod = 21;
    CXIdxEntity_CXXConstructor = 22;
    CXIdxEntity_CXXDestructor = 23;
    CXIdxEntity_CXXConversionFunction = 24;
    CXIdxEntity_CXXTypeAlias = 25;
    CXIdxEntity_CXXInterface = 26;
    CXIdxEntity_CXXConcept = 27;
;
type
  PCXIdxEntityLanguage = ^TCXIdxEntityLanguage;
  TCXIdxEntityLanguage =  Longint;
  Const
    CXIdxEntityLang_None = 0;
    CXIdxEntityLang_C = 1;
    CXIdxEntityLang_ObjC = 2;
    CXIdxEntityLang_CXX = 3;
    CXIdxEntityLang_Swift = 4;
;
{*
 * Extra C++ template information for an entity. This can apply to:
 * CXIdxEntity_Function
 * CXIdxEntity_CXXClass
 * CXIdxEntity_CXXStaticMethod
 * CXIdxEntity_CXXInstanceMethod
 * CXIdxEntity_CXXConstructor
 * CXIdxEntity_CXXConversionFunction
 * CXIdxEntity_CXXTypeAlias
  }
type
  PCXIdxEntityCXXTemplateKind = ^TCXIdxEntityCXXTemplateKind;
  TCXIdxEntityCXXTemplateKind =  Longint;
  Const
    CXIdxEntity_NonTemplate = 0;
    CXIdxEntity_Template = 1;
    CXIdxEntity_TemplatePartialSpecialization = 2;
    CXIdxEntity_TemplateSpecialization = 3;
;
type
  PCXIdxAttrKind = ^TCXIdxAttrKind;
  TCXIdxAttrKind =  Longint;
  Const
    CXIdxAttr_Unexposed = 0;
    CXIdxAttr_IBAction = 1;
    CXIdxAttr_IBOutlet = 2;
    CXIdxAttr_IBOutletCollection = 3;
;
type
  PCXIdxAttrInfo = ^TCXIdxAttrInfo;
  TCXIdxAttrInfo = record
      kind : TCXIdxAttrKind;
      cursor : TCXCursor;
      loc : TCXIdxLoc;
    end;

  PCXIdxEntityInfo = ^TCXIdxEntityInfo;
  TCXIdxEntityInfo = record
      kind : TCXIdxEntityKind;
      templateKind : TCXIdxEntityCXXTemplateKind;
      lang : TCXIdxEntityLanguage;
      name : Pchar;
      USR : Pchar;
      cursor : TCXCursor;
      attributes : ^PCXIdxAttrInfo;
      numAttributes : dword;
    end;

  PCXIdxContainerInfo = ^TCXIdxContainerInfo;
  TCXIdxContainerInfo = record
      cursor : TCXCursor;
    end;

  PCXIdxIBOutletCollectionAttrInfo = ^TCXIdxIBOutletCollectionAttrInfo;
  TCXIdxIBOutletCollectionAttrInfo = record
      attrInfo : PCXIdxAttrInfo;
      objcClass : PCXIdxEntityInfo;
      classCursor : TCXCursor;
      classLoc : TCXIdxLoc;
    end;

  PCXIdxDeclInfoFlags = ^TCXIdxDeclInfoFlags;
  TCXIdxDeclInfoFlags =  Longint;
  Const
    CXIdxDeclFlag_Skipped = $1;
;
{*
   * Generally same as #semanticContainer but can be different in
   * cases like out-of-line C++ member functions.
    }
{*
   * Whether the declaration exists in code or was created implicitly
   * by the compiler, e.g. implicit Objective-C methods for properties.
    }
type
  PCXIdxDeclInfo = ^TCXIdxDeclInfo;
  TCXIdxDeclInfo = record
      entityInfo : PCXIdxEntityInfo;
      cursor : TCXCursor;
      loc : TCXIdxLoc;
      semanticContainer : PCXIdxContainerInfo;
      lexicalContainer : PCXIdxContainerInfo;
      isRedeclaration : longint;
      isDefinition : longint;
      isContainer : longint;
      declAsContainer : PCXIdxContainerInfo;
      isImplicit : longint;
      attributes : ^PCXIdxAttrInfo;
      numAttributes : dword;
      flags : dword;
    end;

  PCXIdxObjCContainerKind = ^TCXIdxObjCContainerKind;
  TCXIdxObjCContainerKind =  Longint;
  Const
    CXIdxObjCContainer_ForwardRef = 0;
    CXIdxObjCContainer_Interface = 1;
    CXIdxObjCContainer_Implementation = 2;
;
type
  PCXIdxObjCContainerDeclInfo = ^TCXIdxObjCContainerDeclInfo;
  TCXIdxObjCContainerDeclInfo = record
      declInfo : PCXIdxDeclInfo;
      kind : TCXIdxObjCContainerKind;
    end;

  PCXIdxBaseClassInfo = ^TCXIdxBaseClassInfo;
  TCXIdxBaseClassInfo = record
      base : PCXIdxEntityInfo;
      cursor : TCXCursor;
      loc : TCXIdxLoc;
    end;

  PCXIdxObjCProtocolRefInfo = ^TCXIdxObjCProtocolRefInfo;
  TCXIdxObjCProtocolRefInfo = record
      protocol : PCXIdxEntityInfo;
      cursor : TCXCursor;
      loc : TCXIdxLoc;
    end;

  PCXIdxObjCProtocolRefListInfo = ^TCXIdxObjCProtocolRefListInfo;
  TCXIdxObjCProtocolRefListInfo = record
      protocols : ^PCXIdxObjCProtocolRefInfo;
      numProtocols : dword;
    end;

  PCXIdxObjCInterfaceDeclInfo = ^TCXIdxObjCInterfaceDeclInfo;
  TCXIdxObjCInterfaceDeclInfo = record
      containerInfo : PCXIdxObjCContainerDeclInfo;
      superInfo : PCXIdxBaseClassInfo;
      protocols : PCXIdxObjCProtocolRefListInfo;
    end;

  PCXIdxObjCCategoryDeclInfo = ^TCXIdxObjCCategoryDeclInfo;
  TCXIdxObjCCategoryDeclInfo = record
      containerInfo : PCXIdxObjCContainerDeclInfo;
      objcClass : PCXIdxEntityInfo;
      classCursor : TCXCursor;
      classLoc : TCXIdxLoc;
      protocols : PCXIdxObjCProtocolRefListInfo;
    end;

  PCXIdxObjCPropertyDeclInfo = ^TCXIdxObjCPropertyDeclInfo;
  TCXIdxObjCPropertyDeclInfo = record
      declInfo : PCXIdxDeclInfo;
      getter : PCXIdxEntityInfo;
      setter : PCXIdxEntityInfo;
    end;

  PCXIdxCXXClassDeclInfo = ^TCXIdxCXXClassDeclInfo;
  TCXIdxCXXClassDeclInfo = record
      declInfo : PCXIdxDeclInfo;
      bases : ^PCXIdxBaseClassInfo;
      numBases : dword;
    end;
{*
 * Data for IndexerCallbacks#indexEntityReference.
 *
 * This may be deprecated in a future version as this duplicates
 * the \c CXSymbolRole_Implicit bit in \c CXSymbolRole.
  }
{*
   * The entity is referenced directly in user's code.
    }
{*
   * An implicit reference, e.g. a reference of an Objective-C method
   * via the dot syntax.
    }

  PCXIdxEntityRefKind = ^TCXIdxEntityRefKind;
  TCXIdxEntityRefKind =  Longint;
  Const
    CXIdxEntityRef_Direct = 1;
    CXIdxEntityRef_Implicit = 2;
;
{*
 * Roles that are attributed to symbol occurrences.
 *
 * Internal: this currently mirrors low 9 bits of clang::index::SymbolRole with
 * higher bits zeroed. These high bits may be exposed in the future.
  }
type
  PCXSymbolRole = ^TCXSymbolRole;
  TCXSymbolRole =  Longint;
  Const
    CXSymbolRole_None = 0;
    CXSymbolRole_Declaration = 1 shl 0;
    CXSymbolRole_Definition = 1 shl 1;
    CXSymbolRole_Reference = 1 shl 2;
    CXSymbolRole_Read = 1 shl 3;
    CXSymbolRole_Write = 1 shl 4;
    CXSymbolRole_Call = 1 shl 5;
    CXSymbolRole_Dynamic = 1 shl 6;
    CXSymbolRole_AddressOf = 1 shl 7;
    CXSymbolRole_Implicit = 1 shl 8;
;
{*
 * Data for IndexerCallbacks#indexEntityReference.
  }
{*
   * Reference cursor.
    }
{*
   * The entity that gets referenced.
    }
{*
   * Immediate "parent" of the reference. For example:
   *
   * \code
   * Foo *var;
   * \endcode
   *
   * The parent of reference of type 'Foo' is the variable 'var'.
   * For references inside statement bodies of functions/methods,
   * the parentEntity will be the function/method.
    }
{*
   * Lexical container context of the reference.
    }
{*
   * Sets of symbol roles of the reference.
    }
type
  PCXIdxEntityRefInfo = ^TCXIdxEntityRefInfo;
  TCXIdxEntityRefInfo = record
      kind : TCXIdxEntityRefKind;
      cursor : TCXCursor;
      loc : TCXIdxLoc;
      referencedEntity : PCXIdxEntityInfo;
      parentEntity : PCXIdxEntityInfo;
      container : PCXIdxContainerInfo;
      role : TCXSymbolRole;
    end;
{*
 * A group of callbacks used by #clang_indexSourceFile and
 * #clang_indexTranslationUnit.
  }
{*
   * Called periodically to check whether indexing should be aborted.
   * Should return 0 to continue, and non-zero to abort.
    }
{*
   * Called at the end of indexing; passes the complete diagnostic set.
    }
{*
   * Called when a file gets \#included/\#imported.
    }
{*
   * Called when a AST file (PCH or module) gets imported.
   *
   * AST files will not get indexed (there will not be callbacks to index all
   * the entities in an AST file). The recommended action is that, if the AST
   * file is not already indexed, to initiate a new indexing job specific to
   * the AST file.
    }
{*
   * Called at the beginning of indexing a translation unit.
    }
{*
   * Called to index a reference of an entity.
    }

  PIndexerCallbacks = ^TIndexerCallbacks;
  TIndexerCallbacks = record
      abortQuery : function (client_data:TCXClientData; reserved:pointer):longint;cdecl;
      diagnostic : procedure (client_data:TCXClientData; para2:TCXDiagnosticSet; reserved:pointer);cdecl;
      enteredMainFile : function (client_data:TCXClientData; mainFile:TCXFile; reserved:pointer):TCXIdxClientFile;cdecl;
      ppIncludedFile : function (client_data:TCXClientData; para2:PCXIdxIncludedFileInfo):TCXIdxClientFile;cdecl;
      importedASTFile : function (client_data:TCXClientData; para2:PCXIdxImportedASTFileInfo):TCXIdxClientASTFile;cdecl;
      startedTranslationUnit : function (client_data:TCXClientData; reserved:pointer):TCXIdxClientContainer;cdecl;
      indexDeclaration : procedure (client_data:TCXClientData; para2:PCXIdxDeclInfo);cdecl;
      indexEntityReference : procedure (client_data:TCXClientData; para2:PCXIdxEntityRefInfo);cdecl;
    end;

function clang_index_isEntityObjCContainerKind(para1:TCXIdxEntityKind):longint;cdecl;external libgclang;
function clang_index_getObjCContainerDeclInfo(para1:PCXIdxDeclInfo):PCXIdxObjCContainerDeclInfo;cdecl;external libgclang;
function clang_index_getObjCInterfaceDeclInfo(para1:PCXIdxDeclInfo):PCXIdxObjCInterfaceDeclInfo;cdecl;external libgclang;
function clang_index_getObjCCategoryDeclInfo(para1:PCXIdxDeclInfo):PCXIdxObjCCategoryDeclInfo;cdecl;external libgclang;
function clang_index_getObjCProtocolRefListInfo(para1:PCXIdxDeclInfo):PCXIdxObjCProtocolRefListInfo;cdecl;external libgclang;
function clang_index_getObjCPropertyDeclInfo(para1:PCXIdxDeclInfo):PCXIdxObjCPropertyDeclInfo;cdecl;external libgclang;
function clang_index_getIBOutletCollectionAttrInfo(para1:PCXIdxAttrInfo):PCXIdxIBOutletCollectionAttrInfo;cdecl;external libgclang;
function clang_index_getCXXClassDeclInfo(para1:PCXIdxDeclInfo):PCXIdxCXXClassDeclInfo;cdecl;external libgclang;
{*
 * For retrieving a custom CXIdxClientContainer attached to a
 * container.
  }
function clang_index_getClientContainer(para1:PCXIdxContainerInfo):TCXIdxClientContainer;cdecl;external libgclang;
{*
 * For setting a custom CXIdxClientContainer attached to a
 * container.
  }
procedure clang_index_setClientContainer(para1:PCXIdxContainerInfo; para2:TCXIdxClientContainer);cdecl;external libgclang;
{*
 * For retrieving a custom CXIdxClientEntity attached to an entity.
  }
function clang_index_getClientEntity(para1:PCXIdxEntityInfo):TCXIdxClientEntity;cdecl;external libgclang;
{*
 * For setting a custom CXIdxClientEntity attached to an entity.
  }
procedure clang_index_setClientEntity(para1:PCXIdxEntityInfo; para2:TCXIdxClientEntity);cdecl;external libgclang;
{*
 * An indexing action/session, to be applied to one or multiple
 * translation units.
  }
type
  PCXIndexAction = ^TCXIndexAction;
  TCXIndexAction = pointer;
{*
 * An indexing action/session, to be applied to one or multiple
 * translation units.
 *
 * \param CIdx The index object with which the index action will be associated.
  }

function clang_IndexAction_create(CIdx:TCXIndex):TCXIndexAction;cdecl;external libgclang;
{*
 * Destroy the given index action.
 *
 * The index action must not be destroyed until all of the translation units
 * created within that index action have been destroyed.
  }
procedure clang_IndexAction_dispose(para1:TCXIndexAction);cdecl;external libgclang;
{*
   * Used to indicate that no special indexing options are needed.
    }
{*
   * Used to indicate that IndexerCallbacks#indexEntityReference should
   * be invoked for only one reference of an entity per source file that does
   * not also include a declaration/definition of the entity.
    }
{*
   * Function-local symbols should be indexed. If this is not set
   * function-local symbols will be ignored.
    }
{*
   * Implicit function/class template instantiations should be indexed.
   * If this is not set, implicit instantiations will be ignored.
    }
{*
   * Suppress all compiler warnings when parsing for indexing.
    }
{*
   * Skip a function/method body that was already parsed during an
   * indexing session associated with a \c CXIndexAction object.
   * Bodies in system headers are always skipped.
    }
type
  PCXIndexOptFlags = ^TCXIndexOptFlags;
  TCXIndexOptFlags =  Longint;
  Const
    CXIndexOpt_None = $0;
    CXIndexOpt_SuppressRedundantRefs = $1;
    CXIndexOpt_IndexFunctionLocalSymbols = $2;
    CXIndexOpt_IndexImplicitTemplateInstantiations = $4;
    CXIndexOpt_SuppressWarnings = $8;
    CXIndexOpt_SkipParsedBodiesInSession = $10;
;
{*
 * Index the given source file and the translation unit corresponding
 * to that file via callbacks implemented through #IndexerCallbacks.
 *
 * \param client_data pointer data supplied by the client, which will
 * be passed to the invoked callbacks.
 *
 * \param index_callbacks Pointer to indexing callbacks that the client
 * implements.
 *
 * \param index_callbacks_size Size of #IndexerCallbacks structure that gets
 * passed in index_callbacks.
 *
 * \param index_options A bitmask of options that affects how indexing is
 * performed. This should be a bitwise OR of the CXIndexOpt_XXX flags.
 *
 * \param[out] out_TU pointer to store a \c CXTranslationUnit that can be
 * reused after indexing is finished. Set to \c NULL if you do not require it.
 *
 * \returns 0 on success or if there were errors from which the compiler could
 * recover.  If there is a failure from which there is no recovery, returns
 * a non-zero \c CXErrorCode.
 *
 * The rest of the parameters are the same as #clang_parseTranslationUnit.
  }

function clang_indexSourceFile(para1:TCXIndexAction; client_data:TCXClientData; index_callbacks:PIndexerCallbacks; index_callbacks_size:dword; index_options:dword; 
           source_filename:Pchar; command_line_args:PPchar; num_command_line_args:longint; unsaved_files:PCXUnsavedFile; num_unsaved_files:dword; 
           out_TU:PCXTranslationUnit; TU_options:dword):longint;cdecl;external libgclang;
{*
 * Same as clang_indexSourceFile but requires a full command line
 * for \c command_line_args including argv[0]. This is useful if the standard
 * library paths are relative to the binary.
  }
function clang_indexSourceFileFullArgv(para1:TCXIndexAction; client_data:TCXClientData; index_callbacks:PIndexerCallbacks; index_callbacks_size:dword; index_options:dword; 
           source_filename:Pchar; command_line_args:PPchar; num_command_line_args:longint; unsaved_files:PCXUnsavedFile; num_unsaved_files:dword; 
           out_TU:PCXTranslationUnit; TU_options:dword):longint;cdecl;external libgclang;
{*
 * Index the given translation unit via callbacks implemented through
 * #IndexerCallbacks.
 *
 * The order of callback invocations is not guaranteed to be the same as
 * when indexing a source file. The high level order will be:
 *
 *   -Preprocessor callbacks invocations
 *   -Declaration/reference callbacks invocations
 *   -Diagnostic callback invocations
 *
 * The parameters are the same as #clang_indexSourceFile.
 *
 * \returns If there is a failure from which there is no recovery, returns
 * non-zero, otherwise returns 0.
  }
function clang_indexTranslationUnit(para1:TCXIndexAction; client_data:TCXClientData; index_callbacks:PIndexerCallbacks; index_callbacks_size:dword; index_options:dword; 
           para6:TCXTranslationUnit):longint;cdecl;external libgclang;
{*
 * Retrieve the CXIdxFile, file, line, column, and offset represented by
 * the given CXIdxLoc.
 *
 * If the location refers into a macro expansion, retrieves the
 * location of the macro expansion and if it refers into a macro argument
 * retrieves the location of the argument.
  }
procedure clang_indexLoc_getFileLocation(loc:TCXIdxLoc; indexFile:PCXIdxClientFile; file:PCXFile; line:Pdword; column:Pdword; 
            offset:Pdword);cdecl;external libgclang;
{*
 * Retrieve the CXSourceLocation represented by the given CXIdxLoc.
  }
function clang_indexLoc_getCXSourceLocation(loc:TCXIdxLoc):TCXSourceLocation;cdecl;external libgclang;
{*
 * Visitor invoked for each field found by a traversal.
 *
 * This visitor function will be invoked for each field found by
 * \c clang_Type_visitFields. Its first argument is the cursor being
 * visited, its second argument is the client data provided to
 * \c clang_Type_visitFields.
 *
 * The visitor should return one of the \c CXVisitorResult values
 * to direct \c clang_Type_visitFields.
  }
type

  TCXFieldVisitor = function (C:TCXCursor; client_data:TCXClientData):TCXVisitorResult;cdecl;
{*
 * Visit the fields of a particular type.
 *
 * This function visits all the direct fields of the given cursor,
 * invoking the given \p visitor function with the cursors of each
 * visited field. The traversal may be ended prematurely, if
 * the visitor returns \c CXFieldVisit_Break.
 *
 * \param T the record type whose field may be visited.
 *
 * \param visitor the visitor function that will be invoked for each
 * field of \p T.
 *
 * \param client_data pointer data supplied by the client, which will
 * be passed to the visitor each time it is invoked.
 *
 * \returns a non-zero value if the traversal was terminated
 * prematurely by the visitor returning \c CXFieldVisit_Break.
  }

function clang_Type_visitFields(T:TCXType; visitor:TCXFieldVisitor; client_data:TCXClientData):dword;cdecl;external libgclang;
{*
 * Visit the base classes of a type.
 *
 * This function visits all the direct base classes of a the given cursor,
 * invoking the given \p visitor function with the cursors of each
 * visited base. The traversal may be ended prematurely, if
 * the visitor returns \c CXFieldVisit_Break.
 *
 * \param T the record type whose field may be visited.
 *
 * \param visitor the visitor function that will be invoked for each
 * field of \p T.
 *
 * \param client_data pointer data supplied by the client, which will
 * be passed to the visitor each time it is invoked.
 *
 * \returns a non-zero value if the traversal was terminated
 * prematurely by the visitor returning \c CXFieldVisit_Break.
  }
function clang_visitCXXBaseClasses(T:TCXType; visitor:TCXFieldVisitor; client_data:TCXClientData):dword;cdecl;external libgclang;
{*
 * Describes the kind of binary operators.
  }
{* This value describes cursors which are not binary operators.  }
{* C++ Pointer - to - member operator.  }
{* C++ Pointer - to - member operator.  }
{* Multiplication operator.  }
{* Division operator.  }
{* Remainder operator.  }
{* Addition operator.  }
{* Subtraction operator.  }
{* Bitwise shift left operator.  }
{* Bitwise shift right operator.  }
{* C++ three-way comparison (spaceship) operator.  }
{* Less than operator.  }
{* Greater than operator.  }
{* Less or equal operator.  }
{* Greater or equal operator.  }
{* Equal operator.  }
{* Not equal operator.  }
{* Bitwise AND operator.  }
{* Bitwise XOR operator.  }
{* Bitwise OR operator.  }
{* Logical AND operator.  }
{* Logical OR operator.  }
{* Assignment operator.  }
{* Multiplication assignment operator.  }
{* Division assignment operator.  }
{* Remainder assignment operator.  }
{* Addition assignment operator.  }
{* Subtraction assignment operator.  }
{* Bitwise shift left assignment operator.  }
{* Bitwise shift right assignment operator.  }
{* Bitwise AND assignment operator.  }
{* Bitwise XOR assignment operator.  }
{* Bitwise OR assignment operator.  }
{* Comma operator.  }
type
  TCXBinaryOperatorKind =  Longint;
  Const
    CXBinaryOperator_Invalid = 0;
    CXBinaryOperator_PtrMemD = 1;
    CXBinaryOperator_PtrMemI = 2;
    CXBinaryOperator_Mul = 3;
    CXBinaryOperator_Div = 4;
    CXBinaryOperator_Rem = 5;
    CXBinaryOperator_Add = 6;
    CXBinaryOperator_Sub = 7;
    CXBinaryOperator_Shl = 8;
    CXBinaryOperator_Shr = 9;
    CXBinaryOperator_Cmp = 10;
    CXBinaryOperator_LT = 11;
    CXBinaryOperator_GT = 12;
    CXBinaryOperator_LE = 13;
    CXBinaryOperator_GE = 14;
    CXBinaryOperator_EQ = 15;
    CXBinaryOperator_NE = 16;
    CXBinaryOperator_And = 17;
    CXBinaryOperator_Xor = 18;
    CXBinaryOperator_Or = 19;
    CXBinaryOperator_LAnd = 20;
    CXBinaryOperator_LOr = 21;
    CXBinaryOperator_Assign = 22;
    CXBinaryOperator_MulAssign = 23;
    CXBinaryOperator_DivAssign = 24;
    CXBinaryOperator_RemAssign = 25;
    CXBinaryOperator_AddAssign = 26;
    CXBinaryOperator_SubAssign = 27;
    CXBinaryOperator_ShlAssign = 28;
    CXBinaryOperator_ShrAssign = 29;
    CXBinaryOperator_AndAssign = 30;
    CXBinaryOperator_XorAssign = 31;
    CXBinaryOperator_OrAssign = 32;
    CXBinaryOperator_Comma = 33;

{*
 * Retrieve the spelling of a given CXBinaryOperatorKind.
  }

function clang_getBinaryOperatorKindSpelling(kind:TCXBinaryOperatorKind):TCXString;cdecl;external libgclang;
{*
 * Retrieve the binary operator kind of this cursor.
 *
 * If this cursor is not a binary operator then returns Invalid.
  }
function clang_getCursorBinaryOperatorKind(cursor:TCXCursor):TCXBinaryOperatorKind;cdecl;external libgclang;
{*
 * Describes the kind of unary operators.
  }
{* This value describes cursors which are not unary operators.  }
{* Postfix increment operator.  }
{* Postfix decrement operator.  }
{* Prefix increment operator.  }
{* Prefix decrement operator.  }
{* Address of operator.  }
{* Dereference operator.  }
{* Plus operator.  }
{* Minus operator.  }
{* Not operator.  }
{* LNot operator.  }
{* "__real expr" operator.  }
{* "__imag expr" operator.  }
{* __extension__ marker operator.  }
{* C++ co_await operator.  }
type
  TCXUnaryOperatorKind =  Longint;
  Const
    CXUnaryOperator_Invalid = 0;
    CXUnaryOperator_PostInc = 1;
    CXUnaryOperator_PostDec = 2;
    CXUnaryOperator_PreInc = 3;
    CXUnaryOperator_PreDec = 4;
    CXUnaryOperator_AddrOf = 5;
    CXUnaryOperator_Deref = 6;
    CXUnaryOperator_Plus = 7;
    CXUnaryOperator_Minus = 8;
    CXUnaryOperator_Not = 9;
    CXUnaryOperator_LNot = 10;
    CXUnaryOperator_Real = 11;
    CXUnaryOperator_Imag = 12;
    CXUnaryOperator_Extension = 13;
    CXUnaryOperator_Coawait = 14;

{*
 * Retrieve the spelling of a given CXUnaryOperatorKind.
  }

function clang_getUnaryOperatorKindSpelling(kind:TCXUnaryOperatorKind):TCXString;cdecl;external libgclang;
{*
 * Retrieve the unary operator kind of this cursor.
 *
 * If this cursor is not a unary operator then returns Invalid.
  }
function clang_getCursorUnaryOperatorKind(cursor:TCXCursor):TCXUnaryOperatorKind;cdecl;external libgclang;
{*
 * @
  }
{*
 * @
  }
{$endif}

// === Konventiert am: 4-10-26 17:29:43 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function CINDEX_VERSION_ENCODE(major,minor : longint) : longint;
begin
  CINDEX_VERSION_ENCODE:=(major*10000)+(minor*1);
end;

function ExcludeDeclarationsFromPCH(var a : CXIndexOptions) : dword;
begin
  ExcludeDeclarationsFromPCH:=(a.flag0 and bm_CXIndexOptions_ExcludeDeclarationsFromPCH) shr bp_CXIndexOptions_ExcludeDeclarationsFromPCH;
end;

procedure set_ExcludeDeclarationsFromPCH(var a : CXIndexOptions; __ExcludeDeclarationsFromPCH : dword);
begin
  a.flag0:=a.flag0 or ((__ExcludeDeclarationsFromPCH shl bp_CXIndexOptions_ExcludeDeclarationsFromPCH) and bm_CXIndexOptions_ExcludeDeclarationsFromPCH);
end;

function DisplayDiagnostics(var a : CXIndexOptions) : dword;
begin
  DisplayDiagnostics:=(a.flag0 and bm_CXIndexOptions_DisplayDiagnostics) shr bp_CXIndexOptions_DisplayDiagnostics;
end;

procedure set_DisplayDiagnostics(var a : CXIndexOptions; __DisplayDiagnostics : dword);
begin
  a.flag0:=a.flag0 or ((__DisplayDiagnostics shl bp_CXIndexOptions_DisplayDiagnostics) and bm_CXIndexOptions_DisplayDiagnostics);
end;

function StorePreamblesInMemory(var a : CXIndexOptions) : dword;
begin
  StorePreamblesInMemory:=(a.flag0 and bm_CXIndexOptions_StorePreamblesInMemory) shr bp_CXIndexOptions_StorePreamblesInMemory;
end;

procedure set_StorePreamblesInMemory(var a : CXIndexOptions; __StorePreamblesInMemory : dword);
begin
  a.flag0:=a.flag0 or ((__StorePreamblesInMemory shl bp_CXIndexOptions_StorePreamblesInMemory) and bm_CXIndexOptions_StorePreamblesInMemory);
end;

function xxxxxx(var a : CXIndexOptions) : dword;
begin
  xxxxxx:=(a.flag0 and bm_CXIndexOptions_xxxxxx) shr bp_CXIndexOptions_xxxxxx;
end;

procedure set_xxxxxx(var a : CXIndexOptions; __xxxxxx : dword);
begin
  a.flag0:=a.flag0 or ((__xxxxxx shl bp_CXIndexOptions_xxxxxx) and bm_CXIndexOptions_xxxxxx);
end;


end.
