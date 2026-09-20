unit Object_;

interface

uses
  fp_llvm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{===-- llvm-c/Object.h - Object Lib C Iface --------------------*- C++ -*-=== }
{                                                                             }
{ Part of the LLVM Project, under the Apache License v2.0 with LLVM           }
{ Exceptions.                                                                 }
{ See https://llvm.org/LICENSE.txt for license information.                   }
{ SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception                     }
{                                                                             }
{===----------------------------------------------------------------------=== }
{                                                                             }
{ This header declares the C interface to libLLVMObject.a, which              }
{ implements object file reading and writing.                                 }
{                                                                             }
{ Many exotic languages can interoperate with C code but have a harder time   }
{ with C++ due to name mangling. So in addition to C, this interface enables  }
{ tools written in such languages.                                            }
{                                                                             }
{===----------------------------------------------------------------------=== }
{$ifndef LLVM_C_OBJECT_H}
{$define LLVM_C_OBJECT_H}
{$include "llvm-c/ExternC.h"}
{$include "llvm-c/Types.h"}
{$include "llvm/Config/llvm-config.h"}
{*
 * @defgroup LLVMCObject Object file reading and writing
 * @ingroup LLVMC
 *
 * @
  }
{ Opaque type wrappers }
type
  PLLVMSectionIteratorRef = ^TLLVMSectionIteratorRef;
  TLLVMSectionIteratorRef = PLLVMOpaqueSectionIterator;

  PLLVMSymbolIteratorRef = ^TLLVMSymbolIteratorRef;
  TLLVMSymbolIteratorRef = PLLVMOpaqueSymbolIterator;

  PLLVMRelocationIteratorRef = ^TLLVMRelocationIteratorRef;
  TLLVMRelocationIteratorRef = PLLVMOpaqueRelocationIterator;
{*< Archive file.  }
{*< Mach-O Universal Binary file.  }
{*< COFF Import file.  }
{*< LLVM IR.  }
{*< Windows resource (.res) file.  }
{*< COFF Object file.  }
{*< ELF 32-bit, little endian.  }
{*< ELF 32-bit, big endian.  }
{*< ELF 64-bit, little endian.  }
{*< ELF 64-bit, big endian.  }
{*< MachO 32-bit, little endian.  }
{*< MachO 32-bit, big endian.  }
{*< MachO 64-bit, little endian.  }
{*< MachO 64-bit, big endian.  }
{*< Web Assembly.  }
{*< Offloading fatbinary.  }

  PLLVMBinaryType = ^TLLVMBinaryType;
  TLLVMBinaryType =  Longint;
  Const
    LLVMBinaryTypeArchive = 0;
    LLVMBinaryTypeMachOUniversalBinary = 1;
    LLVMBinaryTypeCOFFImportFile = 2;
    LLVMBinaryTypeIR = 3;
    LLVMBinaryTypeWinRes = 4;
    LLVMBinaryTypeCOFF = 5;
    LLVMBinaryTypeELF32L = 6;
    LLVMBinaryTypeELF32B = 7;
    LLVMBinaryTypeELF64L = 8;
    LLVMBinaryTypeELF64B = 9;
    LLVMBinaryTypeMachO32L = 10;
    LLVMBinaryTypeMachO32B = 11;
    LLVMBinaryTypeMachO64L = 12;
    LLVMBinaryTypeMachO64B = 13;
    LLVMBinaryTypeWasm = 14;
    LLVMBinaryTypeOffload = 15;
;
{*
 * Create a binary file from the given memory buffer.
 *
 * The exact type of the binary file will be inferred automatically, and the
 * appropriate implementation selected.  The context may be NULL except if
 * the resulting file is an LLVM IR file.
 *
 * The memory buffer is not consumed by this function.  It is the responsibilty
 * of the caller to free it with \c LLVMDisposeMemoryBuffer.
 *
 * If NULL is returned, the \p ErrorMessage parameter is populated with the
 * error's description.  It is then the caller's responsibility to free this
 * message by calling \c LLVMDisposeMessage.
 *
 * @see llvm::object::createBinary
  }

function LLVMCreateBinary(MemBuf:TLLVMMemoryBufferRef; Context:TLLVMContextRef; ErrorMessage:PPchar):TLLVMBinaryRef;cdecl;external libllvm;
{*
 * Dispose of a binary file.
 *
 * The binary file does not own its backing buffer.  It is the responsibilty
 * of the caller to free it with \c LLVMDisposeMemoryBuffer.
  }
procedure LLVMDisposeBinary(BR:TLLVMBinaryRef);cdecl;external libllvm;
{*
 * Retrieves a copy of the memory buffer associated with this object file.
 *
 * The returned buffer is merely a shallow copy and does not own the actual
 * backing buffer of the binary. Nevertheless, it is the responsibility of the
 * caller to free it with \c LLVMDisposeMemoryBuffer.
 *
 * @see llvm::object::getMemoryBufferRef
  }
function LLVMBinaryCopyMemoryBuffer(BR:TLLVMBinaryRef):TLLVMMemoryBufferRef;cdecl;external libllvm;
{*
 * Retrieve the specific type of a binary.
 *
 * @see llvm::object::Binary::getType
  }
function LLVMBinaryGetType(BR:TLLVMBinaryRef):TLLVMBinaryType;cdecl;external libllvm;
{
 * For a Mach-O universal binary file, retrieves the object file corresponding
 * to the given architecture if it is present as a slice.
 *
 * If NULL is returned, the \p ErrorMessage parameter is populated with the
 * error's description.  It is then the caller's responsibility to free this
 * message by calling \c LLVMDisposeMessage.
 *
 * It is the responsiblity of the caller to free the returned object file by
 * calling \c LLVMDisposeBinary.
  }
function LLVMMachOUniversalBinaryCopyObjectForArch(BR:TLLVMBinaryRef; Arch:Pchar; ArchLen:Tsize_t; ErrorMessage:PPchar):TLLVMBinaryRef;cdecl;external libllvm;
{*
 * Retrieve a copy of the section iterator for this object file.
 *
 * If there are no sections, the result is NULL.
 *
 * The returned iterator is merely a shallow copy. Nevertheless, it is
 * the responsibility of the caller to free it with
 * \c LLVMDisposeSectionIterator.
 *
 * @see llvm::object::sections()
  }
function LLVMObjectFileCopySectionIterator(BR:TLLVMBinaryRef):TLLVMSectionIteratorRef;cdecl;external libllvm;
{*
 * Returns whether the given section iterator is at the end.
 *
 * @see llvm::object::section_end
  }
function LLVMObjectFileIsSectionIteratorAtEnd(BR:TLLVMBinaryRef; SI:TLLVMSectionIteratorRef):TLLVMBool;cdecl;external libllvm;
{*
 * Retrieve a copy of the symbol iterator for this object file.
 *
 * If there are no symbols, the result is NULL.
 *
 * The returned iterator is merely a shallow copy. Nevertheless, it is
 * the responsibility of the caller to free it with
 * \c LLVMDisposeSymbolIterator.
 *
 * @see llvm::object::symbols()
  }
function LLVMObjectFileCopySymbolIterator(BR:TLLVMBinaryRef):TLLVMSymbolIteratorRef;cdecl;external libllvm;
{*
 * Returns whether the given symbol iterator is at the end.
 *
 * @see llvm::object::symbol_end
  }
function LLVMObjectFileIsSymbolIteratorAtEnd(BR:TLLVMBinaryRef; SI:TLLVMSymbolIteratorRef):TLLVMBool;cdecl;external libllvm;
procedure LLVMDisposeSectionIterator(SI:TLLVMSectionIteratorRef);cdecl;external libllvm;
procedure LLVMMoveToNextSection(SI:TLLVMSectionIteratorRef);cdecl;external libllvm;
procedure LLVMMoveToContainingSection(Sect:TLLVMSectionIteratorRef; Sym:TLLVMSymbolIteratorRef);cdecl;external libllvm;
{ ObjectFile Symbol iterators }
procedure LLVMDisposeSymbolIterator(SI:TLLVMSymbolIteratorRef);cdecl;external libllvm;
procedure LLVMMoveToNextSymbol(SI:TLLVMSymbolIteratorRef);cdecl;external libllvm;
{ SectionRef accessors }
function LLVMGetSectionName(SI:TLLVMSectionIteratorRef):Pchar;cdecl;external libllvm;
function LLVMGetSectionSize(SI:TLLVMSectionIteratorRef):Tuint64_t;cdecl;external libllvm;
function LLVMGetSectionContents(SI:TLLVMSectionIteratorRef):Pchar;cdecl;external libllvm;
function LLVMGetSectionAddress(SI:TLLVMSectionIteratorRef):Tuint64_t;cdecl;external libllvm;
function LLVMGetSectionContainsSymbol(SI:TLLVMSectionIteratorRef; Sym:TLLVMSymbolIteratorRef):TLLVMBool;cdecl;external libllvm;
{ Section Relocation iterators }
function LLVMGetRelocations(Section:TLLVMSectionIteratorRef):TLLVMRelocationIteratorRef;cdecl;external libllvm;
procedure LLVMDisposeRelocationIterator(RI:TLLVMRelocationIteratorRef);cdecl;external libllvm;
function LLVMIsRelocationIteratorAtEnd(Section:TLLVMSectionIteratorRef; RI:TLLVMRelocationIteratorRef):TLLVMBool;cdecl;external libllvm;
procedure LLVMMoveToNextRelocation(RI:TLLVMRelocationIteratorRef);cdecl;external libllvm;
{ SymbolRef accessors }
function LLVMGetSymbolName(SI:TLLVMSymbolIteratorRef):Pchar;cdecl;external libllvm;
function LLVMGetSymbolAddress(SI:TLLVMSymbolIteratorRef):Tuint64_t;cdecl;external libllvm;
function LLVMGetSymbolSize(SI:TLLVMSymbolIteratorRef):Tuint64_t;cdecl;external libllvm;
{ RelocationRef accessors }
function LLVMGetRelocationOffset(RI:TLLVMRelocationIteratorRef):Tuint64_t;cdecl;external libllvm;
function LLVMGetRelocationSymbol(RI:TLLVMRelocationIteratorRef):TLLVMSymbolIteratorRef;cdecl;external libllvm;
function LLVMGetRelocationType(RI:TLLVMRelocationIteratorRef):Tuint64_t;cdecl;external libllvm;
{ NOTE: Caller takes ownership of returned string of the two }
{ following functions. }
function LLVMGetRelocationTypeName(RI:TLLVMRelocationIteratorRef):Pchar;cdecl;external libllvm;
function LLVMGetRelocationValueString(RI:TLLVMRelocationIteratorRef):Pchar;cdecl;external libllvm;
{* Deprecated: Use LLVMBinaryRef instead.  }
type
  PLLVMObjectFileRef = ^TLLVMObjectFileRef;
  TLLVMObjectFileRef = PLLVMOpaqueObjectFile;
{* Deprecated: Use LLVMCreateBinary instead.  }

function LLVMCreateObjectFile(MemBuf:TLLVMMemoryBufferRef):TLLVMObjectFileRef;cdecl;external libllvm;
{* Deprecated: Use LLVMDisposeBinary instead.  }
procedure LLVMDisposeObjectFile(ObjectFile:TLLVMObjectFileRef);cdecl;external libllvm;
{* Deprecated: Use LLVMObjectFileCopySectionIterator instead.  }
function LLVMGetSections(ObjectFile:TLLVMObjectFileRef):TLLVMSectionIteratorRef;cdecl;external libllvm;
{* Deprecated: Use LLVMObjectFileIsSectionIteratorAtEnd instead.  }
function LLVMIsSectionIteratorAtEnd(ObjectFile:TLLVMObjectFileRef; SI:TLLVMSectionIteratorRef):TLLVMBool;cdecl;external libllvm;
{* Deprecated: Use LLVMObjectFileCopySymbolIterator instead.  }
function LLVMGetSymbols(ObjectFile:TLLVMObjectFileRef):TLLVMSymbolIteratorRef;cdecl;external libllvm;
{* Deprecated: Use LLVMObjectFileIsSymbolIteratorAtEnd instead.  }
function LLVMIsSymbolIteratorAtEnd(ObjectFile:TLLVMObjectFileRef; SI:TLLVMSymbolIteratorRef):TLLVMBool;cdecl;external libllvm;
{*
 * @
  }
{$endif}

// === Konventiert am: 20-9-26 17:11:16 ===


implementation



end.
