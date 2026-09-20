unit Target;

interface

uses
  fp_llvm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{===-- llvm-c/Target.h - Target Lib C Iface --------------------*- C++ -*-=== }
{                                                                             }
{ Part of the LLVM Project, under the Apache License v2.0 with LLVM           }
{ Exceptions.                                                                 }
{ See https://llvm.org/LICENSE.txt for license information.                   }
{ SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception                     }
{                                                                             }
{===----------------------------------------------------------------------=== }
{                                                                             }
{ This header declares the C interface to libLLVMTarget.a, which              }
{ implements target information.                                              }
{                                                                             }
{ Many exotic languages can interoperate with C code but have a harder time   }
{ with C++ due to name mangling. So in addition to C, this interface enables  }
{ tools written in such languages.                                            }
{                                                                             }
{===----------------------------------------------------------------------=== }
{$ifndef LLVM_C_TARGET_H}
{$define LLVM_C_TARGET_H}
{$include "llvm-c/ExternC.h"}
{$include "llvm-c/Types.h"}
{$include "llvm/Config/llvm-config.h"}
{*
 * @defgroup LLVMCTarget Target information
 * @ingroup LLVMC
 *
 * @
  }
type
  TLLVMByteOrdering =  Longint;
  Const
    LLVMBigEndian = 0;
    LLVMLittleEndian = 1;

type
  PLLVMTargetDataRef = ^TLLVMTargetDataRef;
  TLLVMTargetDataRef = PLLVMOpaqueTargetData;

  PLLVMTargetLibraryInfoRef = ^TLLVMTargetLibraryInfoRef;
  TLLVMTargetLibraryInfoRef = PLLVMOpaqueTargetLibraryInfotData;
{ xxxxxxx
#define LLVM_TARGET(TargetName) \
  void LLVMInitialize##TargetName##TargetInfo(void);
#include "llvm/Config/Targets.def"
#undef LLVM_TARGET 

#define LLVM_TARGET(TargetName) void LLVMInitialize##TargetName##Target(void);
#include "llvm/Config/Targets.def"
#undef LLVM_TARGET 

#define LLVM_TARGET(TargetName) \
  void LLVMInitialize##TargetName##TargetMC(void);
#include "llvm/Config/Targets.def"
#undef LLVM_TARGET 

#define LLVM_ASM_PRINTER(TargetName) \
  void LLVMInitialize##TargetName##AsmPrinter(void);
#include "llvm/Config/AsmPrinters.def"
#undef LLVM_ASM_PRINTER  

#define LLVM_ASM_PARSER(TargetName) \
  void LLVMInitialize##TargetName##AsmParser(void);
#include "llvm/Config/AsmParsers.def"
#undef LLVM_ASM_PARSER  

#define LLVM_DISASSEMBLER(TargetName) \
  void LLVMInitialize##TargetName##Disassembler(void);
#include "llvm/Config/Disassemblers.def"
#undef LLVM_DISASSEMBLER  

static inline void LLVMInitializeAllTargetInfos(void) 
#define LLVM_TARGET(TargetName) LLVMInitialize##TargetName##TargetInfo();
#include "llvm/Config/Targets.def"
#undef LLVM_TARGET  


static inline void LLVMInitializeAllTargets(void) 
#define LLVM_TARGET(TargetName) LLVMInitialize##TargetName##Target();
#include "llvm/Config/Targets.def"
#undef LLVM_TARGET  


static inline void LLVMInitializeAllTargetMCs(void) 
#define LLVM_TARGET(TargetName) LLVMInitialize##TargetName##TargetMC();
#include "llvm/Config/Targets.def"
#undef LLVM_TARGET  


static inline void LLVMInitializeAllAsmPrinters(void) 
#define LLVM_ASM_PRINTER(TargetName) LLVMInitialize##TargetName##AsmPrinter();
#include "llvm/Config/AsmPrinters.def"
#undef LLVM_ASM_PRINTER 


static inline void LLVMInitializeAllAsmParsers(void) 
#define LLVM_ASM_PARSER(TargetName) LLVMInitialize##TargetName##AsmParser();
#include "llvm/Config/AsmParsers.def"
#undef LLVM_ASM_PARSER  


static inline void LLVMInitializeAllDisassemblers(void) 
#define LLVM_DISASSEMBLER(TargetName) \
  LLVMInitialize##TargetName##Disassembler();
#include "llvm/Config/Disassemblers.def"
#undef LLVM_DISASSEMBLER  


static inline LLVMBool LLVMInitializeNativeTarget(void) 

#ifdef LLVM_NATIVE_TARGET
  LLVM_NATIVE_TARGETINFO();
  LLVM_NATIVE_TARGET();
  LLVM_NATIVE_TARGETMC();
  return 0;
#else
  return 1;
#endif


static inline LLVMBool LLVMInitializeNativeAsmParser(void) 
#ifdef LLVM_NATIVE_ASMPARSER
  LLVM_NATIVE_ASMPARSER();
  return 0;
#else
  return 1;
#endif


static inline LLVMBool LLVMInitializeNativeAsmPrinter(void) 
#ifdef LLVM_NATIVE_ASMPRINTER
  LLVM_NATIVE_ASMPRINTER();
  return 0;
#else
  return 1;
#endif


static inline LLVMBool LLVMInitializeNativeDisassembler(void) 
#ifdef LLVM_NATIVE_DISASSEMBLER
  LLVM_NATIVE_DISASSEMBLER();
  return 0;
#else
  return 1;
#endif


 }

function LLVMGetModuleDataLayout(M:TLLVMModuleRef):TLLVMTargetDataRef;cdecl;external libllvm;
{*
 * Set the data layout for a module.
 *
 * @see Module::setDataLayout()
  }
procedure LLVMSetModuleDataLayout(M:TLLVMModuleRef; DL:TLLVMTargetDataRef);cdecl;external libllvm;
{* Creates target data from a target layout string.
    See the constructor llvm::DataLayout::DataLayout.  }
function LLVMCreateTargetData(StringRep:Pchar):TLLVMTargetDataRef;cdecl;external libllvm;
{* Deallocates a TargetData.
    See the destructor llvm::DataLayout::~DataLayout.  }
procedure LLVMDisposeTargetData(TD:TLLVMTargetDataRef);cdecl;external libllvm;
{* Adds target library information to a pass manager. This does not take
    ownership of the target library info.
    See the method llvm::PassManagerBase::add.  }
procedure LLVMAddTargetLibraryInfo(TLI:TLLVMTargetLibraryInfoRef; PM:TLLVMPassManagerRef);cdecl;external libllvm;
{* Converts target data to a target layout string. The string must be disposed
    with LLVMDisposeMessage.
    See the constructor llvm::DataLayout::DataLayout.  }
function LLVMCopyStringRepOfTargetData(TD:TLLVMTargetDataRef):Pchar;cdecl;external libllvm;
{* Returns the byte order of a target, either LLVMBigEndian or
    LLVMLittleEndian.
    See the method llvm::DataLayout::isLittleEndian.  }
function LLVMByteOrder(TD:TLLVMTargetDataRef):TLLVMByteOrdering;cdecl;external libllvm;
{* Returns the pointer size in bytes for a target.
    See the method llvm::DataLayout::getPointerSize.  }
function LLVMPointerSize(TD:TLLVMTargetDataRef):dword;cdecl;external libllvm;
{* Returns the pointer size in bytes for a target for a specified
    address space.
    See the method llvm::DataLayout::getPointerSize.  }
function LLVMPointerSizeForAS(TD:TLLVMTargetDataRef; AS:dword):dword;cdecl;external libllvm;
{* Returns the integer type that is the same size as a pointer on a target.
    See the method llvm::DataLayout::getIntPtrType.  }
function LLVMIntPtrType(TD:TLLVMTargetDataRef):TLLVMTypeRef;cdecl;external libllvm;
{* Returns the integer type that is the same size as a pointer on a target.
    This version allows the address space to be specified.
    See the method llvm::DataLayout::getIntPtrType.  }
function LLVMIntPtrTypeForAS(TD:TLLVMTargetDataRef; AS:dword):TLLVMTypeRef;cdecl;external libllvm;
{* Returns the integer type that is the same size as a pointer on a target.
    See the method llvm::DataLayout::getIntPtrType.  }
function LLVMIntPtrTypeInContext(C:TLLVMContextRef; TD:TLLVMTargetDataRef):TLLVMTypeRef;cdecl;external libllvm;
{* Returns the integer type that is the same size as a pointer on a target.
    This version allows the address space to be specified.
    See the method llvm::DataLayout::getIntPtrType.  }
function LLVMIntPtrTypeForASInContext(C:TLLVMContextRef; TD:TLLVMTargetDataRef; AS:dword):TLLVMTypeRef;cdecl;external libllvm;
{* Computes the size of a type in bits for a target.
    See the method llvm::DataLayout::getTypeSizeInBits.  }
function LLVMSizeOfTypeInBits(TD:TLLVMTargetDataRef; Ty:TLLVMTypeRef):qword;cdecl;external libllvm;
{* Computes the storage size of a type in bytes for a target.
    See the method llvm::DataLayout::getTypeStoreSize.  }
function LLVMStoreSizeOfType(TD:TLLVMTargetDataRef; Ty:TLLVMTypeRef):qword;cdecl;external libllvm;
{* Computes the ABI size of a type in bytes for a target.
    See the method llvm::DataLayout::getTypeAllocSize.  }
function LLVMABISizeOfType(TD:TLLVMTargetDataRef; Ty:TLLVMTypeRef):qword;cdecl;external libllvm;
{* Computes the ABI alignment of a type in bytes for a target.
    See the method llvm::DataLayout::getTypeABISize.  }
function LLVMABIAlignmentOfType(TD:TLLVMTargetDataRef; Ty:TLLVMTypeRef):dword;cdecl;external libllvm;
{* Computes the call frame alignment of a type in bytes for a target.
    See the method llvm::DataLayout::getTypeABISize.  }
function LLVMCallFrameAlignmentOfType(TD:TLLVMTargetDataRef; Ty:TLLVMTypeRef):dword;cdecl;external libllvm;
{* Computes the preferred alignment of a type in bytes for a target.
    See the method llvm::DataLayout::getTypeABISize.  }
function LLVMPreferredAlignmentOfType(TD:TLLVMTargetDataRef; Ty:TLLVMTypeRef):dword;cdecl;external libllvm;
{* Computes the preferred alignment of a global variable in bytes for a target.
    See the method llvm::DataLayout::getPreferredAlignment.  }
function LLVMPreferredAlignmentOfGlobal(TD:TLLVMTargetDataRef; GlobalVar:TLLVMValueRef):dword;cdecl;external libllvm;
{* Computes the structure element that contains the byte offset for a target.
    See the method llvm::StructLayout::getElementContainingOffset.  }
function LLVMElementAtOffset(TD:TLLVMTargetDataRef; StructTy:TLLVMTypeRef; Offset:qword):dword;cdecl;external libllvm;
{* Computes the byte offset of the indexed struct element for a target.
    See the method llvm::StructLayout::getElementContainingOffset.  }
function LLVMOffsetOfElement(TD:TLLVMTargetDataRef; StructTy:TLLVMTypeRef; Element:dword):qword;cdecl;external libllvm;
{*
 * @
  }
{$endif}

// === Konventiert am: 20-9-26 17:11:04 ===


implementation



end.
