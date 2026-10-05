{$IFDEF read_interface}


type
  PLLVMBool = ^TLLVMBool;
  TLLVMBool = Boolean32;

  TLLVMMemoryBufferRef = type Pointer;
  PLLVMMemoryBufferRef = ^TLLVMMemoryBufferRef;

  TLLVMContextRef = type Pointer;
  PLLVMContextRef = ^TLLVMContextRef;

  TLLVMModuleRef = type Pointer;
  PLLVMModuleRef = ^TLLVMModuleRef;

  TLLVMTypeRef = type Pointer;
  PLLVMTypeRef = ^TLLVMTypeRef;

  TLLVMValueRef = type Pointer;
  PLLVMValueRef = ^TLLVMValueRef;

  TLLVMBasicBlockRef = type Pointer;
  PLLVMBasicBlockRef = ^TLLVMBasicBlockRef;

  TLLVMMetadataRef = type Pointer;
  PLLVMMetadataRef = ^TLLVMMetadataRef;

  TLLVMNamedMDNodeRef = type Pointer;
  PLLVMNamedMDNodeRef = ^TLLVMNamedMDNodeRef;

  TLLVMValueMetadataEntry = type Pointer;
  PLLVMValueMetadataEntry = ^TLLVMValueMetadataEntry;

  TLLVMModuleFlagEntry = type Pointer;
  PLLVMModuleFlagEntry = ^TLLVMModuleFlagEntry;

  TLLVMBuilderRef = type Pointer;
  PLLVMBuilderRef = ^TLLVMBuilderRef;

  TLLVMDIBuilderRef = type Pointer;
  PLLVMDIBuilderRef = ^TLLVMDIBuilderRef;

  TLLVMModuleProviderRef = type Pointer;
  PLLVMModuleProviderRef = ^TLLVMModuleProviderRef;

  TLLVMPassManagerRef = type Pointer;
  PLLVMPassManagerRef = ^TLLVMPassManagerRef;

  TLLVMUseRef = type Pointer;
  PLLVMUseRef = ^TLLVMUseRef;

  TLLVMOperandBundleRef = type Pointer;
  PLLVMOperandBundleRef = ^TLLVMOperandBundleRef;

  TLLVMAttributeRef = type Pointer;
  PLLVMAttributeRef = ^TLLVMAttributeRef;

  TLLVMDiagnosticInfoRef = type Pointer;
  PLLVMDiagnosticInfoRef = ^TLLVMDiagnosticInfoRef;

  TLLVMComdatRef = type Pointer;
  PLLVMComdatRef = ^TLLVMComdatRef;

  TLLVMDbgRecordRef = type Pointer;
  PLLVMDbgRecordRef = ^TLLVMDbgRecordRef;

  TLLVMBinaryRef = type Pointer;
  PLLVMBinaryRef = ^TLLVMBinaryRef;

  TLLVMJITEventListenerRef = type Pointer;
  PLLVMJITEventListenerRef = ^TLLVMJITEventListenerRef;

  // === Konventiert am: 20-9-26 17:10:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
