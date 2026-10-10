
unit hwasan_interface;
interface

{
  Automatically converted by H2Pas 1.0.0 from hwasan_interface.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hwasan_interface.h
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


{===-- sanitizer/hwasan_interface.h ----------------------------*- C++ -*-===// }
{ }
{ Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions. }
{ See https://llvm.org/LICENSE.txt for license information. }
{ SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception }
{ }
{===----------------------------------------------------------------------===// }
{ }
{ This file is a part of HWAddressSanitizer. }
{ }
{ Public interface header. }
{===----------------------------------------------------------------------===// }
{$ifndef SANITIZER_HWASAN_INTERFACE_H}
{$define SANITIZER_HWASAN_INTERFACE_H}
{$include <sanitizer/common_interface_defs.h>}
{ C++ extern C conditionnal removed }
{ Libc hook for program startup in statically linked executables. }
{ Initializes enough of the runtime to run instrumented code. This function }
{ should only be called in statically linked executables because it modifies }
{ the GOT, which won't work in regular binaries because RELRO will already }
{ have been applied by the time the function is called. This also means that }
{ the function should be called before libc applies RELRO. }
{ Does not call libc unless there is an error. }
{ Can be called multiple times. }

procedure __hwasan_init_static;cdecl;external;
{ This function may be optionally provided by user and should return }
{ a string containing HWASan runtime options. See asan_flags.h for details. }
(* Const before type ignored *)
function __hwasan_default_options:Pchar;cdecl;external;
procedure __hwasan_enable_allocator_tagging;cdecl;external;
procedure __hwasan_disable_allocator_tagging;cdecl;external;
{ Mark region of memory with the given tag. Both address and size need to be }
{ 16-byte aligned. }
(* Const before type ignored *)
procedure __hwasan_tag_memory(p:pointer; tag:byte; size:Tsize_t);cdecl;external;
{/ Set pointer tag. Previous tag is lost. }
(* Const before type ignored *)
function __hwasan_tag_pointer(p:pointer; tag:byte):pointer;cdecl;external;
{ Set memory tag from the current SP address to the given address to zero. }
{ This is meant to annotate longjmp and other non-local jumps. }
{ This function needs to know the (almost) exact destination frame address; }
{ clearing shadow for the entire thread stack like __asan_handle_no_return }
{ does would cause false reports. }
(* Const before type ignored *)
procedure __hwasan_handle_longjmp(sp_dst:pointer);cdecl;external;
{ Set memory tag for the part of the current thread stack below sp_dst to }
{ zero. Call this in vfork() before returning in the parent process. }
(* Const before type ignored *)
procedure __hwasan_handle_vfork(sp_dst:pointer);cdecl;external;
{ Libc hook for thread creation. Should be called in the child thread before }
{ any instrumented code. }
procedure __hwasan_thread_enter;cdecl;external;
{ Libc hook for thread destruction. No instrumented code should run after }
{ this call. }
procedure __hwasan_thread_exit;cdecl;external;
{ Print shadow and origin for the memory range to stderr in a human-readable }
{ format. }
(* Const before type ignored *)
procedure __hwasan_print_shadow(x:pointer; size:Tsize_t);cdecl;external;
{ Print one-line report about the memory usage of the current process. }
procedure __hwasan_print_memory_usage;cdecl;external;
{ Returns the offset of the first byte in the memory range that can not be
 * accessed through the pointer in x, or -1 if the whole range is good.  }
(* Const before type ignored *)
function __hwasan_test_shadow(x:pointer; size:Tsize_t):Tintptr_t;cdecl;external;
{ Sets the callback function to be called during HWASan error reporting.  }
(* Const before type ignored *)
procedure __hwasan_set_error_report_callback(callback:procedure (para1:Pchar));cdecl;external;
function __sanitizer_posix_memalign(memptr:Ppointer; alignment:Tsize_t; size:Tsize_t):longint;cdecl;external;
function __sanitizer_memalign(alignment:Tsize_t; size:Tsize_t):pointer;cdecl;external;
function __sanitizer_aligned_alloc(alignment:Tsize_t; size:Tsize_t):pointer;cdecl;external;
function __sanitizer___libc_memalign(alignment:Tsize_t; size:Tsize_t):pointer;cdecl;external;
function __sanitizer_valloc(size:Tsize_t):pointer;cdecl;external;
function __sanitizer_pvalloc(size:Tsize_t):pointer;cdecl;external;
procedure __sanitizer_free(ptr:pointer);cdecl;external;
procedure __sanitizer_cfree(ptr:pointer);cdecl;external;
(* Const before type ignored *)
function __sanitizer_malloc_usable_size(ptr:pointer):Tsize_t;cdecl;external;
function __sanitizer_mallinfo:Tmallinfo;cdecl;external;
function __sanitizer_mallopt(cmd:longint; value:longint):longint;cdecl;external;
procedure __sanitizer_malloc_stats;cdecl;external;
function __sanitizer_calloc(nmemb:Tsize_t; size:Tsize_t):pointer;cdecl;external;
function __sanitizer_realloc(ptr:pointer; size:Tsize_t):pointer;cdecl;external;
function __sanitizer_reallocarray(ptr:pointer; nmemb:Tsize_t; size:Tsize_t):pointer;cdecl;external;
function __sanitizer_malloc(size:Tsize_t):pointer;cdecl;external;
{$endif}
{ SANITIZER_HWASAN_INTERFACE_H }

implementation


end.
