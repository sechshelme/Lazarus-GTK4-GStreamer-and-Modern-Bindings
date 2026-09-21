program project1;


{$mode objfpc}{$H+}

uses
  fp_llvm;

type
  TAddFunction = function(a, b: int32): int32; cdecl;

  procedure main;
  var
    Context: TLLVMContextRef;
    Module: TLLVMModuleRef;
    Builder: TLLVMBuilderRef;
    IntType: TLLVMTypeRef;
    ParamTypes: array[0..1] of TLLVMTypeRef;
    FuncType: TLLVMTypeRef;
    SumFunc: TLLVMValueRef;
    EntryBlock: TLLVMBasicBlockRef;
    Arg1, Arg2, SumValue: TLLVMValueRef;

    EE: TLLVMExecutionEngineRef = nil;
    ErrStr: pansichar = nil;
    FuncAddress: QWord;
    AddPtr: TAddFunction;
    Ergebnis: int32;
  begin
    LLVMLinkInMCJIT;
    LLVMInitializeX86TargetInfo;
    LLVMInitializeX86Target;
    LLVMInitializeX86TargetMC;
    LLVMInitializeX86AsmPrinter;

    Context := LLVMContextCreate;
    Module := LLVMModuleCreateWithNameInContext('JIT_Modul', Context);
    Builder := LLVMCreateBuilderInContext(Context);

    IntType := LLVMInt32TypeInContext(Context);
    ParamTypes[0] := IntType;
    ParamTypes[1] := IntType;

    FuncType := LLVMFunctionType(IntType, @ParamTypes, 2, False);
    SumFunc := LLVMAddFunction(Module, 'mein_add', FuncType);

    EntryBlock := LLVMAppendBasicBlockInContext(Context, SumFunc, 'entry');
    LLVMPositionBuilderAtEnd(Builder, EntryBlock);

    Arg1 := LLVMGetParam(SumFunc, 0);
    Arg2 := LLVMGetParam(SumFunc, 1);

    SumValue := LLVMBuildAdd(Builder, Arg1, Arg2, 'add_tmp');
    LLVMBuildRet(Builder, SumValue);

    if LLVMCreateExecutionEngineForModule(@EE, Module, @ErrStr) then begin
      WriteLn('JIT-Fehler: ', ErrStr);
      Exit;
    end;

    FuncAddress := LLVMGetFunctionAddress(EE, 'mein_add');

    if FuncAddress <> 0 then begin
      AddPtr := TAddFunction(FuncAddress);
      Ergebnis := AddPtr(15, 27);

      WriteLn('=== JIT ERGEBNIS ===');
      WriteLn('15 + 27 = ', Ergebnis);

      WriteLn();
      WriteLn('=== DUMP ERGEBNIS ===');

      LLVMDumpModule(module);
    end else begin
      WriteLn('Funktionsadresse nicht gefunden.');
    end;

    LLVMDisposeBuilder(Builder);
    LLVMDisposeExecutionEngine(EE);
    LLVMContextDispose(Context);
  end;

begin
  main;
end.
