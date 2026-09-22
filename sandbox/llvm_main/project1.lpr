program project1;


{$mode objfpc}{$H+}

uses
  fp_llvm;

type
  Tcalc_func=function(para1: TLLVMBuilderRef; LHS: TLLVMValueRef; RHS: TLLVMValueRef; Name: pchar): TLLVMValueRef; cdecl;

function gen_func(module: TLLVMModuleRef; builder: TLLVMBuilderRef; calc_func:Tcalc_func): TLLVMValueRef;
begin
  Result := LLVMAddFunction(module, 'calc', LLVMFunctionType(LLVMInt32Type, @[LLVMInt32Type, LLVMInt32Type], 2, False));
  LLVMPositionBuilderAtEnd(builder, LLVMAppendBasicBlock(Result, 'entry'));
  LLVMBuildRet(builder, calc_func(builder, LLVMGetParam(Result, 0),LLVMGetParam(Result, 1), ''));
end;

function call_calc(builder: TLLVMBuilderRef; func, a, b: TLLVMValueRef): TLLVMValueRef;
begin
  Result := LLVMBuildCall2(builder, LLVMFunctionType(LLVMInt32Type, @[LLVMInt32Type, LLVMInt32Type], 2, False), func, @[a,b], 2, 'res');
end;


procedure main;
var
  llvm_args: array[0..1] of PAnsiChar;
  module: TLLVMModuleRef;
  builder: TLLVMBuilderRef;
  add_func, mul_func, printf_func, main_func: TLLVMValueRef;
  printf_params: array[0..0] of TLLVMTypeRef;
  printf_type, main_type: TLLVMTypeRef;
  main_entry: TLLVMBasicBlockRef;
  val1, val2, val3, val4, result, format_str, zero: TLLVMValueRef;
  printf_args: array[0..1] of TLLVMValueRef;
  error: PAnsiChar;
  default_triple: PAnsiChar;
  target: TLLVMTargetRef;
  target_machine: TLLVMTargetMachineRef;
  filename: PAnsiChar;
begin
  llvm_args[0] := 'main';
  llvm_args[1] := '-x86-asm-syntax=intel';
  LLVMParseCommandLineOptions(2, @llvm_args[0], nil);

  module := LLVMModuleCreateWithName('mein_modul');
  builder := LLVMCreateBuilder();

  add_func:=gen_func(module,builder,@LLVMBuildAdd);
  mul_func:=gen_func(module,builder,@LLVMBuildMul);

  // =================================================================
  // EXTERNE printf-FUNKTION IN LLVM DEKLARIEREN
  // =================================================================
  printf_params[0] := LLVMPointerTypeInContext(LLVMGetGlobalContext(), 0);
  // 1 Parameter, True (1) für variadisch (printf nimmt beliebig viele Argumente)
  printf_type := LLVMFunctionType(LLVMInt32Type(), @printf_params[0], 1, True);
  printf_func := LLVMAddFunction(module, 'printf', printf_type);

  // =================================================================
  // 2. FUNKTION: int main()
  // =================================================================
  main_type := LLVMFunctionType(LLVMInt32Type(), nil, 0, False);
  main_func := LLVMAddFunction(module, 'main', main_type);

  main_entry := LLVMAppendBasicBlock(main_func, 'main_entry');
  LLVMPositionBuilderAtEnd(builder, main_entry);

  val1 := LLVMConstInt(LLVMInt32Type, 10, False);
  val2 := LLVMConstInt(LLVMInt32Type, 20, False);

  result := call_calc(builder, add_func, val1, val2);

  val3 := LLVMConstInt(LLVMInt32Type, 30, False);
  result := call_calc(builder, add_func, result, val3);

  val4 := LLVMConstInt(LLVMInt32Type, 2, False);
  result := call_calc(builder, mul_func, result, val4);

  // Globalen Format-String für printf erstellen
  format_str := LLVMBuildGlobalStringPtr(builder, 'Das Ergebnis ist: %d'#10, 'str');

  // printf-Aufruf vorbereiten
  printf_args[0] := format_str;
  printf_args[1] := result;
  LLVMBuildCall2(builder, printf_type, printf_func, @printf_args[0], 2, 'printf_call');

  // main gibt 0 zurück
  zero := LLVMConstInt(LLVMInt32Type(), 0, False);
  LLVMBuildRet(builder, zero);

  // =================================================================
  // VALIDIERUNG & AUSGABE
  // =================================================================
  error := nil;
  if LLVMVerifyModule(module, LLVMAbortProcessAction, @error) then  begin
    Writeln(StdErr, 'Fehler bei der Modul-Validierung: ', error);
    LLVMDisposeMessage(error);
    Exit;
  end;

  Flush(Output);
  Writeln('--- Generierter LLVM-IR Code (inklusive printf) ---');
  Flush(Output);
  LLVMDumpModule(module);

  // =================================================================
  // CODE-GENERIERUNG FÜR DIE CPU
  // =================================================================
  LLVMInitializeNativeTarget();
  LLVMInitializeNativeAsmPrinter();

  default_triple := LLVMGetDefaultTargetTriple();
  target := nil;
  error := nil;
  if LLVMGetTargetFromTriple(default_triple, @target, @error) then  begin
    Writeln(StdErr, 'Fehler beim Target-Triple: ', error);
    LLVMDisposeMessage(error);
    Exit;
  end;

  target_machine := LLVMCreateTargetMachine(
    target, default_triple, 'generic', '',
    LLVMCodeGenLevelDefault, LLVMRelocPIC, LLVMCodeModelDefault
  );

  filename := 'output.s';
  if LLVMTargetMachineEmitToFile(target_machine, module, filename, LLVMAssemblyFile, @error) then  begin
    Writeln(StdErr, 'Fehler beim Schreiben der Assembler-Datei: ', error);
    LLVMDisposeMessage(error);
    Exit;
  end;

  Writeln;
  Writeln('Erfolgreich! Der Code wurde in ''', filename, ''' gespeichert.');

  // Aufräumen
  LLVMDisposeTargetMachine(target_machine);
  LLVMDisposeMessage(default_triple);
  LLVMDisposeBuilder(builder);
  LLVMDisposeModule(module);
end;

begin
  main;
end.
