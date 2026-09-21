program project1;


{$mode objfpc}{$H+}

uses
  Types,
  Analysis,
  BitReader,
  BitWriter,
  blake3,
  Comdat,
  Core,
  DataTypes,
  DebugInfo,
  DisassemblerTypes,
  Disassembler,
  ErrorHandling,
  Error,
  Target,
  TargetMachine,
  ExecutionEngine,
  IRReader,
  Linker,
  Orc,
  OrcEE,
  LLJIT,

  LLJITUtils,
  lto,
  Object_,                   // name ??
  Remarks,
  Support,

  PassBuilder,


  Classes, SysUtils, ctypes,
  fp_llvm;

const
  LLVM_Lib = 'libLLVM-20.so';

type
  LLVMContextRef = Pointer;
  LLVMModuleRef = Pointer;
  LLVMTypeRef = Pointer;
  LLVMValueRef = Pointer;
  LLVMBuilderRef = Pointer;
  LLVMExecutionEngineRef = Pointer;
  PLLVMExecutionEngineRef = LLVMExecutionEngineRef;
  LLVMBasicBlockRef = Pointer;

  function LLVMContextCreate: LLVMContextRef; cdecl; external LLVM_Lib;
  function LLVMModuleCreateWithNameInContext(ModuleID: pansichar; C: LLVMContextRef): LLVMModuleRef; cdecl; external LLVM_Lib;
  function LLVMInt32TypeInContext(C: LLVMContextRef): LLVMTypeRef; cdecl; external LLVM_Lib;
  function LLVMFunctionType(ReturnType: LLVMTypeRef; ParamTypes: PPointer; ParamCount: cuint; IsVarArg: longbool): LLVMTypeRef; cdecl; external LLVM_Lib;
  function LLVMAddFunction(M: LLVMModuleRef; Name: pansichar; FunctionTy: LLVMTypeRef): LLVMValueRef; cdecl; external LLVM_Lib;
  function LLVMAppendBasicBlockInContext(C: LLVMContextRef; Fn: LLVMValueRef; Name: pansichar): LLVMBasicBlockRef; cdecl; external LLVM_Lib;
  function LLVMCreateBuilderInContext(C: LLVMContextRef): LLVMBuilderRef; cdecl; external LLVM_Lib;
  procedure LLVMPositionBuilderAtEnd(Builder: LLVMBuilderRef; Block: LLVMBasicBlockRef); cdecl; external LLVM_Lib;
  function LLVMGetParam(Fn: LLVMValueRef; Index: cuint): LLVMValueRef; cdecl; external LLVM_Lib;

  function LLVMBuildAdd(Builder: LLVMBuilderRef; LHS, RHS: LLVMValueRef; Name: pansichar): LLVMValueRef; cdecl; external LLVM_Lib;
  function LLVMBuildRet(Builder: LLVMBuilderRef; V: LLVMValueRef): LLVMValueRef; cdecl; external LLVM_Lib;

  procedure LLVMLinkInMCJIT; cdecl; external LLVM_Lib;
  procedure LLVMInitializeX86TargetInfo; cdecl; external LLVM_Lib;
  procedure LLVMInitializeX86Target; cdecl; external LLVM_Lib;
  procedure LLVMInitializeX86TargetMC; cdecl; external LLVM_Lib;
  procedure LLVMInitializeX86AsmPrinter; cdecl; external LLVM_Lib;

  function LLVMCreateExecutionEngineForModule(OutEE: PLLVMExecutionEngineRef; M: LLVMModuleRef; OutError: PPChar): longbool; cdecl; external LLVM_Lib;
  function LLVMGetFunctionAddress(EE: LLVMExecutionEngineRef; Name: pansichar): QWord; cdecl; external LLVM_Lib;

  procedure LLVMDisposeBuilder(Builder: LLVMBuilderRef); cdecl; external LLVM_Lib;
  procedure LLVMDisposeExecutionEngine(EE: LLVMExecutionEngineRef); cdecl; external LLVM_Lib;
  procedure LLVMContextDispose(C: LLVMContextRef); cdecl; external LLVM_Lib;

  procedure LLVMDumpModule(M: LLVMModuleRef) cdecl; external LLVM_Lib;


type
  TAddFunction = function(a, b: int32): int32; cdecl;

  procedure RunJITDemo;
  var
    Context: LLVMContextRef;
    Module: LLVMModuleRef;
    Builder: LLVMBuilderRef;
    IntType: LLVMTypeRef;
    ParamTypes: array[0..1] of LLVMTypeRef;
    FuncType: LLVMTypeRef;
    SumFunc: LLVMValueRef;
    EntryBlock: LLVMBasicBlockRef;
    Arg1, Arg2, SumValue: LLVMValueRef;

    EE: LLVMExecutionEngineRef = nil;
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
      AddPtr := TAddFunction(Pointer(FuncAddress));
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
  RunJITDemo;
end.
