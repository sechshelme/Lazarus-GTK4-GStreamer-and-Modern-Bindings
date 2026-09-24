program project1;


{$mode objfpc}{$H+}

uses
  fp_llvm;

type
  TFunction = function(a, b: int32): int32; cdecl;

  procedure CreateAddFunc(Module: TLLVMModuleRef);
  var
    context: TLLVMContextRef;
    builder: TLLVMBuilderRef;
    sumfunc: TLLVMValueRef;
  begin
    context := LLVMGetModuleContext(Module);
    builder := LLVMCreateBuilderInContext(context);

    sumfunc := LLVMAddFunction(Module, 'add', LLVMFunctionType(LLVMInt32Type, @[LLVMInt32Type, LLVMInt32Type], 2, False));
    LLVMPositionBuilderAtEnd(builder, LLVMAppendBasicBlockInContext(context, sumfunc, 'entry'));
    LLVMBuildRet(builder, LLVMBuildAdd(builder, LLVMGetParam(sumfunc, 0), LLVMGetParam(sumfunc, 1), ''));
    LLVMDisposeBuilder(builder);
  end;

  procedure CreateMulFunc(Module: TLLVMModuleRef);
  var
    context: TLLVMContextRef;
    builder: TLLVMBuilderRef;
    sumfunc: TLLVMValueRef;
  begin
    context := LLVMGetModuleContext(Module);
    builder := LLVMCreateBuilderInContext(context);

    sumfunc := LLVMAddFunction(Module, 'mul', LLVMFunctionType(LLVMInt32Type, @[LLVMInt32Type, LLVMInt32Type], 2, False));
    LLVMPositionBuilderAtEnd(builder, LLVMAppendBasicBlockInContext(context, sumfunc, 'entry'));
    LLVMBuildRet(builder, LLVMBuildMul(builder, LLVMGetParam(sumfunc, 0), LLVMGetParam(sumfunc, 1), ''));
    LLVMDisposeBuilder(builder);
  end;

procedure CompileAndRund  (module: TLLVMModuleRef);
var
  EE: TLLVMExecutionEngineRef;
  ErrStr: PChar;
  Res: Int32;
  DummyMod: TLLVMModuleRef;
begin
  if LLVMCreateExecutionEngineForModule(@EE, Module, @ErrStr) then begin
    WriteLn('JIT-Fehler: ', ErrStr);
    LLVMDisposeMessage(ErrStr);
    Exit;
  end;

  WriteLn('=== JIT ERGEBNIS ===');

  Res := TFunction(LLVMGetFunctionAddress(EE, 'add'))(15, 27);
  WriteLn('15 + 27 = ', Res);
  Res := TFunction(LLVMGetFunctionAddress(EE, 'mul'))(5, 7);
  WriteLn('5 x 7 = ', Res, #10);

  WriteLn('=== DUMP ERGEBNIS ===');

  LLVMRemoveModule(EE, Module, @DummyMod, @ErrStr);
  LLVMDisposeExecutionEngine(EE);
  end;

  procedure main;
  var
    Context: TLLVMContextRef;
    Module: TLLVMModuleRef;
  begin
    LLVMLinkInMCJIT;
    LLVMInitializeX86TargetInfo;
    LLVMInitializeX86Target;
    LLVMInitializeX86TargetMC;
    LLVMInitializeX86AsmPrinter;

    Context := LLVMContextCreate;
    Module := LLVMModuleCreateWithNameInContext('JIT_Modul', Context);

    CreateAddFunc(Module);
    CreateMulFunc(Module);

    CompileAndRund(Module);

    LLVMDumpModule(module);

    LLVMDisposeModule(Module);
    LLVMContextDispose(Context);
  end;

begin
  main;
end.
