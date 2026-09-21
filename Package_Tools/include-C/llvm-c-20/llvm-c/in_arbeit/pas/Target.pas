unit Target;

interface

uses
  fp_llvm, Types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TLLVMByteOrdering = longint;
const
  LLVMBigEndian = 0;
  LLVMLittleEndian = 1;

type
  PLLVMTargetDataRef = ^TLLVMTargetDataRef;
  TLLVMTargetDataRef = type Pointer;

  PLLVMTargetLibraryInfoRef = ^TLLVMTargetLibraryInfoRef;
  TLLVMTargetLibraryInfoRef = type Pointer;

procedure LLVMInitializeAArch64TargetInfo; cdecl; external libllvm;
procedure LLVMInitializeAMDGPUTargetInfo; cdecl; external libllvm;
procedure LLVMInitializeARMTargetInfo; cdecl; external libllvm;
procedure LLVMInitializeAVRTargetInfo; cdecl; external libllvm;
procedure LLVMInitializeBPFTargetInfo; cdecl; external libllvm;
procedure LLVMInitializeHexagonTargetInfo; cdecl; external libllvm;
procedure LLVMInitializeLanaiTargetInfo; cdecl; external libllvm;
procedure LLVMInitializeLoongArchTargetInfo; cdecl; external libllvm;
procedure LLVMInitializeMipsTargetInfo; cdecl; external libllvm;
procedure LLVMInitializeMSP430TargetInfo; cdecl; external libllvm;
procedure LLVMInitializeNVPTXTargetInfo; cdecl; external libllvm;
procedure LLVMInitializePowerPCTargetInfo; cdecl; external libllvm;
procedure LLVMInitializeRISCVTargetInfo; cdecl; external libllvm;
procedure LLVMInitializeSparcTargetInfo; cdecl; external libllvm;
procedure LLVMInitializeSPIRVTargetInfo; cdecl; external libllvm;
procedure LLVMInitializeSystemZTargetInfo; cdecl; external libllvm;
procedure LLVMInitializeVETargetInfo; cdecl; external libllvm;
procedure LLVMInitializeWebAssemblyTargetInfo; cdecl; external libllvm;
procedure LLVMInitializeX86TargetInfo; cdecl; external libllvm;
procedure LLVMInitializeXCoreTargetInfo; cdecl; external libllvm;
procedure LLVMInitializeM68kTargetInfo; cdecl; external libllvm;
procedure LLVMInitializeXtensaTargetInfo; cdecl; external libllvm;

procedure LLVMInitializeAArch64Target; cdecl; external libllvm;
procedure LLVMInitializeAMDGPUTarget; cdecl; external libllvm;
procedure LLVMInitializeARMTarget; cdecl; external libllvm;
procedure LLVMInitializeAVRTarget; cdecl; external libllvm;
procedure LLVMInitializeBPFTarget; cdecl; external libllvm;
procedure LLVMInitializeHexagonTarget; cdecl; external libllvm;
procedure LLVMInitializeLanaiTarget; cdecl; external libllvm;
procedure LLVMInitializeLoongArchTarget; cdecl; external libllvm;
procedure LLVMInitializeMipsTarget; cdecl; external libllvm;
procedure LLVMInitializeMSP430Target; cdecl; external libllvm;
procedure LLVMInitializeNVPTXTarget; cdecl; external libllvm;
procedure LLVMInitializePowerPCTarget; cdecl; external libllvm;
procedure LLVMInitializeRISCVTarget; cdecl; external libllvm;
procedure LLVMInitializeSparcTarget; cdecl; external libllvm;
procedure LLVMInitializeSPIRVTarget; cdecl; external libllvm;
procedure LLVMInitializeSystemZTarget; cdecl; external libllvm;
procedure LLVMInitializeVETarget; cdecl; external libllvm;
procedure LLVMInitializeWebAssemblyTarget; cdecl; external libllvm;
procedure LLVMInitializeX86Target; cdecl; external libllvm;
procedure LLVMInitializeXCoreTarget; cdecl; external libllvm;
procedure LLVMInitializeM68kTarget; cdecl; external libllvm;
procedure LLVMInitializeXtensaTarget; cdecl; external libllvm;

procedure LLVMInitializeAArch64TargetMC; cdecl; external libllvm;
procedure LLVMInitializeAMDGPUTargetMC; cdecl; external libllvm;
procedure LLVMInitializeARMTargetMC; cdecl; external libllvm;
procedure LLVMInitializeAVRTargetMC; cdecl; external libllvm;
procedure LLVMInitializeBPFTargetMC; cdecl; external libllvm;
procedure LLVMInitializeHexagonTargetMC; cdecl; external libllvm;
procedure LLVMInitializeLanaiTargetMC; cdecl; external libllvm;
procedure LLVMInitializeLoongArchTargetMC; cdecl; external libllvm;
procedure LLVMInitializeMipsTargetMC; cdecl; external libllvm;
procedure LLVMInitializeMSP430TargetMC; cdecl; external libllvm;
procedure LLVMInitializeNVPTXTargetMC; cdecl; external libllvm;
procedure LLVMInitializePowerPCTargetMC; cdecl; external libllvm;
procedure LLVMInitializeRISCVTargetMC; cdecl; external libllvm;
procedure LLVMInitializeSparcTargetMC; cdecl; external libllvm;
procedure LLVMInitializeSPIRVTargetMC; cdecl; external libllvm;
procedure LLVMInitializeSystemZTargetMC; cdecl; external libllvm;
procedure LLVMInitializeVETargetMC; cdecl; external libllvm;
procedure LLVMInitializeWebAssemblyTargetMC; cdecl; external libllvm;
procedure LLVMInitializeX86TargetMC; cdecl; external libllvm;
procedure LLVMInitializeXCoreTargetMC; cdecl; external libllvm;
procedure LLVMInitializeM68kTargetMC; cdecl; external libllvm;
procedure LLVMInitializeXtensaTargetMC; cdecl; external libllvm;

procedure LLVMInitializeAArch64AsmPrinter; cdecl; external libllvm;
procedure LLVMInitializeAMDGPUAsmPrinter; cdecl; external libllvm;
procedure LLVMInitializeARMAsmPrinter; cdecl; external libllvm;
procedure LLVMInitializeAVRAsmPrinter; cdecl; external libllvm;
procedure LLVMInitializeBPFAsmPrinter; cdecl; external libllvm;
procedure LLVMInitializeHexagonAsmPrinter; cdecl; external libllvm;
procedure LLVMInitializeLanaiAsmPrinter; cdecl; external libllvm;
procedure LLVMInitializeLoongArchAsmPrinter; cdecl; external libllvm;
procedure LLVMInitializeMipsAsmPrinter; cdecl; external libllvm;
procedure LLVMInitializeMSP430AsmPrinter; cdecl; external libllvm;
procedure LLVMInitializeNVPTXAsmPrinter; cdecl; external libllvm;
procedure LLVMInitializePowerPCAsmPrinter; cdecl; external libllvm;
procedure LLVMInitializeRISCVAsmPrinter; cdecl; external libllvm;
procedure LLVMInitializeSparcAsmPrinter; cdecl; external libllvm;
procedure LLVMInitializeSPIRVAsmPrinter; cdecl; external libllvm;
procedure LLVMInitializeSystemZAsmPrinter; cdecl; external libllvm;
procedure LLVMInitializeVEAsmPrinter; cdecl; external libllvm;
procedure LLVMInitializeWebAssemblyAsmPrinter; cdecl; external libllvm;
procedure LLVMInitializeX86AsmPrinter; cdecl; external libllvm;
procedure LLVMInitializeXCoreAsmPrinter; cdecl; external libllvm;
procedure LLVMInitializeM68kAsmPrinter; cdecl; external libllvm;
procedure LLVMInitializeXtensaAsmPrinter; cdecl; external libllvm;

procedure LLVMInitializeAArch64AsmParser; cdecl; external libllvm;
procedure LLVMInitializeAMDGPUAsmParser; cdecl; external libllvm;
procedure LLVMInitializeARMAsmParser; cdecl; external libllvm;
procedure LLVMInitializeAVRAsmParser; cdecl; external libllvm;
procedure LLVMInitializeBPFAsmParser; cdecl; external libllvm;
procedure LLVMInitializeHexagonAsmParser; cdecl; external libllvm;
procedure LLVMInitializeLanaiAsmParser; cdecl; external libllvm;
procedure LLVMInitializeLoongArchAsmParser; cdecl; external libllvm;
procedure LLVMInitializeMipsAsmParser; cdecl; external libllvm;
procedure LLVMInitializeMSP430AsmParser; cdecl; external libllvm;
procedure LLVMInitializeNVPTXAsmParser; cdecl; external libllvm;
procedure LLVMInitializePowerPCAsmParser; cdecl; external libllvm;
procedure LLVMInitializeRISCVAsmParser; cdecl; external libllvm;
procedure LLVMInitializeSparcAsmParser; cdecl; external libllvm;
procedure LLVMInitializeSystemZAsmParser; cdecl; external libllvm;
procedure LLVMInitializeVEAsmParser; cdecl; external libllvm;
procedure LLVMInitializeWebAssemblyAsmParser; cdecl; external libllvm;
procedure LLVMInitializeX86AsmParser; cdecl; external libllvm;
procedure LLVMInitializeXCoreAsmParser; cdecl; external libllvm;
procedure LLVMInitializeM68kAsmParser; cdecl; external libllvm;
procedure LLVMInitializeXtensaAsmParser; cdecl; external libllvm;

procedure LLVMInitializeAArch64Disassembler; cdecl; external libllvm;
procedure LLVMInitializeAMDGPUDisassembler; cdecl; external libllvm;
procedure LLVMInitializeARMDisassembler; cdecl; external libllvm;
procedure LLVMInitializeAVRDisassembler; cdecl; external libllvm;
procedure LLVMInitializeBPFDisassembler; cdecl; external libllvm;
procedure LLVMInitializeHexagonDisassembler; cdecl; external libllvm;
procedure LLVMInitializeLanaiDisassembler; cdecl; external libllvm;
procedure LLVMInitializeLoongArchDisassembler; cdecl; external libllvm;
procedure LLVMInitializeMipsDisassembler; cdecl; external libllvm;
procedure LLVMInitializeMSP430Disassembler; cdecl; external libllvm;
procedure LLVMInitializePowerPCDisassembler; cdecl; external libllvm;
procedure LLVMInitializeRISCVDisassembler; cdecl; external libllvm;
procedure LLVMInitializeSparcDisassembler; cdecl; external libllvm;
procedure LLVMInitializeSystemZDisassembler; cdecl; external libllvm;
procedure LLVMInitializeVEDisassembler; cdecl; external libllvm;
procedure LLVMInitializeWebAssemblyDisassembler; cdecl; external libllvm;
procedure LLVMInitializeX86Disassembler; cdecl; external libllvm;
procedure LLVMInitializeXCoreDisassembler; cdecl; external libllvm;
procedure LLVMInitializeM68kDisassembler; cdecl; external libllvm;
procedure LLVMInitializeXtensaDisassembler; cdecl; external libllvm;

procedure LLVMInitializeAllTargetInfos; inline;
procedure LLVMInitializeAllTargets; inline;
procedure LLVMInitializeAllTargetMCs; inline;
procedure LLVMInitializeAllAsmPrinters; inline;
procedure LLVMInitializeAllAsmParsers; inline;
procedure LLVMInitializeAllDisassemblers; inline;

function LLVMInitializeNativeTarget: longbool; inline;
function LLVMInitializeNativeAsmParser: longbool; inline;
function LLVMInitializeNativeAsmPrinter: longbool; inline;
function LLVMInitializeNativeDisassembler: longbool; inline;

function LLVMGetModuleDataLayout(M: TLLVMModuleRef): TLLVMTargetDataRef; cdecl; external libllvm;
procedure LLVMSetModuleDataLayout(M: TLLVMModuleRef; DL: TLLVMTargetDataRef); cdecl; external libllvm;
function LLVMCreateTargetData(StringRep: pchar): TLLVMTargetDataRef; cdecl; external libllvm;
procedure LLVMDisposeTargetData(TD: TLLVMTargetDataRef); cdecl; external libllvm;
procedure LLVMAddTargetLibraryInfo(TLI: TLLVMTargetLibraryInfoRef; PM: TLLVMPassManagerRef); cdecl; external libllvm;
function LLVMCopyStringRepOfTargetData(TD: TLLVMTargetDataRef): pchar; cdecl; external libllvm;
function LLVMByteOrder(TD: TLLVMTargetDataRef): TLLVMByteOrdering; cdecl; external libllvm;
function LLVMPointerSize(TD: TLLVMTargetDataRef): dword; cdecl; external libllvm;
function LLVMPointerSizeForAS(TD: TLLVMTargetDataRef; AS_: dword): dword; cdecl; external libllvm;
function LLVMIntPtrType(TD: TLLVMTargetDataRef): TLLVMTypeRef; cdecl; external libllvm;
function LLVMIntPtrTypeForAS(TD: TLLVMTargetDataRef; AS_: dword): TLLVMTypeRef; cdecl; external libllvm;
function LLVMIntPtrTypeInContext(C: TLLVMContextRef; TD: TLLVMTargetDataRef): TLLVMTypeRef; cdecl; external libllvm;
function LLVMIntPtrTypeForASInContext(C: TLLVMContextRef; TD: TLLVMTargetDataRef; AS_: dword): TLLVMTypeRef; cdecl; external libllvm;
function LLVMSizeOfTypeInBits(TD: TLLVMTargetDataRef; Ty: TLLVMTypeRef): qword; cdecl; external libllvm;
function LLVMStoreSizeOfType(TD: TLLVMTargetDataRef; Ty: TLLVMTypeRef): qword; cdecl; external libllvm;
function LLVMABISizeOfType(TD: TLLVMTargetDataRef; Ty: TLLVMTypeRef): qword; cdecl; external libllvm;
function LLVMABIAlignmentOfType(TD: TLLVMTargetDataRef; Ty: TLLVMTypeRef): dword; cdecl; external libllvm;
function LLVMCallFrameAlignmentOfType(TD: TLLVMTargetDataRef; Ty: TLLVMTypeRef): dword; cdecl; external libllvm;
function LLVMPreferredAlignmentOfType(TD: TLLVMTargetDataRef; Ty: TLLVMTypeRef): dword; cdecl; external libllvm;
function LLVMPreferredAlignmentOfGlobal(TD: TLLVMTargetDataRef; GlobalVar: TLLVMValueRef): dword; cdecl; external libllvm;
function LLVMElementAtOffset(TD: TLLVMTargetDataRef; StructTy: TLLVMTypeRef; Offset: qword): dword; cdecl; external libllvm;
function LLVMOffsetOfElement(TD: TLLVMTargetDataRef; StructTy: TLLVMTypeRef; Element: dword): qword; cdecl; external libllvm;

// === Konventiert am: 20-9-26 17:11:04 ===


implementation

procedure LLVMInitializeAllTargetInfos; inline;
begin
  LLVMInitializeAArch64TargetInfo;
  LLVMInitializeAMDGPUTargetInfo;
  LLVMInitializeARMTargetInfo;
  LLVMInitializeAVRTargetInfo;
  LLVMInitializeBPFTargetInfo;
  LLVMInitializeHexagonTargetInfo;
  LLVMInitializeLanaiTargetInfo;
  LLVMInitializeLoongArchTargetInfo;
  LLVMInitializeMipsTargetInfo;
  LLVMInitializeMSP430TargetInfo;
  LLVMInitializeNVPTXTargetInfo;
  LLVMInitializePowerPCTargetInfo;
  LLVMInitializeRISCVTargetInfo;
  LLVMInitializeSparcTargetInfo;
  LLVMInitializeSPIRVTargetInfo;
  LLVMInitializeSystemZTargetInfo;
  LLVMInitializeVETargetInfo;
  LLVMInitializeWebAssemblyTargetInfo;
  LLVMInitializeX86TargetInfo;
  LLVMInitializeXCoreTargetInfo;
  LLVMInitializeM68kTargetInfo;
  LLVMInitializeXtensaTargetInfo;
end;

procedure LLVMInitializeAllTargets; inline;
begin
  LLVMInitializeAArch64Target;
  LLVMInitializeAMDGPUTarget;
  LLVMInitializeARMTarget;
  LLVMInitializeAVRTarget;
  LLVMInitializeBPFTarget;
  LLVMInitializeHexagonTarget;
  LLVMInitializeLanaiTarget;
  LLVMInitializeLoongArchTarget;
  LLVMInitializeMipsTarget;
  LLVMInitializeMSP430Target;
  LLVMInitializeNVPTXTarget;
  LLVMInitializePowerPCTarget;
  LLVMInitializeRISCVTarget;
  LLVMInitializeSparcTarget;
  LLVMInitializeSPIRVTarget;
  LLVMInitializeSystemZTarget;
  LLVMInitializeVETarget;
  LLVMInitializeWebAssemblyTarget;
  LLVMInitializeX86Target;
  LLVMInitializeXCoreTarget;
  LLVMInitializeM68kTarget;
  LLVMInitializeXtensaTarget;
end;

procedure LLVMInitializeAllTargetMCs; inline;
begin
  LLVMInitializeAArch64TargetMC;
  LLVMInitializeAMDGPUTargetMC;
  LLVMInitializeARMTargetMC;
  LLVMInitializeAVRTargetMC;
  LLVMInitializeBPFTargetMC;
  LLVMInitializeHexagonTargetMC;
  LLVMInitializeLanaiTargetMC;
  LLVMInitializeLoongArchTargetMC;
  LLVMInitializeMipsTargetMC;
  LLVMInitializeMSP430TargetMC;
  LLVMInitializeNVPTXTargetMC;
  LLVMInitializePowerPCTargetMC;
  LLVMInitializeRISCVTargetMC;
  LLVMInitializeSparcTargetMC;
  LLVMInitializeSPIRVTargetMC;
  LLVMInitializeSystemZTargetMC;
  LLVMInitializeVETargetMC;
  LLVMInitializeWebAssemblyTargetMC;
  LLVMInitializeX86TargetMC;
  LLVMInitializeXCoreTargetMC;
  LLVMInitializeM68kTargetMC;
  LLVMInitializeXtensaTargetMC;
end;

procedure LLVMInitializeAllAsmPrinters; inline;
begin
  LLVMInitializeAArch64AsmPrinter;
  LLVMInitializeAMDGPUAsmPrinter;
  LLVMInitializeARMAsmPrinter;
  LLVMInitializeAVRAsmPrinter;
  LLVMInitializeBPFAsmPrinter;
  LLVMInitializeHexagonAsmPrinter;
  LLVMInitializeLanaiAsmPrinter;
  LLVMInitializeLoongArchAsmPrinter;
  LLVMInitializeMipsAsmPrinter;
  LLVMInitializeMSP430AsmPrinter;
  LLVMInitializeNVPTXAsmPrinter;
  LLVMInitializePowerPCAsmPrinter;
  LLVMInitializeRISCVAsmPrinter;
  LLVMInitializeSparcAsmPrinter;
  LLVMInitializeSPIRVAsmPrinter;
  LLVMInitializeSystemZAsmPrinter;
  LLVMInitializeVEAsmPrinter;
  LLVMInitializeWebAssemblyAsmPrinter;
  LLVMInitializeX86AsmPrinter;
  LLVMInitializeXCoreAsmPrinter;
  LLVMInitializeM68kAsmPrinter;
  LLVMInitializeXtensaAsmPrinter;
end;

procedure LLVMInitializeAllAsmParsers; inline;
begin
  LLVMInitializeAArch64AsmParser;
  LLVMInitializeAMDGPUAsmParser;
  LLVMInitializeARMAsmParser;
  LLVMInitializeAVRAsmParser;
  LLVMInitializeBPFAsmParser;
  LLVMInitializeHexagonAsmParser;
  LLVMInitializeLanaiAsmParser;
  LLVMInitializeLoongArchAsmParser;
  LLVMInitializeMipsAsmParser;
  LLVMInitializeMSP430AsmParser;
  LLVMInitializeNVPTXAsmParser;
  LLVMInitializePowerPCAsmParser;
  LLVMInitializeRISCVAsmParser;
  LLVMInitializeSparcAsmParser;
  LLVMInitializeSystemZAsmParser;
  LLVMInitializeVEAsmParser;
  LLVMInitializeWebAssemblyAsmParser;
  LLVMInitializeX86AsmParser;
  LLVMInitializeXCoreAsmParser;
  LLVMInitializeM68kAsmParser;
  LLVMInitializeXtensaAsmParser;
end;

procedure LLVMInitializeAllDisassemblers; inline;
begin
  LLVMInitializeAArch64Disassembler;
  LLVMInitializeAMDGPUDisassembler;
  LLVMInitializeARMDisassembler;
  LLVMInitializeAVRDisassembler;
  LLVMInitializeBPFDisassembler;
  LLVMInitializeHexagonDisassembler;
  LLVMInitializeLanaiDisassembler;
  LLVMInitializeLoongArchDisassembler;
  LLVMInitializeMipsDisassembler;
  LLVMInitializeMSP430Disassembler;
  LLVMInitializePowerPCDisassembler;
  LLVMInitializeRISCVDisassembler;
  LLVMInitializeSparcDisassembler;
  LLVMInitializeSystemZDisassembler;
  LLVMInitializeVEDisassembler;
  LLVMInitializeWebAssemblyDisassembler;
  LLVMInitializeX86Disassembler;
  LLVMInitializeXCoreDisassembler;
  LLVMInitializeM68kDisassembler;
  LLVMInitializeXtensaDisassembler;
end;

function LLVMInitializeNativeTarget: longbool; inline;
begin
  {$if defined(cpux86_64) or defined(cpui386)}
  LLVMInitializeX86TargetInfo;
  LLVMInitializeX86Target;
  LLVMInitializeX86TargetMC;
  {$else}
  Exit(True);
  {$endif}
end;

function LLVMInitializeNativeAsmParser: longbool; inline;
begin
  {$if defined(cpux86_64) or defined(cpui386)}
  LLVMInitializeX86AsmParser;
  Exit(False);
  {$else}
  Exit(True);
  {$endif}
end;

function LLVMInitializeNativeAsmPrinter: longbool; inline;
begin
  {$if defined(cpux86_64) or defined(cpui386)}
  LLVMInitializeX86AsmPrinter;
  Exit(False);
  {$else}
  Exit(True);
  {$endif}
end;

function LLVMInitializeNativeDisassembler: longbool; inline;
begin
  {$if defined(cpux86_64) or defined(cpui386)}
  LLVMInitializeX86Disassembler;
  Exit(False);
  {$else}
  Exit(True);
  {$endif}
end;

end.
