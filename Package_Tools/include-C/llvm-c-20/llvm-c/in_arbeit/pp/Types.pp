
unit Types;
interface

{
  Automatically converted by H2Pas 1.0.0 from Types.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Types.h
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
PLLVMAttributeRef  = ^LLVMAttributeRef;
PLLVMBasicBlockRef  = ^LLVMBasicBlockRef;
PLLVMBinaryRef  = ^LLVMBinaryRef;
PLLVMBool  = ^LLVMBool;
PLLVMBuilderRef  = ^LLVMBuilderRef;
PLLVMComdat  = ^LLVMComdat;
PLLVMComdatRef  = ^LLVMComdatRef;
PLLVMContextRef  = ^LLVMContextRef;
PLLVMDbgRecordRef  = ^LLVMDbgRecordRef;
PLLVMDiagnosticInfoRef  = ^LLVMDiagnosticInfoRef;
PLLVMDIBuilderRef  = ^LLVMDIBuilderRef;
PLLVMJITEventListenerRef  = ^LLVMJITEventListenerRef;
PLLVMMemoryBufferRef  = ^LLVMMemoryBufferRef;
PLLVMMetadataRef  = ^LLVMMetadataRef;
PLLVMModuleProviderRef  = ^LLVMModuleProviderRef;
PLLVMModuleRef  = ^LLVMModuleRef;
PLLVMNamedMDNodeRef  = ^LLVMNamedMDNodeRef;
PLLVMOpaqueAttributeRef  = ^LLVMOpaqueAttributeRef;
PLLVMOpaqueBasicBlock  = ^LLVMOpaqueBasicBlock;
PLLVMOpaqueBinary  = ^LLVMOpaqueBinary;
PLLVMOpaqueBuilder  = ^LLVMOpaqueBuilder;
PLLVMOpaqueContext  = ^LLVMOpaqueContext;
PLLVMOpaqueDbgRecord  = ^LLVMOpaqueDbgRecord;
PLLVMOpaqueDiagnosticInfo  = ^LLVMOpaqueDiagnosticInfo;
PLLVMOpaqueDIBuilder  = ^LLVMOpaqueDIBuilder;
PLLVMOpaqueJITEventListener  = ^LLVMOpaqueJITEventListener;
PLLVMOpaqueMemoryBuffer  = ^LLVMOpaqueMemoryBuffer;
PLLVMOpaqueMetadata  = ^LLVMOpaqueMetadata;
PLLVMOpaqueModule  = ^LLVMOpaqueModule;
PLLVMOpaqueModuleProvider  = ^LLVMOpaqueModuleProvider;
PLLVMOpaqueNamedMDNode  = ^LLVMOpaqueNamedMDNode;
PLLVMOpaqueOperandBundle  = ^LLVMOpaqueOperandBundle;
PLLVMOpaquePassManager  = ^LLVMOpaquePassManager;
PLLVMOpaqueType  = ^LLVMOpaqueType;
PLLVMOpaqueUse  = ^LLVMOpaqueUse;
PLLVMOpaqueValue  = ^LLVMOpaqueValue;
PLLVMOperandBundleRef  = ^LLVMOperandBundleRef;
PLLVMPassManagerRef  = ^LLVMPassManagerRef;
PLLVMTypeRef  = ^LLVMTypeRef;
PLLVMUseRef  = ^LLVMUseRef;
PLLVMValueRef  = ^LLVMValueRef;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{===-- llvm-c/Support.h - C Interface Types declarations ---------*- C -*-===*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* This file defines types used by the C interface to LLVM.                   *|
|*                                                                            *|
\*===----------------------------------------------------------------------=== }
{$ifndef LLVM_C_TYPES_H}
{$define LLVM_C_TYPES_H}
{$include "llvm-c/DataTypes.h"}
{$include "llvm-c/ExternC.h"}
{*
 * @defgroup LLVMCSupportTypes Types and Enumerations
 *
 * @
  }
type
  PLLVMBool = ^TLLVMBool;
  TLLVMBool = longint;
{ Opaque types.  }
{*
 * LLVM uses a polymorphic type hierarchy which C cannot represent, therefore
 * parameters must be passed as base types. Despite the declared types, most
 * of the functions provided operate only on branches of the type hierarchy.
 * The declared parameter names are descriptive and specify which type is
 * required. Additionally, each type hierarchy is documented along with the
 * functions that operate upon it. For more detail, refer to LLVM's C++ code.
 * If in doubt, refer to Core.cpp, which performs parameter downcasts in the
 * form unwrap<RequiredType>(Param).
  }
{*
 * Used to pass regions of memory through LLVM interfaces.
 *
 * @see llvm::MemoryBuffer
  }

  PLLVMMemoryBufferRef = ^TLLVMMemoryBufferRef;
  TLLVMMemoryBufferRef = PLLVMOpaqueMemoryBuffer;
{*
 * The top-level container for all LLVM global data. See the LLVMContext class.
  }

  PLLVMContextRef = ^TLLVMContextRef;
  TLLVMContextRef = PLLVMOpaqueContext;
{*
 * The top-level container for all other LLVM Intermediate Representation (IR)
 * objects.
 *
 * @see llvm::Module
  }

  PLLVMModuleRef = ^TLLVMModuleRef;
  TLLVMModuleRef = PLLVMOpaqueModule;
{*
 * Each value in the LLVM IR has a type, an LLVMTypeRef.
 *
 * @see llvm::Type
  }

  PLLVMTypeRef = ^TLLVMTypeRef;
  TLLVMTypeRef = PLLVMOpaqueType;
{*
 * Represents an individual value in LLVM IR.
 *
 * This models llvm::Value.
  }

  PLLVMValueRef = ^TLLVMValueRef;
  TLLVMValueRef = PLLVMOpaqueValue;
{*
 * Represents a basic block of instructions in LLVM IR.
 *
 * This models llvm::BasicBlock.
  }

  PLLVMBasicBlockRef = ^TLLVMBasicBlockRef;
  TLLVMBasicBlockRef = PLLVMOpaqueBasicBlock;
{*
 * Represents an LLVM Metadata.
 *
 * This models llvm::Metadata.
  }

  PLLVMMetadataRef = ^TLLVMMetadataRef;
  TLLVMMetadataRef = PLLVMOpaqueMetadata;
{*
 * Represents an LLVM Named Metadata Node.
 *
 * This models llvm::NamedMDNode.
  }

  PLLVMNamedMDNodeRef = ^TLLVMNamedMDNodeRef;
  TLLVMNamedMDNodeRef = PLLVMOpaqueNamedMDNode;
{*
 * Represents an entry in a Global Object's metadata attachments.
 *
 * This models std::pair<unsigned, MDNode *>
  }
  TLLVMOpaqueValueMetadataEntry = TLLVMValueMetadataEntry;
{*
 * Represents an LLVM basic block builder.
 *
 * This models llvm::IRBuilder.
  }

  PLLVMBuilderRef = ^TLLVMBuilderRef;
  TLLVMBuilderRef = PLLVMOpaqueBuilder;
{*
 * Represents an LLVM debug info builder.
 *
 * This models llvm::DIBuilder.
  }

  PLLVMDIBuilderRef = ^TLLVMDIBuilderRef;
  TLLVMDIBuilderRef = PLLVMOpaqueDIBuilder;
{*
 * Interface used to provide a module to JIT or interpreter.
 * This is now just a synonym for llvm::Module, but we have to keep using the
 * different type to keep binary compatibility.
  }

  PLLVMModuleProviderRef = ^TLLVMModuleProviderRef;
  TLLVMModuleProviderRef = PLLVMOpaqueModuleProvider;
{* @see llvm::PassManagerBase  }

  PLLVMPassManagerRef = ^TLLVMPassManagerRef;
  TLLVMPassManagerRef = PLLVMOpaquePassManager;
{*
 * Used to get the users and usees of a Value.
 *
 * @see llvm::Use  }

  PLLVMUseRef = ^TLLVMUseRef;
  TLLVMUseRef = PLLVMOpaqueUse;
{*
 * @see llvm::OperandBundleDef
  }

  PLLVMOperandBundleRef = ^TLLVMOperandBundleRef;
  TLLVMOperandBundleRef = PLLVMOpaqueOperandBundle;
{*
 * Used to represent an attributes.
 *
 * @see llvm::Attribute
  }

  PLLVMAttributeRef = ^TLLVMAttributeRef;
  TLLVMAttributeRef = PLLVMOpaqueAttributeRef;
{*
 * @see llvm::DiagnosticInfo
  }

  PLLVMDiagnosticInfoRef = ^TLLVMDiagnosticInfoRef;
  TLLVMDiagnosticInfoRef = PLLVMOpaqueDiagnosticInfo;
{*
 * @see llvm::Comdat
  }

  PLLVMComdatRef = ^TLLVMComdatRef;
  TLLVMComdatRef = PLLVMComdat;
{*
 * @see llvm::Module::ModuleFlagEntry
  }
  TLLVMOpaqueModuleFlagEntry = TLLVMModuleFlagEntry;
{*
 * @see llvm::JITEventListener
  }

  PLLVMJITEventListenerRef = ^TLLVMJITEventListenerRef;
  TLLVMJITEventListenerRef = PLLVMOpaqueJITEventListener;
{*
 * @see llvm::object::Binary
  }

  PLLVMBinaryRef = ^TLLVMBinaryRef;
  TLLVMBinaryRef = PLLVMOpaqueBinary;
{*
 * @see llvm::DbgRecord
  }

  PLLVMDbgRecordRef = ^TLLVMDbgRecordRef;
  TLLVMDbgRecordRef = PLLVMOpaqueDbgRecord;
{*
 * @
  }
{$endif}

implementation


end.
