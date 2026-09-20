unit DataTypes;

interface

uses
  fp_llvm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{===-- include/llvm-c/DataTypes.h - Define fixed size types ------*- C -*-===*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* This file contains definitions to figure out the size of _HOST_ data types.*|
|* This file is important because different host OS's define different macros,*|
|* which makes portability tough.  This file exports the following            *|
|* definitions:                                                               *|
|*                                                                            *|
|*   [u]int(32|64)_t : typedefs for signed and unsigned 32/64 bit system types*|
|*   [U]INT(8|16|32|64)_(MIN|MAX) : Constants for the min and max values.     *|
|*                                                                            *|
|* No library is required when using these functions.                         *|
|*                                                                            *|
|*===----------------------------------------------------------------------=== }
{ Please leave this file C-compatible.  }
{$ifndef LLVM_C_DATATYPES_H}
{$define LLVM_C_DATATYPES_H}
{$include <inttypes.h>}
{$include <stdint.h>}
{$ifndef _MSC_VER}
{ Note that <inttypes.h> includes <stdint.h>, if this is a C99 system.  }
{$include <sys/types.h>}
{$ifdef _AIX}
{ GCC is strict about defining large constants: they must have LL modifier. }
{$undef INT64_MAX}
{$undef INT64_MIN}
{$endif}
{$else}
{ _MSC_VER  }
{$include <stddef.h>}
{$include <stdlib.h>}
{$include <sys/types.h>}
{$if defined(_WIN64)}
type
  Pssize_t = ^Tssize_t;
  Tssize_t = int64;
{$else}
type
  Pssize_t = ^Tssize_t;
  Tssize_t = longint;
{$endif}
{ _WIN64  }
{$endif}
{ _MSC_VER  }
{ Set defaults for constants which we cannot find.  }
{$if !defined(INT64_MAX)}

const
  INT64_MAX = 9223372036854775807;  
{$endif}
{$if !defined(INT64_MIN)}

const
  INT64_MIN = (-(INT64_MAX))-1;  
{$endif}
{$if !defined(UINT64_MAX)}

const
  UINT64_MAX = $ffffffffffffffff;  
{$endif}
{$endif}
{ LLVM_C_DATATYPES_H  }

// === Konventiert am: 20-9-26 15:59:57 ===


implementation



end.
