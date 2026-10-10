
unit lsan_interface;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsan_interface.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsan_interface.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{===-- sanitizer/lsan_interface.h ------------------------------*- C++ -*-===// }
{ }
{ Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions. }
{ See https://llvm.org/LICENSE.txt for license information. }
{ SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception }
{ }
{===----------------------------------------------------------------------===// }
{ }
{ This file is a part of LeakSanitizer. }
{ }
{ Public interface header. }
{===----------------------------------------------------------------------===// }
{$ifndef SANITIZER_LSAN_INTERFACE_H}
{$define SANITIZER_LSAN_INTERFACE_H}
{$include <sanitizer/common_interface_defs.h>}
{ C++ extern C conditionnal removed }
{ Allocations made between calls to __lsan_disable() and __lsan_enable() will }
{ be treated as non-leaks. Disable/enable pairs may be nested. }

procedure __lsan_disable;cdecl;external;
procedure __lsan_enable;cdecl;external;
{ The heap object into which p points will be treated as a non-leak. }
(* Const before type ignored *)
procedure __lsan_ignore_object(p:pointer);cdecl;external;
{ Memory regions registered through this interface will be treated as sources }
{ of live pointers during leak checking. Useful if you store pointers in }
{ mapped memory. }
{ Points of note: }
{ - __lsan_unregister_root_region() must be called with the same pointer and }
{ size that have earlier been passed to __lsan_register_root_region() }
{ - LSan will skip any inaccessible memory when scanning a root region. E.g., }
{ if you map memory within a larger region that you have mprotect'ed, you can }
{ register the entire large region. }
{ - the implementation is not optimized for performance. This interface is }
{ intended to be used for a small number of relatively static regions. }
(* Const before type ignored *)
procedure __lsan_register_root_region(p:pointer; size:Tsize_t);cdecl;external;
(* Const before type ignored *)
procedure __lsan_unregister_root_region(p:pointer; size:Tsize_t);cdecl;external;
{ Check for leaks now. This function behaves identically to the default }
{ end-of-process leak check. In particular, it will terminate the process if }
{ leaks are found and the exitcode runtime flag is non-zero. }
{ Subsequent calls to this function will have no effect and end-of-process }
{ leak check will not run. Effectively, end-of-process leak check is moved to }
{ the time of first invocation of this function. }
{ By calling this function early during process shutdown, you can instruct }
{ LSan to ignore shutdown-only leaks which happen later on. }
procedure __lsan_do_leak_check;cdecl;external;
{ Check for leaks now. Returns zero if no leaks have been found or if leak }
{ detection is disabled, non-zero otherwise. }
{ This function may be called repeatedly, e.g. to periodically check a }
{ long-running process. It prints a leak report if appropriate, but does not }
{ terminate the process. It does not affect the behavior of }
{ __lsan_do_leak_check() or the end-of-process leak check, and is not }
{ affected by them. }
function __lsan_do_recoverable_leak_check:longint;cdecl;external;
{ The user may optionally provide this function to disallow leak checking }
{ for the program it is linked into (if the return value is non-zero). This }
{ function must be defined as returning a constant value; any behavior beyond }
{ that is unsupported. }
{ To avoid dead stripping, you may need to define this function with }
{ __attribute__((used)) }
function __lsan_is_turned_off:longint;cdecl;external;
{ This function may be optionally provided by user and should return }
{ a string containing LSan runtime options. See lsan_flags.inc for details. }
(* Const before type ignored *)
function __lsan_default_options:Pchar;cdecl;external;
{ This function may be optionally provided by the user and should return }
{ a string containing LSan suppressions. }
(* Const before type ignored *)
function __lsan_default_suppressions:Pchar;cdecl;external;
{$endif}
{ SANITIZER_LSAN_INTERFACE_H }

implementation


end.
