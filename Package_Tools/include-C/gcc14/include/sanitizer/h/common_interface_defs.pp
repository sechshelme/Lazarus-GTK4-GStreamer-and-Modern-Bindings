
unit common_interface_defs;
interface

{
  Automatically converted by H2Pas 1.0.0 from common_interface_defs.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    common_interface_defs.h
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
P_sanitizer_sandbox_arguments  = ^_sanitizer_sandbox_arguments;
Pchar  = ^char;
Psanitizer_sandbox_arguments  = ^sanitizer_sandbox_arguments;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{===-- sanitizer/common_interface_defs.h -----------------------*- C++ -*-===// }
{ }
{ Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions. }
{ See https://llvm.org/LICENSE.txt for license information. }
{ SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception }
{ }
{===----------------------------------------------------------------------===// }
{ }
{ Common part of the public sanitizer interface. }
{===----------------------------------------------------------------------===// }
{$ifndef SANITIZER_COMMON_INTERFACE_DEFS_H}
{$define SANITIZER_COMMON_INTERFACE_DEFS_H}
{$include <stddef.h>}
{$include <stdint.h>}
{ C++ extern C conditionnal removed }
{ Arguments for __sanitizer_sandbox_on_notify() below. }
{ Enable sandbox support in sanitizer coverage. }
{ File descriptor to write coverage data to. If -1 is passed, a file will }
{ be pre-opened by __sanitizer_sandbox_on_notify(). This field has no }
{ effect if coverage_sandboxed == 0. }
{ If non-zero, split the coverage data into well-formed blocks. This is }
{ useful when coverage_fd is a socket descriptor. Each block will contain }
{ a header, allowing data from multiple processes to be sent over the same }
{ socket. }
type
  P_sanitizer_sandbox_arguments = ^T_sanitizer_sandbox_arguments;
  T_sanitizer_sandbox_arguments = record
      coverage_sandboxed : longint;
      coverage_fd : Tintptr_t;
      coverage_max_block_size : dword;
    end;
{ Tell the tools to write their reports to "path.<pid>" instead of stderr. }
(* Const before type ignored *)

procedure __sanitizer_set_report_path(path:Pchar);cdecl;external;
{ Tell the tools to write their reports to the provided file descriptor }
{ (casted to void *). }
procedure __sanitizer_set_report_fd(fd:pointer);cdecl;external;
{ Get the current full report file path, if a path was specified by }
{ an earlier call to __sanitizer_set_report_path. Returns null otherwise. }
(* Const before type ignored *)
function __sanitizer_get_report_path:Pchar;cdecl;external;
{ Notify the tools that the sandbox is going to be turned on. The reserved }
{ parameter will be used in the future to hold a structure with functions }
{ that the tools may call to bypass the sandbox. }
procedure __sanitizer_sandbox_on_notify(args:Psanitizer_sandbox_arguments);cdecl;external;
{ This function is called by the tool when it has just finished reporting }
{ an error. 'error_summary' is a one-line string that summarizes }
{ the error message. This function can be overridden by the client. }
(* Const before type ignored *)
procedure __sanitizer_report_error_summary(error_summary:Pchar);cdecl;external;
{ Some of the sanitizers (for example ASan/TSan) could miss bugs that happen }
{ in unaligned loads/stores. To find such bugs reliably, you need to replace }
{ plain unaligned loads/stores with these calls. }
{/ Loads a 16-bit unaligned value. }
{ }
{/ \param p Pointer to unaligned memory. }
{/ }
{/ \returns Loaded value. }
(* Const before type ignored *)
function __sanitizer_unaligned_load16(p:pointer):Tuint16_t;cdecl;external;
{/ Loads a 32-bit unaligned value. }
{/ }
{/ \param p Pointer to unaligned memory. }
{/ }
{/ \returns Loaded value. }
(* Const before type ignored *)
function __sanitizer_unaligned_load32(p:pointer):Tuint32_t;cdecl;external;
{/ Loads a 64-bit unaligned value. }
{/ }
{/ \param p Pointer to unaligned memory. }
{/ }
{/ \returns Loaded value. }
(* Const before type ignored *)
function __sanitizer_unaligned_load64(p:pointer):Tuint64_t;cdecl;external;
{/ Stores a 16-bit unaligned value. }
{/ }
{/ \param p Pointer to unaligned memory. }
{/ \param x 16-bit value to store. }
procedure __sanitizer_unaligned_store16(p:pointer; x:Tuint16_t);cdecl;external;
{/ Stores a 32-bit unaligned value. }
{/ }
{/ \param p Pointer to unaligned memory. }
{/ \param x 32-bit value to store. }
procedure __sanitizer_unaligned_store32(p:pointer; x:Tuint32_t);cdecl;external;
{/ Stores a 64-bit unaligned value. }
{/ }
{/ \param p Pointer to unaligned memory. }
{/ \param x 64-bit value to store. }
procedure __sanitizer_unaligned_store64(p:pointer; x:Tuint64_t);cdecl;external;
{ Returns 1 on the first call, then returns 0 thereafter.  Called by the tool }
{ to ensure only one report is printed when multiple errors occur }
{ simultaneously. }
function __sanitizer_acquire_crash_state:longint;cdecl;external;
{/ Annotates the current state of a contiguous container, such as }
{/ <c>std::vector</c>, <c>std::string</c>, or similar. }
{/ }
{/ A contiguous container is a container that keeps all of its elements }
{/ in a contiguous region of memory. The container owns the region of memory }
{/ <c>[beg, end)</c>; the memory <c>[beg, mid)</c> is used to store the }
{/ current elements, and the memory <c>[mid, end)</c> is reserved for future }
{/ elements (<c>beg <= mid <= end</c>). For example, in }
{/ <c>std::vector<> v</c>: }
{/ }
{/ \code }
{/   beg = &v[0]; }
{/   end = beg + v.capacity() * sizeof(v[0]); }
{/   mid = beg + v.size()     * sizeof(v[0]); }
{/ \endcode }
{/ }
{/ This annotation tells the Sanitizer tool about the current state of the }
{/ container so that the tool can report errors when memory from }
{/ <c>[mid, end)</c> is accessed. Insert this annotation into methods like }
{/ <c>push_back()</c> or <c>pop_back()</c>. Supply the old and new values of }
{/ <c>mid</c>(<c><i>old_mid</i></c> and <c><i>new_mid</i></c>). In the initial }
{/ state <c>mid == end</c>, so that should be the final state when the }
{/ container is destroyed or when the container reallocates the storage. }
{/ }
{/ For ASan, <c><i>beg</i></c> no longer needs to be 8-aligned, }
{/ first and last granule may be shared with other objects }
{/ and therefore the function can be used for any allocator. }
{/ }
{/ The following example shows how to use the function: }
{/ }
{/ \code }
{/   int32_t x[3]; // 12 bytes }
{/   char *beg = (char*)&x[0]; }
{/   char *end = beg + 12; }
{/   __sanitizer_annotate_contiguous_container(beg, end, beg, end); }
{/ \endcode }
{/ }
{/ \note  Use this function with caution and do not use for anything other }
{/ than vector-like classes. }
{/ \note  Unaligned <c><i>beg</i></c> or <c><i>end</i></c> may miss bugs in }
{/ these granules. }
{/ }
{/ \param beg Beginning of memory region. }
{/ \param end End of memory region. }
{/ \param old_mid Old middle of memory region. }
{/ \param new_mid New middle of memory region. }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure __sanitizer_annotate_contiguous_container(beg:pointer; end:pointer; old_mid:pointer; new_mid:pointer);cdecl;external;
{/ Similar to <c>__sanitizer_annotate_contiguous_container</c>. }
{/ }
{/ Annotates the current state of a contiguous container memory, }
{/ such as <c>std::deque</c>'s single chunk, when the boundries are moved. }
{/ }
{/ A contiguous chunk is a chunk that keeps all of its elements }
{/ in a contiguous region of memory. The container owns the region of memory }
{/ <c>[storage_beg, storage_end)</c>; the memory <c>[container_beg, }
{/ container_end)</c> is used to store the current elements, and the memory }
{/ <c>[storage_beg, container_beg), [container_end, storage_end)</c> is }
{/ reserved for future elements (<c>storage_beg <= container_beg <= }
{/ container_end <= storage_end</c>). For example, in <c> std::deque </c>: }
{/ - chunk with a frist deques element will have container_beg equal to address }
{/  of the first element. }
{/ - in every next chunk with elements, true is  <c> container_beg == }
{/ storage_beg </c>. }
{/ }
{/ Argument requirements: }
{/ During unpoisoning memory of empty container (before first element is }
{/ added): }
{/ - old_container_beg_p == old_container_end_p }
{/ During poisoning after last element was removed: }
{/ - new_container_beg_p == new_container_end_p }
{/ \param storage_beg Beginning of memory region. }
{/ \param storage_end End of memory region. }
{/ \param old_container_beg Old beginning of used region. }
{/ \param old_container_end End of used region. }
{/ \param new_container_beg New beginning of used region. }
{/ \param new_container_end New end of used region. }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure __sanitizer_annotate_double_ended_contiguous_container(storage_beg:pointer; storage_end:pointer; old_container_beg:pointer; old_container_end:pointer; new_container_beg:pointer; 
            new_container_end:pointer);cdecl;external;
{/ Returns true if the contiguous container <c>[beg, end)</c> is properly }
{/ poisoned. }
{/ }
{/ Proper poisoning could occur, for example, with }
{/ <c>__sanitizer_annotate_contiguous_container</c>), that is, if }
{/ <c>[beg, mid)</c> is addressable and <c>[mid, end)</c> is unaddressable. }
{/ Full verification requires O (<c>end - beg</c>) time; this function tries }
{/ to avoid such complexity by touching only parts of the container around }
{/ <c><i>beg</i></c>, <c><i>mid</i></c>, and <c><i>end</i></c>. }
{/ }
{/ \param beg Beginning of memory region. }
{/ \param mid Middle of memory region. }
{/ \param end Old end of memory region. }
{/ }
{/ \returns True if the contiguous container <c>[beg, end)</c> is properly }
{/  poisoned. }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function __sanitizer_verify_contiguous_container(beg:pointer; mid:pointer; end:pointer):longint;cdecl;external;
{/ Returns true if the double ended contiguous }
{/ container <c>[storage_beg, storage_end)</c> is properly poisoned. }
{/ }
{/ Proper poisoning could occur, for example, with }
{/ <c>__sanitizer_annotate_double_ended_contiguous_container</c>), that is, if }
{/ <c>[storage_beg, container_beg)</c> is not addressable, <c>[container_beg, }
{/ container_end)</c> is addressable and <c>[container_end, end)</c> is }
{/ unaddressable. Full verification requires O (<c>storage_end - }
{/ storage_beg</c>) time; this function tries to avoid such complexity by }
{/ touching only parts of the container around <c><i>storage_beg</i></c>, }
{/ <c><i>container_beg</i></c>, <c><i>container_end</i></c>, and }
{/ <c><i>storage_end</i></c>. }
{/ }
{/ \param storage_beg Beginning of memory region. }
{/ \param container_beg Beginning of used region. }
{/ \param container_end End of used region. }
{/ \param storage_end End of memory region. }
{/ }
{/ \returns True if the double-ended contiguous container <c>[storage_beg, }
{/ container_beg, container_end, end)</c> is properly poisoned - only }
{/ [container_beg; container_end) is addressable. }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function __sanitizer_verify_double_ended_contiguous_container(storage_beg:pointer; container_beg:pointer; container_end:pointer; storage_end:pointer):longint;cdecl;external;
{/ Similar to <c>__sanitizer_verify_contiguous_container()</c> but also }
{/ returns the address of the first improperly poisoned byte. }
{/ }
{/ Returns NULL if the area is poisoned properly. }
{/ }
{/ \param beg Beginning of memory region. }
{/ \param mid Middle of memory region. }
{/ \param end Old end of memory region. }
{/ }
{/ \returns The bad address or NULL. }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function __sanitizer_contiguous_container_find_bad_address(beg:pointer; mid:pointer; end:pointer):pointer;cdecl;external;
{/ returns the address of the first improperly poisoned byte. }
{/ }
{/ Returns NULL if the area is poisoned properly. }
{/ }
{/ \param storage_beg Beginning of memory region. }
{/ \param container_beg Beginning of used region. }
{/ \param container_end End of used region. }
{/ \param storage_end End of memory region. }
{/ }
{/ \returns The bad address or NULL. }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function __sanitizer_double_ended_contiguous_container_find_bad_address(storage_beg:pointer; container_beg:pointer; container_end:pointer; storage_end:pointer):pointer;cdecl;external;
{/ Prints the stack trace leading to this call (useful for calling from the }
{/ debugger). }
procedure __sanitizer_print_stack_trace;cdecl;external;
{ Symbolizes the supplied 'pc' using the format string 'fmt'. }
{ Outputs at most 'out_buf_size' bytes into 'out_buf'. }
{ If 'out_buf' is not empty then output is zero or more non empty C strings }
{ followed by single empty C string. Multiple strings can be returned if PC }
{ corresponds to inlined function. Inlined frames are printed in the order }
{ from "most-inlined" to the "least-inlined", so the last frame should be the }
{ not inlined function. }
{ Inlined frames can be removed with 'symbolize_inline_frames=0'. }
{ The format syntax is described in }
{ lib/sanitizer_common/sanitizer_stacktrace_printer.h. }
(* Const before type ignored *)
procedure __sanitizer_symbolize_pc(pc:pointer; fmt:Pchar; out_buf:Pchar; out_buf_size:Tsize_t);cdecl;external;
{ Same as __sanitizer_symbolize_pc, but for data section (i.e. globals). }
(* Const before type ignored *)
procedure __sanitizer_symbolize_global(data_ptr:pointer; fmt:Pchar; out_buf:Pchar; out_buf_size:Tsize_t);cdecl;external;
{ Determine the return address. }
{$if !defined(_MSC_VER) || defined(__clang__)}
{ was #define dname(params) para_def_expr }
{ return type might be wrong }   

function __sanitizer_return_address : longint;

{$else}

function _ReturnAddress:pointer;cdecl;external;
(** unsupported pragma#pragma intrinsic(_ReturnAddress)*)
{ was #define dname(params) para_def_expr }
{ return type might be wrong }   

function __sanitizer_return_address : longint;

{$endif}
{/ Sets the callback to be called immediately before death on error. }
{/ }
{/ Passing 0 will unset the callback. }
{/ }
{/ \param callback User-provided callback. }

procedure __sanitizer_set_death_callback(callback:procedure );cdecl;external;
{ Interceptor hooks. }
{ Whenever a libc function interceptor is called, it checks if the }
{ corresponding weak hook is defined, and calls it if it is indeed defined. }
{ The primary use-case is data-flow-guided fuzzing, where the fuzzer needs }
{ to know what is being passed to libc functions (for example memcmp). }
{ FIXME: implement more hooks. }
{/ Interceptor hook for <c>memcmp()</c>. }
{/ }
{/ \param called_pc PC (program counter) address of the original call. }
{/ \param s1 Pointer to block of memory. }
{/ \param s2 Pointer to block of memory. }
{/ \param n Number of bytes to compare. }
{/ \param result Value returned by the intercepted function. }
(* Const before type ignored *)
(* Const before type ignored *)
procedure __sanitizer_weak_hook_memcmp(called_pc:pointer; s1:pointer; s2:pointer; n:Tsize_t; result:longint);cdecl;external;
{/ Interceptor hook for <c>strncmp()</c>. }
{/ }
{/ \param called_pc PC (program counter) address of the original call. }
{/ \param s1 Pointer to block of memory. }
{/ \param s2 Pointer to block of memory. }
{/ \param n Number of bytes to compare. }
{/ \param result Value returned by the intercepted function. }
(* Const before type ignored *)
(* Const before type ignored *)
procedure __sanitizer_weak_hook_strncmp(called_pc:pointer; s1:Pchar; s2:Pchar; n:Tsize_t; result:longint);cdecl;external;
{/ Interceptor hook for <c>strncasecmp()</c>. }
{/ }
{/ \param called_pc PC (program counter) address of the original call. }
{/ \param s1 Pointer to block of memory. }
{/ \param s2 Pointer to block of memory. }
{/ \param n Number of bytes to compare. }
{/ \param result Value returned by the intercepted function. }
(* Const before type ignored *)
(* Const before type ignored *)
procedure __sanitizer_weak_hook_strncasecmp(called_pc:pointer; s1:Pchar; s2:Pchar; n:Tsize_t; result:longint);cdecl;external;
{/ Interceptor hook for <c>strcmp()</c>. }
{/ }
{/ \param called_pc PC (program counter) address of the original call. }
{/ \param s1 Pointer to block of memory. }
{/ \param s2 Pointer to block of memory. }
{/ \param result Value returned by the intercepted function. }
(* Const before type ignored *)
(* Const before type ignored *)
procedure __sanitizer_weak_hook_strcmp(called_pc:pointer; s1:Pchar; s2:Pchar; result:longint);cdecl;external;
{/ Interceptor hook for <c>strcasecmp()</c>. }
{/ }
{/ \param called_pc PC (program counter) address of the original call. }
{/ \param s1 Pointer to block of memory. }
{/ \param s2 Pointer to block of memory. }
{/ \param result Value returned by the intercepted function. }
(* Const before type ignored *)
(* Const before type ignored *)
procedure __sanitizer_weak_hook_strcasecmp(called_pc:pointer; s1:Pchar; s2:Pchar; result:longint);cdecl;external;
{/ Interceptor hook for <c>strstr()</c>. }
{/ }
{/ \param called_pc PC (program counter) address of the original call. }
{/ \param s1 Pointer to block of memory. }
{/ \param s2 Pointer to block of memory. }
{/ \param result Value returned by the intercepted function. }
(* Const before type ignored *)
(* Const before type ignored *)
procedure __sanitizer_weak_hook_strstr(called_pc:pointer; s1:Pchar; s2:Pchar; result:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure __sanitizer_weak_hook_strcasestr(called_pc:pointer; s1:Pchar; s2:Pchar; result:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure __sanitizer_weak_hook_memmem(called_pc:pointer; s1:pointer; len1:Tsize_t; s2:pointer; len2:Tsize_t; 
            result:pointer);cdecl;external;
{ Prints stack traces for all live heap allocations ordered by total }
{ allocation size until top_percent of total live heap is shown. top_percent }
{ should be between 1 and 100. At most max_number_of_contexts contexts }
{ (stack traces) are printed. }
{ Experimental feature currently available only with ASan on Linux/x86_64. }
procedure __sanitizer_print_memory_profile(top_percent:Tsize_t; max_number_of_contexts:Tsize_t);cdecl;external;
{/ Notify ASan that a fiber switch has started (required only if implementing }
{/ your own fiber library). }
{/ }
{/ Before switching to a different stack, you must call }
{/ <c>__sanitizer_start_switch_fiber()</c> with a pointer to the bottom of the }
{/ destination stack and with its size. When code starts running on the new }
{/ stack, it must call <c>__sanitizer_finish_switch_fiber()</c> to finalize }
{/ the switch. The <c>__sanitizer_start_switch_fiber()</c> function takes a }
{/ <c>void**</c> pointer argument to store the current fake stack if there is }
{/ one (it is necessary when the runtime option }
{/ <c>detect_stack_use_after_return</c> is enabled). }
{/ }
{/ When restoring a stack, this <c>void**</c> pointer must be given to the }
{/ <c>__sanitizer_finish_switch_fiber()</c> function. In most cases, this }
{/ pointer can be stored on the stack immediately before switching. When }
{/ leaving a fiber definitely, NULL must be passed as the first argument to }
{/ the <c>__sanitizer_start_switch_fiber()</c> function so that the fake stack }
{/ is destroyed. If your program does not need stack use-after-return }
{/ detection, you can always pass NULL to these two functions. }
{/ }
{/ \note The fake stack mechanism is disabled during fiber switch, so if a }
{/ signal callback runs during the switch, it will not benefit from stack }
{/ use-after-return detection. }
{/ }
{/ \param[out] fake_stack_save Fake stack save location. }
{/ \param bottom Bottom address of stack. }
{/ \param size Size of stack in bytes. }
(* Const before type ignored *)
procedure __sanitizer_start_switch_fiber(fake_stack_save:Ppointer; bottom:pointer; size:Tsize_t);cdecl;external;
{/ Notify ASan that a fiber switch has completed (required only if }
{/ implementing your own fiber library). }
{/ }
{/ When code starts running on the new stack, it must call }
{/ <c>__sanitizer_finish_switch_fiber()</c> to finalize }
{/ the switch. For usage details, see the description of }
{/ <c>__sanitizer_start_switch_fiber()</c>. }
{/ }
{/ \param fake_stack_save Fake stack save location. }
{/ \param[out] bottom_old Bottom address of old stack. }
{/ \param[out] size_old Size of old stack in bytes. }
(* Const before type ignored *)
procedure __sanitizer_finish_switch_fiber(fake_stack_save:pointer; bottom_old:Ppointer; size_old:Psize_t);cdecl;external;
{ Get full module name and calculate pc offset within it. }
{ Returns 1 if pc belongs to some module, 0 if module was not found. }
function __sanitizer_get_module_and_offset_for_pc(pc:pointer; module_path:Pchar; module_path_len:Tsize_t; pc_offset:Ppointer):longint;cdecl;external;
{$endif}
{ SANITIZER_COMMON_INTERFACE_DEFS_H }

implementation

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function __sanitizer_return_address : longint;
begin
  __sanitizer_return_address:=__builtin_extract_return_addr(__builtin_return_address(0));
end;

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function __sanitizer_return_address : longint;
begin
  __sanitizer_return_address:=_ReturnAddress;
end;


end.
