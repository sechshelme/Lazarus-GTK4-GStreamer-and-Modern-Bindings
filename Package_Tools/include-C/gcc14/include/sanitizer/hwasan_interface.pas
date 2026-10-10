unit hwasan_interface;

interface

uses
  fp_asan;

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

procedure __hwasan_init_static;cdecl;external libasan;
{ This function may be optionally provided by user and should return }
{ a string containing HWASan runtime options. See asan_flags.h for details. }
function __hwasan_default_options:Pchar;cdecl;external libasan;
procedure __hwasan_enable_allocator_tagging;cdecl;external libasan;
procedure __hwasan_disable_allocator_tagging;cdecl;external libasan;
{ Mark region of memory with the given tag. Both address and size need to be }
{ 16-byte aligned. }
procedure __hwasan_tag_memory(p:pointer; tag:byte; size:Tsize_t);cdecl;external libasan;
{/ Set pointer tag. Previous tag is lost. }
function __hwasan_tag_pointer(p:pointer; tag:byte):pointer;cdecl;external libasan;
{ Set memory tag from the current SP address to the given address to zero. }
{ This is meant to annotate longjmp and other non-local jumps. }
{ This function needs to know the (almost) exact destination frame address; }
{ clearing shadow for the entire thread stack like __asan_handle_no_return }
{ does would cause false reports. }
procedure __hwasan_handle_longjmp(sp_dst:pointer);cdecl;external libasan;
{ Set memory tag for the part of the current thread stack below sp_dst to }
{ zero. Call this in vfork() before returning in the parent process. }
procedure __hwasan_handle_vfork(sp_dst:pointer);cdecl;external libasan;
{ Libc hook for thread creation. Should be called in the child thread before }
{ any instrumented code. }
procedure __hwasan_thread_enter;cdecl;external libasan;
{ Libc hook for thread destruction. No instrumented code should run after }
{ this call. }
procedure __hwasan_thread_exit;cdecl;external libasan;
{ Print shadow and origin for the memory range to stderr in a human-readable }
{ format. }
procedure __hwasan_print_shadow(x:pointer; size:Tsize_t);cdecl;external libasan;
{ Print one-line report about the memory usage of the current process. }
procedure __hwasan_print_memory_usage;cdecl;external libasan;
{ Returns the offset of the first byte in the memory range that can not be
 * accessed through the pointer in x, or -1 if the whole range is good.  }
function __hwasan_test_shadow(x:pointer; size:Tsize_t):Tintptr_t;cdecl;external libasan;
{ Sets the callback function to be called during HWASan error reporting.  }
procedure __hwasan_set_error_report_callback(callback:procedure (para1:Pchar));cdecl;external libasan;
function __sanitizer_posix_memalign(memptr:Ppointer; alignment:Tsize_t; size:Tsize_t):longint;cdecl;external libasan;
function __sanitizer_memalign(alignment:Tsize_t; size:Tsize_t):pointer;cdecl;external libasan;
function __sanitizer_aligned_alloc(alignment:Tsize_t; size:Tsize_t):pointer;cdecl;external libasan;
function __sanitizer___libc_memalign(alignment:Tsize_t; size:Tsize_t):pointer;cdecl;external libasan;
function __sanitizer_valloc(size:Tsize_t):pointer;cdecl;external libasan;
function __sanitizer_pvalloc(size:Tsize_t):pointer;cdecl;external libasan;
procedure __sanitizer_free(ptr:pointer);cdecl;external libasan;
procedure __sanitizer_cfree(ptr:pointer);cdecl;external libasan;
function __sanitizer_malloc_usable_size(ptr:pointer):Tsize_t;cdecl;external libasan;
function __sanitizer_mallinfo:Tmallinfo;cdecl;external libasan;
function __sanitizer_mallopt(cmd:longint; value:longint):longint;cdecl;external libasan;
procedure __sanitizer_malloc_stats;cdecl;external libasan;
function __sanitizer_calloc(nmemb:Tsize_t; size:Tsize_t):pointer;cdecl;external libasan;
function __sanitizer_realloc(ptr:pointer; size:Tsize_t):pointer;cdecl;external libasan;
function __sanitizer_reallocarray(ptr:pointer; nmemb:Tsize_t; size:Tsize_t):pointer;cdecl;external libasan;
function __sanitizer_malloc(size:Tsize_t):pointer;cdecl;external libasan;
{$endif}
{ SANITIZER_HWASAN_INTERFACE_H }

// === Konventiert am: 10-10-26 14:05:29 ===


implementation



end.
