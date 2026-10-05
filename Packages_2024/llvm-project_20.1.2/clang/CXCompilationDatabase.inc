{$IFDEF read_interface}


type
  PCXCompilationDatabase = ^TCXCompilationDatabase;
  TCXCompilationDatabase = pointer;

  PCXCompileCommands = ^TCXCompileCommands;
  TCXCompileCommands = pointer;

  PCXCompileCommand = ^TCXCompileCommand;
  TCXCompileCommand = pointer;

type
  PCXCompilationDatabase_Error = ^TCXCompilationDatabase_Error;
  TCXCompilationDatabase_Error = longint;
const
  CXCompilationDatabase_NoError = 0;
  CXCompilationDatabase_CanNotLoadDatabase = 1;

function clang_CompilationDatabase_fromDirectory(BuildDir: pchar; ErrorCode: PCXCompilationDatabase_Error): TCXCompilationDatabase; cdecl; external libclang;
procedure clang_CompilationDatabase_dispose(para1: TCXCompilationDatabase); cdecl; external libclang;
function clang_CompilationDatabase_getCompileCommands(para1: TCXCompilationDatabase; CompleteFileName: pchar): TCXCompileCommands; cdecl; external libclang;
function clang_CompilationDatabase_getAllCompileCommands(para1: TCXCompilationDatabase): TCXCompileCommands; cdecl; external libclang;
procedure clang_CompileCommands_dispose(para1: TCXCompileCommands); cdecl; external libclang;
function clang_CompileCommands_getSize(para1: TCXCompileCommands): dword; cdecl; external libclang;
function clang_CompileCommands_getCommand(para1: TCXCompileCommands; I: dword): TCXCompileCommand; cdecl; external libclang;
function clang_CompileCommand_getDirectory(para1: TCXCompileCommand): TCXString; cdecl; external libclang;
function clang_CompileCommand_getFilename(para1: TCXCompileCommand): TCXString; cdecl; external libclang;
function clang_CompileCommand_getNumArgs(para1: TCXCompileCommand): dword; cdecl; external libclang;
function clang_CompileCommand_getArg(para1: TCXCompileCommand; I: dword): TCXString; cdecl; external libclang;
function clang_CompileCommand_getNumMappedSources(para1: TCXCompileCommand): dword; cdecl; external libclang;
function clang_CompileCommand_getMappedSourcePath(para1: TCXCompileCommand; I: dword): TCXString; cdecl; external libclang;
function clang_CompileCommand_getMappedSourceContent(para1: TCXCompileCommand; I: dword): TCXString; cdecl; external libclang;

// === Konventiert am: 4-10-26 17:30:06 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
