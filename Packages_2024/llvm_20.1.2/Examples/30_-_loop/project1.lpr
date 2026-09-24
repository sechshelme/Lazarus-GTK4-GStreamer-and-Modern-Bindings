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

  procedure main;
  var
    module: TLLVMModuleRef;
    builder: TLLVMBuilderRef;
    printf_func, main_func, str_val: TLLVMValueRef;

    // Schleifen-Variablen
    loop_begin, loop_end: TLLVMBasicBlockRef;
    counter, step: TLLVMValueRef;

    error, default_triple: pchar;
    target_machine: TLLVMTargetMachineRef;
    target: TLLVMTargetRef;
  begin

    // === Init
    module := LLVMModuleCreateWithName('mein_modul');
    builder := LLVMCreateBuilder;

    printf_func := LLVMAddFunction(module, 'printf', LLVMFunctionType(LLVMInt32Type, @[LLVMPointerTypeInContext(LLVMGetGlobalContext, 0)], 1, True));
    main_func := LLVMAddFunction(module, 'main', LLVMFunctionType(LLVMInt32Type, nil, 0, False));

    LLVMPositionBuilderAtEnd(builder, LLVMAppendBasicBlock(main_func, 'entry'));

    str_val := LLVMBuildGlobalStringPtr(builder, 'Hier kommt eine Schleife'#10, '');
    LLVMBuildCall2(builder, LLVMGlobalGetValueType(printf_func), printf_func, @[str_val], 1, '');

    // === Begin Loop
    counter := LLVMBuildAlloca(builder, LLVMInt32Type, 'counter');
    LLVMBuildStore(builder, LLVMConstInt(LLVMInt32Type, 0, False), counter);

    loop_begin := LLVMAppendBasicBlock(main_func, 'loop_begin');
    LLVMBuildBr(builder, loop_begin);
    LLVMPositionBuilderAtEnd(builder, loop_begin);

    str_val := LLVMBuildGlobalStringPtr(builder, '* ', '');
    LLVMBuildCall2(builder, LLVMGlobalGetValueType(printf_func), printf_func, @[str_val], 1, '');

    step := LLVMBuildAdd(builder, LLVMBuildLoad2(builder, LLVMInt32Type, counter, 'count'), LLVMConstInt(LLVMInt32Type, 1, False), 'step');
    LLVMBuildStore(builder, step, counter);

    loop_end := LLVMAppendBasicBlock(main_func, 'loop_end');
    LLVMBuildCondBr(builder, LLVMBuildICmp(builder, LLVMIntULT, step, LLVMConstInt(LLVMInt32Type, 80, False), 'cmp_tmp'), loop_begin, loop_end);
    LLVMPositionBuilderAtEnd(builder, loop_end);
    // === End Loop

    str_val := LLVMBuildGlobalStringPtr(builder, #10'Hier ist die Schleife fertig'#10, '');
    LLVMBuildCall2(builder, LLVMGlobalGetValueType(printf_func), printf_func, @[str_val], 1, '');

    LLVMBuildRet(builder, LLVMConstInt(LLVMInt32Type, 0, False));

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
