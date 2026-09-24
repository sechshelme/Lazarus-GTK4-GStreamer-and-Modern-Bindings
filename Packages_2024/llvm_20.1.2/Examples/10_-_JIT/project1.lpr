program project1;

uses
  fp_llvm;

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

procedure CreateCalcFunc(Module: TLLVMModuleRef);
var
  context: TLLVMContextRef;
  builder: TLLVMBuilderRef;
  calcfunc: TLLVMValueRef;
  FuncType2, FuncType3: TLLVMTypeRef;
  Res: TLLVMValueRef;
begin
  context := LLVMGetModuleContext(Module);
  builder := LLVMCreateBuilderInContext(context);

  FuncType2 := LLVMFunctionType(LLVMInt32Type, @[LLVMInt32Type, LLVMInt32Type], 2, False);
  FuncType3 := LLVMFunctionType(LLVMInt32Type, @[LLVMInt32Type, LLVMInt32Type, LLVMInt32Type], 3, False);

  calcfunc := LLVMAddFunction(Module, 'calc', FuncType3);
  LLVMPositionBuilderAtEnd(builder, LLVMAppendBasicBlockInContext(context, calcfunc, 'entry'));

  Res := LLVMBuildCall2(builder, FuncType2, LLVMGetNamedFunction(Module, 'mul'), @[LLVMGetParam(calcfunc, 0), LLVMGetParam(calcfunc, 1)], 2, '');
  Res := LLVMBuildCall2(builder, FuncType2, LLVMGetNamedFunction(Module, 'add'), @[LLVMGetParam(calcfunc, 2), Res], 2, '');

  LLVMBuildRet(builder, Res);
  LLVMDisposeBuilder(builder);
end;


procedure CompileAndRund  (module: TLLVMModuleRef);
type
  TFunction2 = function(a, b: int32): int32; cdecl;
  TFunction3 = function(a, b, c: int32): int32; cdecl;
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

  Res := {%H-}TFunction2(LLVMGetFunctionAddress(EE, 'add'))(15, 27);
  WriteLn('15 + 27 = ', Res);
  Res := {%H-}TFunction2(LLVMGetFunctionAddress(EE, 'mul'))(5, 7);
  WriteLn('5 x 7 = ', Res);
  Res := {%H-}TFunction3(LLVMGetFunctionAddress(EE, 'calc'))(2, 3, 4);
  WriteLn('2 x 3 + 4 = ', Res, #10);

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
    CreateCalcFunc(Module);

    CompileAndRund(Module);

    LLVMDumpModule(module);

    LLVMDisposeModule(Module);
    LLVMContextDispose(Context);
  end;

begin
  main;
end.
