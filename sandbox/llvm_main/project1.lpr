program project1;


{$mode objfpc}{$H+}

uses
  fp_llvm;

LLVMValueRef erstelle_add_funktion(LLVMModuleRef module, LLVMBuilderRef builder) {
    LLVMTypeRef param_types[] = { LLVMInt32Type(), LLVMInt32Type() };
    LLVMTypeRef function_type = LLVMFunctionType(LLVMInt32Type(), param_types, 2, 0);
    LLVMValueRef add_func = LLVMAddFunction(module, "add", function_type);

    LLVMBasicBlockRef entry = LLVMAppendBasicBlock(add_func, "entry");
    LLVMPositionBuilderAtEnd(builder, entry);

    LLVMValueRef param_a = LLVMGetParam(add_func, 0);
    LLVMValueRef param_b = LLVMGetParam(add_func, 1);
    LLVMValueRef sum = LLVMBuildAdd(builder, param_a, param_b, "tmp_sum");
    LLVMBuildRet(builder, sum);

    return add_func;
}

LLVMValueRef erstelle_mul_funktion(LLVMModuleRef module, LLVMBuilderRef builder) {
    LLVMTypeRef param_types[] = { LLVMInt32Type(), LLVMInt32Type() };
    LLVMTypeRef function_type = LLVMFunctionType(LLVMInt32Type(), param_types, 2, 0);
    LLVMValueRef mul_func = LLVMAddFunction(module, "mul", function_type);

    LLVMBasicBlockRef entry = LLVMAppendBasicBlock(mul_func, "entry");
    LLVMPositionBuilderAtEnd(builder, entry);

    LLVMValueRef param_a = LLVMGetParam(mul_func, 0);
    LLVMValueRef param_b = LLVMGetParam(mul_func, 1);
    LLVMValueRef mul = LLVMBuildMul(builder, param_a, param_b, "tmp_sum");
    LLVMBuildRet(builder, mul);

    return mul_func;
}


LLVMValueRef generiere_binop_aufruf(LLVMBuilderRef builder, LLVMValueRef add_func, LLVMValueRef lhs, LLVMValueRef rhs) {
    // Typ der Funktion lokal für den Call rekonstruieren
    LLVMTypeRef add_param_types[] = { LLVMInt32Type(), LLVMInt32Type() };
    LLVMTypeRef add_func_type = LLVMFunctionType(LLVMInt32Type(), add_param_types, 2, 0);

    // Die Argumente in das Array packen
    LLVMValueRef call_args[] = { lhs, rhs };

    // Den tatsächlichen LLVM-Call-Befehl erzeugen und zurückgeben
    return LLVMBuildCall2(builder, add_func_type, add_func, call_args, 2, "res");
}


  procedure main;
  begin
    const char* llvm_args[] = { "main", "-x86-asm-syntax=intel" };
    LLVMParseCommandLineOptions(2, llvm_args, NULL);

    LLVMModuleRef module = LLVMModuleCreateWithName("mein_modul");
    LLVMBuilderRef builder = LLVMCreateBuilder();

    // Richtiger Funktionsaufruf
    LLVMValueRef add_func = erstelle_add_funktion(module, builder);
    LLVMValueRef mul_func = erstelle_mul_funktion(module, builder);

    // =================================================================
    // EXTERNE printf-FUNKTION IN LLVM DEKLARIEREN
    // =================================================================

//    LLVMTypeRef printf_params[] = { LLVMPointerType(LLVMInt8Type(), 0) };
    LLVMTypeRef printf_params[] = { LLVMPointerTypeInContext(LLVMGetGlobalContext(), 0) };
    LLVMTypeRef printf_type = LLVMFunctionType(LLVMInt32Type(), printf_params, 1, 1);
    LLVMValueRef printf_func = LLVMAddFunction(module, "printf", printf_type);

    // =================================================================
    // 2. FUNKTION: int main()
    // =================================================================
    LLVMTypeRef main_type = LLVMFunctionType(LLVMInt32Type(), NULL, 0, 0);
    LLVMValueRef main_func = LLVMAddFunction(module, "main", main_type);

    LLVMBasicBlockRef main_entry = LLVMAppendBasicBlock(main_func, "main_entry");
    LLVMPositionBuilderAtEnd(builder, main_entry);

    LLVMValueRef val1 = LLVMConstInt(LLVMInt32Type(), 10, 0);
    LLVMValueRef val2 = LLVMConstInt(LLVMInt32Type(), 20, 0);
    LLVMValueRef val3 = LLVMConstInt(LLVMInt32Type(), 30, 0);
    LLVMValueRef val4 = LLVMConstInt(LLVMInt32Type(), 2, 0);

    // 1. Aufruf: add(10, 20)
    LLVMValueRef result = generiere_binop_aufruf(builder, add_func, val1, val2);

    // 2. Aufruf: add(result, 30)
    result = generiere_binop_aufruf(builder, add_func, result, val3);


    result = generiere_binop_aufruf(builder, mul_func, result, val4);


    // Globalen Format-String für printf erstellen
    LLVMValueRef format_str = LLVMBuildGlobalStringPtr(builder, "Das Ergebnis ist: %d\n", "str");

    // printf-Aufruf vorbereiten
    LLVMValueRef printf_args[] = { format_str, result };
    LLVMBuildCall2(builder, printf_type, printf_func, printf_args, 2, "printf_call");

    // main gibt 0 zurück
    LLVMValueRef zero = LLVMConstInt(LLVMInt32Type(), 0, 0);
    LLVMBuildRet(builder, zero);

    // =================================================================
    // VALIDIERUNG & AUSGABE (Wiederhergestellt!)
    // =================================================================
    char *error = NULL;
    if (LLVMVerifyModule(module, LLVMAbortProcessAction, &error)) {
        fprintf(stderr, "Fehler bei der Modul-Validierung: %s\n", error);
        LLVMDisposeMessage(error);
        return 1;
    }

    fflush(stdout);
    printf("--- Generierter LLVM-IR Code (inklusive printf) ---\n");
    fflush(stdout);
    LLVMDumpModule(module);

    // =================================================================
    // CODE-GENERIERUNG FÜR DIE CPU
    // =================================================================
    LLVMInitializeNativeTarget();
    LLVMInitializeNativeAsmPrinter();

    char* default_triple = LLVMGetDefaultTargetTriple();
    LLVMTargetRef target;
    error = NULL;
    if (LLVMGetTargetFromTriple(default_triple, &target, &error)) {
        fprintf(stderr, "Fehler beim Target-Triple: %s\n", error);
        return 1;
    }

    LLVMTargetMachineRef target_machine = LLVMCreateTargetMachine(
        target, default_triple, "generic", "",
        LLVMCodeGenLevelDefault, LLVMRelocPIC, LLVMCodeModelDefault
    );

    char* filename = "output.s";
    if (LLVMTargetMachineEmitToFile(target_machine, module, filename, LLVMAssemblyFile, &error)) {
        fprintf(stderr, "Fehler beim Schreiben der Assembler-Datei: %s\n", error);
        LLVMDisposeMessage(error);
        return 1;
    }

    printf("\nErfolgreich! Der Code wurde in '%s' gespeichert.\n", filename);

    // Aufräumen
    LLVMDisposeTargetMachine(target_machine);
    LLVMDisposeMessage(default_triple);
    LLVMDisposeBuilder(builder);
    LLVMDisposeModule(module);
  end;

begin
  main;
end.
