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

  TLLVMMemoryBufferRef = type Pointer;
  PLLVMMemoryBufferRef=^TLLVMMemoryBufferRef;
  TLLVMContextRef = type Pointer;
  TLLVMModuleRef = type Pointer;
  PLLVMModuleRef=^TLLVMModuleRef;
  TLLVMTypeRef = type Pointer;
  PLLVMTypeRef=^TLLVMTypeRef;
  TLLVMValueRef = type Pointer;
  PLLVMValueRef=^TLLVMValueRef;
  TLLVMBasicBlockRef = type Pointer;
  PLLVMBasicBlockRef=^TLLVMBasicBlockRef;
  TLLVMMetadataRef = type Pointer;
  PLLVMMetadataRef=^TLLVMMetadataRef;
  TLLVMNamedMDNodeRef = type Pointer;

  TLLVMValueMetadataEntry = type Pointer;
  PLLVMValueMetadataEntry=^TLLVMValueMetadataEntry;

  TLLVMBuilderRef = type Pointer;
  TLLVMDIBuilderRef = type Pointer;
  TLLVMModuleProviderRef = type Pointer;
  TLLVMPassManagerRef = type Pointer;
  TLLVMUseRef = type Pointer;
  TLLVMOperandBundleRef = type Pointer;
  PLLVMOperandBundleRef=^TLLVMOperandBundleRef;
  TLLVMAttributeRef = type Pointer;
  PLLVMAttributeRef=^TLLVMAttributeRef;
  TLLVMDiagnosticInfoRef = type Pointer;

  PLLVMComdatRef = ^TLLVMComdatRef;
  TLLVMComdatRef = type Pointer;

  TLLVMModuleFlagEntry = type Pointer;
  PLLVMModuleFlagEntry=^TLLVMModuleFlagEntry;

  TLLVMJITEventListenerRef = type Pointer;
  TLLVMBinaryRef = type Pointer;
  TLLVMDbgRecordRef = type Pointer;

  // === Konventiert am: 20-9-26 17:10:59 ===


implementation



end.
