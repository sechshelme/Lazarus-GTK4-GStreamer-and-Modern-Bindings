program project1;

uses
  fp_llvm;

  procedure CreateAddFunc(Module: TLLVMModuleRef);
  var
    context: TLLVMContextRef;
    builder: TLLVMBuilderRef;
    func: TLLVMValueRef;
  begin
    context := LLVMGetModuleContext(Module);
    builder := LLVMCreateBuilderInContext(context);

    func := LLVMAddFunction(Module, 'add', LLVMFunctionType(LLVMInt32Type, @[LLVMInt32Type, LLVMInt32Type], 2, False));
    LLVMPositionBuilderAtEnd(builder, LLVMAppendBasicBlockInContext(context, func, ''));
    LLVMBuildRet(builder, LLVMBuildAdd(builder, LLVMGetParam(func, 0), LLVMGetParam(func, 1), ''));
    LLVMDisposeBuilder(builder);
  end;

  procedure CreateMulFunc(Module: TLLVMModuleRef);
  var
    context: TLLVMContextRef;
    builder: TLLVMBuilderRef;
    func: TLLVMValueRef;
  begin
    context := LLVMGetModuleContext(Module);
    builder := LLVMCreateBuilderInContext(context);

    func := LLVMAddFunction(Module, 'mul', LLVMFunctionType(LLVMInt32Type, @[LLVMInt32Type, LLVMInt32Type], 2, False));
    LLVMPositionBuilderAtEnd(builder, LLVMAppendBasicBlockInContext(context, func, ''));
    LLVMBuildRet(builder, LLVMBuildMul(builder, LLVMGetParam(func, 0), LLVMGetParam(func, 1), ''));
    LLVMDisposeBuilder(builder);
  end;

  procedure CreateCalcFunc(Module: TLLVMModuleRef);
  var
    context: TLLVMContextRef;
    builder: TLLVMBuilderRef;
    func, res: TLLVMValueRef;
    funcType2, funcType3: TLLVMTypeRef;
  begin
    context := LLVMGetModuleContext(Module);
    builder := LLVMCreateBuilderInContext(context);

    funcType2 := LLVMFunctionType(LLVMInt32Type, @[LLVMInt32Type, LLVMInt32Type], 2, False);
    funcType3 := LLVMFunctionType(LLVMInt32Type, @[LLVMInt32Type, LLVMInt32Type, LLVMInt32Type], 3, False);

    func := LLVMAddFunction(Module, 'calc', funcType3);
    LLVMPositionBuilderAtEnd(builder, LLVMAppendBasicBlockInContext(context, func, ''));

    res := LLVMBuildCall2(builder, funcType2, LLVMGetNamedFunction(Module, 'mul'), @[LLVMGetParam(func, 0), LLVMGetParam(func, 1)], 2, '');
    res := LLVMBuildCall2(builder, funcType2, LLVMGetNamedFunction(Module, 'add'), @[LLVMGetParam(func, 2), res], 2, '');

    LLVMBuildRet(builder, res);
    LLVMDisposeBuilder(builder);
  end;

  procedure CreateCosFunc(Module: TLLVMModuleRef);
  var
    context: TLLVMContextRef;
    builder: TLLVMBuilderRef;
    func: TLLVMValueRef;
    funcType: TLLVMTypeRef;
  begin
    context := LLVMGetModuleContext(Module);
    builder := LLVMCreateBuilderInContext(context);

    funcType := LLVMFunctionType(LLVMFloatType, @[LLVMFloatType], 1, False);

    func := LLVMAddFunction(Module, 'sin', LLVMFunctionType(LLVMFloatType, @[LLVMFloatType], 1, False));
    LLVMPositionBuilderAtEnd(builder, LLVMAppendBasicBlockInContext(context, func, ''));

    LLVMBuildRet(builder, LLVMBuildCall2(builder, funcType, LLVMAddFunction(Module, 'sinf', funcType), @[LLVMGetParam(func, 0)], 1, ''));
    LLVMDisposeBuilder(builder);
  end;

  procedure CompileAndRund(module: TLLVMModuleRef);
  type
    TFunction1 = function(a: single): single; cdecl;
    TFunction2 = function(a, b: int32): int32; cdecl;
    TFunction3 = function(a, b, c: int32): int32; cdecl;
  var
    EE: TLLVMExecutionEngineRef;
    ErrStr: pchar;
    Res_i: int32;
    DummyMod: TLLVMModuleRef;
    Res_f: single;
  begin
    {$IFDEF LINUX}
    LLVMLoadLibraryPermanently('libm.so.6');
    {$ENDIF}
    if LLVMCreateExecutionEngineForModule(@EE, Module, @ErrStr) then begin
      WriteLn('JIT-Fehler: ', ErrStr);
      LLVMDisposeMessage(ErrStr);
      Exit;
    end;

    WriteLn('=== JIT ERGEBNIS ===');

    Res_i := {%H-}TFunction2(LLVMGetFunctionAddress(EE, 'add'))(15, 27);
    WriteLn('15 + 27 = ', Res_i);
    Res_i := {%H-}TFunction2(LLVMGetFunctionAddress(EE, 'mul'))(5, 7);
    WriteLn('5 x 7 = ', Res_i);
    Res_i := {%H-}TFunction3(LLVMGetFunctionAddress(EE, 'calc'))(2, 3, 4);
    WriteLn('2 x 3 + 4 = ', Res_i, #10);

    Res_f := {%H-}TFunction1(LLVMGetFunctionAddress(EE, 'sin'))(1.0);
    WriteLn('sin(1.0) = ', Res_f: 4: 2, #10);

    WriteLn('=== DUMP ERGEBNIS ===');

    LLVMRemoveModule(EE, Module, @DummyMod, @ErrStr);
    LLVMDisposeExecutionEngine(EE);
  end;

  procedure main;
  var
    context: TLLVMContextRef;
    module: TLLVMModuleRef;
  begin
    LLVMLinkInMCJIT;
    LLVMInitializeX86TargetInfo;
    LLVMInitializeX86Target;
    LLVMInitializeX86TargetMC;
    LLVMInitializeX86AsmPrinter;

    context := LLVMContextCreate;
    module := LLVMModuleCreateWithNameInContext('JIT_Modul', context);

    CreateAddFunc(module);
    CreateMulFunc(module);
    CreateCalcFunc(module);
    CreateCosFunc(module);

    CompileAndRund(module);

    LLVMDumpModule(module);

    LLVMDisposeModule(module);
    LLVMContextDispose(context);
  end;

begin
  main;
end.
