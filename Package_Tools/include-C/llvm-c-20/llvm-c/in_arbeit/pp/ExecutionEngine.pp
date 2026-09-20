
unit ExecutionEngine;
interface

{
  Automatically converted by H2Pas 1.0.0 from ExecutionEngine.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ExecutionEngine.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PLLVMExecutionEngineRef  = ^LLVMExecutionEngineRef;
PLLVMGenericValueRef  = ^LLVMGenericValueRef;
PLLVMMCJITCompilerOptions  = ^LLVMMCJITCompilerOptions;
PLLVMMCJITMemoryManagerRef  = ^LLVMMCJITMemoryManagerRef;
PLLVMMemoryManagerAllocateCodeSectionCallback  = ^LLVMMemoryManagerAllocateCodeSectionCallback;
PLLVMMemoryManagerAllocateDataSectionCallback  = ^LLVMMemoryManagerAllocateDataSectionCallback;
PLLVMModuleRef  = ^LLVMModuleRef;
PLLVMOpaqueExecutionEngine  = ^LLVMOpaqueExecutionEngine;
PLLVMOpaqueGenericValue  = ^LLVMOpaqueGenericValue;
PLLVMOpaqueMCJITMemoryManager  = ^LLVMOpaqueMCJITMemoryManager;
PLLVMValueRef  = ^LLVMValueRef;
Puint8_t  = ^uint8_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{===-- llvm-c/ExecutionEngine.h - ExecutionEngine Lib C Iface --*- C++ -*-===*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* This header declares the C interface to libLLVMExecutionEngine.o, which    *|
|* implements various analyses of the LLVM IR.                                *|
|*                                                                            *|
|* Many exotic languages can interoperate with C code but have a harder time  *|
|* with C++ due to name mangling. So in addition to C, this interface enables *|
|* tools written in such languages.                                           *|
|*                                                                            *|
\*===----------------------------------------------------------------------=== }
{$ifndef LLVM_C_EXECUTIONENGINE_H}
{$define LLVM_C_EXECUTIONENGINE_H}
{$include "llvm-c/ExternC.h"}
{$include "llvm-c/Target.h"}
{$include "llvm-c/TargetMachine.h"}
{$include "llvm-c/Types.h"}
{*
 * @defgroup LLVMCExecutionEngine Execution Engine
 * @ingroup LLVMC
 *
 * @
  }

procedure LLVMLinkInMCJIT;cdecl;external;
procedure LLVMLinkInInterpreter;cdecl;external;
type
  PLLVMGenericValueRef = ^TLLVMGenericValueRef;
  TLLVMGenericValueRef = PLLVMOpaqueGenericValue;

  PLLVMExecutionEngineRef = ^TLLVMExecutionEngineRef;
  TLLVMExecutionEngineRef = PLLVMOpaqueExecutionEngine;

  PLLVMMCJITMemoryManagerRef = ^TLLVMMCJITMemoryManagerRef;
  TLLVMMCJITMemoryManagerRef = PLLVMOpaqueMCJITMemoryManager;
  PLLVMMCJITCompilerOptions = ^TLLVMMCJITCompilerOptions;
  TLLVMMCJITCompilerOptions = record
      OptLevel : dword;
      CodeModel : TLLVMCodeModel;
      NoFramePointerElim : TLLVMBool;
      EnableFastISel : TLLVMBool;
      MCJMM : TLLVMMCJITMemoryManagerRef;
    end;

{===-- Operations on generic values --------------------------------------=== }

function LLVMCreateGenericValueOfInt(Ty:TLLVMTypeRef; N:qword; IsSigned:TLLVMBool):TLLVMGenericValueRef;cdecl;external;
function LLVMCreateGenericValueOfPointer(P:pointer):TLLVMGenericValueRef;cdecl;external;
function LLVMCreateGenericValueOfFloat(Ty:TLLVMTypeRef; N:Tdouble):TLLVMGenericValueRef;cdecl;external;
function LLVMGenericValueIntWidth(GenValRef:TLLVMGenericValueRef):dword;cdecl;external;
function LLVMGenericValueToInt(GenVal:TLLVMGenericValueRef; IsSigned:TLLVMBool):qword;cdecl;external;
function LLVMGenericValueToPointer(GenVal:TLLVMGenericValueRef):pointer;cdecl;external;
function LLVMGenericValueToFloat(TyRef:TLLVMTypeRef; GenVal:TLLVMGenericValueRef):Tdouble;cdecl;external;
procedure LLVMDisposeGenericValue(GenVal:TLLVMGenericValueRef);cdecl;external;
{===-- Operations on execution engines -----------------------------------=== }
function LLVMCreateExecutionEngineForModule(OutEE:PLLVMExecutionEngineRef; M:TLLVMModuleRef; OutError:PPchar):TLLVMBool;cdecl;external;
function LLVMCreateInterpreterForModule(OutInterp:PLLVMExecutionEngineRef; M:TLLVMModuleRef; OutError:PPchar):TLLVMBool;cdecl;external;
function LLVMCreateJITCompilerForModule(OutJIT:PLLVMExecutionEngineRef; M:TLLVMModuleRef; OptLevel:dword; OutError:PPchar):TLLVMBool;cdecl;external;
procedure LLVMInitializeMCJITCompilerOptions(Options:PLLVMMCJITCompilerOptions; SizeOfOptions:Tsize_t);cdecl;external;
{*
 * Create an MCJIT execution engine for a module, with the given options. It is
 * the responsibility of the caller to ensure that all fields in Options up to
 * the given SizeOfOptions are initialized. It is correct to pass a smaller
 * value of SizeOfOptions that omits some fields. The canonical way of using
 * this is:
 *
 * LLVMMCJITCompilerOptions options;
 * LLVMInitializeMCJITCompilerOptions(&options, sizeof(options));
 * ... fill in those options you care about
 * LLVMCreateMCJITCompilerForModule(&jit, mod, &options, sizeof(options),
 *                                  &error);
 *
 * Note that this is also correct, though possibly suboptimal:
 *
 * LLVMCreateMCJITCompilerForModule(&jit, mod, 0, 0, &error);
  }
function LLVMCreateMCJITCompilerForModule(OutJIT:PLLVMExecutionEngineRef; M:TLLVMModuleRef; Options:PLLVMMCJITCompilerOptions; SizeOfOptions:Tsize_t; OutError:PPchar):TLLVMBool;cdecl;external;
procedure LLVMDisposeExecutionEngine(EE:TLLVMExecutionEngineRef);cdecl;external;
procedure LLVMRunStaticConstructors(EE:TLLVMExecutionEngineRef);cdecl;external;
procedure LLVMRunStaticDestructors(EE:TLLVMExecutionEngineRef);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
function LLVMRunFunctionAsMain(EE:TLLVMExecutionEngineRef; F:TLLVMValueRef; ArgC:dword; ArgV:PPchar; EnvP:PPchar):longint;cdecl;external;
function LLVMRunFunction(EE:TLLVMExecutionEngineRef; F:TLLVMValueRef; NumArgs:dword; Args:PLLVMGenericValueRef):TLLVMGenericValueRef;cdecl;external;
procedure LLVMFreeMachineCodeForFunction(EE:TLLVMExecutionEngineRef; F:TLLVMValueRef);cdecl;external;
procedure LLVMAddModule(EE:TLLVMExecutionEngineRef; M:TLLVMModuleRef);cdecl;external;
function LLVMRemoveModule(EE:TLLVMExecutionEngineRef; M:TLLVMModuleRef; OutMod:PLLVMModuleRef; OutError:PPchar):TLLVMBool;cdecl;external;
(* Const before type ignored *)
function LLVMFindFunction(EE:TLLVMExecutionEngineRef; Name:Pchar; OutFn:PLLVMValueRef):TLLVMBool;cdecl;external;
function LLVMRecompileAndRelinkFunction(EE:TLLVMExecutionEngineRef; Fn:TLLVMValueRef):pointer;cdecl;external;
function LLVMGetExecutionEngineTargetData(EE:TLLVMExecutionEngineRef):TLLVMTargetDataRef;cdecl;external;
function LLVMGetExecutionEngineTargetMachine(EE:TLLVMExecutionEngineRef):TLLVMTargetMachineRef;cdecl;external;
procedure LLVMAddGlobalMapping(EE:TLLVMExecutionEngineRef; Global:TLLVMValueRef; Addr:pointer);cdecl;external;
function LLVMGetPointerToGlobal(EE:TLLVMExecutionEngineRef; Global:TLLVMValueRef):pointer;cdecl;external;
(* Const before type ignored *)
function LLVMGetGlobalValueAddress(EE:TLLVMExecutionEngineRef; Name:Pchar):Tuint64_t;cdecl;external;
(* Const before type ignored *)
function LLVMGetFunctionAddress(EE:TLLVMExecutionEngineRef; Name:Pchar):Tuint64_t;cdecl;external;
{/ Returns true on error, false on success. If true is returned then the error }
{/ message is copied to OutStr and cleared in the ExecutionEngine instance. }
function LLVMExecutionEngineGetErrMsg(EE:TLLVMExecutionEngineRef; OutError:PPchar):TLLVMBool;cdecl;external;
{===-- Operations on memory managers -------------------------------------=== }
(* Const before type ignored *)
type
  PLLVMMemoryManagerAllocateCodeSectionCallback = ^TLLVMMemoryManagerAllocateCodeSectionCallback;
  TLLVMMemoryManagerAllocateCodeSectionCallback = function (Opaque:pointer; Size:Tuintptr_t; Alignment:dword; SectionID:dword; SectionName:Pchar):Puint8_t;cdecl;
(* Const before type ignored *)

  PLLVMMemoryManagerAllocateDataSectionCallback = ^TLLVMMemoryManagerAllocateDataSectionCallback;
  TLLVMMemoryManagerAllocateDataSectionCallback = function (Opaque:pointer; Size:Tuintptr_t; Alignment:dword; SectionID:dword; SectionName:Pchar; 
               IsReadOnly:TLLVMBool):Puint8_t;cdecl;

  TLLVMMemoryManagerFinalizeMemoryCallback = function (Opaque:pointer; ErrMsg:PPchar):TLLVMBool;cdecl;

  TLLVMMemoryManagerDestroyCallback = procedure (Opaque:pointer);cdecl;
{*
 * Create a simple custom MCJIT memory manager. This memory manager can
 * intercept allocations in a module-oblivious way. This will return NULL
 * if any of the passed functions are NULL.
 *
 * @param Opaque An opaque client object to pass back to the callbacks.
 * @param AllocateCodeSection Allocate a block of memory for executable code.
 * @param AllocateDataSection Allocate a block of memory for data.
 * @param FinalizeMemory Set page permissions and flush cache. Return 0 on
 *   success, 1 on error.
  }

function LLVMCreateSimpleMCJITMemoryManager(Opaque:pointer; AllocateCodeSection:TLLVMMemoryManagerAllocateCodeSectionCallback; AllocateDataSection:TLLVMMemoryManagerAllocateDataSectionCallback; FinalizeMemory:TLLVMMemoryManagerFinalizeMemoryCallback; Destroy:TLLVMMemoryManagerDestroyCallback):TLLVMMCJITMemoryManagerRef;cdecl;external;
procedure LLVMDisposeMCJITMemoryManager(MM:TLLVMMCJITMemoryManagerRef);cdecl;external;
{===-- JIT Event Listener functions -------------------------------------=== }
function LLVMCreateGDBRegistrationListener:TLLVMJITEventListenerRef;cdecl;external;
function LLVMCreateIntelJITEventListener:TLLVMJITEventListenerRef;cdecl;external;
function LLVMCreateOProfileJITEventListener:TLLVMJITEventListenerRef;cdecl;external;
function LLVMCreatePerfJITEventListener:TLLVMJITEventListenerRef;cdecl;external;
{*
 * @
  }
{$endif}

implementation


end.
