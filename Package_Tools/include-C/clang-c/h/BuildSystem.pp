
unit BuildSystem;
interface

{
  Automatically converted by H2Pas 1.0.0 from BuildSystem.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    BuildSystem.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PCXModuleMapDescriptor  = ^CXModuleMapDescriptor;
PCXModuleMapDescriptorImpl  = ^CXModuleMapDescriptorImpl;
PCXVirtualFileOverlay  = ^CXVirtualFileOverlay;
PCXVirtualFileOverlayImpl  = ^CXVirtualFileOverlayImpl;
Pdword  = ^dword;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{==-- clang-c/BuildSystem.h - Utilities for use by build systems -*- C -*-===*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* This header provides various utilities for use by build systems.           *|
|*                                                                            *|
\*===----------------------------------------------------------------------=== }
{$ifndef LLVM_CLANG_C_BUILDSYSTEM_H}
{$define LLVM_CLANG_C_BUILDSYSTEM_H}
{$include "clang-c/CXErrorCode.h"}
{$include "clang-c/CXString.h"}
{$include "clang-c/ExternC.h"}
{$include "clang-c/Platform.h"}
{*
 * \defgroup BUILD_SYSTEM Build system utilities
 * @
  }
{*
 * Return the timestamp for use with Clang's
 * \c -fbuild-session-timestamp= option.
  }

function clang_getBuildSessionTimestamp:qword;cdecl;external;
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

function clang_VirtualFileOverlay_create(options:dword):TCXVirtualFileOverlay;cdecl;external;
{*
 * Map an absolute virtual file path to an absolute real one.
 * The virtual path must be canonicalized (not contain "."/"..").
 * \returns 0 for success, non-zero to indicate an error.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function clang_VirtualFileOverlay_addFileMapping(para1:TCXVirtualFileOverlay; virtualPath:Pchar; realPath:Pchar):TCXErrorCode;cdecl;external;
{*
 * Set the case sensitivity for the \c CXVirtualFileOverlay object.
 * The \c CXVirtualFileOverlay object is case-sensitive by default, this
 * option can be used to override the default.
 * \returns 0 for success, non-zero to indicate an error.
  }
function clang_VirtualFileOverlay_setCaseSensitivity(para1:TCXVirtualFileOverlay; caseSensitive:longint):TCXErrorCode;cdecl;external;
{*
 * Write out the \c CXVirtualFileOverlay object to a char buffer.
 *
 * \param options is reserved, always pass 0.
 * \param out_buffer_ptr pointer to receive the buffer pointer, which should be
 * disposed using \c clang_free().
 * \param out_buffer_size pointer to receive the buffer size.
 * \returns 0 for success, non-zero to indicate an error.
  }
function clang_VirtualFileOverlay_writeToBuffer(para1:TCXVirtualFileOverlay; options:dword; out_buffer_ptr:PPchar; out_buffer_size:Pdword):TCXErrorCode;cdecl;external;
{*
 * free memory allocated by libclang, such as the buffer returned by
 * \c CXVirtualFileOverlay() or \c clang_ModuleMapDescriptor_writeToBuffer().
 *
 * \param buffer memory pointer to free.
  }
procedure clang_free(buffer:pointer);cdecl;external;
{*
 * Dispose a \c CXVirtualFileOverlay object.
  }
procedure clang_VirtualFileOverlay_dispose(para1:TCXVirtualFileOverlay);cdecl;external;
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

function clang_ModuleMapDescriptor_create(options:dword):TCXModuleMapDescriptor;cdecl;external;
{*
 * Sets the framework module name that the module.modulemap describes.
 * \returns 0 for success, non-zero to indicate an error.
  }
(* Const before type ignored *)
function clang_ModuleMapDescriptor_setFrameworkModuleName(para1:TCXModuleMapDescriptor; name:Pchar):TCXErrorCode;cdecl;external;
{*
 * Sets the umbrella header name that the module.modulemap describes.
 * \returns 0 for success, non-zero to indicate an error.
  }
(* Const before type ignored *)
function clang_ModuleMapDescriptor_setUmbrellaHeader(para1:TCXModuleMapDescriptor; name:Pchar):TCXErrorCode;cdecl;external;
{*
 * Write out the \c CXModuleMapDescriptor object to a char buffer.
 *
 * \param options is reserved, always pass 0.
 * \param out_buffer_ptr pointer to receive the buffer pointer, which should be
 * disposed using \c clang_free().
 * \param out_buffer_size pointer to receive the buffer size.
 * \returns 0 for success, non-zero to indicate an error.
  }
function clang_ModuleMapDescriptor_writeToBuffer(para1:TCXModuleMapDescriptor; options:dword; out_buffer_ptr:PPchar; out_buffer_size:Pdword):TCXErrorCode;cdecl;external;
{*
 * Dispose a \c CXModuleMapDescriptor object.
  }
procedure clang_ModuleMapDescriptor_dispose(para1:TCXModuleMapDescriptor);cdecl;external;
{*
 * @
  }
{$endif}
{ CLANG_C_BUILD_SYSTEM_H  }

implementation


end.
