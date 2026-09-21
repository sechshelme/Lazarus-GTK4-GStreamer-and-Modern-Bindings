{$IFDEF read_interface}


type
  PLLVMDisasmContextRef = ^TLLVMDisasmContextRef;
  TLLVMDisasmContextRef = pointer;

  TLLVMOpInfoCallback = function(DisInfo: pointer; PC: Tuint64_t; Offset: Tuint64_t; OpSize: Tuint64_t; InstSize: Tuint64_t;
    TagType: longint; TagBuf: pointer): longint; cdecl;

  PLLVMOpInfoSymbol1 = ^TLLVMOpInfoSymbol1;
  TLLVMOpInfoSymbol1 = record
    Present: Tuint64_t;
    Name: pchar;
    Value: Tuint64_t;
  end;

  PLLVMOpInfo1 = ^TLLVMOpInfo1;
  TLLVMOpInfo1 = record
    AddSymbol: TLLVMOpInfoSymbol1;
    SubtractSymbol: TLLVMOpInfoSymbol1;
    Value: Tuint64_t;
    VariantKind: Tuint64_t;
  end;

const
  LLVMDisassembler_VariantKind_None = 0;
  LLVMDisassembler_VariantKind_ARM_HI16 = 1;
  LLVMDisassembler_VariantKind_ARM_LO16 = 2;
  LLVMDisassembler_VariantKind_ARM64_PAGE = 1;
  LLVMDisassembler_VariantKind_ARM64_PAGEOFF = 2;
  LLVMDisassembler_VariantKind_ARM64_GOTPAGE = 3;
  LLVMDisassembler_VariantKind_ARM64_GOTPAGEOFF = 4;
  LLVMDisassembler_VariantKind_ARM64_TLVP = 5;
  LLVMDisassembler_VariantKind_ARM64_TLVOFF = 6;

type
  TLLVMSymbolLookupCallback = function(DisInfo: pointer; ReferenceValue: Tuint64_t; ReferenceType: Puint64_t; ReferencePC: Tuint64_t; ReferenceName: PPchar): pchar; cdecl;

const
  LLVMDisassembler_ReferenceType_InOut_None = 0;
  LLVMDisassembler_ReferenceType_In_Branch = 1;
  LLVMDisassembler_ReferenceType_In_PCrel_Load = 2;
  LLVMDisassembler_ReferenceType_In_ARM64_ADRP = $100000001;
  LLVMDisassembler_ReferenceType_In_ARM64_ADDXri = $100000002;
  LLVMDisassembler_ReferenceType_In_ARM64_LDRXui = $100000003;
  LLVMDisassembler_ReferenceType_In_ARM64_LDRXl = $100000004;
  LLVMDisassembler_ReferenceType_In_ARM64_ADR = $100000005;
  LLVMDisassembler_ReferenceType_Out_SymbolStub = 1;
  LLVMDisassembler_ReferenceType_Out_LitPool_SymAddr = 2;
  LLVMDisassembler_ReferenceType_Out_LitPool_CstrAddr = 3;
  LLVMDisassembler_ReferenceType_Out_Objc_CFString_Ref = 4;
  LLVMDisassembler_ReferenceType_Out_Objc_Message = 5;
  LLVMDisassembler_ReferenceType_Out_Objc_Message_Ref = 6;
  LLVMDisassembler_ReferenceType_Out_Objc_Selector_Ref = 7;
  LLVMDisassembler_ReferenceType_Out_Objc_Class_Ref = 8;
  LLVMDisassembler_ReferenceType_DeMangled_Name = 9;

  // === Konventiert am: 20-9-26 17:06:28 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
