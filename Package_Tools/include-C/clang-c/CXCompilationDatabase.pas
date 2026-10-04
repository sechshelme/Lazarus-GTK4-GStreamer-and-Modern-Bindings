unit CXCompilationDatabase;

interface

uses
  fp_clang;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{===-- clang-c/CXCompilationDatabase.h - Compilation database  ---*- C -*-===*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* This header provides a public interface to use CompilationDatabase without *|
|* the full Clang C++ API.                                                    *|
|*                                                                            *|
\*===----------------------------------------------------------------------=== }
{$ifndef LLVM_CLANG_C_CXCOMPILATIONDATABASE_H}
{$define LLVM_CLANG_C_CXCOMPILATIONDATABASE_H}
{$include "clang-c/CXString.h"}
{$include "clang-c/ExternC.h"}
{$include "clang-c/Platform.h"}
{* \defgroup COMPILATIONDB CompilationDatabase functions
 * \ingroup CINDEX
 *
 * @
  }
{*
 * A compilation database holds all information used to compile files in a
 * project. For each file in the database, it can be queried for the working
 * directory or the command line used for the compiler invocation.
 *
 * Must be freed by \c clang_CompilationDatabase_dispose
  }
type
  PCXCompilationDatabase = ^TCXCompilationDatabase;
  TCXCompilationDatabase = pointer;
{*
 * Contains the results of a search in the compilation database
 *
 * When searching for the compile command for a file, the compilation db can
 * return several commands, as the file may have been compiled with
 * different options in different places of the project. This choice of compile
 * commands is wrapped in this opaque data structure. It must be freed by
 * \c clang_CompileCommands_dispose.
  }

  PCXCompileCommands = ^TCXCompileCommands;
  TCXCompileCommands = pointer;
{*
 * Represents the command line invocation to compile a specific file.
  }

  PCXCompileCommand = ^TCXCompileCommand;
  TCXCompileCommand = pointer;
{*
 * Error codes for Compilation Database
  }
{
   * No error occurred
    }
{
   * Database can not be loaded
    }

  PCXCompilationDatabase_Error = ^TCXCompilationDatabase_Error;
  TCXCompilationDatabase_Error =  Longint;
  Const
    CXCompilationDatabase_NoError = 0;
    CXCompilationDatabase_CanNotLoadDatabase = 1;
;
{*
 * Creates a compilation database from the database found in directory
 * buildDir. For example, CMake can output a compile_commands.json which can
 * be used to build the database.
 *
 * It must be freed by \c clang_CompilationDatabase_dispose.
  }

function clang_CompilationDatabase_fromDirectory(BuildDir:Pchar; ErrorCode:PCXCompilationDatabase_Error):TCXCompilationDatabase;cdecl;external libgclang;
{*
 * Free the given compilation database
  }
procedure clang_CompilationDatabase_dispose(para1:TCXCompilationDatabase);cdecl;external libgclang;
{*
 * Find the compile commands used for a file. The compile commands
 * must be freed by \c clang_CompileCommands_dispose.
  }
function clang_CompilationDatabase_getCompileCommands(para1:TCXCompilationDatabase; CompleteFileName:Pchar):TCXCompileCommands;cdecl;external libgclang;
{*
 * Get all the compile commands in the given compilation database.
  }
function clang_CompilationDatabase_getAllCompileCommands(para1:TCXCompilationDatabase):TCXCompileCommands;cdecl;external libgclang;
{*
 * Free the given CompileCommands
  }
procedure clang_CompileCommands_dispose(para1:TCXCompileCommands);cdecl;external libgclang;
{*
 * Get the number of CompileCommand we have for a file
  }
function clang_CompileCommands_getSize(para1:TCXCompileCommands):dword;cdecl;external libgclang;
{*
 * Get the I'th CompileCommand for a file
 *
 * Note : 0 <= i < clang_CompileCommands_getSize(CXCompileCommands)
  }
function clang_CompileCommands_getCommand(para1:TCXCompileCommands; I:dword):TCXCompileCommand;cdecl;external libgclang;
{*
 * Get the working directory where the CompileCommand was executed from
  }
function clang_CompileCommand_getDirectory(para1:TCXCompileCommand):TCXString;cdecl;external libgclang;
{*
 * Get the filename associated with the CompileCommand.
  }
function clang_CompileCommand_getFilename(para1:TCXCompileCommand):TCXString;cdecl;external libgclang;
{*
 * Get the number of arguments in the compiler invocation.
 *
  }
function clang_CompileCommand_getNumArgs(para1:TCXCompileCommand):dword;cdecl;external libgclang;
{*
 * Get the I'th argument value in the compiler invocations
 *
 * Invariant :
 *  - argument 0 is the compiler executable
  }
function clang_CompileCommand_getArg(para1:TCXCompileCommand; I:dword):TCXString;cdecl;external libgclang;
{*
 * Get the number of source mappings for the compiler invocation.
  }
function clang_CompileCommand_getNumMappedSources(para1:TCXCompileCommand):dword;cdecl;external libgclang;
{*
 * Get the I'th mapped source path for the compiler invocation.
  }
function clang_CompileCommand_getMappedSourcePath(para1:TCXCompileCommand; I:dword):TCXString;cdecl;external libgclang;
{*
 * Get the I'th mapped source content for the compiler invocation.
  }
function clang_CompileCommand_getMappedSourceContent(para1:TCXCompileCommand; I:dword):TCXString;cdecl;external libgclang;
{*
 * @
  }
{$endif}

// === Konventiert am: 4-10-26 17:30:06 ===


implementation



end.
