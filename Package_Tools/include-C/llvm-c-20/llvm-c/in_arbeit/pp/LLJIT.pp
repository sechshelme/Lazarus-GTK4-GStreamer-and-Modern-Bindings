
unit LLJIT;
interface

{
  Automatically converted by H2Pas 1.0.0 from LLJIT.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    LLJIT
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
PLLVMOrcExecutorAddress  = ^LLVMOrcExecutorAddress;
PLLVMOrcLLJITBuilderRef  = ^LLVMOrcLLJITBuilderRef;
PLLVMOrcLLJITRef  = ^LLVMOrcLLJITRef;
PLLVMOrcOpaqueLLJIT  = ^LLVMOrcOpaqueLLJIT;
PLLVMOrcOpaqueLLJITBuilder  = ^LLVMOrcOpaqueLLJITBuilder;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{===----------- llvm-c/LLJIT.h - OrcV2 LLJIT C bindings ----------*- C -*-===*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* This header declares the C interface to the LLJIT class in                 *|
|* libLLVMOrcJIT.a, which provides a simple MCJIT-like ORC JIT.               *|
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
{$ifndef LLVM_C_LLJIT_H}
{$define LLVM_C_LLJIT_H}
{$include "llvm-c/Error.h"}
{$include "llvm-c/Orc.h"}
{$include "llvm-c/TargetMachine.h"}
{$include "llvm-c/Types.h"}
{*
 * @defgroup LLVMCExecutionEngineLLJIT LLJIT
 * @ingroup LLVMCExecutionEngine
 *
 * @
  }
{*
 * A function for constructing an ObjectLinkingLayer instance to be used
 * by an LLJIT instance.
 *
 * Clients can call LLVMOrcLLJITBuilderSetObjectLinkingLayerCreator to
 * set the creator function to use when constructing an LLJIT instance.
 * This can be used to override the default linking layer implementation
 * that would otherwise be chosen by LLJITBuilder.
 *
 * Object linking layers returned by this function will become owned by the
 * LLJIT instance. The client is not responsible for managing their lifetimes
 * after the function returns.
  }
(* Const before type ignored *)
type

  TLLVMOrcLLJITBuilderObjectLinkingLayerCreatorFunction = function (Ctx:pointer; ES:TLLVMOrcExecutionSessionRef; Triple:Pchar):TLLVMOrcObjectLayerRef;cdecl;
{*
 * A reference to an orc::LLJITBuilder instance.
  }

  PLLVMOrcLLJITBuilderRef = ^TLLVMOrcLLJITBuilderRef;
  TLLVMOrcLLJITBuilderRef = PLLVMOrcOpaqueLLJITBuilder;
{*
 * A reference to an orc::LLJIT instance.
  }

  PLLVMOrcLLJITRef = ^TLLVMOrcLLJITRef;
  TLLVMOrcLLJITRef = PLLVMOrcOpaqueLLJIT;
{*
 * Create an LLVMOrcLLJITBuilder.
 *
 * The client owns the resulting LLJITBuilder and should dispose of it using
 * LLVMOrcDisposeLLJITBuilder once they are done with it.
  }

function LLVMOrcCreateLLJITBuilder:TLLVMOrcLLJITBuilderRef;cdecl;external;
{*
 * Dispose of an LLVMOrcLLJITBuilderRef. This should only be called if ownership
 * has not been passed to LLVMOrcCreateLLJIT (e.g. because some error prevented
 * that function from being called).
  }
procedure LLVMOrcDisposeLLJITBuilder(Builder:TLLVMOrcLLJITBuilderRef);cdecl;external;
{*
 * Set the JITTargetMachineBuilder to be used when constructing the LLJIT
 * instance. Calling this function is optional: if it is not called then the
 * LLJITBuilder will use JITTargeTMachineBuilder::detectHost to construct a
 * JITTargetMachineBuilder.
 *
 * This function takes ownership of the JTMB argument: clients should not
 * dispose of the JITTargetMachineBuilder after calling this function.
  }
procedure LLVMOrcLLJITBuilderSetJITTargetMachineBuilder(Builder:TLLVMOrcLLJITBuilderRef; JTMB:TLLVMOrcJITTargetMachineBuilderRef);cdecl;external;
{*
 * Set an ObjectLinkingLayer creator function for this LLJIT instance.
  }
procedure LLVMOrcLLJITBuilderSetObjectLinkingLayerCreator(Builder:TLLVMOrcLLJITBuilderRef; F:TLLVMOrcLLJITBuilderObjectLinkingLayerCreatorFunction; Ctx:pointer);cdecl;external;
{*
 * Create an LLJIT instance from an LLJITBuilder.
 *
 * This operation takes ownership of the Builder argument: clients should not
 * dispose of the builder after calling this function (even if the function
 * returns an error). If a null Builder argument is provided then a
 * default-constructed LLJITBuilder will be used.
 *
 * On success the resulting LLJIT instance is uniquely owned by the client and
 * automatically manages the memory of all JIT'd code and all modules that are
 * transferred to it (e.g. via LLVMOrcLLJITAddLLVMIRModule). Disposing of the
 * LLJIT instance will free all memory managed by the JIT, including JIT'd code
 * and not-yet compiled modules.
  }
function LLVMOrcCreateLLJIT(Result:PLLVMOrcLLJITRef; Builder:TLLVMOrcLLJITBuilderRef):TLLVMErrorRef;cdecl;external;
{*
 * Dispose of an LLJIT instance.
  }
function LLVMOrcDisposeLLJIT(J:TLLVMOrcLLJITRef):TLLVMErrorRef;cdecl;external;
{*
 * Get a reference to the ExecutionSession for this LLJIT instance.
 *
 * The ExecutionSession is owned by the LLJIT instance. The client is not
 * responsible for managing its memory.
  }
function LLVMOrcLLJITGetExecutionSession(J:TLLVMOrcLLJITRef):TLLVMOrcExecutionSessionRef;cdecl;external;
{*
 * Return a reference to the Main JITDylib.
 *
 * The JITDylib is owned by the LLJIT instance. The client is not responsible
 * for managing its memory.
  }
function LLVMOrcLLJITGetMainJITDylib(J:TLLVMOrcLLJITRef):TLLVMOrcJITDylibRef;cdecl;external;
{*
 * Return the target triple for this LLJIT instance. This string is owned by
 * the LLJIT instance and should not be freed by the client.
  }
(* Const before type ignored *)
function LLVMOrcLLJITGetTripleString(J:TLLVMOrcLLJITRef):Pchar;cdecl;external;
{*
 * Returns the global prefix character according to the LLJIT's DataLayout.
  }
function LLVMOrcLLJITGetGlobalPrefix(J:TLLVMOrcLLJITRef):char;cdecl;external;
{*
 * Mangles the given string according to the LLJIT instance's DataLayout, then
 * interns the result in the SymbolStringPool and returns a reference to the
 * pool entry. Clients should call LLVMOrcReleaseSymbolStringPoolEntry to
 * decrement the ref-count on the pool entry once they are finished with this
 * value.
  }
(* Const before type ignored *)
function LLVMOrcLLJITMangleAndIntern(J:TLLVMOrcLLJITRef; UnmangledName:Pchar):TLLVMOrcSymbolStringPoolEntryRef;cdecl;external;
{*
 * Add a buffer representing an object file to the given JITDylib in the given
 * LLJIT instance. This operation transfers ownership of the buffer to the
 * LLJIT instance. The buffer should not be disposed of or referenced once this
 * function returns.
 *
 * Resources associated with the given object will be tracked by the given
 * JITDylib's default resource tracker.
  }
function LLVMOrcLLJITAddObjectFile(J:TLLVMOrcLLJITRef; JD:TLLVMOrcJITDylibRef; ObjBuffer:TLLVMMemoryBufferRef):TLLVMErrorRef;cdecl;external;
{*
 * Add a buffer representing an object file to the given ResourceTracker's
 * JITDylib in the given LLJIT instance. This operation transfers ownership of
 * the buffer to the LLJIT instance. The buffer should not be disposed of or
 * referenced once this function returns.
 *
 * Resources associated with the given object will be tracked by ResourceTracker
 * RT.
  }
function LLVMOrcLLJITAddObjectFileWithRT(J:TLLVMOrcLLJITRef; RT:TLLVMOrcResourceTrackerRef; ObjBuffer:TLLVMMemoryBufferRef):TLLVMErrorRef;cdecl;external;
{*
 * Add an IR module to the given JITDylib in the given LLJIT instance. This
 * operation transfers ownership of the TSM argument to the LLJIT instance.
 * The TSM argument should not be disposed of or referenced once this
 * function returns.
 *
 * Resources associated with the given Module will be tracked by the given
 * JITDylib's default resource tracker.
  }
function LLVMOrcLLJITAddLLVMIRModule(J:TLLVMOrcLLJITRef; JD:TLLVMOrcJITDylibRef; TSM:TLLVMOrcThreadSafeModuleRef):TLLVMErrorRef;cdecl;external;
{*
 * Add an IR module to the given ResourceTracker's JITDylib in the given LLJIT
 * instance. This operation transfers ownership of the TSM argument to the LLJIT
 * instance. The TSM argument should not be disposed of or referenced once this
 * function returns.
 *
 * Resources associated with the given Module will be tracked by ResourceTracker
 * RT.
  }
function LLVMOrcLLJITAddLLVMIRModuleWithRT(J:TLLVMOrcLLJITRef; JD:TLLVMOrcResourceTrackerRef; TSM:TLLVMOrcThreadSafeModuleRef):TLLVMErrorRef;cdecl;external;
{*
 * Look up the given symbol in the main JITDylib of the given LLJIT instance.
 *
 * This operation does not take ownership of the Name argument.
  }
(* Const before type ignored *)
function LLVMOrcLLJITLookup(J:TLLVMOrcLLJITRef; Result:PLLVMOrcExecutorAddress; Name:Pchar):TLLVMErrorRef;cdecl;external;
{*
 * Returns a non-owning reference to the LLJIT instance's object linking layer.
  }
function LLVMOrcLLJITGetObjLinkingLayer(J:TLLVMOrcLLJITRef):TLLVMOrcObjectLayerRef;cdecl;external;
{*
 * Returns a non-owning reference to the LLJIT instance's object linking layer.
  }
function LLVMOrcLLJITGetObjTransformLayer(J:TLLVMOrcLLJITRef):TLLVMOrcObjectTransformLayerRef;cdecl;external;
{*
 * Returns a non-owning reference to the LLJIT instance's IR transform layer.
  }
function LLVMOrcLLJITGetIRTransformLayer(J:TLLVMOrcLLJITRef):TLLVMOrcIRTransformLayerRef;cdecl;external;
{*
 * Get the LLJIT instance's default data layout string.
 *
 * This string is owned by the LLJIT instance and does not need to be freed
 * by the caller.
  }
(* Const before type ignored *)
function LLVMOrcLLJITGetDataLayoutStr(J:TLLVMOrcLLJITRef):Pchar;cdecl;external;
{*
 * @
  }
{$endif}
{ LLVM_C_LLJIT_H  }

implementation


end.
