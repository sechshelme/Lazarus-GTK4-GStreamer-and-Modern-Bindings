unit Disassembler;

interface

uses
  fp_llvm, Types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function LLVMCreateDisasm(TripleName: pchar; DisInfo: pointer; TagType: longint; GetOpInfo: TLLVMOpInfoCallback; SymbolLookUp: TLLVMSymbolLookupCallback): TLLVMDisasmContextRef; cdecl; external libllvm;
function LLVMCreateDisasmCPU(Triple: pchar; CPU: pchar; DisInfo: pointer; TagType: longint; GetOpInfo: TLLVMOpInfoCallback;
  SymbolLookUp: TLLVMSymbolLookupCallback): TLLVMDisasmContextRef; cdecl; external libllvm;
function LLVMCreateDisasmCPUFeatures(Triple: pchar; CPU: pchar; Features: pchar; DisInfo: pointer; TagType: longint;
  GetOpInfo: TLLVMOpInfoCallback; SymbolLookUp: TLLVMSymbolLookupCallback): TLLVMDisasmContextRef; cdecl; external libllvm;
function LLVMSetDisasmOptions(DC: TLLVMDisasmContextRef; Options: Tuint64_t): longint; cdecl; external libllvm;

const
  LLVMDisassembler_Option_UseMarkup = 1;
  LLVMDisassembler_Option_PrintImmHex = 2;
  LLVMDisassembler_Option_AsmPrinterVariant = 4;
  LLVMDisassembler_Option_SetInstrComments = 8;
  LLVMDisassembler_Option_PrintLatency = 16;
  LLVMDisassembler_Option_Color = 32;

procedure LLVMDisasmDispose(DC: TLLVMDisasmContextRef); cdecl; external libllvm;
function LLVMDisasmInstruction(DC: TLLVMDisasmContextRef; Bytes: Puint8_t; BytesSize: Tuint64_t; PC: Tuint64_t; OutString: pchar;
  OutStringSize: Tsize_t): Tsize_t; cdecl; external libllvm;

// === Konventiert am: 20-9-26 15:59:53 ===


implementation



end.
