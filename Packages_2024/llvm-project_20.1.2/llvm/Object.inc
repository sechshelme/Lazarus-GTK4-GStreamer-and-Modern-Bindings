{$IFDEF read_interface}


type
  PLLVMSectionIteratorRef = ^TLLVMSectionIteratorRef;
  TLLVMSectionIteratorRef = type Pointer;

  PLLVMSymbolIteratorRef = ^TLLVMSymbolIteratorRef;
  TLLVMSymbolIteratorRef = type Pointer;

  PLLVMRelocationIteratorRef = ^TLLVMRelocationIteratorRef;
  TLLVMRelocationIteratorRef = type Pointer;

type
  PLLVMBinaryType = ^TLLVMBinaryType;
  TLLVMBinaryType = longint;
const
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

function LLVMCreateBinary(MemBuf: TLLVMMemoryBufferRef; Context: TLLVMContextRef; ErrorMessage: PPchar): TLLVMBinaryRef; cdecl; external libllvm;
procedure LLVMDisposeBinary(BR: TLLVMBinaryRef); cdecl; external libllvm;
function LLVMBinaryCopyMemoryBuffer(BR: TLLVMBinaryRef): TLLVMMemoryBufferRef; cdecl; external libllvm;
function LLVMBinaryGetType(BR: TLLVMBinaryRef): TLLVMBinaryType; cdecl; external libllvm;
function LLVMMachOUniversalBinaryCopyObjectForArch(BR: TLLVMBinaryRef; Arch: pchar; ArchLen: Tsize_t; ErrorMessage: PPchar): TLLVMBinaryRef; cdecl; external libllvm;
function LLVMObjectFileCopySectionIterator(BR: TLLVMBinaryRef): TLLVMSectionIteratorRef; cdecl; external libllvm;
function LLVMObjectFileIsSectionIteratorAtEnd(BR: TLLVMBinaryRef; SI: TLLVMSectionIteratorRef): TLLVMBool; cdecl; external libllvm;
function LLVMObjectFileCopySymbolIterator(BR: TLLVMBinaryRef): TLLVMSymbolIteratorRef; cdecl; external libllvm;
function LLVMObjectFileIsSymbolIteratorAtEnd(BR: TLLVMBinaryRef; SI: TLLVMSymbolIteratorRef): TLLVMBool; cdecl; external libllvm;
procedure LLVMDisposeSectionIterator(SI: TLLVMSectionIteratorRef); cdecl; external libllvm;
procedure LLVMMoveToNextSection(SI: TLLVMSectionIteratorRef); cdecl; external libllvm;
procedure LLVMMoveToContainingSection(Sect: TLLVMSectionIteratorRef; Sym: TLLVMSymbolIteratorRef); cdecl; external libllvm;
procedure LLVMDisposeSymbolIterator(SI: TLLVMSymbolIteratorRef); cdecl; external libllvm;
procedure LLVMMoveToNextSymbol(SI: TLLVMSymbolIteratorRef); cdecl; external libllvm;
function LLVMGetSectionName(SI: TLLVMSectionIteratorRef): pchar; cdecl; external libllvm;
function LLVMGetSectionSize(SI: TLLVMSectionIteratorRef): Tuint64_t; cdecl; external libllvm;
function LLVMGetSectionContents(SI: TLLVMSectionIteratorRef): pchar; cdecl; external libllvm;
function LLVMGetSectionAddress(SI: TLLVMSectionIteratorRef): Tuint64_t; cdecl; external libllvm;
function LLVMGetSectionContainsSymbol(SI: TLLVMSectionIteratorRef; Sym: TLLVMSymbolIteratorRef): TLLVMBool; cdecl; external libllvm;
function LLVMGetRelocations(Section: TLLVMSectionIteratorRef): TLLVMRelocationIteratorRef; cdecl; external libllvm;
procedure LLVMDisposeRelocationIterator(RI: TLLVMRelocationIteratorRef); cdecl; external libllvm;
function LLVMIsRelocationIteratorAtEnd(Section: TLLVMSectionIteratorRef; RI: TLLVMRelocationIteratorRef): TLLVMBool; cdecl; external libllvm;
procedure LLVMMoveToNextRelocation(RI: TLLVMRelocationIteratorRef); cdecl; external libllvm;
function LLVMGetSymbolName(SI: TLLVMSymbolIteratorRef): pchar; cdecl; external libllvm;
function LLVMGetSymbolAddress(SI: TLLVMSymbolIteratorRef): Tuint64_t; cdecl; external libllvm;
function LLVMGetSymbolSize(SI: TLLVMSymbolIteratorRef): Tuint64_t; cdecl; external libllvm;
function LLVMGetRelocationOffset(RI: TLLVMRelocationIteratorRef): Tuint64_t; cdecl; external libllvm;
function LLVMGetRelocationSymbol(RI: TLLVMRelocationIteratorRef): TLLVMSymbolIteratorRef; cdecl; external libllvm;
function LLVMGetRelocationType(RI: TLLVMRelocationIteratorRef): Tuint64_t; cdecl; external libllvm;
function LLVMGetRelocationTypeName(RI: TLLVMRelocationIteratorRef): pchar; cdecl; external libllvm;
function LLVMGetRelocationValueString(RI: TLLVMRelocationIteratorRef): pchar; cdecl; external libllvm;

type
  PLLVMObjectFileRef = ^TLLVMObjectFileRef;
  TLLVMObjectFileRef = type Pointer;

function LLVMCreateObjectFile(MemBuf: TLLVMMemoryBufferRef): TLLVMObjectFileRef; cdecl; external libllvm;
procedure LLVMDisposeObjectFile(ObjectFile: TLLVMObjectFileRef); cdecl; external libllvm;
function LLVMGetSections(ObjectFile: TLLVMObjectFileRef): TLLVMSectionIteratorRef; cdecl; external libllvm;
function LLVMIsSectionIteratorAtEnd(ObjectFile: TLLVMObjectFileRef; SI: TLLVMSectionIteratorRef): TLLVMBool; cdecl; external libllvm;
function LLVMGetSymbols(ObjectFile: TLLVMObjectFileRef): TLLVMSymbolIteratorRef; cdecl; external libllvm;
function LLVMIsSymbolIteratorAtEnd(ObjectFile: TLLVMObjectFileRef; SI: TLLVMSymbolIteratorRef): TLLVMBool; cdecl; external libllvm;

// === Konventiert am: 20-9-26 17:11:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
