unit BuildSystem;

interface

uses
  fp_clang, CXErrorCode;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function clang_getBuildSessionTimestamp: qword; cdecl; external libgclang;

type
  PCXVirtualFileOverlay = ^TCXVirtualFileOverlay;
  TCXVirtualFileOverlay = type Pointer;

function clang_VirtualFileOverlay_create(options: dword): TCXVirtualFileOverlay; cdecl; external libgclang;
function clang_VirtualFileOverlay_addFileMapping(para1: TCXVirtualFileOverlay; virtualPath: pchar; realPath: pchar): TCXErrorCode; cdecl; external libgclang;
function clang_VirtualFileOverlay_setCaseSensitivity(para1: TCXVirtualFileOverlay; caseSensitive: longint): TCXErrorCode; cdecl; external libgclang;
function clang_VirtualFileOverlay_writeToBuffer(para1: TCXVirtualFileOverlay; options: dword; out_buffer_ptr: PPchar; out_buffer_size: Pdword): TCXErrorCode; cdecl; external libgclang;
procedure clang_free(buffer: pointer); cdecl; external libgclang;
procedure clang_VirtualFileOverlay_dispose(para1: TCXVirtualFileOverlay); cdecl; external libgclang;

type
  PCXModuleMapDescriptor = ^TCXModuleMapDescriptor;
  TCXModuleMapDescriptor = type Pointer;

function clang_ModuleMapDescriptor_create(options: dword): TCXModuleMapDescriptor; cdecl; external libgclang;
function clang_ModuleMapDescriptor_setFrameworkModuleName(para1: TCXModuleMapDescriptor; name: pchar): TCXErrorCode; cdecl; external libgclang;
function clang_ModuleMapDescriptor_setUmbrellaHeader(para1: TCXModuleMapDescriptor; name: pchar): TCXErrorCode; cdecl; external libgclang;
function clang_ModuleMapDescriptor_writeToBuffer(para1: TCXModuleMapDescriptor; options: dword; out_buffer_ptr: PPchar; out_buffer_size: Pdword): TCXErrorCode; cdecl; external libgclang;
procedure clang_ModuleMapDescriptor_dispose(para1: TCXModuleMapDescriptor); cdecl; external libgclang;

// === Konventiert am: 4-10-26 17:30:01 ===


implementation



end.
