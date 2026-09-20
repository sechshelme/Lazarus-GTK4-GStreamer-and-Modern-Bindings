unit Core;

interface

uses
  fp_llvm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{===-- llvm-c/Core.h - Core Library C Interface ------------------*- C -*-===*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* This header declares the C interface to libLLVMCore.a, which implements    *|
|* the LLVM intermediate representation.                                      *|
|*                                                                            *|
\*===----------------------------------------------------------------------=== }
{$ifndef LLVM_C_CORE_H}
{$define LLVM_C_CORE_H}
{$include "llvm-c/Deprecated.h"}
{$include "llvm-c/ErrorHandling.h"}
{$include "llvm-c/ExternC.h"}
{$include "llvm-c/Types.h"}
{*
 * @defgroup LLVMC LLVM-C: C interface to LLVM
 *
 * This module exposes parts of the LLVM library as a C API.
 *
 * @
  }
{*
 * @defgroup LLVMCTransforms Transforms
  }
{*
 * @defgroup LLVMCCore Core
 *
 * This modules provide an interface to libLLVMCore, which implements
 * the LLVM intermediate representation as well as other related types
 * and utilities.
 *
 * Many exotic languages can interoperate with C code but have a harder time
 * with C++ due to name mangling. So in addition to C, this interface enables
 * tools written in such languages.
 *
 * @
  }
{*
 * @defgroup LLVMCCoreTypes Types and Enumerations
 *
 * @
  }
{/ External users depend on the following values being stable. It is not safe }
{/ to reorder them. }
{ Terminator Instructions  }
{ removed 6 due to API changes  }
{ Standard Unary Operators  }
{ Standard Binary Operators  }
{ Logical Operators  }
{ Memory Operators  }
{ Cast Operators  }
{ Other Operators  }
{ Atomic operators  }
{ Exception Handling Operators  }
type
  PLLVMOpcode = ^TLLVMOpcode;
  TLLVMOpcode =  Longint;
  Const
    LLVMRet = 1;
    LLVMBr = 2;
    LLVMSwitch = 3;
    LLVMIndirectBr = 4;
    LLVMInvoke = 5;
    LLVMUnreachable = 7;
    LLVMCallBr = 67;
    LLVMFNeg = 66;
    LLVMAdd = 8;
    LLVMFAdd = 9;
    LLVMSub = 10;
    LLVMFSub = 11;
    LLVMMul = 12;
    LLVMFMul = 13;
    LLVMUDiv = 14;
    LLVMSDiv = 15;
    LLVMFDiv = 16;
    LLVMURem = 17;
    LLVMSRem = 18;
    LLVMFRem = 19;
    LLVMShl = 20;
    LLVMLShr = 21;
    LLVMAShr = 22;
    LLVMAnd = 23;
    LLVMOr = 24;
    LLVMXor = 25;
    LLVMAlloca = 26;
    LLVMLoad = 27;
    LLVMStore = 28;
    LLVMGetElementPtr = 29;
    LLVMTrunc = 30;
    LLVMZExt = 31;
    LLVMSExt = 32;
    LLVMFPToUI = 33;
    LLVMFPToSI = 34;
    LLVMUIToFP = 35;
    LLVMSIToFP = 36;
    LLVMFPTrunc = 37;
    LLVMFPExt = 38;
    LLVMPtrToInt = 39;
    LLVMIntToPtr = 40;
    LLVMBitCast = 41;
    LLVMAddrSpaceCast = 60;
    LLVMICmp = 42;
    LLVMFCmp = 43;
    LLVMPHI = 44;
    LLVMCall = 45;
    LLVMSelect = 46;
    LLVMUserOp1 = 47;
    LLVMUserOp2 = 48;
    LLVMVAArg = 49;
    LLVMExtractElement = 50;
    LLVMInsertElement = 51;
    LLVMShuffleVector = 52;
    LLVMExtractValue = 53;
    LLVMInsertValue = 54;
    LLVMFreeze = 68;
    LLVMFence = 55;
    LLVMAtomicCmpXchg = 56;
    LLVMAtomicRMW = 57;
    LLVMResume = 58;
    LLVMLandingPad = 59;
    LLVMCleanupRet = 61;
    LLVMCatchRet = 62;
    LLVMCatchPad = 63;
    LLVMCleanupPad = 64;
    LLVMCatchSwitch = 65;
;
{*< type with no size  }
{*< 16 bit floating point type  }
{*< 32 bit floating point type  }
{*< 64 bit floating point type  }
{*< 80 bit floating point type (X87)  }
{*< 128 bit floating point type (112-bit mantissa) }
{*< 128 bit floating point type (two 64-bits)  }
{*< Labels  }
{*< Arbitrary bit width integers  }
{*< Functions  }
{*< Structures  }
{*< Arrays  }
{*< Pointers  }
{*< Fixed width SIMD vector type  }
{*< Metadata  }
{ 15 previously used by LLVMX86_MMXTypeKind  }
{*< Tokens  }
{*< Scalable SIMD vector type  }
{*< 16 bit brain floating point type  }
{*< X86 AMX  }
{*< Target extension type  }
type
  PLLVMTypeKind = ^TLLVMTypeKind;
  TLLVMTypeKind =  Longint;
  Const
    LLVMVoidTypeKind = 0;
    LLVMHalfTypeKind = 1;
    LLVMFloatTypeKind = 2;
    LLVMDoubleTypeKind = 3;
    LLVMX86_FP80TypeKind = 4;
    LLVMFP128TypeKind = 5;
    LLVMPPC_FP128TypeKind = 6;
    LLVMLabelTypeKind = 7;
    LLVMIntegerTypeKind = 8;
    LLVMFunctionTypeKind = 9;
    LLVMStructTypeKind = 10;
    LLVMArrayTypeKind = 11;
    LLVMPointerTypeKind = 12;
    LLVMVectorTypeKind = 13;
    LLVMMetadataTypeKind = 14;
    LLVMTokenTypeKind = 16;
    LLVMScalableVectorTypeKind = 17;
    LLVMBFloatTypeKind = 18;
    LLVMX86_AMXTypeKind = 19;
    LLVMTargetExtTypeKind = 20;
;
{*< Externally visible function  }
{*< Keep one copy of function when linking (inline) }
{*< Same, but only replaced by something
                            equivalent.  }
{*< Obsolete  }
{*< Keep one copy of function when linking (weak)  }
{*< Same, but only replaced by something
                            equivalent.  }
{*< Special purpose, only applies to global arrays  }
{*< Rename collisions when linking (static
                               functions)  }
{*< Like Internal, but omit from symbol table  }
{*< Obsolete  }
{*< Obsolete  }
{*< ExternalWeak linkage description  }
{*< Obsolete  }
{*< Tentative definitions  }
{*< Like Private, but linker removes.  }
{*< Like LinkerPrivate, but is weak.  }
type
  PLLVMLinkage = ^TLLVMLinkage;
  TLLVMLinkage =  Longint;
  Const
    LLVMExternalLinkage = 0;
    LLVMAvailableExternallyLinkage = 1;
    LLVMLinkOnceAnyLinkage = 2;
    LLVMLinkOnceODRLinkage = 3;
    LLVMLinkOnceODRAutoHideLinkage = 4;
    LLVMWeakAnyLinkage = 5;
    LLVMWeakODRLinkage = 6;
    LLVMAppendingLinkage = 7;
    LLVMInternalLinkage = 8;
    LLVMPrivateLinkage = 9;
    LLVMDLLImportLinkage = 10;
    LLVMDLLExportLinkage = 11;
    LLVMExternalWeakLinkage = 12;
    LLVMGhostLinkage = 13;
    LLVMCommonLinkage = 14;
    LLVMLinkerPrivateLinkage = 15;
    LLVMLinkerPrivateWeakLinkage = 16;
;
{*< The GV is visible  }
{*< The GV is hidden  }
{*< The GV is protected  }
type
  PLLVMVisibility = ^TLLVMVisibility;
  TLLVMVisibility =  Longint;
  Const
    LLVMDefaultVisibility = 0;
    LLVMHiddenVisibility = 1;
    LLVMProtectedVisibility = 2;
;
{*< Address of the GV is significant.  }
{*< Address of the GV is locally insignificant.  }
{*< Address of the GV is globally insignificant.  }
type
  PLLVMUnnamedAddr = ^TLLVMUnnamedAddr;
  TLLVMUnnamedAddr =  Longint;
  Const
    LLVMNoUnnamedAddr = 0;
    LLVMLocalUnnamedAddr = 1;
    LLVMGlobalUnnamedAddr = 2;
;
{*< Function to be imported from DLL.  }
{*< Function to be accessible from DLL.  }
type
  PLLVMDLLStorageClass = ^TLLVMDLLStorageClass;
  TLLVMDLLStorageClass =  Longint;
  Const
    LLVMDefaultStorageClass = 0;
    LLVMDLLImportStorageClass = 1;
    LLVMDLLExportStorageClass = 2;
;
type
  PLLVMCallConv = ^TLLVMCallConv;
  TLLVMCallConv =  Longint;
  Const
    LLVMCCallConv = 0;
    LLVMFastCallConv = 8;
    LLVMColdCallConv = 9;
    LLVMGHCCallConv = 10;
    LLVMHiPECallConv = 11;
    LLVMAnyRegCallConv = 13;
    LLVMPreserveMostCallConv = 14;
    LLVMPreserveAllCallConv = 15;
    LLVMSwiftCallConv = 16;
    LLVMCXXFASTTLSCallConv = 17;
    LLVMX86StdcallCallConv = 64;
    LLVMX86FastcallCallConv = 65;
    LLVMARMAPCSCallConv = 66;
    LLVMARMAAPCSCallConv = 67;
    LLVMARMAAPCSVFPCallConv = 68;
    LLVMMSP430INTRCallConv = 69;
    LLVMX86ThisCallCallConv = 70;
    LLVMPTXKernelCallConv = 71;
    LLVMPTXDeviceCallConv = 72;
    LLVMSPIRFUNCCallConv = 75;
    LLVMSPIRKERNELCallConv = 76;
    LLVMIntelOCLBICallConv = 77;
    LLVMX8664SysVCallConv = 78;
    LLVMWin64CallConv = 79;
    LLVMX86VectorCallCallConv = 80;
    LLVMHHVMCallConv = 81;
    LLVMHHVMCCallConv = 82;
    LLVMX86INTRCallConv = 83;
    LLVMAVRINTRCallConv = 84;
    LLVMAVRSIGNALCallConv = 85;
    LLVMAVRBUILTINCallConv = 86;
    LLVMAMDGPUVSCallConv = 87;
    LLVMAMDGPUGSCallConv = 88;
    LLVMAMDGPUPSCallConv = 89;
    LLVMAMDGPUCSCallConv = 90;
    LLVMAMDGPUKERNELCallConv = 91;
    LLVMX86RegCallCallConv = 92;
    LLVMAMDGPUHSCallConv = 93;
    LLVMMSP430BUILTINCallConv = 94;
    LLVMAMDGPULSCallConv = 95;
    LLVMAMDGPUESCallConv = 96;
;
type
  PLLVMValueKind = ^TLLVMValueKind;
  TLLVMValueKind =  Longint;
  Const
    LLVMArgumentValueKind = 0;
    LLVMBasicBlockValueKind = 1;
    LLVMMemoryUseValueKind = 2;
    LLVMMemoryDefValueKind = 3;
    LLVMMemoryPhiValueKind = 4;
    LLVMFunctionValueKind = 5;
    LLVMGlobalAliasValueKind = 6;
    LLVMGlobalIFuncValueKind = 7;
    LLVMGlobalVariableValueKind = 8;
    LLVMBlockAddressValueKind = 9;
    LLVMConstantExprValueKind = 10;
    LLVMConstantArrayValueKind = 11;
    LLVMConstantStructValueKind = 12;
    LLVMConstantVectorValueKind = 13;
    LLVMUndefValueValueKind = 14;
    LLVMConstantAggregateZeroValueKind = 15;
    LLVMConstantDataArrayValueKind = 16;
    LLVMConstantDataVectorValueKind = 17;
    LLVMConstantIntValueKind = 18;
    LLVMConstantFPValueKind = 19;
    LLVMConstantPointerNullValueKind = 20;
    LLVMConstantTokenNoneValueKind = 21;
    LLVMMetadataAsValueValueKind = 22;
    LLVMInlineAsmValueKind = 23;
    LLVMInstructionValueKind = 24;
    LLVMPoisonValueValueKind = 25;
    LLVMConstantTargetNoneValueKind = 26;
    LLVMConstantPtrAuthValueKind = 27;
;
{*< equal  }
{*< not equal  }
{*< unsigned greater than  }
{*< unsigned greater or equal  }
{*< unsigned less than  }
{*< unsigned less or equal  }
{*< signed greater than  }
{*< signed greater or equal  }
{*< signed less than  }
{*< signed less or equal  }
type
  PLLVMIntPredicate = ^TLLVMIntPredicate;
  TLLVMIntPredicate =  Longint;
  Const
    LLVMIntEQ = 32;
    LLVMIntNE = 33;
    LLVMIntUGT = 34;
    LLVMIntUGE = 35;
    LLVMIntULT = 36;
    LLVMIntULE = 37;
    LLVMIntSGT = 38;
    LLVMIntSGE = 39;
    LLVMIntSLT = 40;
    LLVMIntSLE = 41;
;
{*< Always false (always folded)  }
{*< True if ordered and equal  }
{*< True if ordered and greater than  }
{*< True if ordered and greater than or equal  }
{*< True if ordered and less than  }
{*< True if ordered and less than or equal  }
{*< True if ordered and operands are unequal  }
{*< True if ordered (no nans)  }
{*< True if unordered: isnan(X) | isnan(Y)  }
{*< True if unordered or equal  }
{*< True if unordered or greater than  }
{*< True if unordered, greater than, or equal  }
{*< True if unordered or less than  }
{*< True if unordered, less than, or equal  }
{*< True if unordered or not equal  }
{*< Always true (always folded)  }
type
  PLLVMRealPredicate = ^TLLVMRealPredicate;
  TLLVMRealPredicate =  Longint;
  Const
    LLVMRealPredicateFalse = 0;
    LLVMRealOEQ = 1;
    LLVMRealOGT = 2;
    LLVMRealOGE = 3;
    LLVMRealOLT = 4;
    LLVMRealOLE = 5;
    LLVMRealONE = 6;
    LLVMRealORD = 7;
    LLVMRealUNO = 8;
    LLVMRealUEQ = 9;
    LLVMRealUGT = 10;
    LLVMRealUGE = 11;
    LLVMRealULT = 12;
    LLVMRealULE = 13;
    LLVMRealUNE = 14;
    LLVMRealPredicateTrue = 15;
;
{*< A catch clause    }
{*< A filter clause   }
type
  PLLVMLandingPadClauseTy = ^TLLVMLandingPadClauseTy;
  TLLVMLandingPadClauseTy =  Longint;
  Const
    LLVMLandingPadCatch = 0;
    LLVMLandingPadFilter = 1;
;
type
  PLLVMThreadLocalMode = ^TLLVMThreadLocalMode;
  TLLVMThreadLocalMode =  Longint;
  Const
    LLVMNotThreadLocal = 0;
    LLVMGeneralDynamicTLSModel = 1;
    LLVMLocalDynamicTLSModel = 2;
    LLVMInitialExecTLSModel = 3;
    LLVMLocalExecTLSModel = 4;
;
{*< A load or store which is not atomic  }
{*< Lowest level of atomicity, guarantees
                                     somewhat sane results, lock free.  }
{*< guarantees that if you take all the
                                     operations affecting a specific address,
                                     a consistent ordering exists  }
{*< Acquire provides a barrier of the sort
                                   necessary to acquire a lock to access other
                                   memory with normal loads and stores.  }
{*< Release is similar to Acquire, but with
                                   a barrier of the sort necessary to release
                                   a lock.  }
{*< provides both an Acquire and a
                                          Release barrier (for fences and
                                          operations which both read and write
                                           memory).  }
{*< provides Acquire semantics
                                                 for loads and Release
                                                 semantics for stores.
                                                 Additionally, it guarantees
                                                 that a total ordering exists
                                                 between all
                                                 SequentiallyConsistent
                                                 operations.  }
type
  PLLVMAtomicOrdering = ^TLLVMAtomicOrdering;
  TLLVMAtomicOrdering =  Longint;
  Const
    LLVMAtomicOrderingNotAtomic = 0;
    LLVMAtomicOrderingUnordered = 1;
    LLVMAtomicOrderingMonotonic = 2;
    LLVMAtomicOrderingAcquire = 4;
    LLVMAtomicOrderingRelease = 5;
    LLVMAtomicOrderingAcquireRelease = 6;
    LLVMAtomicOrderingSequentiallyConsistent = 7;
;
{*< Set the new value and return the one old  }
{*< Add a value and return the old one  }
{*< Subtract a value and return the old one  }
{*< And a value and return the old one  }
{*< Not-And a value and return the old one  }
{*< OR a value and return the old one  }
{*< Xor a value and return the old one  }
{*< Sets the value if it's greater than the
                            original using a signed comparison and return
                            the old one  }
{*< Sets the value if it's Smaller than the
                            original using a signed comparison and return
                            the old one  }
{*< Sets the value if it's greater than the
                           original using an unsigned comparison and return
                           the old one  }
{*< Sets the value if it's greater than the
                            original using an unsigned comparison and return
                            the old one  }
{*< Add a floating point value and return the
                            old one  }
{*< Subtract a floating point value and return the
                          old one  }
{*< Sets the value if it's greater than the
                           original using an floating point comparison and
                           return the old one  }
{*< Sets the value if it's smaller than the
                           original using an floating point comparison and
                           return the old one  }
{*< Increments the value, wrapping back to zero
                               when incremented above input value  }
{*< Decrements the value, wrapping back to
                               the input value when decremented below zero  }
{*<Subtracts the value only if no unsigned
                                 overflow  }
{*<Subtracts the value, clamping to zero  }
type
  PLLVMAtomicRMWBinOp = ^TLLVMAtomicRMWBinOp;
  TLLVMAtomicRMWBinOp =  Longint;
  Const
    LLVMAtomicRMWBinOpXchg = 0;
    LLVMAtomicRMWBinOpAdd = 1;
    LLVMAtomicRMWBinOpSub = 2;
    LLVMAtomicRMWBinOpAnd = 3;
    LLVMAtomicRMWBinOpNand = 4;
    LLVMAtomicRMWBinOpOr = 5;
    LLVMAtomicRMWBinOpXor = 6;
    LLVMAtomicRMWBinOpMax = 7;
    LLVMAtomicRMWBinOpMin = 8;
    LLVMAtomicRMWBinOpUMax = 9;
    LLVMAtomicRMWBinOpUMin = 10;
    LLVMAtomicRMWBinOpFAdd = 11;
    LLVMAtomicRMWBinOpFSub = 12;
    LLVMAtomicRMWBinOpFMax = 13;
    LLVMAtomicRMWBinOpFMin = 14;
    LLVMAtomicRMWBinOpUIncWrap = 15;
    LLVMAtomicRMWBinOpUDecWrap = 16;
    LLVMAtomicRMWBinOpUSubCond = 17;
    LLVMAtomicRMWBinOpUSubSat = 18;
;
type
  PLLVMDiagnosticSeverity = ^TLLVMDiagnosticSeverity;
  TLLVMDiagnosticSeverity =  Longint;
  Const
    LLVMDSError = 0;
    LLVMDSWarning = 1;
    LLVMDSRemark = 2;
    LLVMDSNote = 3;
;
type
  PLLVMInlineAsmDialect = ^TLLVMInlineAsmDialect;
  TLLVMInlineAsmDialect =  Longint;
  Const
    LLVMInlineAsmDialectATT = 0;
    LLVMInlineAsmDialectIntel = 1;
;
{*
   * Emits an error if two values disagree, otherwise the resulting value is
   * that of the operands.
   *
   * @see Module::ModFlagBehavior::Error
    }
{*
   * Emits a warning if two values disagree. The result value will be the
   * operand for the flag from the first module being linked.
   *
   * @see Module::ModFlagBehavior::Warning
    }
{*
   * Adds a requirement that another module flag be present and have a
   * specified value after linking is performed. The value must be a metadata
   * pair, where the first element of the pair is the ID of the module flag
   * to be restricted, and the second element of the pair is the value the
   * module flag should be restricted to. This behavior can be used to
   * restrict the allowable results (via triggering of an error) of linking
   * IDs with the **Override** behavior.
   *
   * @see Module::ModFlagBehavior::Require
    }
{*
   * Uses the specified value, regardless of the behavior or value of the
   * other module. If both modules specify **Override**, but the values
   * differ, an error will be emitted.
   *
   * @see Module::ModFlagBehavior::Override
    }
{*
   * Appends the two values, which are required to be metadata nodes.
   *
   * @see Module::ModFlagBehavior::Append
    }
{*
   * Appends the two values, which are required to be metadata
   * nodes. However, duplicate entries in the second list are dropped
   * during the append operation.
   *
   * @see Module::ModFlagBehavior::AppendUnique
    }
type
  PLLVMModuleFlagBehavior = ^TLLVMModuleFlagBehavior;
  TLLVMModuleFlagBehavior =  Longint;
  Const
    LLVMModuleFlagBehaviorError = 0;
    LLVMModuleFlagBehaviorWarning = 1;
    LLVMModuleFlagBehaviorRequire = 2;
    LLVMModuleFlagBehaviorOverride = 3;
    LLVMModuleFlagBehaviorAppend = 4;
    LLVMModuleFlagBehaviorAppendUnique = 5;
;
{*
 * Attribute index are either LLVMAttributeReturnIndex,
 * LLVMAttributeFunctionIndex or a parameter number from 1 to N.
  }
type
  Txxxxxxx =  Longint;
  Const
    LLVMAttributeReturnIndex = 0;
    LLVMAttributeFunctionIndex = -(1);

type
  PLLVMAttributeIndex = ^TLLVMAttributeIndex;
  TLLVMAttributeIndex = dword;
{*
 * Tail call kind for LLVMSetTailCallKind and LLVMGetTailCallKind.
 *
 * Note that 'musttail' implies 'tail'.
 *
 * @see CallInst::TailCallKind
  }

  PLLVMTailCallKind = ^TLLVMTailCallKind;
  TLLVMTailCallKind =  Longint;
  Const
    LLVMTailCallKindNone = 0;
    LLVMTailCallKindTail = 1;
    LLVMTailCallKindMustTail = 2;
    LLVMTailCallKindNoTail = 3;
;
type
  Txxxxxxxx =  Longint;
  Const
    LLVMFastMathAllowReassoc = 1 shl 0;
    LLVMFastMathNoNaNs = 1 shl 1;
    LLVMFastMathNoInfs = 1 shl 2;
    LLVMFastMathNoSignedZeros = 1 shl 3;
    LLVMFastMathAllowReciprocal = 1 shl 4;
    LLVMFastMathAllowContract = 1 shl 5;
    LLVMFastMathApproxFunc = 1 shl 6;
    LLVMFastMathNone = 0;
    LLVMFastMathAll = (((((LLVMFastMathAllowReassoc or LLVMFastMathNoNaNs) or LLVMFastMathNoInfs) or LLVMFastMathNoSignedZeros) or LLVMFastMathAllowReciprocal) or LLVMFastMathAllowContract) or LLVMFastMathApproxFunc;

{*
 * Flags to indicate what fast-math-style optimizations are allowed
 * on operations.
 *
 * See https://llvm.org/docs/LangRef.html#fast-math-flags
  }
type
  PLLVMFastMathFlags = ^TLLVMFastMathFlags;
  TLLVMFastMathFlags = dword;
  Txxxxxxxxx =  Longint;
  Const
    LLVMGEPFlagInBounds = 1 shl 0;
    LLVMGEPFlagNUSW = 1 shl 1;
    LLVMGEPFlagNUW = 1 shl 2;

{*
 * Flags that constrain the allowed wrap semantics of a getelementptr
 * instruction.
 *
 * See https://llvm.org/docs/LangRef.html#getelementptr-instruction
  }
type
  PLLVMGEPNoWrapFlags = ^TLLVMGEPNoWrapFlags;
  TLLVMGEPNoWrapFlags = dword;
{*
 * @
  }
{* Deallocate and destroy all ManagedStatic variables.
    @see llvm::llvm_shutdown
    @see ManagedStatic  }

procedure LLVMShutdown;cdecl;external libllvm;
{===-- Version query -----------------------------------------------------=== }
{*
 * Return the major, minor, and patch version of LLVM
 *
 * The version components are returned via the function's three output
 * parameters or skipped if a NULL pointer was supplied.
  }
procedure LLVMGetVersion(Major:Pdword; Minor:Pdword; Patch:Pdword);cdecl;external libllvm;
{===-- Error handling ----------------------------------------------------=== }
function LLVMCreateMessage(Message:Pchar):Pchar;cdecl;external libllvm;
procedure LLVMDisposeMessage(Message:Pchar);cdecl;external libllvm;
{*
 * @defgroup LLVMCCoreContext Contexts
 *
 * Contexts are execution states for the core LLVM IR system.
 *
 * Most types are tied to a context instance. Multiple contexts can
 * exist simultaneously. A single context is not thread safe. However,
 * different contexts can execute on different threads simultaneously.
 *
 * @
  }
type

  TLLVMDiagnosticHandler = procedure (para1:TLLVMDiagnosticInfoRef; para2:pointer);cdecl;

  TLLVMYieldCallback = procedure (para1:TLLVMContextRef; para2:pointer);cdecl;
{*
 * Create a new context.
 *
 * Every call to this function should be paired with a call to
 * LLVMContextDispose() or the context will leak memory.
  }

function LLVMContextCreate:TLLVMContextRef;cdecl;external libllvm;
{*
 * Obtain the global context instance.
  }
function LLVMGetGlobalContext:TLLVMContextRef;cdecl;external libllvm;
{*
 * Set the diagnostic handler for this context.
  }
procedure LLVMContextSetDiagnosticHandler(C:TLLVMContextRef; Handler:TLLVMDiagnosticHandler; DiagnosticContext:pointer);cdecl;external libllvm;
{*
 * Get the diagnostic handler of this context.
  }
function LLVMContextGetDiagnosticHandler(C:TLLVMContextRef):TLLVMDiagnosticHandler;cdecl;external libllvm;
{*
 * Get the diagnostic context of this context.
  }
function LLVMContextGetDiagnosticContext(C:TLLVMContextRef):pointer;cdecl;external libllvm;
{*
 * Set the yield callback function for this context.
 *
 * @see LLVMContext::setYieldCallback()
  }
procedure LLVMContextSetYieldCallback(C:TLLVMContextRef; Callback:TLLVMYieldCallback; OpaqueHandle:pointer);cdecl;external libllvm;
{*
 * Retrieve whether the given context is set to discard all value names.
 *
 * @see LLVMContext::shouldDiscardValueNames()
  }
function LLVMContextShouldDiscardValueNames(C:TLLVMContextRef):TLLVMBool;cdecl;external libllvm;
{*
 * Set whether the given context discards all value names.
 *
 * If true, only the names of GlobalValue objects will be available in the IR.
 * This can be used to save memory and runtime, especially in release mode.
 *
 * @see LLVMContext::setDiscardValueNames()
  }
procedure LLVMContextSetDiscardValueNames(C:TLLVMContextRef; Discard:TLLVMBool);cdecl;external libllvm;
{*
 * Destroy a context instance.
 *
 * This should be called for every call to LLVMContextCreate() or memory
 * will be leaked.
  }
procedure LLVMContextDispose(C:TLLVMContextRef);cdecl;external libllvm;
{*
 * Return a string representation of the DiagnosticInfo. Use
 * LLVMDisposeMessage to free the string.
 *
 * @see DiagnosticInfo::print()
  }
function LLVMGetDiagInfoDescription(DI:TLLVMDiagnosticInfoRef):Pchar;cdecl;external libllvm;
{*
 * Return an enum LLVMDiagnosticSeverity.
 *
 * @see DiagnosticInfo::getSeverity()
  }
function LLVMGetDiagInfoSeverity(DI:TLLVMDiagnosticInfoRef):TLLVMDiagnosticSeverity;cdecl;external libllvm;
function LLVMGetMDKindIDInContext(C:TLLVMContextRef; Name:Pchar; SLen:dword):dword;cdecl;external libllvm;
function LLVMGetMDKindID(Name:Pchar; SLen:dword):dword;cdecl;external libllvm;
{*
 * Maps a synchronization scope name to a ID unique within this context.
  }
function LLVMGetSyncScopeID(C:TLLVMContextRef; Name:Pchar; SLen:Tsize_t):dword;cdecl;external libllvm;
{*
 * Return an unique id given the name of a enum attribute,
 * or 0 if no attribute by that name exists.
 *
 * See http://llvm.org/docs/LangRef.html#parameter-attributes
 * and http://llvm.org/docs/LangRef.html#function-attributes
 * for the list of available attributes.
 *
 * NB: Attribute names and/or id are subject to change without
 * going through the C API deprecation cycle.
  }
function LLVMGetEnumAttributeKindForName(Name:Pchar; SLen:Tsize_t):dword;cdecl;external libllvm;
function LLVMGetLastEnumAttributeKind:dword;cdecl;external libllvm;
{*
 * Create an enum attribute.
  }
function LLVMCreateEnumAttribute(C:TLLVMContextRef; KindID:dword; Val:Tuint64_t):TLLVMAttributeRef;cdecl;external libllvm;
{*
 * Get the unique id corresponding to the enum attribute
 * passed as argument.
  }
function LLVMGetEnumAttributeKind(A:TLLVMAttributeRef):dword;cdecl;external libllvm;
{*
 * Get the enum attribute's value. 0 is returned if none exists.
  }
function LLVMGetEnumAttributeValue(A:TLLVMAttributeRef):Tuint64_t;cdecl;external libllvm;
{*
 * Create a type attribute
  }
function LLVMCreateTypeAttribute(C:TLLVMContextRef; KindID:dword; type_ref:TLLVMTypeRef):TLLVMAttributeRef;cdecl;external libllvm;
{*
 * Get the type attribute's value.
  }
function LLVMGetTypeAttributeValue(A:TLLVMAttributeRef):TLLVMTypeRef;cdecl;external libllvm;
{*
 * Create a ConstantRange attribute.
 *
 * LowerWords and UpperWords need to be NumBits divided by 64 rounded up
 * elements long.
  }
function LLVMCreateConstantRangeAttribute(C:TLLVMContextRef; KindID:dword; NumBits:dword; LowerWords:Puint64_t; UpperWords:Puint64_t):TLLVMAttributeRef;cdecl;external libllvm;
{*
 * Create a string attribute.
  }
function LLVMCreateStringAttribute(C:TLLVMContextRef; K:Pchar; KLength:dword; V:Pchar; VLength:dword):TLLVMAttributeRef;cdecl;external libllvm;
{*
 * Get the string attribute's kind.
  }
function LLVMGetStringAttributeKind(A:TLLVMAttributeRef; Length:Pdword):Pchar;cdecl;external libllvm;
{*
 * Get the string attribute's value.
  }
function LLVMGetStringAttributeValue(A:TLLVMAttributeRef; Length:Pdword):Pchar;cdecl;external libllvm;
{*
 * Check for the different types of attributes.
  }
function LLVMIsEnumAttribute(A:TLLVMAttributeRef):TLLVMBool;cdecl;external libllvm;
function LLVMIsStringAttribute(A:TLLVMAttributeRef):TLLVMBool;cdecl;external libllvm;
function LLVMIsTypeAttribute(A:TLLVMAttributeRef):TLLVMBool;cdecl;external libllvm;
{*
 * Obtain a Type from a context by its registered name.
  }
function LLVMGetTypeByName2(C:TLLVMContextRef; Name:Pchar):TLLVMTypeRef;cdecl;external libllvm;
{*
 * @
  }
{*
 * @defgroup LLVMCCoreModule Modules
 *
 * Modules represent the top-level structure in an LLVM program. An LLVM
 * module is effectively a translation unit or a collection of
 * translation units merged together.
 *
 * @
  }
{*
 * Create a new, empty module in the global context.
 *
 * This is equivalent to calling LLVMModuleCreateWithNameInContext with
 * LLVMGetGlobalContext() as the context parameter.
 *
 * Every invocation should be paired with LLVMDisposeModule() or memory
 * will be leaked.
  }
function LLVMModuleCreateWithName(ModuleID:Pchar):TLLVMModuleRef;cdecl;external libllvm;
{*
 * Create a new, empty module in a specific context.
 *
 * Every invocation should be paired with LLVMDisposeModule() or memory
 * will be leaked.
  }
function LLVMModuleCreateWithNameInContext(ModuleID:Pchar; C:TLLVMContextRef):TLLVMModuleRef;cdecl;external libllvm;
{*
 * Return an exact copy of the specified module.
  }
function LLVMCloneModule(M:TLLVMModuleRef):TLLVMModuleRef;cdecl;external libllvm;
{*
 * Destroy a module instance.
 *
 * This must be called for every created module or memory will be
 * leaked.
  }
procedure LLVMDisposeModule(M:TLLVMModuleRef);cdecl;external libllvm;
{*
 * Soon to be deprecated.
 * See https://llvm.org/docs/RemoveDIsDebugInfo.html#c-api-changes
 *
 * Returns true if the module is in the new debug info mode which uses
 * non-instruction debug records instead of debug intrinsics for variable
 * location tracking.
  }
function LLVMIsNewDbgInfoFormat(M:TLLVMModuleRef):TLLVMBool;cdecl;external libllvm;
{*
 * Soon to be deprecated.
 * See https://llvm.org/docs/RemoveDIsDebugInfo.html#c-api-changes
 *
 * Convert module into desired debug info format.
  }
procedure LLVMSetIsNewDbgInfoFormat(M:TLLVMModuleRef; UseNewFormat:TLLVMBool);cdecl;external libllvm;
{*
 * Obtain the identifier of a module.
 *
 * @param M Module to obtain identifier of
 * @param Len Out parameter which holds the length of the returned string.
 * @return The identifier of M.
 * @see Module::getModuleIdentifier()
  }
function LLVMGetModuleIdentifier(M:TLLVMModuleRef; Len:Psize_t):Pchar;cdecl;external libllvm;
{*
 * Set the identifier of a module to a string Ident with length Len.
 *
 * @param M The module to set identifier
 * @param Ident The string to set M's identifier to
 * @param Len Length of Ident
 * @see Module::setModuleIdentifier()
  }
procedure LLVMSetModuleIdentifier(M:TLLVMModuleRef; Ident:Pchar; Len:Tsize_t);cdecl;external libllvm;
{*
 * Obtain the module's original source file name.
 *
 * @param M Module to obtain the name of
 * @param Len Out parameter which holds the length of the returned string
 * @return The original source file name of M
 * @see Module::getSourceFileName()
  }
function LLVMGetSourceFileName(M:TLLVMModuleRef; Len:Psize_t):Pchar;cdecl;external libllvm;
{*
 * Set the original source file name of a module to a string Name with length
 * Len.
 *
 * @param M The module to set the source file name of
 * @param Name The string to set M's source file name to
 * @param Len Length of Name
 * @see Module::setSourceFileName()
  }
procedure LLVMSetSourceFileName(M:TLLVMModuleRef; Name:Pchar; Len:Tsize_t);cdecl;external libllvm;
{*
 * Obtain the data layout for a module.
 *
 * @see Module::getDataLayoutStr()
 *
 * LLVMGetDataLayout is DEPRECATED, as the name is not only incorrect,
 * but match the name of another method on the module. Prefer the use
 * of LLVMGetDataLayoutStr, which is not ambiguous.
  }
function LLVMGetDataLayoutStr(M:TLLVMModuleRef):Pchar;cdecl;external libllvm;
function LLVMGetDataLayout(M:TLLVMModuleRef):Pchar;cdecl;external libllvm;
{*
 * Set the data layout for a module.
 *
 * @see Module::setDataLayout()
  }
procedure LLVMSetDataLayout(M:TLLVMModuleRef; DataLayoutStr:Pchar);cdecl;external libllvm;
{*
 * Obtain the target triple for a module.
 *
 * @see Module::getTargetTriple()
  }
function LLVMGetTarget(M:TLLVMModuleRef):Pchar;cdecl;external libllvm;
{*
 * Set the target triple for a module.
 *
 * @see Module::setTargetTriple()
  }
procedure LLVMSetTarget(M:TLLVMModuleRef; Triple:Pchar);cdecl;external libllvm;
{*
 * Returns the module flags as an array of flag-key-value triples.  The caller
 * is responsible for freeing this array by calling
 * \c LLVMDisposeModuleFlagsMetadata.
 *
 * @see Module::getModuleFlagsMetadata()
  }
function LLVMCopyModuleFlagsMetadata(M:TLLVMModuleRef; Len:Psize_t):PLLVMModuleFlagEntry;cdecl;external libllvm;
{*
 * Destroys module flags metadata entries.
  }
procedure LLVMDisposeModuleFlagsMetadata(Entries:PLLVMModuleFlagEntry);cdecl;external libllvm;
{*
 * Returns the flag behavior for a module flag entry at a specific index.
 *
 * @see Module::ModuleFlagEntry::Behavior
  }
function LLVMModuleFlagEntriesGetFlagBehavior(Entries:PLLVMModuleFlagEntry; Index:dword):TLLVMModuleFlagBehavior;cdecl;external libllvm;
{*
 * Returns the key for a module flag entry at a specific index.
 *
 * @see Module::ModuleFlagEntry::Key
  }
function LLVMModuleFlagEntriesGetKey(Entries:PLLVMModuleFlagEntry; Index:dword; Len:Psize_t):Pchar;cdecl;external libllvm;
{*
 * Returns the metadata for a module flag entry at a specific index.
 *
 * @see Module::ModuleFlagEntry::Val
  }
function LLVMModuleFlagEntriesGetMetadata(Entries:PLLVMModuleFlagEntry; Index:dword):TLLVMMetadataRef;cdecl;external libllvm;
{*
 * Add a module-level flag to the module-level flags metadata if it doesn't
 * already exist.
 *
 * @see Module::getModuleFlag()
  }
function LLVMGetModuleFlag(M:TLLVMModuleRef; Key:Pchar; KeyLen:Tsize_t):TLLVMMetadataRef;cdecl;external libllvm;
{*
 * Add a module-level flag to the module-level flags metadata if it doesn't
 * already exist.
 *
 * @see Module::addModuleFlag()
  }
procedure LLVMAddModuleFlag(M:TLLVMModuleRef; Behavior:TLLVMModuleFlagBehavior; Key:Pchar; KeyLen:Tsize_t; Val:TLLVMMetadataRef);cdecl;external libllvm;
{*
 * Dump a representation of a module to stderr.
 *
 * @see Module::dump()
  }
procedure LLVMDumpModule(M:TLLVMModuleRef);cdecl;external libllvm;
{*
 * Print a representation of a module to a file. The ErrorMessage needs to be
 * disposed with LLVMDisposeMessage. Returns 0 on success, 1 otherwise.
 *
 * @see Module::print()
  }
function LLVMPrintModuleToFile(M:TLLVMModuleRef; Filename:Pchar; ErrorMessage:PPchar):TLLVMBool;cdecl;external libllvm;
{*
 * Return a string representation of the module. Use
 * LLVMDisposeMessage to free the string.
 *
 * @see Module::print()
  }
function LLVMPrintModuleToString(M:TLLVMModuleRef):Pchar;cdecl;external libllvm;
{*
 * Get inline assembly for a module.
 *
 * @see Module::getModuleInlineAsm()
  }
function LLVMGetModuleInlineAsm(M:TLLVMModuleRef; Len:Psize_t):Pchar;cdecl;external libllvm;
{*
 * Set inline assembly for a module.
 *
 * @see Module::setModuleInlineAsm()
  }
procedure LLVMSetModuleInlineAsm2(M:TLLVMModuleRef; Asm:Pchar; Len:Tsize_t);cdecl;external libllvm;
{*
 * Append inline assembly to a module.
 *
 * @see Module::appendModuleInlineAsm()
  }
procedure LLVMAppendModuleInlineAsm(M:TLLVMModuleRef; Asm:Pchar; Len:Tsize_t);cdecl;external libllvm;
{*
 * Create the specified uniqued inline asm string.
 *
 * @see InlineAsm::get()
  }
function LLVMGetInlineAsm(Ty:TLLVMTypeRef; AsmString:Pchar; AsmStringSize:Tsize_t; Constraints:Pchar; ConstraintsSize:Tsize_t; 
           HasSideEffects:TLLVMBool; IsAlignStack:TLLVMBool; Dialect:TLLVMInlineAsmDialect; CanThrow:TLLVMBool):TLLVMValueRef;cdecl;external libllvm;
{*
 * Get the template string used for an inline assembly snippet
 *
  }
function LLVMGetInlineAsmAsmString(InlineAsmVal:TLLVMValueRef; Len:Psize_t):Pchar;cdecl;external libllvm;
{*
 * Get the raw constraint string for an inline assembly snippet
 *
  }
function LLVMGetInlineAsmConstraintString(InlineAsmVal:TLLVMValueRef; Len:Psize_t):Pchar;cdecl;external libllvm;
{*
 * Get the dialect used by the inline asm snippet
 *
  }
function LLVMGetInlineAsmDialect(InlineAsmVal:TLLVMValueRef):TLLVMInlineAsmDialect;cdecl;external libllvm;
{*
 * Get the function type of the inline assembly snippet. The same type that
 * was passed into LLVMGetInlineAsm originally
 *
 * @see LLVMGetInlineAsm
 *
  }
function LLVMGetInlineAsmFunctionType(InlineAsmVal:TLLVMValueRef):TLLVMTypeRef;cdecl;external libllvm;
{*
 * Get if the inline asm snippet has side effects
 *
  }
function LLVMGetInlineAsmHasSideEffects(InlineAsmVal:TLLVMValueRef):TLLVMBool;cdecl;external libllvm;
{*
 * Get if the inline asm snippet needs an aligned stack
 *
  }
function LLVMGetInlineAsmNeedsAlignedStack(InlineAsmVal:TLLVMValueRef):TLLVMBool;cdecl;external libllvm;
{*
 * Get if the inline asm snippet may unwind the stack
 *
  }
function LLVMGetInlineAsmCanUnwind(InlineAsmVal:TLLVMValueRef):TLLVMBool;cdecl;external libllvm;
{*
 * Obtain the context to which this module is associated.
 *
 * @see Module::getContext()
  }
function LLVMGetModuleContext(M:TLLVMModuleRef):TLLVMContextRef;cdecl;external libllvm;
{* Deprecated: Use LLVMGetTypeByName2 instead.  }
function LLVMGetTypeByName(M:TLLVMModuleRef; Name:Pchar):TLLVMTypeRef;cdecl;external libllvm;
{*
 * Obtain an iterator to the first NamedMDNode in a Module.
 *
 * @see llvm::Module::named_metadata_begin()
  }
function LLVMGetFirstNamedMetadata(M:TLLVMModuleRef):TLLVMNamedMDNodeRef;cdecl;external libllvm;
{*
 * Obtain an iterator to the last NamedMDNode in a Module.
 *
 * @see llvm::Module::named_metadata_end()
  }
function LLVMGetLastNamedMetadata(M:TLLVMModuleRef):TLLVMNamedMDNodeRef;cdecl;external libllvm;
{*
 * Advance a NamedMDNode iterator to the next NamedMDNode.
 *
 * Returns NULL if the iterator was already at the end and there are no more
 * named metadata nodes.
  }
function LLVMGetNextNamedMetadata(NamedMDNode:TLLVMNamedMDNodeRef):TLLVMNamedMDNodeRef;cdecl;external libllvm;
{*
 * Decrement a NamedMDNode iterator to the previous NamedMDNode.
 *
 * Returns NULL if the iterator was already at the beginning and there are
 * no previous named metadata nodes.
  }
function LLVMGetPreviousNamedMetadata(NamedMDNode:TLLVMNamedMDNodeRef):TLLVMNamedMDNodeRef;cdecl;external libllvm;
{*
 * Retrieve a NamedMDNode with the given name, returning NULL if no such
 * node exists.
 *
 * @see llvm::Module::getNamedMetadata()
  }
function LLVMGetNamedMetadata(M:TLLVMModuleRef; Name:Pchar; NameLen:Tsize_t):TLLVMNamedMDNodeRef;cdecl;external libllvm;
{*
 * Retrieve a NamedMDNode with the given name, creating a new node if no such
 * node exists.
 *
 * @see llvm::Module::getOrInsertNamedMetadata()
  }
function LLVMGetOrInsertNamedMetadata(M:TLLVMModuleRef; Name:Pchar; NameLen:Tsize_t):TLLVMNamedMDNodeRef;cdecl;external libllvm;
{*
 * Retrieve the name of a NamedMDNode.
 *
 * @see llvm::NamedMDNode::getName()
  }
function LLVMGetNamedMetadataName(NamedMD:TLLVMNamedMDNodeRef; NameLen:Psize_t):Pchar;cdecl;external libllvm;
{*
 * Obtain the number of operands for named metadata in a module.
 *
 * @see llvm::Module::getNamedMetadata()
  }
function LLVMGetNamedMetadataNumOperands(M:TLLVMModuleRef; Name:Pchar):dword;cdecl;external libllvm;
{*
 * Obtain the named metadata operands for a module.
 *
 * The passed LLVMValueRef pointer should refer to an array of
 * LLVMValueRef at least LLVMGetNamedMetadataNumOperands long. This
 * array will be populated with the LLVMValueRef instances. Each
 * instance corresponds to a llvm::MDNode.
 *
 * @see llvm::Module::getNamedMetadata()
 * @see llvm::MDNode::getOperand()
  }
procedure LLVMGetNamedMetadataOperands(M:TLLVMModuleRef; Name:Pchar; Dest:PLLVMValueRef);cdecl;external libllvm;
{*
 * Add an operand to named metadata.
 *
 * @see llvm::Module::getNamedMetadata()
 * @see llvm::MDNode::addOperand()
  }
procedure LLVMAddNamedMetadataOperand(M:TLLVMModuleRef; Name:Pchar; Val:TLLVMValueRef);cdecl;external libllvm;
{*
 * Return the directory of the debug location for this value, which must be
 * an llvm::Instruction, llvm::GlobalVariable, or llvm::Function.
 *
 * @see llvm::Instruction::getDebugLoc()
 * @see llvm::GlobalVariable::getDebugInfo()
 * @see llvm::Function::getSubprogram()
  }
function LLVMGetDebugLocDirectory(Val:TLLVMValueRef; Length:Pdword):Pchar;cdecl;external libllvm;
{*
 * Return the filename of the debug location for this value, which must be
 * an llvm::Instruction, llvm::GlobalVariable, or llvm::Function.
 *
 * @see llvm::Instruction::getDebugLoc()
 * @see llvm::GlobalVariable::getDebugInfo()
 * @see llvm::Function::getSubprogram()
  }
function LLVMGetDebugLocFilename(Val:TLLVMValueRef; Length:Pdword):Pchar;cdecl;external libllvm;
{*
 * Return the line number of the debug location for this value, which must be
 * an llvm::Instruction, llvm::GlobalVariable, or llvm::Function.
 *
 * @see llvm::Instruction::getDebugLoc()
 * @see llvm::GlobalVariable::getDebugInfo()
 * @see llvm::Function::getSubprogram()
  }
function LLVMGetDebugLocLine(Val:TLLVMValueRef):dword;cdecl;external libllvm;
{*
 * Return the column number of the debug location for this value, which must be
 * an llvm::Instruction.
 *
 * @see llvm::Instruction::getDebugLoc()
  }
function LLVMGetDebugLocColumn(Val:TLLVMValueRef):dword;cdecl;external libllvm;
{*
 * Add a function to a module under a specified name.
 *
 * @see llvm::Function::Create()
  }
function LLVMAddFunction(M:TLLVMModuleRef; Name:Pchar; FunctionTy:TLLVMTypeRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Obtain a Function value from a Module by its name.
 *
 * The returned value corresponds to a llvm::Function value.
 *
 * @see llvm::Module::getFunction()
  }
function LLVMGetNamedFunction(M:TLLVMModuleRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
{*
 * Obtain a Function value from a Module by its name.
 *
 * The returned value corresponds to a llvm::Function value.
 *
 * @see llvm::Module::getFunction()
  }
function LLVMGetNamedFunctionWithLength(M:TLLVMModuleRef; Name:Pchar; Length:Tsize_t):TLLVMValueRef;cdecl;external libllvm;
{*
 * Obtain an iterator to the first Function in a Module.
 *
 * @see llvm::Module::begin()
  }
function LLVMGetFirstFunction(M:TLLVMModuleRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Obtain an iterator to the last Function in a Module.
 *
 * @see llvm::Module::end()
  }
function LLVMGetLastFunction(M:TLLVMModuleRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Advance a Function iterator to the next Function.
 *
 * Returns NULL if the iterator was already at the end and there are no more
 * functions.
  }
function LLVMGetNextFunction(Fn:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Decrement a Function iterator to the previous Function.
 *
 * Returns NULL if the iterator was already at the beginning and there are
 * no previous functions.
  }
function LLVMGetPreviousFunction(Fn:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
{* Deprecated: Use LLVMSetModuleInlineAsm2 instead.  }
procedure LLVMSetModuleInlineAsm(M:TLLVMModuleRef; Asm:Pchar);cdecl;external libllvm;
{*
 * @
  }
{*
 * @defgroup LLVMCCoreType Types
 *
 * Types represent the type of a value.
 *
 * Types are associated with a context instance. The context internally
 * deduplicates types so there is only 1 instance of a specific type
 * alive at a time. In other words, a unique type is shared among all
 * consumers within a context.
 *
 * A Type in the C API corresponds to llvm::Type.
 *
 * Types have the following hierarchy:
 *
 *   types:
 *     integer type
 *     real type
 *     function type
 *     sequence types:
 *       array type
 *       pointer type
 *       vector type
 *     void type
 *     label type
 *     opaque type
 *
 * @
  }
{*
 * Obtain the enumerated type of a Type instance.
 *
 * @see llvm::Type:getTypeID()
  }
function LLVMGetTypeKind(Ty:TLLVMTypeRef):TLLVMTypeKind;cdecl;external libllvm;
{*
 * Whether the type has a known size.
 *
 * Things that don't have a size are abstract types, labels, and void.a
 *
 * @see llvm::Type::isSized()
  }
function LLVMTypeIsSized(Ty:TLLVMTypeRef):TLLVMBool;cdecl;external libllvm;
{*
 * Obtain the context to which this type instance is associated.
 *
 * @see llvm::Type::getContext()
  }
function LLVMGetTypeContext(Ty:TLLVMTypeRef):TLLVMContextRef;cdecl;external libllvm;
{*
 * Dump a representation of a type to stderr.
 *
 * @see llvm::Type::dump()
  }
procedure LLVMDumpType(Val:TLLVMTypeRef);cdecl;external libllvm;
{*
 * Return a string representation of the type. Use
 * LLVMDisposeMessage to free the string.
 *
 * @see llvm::Type::print()
  }
function LLVMPrintTypeToString(Val:TLLVMTypeRef):Pchar;cdecl;external libllvm;
{*
 * @defgroup LLVMCCoreTypeInt Integer Types
 *
 * Functions in this section operate on integer types.
 *
 * @
  }
{*
 * Obtain an integer type from a context with specified bit width.
  }
function LLVMInt1TypeInContext(C:TLLVMContextRef):TLLVMTypeRef;cdecl;external libllvm;
function LLVMInt8TypeInContext(C:TLLVMContextRef):TLLVMTypeRef;cdecl;external libllvm;
function LLVMInt16TypeInContext(C:TLLVMContextRef):TLLVMTypeRef;cdecl;external libllvm;
function LLVMInt32TypeInContext(C:TLLVMContextRef):TLLVMTypeRef;cdecl;external libllvm;
function LLVMInt64TypeInContext(C:TLLVMContextRef):TLLVMTypeRef;cdecl;external libllvm;
function LLVMInt128TypeInContext(C:TLLVMContextRef):TLLVMTypeRef;cdecl;external libllvm;
function LLVMIntTypeInContext(C:TLLVMContextRef; NumBits:dword):TLLVMTypeRef;cdecl;external libllvm;
{*
 * Obtain an integer type from the global context with a specified bit
 * width.
  }
function LLVMInt1Type:TLLVMTypeRef;cdecl;external libllvm;
function LLVMInt8Type:TLLVMTypeRef;cdecl;external libllvm;
function LLVMInt16Type:TLLVMTypeRef;cdecl;external libllvm;
function LLVMInt32Type:TLLVMTypeRef;cdecl;external libllvm;
function LLVMInt64Type:TLLVMTypeRef;cdecl;external libllvm;
function LLVMInt128Type:TLLVMTypeRef;cdecl;external libllvm;
function LLVMIntType(NumBits:dword):TLLVMTypeRef;cdecl;external libllvm;
function LLVMGetIntTypeWidth(IntegerTy:TLLVMTypeRef):dword;cdecl;external libllvm;
{*
 * @
  }
{*
 * @defgroup LLVMCCoreTypeFloat Floating Point Types
 *
 * @
  }
{*
 * Obtain a 16-bit floating point type from a context.
  }
function LLVMHalfTypeInContext(C:TLLVMContextRef):TLLVMTypeRef;cdecl;external libllvm;
{*
 * Obtain a 16-bit brain floating point type from a context.
  }
function LLVMBFloatTypeInContext(C:TLLVMContextRef):TLLVMTypeRef;cdecl;external libllvm;
{*
 * Obtain a 32-bit floating point type from a context.
  }
function LLVMFloatTypeInContext(C:TLLVMContextRef):TLLVMTypeRef;cdecl;external libllvm;
{*
 * Obtain a 64-bit floating point type from a context.
  }
function LLVMDoubleTypeInContext(C:TLLVMContextRef):TLLVMTypeRef;cdecl;external libllvm;
{*
 * Obtain a 80-bit floating point type (X87) from a context.
  }
function LLVMX86FP80TypeInContext(C:TLLVMContextRef):TLLVMTypeRef;cdecl;external libllvm;
{*
 * Obtain a 128-bit floating point type (112-bit mantissa) from a
 * context.
  }
function LLVMFP128TypeInContext(C:TLLVMContextRef):TLLVMTypeRef;cdecl;external libllvm;
{*
 * Obtain a 128-bit floating point type (two 64-bits) from a context.
  }
function LLVMPPCFP128TypeInContext(C:TLLVMContextRef):TLLVMTypeRef;cdecl;external libllvm;
{*
 * Obtain a floating point type from the global context.
 *
 * These map to the functions in this group of the same name.
  }
function LLVMHalfType:TLLVMTypeRef;cdecl;external libllvm;
function LLVMBFloatType:TLLVMTypeRef;cdecl;external libllvm;
function LLVMFloatType:TLLVMTypeRef;cdecl;external libllvm;
function LLVMDoubleType:TLLVMTypeRef;cdecl;external libllvm;
function LLVMX86FP80Type:TLLVMTypeRef;cdecl;external libllvm;
function LLVMFP128Type:TLLVMTypeRef;cdecl;external libllvm;
function LLVMPPCFP128Type:TLLVMTypeRef;cdecl;external libllvm;
{*
 * @
  }
{*
 * @defgroup LLVMCCoreTypeFunction Function Types
 *
 * @
  }
{*
 * Obtain a function type consisting of a specified signature.
 *
 * The function is defined as a tuple of a return Type, a list of
 * parameter types, and whether the function is variadic.
  }
function LLVMFunctionType(ReturnType:TLLVMTypeRef; ParamTypes:PLLVMTypeRef; ParamCount:dword; IsVarArg:TLLVMBool):TLLVMTypeRef;cdecl;external libllvm;
{*
 * Returns whether a function type is variadic.
  }
function LLVMIsFunctionVarArg(FunctionTy:TLLVMTypeRef):TLLVMBool;cdecl;external libllvm;
{*
 * Obtain the Type this function Type returns.
  }
function LLVMGetReturnType(FunctionTy:TLLVMTypeRef):TLLVMTypeRef;cdecl;external libllvm;
{*
 * Obtain the number of parameters this function accepts.
  }
function LLVMCountParamTypes(FunctionTy:TLLVMTypeRef):dword;cdecl;external libllvm;
{*
 * Obtain the types of a function's parameters.
 *
 * The Dest parameter should point to a pre-allocated array of
 * LLVMTypeRef at least LLVMCountParamTypes() large. On return, the
 * first LLVMCountParamTypes() entries in the array will be populated
 * with LLVMTypeRef instances.
 *
 * @param FunctionTy The function type to operate on.
 * @param Dest Memory address of an array to be filled with result.
  }
procedure LLVMGetParamTypes(FunctionTy:TLLVMTypeRef; Dest:PLLVMTypeRef);cdecl;external libllvm;
{*
 * @
  }
{*
 * @defgroup LLVMCCoreTypeStruct Structure Types
 *
 * These functions relate to LLVMTypeRef instances.
 *
 * @see llvm::StructType
 *
 * @
  }
{*
 * Create a new structure type in a context.
 *
 * A structure is specified by a list of inner elements/types and
 * whether these can be packed together.
 *
 * @see llvm::StructType::create()
  }
function LLVMStructTypeInContext(C:TLLVMContextRef; ElementTypes:PLLVMTypeRef; ElementCount:dword; Packed:TLLVMBool):TLLVMTypeRef;cdecl;external libllvm;
{*
 * Create a new structure type in the global context.
 *
 * @see llvm::StructType::create()
  }
function LLVMStructType(ElementTypes:PLLVMTypeRef; ElementCount:dword; Packed:TLLVMBool):TLLVMTypeRef;cdecl;external libllvm;
{*
 * Create an empty structure in a context having a specified name.
 *
 * @see llvm::StructType::create()
  }
function LLVMStructCreateNamed(C:TLLVMContextRef; Name:Pchar):TLLVMTypeRef;cdecl;external libllvm;
{*
 * Obtain the name of a structure.
 *
 * @see llvm::StructType::getName()
  }
function LLVMGetStructName(Ty:TLLVMTypeRef):Pchar;cdecl;external libllvm;
{*
 * Set the contents of a structure type.
 *
 * @see llvm::StructType::setBody()
  }
procedure LLVMStructSetBody(StructTy:TLLVMTypeRef; ElementTypes:PLLVMTypeRef; ElementCount:dword; Packed:TLLVMBool);cdecl;external libllvm;
{*
 * Get the number of elements defined inside the structure.
 *
 * @see llvm::StructType::getNumElements()
  }
function LLVMCountStructElementTypes(StructTy:TLLVMTypeRef):dword;cdecl;external libllvm;
{*
 * Get the elements within a structure.
 *
 * The function is passed the address of a pre-allocated array of
 * LLVMTypeRef at least LLVMCountStructElementTypes() long. After
 * invocation, this array will be populated with the structure's
 * elements. The objects in the destination array will have a lifetime
 * of the structure type itself, which is the lifetime of the context it
 * is contained in.
  }
procedure LLVMGetStructElementTypes(StructTy:TLLVMTypeRef; Dest:PLLVMTypeRef);cdecl;external libllvm;
{*
 * Get the type of the element at a given index in the structure.
 *
 * @see llvm::StructType::getTypeAtIndex()
  }
function LLVMStructGetTypeAtIndex(StructTy:TLLVMTypeRef; i:dword):TLLVMTypeRef;cdecl;external libllvm;
{*
 * Determine whether a structure is packed.
 *
 * @see llvm::StructType::isPacked()
  }
function LLVMIsPackedStruct(StructTy:TLLVMTypeRef):TLLVMBool;cdecl;external libllvm;
{*
 * Determine whether a structure is opaque.
 *
 * @see llvm::StructType::isOpaque()
  }
function LLVMIsOpaqueStruct(StructTy:TLLVMTypeRef):TLLVMBool;cdecl;external libllvm;
{*
 * Determine whether a structure is literal.
 *
 * @see llvm::StructType::isLiteral()
  }
function LLVMIsLiteralStruct(StructTy:TLLVMTypeRef):TLLVMBool;cdecl;external libllvm;
{*
 * @
  }
{*
 * @defgroup LLVMCCoreTypeSequential Sequential Types
 *
 * Sequential types represents "arrays" of types. This is a super class
 * for array, vector, and pointer types.
 *
 * @
  }
{*
 * Obtain the element type of an array or vector type.
 *
 * @see llvm::SequentialType::getElementType()
  }
function LLVMGetElementType(Ty:TLLVMTypeRef):TLLVMTypeRef;cdecl;external libllvm;
{*
 * Returns type's subtypes
 *
 * @see llvm::Type::subtypes()
  }
procedure LLVMGetSubtypes(Tp:TLLVMTypeRef; Arr:PLLVMTypeRef);cdecl;external libllvm;
{*
 *  Return the number of types in the derived type.
 *
 * @see llvm::Type::getNumContainedTypes()
  }
function LLVMGetNumContainedTypes(Tp:TLLVMTypeRef):dword;cdecl;external libllvm;
{*
 * Create a fixed size array type that refers to a specific type.
 *
 * The created type will exist in the context that its element type
 * exists in.
 *
 * @deprecated LLVMArrayType is deprecated in favor of the API accurate
 * LLVMArrayType2
 * @see llvm::ArrayType::get()
  }
function LLVMArrayType(ElementType:TLLVMTypeRef; ElementCount:dword):TLLVMTypeRef;cdecl;external libllvm;
{*
 * Create a fixed size array type that refers to a specific type.
 *
 * The created type will exist in the context that its element type
 * exists in.
 *
 * @see llvm::ArrayType::get()
  }
function LLVMArrayType2(ElementType:TLLVMTypeRef; ElementCount:Tuint64_t):TLLVMTypeRef;cdecl;external libllvm;
{*
 * Obtain the length of an array type.
 *
 * This only works on types that represent arrays.
 *
 * @deprecated LLVMGetArrayLength is deprecated in favor of the API accurate
 * LLVMGetArrayLength2
 * @see llvm::ArrayType::getNumElements()
  }
function LLVMGetArrayLength(ArrayTy:TLLVMTypeRef):dword;cdecl;external libllvm;
{*
 * Obtain the length of an array type.
 *
 * This only works on types that represent arrays.
 *
 * @see llvm::ArrayType::getNumElements()
  }
function LLVMGetArrayLength2(ArrayTy:TLLVMTypeRef):Tuint64_t;cdecl;external libllvm;
{*
 * Create a pointer type that points to a defined type.
 *
 * The created type will exist in the context that its pointee type
 * exists in.
 *
 * @see llvm::PointerType::get()
  }
function LLVMPointerType(ElementType:TLLVMTypeRef; AddressSpace:dword):TLLVMTypeRef;cdecl;external libllvm;
{*
 * Determine whether a pointer is opaque.
 *
 * True if this is an instance of an opaque PointerType.
 *
 * @see llvm::Type::isOpaquePointerTy()
  }
function LLVMPointerTypeIsOpaque(Ty:TLLVMTypeRef):TLLVMBool;cdecl;external libllvm;
{*
 * Create an opaque pointer type in a context.
 *
 * @see llvm::PointerType::get()
  }
function LLVMPointerTypeInContext(C:TLLVMContextRef; AddressSpace:dword):TLLVMTypeRef;cdecl;external libllvm;
{*
 * Obtain the address space of a pointer type.
 *
 * This only works on types that represent pointers.
 *
 * @see llvm::PointerType::getAddressSpace()
  }
function LLVMGetPointerAddressSpace(PointerTy:TLLVMTypeRef):dword;cdecl;external libllvm;
{*
 * Create a vector type that contains a defined type and has a specific
 * number of elements.
 *
 * The created type will exist in the context thats its element type
 * exists in.
 *
 * @see llvm::VectorType::get()
  }
function LLVMVectorType(ElementType:TLLVMTypeRef; ElementCount:dword):TLLVMTypeRef;cdecl;external libllvm;
{*
 * Create a vector type that contains a defined type and has a scalable
 * number of elements.
 *
 * The created type will exist in the context thats its element type
 * exists in.
 *
 * @see llvm::ScalableVectorType::get()
  }
function LLVMScalableVectorType(ElementType:TLLVMTypeRef; ElementCount:dword):TLLVMTypeRef;cdecl;external libllvm;
{*
 * Obtain the (possibly scalable) number of elements in a vector type.
 *
 * This only works on types that represent vectors (fixed or scalable).
 *
 * @see llvm::VectorType::getNumElements()
  }
function LLVMGetVectorSize(VectorTy:TLLVMTypeRef):dword;cdecl;external libllvm;
{*
 * Get the pointer value for the associated ConstantPtrAuth constant.
 *
 * @see llvm::ConstantPtrAuth::getPointer
  }
function LLVMGetConstantPtrAuthPointer(PtrAuth:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Get the key value for the associated ConstantPtrAuth constant.
 *
 * @see llvm::ConstantPtrAuth::getKey
  }
function LLVMGetConstantPtrAuthKey(PtrAuth:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Get the discriminator value for the associated ConstantPtrAuth constant.
 *
 * @see llvm::ConstantPtrAuth::getDiscriminator
  }
function LLVMGetConstantPtrAuthDiscriminator(PtrAuth:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Get the address discriminator value for the associated ConstantPtrAuth
 * constant.
 *
 * @see llvm::ConstantPtrAuth::getAddrDiscriminator
  }
function LLVMGetConstantPtrAuthAddrDiscriminator(PtrAuth:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * @
  }
{*
 * @defgroup LLVMCCoreTypeOther Other Types
 *
 * @
  }
{*
 * Create a void type in a context.
  }
function LLVMVoidTypeInContext(C:TLLVMContextRef):TLLVMTypeRef;cdecl;external libllvm;
{*
 * Create a label type in a context.
  }
function LLVMLabelTypeInContext(C:TLLVMContextRef):TLLVMTypeRef;cdecl;external libllvm;
{*
 * Create a X86 AMX type in a context.
  }
function LLVMX86AMXTypeInContext(C:TLLVMContextRef):TLLVMTypeRef;cdecl;external libllvm;
{*
 * Create a token type in a context.
  }
function LLVMTokenTypeInContext(C:TLLVMContextRef):TLLVMTypeRef;cdecl;external libllvm;
{*
 * Create a metadata type in a context.
  }
function LLVMMetadataTypeInContext(C:TLLVMContextRef):TLLVMTypeRef;cdecl;external libllvm;
{*
 * These are similar to the above functions except they operate on the
 * global context.
  }
function LLVMVoidType:TLLVMTypeRef;cdecl;external libllvm;
function LLVMLabelType:TLLVMTypeRef;cdecl;external libllvm;
function LLVMX86AMXType:TLLVMTypeRef;cdecl;external libllvm;
{*
 * Create a target extension type in LLVM context.
  }
function LLVMTargetExtTypeInContext(C:TLLVMContextRef; Name:Pchar; TypeParams:PLLVMTypeRef; TypeParamCount:dword; IntParams:Pdword; 
           IntParamCount:dword):TLLVMTypeRef;cdecl;external libllvm;
{*
 * Obtain the name for this target extension type.
 *
 * @see llvm::TargetExtType::getName()
  }
function LLVMGetTargetExtTypeName(TargetExtTy:TLLVMTypeRef):Pchar;cdecl;external libllvm;
{*
 * Obtain the number of type parameters for this target extension type.
 *
 * @see llvm::TargetExtType::getNumTypeParameters()
  }
function LLVMGetTargetExtTypeNumTypeParams(TargetExtTy:TLLVMTypeRef):dword;cdecl;external libllvm;
{*
 * Get the type parameter at the given index for the target extension type.
 *
 * @see llvm::TargetExtType::getTypeParameter()
  }
function LLVMGetTargetExtTypeTypeParam(TargetExtTy:TLLVMTypeRef; Idx:dword):TLLVMTypeRef;cdecl;external libllvm;
{*
 * Obtain the number of int parameters for this target extension type.
 *
 * @see llvm::TargetExtType::getNumIntParameters()
  }
function LLVMGetTargetExtTypeNumIntParams(TargetExtTy:TLLVMTypeRef):dword;cdecl;external libllvm;
{*
 * Get the int parameter at the given index for the target extension type.
 *
 * @see llvm::TargetExtType::getIntParameter()
  }
function LLVMGetTargetExtTypeIntParam(TargetExtTy:TLLVMTypeRef; Idx:dword):dword;cdecl;external libllvm;
{*
 * @
  }
{*
 * @
  }
{*
 * @defgroup LLVMCCoreValues Values
 *
 * The bulk of LLVM's object model consists of values, which comprise a very
 * rich type hierarchy.
 *
 * LLVMValueRef essentially represents llvm::Value. There is a rich
 * hierarchy of classes within this type. Depending on the instance
 * obtained, not all APIs are available.
 *
 * Callers can determine the type of an LLVMValueRef by calling the
 * LLVMIsA* family of functions (e.g. LLVMIsAArgument()). These
 * functions are defined by a macro, so it isn't obvious which are
 * available by looking at the Doxygen source code. Instead, look at the
 * source definition of LLVM_FOR_EACH_VALUE_SUBCLASS and note the list
 * of value names given. These value names also correspond to classes in
 * the llvm::Value hierarchy.
 *
 * @
  }
{ Currently, clang-format tries to format the LLVM_FOR_EACH_VALUE_SUBCLASS }
{ macro in a progressively-indented fashion, which is not desired }
{ clang-format off }
{xxxxxxxxxxxxxxxxx
 nm -D /usr/lib/x86_64-linux-gnu/libLLVM-20.so | grep LLVMIsAArgument
00000000010c98b0 T LLVMIsAArgument@@LLVM_20.1
tux@tux-B660M-DS3H-DDR4:/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/Package_Tools/include-C/llvm-c-20/llvm-c/in_arbeit$ nm -D /usr/lib/x86_64-linux-gnu/libLLVM-20.so | grep LLVMIsABasicBlock
00000000010c98d0 T LLVMIsABasicBlock@@LLVM_20.1

function LLVMIsAArgument(Val: LLVMValueRef): LLVMValueRef; cdecl; external 'LLVM';
function LLVMIsABasicBlock(Val: LLVMValueRef): LLVMValueRef; cdecl; external 'LLVM';



#define LLVM_FOR_EACH_VALUE_SUBCLASS(macro) \
  macro(Argument)                           \
  macro(BasicBlock)                         \
  macro(InlineAsm)                          \
  macro(User)                               \
    macro(Constant)                         \
      macro(BlockAddress)                   \
      macro(ConstantAggregateZero)          \
      macro(ConstantArray)                  \
      macro(ConstantDataSequential)         \
        macro(ConstantDataArray)            \
        macro(ConstantDataVector)           \
      macro(ConstantExpr)                   \
      macro(ConstantFP)                     \
      macro(ConstantInt)                    \
      macro(ConstantPointerNull)            \
      macro(ConstantStruct)                 \
      macro(ConstantTokenNone)              \
      macro(ConstantVector)                 \
      macro(ConstantPtrAuth)                \
      macro(GlobalValue)                    \
        macro(GlobalAlias)                  \
        macro(GlobalObject)                 \
          macro(Function)                   \
          macro(GlobalVariable)             \
          macro(GlobalIFunc)                \
      macro(UndefValue)                     \
      macro(PoisonValue)                    \
    macro(Instruction)                      \
      macro(UnaryOperator)                  \
      macro(BinaryOperator)                 \
      macro(CallInst)                       \
        macro(IntrinsicInst)                \
          macro(DbgInfoIntrinsic)           \
            macro(DbgVariableIntrinsic)     \
              macro(DbgDeclareInst)         \
            macro(DbgLabelInst)             \
          macro(MemIntrinsic)               \
            macro(MemCpyInst)               \
            macro(MemMoveInst)              \
            macro(MemSetInst)               \
      macro(CmpInst)                        \
        macro(FCmpInst)                     \
        macro(ICmpInst)                     \
      macro(ExtractElementInst)             \
      macro(GetElementPtrInst)              \
      macro(InsertElementInst)              \
      macro(InsertValueInst)                \
      macro(LandingPadInst)                 \
      macro(PHINode)                        \
      macro(SelectInst)                     \
      macro(ShuffleVectorInst)              \
      macro(StoreInst)                      \
      macro(BranchInst)                     \
      macro(IndirectBrInst)                 \
      macro(InvokeInst)                     \
      macro(ReturnInst)                     \
      macro(SwitchInst)                     \
      macro(UnreachableInst)                \
      macro(ResumeInst)                     \
      macro(CleanupReturnInst)              \
      macro(CatchReturnInst)                \
      macro(CatchSwitchInst)                \
      macro(CallBrInst)                     \
      macro(FuncletPadInst)                 \
        macro(CatchPadInst)                 \
        macro(CleanupPadInst)               \
      macro(UnaryInstruction)               \
        macro(AllocaInst)                   \
        macro(CastInst)                     \
          macro(AddrSpaceCastInst)          \
          macro(BitCastInst)                \
          macro(FPExtInst)                  \
          macro(FPToSIInst)                 \
          macro(FPToUIInst)                 \
          macro(FPTruncInst)                \
          macro(IntToPtrInst)               \
          macro(PtrToIntInst)               \
          macro(SExtInst)                   \
          macro(SIToFPInst)                 \
          macro(TruncInst)                  \
          macro(UIToFPInst)                 \
          macro(ZExtInst)                   \
        macro(ExtractValueInst)             \
        macro(LoadInst)                     \
        macro(VAArgInst)                    \
        macro(FreezeInst)                   \
      macro(AtomicCmpXchgInst)              \
      macro(AtomicRMWInst)                  \
      macro(FenceInst)

 }
{ clang-format on }
{*
 * @defgroup LLVMCCoreValueGeneral General APIs
 *
 * Functions in this section work on all LLVMValueRef instances,
 * regardless of their sub-type. They correspond to functions available
 * on llvm::Value.
 *
 * @
  }
{*
 * Obtain the type of a value.
 *
 * @see llvm::Value::getType()
  }
function LLVMTypeOf(Val:TLLVMValueRef):TLLVMTypeRef;cdecl;external libllvm;
{*
 * Obtain the enumerated type of a Value instance.
 *
 * @see llvm::Value::getValueID()
  }
function LLVMGetValueKind(Val:TLLVMValueRef):TLLVMValueKind;cdecl;external libllvm;
{*
 * Obtain the string name of a value.
 *
 * @see llvm::Value::getName()
  }
function LLVMGetValueName2(Val:TLLVMValueRef; Length:Psize_t):Pchar;cdecl;external libllvm;
{*
 * Set the string name of a value.
 *
 * @see llvm::Value::setName()
  }
procedure LLVMSetValueName2(Val:TLLVMValueRef; Name:Pchar; NameLen:Tsize_t);cdecl;external libllvm;
{*
 * Dump a representation of a value to stderr.
 *
 * @see llvm::Value::dump()
  }
procedure LLVMDumpValue(Val:TLLVMValueRef);cdecl;external libllvm;
{*
 * Return a string representation of the value. Use
 * LLVMDisposeMessage to free the string.
 *
 * @see llvm::Value::print()
  }
function LLVMPrintValueToString(Val:TLLVMValueRef):Pchar;cdecl;external libllvm;
{*
 * Obtain the context to which this value is associated.
 *
 * @see llvm::Value::getContext()
  }
function LLVMGetValueContext(Val:TLLVMValueRef):TLLVMContextRef;cdecl;external libllvm;
{*
 * Return a string representation of the DbgRecord. Use
 * LLVMDisposeMessage to free the string.
 *
 * @see llvm::DbgRecord::print()
  }
function LLVMPrintDbgRecordToString(_Record:TLLVMDbgRecordRef):Pchar;cdecl;external libllvm;
{*
 * Replace all uses of a value with another one.
 *
 * @see llvm::Value::replaceAllUsesWith()
  }
procedure LLVMReplaceAllUsesWith(OldVal:TLLVMValueRef; NewVal:TLLVMValueRef);cdecl;external libllvm;
{*
 * Determine whether the specified value instance is constant.
  }
function LLVMIsConstant(Val:TLLVMValueRef):TLLVMBool;cdecl;external libllvm;
{*
 * Determine whether a value instance is undefined.
  }
function LLVMIsUndef(Val:TLLVMValueRef):TLLVMBool;cdecl;external libllvm;
{*
 * Determine whether a value instance is poisonous.
  }
function LLVMIsPoison(Val:TLLVMValueRef):TLLVMBool;cdecl;external libllvm;
{*
#define LLVM_DECLARE_VALUE_CAST(name) \
  LLVMValueRef LLVMIsA##name(LLVMValueRef Val);
LLVM_FOR_EACH_VALUE_SUBCLASS(LLVM_DECLARE_VALUE_CAST)
  }
function LLVMIsAMDNode(Val:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMIsAValueAsMetadata(Val:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMIsAMDString(Val:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
{* Deprecated: Use LLVMGetValueName2 instead.  }
function LLVMGetValueName(Val:TLLVMValueRef):Pchar;cdecl;external libllvm;
{* Deprecated: Use LLVMSetValueName2 instead.  }
procedure LLVMSetValueName(Val:TLLVMValueRef; Name:Pchar);cdecl;external libllvm;
{*
 * @
  }
{*
 * @defgroup LLVMCCoreValueUses Usage
 *
 * This module defines functions that allow you to inspect the uses of a
 * LLVMValueRef.
 *
 * It is possible to obtain an LLVMUseRef for any LLVMValueRef instance.
 * Each LLVMUseRef (which corresponds to a llvm::Use instance) holds a
 * llvm::User and llvm::Value.
 *
 * @
  }
{*
 * Obtain the first use of a value.
 *
 * Uses are obtained in an iterator fashion. First, call this function
 * to obtain a reference to the first use. Then, call LLVMGetNextUse()
 * on that instance and all subsequently obtained instances until
 * LLVMGetNextUse() returns NULL.
 *
 * @see llvm::Value::use_begin()
  }
function LLVMGetFirstUse(Val:TLLVMValueRef):TLLVMUseRef;cdecl;external libllvm;
{*
 * Obtain the next use of a value.
 *
 * This effectively advances the iterator. It returns NULL if you are on
 * the final use and no more are available.
  }
function LLVMGetNextUse(U:TLLVMUseRef):TLLVMUseRef;cdecl;external libllvm;
{*
 * Obtain the user value for a user.
 *
 * The returned value corresponds to a llvm::User type.
 *
 * @see llvm::Use::getUser()
  }
function LLVMGetUser(U:TLLVMUseRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Obtain the value this use corresponds to.
 *
 * @see llvm::Use::get().
  }
function LLVMGetUsedValue(U:TLLVMUseRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * @
  }
{*
 * @defgroup LLVMCCoreValueUser User value
 *
 * Function in this group pertain to LLVMValueRef instances that descent
 * from llvm::User. This includes constants, instructions, and
 * operators.
 *
 * @
  }
{*
 * Obtain an operand at a specific index in a llvm::User value.
 *
 * @see llvm::User::getOperand()
  }
function LLVMGetOperand(Val:TLLVMValueRef; Index:dword):TLLVMValueRef;cdecl;external libllvm;
{*
 * Obtain the use of an operand at a specific index in a llvm::User value.
 *
 * @see llvm::User::getOperandUse()
  }
function LLVMGetOperandUse(Val:TLLVMValueRef; Index:dword):TLLVMUseRef;cdecl;external libllvm;
{*
 * Set an operand at a specific index in a llvm::User value.
 *
 * @see llvm::User::setOperand()
  }
procedure LLVMSetOperand(User:TLLVMValueRef; Index:dword; Val:TLLVMValueRef);cdecl;external libllvm;
{*
 * Obtain the number of operands in a llvm::User value.
 *
 * @see llvm::User::getNumOperands()
  }
function LLVMGetNumOperands(Val:TLLVMValueRef):longint;cdecl;external libllvm;
{*
 * @
  }
{*
 * @defgroup LLVMCCoreValueConstant Constants
 *
 * This section contains APIs for interacting with LLVMValueRef that
 * correspond to llvm::Constant instances.
 *
 * These functions will work for any LLVMValueRef in the llvm::Constant
 * class hierarchy.
 *
 * @
  }
{*
 * Obtain a constant value referring to the null instance of a type.
 *
 * @see llvm::Constant::getNullValue()
  }
function LLVMConstNull(Ty:TLLVMTypeRef):TLLVMValueRef;cdecl;external libllvm;
{ all zeroes  }
{*
 * Obtain a constant value referring to the instance of a type
 * consisting of all ones.
 *
 * This is only valid for integer types.
 *
 * @see llvm::Constant::getAllOnesValue()
  }
function LLVMConstAllOnes(Ty:TLLVMTypeRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Obtain a constant value referring to an undefined value of a type.
 *
 * @see llvm::UndefValue::get()
  }
function LLVMGetUndef(Ty:TLLVMTypeRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Obtain a constant value referring to a poison value of a type.
 *
 * @see llvm::PoisonValue::get()
  }
function LLVMGetPoison(Ty:TLLVMTypeRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Determine whether a value instance is null.
 *
 * @see llvm::Constant::isNullValue()
  }
function LLVMIsNull(Val:TLLVMValueRef):TLLVMBool;cdecl;external libllvm;
{*
 * Obtain a constant that is a constant pointer pointing to NULL for a
 * specified type.
  }
function LLVMConstPointerNull(Ty:TLLVMTypeRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * @defgroup LLVMCCoreValueConstantScalar Scalar constants
 *
 * Functions in this group model LLVMValueRef instances that correspond
 * to constants referring to scalar types.
 *
 * For integer types, the LLVMTypeRef parameter should correspond to a
 * llvm::IntegerType instance and the returned LLVMValueRef will
 * correspond to a llvm::ConstantInt.
 *
 * For floating point types, the LLVMTypeRef returned corresponds to a
 * llvm::ConstantFP.
 *
 * @
  }
{*
 * Obtain a constant value for an integer type.
 *
 * The returned value corresponds to a llvm::ConstantInt.
 *
 * @see llvm::ConstantInt::get()
 *
 * @param IntTy Integer type to obtain value of.
 * @param N The value the returned instance should refer to.
 * @param SignExtend Whether to sign extend the produced value.
  }
function LLVMConstInt(IntTy:TLLVMTypeRef; N:qword; SignExtend:TLLVMBool):TLLVMValueRef;cdecl;external libllvm;
{*
 * Obtain a constant value for an integer of arbitrary precision.
 *
 * @see llvm::ConstantInt::get()
  }
function LLVMConstIntOfArbitraryPrecision(IntTy:TLLVMTypeRef; NumWords:dword; Words:Puint64_t):TLLVMValueRef;cdecl;external libllvm;
{*
 * Obtain a constant value for an integer parsed from a string.
 *
 * A similar API, LLVMConstIntOfStringAndSize is also available. If the
 * string's length is available, it is preferred to call that function
 * instead.
 *
 * @see llvm::ConstantInt::get()
  }
function LLVMConstIntOfString(IntTy:TLLVMTypeRef; Text:Pchar; Radix:Tuint8_t):TLLVMValueRef;cdecl;external libllvm;
{*
 * Obtain a constant value for an integer parsed from a string with
 * specified length.
 *
 * @see llvm::ConstantInt::get()
  }
function LLVMConstIntOfStringAndSize(IntTy:TLLVMTypeRef; Text:Pchar; SLen:dword; Radix:Tuint8_t):TLLVMValueRef;cdecl;external libllvm;
{*
 * Obtain a constant value referring to a double floating point value.
  }
function LLVMConstReal(RealTy:TLLVMTypeRef; N:Tdouble):TLLVMValueRef;cdecl;external libllvm;
{*
 * Obtain a constant for a floating point value parsed from a string.
 *
 * A similar API, LLVMConstRealOfStringAndSize is also available. It
 * should be used if the input string's length is known.
  }
function LLVMConstRealOfString(RealTy:TLLVMTypeRef; Text:Pchar):TLLVMValueRef;cdecl;external libllvm;
{*
 * Obtain a constant for a floating point value parsed from a string.
  }
function LLVMConstRealOfStringAndSize(RealTy:TLLVMTypeRef; Text:Pchar; SLen:dword):TLLVMValueRef;cdecl;external libllvm;
{*
 * Obtain the zero extended value for an integer constant value.
 *
 * @see llvm::ConstantInt::getZExtValue()
  }
function LLVMConstIntGetZExtValue(ConstantVal:TLLVMValueRef):qword;cdecl;external libllvm;
{*
 * Obtain the sign extended value for an integer constant value.
 *
 * @see llvm::ConstantInt::getSExtValue()
  }
function LLVMConstIntGetSExtValue(ConstantVal:TLLVMValueRef):int64;cdecl;external libllvm;
{*
 * Obtain the double value for an floating point constant value.
 * losesInfo indicates if some precision was lost in the conversion.
 *
 * @see llvm::ConstantFP::getDoubleValue
  }
function LLVMConstRealGetDouble(ConstantVal:TLLVMValueRef; losesInfo:PLLVMBool):Tdouble;cdecl;external libllvm;
{*
 * @
  }
{*
 * @defgroup LLVMCCoreValueConstantComposite Composite Constants
 *
 * Functions in this group operate on composite constants.
 *
 * @
  }
{*
 * Create a ConstantDataSequential and initialize it with a string.
 *
 * @deprecated LLVMConstStringInContext is deprecated in favor of the API
 * accurate LLVMConstStringInContext2
 * @see llvm::ConstantDataArray::getString()
  }
function LLVMConstStringInContext(C:TLLVMContextRef; Str:Pchar; Length:dword; DontNullTerminate:TLLVMBool):TLLVMValueRef;cdecl;external libllvm;
{*
 * Create a ConstantDataSequential and initialize it with a string.
 *
 * @see llvm::ConstantDataArray::getString()
  }
function LLVMConstStringInContext2(C:TLLVMContextRef; Str:Pchar; Length:Tsize_t; DontNullTerminate:TLLVMBool):TLLVMValueRef;cdecl;external libllvm;
{*
 * Create a ConstantDataSequential with string content in the global context.
 *
 * This is the same as LLVMConstStringInContext except it operates on the
 * global context.
 *
 * @see LLVMConstStringInContext()
 * @see llvm::ConstantDataArray::getString()
  }
function LLVMConstString(Str:Pchar; Length:dword; DontNullTerminate:TLLVMBool):TLLVMValueRef;cdecl;external libllvm;
{*
 * Returns true if the specified constant is an array of i8.
 *
 * @see ConstantDataSequential::getAsString()
  }
function LLVMIsConstantString(c:TLLVMValueRef):TLLVMBool;cdecl;external libllvm;
{*
 * Get the given constant data sequential as a string.
 *
 * @see ConstantDataSequential::getAsString()
  }
function LLVMGetAsString(c:TLLVMValueRef; Length:Psize_t):Pchar;cdecl;external libllvm;
{*
 * Create an anonymous ConstantStruct with the specified values.
 *
 * @see llvm::ConstantStruct::getAnon()
  }
function LLVMConstStructInContext(C:TLLVMContextRef; ConstantVals:PLLVMValueRef; Count:dword; Packed:TLLVMBool):TLLVMValueRef;cdecl;external libllvm;
{*
 * Create a ConstantStruct in the global Context.
 *
 * This is the same as LLVMConstStructInContext except it operates on the
 * global Context.
 *
 * @see LLVMConstStructInContext()
  }
function LLVMConstStruct(ConstantVals:PLLVMValueRef; Count:dword; Packed:TLLVMBool):TLLVMValueRef;cdecl;external libllvm;
{*
 * Create a ConstantArray from values.
 *
 * @deprecated LLVMConstArray is deprecated in favor of the API accurate
 * LLVMConstArray2
 * @see llvm::ConstantArray::get()
  }
function LLVMConstArray(ElementTy:TLLVMTypeRef; ConstantVals:PLLVMValueRef; Length:dword):TLLVMValueRef;cdecl;external libllvm;
{*
 * Create a ConstantArray from values.
 *
 * @see llvm::ConstantArray::get()
  }
function LLVMConstArray2(ElementTy:TLLVMTypeRef; ConstantVals:PLLVMValueRef; Length:Tuint64_t):TLLVMValueRef;cdecl;external libllvm;
{*
 * Create a non-anonymous ConstantStruct from values.
 *
 * @see llvm::ConstantStruct::get()
  }
function LLVMConstNamedStruct(StructTy:TLLVMTypeRef; ConstantVals:PLLVMValueRef; Count:dword):TLLVMValueRef;cdecl;external libllvm;
{*
 * Get element of a constant aggregate (struct, array or vector) at the
 * specified index. Returns null if the index is out of range, or it's not
 * possible to determine the element (e.g., because the constant is a
 * constant expression.)
 *
 * @see llvm::Constant::getAggregateElement()
  }
function LLVMGetAggregateElement(C:TLLVMValueRef; Idx:dword):TLLVMValueRef;cdecl;external libllvm;
{*
 * Get an element at specified index as a constant.
 *
 * @see ConstantDataSequential::getElementAsConstant()
  }
{ xxxxxxLLVM_ATTRIBUTE_C_DEPRECATED( }
function LLVMGetElementAsConstant(C:TLLVMValueRef; idx:dword):TLLVMValueRef;cdecl;external libllvm;
{*
 * Create a ConstantVector from values.
 *
 * @see llvm::ConstantVector::get()
  }
function LLVMConstVector(ScalarConstantVals:PLLVMValueRef; Size:dword):TLLVMValueRef;cdecl;external libllvm;
{*
 * Create a ConstantPtrAuth constant with the given values.
 *
 * @see llvm::ConstantPtrAuth::get()
  }
function LLVMConstantPtrAuth(Ptr:TLLVMValueRef; Key:TLLVMValueRef; Disc:TLLVMValueRef; AddrDisc:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * @
  }
{*
 * @defgroup LLVMCCoreValueConstantExpressions Constant Expressions
 *
 * Functions in this group correspond to APIs on llvm::ConstantExpr.
 *
 * @see llvm::ConstantExpr.
 *
 * @
  }
function LLVMGetConstOpcode(ConstantVal:TLLVMValueRef):TLLVMOpcode;cdecl;external libllvm;
function LLVMAlignOf(Ty:TLLVMTypeRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMSizeOf(Ty:TLLVMTypeRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMConstNeg(ConstantVal:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMConstNSWNeg(ConstantVal:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
{xxxxxx LLVM_ATTRIBUTE_C_DEPRECATED( }
function LLVMConstNUWNeg(ConstantVal:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMConstNot(ConstantVal:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMConstAdd(LHSConstant:TLLVMValueRef; RHSConstant:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMConstNSWAdd(LHSConstant:TLLVMValueRef; RHSConstant:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMConstNUWAdd(LHSConstant:TLLVMValueRef; RHSConstant:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMConstSub(LHSConstant:TLLVMValueRef; RHSConstant:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMConstNSWSub(LHSConstant:TLLVMValueRef; RHSConstant:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMConstNUWSub(LHSConstant:TLLVMValueRef; RHSConstant:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMConstMul(LHSConstant:TLLVMValueRef; RHSConstant:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMConstNSWMul(LHSConstant:TLLVMValueRef; RHSConstant:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMConstNUWMul(LHSConstant:TLLVMValueRef; RHSConstant:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMConstXor(LHSConstant:TLLVMValueRef; RHSConstant:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMConstGEP2(Ty:TLLVMTypeRef; ConstantVal:TLLVMValueRef; ConstantIndices:PLLVMValueRef; NumIndices:dword):TLLVMValueRef;cdecl;external libllvm;
function LLVMConstInBoundsGEP2(Ty:TLLVMTypeRef; ConstantVal:TLLVMValueRef; ConstantIndices:PLLVMValueRef; NumIndices:dword):TLLVMValueRef;cdecl;external libllvm;
{*
 * Creates a constant GetElementPtr expression. Similar to LLVMConstGEP2, but
 * allows specifying the no-wrap flags.
 *
 * @see llvm::ConstantExpr::getGetElementPtr()
  }
function LLVMConstGEPWithNoWrapFlags(Ty:TLLVMTypeRef; ConstantVal:TLLVMValueRef; ConstantIndices:PLLVMValueRef; NumIndices:dword; NoWrapFlags:TLLVMGEPNoWrapFlags):TLLVMValueRef;cdecl;external libllvm;
function LLVMConstTrunc(ConstantVal:TLLVMValueRef; ToType:TLLVMTypeRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMConstPtrToInt(ConstantVal:TLLVMValueRef; ToType:TLLVMTypeRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMConstIntToPtr(ConstantVal:TLLVMValueRef; ToType:TLLVMTypeRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMConstBitCast(ConstantVal:TLLVMValueRef; ToType:TLLVMTypeRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMConstAddrSpaceCast(ConstantVal:TLLVMValueRef; ToType:TLLVMTypeRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMConstTruncOrBitCast(ConstantVal:TLLVMValueRef; ToType:TLLVMTypeRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMConstPointerCast(ConstantVal:TLLVMValueRef; ToType:TLLVMTypeRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMConstExtractElement(VectorConstant:TLLVMValueRef; IndexConstant:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMConstInsertElement(VectorConstant:TLLVMValueRef; ElementValueConstant:TLLVMValueRef; IndexConstant:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMConstShuffleVector(VectorAConstant:TLLVMValueRef; VectorBConstant:TLLVMValueRef; MaskConstant:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMBlockAddress(F:TLLVMValueRef; BB:TLLVMBasicBlockRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Gets the function associated with a given BlockAddress constant value.
  }
function LLVMGetBlockAddressFunction(BlockAddr:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Gets the basic block associated with a given BlockAddress constant value.
  }
function LLVMGetBlockAddressBasicBlock(BlockAddr:TLLVMValueRef):TLLVMBasicBlockRef;cdecl;external libllvm;
{* Deprecated: Use LLVMGetInlineAsm instead.  }
function LLVMConstInlineAsm(Ty:TLLVMTypeRef; AsmString:Pchar; Constraints:Pchar; HasSideEffects:TLLVMBool; IsAlignStack:TLLVMBool):TLLVMValueRef;cdecl;external libllvm;
{*
 * @
  }
{*
 * @defgroup LLVMCCoreValueConstantGlobals Global Values
 *
 * This group contains functions that operate on global values. Functions in
 * this group relate to functions in the llvm::GlobalValue class tree.
 *
 * @see llvm::GlobalValue
 *
 * @
  }
function LLVMGetGlobalParent(Global:TLLVMValueRef):TLLVMModuleRef;cdecl;external libllvm;
function LLVMIsDeclaration(Global:TLLVMValueRef):TLLVMBool;cdecl;external libllvm;
function LLVMGetLinkage(Global:TLLVMValueRef):TLLVMLinkage;cdecl;external libllvm;
procedure LLVMSetLinkage(Global:TLLVMValueRef; Linkage:TLLVMLinkage);cdecl;external libllvm;
function LLVMGetSection(Global:TLLVMValueRef):Pchar;cdecl;external libllvm;
procedure LLVMSetSection(Global:TLLVMValueRef; Section:Pchar);cdecl;external libllvm;
function LLVMGetVisibility(Global:TLLVMValueRef):TLLVMVisibility;cdecl;external libllvm;
procedure LLVMSetVisibility(Global:TLLVMValueRef; Viz:TLLVMVisibility);cdecl;external libllvm;
function LLVMGetDLLStorageClass(Global:TLLVMValueRef):TLLVMDLLStorageClass;cdecl;external libllvm;
procedure LLVMSetDLLStorageClass(Global:TLLVMValueRef; _Class:TLLVMDLLStorageClass);cdecl;external libllvm;
function LLVMGetUnnamedAddress(Global:TLLVMValueRef):TLLVMUnnamedAddr;cdecl;external libllvm;
procedure LLVMSetUnnamedAddress(Global:TLLVMValueRef; UnnamedAddr:TLLVMUnnamedAddr);cdecl;external libllvm;
{*
 * Returns the "value type" of a global value.  This differs from the formal
 * type of a global value which is always a pointer type.
 *
 * @see llvm::GlobalValue::getValueType()
  }
function LLVMGlobalGetValueType(Global:TLLVMValueRef):TLLVMTypeRef;cdecl;external libllvm;
{* Deprecated: Use LLVMGetUnnamedAddress instead.  }
function LLVMHasUnnamedAddr(Global:TLLVMValueRef):TLLVMBool;cdecl;external libllvm;
{* Deprecated: Use LLVMSetUnnamedAddress instead.  }
procedure LLVMSetUnnamedAddr(Global:TLLVMValueRef; HasUnnamedAddr:TLLVMBool);cdecl;external libllvm;
{*
 * @defgroup LLVMCCoreValueWithAlignment Values with alignment
 *
 * Functions in this group only apply to values with alignment, i.e.
 * global variables, load and store instructions.
  }
{*
 * Obtain the preferred alignment of the value.
 * @see llvm::AllocaInst::getAlignment()
 * @see llvm::LoadInst::getAlignment()
 * @see llvm::StoreInst::getAlignment()
 * @see llvm::AtomicRMWInst::setAlignment()
 * @see llvm::AtomicCmpXchgInst::setAlignment()
 * @see llvm::GlobalValue::getAlignment()
  }
function LLVMGetAlignment(V:TLLVMValueRef):dword;cdecl;external libllvm;
{*
 * Set the preferred alignment of the value.
 * @see llvm::AllocaInst::setAlignment()
 * @see llvm::LoadInst::setAlignment()
 * @see llvm::StoreInst::setAlignment()
 * @see llvm::AtomicRMWInst::setAlignment()
 * @see llvm::AtomicCmpXchgInst::setAlignment()
 * @see llvm::GlobalValue::setAlignment()
  }
procedure LLVMSetAlignment(V:TLLVMValueRef; Bytes:dword);cdecl;external libllvm;
{*
 * Sets a metadata attachment, erasing the existing metadata attachment if
 * it already exists for the given kind.
 *
 * @see llvm::GlobalObject::setMetadata()
  }
procedure LLVMGlobalSetMetadata(Global:TLLVMValueRef; Kind:dword; MD:TLLVMMetadataRef);cdecl;external libllvm;
{*
 * Erases a metadata attachment of the given kind if it exists.
 *
 * @see llvm::GlobalObject::eraseMetadata()
  }
procedure LLVMGlobalEraseMetadata(Global:TLLVMValueRef; Kind:dword);cdecl;external libllvm;
{*
 * Removes all metadata attachments from this value.
 *
 * @see llvm::GlobalObject::clearMetadata()
  }
procedure LLVMGlobalClearMetadata(Global:TLLVMValueRef);cdecl;external libllvm;
{*
 * Retrieves an array of metadata entries representing the metadata attached to
 * this value. The caller is responsible for freeing this array by calling
 * \c LLVMDisposeValueMetadataEntries.
 *
 * @see llvm::GlobalObject::getAllMetadata()
  }
function LLVMGlobalCopyAllMetadata(Value:TLLVMValueRef; NumEntries:Psize_t):PLLVMValueMetadataEntry;cdecl;external libllvm;
{*
 * Destroys value metadata entries.
  }
procedure LLVMDisposeValueMetadataEntries(Entries:PLLVMValueMetadataEntry);cdecl;external libllvm;
{*
 * Returns the kind of a value metadata entry at a specific index.
  }
function LLVMValueMetadataEntriesGetKind(Entries:PLLVMValueMetadataEntry; Index:dword):dword;cdecl;external libllvm;
{*
 * Returns the underlying metadata node of a value metadata entry at a
 * specific index.
  }
function LLVMValueMetadataEntriesGetMetadata(Entries:PLLVMValueMetadataEntry; Index:dword):TLLVMMetadataRef;cdecl;external libllvm;
{*
 * @
  }
{*
 * @defgroup LLVMCoreValueConstantGlobalVariable Global Variables
 *
 * This group contains functions that operate on global variable values.
 *
 * @see llvm::GlobalVariable
 *
 * @
  }
function LLVMAddGlobal(M:TLLVMModuleRef; Ty:TLLVMTypeRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMAddGlobalInAddressSpace(M:TLLVMModuleRef; Ty:TLLVMTypeRef; Name:Pchar; AddressSpace:dword):TLLVMValueRef;cdecl;external libllvm;
function LLVMGetNamedGlobal(M:TLLVMModuleRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMGetNamedGlobalWithLength(M:TLLVMModuleRef; Name:Pchar; Length:Tsize_t):TLLVMValueRef;cdecl;external libllvm;
function LLVMGetFirstGlobal(M:TLLVMModuleRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMGetLastGlobal(M:TLLVMModuleRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMGetNextGlobal(GlobalVar:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMGetPreviousGlobal(GlobalVar:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
procedure LLVMDeleteGlobal(GlobalVar:TLLVMValueRef);cdecl;external libllvm;
function LLVMGetInitializer(GlobalVar:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
procedure LLVMSetInitializer(GlobalVar:TLLVMValueRef; ConstantVal:TLLVMValueRef);cdecl;external libllvm;
function LLVMIsThreadLocal(GlobalVar:TLLVMValueRef):TLLVMBool;cdecl;external libllvm;
procedure LLVMSetThreadLocal(GlobalVar:TLLVMValueRef; IsThreadLocal:TLLVMBool);cdecl;external libllvm;
function LLVMIsGlobalConstant(GlobalVar:TLLVMValueRef):TLLVMBool;cdecl;external libllvm;
procedure LLVMSetGlobalConstant(GlobalVar:TLLVMValueRef; IsConstant:TLLVMBool);cdecl;external libllvm;
function LLVMGetThreadLocalMode(GlobalVar:TLLVMValueRef):TLLVMThreadLocalMode;cdecl;external libllvm;
procedure LLVMSetThreadLocalMode(GlobalVar:TLLVMValueRef; Mode:TLLVMThreadLocalMode);cdecl;external libllvm;
function LLVMIsExternallyInitialized(GlobalVar:TLLVMValueRef):TLLVMBool;cdecl;external libllvm;
procedure LLVMSetExternallyInitialized(GlobalVar:TLLVMValueRef; IsExtInit:TLLVMBool);cdecl;external libllvm;
{*
 * @
  }
{*
 * @defgroup LLVMCoreValueConstantGlobalAlias Global Aliases
 *
 * This group contains function that operate on global alias values.
 *
 * @see llvm::GlobalAlias
 *
 * @
  }
{*
 * Add a GlobalAlias with the given value type, address space and aliasee.
 *
 * @see llvm::GlobalAlias::create()
  }
function LLVMAddAlias2(M:TLLVMModuleRef; ValueTy:TLLVMTypeRef; AddrSpace:dword; Aliasee:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
{*
 * Obtain a GlobalAlias value from a Module by its name.
 *
 * The returned value corresponds to a llvm::GlobalAlias value.
 *
 * @see llvm::Module::getNamedAlias()
  }
function LLVMGetNamedGlobalAlias(M:TLLVMModuleRef; Name:Pchar; NameLen:Tsize_t):TLLVMValueRef;cdecl;external libllvm;
{*
 * Obtain an iterator to the first GlobalAlias in a Module.
 *
 * @see llvm::Module::alias_begin()
  }
function LLVMGetFirstGlobalAlias(M:TLLVMModuleRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Obtain an iterator to the last GlobalAlias in a Module.
 *
 * @see llvm::Module::alias_end()
  }
function LLVMGetLastGlobalAlias(M:TLLVMModuleRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Advance a GlobalAlias iterator to the next GlobalAlias.
 *
 * Returns NULL if the iterator was already at the end and there are no more
 * global aliases.
  }
function LLVMGetNextGlobalAlias(GA:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Decrement a GlobalAlias iterator to the previous GlobalAlias.
 *
 * Returns NULL if the iterator was already at the beginning and there are
 * no previous global aliases.
  }
function LLVMGetPreviousGlobalAlias(GA:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Retrieve the target value of an alias.
  }
function LLVMAliasGetAliasee(Alias:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Set the target value of an alias.
  }
procedure LLVMAliasSetAliasee(Alias:TLLVMValueRef; Aliasee:TLLVMValueRef);cdecl;external libllvm;
{*
 * @
  }
{*
 * @defgroup LLVMCCoreValueFunction Function values
 *
 * Functions in this group operate on LLVMValueRef instances that
 * correspond to llvm::Function instances.
 *
 * @see llvm::Function
 *
 * @
  }
{*
 * Remove a function from its containing module and deletes it.
 *
 * @see llvm::Function::eraseFromParent()
  }
procedure LLVMDeleteFunction(Fn:TLLVMValueRef);cdecl;external libllvm;
{*
 * Check whether the given function has a personality function.
 *
 * @see llvm::Function::hasPersonalityFn()
  }
function LLVMHasPersonalityFn(Fn:TLLVMValueRef):TLLVMBool;cdecl;external libllvm;
{*
 * Obtain the personality function attached to the function.
 *
 * @see llvm::Function::getPersonalityFn()
  }
function LLVMGetPersonalityFn(Fn:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Set the personality function attached to the function.
 *
 * @see llvm::Function::setPersonalityFn()
  }
procedure LLVMSetPersonalityFn(Fn:TLLVMValueRef; PersonalityFn:TLLVMValueRef);cdecl;external libllvm;
{*
 * Obtain the intrinsic ID number which matches the given function name.
 *
 * @see llvm::Intrinsic::lookupIntrinsicID()
  }
function LLVMLookupIntrinsicID(Name:Pchar; NameLen:Tsize_t):dword;cdecl;external libllvm;
{*
 * Obtain the ID number from a function instance.
 *
 * @see llvm::Function::getIntrinsicID()
  }
function LLVMGetIntrinsicID(Fn:TLLVMValueRef):dword;cdecl;external libllvm;
{*
 * Get or insert the declaration of an intrinsic.  For overloaded intrinsics,
 * parameter types must be provided to uniquely identify an overload.
 *
 * @see llvm::Intrinsic::getOrInsertDeclaration()
  }
function LLVMGetIntrinsicDeclaration(Mod:TLLVMModuleRef; ID:dword; ParamTypes:PLLVMTypeRef; ParamCount:Tsize_t):TLLVMValueRef;cdecl;external libllvm;
{*
 * Retrieves the type of an intrinsic.  For overloaded intrinsics, parameter
 * types must be provided to uniquely identify an overload.
 *
 * @see llvm::Intrinsic::getType()
  }
function LLVMIntrinsicGetType(Ctx:TLLVMContextRef; ID:dword; ParamTypes:PLLVMTypeRef; ParamCount:Tsize_t):TLLVMTypeRef;cdecl;external libllvm;
{*
 * Retrieves the name of an intrinsic.
 *
 * @see llvm::Intrinsic::getName()
  }
function LLVMIntrinsicGetName(ID:dword; NameLength:Psize_t):Pchar;cdecl;external libllvm;
{* Deprecated: Use LLVMIntrinsicCopyOverloadedName2 instead.  }
function LLVMIntrinsicCopyOverloadedName(ID:dword; ParamTypes:PLLVMTypeRef; ParamCount:Tsize_t; NameLength:Psize_t):Pchar;cdecl;external libllvm;
{*
 * Copies the name of an overloaded intrinsic identified by a given list of
 * parameter types.
 *
 * Unlike LLVMIntrinsicGetName, the caller is responsible for freeing the
 * returned string.
 *
 * This version also supports unnamed types.
 *
 * @see llvm::Intrinsic::getName()
  }
function LLVMIntrinsicCopyOverloadedName2(Mod:TLLVMModuleRef; ID:dword; ParamTypes:PLLVMTypeRef; ParamCount:Tsize_t; NameLength:Psize_t):Pchar;cdecl;external libllvm;
{*
 * Obtain if the intrinsic identified by the given ID is overloaded.
 *
 * @see llvm::Intrinsic::isOverloaded()
  }
function LLVMIntrinsicIsOverloaded(ID:dword):TLLVMBool;cdecl;external libllvm;
{*
 * Obtain the calling function of a function.
 *
 * The returned value corresponds to the LLVMCallConv enumeration.
 *
 * @see llvm::Function::getCallingConv()
  }
function LLVMGetFunctionCallConv(Fn:TLLVMValueRef):dword;cdecl;external libllvm;
{*
 * Set the calling convention of a function.
 *
 * @see llvm::Function::setCallingConv()
 *
 * @param Fn Function to operate on
 * @param CC LLVMCallConv to set calling convention to
  }
procedure LLVMSetFunctionCallConv(Fn:TLLVMValueRef; CC:dword);cdecl;external libllvm;
{*
 * Obtain the name of the garbage collector to use during code
 * generation.
 *
 * @see llvm::Function::getGC()
  }
function LLVMGetGC(Fn:TLLVMValueRef):Pchar;cdecl;external libllvm;
{*
 * Define the garbage collector to use during code generation.
 *
 * @see llvm::Function::setGC()
  }
procedure LLVMSetGC(Fn:TLLVMValueRef; Name:Pchar);cdecl;external libllvm;
{*
 * Gets the prefix data associated with a function. Only valid on functions, and
 * only if LLVMHasPrefixData returns true.
 * See https://llvm.org/docs/LangRef.html#prefix-data
  }
function LLVMGetPrefixData(Fn:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Check if a given function has prefix data. Only valid on functions.
 * See https://llvm.org/docs/LangRef.html#prefix-data
  }
function LLVMHasPrefixData(Fn:TLLVMValueRef):TLLVMBool;cdecl;external libllvm;
{*
 * Sets the prefix data for the function. Only valid on functions.
 * See https://llvm.org/docs/LangRef.html#prefix-data
  }
procedure LLVMSetPrefixData(Fn:TLLVMValueRef; prefixData:TLLVMValueRef);cdecl;external libllvm;
{*
 * Gets the prologue data associated with a function. Only valid on functions,
 * and only if LLVMHasPrologueData returns true.
 * See https://llvm.org/docs/LangRef.html#prologue-data
  }
function LLVMGetPrologueData(Fn:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Check if a given function has prologue data. Only valid on functions.
 * See https://llvm.org/docs/LangRef.html#prologue-data
  }
function LLVMHasPrologueData(Fn:TLLVMValueRef):TLLVMBool;cdecl;external libllvm;
{*
 * Sets the prologue data for the function. Only valid on functions.
 * See https://llvm.org/docs/LangRef.html#prologue-data
  }
procedure LLVMSetPrologueData(Fn:TLLVMValueRef; prologueData:TLLVMValueRef);cdecl;external libllvm;
{*
 * Add an attribute to a function.
 *
 * @see llvm::Function::addAttribute()
  }
procedure LLVMAddAttributeAtIndex(F:TLLVMValueRef; Idx:TLLVMAttributeIndex; A:TLLVMAttributeRef);cdecl;external libllvm;
function LLVMGetAttributeCountAtIndex(F:TLLVMValueRef; Idx:TLLVMAttributeIndex):dword;cdecl;external libllvm;
procedure LLVMGetAttributesAtIndex(F:TLLVMValueRef; Idx:TLLVMAttributeIndex; Attrs:PLLVMAttributeRef);cdecl;external libllvm;
function LLVMGetEnumAttributeAtIndex(F:TLLVMValueRef; Idx:TLLVMAttributeIndex; KindID:dword):TLLVMAttributeRef;cdecl;external libllvm;
function LLVMGetStringAttributeAtIndex(F:TLLVMValueRef; Idx:TLLVMAttributeIndex; K:Pchar; KLen:dword):TLLVMAttributeRef;cdecl;external libllvm;
procedure LLVMRemoveEnumAttributeAtIndex(F:TLLVMValueRef; Idx:TLLVMAttributeIndex; KindID:dword);cdecl;external libllvm;
procedure LLVMRemoveStringAttributeAtIndex(F:TLLVMValueRef; Idx:TLLVMAttributeIndex; K:Pchar; KLen:dword);cdecl;external libllvm;
{*
 * Add a target-dependent attribute to a function
 * @see llvm::AttrBuilder::addAttribute()
  }
procedure LLVMAddTargetDependentFunctionAttr(Fn:TLLVMValueRef; A:Pchar; V:Pchar);cdecl;external libllvm;
{*
 * @defgroup LLVMCCoreValueFunctionParameters Function Parameters
 *
 * Functions in this group relate to arguments/parameters on functions.
 *
 * Functions in this group expect LLVMValueRef instances that correspond
 * to llvm::Function instances.
 *
 * @
  }
{*
 * Obtain the number of parameters in a function.
 *
 * @see llvm::Function::arg_size()
  }
function LLVMCountParams(Fn:TLLVMValueRef):dword;cdecl;external libllvm;
{*
 * Obtain the parameters in a function.
 *
 * The takes a pointer to a pre-allocated array of LLVMValueRef that is
 * at least LLVMCountParams() long. This array will be filled with
 * LLVMValueRef instances which correspond to the parameters the
 * function receives. Each LLVMValueRef corresponds to a llvm::Argument
 * instance.
 *
 * @see llvm::Function::arg_begin()
  }
procedure LLVMGetParams(Fn:TLLVMValueRef; Params:PLLVMValueRef);cdecl;external libllvm;
{*
 * Obtain the parameter at the specified index.
 *
 * Parameters are indexed from 0.
 *
 * @see llvm::Function::arg_begin()
  }
function LLVMGetParam(Fn:TLLVMValueRef; Index:dword):TLLVMValueRef;cdecl;external libllvm;
{*
 * Obtain the function to which this argument belongs.
 *
 * Unlike other functions in this group, this one takes an LLVMValueRef
 * that corresponds to a llvm::Attribute.
 *
 * The returned LLVMValueRef is the llvm::Function to which this
 * argument belongs.
  }
function LLVMGetParamParent(Inst:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Obtain the first parameter to a function.
 *
 * @see llvm::Function::arg_begin()
  }
function LLVMGetFirstParam(Fn:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Obtain the last parameter to a function.
 *
 * @see llvm::Function::arg_end()
  }
function LLVMGetLastParam(Fn:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Obtain the next parameter to a function.
 *
 * This takes an LLVMValueRef obtained from LLVMGetFirstParam() (which is
 * actually a wrapped iterator) and obtains the next parameter from the
 * underlying iterator.
  }
function LLVMGetNextParam(Arg:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Obtain the previous parameter to a function.
 *
 * This is the opposite of LLVMGetNextParam().
  }
function LLVMGetPreviousParam(Arg:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Set the alignment for a function parameter.
 *
 * @see llvm::Argument::addAttr()
 * @see llvm::AttrBuilder::addAlignmentAttr()
  }
procedure LLVMSetParamAlignment(Arg:TLLVMValueRef; Align:dword);cdecl;external libllvm;
{*
 * @
  }
{*
 * @defgroup LLVMCCoreValueGlobalIFunc IFuncs
 *
 * Functions in this group relate to indirect functions.
 *
 * Functions in this group expect LLVMValueRef instances that correspond
 * to llvm::GlobalIFunc instances.
 *
 * @
  }
{*
 * Add a global indirect function to a module under a specified name.
 *
 * @see llvm::GlobalIFunc::create()
  }
function LLVMAddGlobalIFunc(M:TLLVMModuleRef; Name:Pchar; NameLen:Tsize_t; Ty:TLLVMTypeRef; AddrSpace:dword; 
           Resolver:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Obtain a GlobalIFunc value from a Module by its name.
 *
 * The returned value corresponds to a llvm::GlobalIFunc value.
 *
 * @see llvm::Module::getNamedIFunc()
  }
function LLVMGetNamedGlobalIFunc(M:TLLVMModuleRef; Name:Pchar; NameLen:Tsize_t):TLLVMValueRef;cdecl;external libllvm;
{*
 * Obtain an iterator to the first GlobalIFunc in a Module.
 *
 * @see llvm::Module::ifunc_begin()
  }
function LLVMGetFirstGlobalIFunc(M:TLLVMModuleRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Obtain an iterator to the last GlobalIFunc in a Module.
 *
 * @see llvm::Module::ifunc_end()
  }
function LLVMGetLastGlobalIFunc(M:TLLVMModuleRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Advance a GlobalIFunc iterator to the next GlobalIFunc.
 *
 * Returns NULL if the iterator was already at the end and there are no more
 * global aliases.
  }
function LLVMGetNextGlobalIFunc(IFunc:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Decrement a GlobalIFunc iterator to the previous GlobalIFunc.
 *
 * Returns NULL if the iterator was already at the beginning and there are
 * no previous global aliases.
  }
function LLVMGetPreviousGlobalIFunc(IFunc:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Retrieves the resolver function associated with this indirect function, or
 * NULL if it doesn't not exist.
 *
 * @see llvm::GlobalIFunc::getResolver()
  }
function LLVMGetGlobalIFuncResolver(IFunc:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Sets the resolver function associated with this indirect function.
 *
 * @see llvm::GlobalIFunc::setResolver()
  }
procedure LLVMSetGlobalIFuncResolver(IFunc:TLLVMValueRef; Resolver:TLLVMValueRef);cdecl;external libllvm;
{*
 * Remove a global indirect function from its parent module and delete it.
 *
 * @see llvm::GlobalIFunc::eraseFromParent()
  }
procedure LLVMEraseGlobalIFunc(IFunc:TLLVMValueRef);cdecl;external libllvm;
{*
 * Remove a global indirect function from its parent module.
 *
 * This unlinks the global indirect function from its containing module but
 * keeps it alive.
 *
 * @see llvm::GlobalIFunc::removeFromParent()
  }
procedure LLVMRemoveGlobalIFunc(IFunc:TLLVMValueRef);cdecl;external libllvm;
{*
 * @
  }
{*
 * @
  }
{*
 * @
  }
{*
 * @
  }
{*
 * @defgroup LLVMCCoreValueMetadata Metadata
 *
 * @
  }
{*
 * Create an MDString value from a given string value.
 *
 * The MDString value does not take ownership of the given string, it remains
 * the responsibility of the caller to free it.
 *
 * @see llvm::MDString::get()
  }
function LLVMMDStringInContext2(C:TLLVMContextRef; Str:Pchar; SLen:Tsize_t):TLLVMMetadataRef;cdecl;external libllvm;
{*
 * Create an MDNode value with the given array of operands.
 *
 * @see llvm::MDNode::get()
  }
function LLVMMDNodeInContext2(C:TLLVMContextRef; MDs:PLLVMMetadataRef; Count:Tsize_t):TLLVMMetadataRef;cdecl;external libllvm;
{*
 * Obtain a Metadata as a Value.
  }
function LLVMMetadataAsValue(C:TLLVMContextRef; MD:TLLVMMetadataRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Obtain a Value as a Metadata.
  }
function LLVMValueAsMetadata(Val:TLLVMValueRef):TLLVMMetadataRef;cdecl;external libllvm;
{*
 * Obtain the underlying string from a MDString value.
 *
 * @param V Instance to obtain string from.
 * @param Length Memory address which will hold length of returned string.
 * @return String data in MDString.
  }
function LLVMGetMDString(V:TLLVMValueRef; Length:Pdword):Pchar;cdecl;external libllvm;
{*
 * Obtain the number of operands from an MDNode value.
 *
 * @param V MDNode to get number of operands from.
 * @return Number of operands of the MDNode.
  }
function LLVMGetMDNodeNumOperands(V:TLLVMValueRef):dword;cdecl;external libllvm;
{*
 * Obtain the given MDNode's operands.
 *
 * The passed LLVMValueRef pointer should point to enough memory to hold all of
 * the operands of the given MDNode (see LLVMGetMDNodeNumOperands) as
 * LLVMValueRefs. This memory will be populated with the LLVMValueRefs of the
 * MDNode's operands.
 *
 * @param V MDNode to get the operands from.
 * @param Dest Destination array for operands.
  }
procedure LLVMGetMDNodeOperands(V:TLLVMValueRef; Dest:PLLVMValueRef);cdecl;external libllvm;
{*
 * Replace an operand at a specific index in a llvm::MDNode value.
 *
 * @see llvm::MDNode::replaceOperandWith()
  }
procedure LLVMReplaceMDNodeOperandWith(V:TLLVMValueRef; Index:dword; Replacement:TLLVMMetadataRef);cdecl;external libllvm;
{* Deprecated: Use LLVMMDStringInContext2 instead.  }
function LLVMMDStringInContext(C:TLLVMContextRef; Str:Pchar; SLen:dword):TLLVMValueRef;cdecl;external libllvm;
{* Deprecated: Use LLVMMDStringInContext2 instead.  }
function LLVMMDString(Str:Pchar; SLen:dword):TLLVMValueRef;cdecl;external libllvm;
{* Deprecated: Use LLVMMDNodeInContext2 instead.  }
function LLVMMDNodeInContext(C:TLLVMContextRef; Vals:PLLVMValueRef; Count:dword):TLLVMValueRef;cdecl;external libllvm;
{* Deprecated: Use LLVMMDNodeInContext2 instead.  }
function LLVMMDNode(Vals:PLLVMValueRef; Count:dword):TLLVMValueRef;cdecl;external libllvm;
{*
 * @
  }
{*
 * @defgroup LLVMCCoreOperandBundle Operand Bundles
 *
 * Functions in this group operate on LLVMOperandBundleRef instances that
 * correspond to llvm::OperandBundleDef instances.
 *
 * @see llvm::OperandBundleDef
 *
 * @
  }
{*
 * Create a new operand bundle.
 *
 * Every invocation should be paired with LLVMDisposeOperandBundle() or memory
 * will be leaked.
 *
 * @param Tag Tag name of the operand bundle
 * @param TagLen Length of Tag
 * @param Args Memory address of an array of bundle operands
 * @param NumArgs Length of Args
  }
function LLVMCreateOperandBundle(Tag:Pchar; TagLen:Tsize_t; Args:PLLVMValueRef; NumArgs:dword):TLLVMOperandBundleRef;cdecl;external libllvm;
{*
 * Destroy an operand bundle.
 *
 * This must be called for every created operand bundle or memory will be
 * leaked.
  }
procedure LLVMDisposeOperandBundle(Bundle:TLLVMOperandBundleRef);cdecl;external libllvm;
{*
 * Obtain the tag of an operand bundle as a string.
 *
 * @param Bundle Operand bundle to obtain tag of.
 * @param Len Out parameter which holds the length of the returned string.
 * @return The tag name of Bundle.
 * @see OperandBundleDef::getTag()
  }
function LLVMGetOperandBundleTag(Bundle:TLLVMOperandBundleRef; Len:Psize_t):Pchar;cdecl;external libllvm;
{*
 * Obtain the number of operands for an operand bundle.
 *
 * @param Bundle Operand bundle to obtain operand count of.
 * @return The number of operands.
 * @see OperandBundleDef::input_size()
  }
function LLVMGetNumOperandBundleArgs(Bundle:TLLVMOperandBundleRef):dword;cdecl;external libllvm;
{*
 * Obtain the operand for an operand bundle at the given index.
 *
 * @param Bundle Operand bundle to obtain operand of.
 * @param Index An operand index, must be less than
 * LLVMGetNumOperandBundleArgs().
 * @return The operand.
  }
function LLVMGetOperandBundleArgAtIndex(Bundle:TLLVMOperandBundleRef; Index:dword):TLLVMValueRef;cdecl;external libllvm;
{*
 * @
  }
{*
 * @defgroup LLVMCCoreValueBasicBlock Basic Block
 *
 * A basic block represents a single entry single exit section of code.
 * Basic blocks contain a list of instructions which form the body of
 * the block.
 *
 * Basic blocks belong to functions. They have the type of label.
 *
 * Basic blocks are themselves values. However, the C API models them as
 * LLVMBasicBlockRef.
 *
 * @see llvm::BasicBlock
 *
 * @
  }
{*
 * Convert a basic block instance to a value type.
  }
function LLVMBasicBlockAsValue(BB:TLLVMBasicBlockRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Determine whether an LLVMValueRef is itself a basic block.
  }
function LLVMValueIsBasicBlock(Val:TLLVMValueRef):TLLVMBool;cdecl;external libllvm;
{*
 * Convert an LLVMValueRef to an LLVMBasicBlockRef instance.
  }
function LLVMValueAsBasicBlock(Val:TLLVMValueRef):TLLVMBasicBlockRef;cdecl;external libllvm;
{*
 * Obtain the string name of a basic block.
  }
function LLVMGetBasicBlockName(BB:TLLVMBasicBlockRef):Pchar;cdecl;external libllvm;
{*
 * Obtain the function to which a basic block belongs.
 *
 * @see llvm::BasicBlock::getParent()
  }
function LLVMGetBasicBlockParent(BB:TLLVMBasicBlockRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Obtain the terminator instruction for a basic block.
 *
 * If the basic block does not have a terminator (it is not well-formed
 * if it doesn't), then NULL is returned.
 *
 * The returned LLVMValueRef corresponds to an llvm::Instruction.
 *
 * @see llvm::BasicBlock::getTerminator()
  }
function LLVMGetBasicBlockTerminator(BB:TLLVMBasicBlockRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Obtain the number of basic blocks in a function.
 *
 * @param Fn Function value to operate on.
  }
function LLVMCountBasicBlocks(Fn:TLLVMValueRef):dword;cdecl;external libllvm;
{*
 * Obtain all of the basic blocks in a function.
 *
 * This operates on a function value. The BasicBlocks parameter is a
 * pointer to a pre-allocated array of LLVMBasicBlockRef of at least
 * LLVMCountBasicBlocks() in length. This array is populated with
 * LLVMBasicBlockRef instances.
  }
procedure LLVMGetBasicBlocks(Fn:TLLVMValueRef; BasicBlocks:PLLVMBasicBlockRef);cdecl;external libllvm;
{*
 * Obtain the first basic block in a function.
 *
 * The returned basic block can be used as an iterator. You will likely
 * eventually call into LLVMGetNextBasicBlock() with it.
 *
 * @see llvm::Function::begin()
  }
function LLVMGetFirstBasicBlock(Fn:TLLVMValueRef):TLLVMBasicBlockRef;cdecl;external libllvm;
{*
 * Obtain the last basic block in a function.
 *
 * @see llvm::Function::end()
  }
function LLVMGetLastBasicBlock(Fn:TLLVMValueRef):TLLVMBasicBlockRef;cdecl;external libllvm;
{*
 * Advance a basic block iterator.
  }
function LLVMGetNextBasicBlock(BB:TLLVMBasicBlockRef):TLLVMBasicBlockRef;cdecl;external libllvm;
{*
 * Go backwards in a basic block iterator.
  }
function LLVMGetPreviousBasicBlock(BB:TLLVMBasicBlockRef):TLLVMBasicBlockRef;cdecl;external libllvm;
{*
 * Obtain the basic block that corresponds to the entry point of a
 * function.
 *
 * @see llvm::Function::getEntryBlock()
  }
function LLVMGetEntryBasicBlock(Fn:TLLVMValueRef):TLLVMBasicBlockRef;cdecl;external libllvm;
{*
 * Insert the given basic block after the insertion point of the given builder.
 *
 * The insertion point must be valid.
 *
 * @see llvm::Function::BasicBlockListType::insertAfter()
  }
procedure LLVMInsertExistingBasicBlockAfterInsertBlock(Builder:TLLVMBuilderRef; BB:TLLVMBasicBlockRef);cdecl;external libllvm;
{*
 * Append the given basic block to the basic block list of the given function.
 *
 * @see llvm::Function::BasicBlockListType::push_back()
  }
procedure LLVMAppendExistingBasicBlock(Fn:TLLVMValueRef; BB:TLLVMBasicBlockRef);cdecl;external libllvm;
{*
 * Create a new basic block without inserting it into a function.
 *
 * @see llvm::BasicBlock::Create()
  }
function LLVMCreateBasicBlockInContext(C:TLLVMContextRef; Name:Pchar):TLLVMBasicBlockRef;cdecl;external libllvm;
{*
 * Append a basic block to the end of a function.
 *
 * @see llvm::BasicBlock::Create()
  }
function LLVMAppendBasicBlockInContext(C:TLLVMContextRef; Fn:TLLVMValueRef; Name:Pchar):TLLVMBasicBlockRef;cdecl;external libllvm;
{*
 * Append a basic block to the end of a function using the global
 * context.
 *
 * @see llvm::BasicBlock::Create()
  }
function LLVMAppendBasicBlock(Fn:TLLVMValueRef; Name:Pchar):TLLVMBasicBlockRef;cdecl;external libllvm;
{*
 * Insert a basic block in a function before another basic block.
 *
 * The function to add to is determined by the function of the
 * passed basic block.
 *
 * @see llvm::BasicBlock::Create()
  }
function LLVMInsertBasicBlockInContext(C:TLLVMContextRef; BB:TLLVMBasicBlockRef; Name:Pchar):TLLVMBasicBlockRef;cdecl;external libllvm;
{*
 * Insert a basic block in a function using the global context.
 *
 * @see llvm::BasicBlock::Create()
  }
function LLVMInsertBasicBlock(InsertBeforeBB:TLLVMBasicBlockRef; Name:Pchar):TLLVMBasicBlockRef;cdecl;external libllvm;
{*
 * Remove a basic block from a function and delete it.
 *
 * This deletes the basic block from its containing function and deletes
 * the basic block itself.
 *
 * @see llvm::BasicBlock::eraseFromParent()
  }
procedure LLVMDeleteBasicBlock(BB:TLLVMBasicBlockRef);cdecl;external libllvm;
{*
 * Remove a basic block from a function.
 *
 * This deletes the basic block from its containing function but keep
 * the basic block alive.
 *
 * @see llvm::BasicBlock::removeFromParent()
  }
procedure LLVMRemoveBasicBlockFromParent(BB:TLLVMBasicBlockRef);cdecl;external libllvm;
{*
 * Move a basic block to before another one.
 *
 * @see llvm::BasicBlock::moveBefore()
  }
procedure LLVMMoveBasicBlockBefore(BB:TLLVMBasicBlockRef; MovePos:TLLVMBasicBlockRef);cdecl;external libllvm;
{*
 * Move a basic block to after another one.
 *
 * @see llvm::BasicBlock::moveAfter()
  }
procedure LLVMMoveBasicBlockAfter(BB:TLLVMBasicBlockRef; MovePos:TLLVMBasicBlockRef);cdecl;external libllvm;
{*
 * Obtain the first instruction in a basic block.
 *
 * The returned LLVMValueRef corresponds to a llvm::Instruction
 * instance.
  }
function LLVMGetFirstInstruction(BB:TLLVMBasicBlockRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Obtain the last instruction in a basic block.
 *
 * The returned LLVMValueRef corresponds to an LLVM:Instruction.
  }
function LLVMGetLastInstruction(BB:TLLVMBasicBlockRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * @
  }
{*
 * @defgroup LLVMCCoreValueInstruction Instructions
 *
 * Functions in this group relate to the inspection and manipulation of
 * individual instructions.
 *
 * In the C++ API, an instruction is modeled by llvm::Instruction. This
 * class has a large number of descendents. llvm::Instruction is a
 * llvm::Value and in the C API, instructions are modeled by
 * LLVMValueRef.
 *
 * This group also contains sub-groups which operate on specific
 * llvm::Instruction types, e.g. llvm::CallInst.
 *
 * @
  }
{*
 * Determine whether an instruction has any metadata attached.
  }
function LLVMHasMetadata(Val:TLLVMValueRef):longint;cdecl;external libllvm;
{*
 * Return metadata associated with an instruction value.
  }
function LLVMGetMetadata(Val:TLLVMValueRef; KindID:dword):TLLVMValueRef;cdecl;external libllvm;
{*
 * Set metadata associated with an instruction value.
  }
procedure LLVMSetMetadata(Val:TLLVMValueRef; KindID:dword; Node:TLLVMValueRef);cdecl;external libllvm;
{*
 * Returns the metadata associated with an instruction value, but filters out
 * all the debug locations.
 *
 * @see llvm::Instruction::getAllMetadataOtherThanDebugLoc()
  }
function LLVMInstructionGetAllMetadataOtherThanDebugLoc(Instr:TLLVMValueRef; NumEntries:Psize_t):PLLVMValueMetadataEntry;cdecl;external libllvm;
{*
 * Obtain the basic block to which an instruction belongs.
 *
 * @see llvm::Instruction::getParent()
  }
function LLVMGetInstructionParent(Inst:TLLVMValueRef):TLLVMBasicBlockRef;cdecl;external libllvm;
{*
 * Obtain the instruction that occurs after the one specified.
 *
 * The next instruction will be from the same basic block.
 *
 * If this is the last instruction in a basic block, NULL will be
 * returned.
  }
function LLVMGetNextInstruction(Inst:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Obtain the instruction that occurred before this one.
 *
 * If the instruction is the first instruction in a basic block, NULL
 * will be returned.
  }
function LLVMGetPreviousInstruction(Inst:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Remove an instruction.
 *
 * The instruction specified is removed from its containing building
 * block but is kept alive.
 *
 * @see llvm::Instruction::removeFromParent()
  }
procedure LLVMInstructionRemoveFromParent(Inst:TLLVMValueRef);cdecl;external libllvm;
{*
 * Remove and delete an instruction.
 *
 * The instruction specified is removed from its containing building
 * block and then deleted.
 *
 * @see llvm::Instruction::eraseFromParent()
  }
procedure LLVMInstructionEraseFromParent(Inst:TLLVMValueRef);cdecl;external libllvm;
{*
 * Delete an instruction.
 *
 * The instruction specified is deleted. It must have previously been
 * removed from its containing building block.
 *
 * @see llvm::Value::deleteValue()
  }
procedure LLVMDeleteInstruction(Inst:TLLVMValueRef);cdecl;external libllvm;
{*
 * Obtain the code opcode for an individual instruction.
 *
 * @see llvm::Instruction::getOpCode()
  }
function LLVMGetInstructionOpcode(Inst:TLLVMValueRef):TLLVMOpcode;cdecl;external libllvm;
{*
 * Obtain the predicate of an instruction.
 *
 * This is only valid for instructions that correspond to llvm::ICmpInst.
 *
 * @see llvm::ICmpInst::getPredicate()
  }
function LLVMGetICmpPredicate(Inst:TLLVMValueRef):TLLVMIntPredicate;cdecl;external libllvm;
{*
 * Obtain the float predicate of an instruction.
 *
 * This is only valid for instructions that correspond to llvm::FCmpInst.
 *
 * @see llvm::FCmpInst::getPredicate()
  }
function LLVMGetFCmpPredicate(Inst:TLLVMValueRef):TLLVMRealPredicate;cdecl;external libllvm;
{*
 * Create a copy of 'this' instruction that is identical in all ways
 * except the following:
 *   * The instruction has no parent
 *   * The instruction has no name
 *
 * @see llvm::Instruction::clone()
  }
function LLVMInstructionClone(Inst:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Determine whether an instruction is a terminator. This routine is named to
 * be compatible with historical functions that did this by querying the
 * underlying C++ type.
 *
 * @see llvm::Instruction::isTerminator()
  }
function LLVMIsATerminatorInst(Inst:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Obtain the first debug record attached to an instruction.
 *
 * Use LLVMGetNextDbgRecord() and LLVMGetPreviousDbgRecord() to traverse the
 * sequence of DbgRecords.
 *
 * Return the first DbgRecord attached to Inst or NULL if there are none.
 *
 * @see llvm::Instruction::getDbgRecordRange()
  }
function LLVMGetFirstDbgRecord(Inst:TLLVMValueRef):TLLVMDbgRecordRef;cdecl;external libllvm;
{*
 * Obtain the last debug record attached to an instruction.
 *
 * Return the last DbgRecord attached to Inst or NULL if there are none.
 *
 * @see llvm::Instruction::getDbgRecordRange()
  }
function LLVMGetLastDbgRecord(Inst:TLLVMValueRef):TLLVMDbgRecordRef;cdecl;external libllvm;
{*
 * Obtain the next DbgRecord in the sequence or NULL if there are no more.
 *
 * @see llvm::Instruction::getDbgRecordRange()
  }
function LLVMGetNextDbgRecord(DbgRecord:TLLVMDbgRecordRef):TLLVMDbgRecordRef;cdecl;external libllvm;
{*
 * Obtain the previous DbgRecord in the sequence or NULL if there are no more.
 *
 * @see llvm::Instruction::getDbgRecordRange()
  }
function LLVMGetPreviousDbgRecord(DbgRecord:TLLVMDbgRecordRef):TLLVMDbgRecordRef;cdecl;external libllvm;
{*
 * @defgroup LLVMCCoreValueInstructionCall Call Sites and Invocations
 *
 * Functions in this group apply to instructions that refer to call
 * sites and invocations. These correspond to C++ types in the
 * llvm::CallInst class tree.
 *
 * @
  }
{*
 * Obtain the argument count for a call instruction.
 *
 * This expects an LLVMValueRef that corresponds to a llvm::CallInst,
 * llvm::InvokeInst, or llvm:FuncletPadInst.
 *
 * @see llvm::CallInst::getNumArgOperands()
 * @see llvm::InvokeInst::getNumArgOperands()
 * @see llvm::FuncletPadInst::getNumArgOperands()
  }
function LLVMGetNumArgOperands(Instr:TLLVMValueRef):dword;cdecl;external libllvm;
{*
 * Set the calling convention for a call instruction.
 *
 * This expects an LLVMValueRef that corresponds to a llvm::CallInst or
 * llvm::InvokeInst.
 *
 * @see llvm::CallInst::setCallingConv()
 * @see llvm::InvokeInst::setCallingConv()
  }
procedure LLVMSetInstructionCallConv(Instr:TLLVMValueRef; CC:dword);cdecl;external libllvm;
{*
 * Obtain the calling convention for a call instruction.
 *
 * This is the opposite of LLVMSetInstructionCallConv(). Reads its
 * usage.
 *
 * @see LLVMSetInstructionCallConv()
  }
function LLVMGetInstructionCallConv(Instr:TLLVMValueRef):dword;cdecl;external libllvm;
procedure LLVMSetInstrParamAlignment(Instr:TLLVMValueRef; Idx:TLLVMAttributeIndex; Align:dword);cdecl;external libllvm;
procedure LLVMAddCallSiteAttribute(C:TLLVMValueRef; Idx:TLLVMAttributeIndex; A:TLLVMAttributeRef);cdecl;external libllvm;
function LLVMGetCallSiteAttributeCount(C:TLLVMValueRef; Idx:TLLVMAttributeIndex):dword;cdecl;external libllvm;
procedure LLVMGetCallSiteAttributes(C:TLLVMValueRef; Idx:TLLVMAttributeIndex; Attrs:PLLVMAttributeRef);cdecl;external libllvm;
function LLVMGetCallSiteEnumAttribute(C:TLLVMValueRef; Idx:TLLVMAttributeIndex; KindID:dword):TLLVMAttributeRef;cdecl;external libllvm;
function LLVMGetCallSiteStringAttribute(C:TLLVMValueRef; Idx:TLLVMAttributeIndex; K:Pchar; KLen:dword):TLLVMAttributeRef;cdecl;external libllvm;
procedure LLVMRemoveCallSiteEnumAttribute(C:TLLVMValueRef; Idx:TLLVMAttributeIndex; KindID:dword);cdecl;external libllvm;
procedure LLVMRemoveCallSiteStringAttribute(C:TLLVMValueRef; Idx:TLLVMAttributeIndex; K:Pchar; KLen:dword);cdecl;external libllvm;
{*
 * Obtain the function type called by this instruction.
 *
 * @see llvm::CallBase::getFunctionType()
  }
function LLVMGetCalledFunctionType(C:TLLVMValueRef):TLLVMTypeRef;cdecl;external libllvm;
{*
 * Obtain the pointer to the function invoked by this instruction.
 *
 * This expects an LLVMValueRef that corresponds to a llvm::CallInst or
 * llvm::InvokeInst.
 *
 * @see llvm::CallInst::getCalledOperand()
 * @see llvm::InvokeInst::getCalledOperand()
  }
function LLVMGetCalledValue(Instr:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Obtain the number of operand bundles attached to this instruction.
 *
 * This only works on llvm::CallInst and llvm::InvokeInst instructions.
 *
 * @see llvm::CallBase::getNumOperandBundles()
  }
function LLVMGetNumOperandBundles(C:TLLVMValueRef):dword;cdecl;external libllvm;
{*
 * Obtain the operand bundle attached to this instruction at the given index.
 * Use LLVMDisposeOperandBundle to free the operand bundle.
 *
 * This only works on llvm::CallInst and llvm::InvokeInst instructions.
  }
function LLVMGetOperandBundleAtIndex(C:TLLVMValueRef; Index:dword):TLLVMOperandBundleRef;cdecl;external libllvm;
{*
 * Obtain whether a call instruction is a tail call.
 *
 * This only works on llvm::CallInst instructions.
 *
 * @see llvm::CallInst::isTailCall()
  }
function LLVMIsTailCall(CallInst:TLLVMValueRef):TLLVMBool;cdecl;external libllvm;
{*
 * Set whether a call instruction is a tail call.
 *
 * This only works on llvm::CallInst instructions.
 *
 * @see llvm::CallInst::setTailCall()
  }
procedure LLVMSetTailCall(CallInst:TLLVMValueRef; IsTailCall:TLLVMBool);cdecl;external libllvm;
{*
 * Obtain a tail call kind of the call instruction.
 *
 * @see llvm::CallInst::setTailCallKind()
  }
function LLVMGetTailCallKind(CallInst:TLLVMValueRef):TLLVMTailCallKind;cdecl;external libllvm;
{*
 * Set the call kind of the call instruction.
 *
 * @see llvm::CallInst::getTailCallKind()
  }
procedure LLVMSetTailCallKind(CallInst:TLLVMValueRef; kind:TLLVMTailCallKind);cdecl;external libllvm;
{*
 * Return the normal destination basic block.
 *
 * This only works on llvm::InvokeInst instructions.
 *
 * @see llvm::InvokeInst::getNormalDest()
  }
function LLVMGetNormalDest(InvokeInst:TLLVMValueRef):TLLVMBasicBlockRef;cdecl;external libllvm;
{*
 * Return the unwind destination basic block.
 *
 * Works on llvm::InvokeInst, llvm::CleanupReturnInst, and
 * llvm::CatchSwitchInst instructions.
 *
 * @see llvm::InvokeInst::getUnwindDest()
 * @see llvm::CleanupReturnInst::getUnwindDest()
 * @see llvm::CatchSwitchInst::getUnwindDest()
  }
function LLVMGetUnwindDest(InvokeInst:TLLVMValueRef):TLLVMBasicBlockRef;cdecl;external libllvm;
{*
 * Set the normal destination basic block.
 *
 * This only works on llvm::InvokeInst instructions.
 *
 * @see llvm::InvokeInst::setNormalDest()
  }
procedure LLVMSetNormalDest(InvokeInst:TLLVMValueRef; B:TLLVMBasicBlockRef);cdecl;external libllvm;
{*
 * Set the unwind destination basic block.
 *
 * Works on llvm::InvokeInst, llvm::CleanupReturnInst, and
 * llvm::CatchSwitchInst instructions.
 *
 * @see llvm::InvokeInst::setUnwindDest()
 * @see llvm::CleanupReturnInst::setUnwindDest()
 * @see llvm::CatchSwitchInst::setUnwindDest()
  }
procedure LLVMSetUnwindDest(InvokeInst:TLLVMValueRef; B:TLLVMBasicBlockRef);cdecl;external libllvm;
{*
 * Get the default destination of a CallBr instruction.
 *
 * @see llvm::CallBrInst::getDefaultDest()
  }
function LLVMGetCallBrDefaultDest(CallBr:TLLVMValueRef):TLLVMBasicBlockRef;cdecl;external libllvm;
{*
 * Get the number of indirect destinations of a CallBr instruction.
 *
 * @see llvm::CallBrInst::getNumIndirectDests()

  }
function LLVMGetCallBrNumIndirectDests(CallBr:TLLVMValueRef):dword;cdecl;external libllvm;
{*
 * Get the indirect destination of a CallBr instruction at the given index.
 *
 * @see llvm::CallBrInst::getIndirectDest()
  }
function LLVMGetCallBrIndirectDest(CallBr:TLLVMValueRef; Idx:dword):TLLVMBasicBlockRef;cdecl;external libllvm;
{*
 * @
  }
{*
 * @defgroup LLVMCCoreValueInstructionTerminator Terminators
 *
 * Functions in this group only apply to instructions for which
 * LLVMIsATerminatorInst returns true.
 *
 * @
  }
{*
 * Return the number of successors that this terminator has.
 *
 * @see llvm::Instruction::getNumSuccessors
  }
function LLVMGetNumSuccessors(Term:TLLVMValueRef):dword;cdecl;external libllvm;
{*
 * Return the specified successor.
 *
 * @see llvm::Instruction::getSuccessor
  }
function LLVMGetSuccessor(Term:TLLVMValueRef; i:dword):TLLVMBasicBlockRef;cdecl;external libllvm;
{*
 * Update the specified successor to point at the provided block.
 *
 * @see llvm::Instruction::setSuccessor
  }
procedure LLVMSetSuccessor(Term:TLLVMValueRef; i:dword; block:TLLVMBasicBlockRef);cdecl;external libllvm;
{*
 * Return if a branch is conditional.
 *
 * This only works on llvm::BranchInst instructions.
 *
 * @see llvm::BranchInst::isConditional
  }
function LLVMIsConditional(Branch:TLLVMValueRef):TLLVMBool;cdecl;external libllvm;
{*
 * Return the condition of a branch instruction.
 *
 * This only works on llvm::BranchInst instructions.
 *
 * @see llvm::BranchInst::getCondition
  }
function LLVMGetCondition(Branch:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Set the condition of a branch instruction.
 *
 * This only works on llvm::BranchInst instructions.
 *
 * @see llvm::BranchInst::setCondition
  }
procedure LLVMSetCondition(Branch:TLLVMValueRef; Cond:TLLVMValueRef);cdecl;external libllvm;
{*
 * Obtain the default destination basic block of a switch instruction.
 *
 * This only works on llvm::SwitchInst instructions.
 *
 * @see llvm::SwitchInst::getDefaultDest()
  }
function LLVMGetSwitchDefaultDest(SwitchInstr:TLLVMValueRef):TLLVMBasicBlockRef;cdecl;external libllvm;
{*
 * @
  }
{*
 * @defgroup LLVMCCoreValueInstructionAlloca Allocas
 *
 * Functions in this group only apply to instructions that map to
 * llvm::AllocaInst instances.
 *
 * @
  }
{*
 * Obtain the type that is being allocated by the alloca instruction.
  }
function LLVMGetAllocatedType(Alloca:TLLVMValueRef):TLLVMTypeRef;cdecl;external libllvm;
{*
 * @
  }
{*
 * @defgroup LLVMCCoreValueInstructionGetElementPointer GEPs
 *
 * Functions in this group only apply to instructions that map to
 * llvm::GetElementPtrInst instances.
 *
 * @
  }
{*
 * Check whether the given GEP operator is inbounds.
  }
function LLVMIsInBounds(GEP:TLLVMValueRef):TLLVMBool;cdecl;external libllvm;
{*
 * Set the given GEP instruction to be inbounds or not.
  }
procedure LLVMSetIsInBounds(GEP:TLLVMValueRef; InBounds:TLLVMBool);cdecl;external libllvm;
{*
 * Get the source element type of the given GEP operator.
  }
function LLVMGetGEPSourceElementType(GEP:TLLVMValueRef):TLLVMTypeRef;cdecl;external libllvm;
{*
 * Get the no-wrap related flags for the given GEP instruction.
 *
 * @see llvm::GetElementPtrInst::getNoWrapFlags
  }
function LLVMGEPGetNoWrapFlags(GEP:TLLVMValueRef):TLLVMGEPNoWrapFlags;cdecl;external libllvm;
{*
 * Set the no-wrap related flags for the given GEP instruction.
 *
 * @see llvm::GetElementPtrInst::setNoWrapFlags
  }
procedure LLVMGEPSetNoWrapFlags(GEP:TLLVMValueRef; NoWrapFlags:TLLVMGEPNoWrapFlags);cdecl;external libllvm;
{*
 * @
  }
{*
 * @defgroup LLVMCCoreValueInstructionPHINode PHI Nodes
 *
 * Functions in this group only apply to instructions that map to
 * llvm::PHINode instances.
 *
 * @
  }
{*
 * Add an incoming value to the end of a PHI list.
  }
procedure LLVMAddIncoming(PhiNode:TLLVMValueRef; IncomingValues:PLLVMValueRef; IncomingBlocks:PLLVMBasicBlockRef; Count:dword);cdecl;external libllvm;
{*
 * Obtain the number of incoming basic blocks to a PHI node.
  }
function LLVMCountIncoming(PhiNode:TLLVMValueRef):dword;cdecl;external libllvm;
{*
 * Obtain an incoming value to a PHI node as an LLVMValueRef.
  }
function LLVMGetIncomingValue(PhiNode:TLLVMValueRef; Index:dword):TLLVMValueRef;cdecl;external libllvm;
{*
 * Obtain an incoming value to a PHI node as an LLVMBasicBlockRef.
  }
function LLVMGetIncomingBlock(PhiNode:TLLVMValueRef; Index:dword):TLLVMBasicBlockRef;cdecl;external libllvm;
{*
 * @
  }
{*
 * @defgroup LLVMCCoreValueInstructionExtractValue ExtractValue
 * @defgroup LLVMCCoreValueInstructionInsertValue InsertValue
 *
 * Functions in this group only apply to instructions that map to
 * llvm::ExtractValue and llvm::InsertValue instances.
 *
 * @
  }
{*
 * Obtain the number of indices.
 * NB: This also works on GEP operators.
  }
function LLVMGetNumIndices(Inst:TLLVMValueRef):dword;cdecl;external libllvm;
{*
 * Obtain the indices as an array.
  }
function LLVMGetIndices(Inst:TLLVMValueRef):Pdword;cdecl;external libllvm;
{*
 * @
  }
{*
 * @
  }
{*
 * @
  }
{*
 * @defgroup LLVMCCoreInstructionBuilder Instruction Builders
 *
 * An instruction builder represents a point within a basic block and is
 * the exclusive means of building instructions using the C interface.
 *
 * @
  }
function LLVMCreateBuilderInContext(C:TLLVMContextRef):TLLVMBuilderRef;cdecl;external libllvm;
function LLVMCreateBuilder:TLLVMBuilderRef;cdecl;external libllvm;
{*
 * Set the builder position before Instr but after any attached debug records,
 * or if Instr is null set the position to the end of Block.
  }
procedure LLVMPositionBuilder(Builder:TLLVMBuilderRef; Block:TLLVMBasicBlockRef; Instr:TLLVMValueRef);cdecl;external libllvm;
{*
 * Set the builder position before Instr and any attached debug records,
 * or if Instr is null set the position to the end of Block.
  }
procedure LLVMPositionBuilderBeforeDbgRecords(Builder:TLLVMBuilderRef; Block:TLLVMBasicBlockRef; Inst:TLLVMValueRef);cdecl;external libllvm;
{*
 * Set the builder position before Instr but after any attached debug records.
  }
procedure LLVMPositionBuilderBefore(Builder:TLLVMBuilderRef; Instr:TLLVMValueRef);cdecl;external libllvm;
{*
 * Set the builder position before Instr and any attached debug records.
  }
procedure LLVMPositionBuilderBeforeInstrAndDbgRecords(Builder:TLLVMBuilderRef; Instr:TLLVMValueRef);cdecl;external libllvm;
procedure LLVMPositionBuilderAtEnd(Builder:TLLVMBuilderRef; Block:TLLVMBasicBlockRef);cdecl;external libllvm;
function LLVMGetInsertBlock(Builder:TLLVMBuilderRef):TLLVMBasicBlockRef;cdecl;external libllvm;
procedure LLVMClearInsertionPosition(Builder:TLLVMBuilderRef);cdecl;external libllvm;
procedure LLVMInsertIntoBuilder(Builder:TLLVMBuilderRef; Instr:TLLVMValueRef);cdecl;external libllvm;
procedure LLVMInsertIntoBuilderWithName(Builder:TLLVMBuilderRef; Instr:TLLVMValueRef; Name:Pchar);cdecl;external libllvm;
procedure LLVMDisposeBuilder(Builder:TLLVMBuilderRef);cdecl;external libllvm;
{ Metadata  }
{*
 * Get location information used by debugging information.
 *
 * @see llvm::IRBuilder::getCurrentDebugLocation()
  }
function LLVMGetCurrentDebugLocation2(Builder:TLLVMBuilderRef):TLLVMMetadataRef;cdecl;external libllvm;
{*
 * Set location information used by debugging information.
 *
 * To clear the location metadata of the given instruction, pass NULL to \p Loc.
 *
 * @see llvm::IRBuilder::SetCurrentDebugLocation()
  }
procedure LLVMSetCurrentDebugLocation2(Builder:TLLVMBuilderRef; Loc:TLLVMMetadataRef);cdecl;external libllvm;
{*
 * Attempts to set the debug location for the given instruction using the
 * current debug location for the given builder.  If the builder has no current
 * debug location, this function is a no-op.
 *
 * @deprecated LLVMSetInstDebugLocation is deprecated in favor of the more general
 *             LLVMAddMetadataToInst.
 *
 * @see llvm::IRBuilder::SetInstDebugLocation()
  }
procedure LLVMSetInstDebugLocation(Builder:TLLVMBuilderRef; Inst:TLLVMValueRef);cdecl;external libllvm;
{*
 * Adds the metadata registered with the given builder to the given instruction.
 *
 * @see llvm::IRBuilder::AddMetadataToInst()
  }
procedure LLVMAddMetadataToInst(Builder:TLLVMBuilderRef; Inst:TLLVMValueRef);cdecl;external libllvm;
{*
 * Get the dafult floating-point math metadata for a given builder.
 *
 * @see llvm::IRBuilder::getDefaultFPMathTag()
  }
function LLVMBuilderGetDefaultFPMathTag(Builder:TLLVMBuilderRef):TLLVMMetadataRef;cdecl;external libllvm;
{*
 * Set the default floating-point math metadata for the given builder.
 *
 * To clear the metadata, pass NULL to \p FPMathTag.
 *
 * @see llvm::IRBuilder::setDefaultFPMathTag()
  }
procedure LLVMBuilderSetDefaultFPMathTag(Builder:TLLVMBuilderRef; FPMathTag:TLLVMMetadataRef);cdecl;external libllvm;
{*
 * Obtain the context to which this builder is associated.
 *
 * @see llvm::IRBuilder::getContext()
  }
function LLVMGetBuilderContext(Builder:TLLVMBuilderRef):TLLVMContextRef;cdecl;external libllvm;
{*
 * Deprecated: Passing the NULL location will crash.
 * Use LLVMGetCurrentDebugLocation2 instead.
  }
procedure LLVMSetCurrentDebugLocation(Builder:TLLVMBuilderRef; L:TLLVMValueRef);cdecl;external libllvm;
{*
 * Deprecated: Returning the NULL location will crash.
 * Use LLVMGetCurrentDebugLocation2 instead.
  }
function LLVMGetCurrentDebugLocation(Builder:TLLVMBuilderRef):TLLVMValueRef;cdecl;external libllvm;
{ Terminators  }
function LLVMBuildRetVoid(para1:TLLVMBuilderRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildRet(para1:TLLVMBuilderRef; V:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildAggregateRet(para1:TLLVMBuilderRef; RetVals:PLLVMValueRef; N:dword):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildBr(para1:TLLVMBuilderRef; Dest:TLLVMBasicBlockRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildCondBr(para1:TLLVMBuilderRef; If:TLLVMValueRef; Then:TLLVMBasicBlockRef; Else:TLLVMBasicBlockRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildSwitch(para1:TLLVMBuilderRef; V:TLLVMValueRef; Else:TLLVMBasicBlockRef; NumCases:dword):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildIndirectBr(B:TLLVMBuilderRef; Addr:TLLVMValueRef; NumDests:dword):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildCallBr(B:TLLVMBuilderRef; Ty:TLLVMTypeRef; Fn:TLLVMValueRef; DefaultDest:TLLVMBasicBlockRef; IndirectDests:PLLVMBasicBlockRef; 
           NumIndirectDests:dword; Args:PLLVMValueRef; NumArgs:dword; Bundles:PLLVMOperandBundleRef; NumBundles:dword; 
           Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildInvoke2(para1:TLLVMBuilderRef; Ty:TLLVMTypeRef; Fn:TLLVMValueRef; Args:PLLVMValueRef; NumArgs:dword; 
           Then:TLLVMBasicBlockRef; Catch:TLLVMBasicBlockRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildInvokeWithOperandBundles(para1:TLLVMBuilderRef; Ty:TLLVMTypeRef; Fn:TLLVMValueRef; Args:PLLVMValueRef; NumArgs:dword; 
           Then:TLLVMBasicBlockRef; Catch:TLLVMBasicBlockRef; Bundles:PLLVMOperandBundleRef; NumBundles:dword; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildUnreachable(para1:TLLVMBuilderRef):TLLVMValueRef;cdecl;external libllvm;
{ Exception Handling  }
function LLVMBuildResume(B:TLLVMBuilderRef; Exn:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildLandingPad(B:TLLVMBuilderRef; Ty:TLLVMTypeRef; PersFn:TLLVMValueRef; NumClauses:dword; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildCleanupRet(B:TLLVMBuilderRef; CatchPad:TLLVMValueRef; BB:TLLVMBasicBlockRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildCatchRet(B:TLLVMBuilderRef; CatchPad:TLLVMValueRef; BB:TLLVMBasicBlockRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildCatchPad(B:TLLVMBuilderRef; ParentPad:TLLVMValueRef; Args:PLLVMValueRef; NumArgs:dword; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildCleanupPad(B:TLLVMBuilderRef; ParentPad:TLLVMValueRef; Args:PLLVMValueRef; NumArgs:dword; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildCatchSwitch(B:TLLVMBuilderRef; ParentPad:TLLVMValueRef; UnwindBB:TLLVMBasicBlockRef; NumHandlers:dword; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
{ Add a case to the switch instruction  }
procedure LLVMAddCase(Switch:TLLVMValueRef; OnVal:TLLVMValueRef; Dest:TLLVMBasicBlockRef);cdecl;external libllvm;
{ Add a destination to the indirectbr instruction  }
procedure LLVMAddDestination(IndirectBr:TLLVMValueRef; Dest:TLLVMBasicBlockRef);cdecl;external libllvm;
{ Get the number of clauses on the landingpad instruction  }
function LLVMGetNumClauses(LandingPad:TLLVMValueRef):dword;cdecl;external libllvm;
{ Get the value of the clause at index Idx on the landingpad instruction  }
function LLVMGetClause(LandingPad:TLLVMValueRef; Idx:dword):TLLVMValueRef;cdecl;external libllvm;
{ Add a catch or filter clause to the landingpad instruction  }
procedure LLVMAddClause(LandingPad:TLLVMValueRef; ClauseVal:TLLVMValueRef);cdecl;external libllvm;
{ Get the 'cleanup' flag in the landingpad instruction  }
function LLVMIsCleanup(LandingPad:TLLVMValueRef):TLLVMBool;cdecl;external libllvm;
{ Set the 'cleanup' flag in the landingpad instruction  }
procedure LLVMSetCleanup(LandingPad:TLLVMValueRef; Val:TLLVMBool);cdecl;external libllvm;
{ Add a destination to the catchswitch instruction  }
procedure LLVMAddHandler(CatchSwitch:TLLVMValueRef; Dest:TLLVMBasicBlockRef);cdecl;external libllvm;
{ Get the number of handlers on the catchswitch instruction  }
function LLVMGetNumHandlers(CatchSwitch:TLLVMValueRef):dword;cdecl;external libllvm;
{*
 * Obtain the basic blocks acting as handlers for a catchswitch instruction.
 *
 * The Handlers parameter should point to a pre-allocated array of
 * LLVMBasicBlockRefs at least LLVMGetNumHandlers() large. On return, the
 * first LLVMGetNumHandlers() entries in the array will be populated
 * with LLVMBasicBlockRef instances.
 *
 * @param CatchSwitch The catchswitch instruction to operate on.
 * @param Handlers Memory address of an array to be filled with basic blocks.
  }
procedure LLVMGetHandlers(CatchSwitch:TLLVMValueRef; Handlers:PLLVMBasicBlockRef);cdecl;external libllvm;
{ Funclets  }
{ Get the number of funcletpad arguments.  }
function LLVMGetArgOperand(Funclet:TLLVMValueRef; i:dword):TLLVMValueRef;cdecl;external libllvm;
{ Set a funcletpad argument at the given index.  }
procedure LLVMSetArgOperand(Funclet:TLLVMValueRef; i:dword; value:TLLVMValueRef);cdecl;external libllvm;
{*
 * Get the parent catchswitch instruction of a catchpad instruction.
 *
 * This only works on llvm::CatchPadInst instructions.
 *
 * @see llvm::CatchPadInst::getCatchSwitch()
  }
function LLVMGetParentCatchSwitch(CatchPad:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Set the parent catchswitch instruction of a catchpad instruction.
 *
 * This only works on llvm::CatchPadInst instructions.
 *
 * @see llvm::CatchPadInst::setCatchSwitch()
  }
procedure LLVMSetParentCatchSwitch(CatchPad:TLLVMValueRef; CatchSwitch:TLLVMValueRef);cdecl;external libllvm;
{ Arithmetic  }
function LLVMBuildAdd(para1:TLLVMBuilderRef; LHS:TLLVMValueRef; RHS:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildNSWAdd(para1:TLLVMBuilderRef; LHS:TLLVMValueRef; RHS:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildNUWAdd(para1:TLLVMBuilderRef; LHS:TLLVMValueRef; RHS:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildFAdd(para1:TLLVMBuilderRef; LHS:TLLVMValueRef; RHS:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildSub(para1:TLLVMBuilderRef; LHS:TLLVMValueRef; RHS:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildNSWSub(para1:TLLVMBuilderRef; LHS:TLLVMValueRef; RHS:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildNUWSub(para1:TLLVMBuilderRef; LHS:TLLVMValueRef; RHS:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildFSub(para1:TLLVMBuilderRef; LHS:TLLVMValueRef; RHS:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildMul(para1:TLLVMBuilderRef; LHS:TLLVMValueRef; RHS:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildNSWMul(para1:TLLVMBuilderRef; LHS:TLLVMValueRef; RHS:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildNUWMul(para1:TLLVMBuilderRef; LHS:TLLVMValueRef; RHS:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildFMul(para1:TLLVMBuilderRef; LHS:TLLVMValueRef; RHS:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildUDiv(para1:TLLVMBuilderRef; LHS:TLLVMValueRef; RHS:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildExactUDiv(para1:TLLVMBuilderRef; LHS:TLLVMValueRef; RHS:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildSDiv(para1:TLLVMBuilderRef; LHS:TLLVMValueRef; RHS:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildExactSDiv(para1:TLLVMBuilderRef; LHS:TLLVMValueRef; RHS:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildFDiv(para1:TLLVMBuilderRef; LHS:TLLVMValueRef; RHS:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildURem(para1:TLLVMBuilderRef; LHS:TLLVMValueRef; RHS:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildSRem(para1:TLLVMBuilderRef; LHS:TLLVMValueRef; RHS:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildFRem(para1:TLLVMBuilderRef; LHS:TLLVMValueRef; RHS:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildShl(para1:TLLVMBuilderRef; LHS:TLLVMValueRef; RHS:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildLShr(para1:TLLVMBuilderRef; LHS:TLLVMValueRef; RHS:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildAShr(para1:TLLVMBuilderRef; LHS:TLLVMValueRef; RHS:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildAnd(para1:TLLVMBuilderRef; LHS:TLLVMValueRef; RHS:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildOr(para1:TLLVMBuilderRef; LHS:TLLVMValueRef; RHS:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildXor(para1:TLLVMBuilderRef; LHS:TLLVMValueRef; RHS:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildBinOp(B:TLLVMBuilderRef; Op:TLLVMOpcode; LHS:TLLVMValueRef; RHS:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildNeg(para1:TLLVMBuilderRef; V:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildNSWNeg(B:TLLVMBuilderRef; V:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
{ xxxxxLLVM_ATTRIBUTE_C_DEPRECATED( }
function LLVMBuildNUWNeg(B:TLLVMBuilderRef; V:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildFNeg(para1:TLLVMBuilderRef; V:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildNot(para1:TLLVMBuilderRef; V:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMGetNUW(ArithInst:TLLVMValueRef):TLLVMBool;cdecl;external libllvm;
procedure LLVMSetNUW(ArithInst:TLLVMValueRef; HasNUW:TLLVMBool);cdecl;external libllvm;
function LLVMGetNSW(ArithInst:TLLVMValueRef):TLLVMBool;cdecl;external libllvm;
procedure LLVMSetNSW(ArithInst:TLLVMValueRef; HasNSW:TLLVMBool);cdecl;external libllvm;
function LLVMGetExact(DivOrShrInst:TLLVMValueRef):TLLVMBool;cdecl;external libllvm;
procedure LLVMSetExact(DivOrShrInst:TLLVMValueRef; IsExact:TLLVMBool);cdecl;external libllvm;
{*
 * Gets if the instruction has the non-negative flag set.
 * Only valid for zext instructions.
  }
function LLVMGetNNeg(NonNegInst:TLLVMValueRef):TLLVMBool;cdecl;external libllvm;
{*
 * Sets the non-negative flag for the instruction.
 * Only valid for zext instructions.
  }
procedure LLVMSetNNeg(NonNegInst:TLLVMValueRef; IsNonNeg:TLLVMBool);cdecl;external libllvm;
{*
 * Get the flags for which fast-math-style optimizations are allowed for this
 * value.
 *
 * Only valid on floating point instructions.
 * @see LLVMCanValueUseFastMathFlags
  }
function LLVMGetFastMathFlags(FPMathInst:TLLVMValueRef):TLLVMFastMathFlags;cdecl;external libllvm;
{*
 * Sets the flags for which fast-math-style optimizations are allowed for this
 * value.
 *
 * Only valid on floating point instructions.
 * @see LLVMCanValueUseFastMathFlags
  }
procedure LLVMSetFastMathFlags(FPMathInst:TLLVMValueRef; FMF:TLLVMFastMathFlags);cdecl;external libllvm;
{*
 * Check if a given value can potentially have fast math flags.
 *
 * Will return true for floating point arithmetic instructions, and for select,
 * phi, and call instructions whose type is a floating point type, or a vector
 * or array thereof. See https://llvm.org/docs/LangRef.html#fast-math-flags
  }
function LLVMCanValueUseFastMathFlags(Inst:TLLVMValueRef):TLLVMBool;cdecl;external libllvm;
{*
 * Gets whether the instruction has the disjoint flag set.
 * Only valid for or instructions.
  }
function LLVMGetIsDisjoint(Inst:TLLVMValueRef):TLLVMBool;cdecl;external libllvm;
{*
 * Sets the disjoint flag for the instruction.
 * Only valid for or instructions.
  }
procedure LLVMSetIsDisjoint(Inst:TLLVMValueRef; IsDisjoint:TLLVMBool);cdecl;external libllvm;
{ Memory  }
function LLVMBuildMalloc(para1:TLLVMBuilderRef; Ty:TLLVMTypeRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildArrayMalloc(para1:TLLVMBuilderRef; Ty:TLLVMTypeRef; Val:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
{*
 * Creates and inserts a memset to the specified pointer and the
 * specified value.
 *
 * @see llvm::IRRBuilder::CreateMemSet()
  }
function LLVMBuildMemSet(B:TLLVMBuilderRef; Ptr:TLLVMValueRef; Val:TLLVMValueRef; Len:TLLVMValueRef; Align:dword):TLLVMValueRef;cdecl;external libllvm;
{*
 * Creates and inserts a memcpy between the specified pointers.
 *
 * @see llvm::IRRBuilder::CreateMemCpy()
  }
function LLVMBuildMemCpy(B:TLLVMBuilderRef; Dst:TLLVMValueRef; DstAlign:dword; Src:TLLVMValueRef; SrcAlign:dword; 
           Size:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
{*
 * Creates and inserts a memmove between the specified pointers.
 *
 * @see llvm::IRRBuilder::CreateMemMove()
  }
function LLVMBuildMemMove(B:TLLVMBuilderRef; Dst:TLLVMValueRef; DstAlign:dword; Src:TLLVMValueRef; SrcAlign:dword; 
           Size:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildAlloca(para1:TLLVMBuilderRef; Ty:TLLVMTypeRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildArrayAlloca(para1:TLLVMBuilderRef; Ty:TLLVMTypeRef; Val:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildFree(para1:TLLVMBuilderRef; PointerVal:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildLoad2(para1:TLLVMBuilderRef; Ty:TLLVMTypeRef; PointerVal:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildStore(para1:TLLVMBuilderRef; Val:TLLVMValueRef; Ptr:TLLVMValueRef):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildGEP2(B:TLLVMBuilderRef; Ty:TLLVMTypeRef; Pointer:TLLVMValueRef; Indices:PLLVMValueRef; NumIndices:dword; 
           Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildInBoundsGEP2(B:TLLVMBuilderRef; Ty:TLLVMTypeRef; Pointer:TLLVMValueRef; Indices:PLLVMValueRef; NumIndices:dword; 
           Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
{*
 * Creates a GetElementPtr instruction. Similar to LLVMBuildGEP2, but allows
 * specifying the no-wrap flags.
 *
 * @see llvm::IRBuilder::CreateGEP()
  }
function LLVMBuildGEPWithNoWrapFlags(B:TLLVMBuilderRef; Ty:TLLVMTypeRef; Pointer:TLLVMValueRef; Indices:PLLVMValueRef; NumIndices:dword; 
           Name:Pchar; NoWrapFlags:TLLVMGEPNoWrapFlags):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildStructGEP2(B:TLLVMBuilderRef; Ty:TLLVMTypeRef; Pointer:TLLVMValueRef; Idx:dword; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildGlobalString(B:TLLVMBuilderRef; Str:Pchar; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
{*
 * Deprecated: Use LLVMBuildGlobalString instead, which has identical behavior.
  }
function LLVMBuildGlobalStringPtr(B:TLLVMBuilderRef; Str:Pchar; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMGetVolatile(MemoryAccessInst:TLLVMValueRef):TLLVMBool;cdecl;external libllvm;
procedure LLVMSetVolatile(MemoryAccessInst:TLLVMValueRef; IsVolatile:TLLVMBool);cdecl;external libllvm;
function LLVMGetWeak(CmpXchgInst:TLLVMValueRef):TLLVMBool;cdecl;external libllvm;
procedure LLVMSetWeak(CmpXchgInst:TLLVMValueRef; IsWeak:TLLVMBool);cdecl;external libllvm;
function LLVMGetOrdering(MemoryAccessInst:TLLVMValueRef):TLLVMAtomicOrdering;cdecl;external libllvm;
procedure LLVMSetOrdering(MemoryAccessInst:TLLVMValueRef; Ordering:TLLVMAtomicOrdering);cdecl;external libllvm;
function LLVMGetAtomicRMWBinOp(AtomicRMWInst:TLLVMValueRef):TLLVMAtomicRMWBinOp;cdecl;external libllvm;
procedure LLVMSetAtomicRMWBinOp(AtomicRMWInst:TLLVMValueRef; BinOp:TLLVMAtomicRMWBinOp);cdecl;external libllvm;
{ Casts  }
function LLVMBuildTrunc(para1:TLLVMBuilderRef; Val:TLLVMValueRef; DestTy:TLLVMTypeRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildZExt(para1:TLLVMBuilderRef; Val:TLLVMValueRef; DestTy:TLLVMTypeRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildSExt(para1:TLLVMBuilderRef; Val:TLLVMValueRef; DestTy:TLLVMTypeRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildFPToUI(para1:TLLVMBuilderRef; Val:TLLVMValueRef; DestTy:TLLVMTypeRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildFPToSI(para1:TLLVMBuilderRef; Val:TLLVMValueRef; DestTy:TLLVMTypeRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildUIToFP(para1:TLLVMBuilderRef; Val:TLLVMValueRef; DestTy:TLLVMTypeRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildSIToFP(para1:TLLVMBuilderRef; Val:TLLVMValueRef; DestTy:TLLVMTypeRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildFPTrunc(para1:TLLVMBuilderRef; Val:TLLVMValueRef; DestTy:TLLVMTypeRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildFPExt(para1:TLLVMBuilderRef; Val:TLLVMValueRef; DestTy:TLLVMTypeRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildPtrToInt(para1:TLLVMBuilderRef; Val:TLLVMValueRef; DestTy:TLLVMTypeRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildIntToPtr(para1:TLLVMBuilderRef; Val:TLLVMValueRef; DestTy:TLLVMTypeRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildBitCast(para1:TLLVMBuilderRef; Val:TLLVMValueRef; DestTy:TLLVMTypeRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildAddrSpaceCast(para1:TLLVMBuilderRef; Val:TLLVMValueRef; DestTy:TLLVMTypeRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildZExtOrBitCast(para1:TLLVMBuilderRef; Val:TLLVMValueRef; DestTy:TLLVMTypeRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildSExtOrBitCast(para1:TLLVMBuilderRef; Val:TLLVMValueRef; DestTy:TLLVMTypeRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildTruncOrBitCast(para1:TLLVMBuilderRef; Val:TLLVMValueRef; DestTy:TLLVMTypeRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildCast(B:TLLVMBuilderRef; Op:TLLVMOpcode; Val:TLLVMValueRef; DestTy:TLLVMTypeRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildPointerCast(para1:TLLVMBuilderRef; Val:TLLVMValueRef; DestTy:TLLVMTypeRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildIntCast2(para1:TLLVMBuilderRef; Val:TLLVMValueRef; DestTy:TLLVMTypeRef; IsSigned:TLLVMBool; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildFPCast(para1:TLLVMBuilderRef; Val:TLLVMValueRef; DestTy:TLLVMTypeRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
{* Deprecated: This cast is always signed. Use LLVMBuildIntCast2 instead.  }
{Signed cast! }
function LLVMBuildIntCast(para1:TLLVMBuilderRef; Val:TLLVMValueRef; DestTy:TLLVMTypeRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMGetCastOpcode(Src:TLLVMValueRef; SrcIsSigned:TLLVMBool; DestTy:TLLVMTypeRef; DestIsSigned:TLLVMBool):TLLVMOpcode;cdecl;external libllvm;
{ Comparisons  }
function LLVMBuildICmp(para1:TLLVMBuilderRef; Op:TLLVMIntPredicate; LHS:TLLVMValueRef; RHS:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildFCmp(para1:TLLVMBuilderRef; Op:TLLVMRealPredicate; LHS:TLLVMValueRef; RHS:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
{ Miscellaneous instructions  }
function LLVMBuildPhi(para1:TLLVMBuilderRef; Ty:TLLVMTypeRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildCall2(para1:TLLVMBuilderRef; para2:TLLVMTypeRef; Fn:TLLVMValueRef; Args:PLLVMValueRef; NumArgs:dword; 
           Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildCallWithOperandBundles(para1:TLLVMBuilderRef; para2:TLLVMTypeRef; Fn:TLLVMValueRef; Args:PLLVMValueRef; NumArgs:dword; 
           Bundles:PLLVMOperandBundleRef; NumBundles:dword; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildSelect(para1:TLLVMBuilderRef; If:TLLVMValueRef; Then:TLLVMValueRef; Else:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildVAArg(para1:TLLVMBuilderRef; List:TLLVMValueRef; Ty:TLLVMTypeRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildExtractElement(para1:TLLVMBuilderRef; VecVal:TLLVMValueRef; Index:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildInsertElement(para1:TLLVMBuilderRef; VecVal:TLLVMValueRef; EltVal:TLLVMValueRef; Index:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildShuffleVector(para1:TLLVMBuilderRef; V1:TLLVMValueRef; V2:TLLVMValueRef; Mask:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildExtractValue(para1:TLLVMBuilderRef; AggVal:TLLVMValueRef; Index:dword; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildInsertValue(para1:TLLVMBuilderRef; AggVal:TLLVMValueRef; EltVal:TLLVMValueRef; Index:dword; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildFreeze(para1:TLLVMBuilderRef; Val:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildIsNull(para1:TLLVMBuilderRef; Val:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildIsNotNull(para1:TLLVMBuilderRef; Val:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildPtrDiff2(para1:TLLVMBuilderRef; ElemTy:TLLVMTypeRef; LHS:TLLVMValueRef; RHS:TLLVMValueRef; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildFence(B:TLLVMBuilderRef; ordering:TLLVMAtomicOrdering; singleThread:TLLVMBool; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildFenceSyncScope(B:TLLVMBuilderRef; ordering:TLLVMAtomicOrdering; SSID:dword; Name:Pchar):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildAtomicRMW(B:TLLVMBuilderRef; op:TLLVMAtomicRMWBinOp; PTR:TLLVMValueRef; Val:TLLVMValueRef; ordering:TLLVMAtomicOrdering; 
           singleThread:TLLVMBool):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildAtomicRMWSyncScope(B:TLLVMBuilderRef; op:TLLVMAtomicRMWBinOp; PTR:TLLVMValueRef; Val:TLLVMValueRef; ordering:TLLVMAtomicOrdering; 
           SSID:dword):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildAtomicCmpXchg(B:TLLVMBuilderRef; Ptr:TLLVMValueRef; Cmp:TLLVMValueRef; _New:TLLVMValueRef; SuccessOrdering:TLLVMAtomicOrdering; 
           FailureOrdering:TLLVMAtomicOrdering; SingleThread:TLLVMBool):TLLVMValueRef;cdecl;external libllvm;
function LLVMBuildAtomicCmpXchgSyncScope(B:TLLVMBuilderRef; Ptr:TLLVMValueRef; Cmp:TLLVMValueRef; _New:TLLVMValueRef; SuccessOrdering:TLLVMAtomicOrdering; 
           FailureOrdering:TLLVMAtomicOrdering; SSID:dword):TLLVMValueRef;cdecl;external libllvm;
{*
 * Get the number of elements in the mask of a ShuffleVector instruction.
  }
function LLVMGetNumMaskElements(ShuffleVectorInst:TLLVMValueRef):dword;cdecl;external libllvm;
{*
 * \returns a constant that specifies that the result of a \c ShuffleVectorInst
 * is undefined.
  }
function LLVMGetUndefMaskElem:longint;cdecl;external libllvm;
{*
 * Get the mask value at position Elt in the mask of a ShuffleVector
 * instruction.
 *
 * \Returns the result of \c LLVMGetUndefMaskElem() if the mask value is
 * poison at that position.
  }
function LLVMGetMaskValue(ShuffleVectorInst:TLLVMValueRef; Elt:dword):longint;cdecl;external libllvm;
function LLVMIsAtomicSingleThread(AtomicInst:TLLVMValueRef):TLLVMBool;cdecl;external libllvm;
procedure LLVMSetAtomicSingleThread(AtomicInst:TLLVMValueRef; SingleThread:TLLVMBool);cdecl;external libllvm;
{*
 * Returns whether an instruction is an atomic instruction, e.g., atomicrmw,
 * cmpxchg, fence, or loads and stores with atomic ordering.
  }
function LLVMIsAtomic(Inst:TLLVMValueRef):TLLVMBool;cdecl;external libllvm;
{*
 * Returns the synchronization scope ID of an atomic instruction.
  }
function LLVMGetAtomicSyncScopeID(AtomicInst:TLLVMValueRef):dword;cdecl;external libllvm;
{*
 * Sets the synchronization scope ID of an atomic instruction.
  }
procedure LLVMSetAtomicSyncScopeID(AtomicInst:TLLVMValueRef; SSID:dword);cdecl;external libllvm;
function LLVMGetCmpXchgSuccessOrdering(CmpXchgInst:TLLVMValueRef):TLLVMAtomicOrdering;cdecl;external libllvm;
procedure LLVMSetCmpXchgSuccessOrdering(CmpXchgInst:TLLVMValueRef; Ordering:TLLVMAtomicOrdering);cdecl;external libllvm;
function LLVMGetCmpXchgFailureOrdering(CmpXchgInst:TLLVMValueRef):TLLVMAtomicOrdering;cdecl;external libllvm;
procedure LLVMSetCmpXchgFailureOrdering(CmpXchgInst:TLLVMValueRef; Ordering:TLLVMAtomicOrdering);cdecl;external libllvm;
{*
 * @
  }
{*
 * @defgroup LLVMCCoreModuleProvider Module Providers
 *
 * @
  }
{*
 * Changes the type of M so it can be passed to FunctionPassManagers and the
 * JIT.  They take ModuleProviders for historical reasons.
  }
function LLVMCreateModuleProviderForExistingModule(M:TLLVMModuleRef):TLLVMModuleProviderRef;cdecl;external libllvm;
{*
 * Destroys the module M.
  }
procedure LLVMDisposeModuleProvider(M:TLLVMModuleProviderRef);cdecl;external libllvm;
{*
 * @
  }
{*
 * @defgroup LLVMCCoreMemoryBuffers Memory Buffers
 *
 * @
  }
function LLVMCreateMemoryBufferWithContentsOfFile(Path:Pchar; OutMemBuf:PLLVMMemoryBufferRef; OutMessage:PPchar):TLLVMBool;cdecl;external libllvm;
function LLVMCreateMemoryBufferWithSTDIN(OutMemBuf:PLLVMMemoryBufferRef; OutMessage:PPchar):TLLVMBool;cdecl;external libllvm;
function LLVMCreateMemoryBufferWithMemoryRange(InputData:Pchar; InputDataLength:Tsize_t; BufferName:Pchar; RequiresNullTerminator:TLLVMBool):TLLVMMemoryBufferRef;cdecl;external libllvm;
function LLVMCreateMemoryBufferWithMemoryRangeCopy(InputData:Pchar; InputDataLength:Tsize_t; BufferName:Pchar):TLLVMMemoryBufferRef;cdecl;external libllvm;
function LLVMGetBufferStart(MemBuf:TLLVMMemoryBufferRef):Pchar;cdecl;external libllvm;
function LLVMGetBufferSize(MemBuf:TLLVMMemoryBufferRef):Tsize_t;cdecl;external libllvm;
procedure LLVMDisposeMemoryBuffer(MemBuf:TLLVMMemoryBufferRef);cdecl;external libllvm;
{*
 * @
  }
{*
 * @defgroup LLVMCCorePassManagers Pass Managers
 * @ingroup LLVMCCore
 *
 * @
  }
{* Constructs a new whole-module pass pipeline. This type of pipeline is
    suitable for link-time optimization and whole-module transformations.
    @see llvm::PassManager::PassManager  }
function LLVMCreatePassManager:TLLVMPassManagerRef;cdecl;external libllvm;
{* Constructs a new function-by-function pass pipeline over the module
    provider. It does not take ownership of the module provider. This type of
    pipeline is suitable for code generation and JIT compilation tasks.
    @see llvm::FunctionPassManager::FunctionPassManager  }
function LLVMCreateFunctionPassManagerForModule(M:TLLVMModuleRef):TLLVMPassManagerRef;cdecl;external libllvm;
{* Deprecated: Use LLVMCreateFunctionPassManagerForModule instead.  }
function LLVMCreateFunctionPassManager(MP:TLLVMModuleProviderRef):TLLVMPassManagerRef;cdecl;external libllvm;
{* Initializes, executes on the provided module, and finalizes all of the
    passes scheduled in the pass manager. Returns 1 if any of the passes
    modified the module, 0 otherwise.
    @see llvm::PassManager::run(Module&)  }
function LLVMRunPassManager(PM:TLLVMPassManagerRef; M:TLLVMModuleRef):TLLVMBool;cdecl;external libllvm;
{* Initializes all of the function passes scheduled in the function pass
    manager. Returns 1 if any of the passes modified the module, 0 otherwise.
    @see llvm::FunctionPassManager::doInitialization  }
function LLVMInitializeFunctionPassManager(FPM:TLLVMPassManagerRef):TLLVMBool;cdecl;external libllvm;
{* Executes all of the function passes scheduled in the function pass manager
    on the provided function. Returns 1 if any of the passes modified the
    function, false otherwise.
    @see llvm::FunctionPassManager::run(Function&)  }
function LLVMRunFunctionPassManager(FPM:TLLVMPassManagerRef; F:TLLVMValueRef):TLLVMBool;cdecl;external libllvm;
{* Finalizes all of the function passes scheduled in the function pass
    manager. Returns 1 if any of the passes modified the module, 0 otherwise.
    @see llvm::FunctionPassManager::doFinalization  }
function LLVMFinalizeFunctionPassManager(FPM:TLLVMPassManagerRef):TLLVMBool;cdecl;external libllvm;
{* Frees the memory of a pass pipeline. For function pipelines, does not free
    the module provider.
    @see llvm::PassManagerBase::~PassManagerBase.  }
procedure LLVMDisposePassManager(PM:TLLVMPassManagerRef);cdecl;external libllvm;
{*
 * @
  }
{*
 * @defgroup LLVMCCoreThreading Threading
 *
 * Handle the structures needed to make LLVM safe for multithreading.
 *
 * @
  }
{* Deprecated: Multi-threading can only be enabled/disabled with the compile
    time define LLVM_ENABLE_THREADS.  This function always returns
    LLVMIsMultithreaded().  }
function LLVMStartMultithreaded:TLLVMBool;cdecl;external libllvm;
{* Deprecated: Multi-threading can only be enabled/disabled with the compile
    time define LLVM_ENABLE_THREADS.  }
procedure LLVMStopMultithreaded;cdecl;external libllvm;
{* Check whether LLVM is executing in thread-safe mode or not.
    @see llvm::llvm_is_multithreaded  }
function LLVMIsMultithreaded:TLLVMBool;cdecl;external libllvm;
{*
 * @
  }
{*
 * @
  }
{*
 * @
  }
{$endif}
{ LLVM_C_CORE_H  }

// === Konventiert am: 20-9-26 16:00:00 ===


implementation



end.
