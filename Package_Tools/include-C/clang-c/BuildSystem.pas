unit BuildSystem;

interface

uses
  fp_clang;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


function clang_getBuildSessionTimestamp:qword;cdecl;external libgclang;
{*
 * Object encapsulating information about overlaying virtual
 * file/directories over the real file system.
  }
type
  PCXVirtualFileOverlay = ^TCXVirtualFileOverlay;
  TCXVirtualFileOverlay = PCXVirtualFileOverlayImpl;
{*
 * Create a \c CXVirtualFileOverlay object.
 * Must be disposed with \c clang_VirtualFileOverlay_dispose().
 *
 * \param options is reserved, always pass 0.
  }

function clang_VirtualFileOverlay_create(options:dword):TCXVirtualFileOverlay;cdecl;external libgclang;
{*
 * Map an absolute virtual file path to an absolute real one.
 * The virtual path must be canonicalized (not contain "."/"..").
 * \returns 0 for success, non-zero to indicate an error.
  }
function clang_VirtualFileOverlay_addFileMapping(para1:TCXVirtualFileOverlay; virtualPath:Pchar; realPath:Pchar):TCXErrorCode;cdecl;external libgclang;
{*
 * Set the case sensitivity for the \c CXVirtualFileOverlay object.
 * The \c CXVirtualFileOverlay object is case-sensitive by default, this
 * option can be used to override the default.
 * \returns 0 for success, non-zero to indicate an error.
  }
function clang_VirtualFileOverlay_setCaseSensitivity(para1:TCXVirtualFileOverlay; caseSensitive:longint):TCXErrorCode;cdecl;external libgclang;
{*
 * Write out the \c CXVirtualFileOverlay object to a char buffer.
 *
 * \param options is reserved, always pass 0.
 * \param out_buffer_ptr pointer to receive the buffer pointer, which should be
 * disposed using \c clang_free().
 * \param out_buffer_size pointer to receive the buffer size.
 * \returns 0 for success, non-zero to indicate an error.
  }
function clang_VirtualFileOverlay_writeToBuffer(para1:TCXVirtualFileOverlay; options:dword; out_buffer_ptr:PPchar; out_buffer_size:Pdword):TCXErrorCode;cdecl;external libgclang;
{*
 * free memory allocated by libclang, such as the buffer returned by
 * \c CXVirtualFileOverlay() or \c clang_ModuleMapDescriptor_writeToBuffer().
 *
 * \param buffer memory pointer to free.
  }
procedure clang_free(buffer:pointer);cdecl;external libgclang;
{*
 * Dispose a \c CXVirtualFileOverlay object.
  }
procedure clang_VirtualFileOverlay_dispose(para1:TCXVirtualFileOverlay);cdecl;external libgclang;
{*
 * Object encapsulating information about a module.modulemap file.
  }
type
  PCXModuleMapDescriptor = ^TCXModuleMapDescriptor;
  TCXModuleMapDescriptor = PCXModuleMapDescriptorImpl;
{*
 * Create a \c CXModuleMapDescriptor object.
 * Must be disposed with \c clang_ModuleMapDescriptor_dispose().
 *
 * \param options is reserved, always pass 0.
  }

function clang_ModuleMapDescriptor_create(options:dword):TCXModuleMapDescriptor;cdecl;external libgclang;
{*
 * Sets the framework module name that the module.modulemap describes.
 * \returns 0 for success, non-zero to indicate an error.
  }
function clang_ModuleMapDescriptor_setFrameworkModuleName(para1:TCXModuleMapDescriptor; name:Pchar):TCXErrorCode;cdecl;external libgclang;
{*
 * Sets the umbrella header name that the module.modulemap describes.
 * \returns 0 for success, non-zero to indicate an error.
  }
function clang_ModuleMapDescriptor_setUmbrellaHeader(para1:TCXModuleMapDescriptor; name:Pchar):TCXErrorCode;cdecl;external libgclang;
{*
 * Write out the \c CXModuleMapDescriptor object to a char buffer.
 *
 * \param options is reserved, always pass 0.
 * \param out_buffer_ptr pointer to receive the buffer pointer, which should be
 * disposed using \c clang_free().
 * \param out_buffer_size pointer to receive the buffer size.
 * \returns 0 for success, non-zero to indicate an error.
  }
function clang_ModuleMapDescriptor_writeToBuffer(para1:TCXModuleMapDescriptor; options:dword; out_buffer_ptr:PPchar; out_buffer_size:Pdword):TCXErrorCode;cdecl;external libgclang;
{*
 * Dispose a \c CXModuleMapDescriptor object.
  }
procedure clang_ModuleMapDescriptor_dispose(para1:TCXModuleMapDescriptor);cdecl;external libgclang;
{*
 * @
  }
{$endif}
{ CLANG_C_BUILD_SYSTEM_H  }

// === Konventiert am: 4-10-26 17:30:01 ===


implementation



end.
