unit Types;

interface

uses
  fp_llvm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  PLLVMBool = ^TLLVMBool;
  TLLVMBool = Boolean32;

  PLLVMMemoryBufferRef = ^TLLVMMemoryBufferRef;
  TLLVMMemoryBufferRef = PLLVMOpaqueMemoryBuffer;

  PLLVMContextRef = ^TLLVMContextRef;
  TLLVMContextRef = PLLVMOpaqueContext;

  PLLVMModuleRef = ^TLLVMModuleRef;
  TLLVMModuleRef = PLLVMOpaqueModule;

  PLLVMTypeRef = ^TLLVMTypeRef;
  TLLVMTypeRef = PLLVMOpaqueType;

  PLLVMValueRef = ^TLLVMValueRef;
  TLLVMValueRef = PLLVMOpaqueValue;

  PLLVMBasicBlockRef = ^TLLVMBasicBlockRef;
  TLLVMBasicBlockRef = PLLVMOpaqueBasicBlock;

  PLLVMMetadataRef = ^TLLVMMetadataRef;
  TLLVMMetadataRef = PLLVMOpaqueMetadata;

  PLLVMNamedMDNodeRef = ^TLLVMNamedMDNodeRef;
  TLLVMNamedMDNodeRef = PLLVMOpaqueNamedMDNode;

  TLLVMOpaqueValueMetadataEntry = TLLVMValueMetadataEntry;

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

// === Konventiert am: 20-9-26 17:10:59 ===


implementation



end.
