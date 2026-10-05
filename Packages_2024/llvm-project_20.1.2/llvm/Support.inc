{$IFDEF read_interface}


function LLVMLoadLibraryPermanently(Filename: pchar): TLLVMBool; cdecl; external libllvm;
procedure LLVMParseCommandLineOptions(argc: longint; argv: PPchar; Overview: pchar); cdecl; external libllvm;
function LLVMSearchForAddressOfSymbol(symbolName: pchar): pointer; cdecl; external libllvm;
procedure LLVMAddSymbol(symbolName: pchar; symbolValue: pointer); cdecl; external libllvm;

// === Konventiert am: 20-9-26 17:11:06 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
