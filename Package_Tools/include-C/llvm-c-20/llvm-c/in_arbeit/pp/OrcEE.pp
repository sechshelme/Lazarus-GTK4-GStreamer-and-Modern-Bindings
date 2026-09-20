
unit OrcEE;
interface

{
  Automatically converted by H2Pas 1.0.0 from OrcEE.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    OrcEE.h
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
PLLVMMemoryManagerCreateContextCallback  = ^LLVMMemoryManagerCreateContextCallback;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{===-- llvm-c/OrcEE.h - OrcV2 C bindings ExecutionEngine utils -*- C++ -*-===*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* This header declares the C interface to ExecutionEngine based utils, e.g.  *|
|* RTDyldObjectLinkingLayer (based on RuntimeDyld) in Orc.                    *|
|*                                                                            *|
|* Many exotic languages can interoperate with C code but have a harder time  *|
|* with C++ due to name mangling. So in addition to C, this interface enables *|
|* tools written in such languages.                                           *|
|*                                                                            *|
|* Note: This interface is experimental. It is *NOT* stable, and may be       *|
|*       changed without warning. Only C API usage documentation is           *|
|*       provided. See the C++ documentation for all higher level ORC API     *|
|*       details.                                                             *|
|*                                                                            *|
\*===----------------------------------------------------------------------=== }
{$ifndef LLVM_C_ORCEE_H}
{$define LLVM_C_ORCEE_H}
{$include "llvm-c/Error.h"}
{$include "llvm-c/ExecutionEngine.h"}
{$include "llvm-c/Orc.h"}
{$include "llvm-c/TargetMachine.h"}
{$include "llvm-c/Types.h"}
type
  PLLVMMemoryManagerCreateContextCallback = ^TLLVMMemoryManagerCreateContextCallback;
  TLLVMMemoryManagerCreateContextCallback = function (CtxCtx:pointer):pointer;cdecl;

  TLLVMMemoryManagerNotifyTerminatingCallback = procedure (CtxCtx:pointer);cdecl;
{*
 * @defgroup LLVMCExecutionEngineORCEE ExecutionEngine-based ORC Utils
 * @ingroup LLVMCExecutionEngine
 *
 * @
  }
{*
 * Create a RTDyldObjectLinkingLayer instance using the standard
 * SectionMemoryManager for memory management.
  }

function LLVMOrcCreateRTDyldObjectLinkingLayerWithSectionMemoryManager(ES:TLLVMOrcExecutionSessionRef):TLLVMOrcObjectLayerRef;cdecl;external;
{*
 * Create a RTDyldObjectLinkingLayer instance using MCJIT-memory-manager-like
 * callbacks.
 *
 * This is intended to simplify transitions for existing MCJIT clients. The
 * callbacks used are similar (but not identical) to the callbacks for
 * LLVMCreateSimpleMCJITMemoryManager: Unlike MCJIT, RTDyldObjectLinkingLayer
 * will create a new memory manager for each object linked by calling the given
 * CreateContext callback. This allows for code removal by destroying each
 * allocator individually. Every allocator will be destroyed (if it has not been
 * already) at RTDyldObjectLinkingLayer destruction time, and the
 * NotifyTerminating callback will be called to indicate that no further
 * allocation contexts will be created.
 *
 * To implement MCJIT-like behavior clients can implement CreateContext,
 * NotifyTerminating, and Destroy as:
 *
 *   void *CreateContext(void *CtxCtx)  return CtxCtx; 
 *   void NotifyTerminating(void *CtxCtx)  MyOriginalDestroy(CtxCtx); 
 *   void Destroy(void *Ctx)  
 *
 * This scheme simply reuses the CreateContextCtx pointer as the one-and-only
 * allocation context.
  }
function LLVMOrcCreateRTDyldObjectLinkingLayerWithMCJITMemoryManagerLikeCallbacks(ES:TLLVMOrcExecutionSessionRef; CreateContextCtx:pointer; CreateContext:TLLVMMemoryManagerCreateContextCallback; NotifyTerminating:TLLVMMemoryManagerNotifyTerminatingCallback; AllocateCodeSection:TLLVMMemoryManagerAllocateCodeSectionCallback; 
           AllocateDataSection:TLLVMMemoryManagerAllocateDataSectionCallback; FinalizeMemory:TLLVMMemoryManagerFinalizeMemoryCallback; Destroy:TLLVMMemoryManagerDestroyCallback):TLLVMOrcObjectLayerRef;cdecl;external;
{*
 * Add the given listener to the given RTDyldObjectLinkingLayer.
 *
 * Note: Layer must be an RTDyldObjectLinkingLayer instance or
 * behavior is undefined.
  }
procedure LLVMOrcRTDyldObjectLinkingLayerRegisterJITEventListener(RTDyldObjLinkingLayer:TLLVMOrcObjectLayerRef; Listener:TLLVMJITEventListenerRef);cdecl;external;
{*
 * @
  }
{$endif}
{ LLVM_C_ORCEE_H  }

implementation


end.
