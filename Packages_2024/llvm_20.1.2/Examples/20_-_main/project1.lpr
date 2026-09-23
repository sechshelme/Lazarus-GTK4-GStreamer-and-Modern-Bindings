program project1;

(*
gcc /tmp/output.s -o /tmp/output
cat /tmp/output.s
echo '-----------------------------------------'
/tmp/output
*)


uses
  fp_llvm;

const
  OutputPath = '/tmp/output.s';

type
  Tcalc_func = function(para1: TLLVMBuilderRef; LHS, RHS: TLLVMValueRef; Name: pchar): TLLVMValueRef; cdecl;

  function gen_func(module: TLLVMModuleRef; builder: TLLVMBuilderRef; calc_func: Tcalc_func): TLLVMValueRef;
  begin
    Result := LLVMAddFunction(module, 'calc', LLVMFunctionType(LLVMInt32Type, @[LLVMInt32Type, LLVMInt32Type], 2, False));
    LLVMPositionBuilderAtEnd(builder, LLVMAppendBasicBlock(Result, 'entry'));
    LLVMBuildRet(builder, calc_func(builder, LLVMGetParam(Result, 0), LLVMGetParam(Result, 1), ''));
  end;

  function call_calc(builder: TLLVMBuilderRef; func, a, b: TLLVMValueRef): TLLVMValueRef;
  begin
    Result := LLVMBuildCall2(builder, LLVMFunctionType(LLVMInt32Type, @[LLVMInt32Type, LLVMInt32Type], 2, False), func, @[a, b], 2, 'res');
  end;

  function read_int(builder: TLLVMBuilderRef; scanf_func: TLLVMValueRef): TLLVMValueRef;
  var
    input_ptr: TLLVMValueRef;
  begin
    input_ptr := LLVMBuildAlloca(builder, LLVMInt32Type, '');
    LLVMBuildCall2(builder, LLVMGlobalGetValueType(scanf_func), scanf_func, @[LLVMBuildGlobalStringPtr(builder, '%d', ''), input_ptr], 2, '');
    Result := LLVMBuildLoad2(builder, LLVMInt32Type, input_ptr, '');
  end;


  procedure main;
  var
    module: TLLVMModuleRef;
    builder: TLLVMBuilderRef;
    add_func, mul_func, printf_func, main_func,
    int_val_1, int_val_2, str_val_1, scanf_func, int_res_1,
    int_val_3, int_val_4: TLLVMValueRef;
    error, default_triple: pchar;
    target: TLLVMTargetRef;
    target_machine: TLLVMTargetMachineRef;

  begin

    // === Init
    module := LLVMModuleCreateWithName('mein_modul');
    builder := LLVMCreateBuilder;

    // === Generate Functions
    add_func := gen_func(module, builder, @LLVMBuildAdd);
    mul_func := gen_func(module, builder, @LLVMBuildMul);

    printf_func := LLVMAddFunction(module, 'printf', LLVMFunctionType(LLVMInt32Type, @[LLVMPointerTypeInContext(LLVMGetGlobalContext, 0)], 1, True));
    scanf_func := LLVMAddFunction(module, 'scanf', LLVMFunctionType(LLVMInt32Type, @[LLVMPointerTypeInContext(LLVMGetGlobalContext, 0)], 1, True));


    main_func := LLVMAddFunction(module, 'main', LLVMFunctionType(LLVMInt32Type(), nil, 0, False));
    LLVMPositionBuilderAtEnd(builder, LLVMAppendBasicBlock(main_func, 'entry'));

    str_val_1 := LLVMBuildGlobalStringPtr(builder, 'Bitte gebe eine Zahl ein:'#10, '');
    LLVMBuildCall2(builder, LLVMGlobalGetValueType(printf_func), printf_func, @[str_val_1], 1, '');

    int_val_1 := read_int(builder, scanf_func);
    int_val_2 := LLVMConstInt(LLVMInt32Type, 20, False);
    int_res_1 := call_calc(builder, add_func, int_val_1, int_val_2);

    int_val_3 := LLVMConstInt(LLVMInt32Type, 30, False);
    int_res_1 := call_calc(builder, add_func, int_res_1, int_val_3);

    int_val_4 := LLVMConstInt(LLVMInt32Type, 3, False);
    int_res_1 := call_calc(builder, mul_func, int_res_1, int_val_4);

    str_val_1 := LLVMBuildGlobalStringPtr(builder, 'Das Resultat ist: (%d + %d + %d) x %d = %d'#10, '');
    LLVMBuildCall2(builder, LLVMGlobalGetValueType(printf_func), printf_func, @[str_val_1, int_val_1, int_val_2, int_val_3, int_val_4, int_res_1], 6, '');


    str_val_1 := LLVMBuildGlobalStringPtr(builder, '*', '');
    LLVMBuildCall2(builder, LLVMGlobalGetValueType(printf_func), printf_func, @[str_val_1], 1, '');
    str_val_1 := LLVMBuildGlobalStringPtr(builder, #10, '');
    LLVMBuildCall2(builder, LLVMGlobalGetValueType(printf_func), printf_func, @[str_val_1], 1, '');

    LLVMBuildRet(builder, LLVMConstInt(LLVMInt32Type(), 0, False));

    // ===  Validate
    error := nil;
    if LLVMVerifyModule(module, LLVMAbortProcessAction, @error) then  begin
      Writeln('Fehler bei der Modul-Validierung: ', error);
      LLVMDisposeMessage(error);
      Exit;
    end;

    Writeln('--- Generierter LLVM-IR Code ---');
    LLVMDumpModule(module);

    // === Generate Assmbler
    LLVMInitializeNativeTarget();
    LLVMInitializeNativeAsmPrinter();
    LLVMParseCommandLineOptions(2, @[pchar('main'), pchar('-x86-asm-syntax=intel')], nil);

    default_triple := LLVMGetDefaultTargetTriple;
    if LLVMGetTargetFromTriple(default_triple, @target, @error) then  begin
      Writeln('Fehler beim Target-Triple: ', error);
      LLVMDisposeMessage(error);
      Exit;
    end;

    target_machine := LLVMCreateTargetMachine(target, default_triple, 'generic', '', LLVMCodeGenLevelDefault, LLVMRelocPIC, LLVMCodeModelDefault);
    if LLVMTargetMachineEmitToFile(target_machine, module, OutputPath, LLVMAssemblyFile, @error) then  begin
      Writeln('Fehler beim Schreiben der Assembler-Datei: ', error);
      LLVMDisposeMessage(error);
      Exit;
    end;

    LLVMDisposeTargetMachine(target_machine);
    LLVMDisposeMessage(default_triple);
    LLVMDisposeBuilder(builder);
    LLVMDisposeModule(module);
  end;

begin
  main;
end.
