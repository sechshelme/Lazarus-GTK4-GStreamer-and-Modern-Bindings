unit tsan_interface;

interface

uses
  fp_asan;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{===-- tsan_interface.h ----------------------------------------*- C++ -*-===// }
{ }
{ Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions. }
{ See https://llvm.org/LICENSE.txt for license information. }
{ SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception }
{ }
{===----------------------------------------------------------------------===// }
{ }
{ This file is a part of ThreadSanitizer (TSan), a race detector. }
{ }
{ Public interface header for TSan. }
{===----------------------------------------------------------------------===// }
{$ifndef SANITIZER_TSAN_INTERFACE_H}
{$define SANITIZER_TSAN_INTERFACE_H}
{$include <sanitizer/common_interface_defs.h>}
{ C++ extern C conditionnal removed }
{ __tsan_release establishes a happens-before relation with a preceding }
{ __tsan_acquire on the same address. }

procedure __tsan_acquire(addr:pointer);cdecl;external libasan;
procedure __tsan_release(addr:pointer);cdecl;external libasan;
{xxxxxxxx
static const unsigned __tsan_mutex_linker_init      = 1 << 0;
static const unsigned __tsan_mutex_write_reentrant  = 1 << 1;
static const unsigned __tsan_mutex_read_reentrant   = 1 << 2;
static const unsigned __tsan_mutex_not_static       = 1 << 8;
static const unsigned __tsan_mutex_read_lock = 1 << 3;
static const unsigned __tsan_mutex_try_lock = 1 << 4;
static const unsigned __tsan_mutex_try_lock_failed = 1 << 5;
static const unsigned __tsan_mutex_recursive_lock = 1 << 6;
static const unsigned __tsan_mutex_recursive_unlock = 1 << 7;
static const unsigned __tsan_mutex_try_read_lock =   __tsan_mutex_read_lock | __tsan_mutex_try_lock;
static const unsigned __tsan_mutex_try_read_lock_failed =   __tsan_mutex_try_read_lock | __tsan_mutex_try_lock_failed;
 }
procedure __tsan_mutex_create(addr:pointer; flags:dword);cdecl;external libasan;
{ Annotate destruction of a mutex. }
{ Supported flags: }
{   - __tsan_mutex_linker_init }
{   - __tsan_mutex_not_static }
procedure __tsan_mutex_destroy(addr:pointer; flags:dword);cdecl;external libasan;
{ Annotate start of lock operation. }
{ Supported flags: }
{   - __tsan_mutex_read_lock }
{   - __tsan_mutex_try_lock }
{   - all mutex creation flags }
procedure __tsan_mutex_pre_lock(addr:pointer; flags:dword);cdecl;external libasan;
{ Annotate end of lock operation. }
{ Supported flags: }
{   - __tsan_mutex_read_lock (must match __tsan_mutex_pre_lock) }
{   - __tsan_mutex_try_lock (must match __tsan_mutex_pre_lock) }
{   - __tsan_mutex_try_lock_failed }
{   - __tsan_mutex_recursive_lock }
{   - all mutex creation flags }
procedure __tsan_mutex_post_lock(addr:pointer; flags:dword; recursion:longint);cdecl;external libasan;
{ Annotate start of unlock operation. }
{ Supported flags: }
{   - __tsan_mutex_read_lock }
{   - __tsan_mutex_recursive_unlock }
function __tsan_mutex_pre_unlock(addr:pointer; flags:dword):longint;cdecl;external libasan;
{ Annotate end of unlock operation. }
{ Supported flags: }
{   - __tsan_mutex_read_lock (must match __tsan_mutex_pre_unlock) }
procedure __tsan_mutex_post_unlock(addr:pointer; flags:dword);cdecl;external libasan;
{ Annotate start/end of notify/signal/broadcast operation. }
{ Supported flags: none. }
procedure __tsan_mutex_pre_signal(addr:pointer; flags:dword);cdecl;external libasan;
procedure __tsan_mutex_post_signal(addr:pointer; flags:dword);cdecl;external libasan;
{ Annotate start/end of a region of code where lock/unlock/signal operation }
{ diverts to do something else unrelated to the mutex. This can be used to }
{ annotate, for example, calls into cooperative scheduler or contention }
{ profiling code. }
{ These annotations must be called only from within }
{ __tsan_mutex_pre/post_lock, __tsan_mutex_pre/post_unlock, }
{ __tsan_mutex_pre/post_signal regions. }
{ Supported flags: none. }
procedure __tsan_mutex_pre_divert(addr:pointer; flags:dword);cdecl;external libasan;
procedure __tsan_mutex_post_divert(addr:pointer; flags:dword);cdecl;external libasan;
{ Check that the current thread does not hold any mutexes, }
{ report a bug report otherwise. }
procedure __tsan_check_no_mutexes_held;cdecl;external libasan;
{ External race detection API. }
{ Can be used by non-instrumented libraries to detect when their objects are }
{ being used in an unsafe manner. }
{   - __tsan_external_read/__tsan_external_write annotates the logical reads }
{       and writes of the object at the specified address. 'caller_pc' should }
{       be the PC of the library user, which the library can obtain with e.g. }
{       `__builtin_return_address(0)`. }
{   - __tsan_external_register_tag registers a 'tag' with the specified name, }
{       which is later used in read/write annotations to denote the object type }
{   - __tsan_external_assign_tag can optionally mark a heap object with a tag }
function __tsan_external_register_tag(object_type:Pchar):pointer;cdecl;external libasan;
procedure __tsan_external_register_header(tag:pointer; header:Pchar);cdecl;external libasan;
procedure __tsan_external_assign_tag(addr:pointer; tag:pointer);cdecl;external libasan;
procedure __tsan_external_read(addr:pointer; caller_pc:pointer; tag:pointer);cdecl;external libasan;
procedure __tsan_external_write(addr:pointer; caller_pc:pointer; tag:pointer);cdecl;external libasan;
{ Fiber switching API. }
{   - TSAN context for fiber can be created by __tsan_create_fiber }
{     and freed by __tsan_destroy_fiber. }
{   - TSAN context of current fiber or thread can be obtained }
{     by calling __tsan_get_current_fiber. }
{   - __tsan_switch_to_fiber should be called immediately before switch }
{     to fiber, such as call of swapcontext. }
{   - Fiber name can be set by __tsan_set_fiber_name. }
function __tsan_get_current_fiber:pointer;cdecl;external libasan;
function __tsan_create_fiber(flags:dword):pointer;cdecl;external libasan;
procedure __tsan_destroy_fiber(fiber:pointer);cdecl;external libasan;
procedure __tsan_switch_to_fiber(fiber:pointer; flags:dword);cdecl;external libasan;
procedure __tsan_set_fiber_name(fiber:pointer; name:Pchar);cdecl;external libasan;
{xxxxxxxxxxx static const unsigned __tsan_switch_to_fiber_no_sync = 1 << 0; }
{ User-provided callback invoked on TSan initialization. }
procedure __tsan_on_initialize;cdecl;external libasan;
{ User-provided callback invoked on TSan shutdown. }
{ `failed` - Nonzero if TSan did detect issues, zero otherwise. }
{ Return `0` if TSan should exit as if no issues were detected.  Return nonzero }
{ if TSan should exit as if issues were detected. }
function __tsan_on_finalize(failed:longint):longint;cdecl;external libasan;
{ Release TSan internal memory in a best-effort manner. }
procedure __tsan_flush_memory;cdecl;external libasan;
{ User-provided default TSAN options. }
function __tsan_default_options:Pchar;cdecl;external libasan;
{ User-provided default TSAN suppressions. }
function __tsan_default_suppressions:Pchar;cdecl;external libasan;
{/ Returns a report's description. }
{/ }
{/ Returns a report's description (issue type), number of duplicate issues }
{/ found, counts of array data (stack traces, memory operations, locations, }
{/ mutexes, threads, unique thread IDs) and a stack trace of a <c>sleep()</c> }
{/ call (if one was involved in the issue). }
{/ }
{/ \param report Opaque pointer to the current report. }
{/ \param[out] description Report type description. }
{/ \param[out] count Count of duplicate issues. }
{/ \param[out] stack_count Count of stack traces. }
{/ \param[out] mop_count Count of memory operations. }
{/ \param[out] loc_count Count of locations. }
{/ \param[out] mutex_count Count of mutexes. }
{/ \param[out] thread_count Count of threads. }
{/ \param[out] unique_tid_count Count of unique thread IDs. }
{/ \param sleep_trace A buffer to store the stack trace of a <c>sleep()</c> }
{/ call. }
{/ \param trace_size Size in bytes of the trace buffer. }
{/ \returns Returns 1 if successful, 0 if not. }
function __tsan_get_report_data(report:pointer; description:PPchar; count:Plongint; stack_count:Plongint; mop_count:Plongint; 
           loc_count:Plongint; mutex_count:Plongint; thread_count:Plongint; unique_tid_count:Plongint; sleep_trace:Ppointer; 
           trace_size:dword):longint;cdecl;external libasan;
{/ Returns information about stack traces included in the report. }
{/ }
{/ \param report Opaque pointer to the current report. }
{/ \param idx Index to the report's stacks. }
{/ \param trace A buffer to store the stack trace. }
{/ \param trace_size Size in bytes of the trace buffer. }
{/ \returns Returns 1 if successful, 0 if not. }
function __tsan_get_report_stack(report:pointer; idx:dword; trace:Ppointer; trace_size:dword):longint;cdecl;external libasan;
{/ Returns information about memory operations included in the report. }
{/ }
{/ \param report Opaque pointer to the current report. }
{/ \param idx Index to the report's memory operations. }
{/ \param[out] tid Thread ID of the memory operation. }
{/ \param[out] addr Address of the memory operation. }
{/ \param[out] size Size of the memory operation. }
{/ \param[out] write Write flag of the memory operation. }
{/ \param[out] atomic Atomicity flag of the memory operation. }
{/ \param trace A buffer to store the stack trace. }
{/ \param trace_size Size in bytes of the trace buffer. }
{/ \returns Returns 1 if successful, 0 if not. }
function __tsan_get_report_mop(report:pointer; idx:dword; tid:Plongint; addr:Ppointer; size:Plongint; 
           write:Plongint; atomic:Plongint; trace:Ppointer; trace_size:dword):longint;cdecl;external libasan;
{/ Returns information about locations included in the report. }
{/ }
{/ \param report Opaque pointer to the current report. }
{/ \param idx Index to the report's locations. }
{/ \param[out] type Type of the location. }
{/ \param[out] addr Address of the location. }
{/ \param[out] start Start of the location. }
{/ \param[out] size Size of the location. }
{/ \param[out] tid Thread ID of the location. }
{/ \param[out] fd File descriptor of the location. }
{/ \param[out] suppressable Suppressable flag. }
{/ \param trace A buffer to store the stack trace. }
{/ \param trace_size Size in bytes of the trace buffer. }
{/ \returns Returns 1 if successful, 0 if not. }
function __tsan_get_report_loc(report:pointer; idx:dword; _type:PPchar; addr:Ppointer; start:Ppointer; 
           size:Pdword; tid:Plongint; fd:Plongint; suppressable:Plongint; trace:Ppointer; 
           trace_size:dword):longint;cdecl;external libasan;
{/ Returns information about mutexes included in the report. }
{/ }
{/ \param report Opaque pointer to the current report. }
{/ \param idx Index to the report's mutexes. }
{/ \param[out] mutex_id Id of the mutex. }
{/ \param[out] addr Address of the mutex. }
{/ \param[out] destroyed Destroyed mutex flag. }
{/ \param trace A buffer to store the stack trace. }
{/ \param trace_size Size in bytes of the trace buffer. }
{/ \returns Returns 1 if successful, 0 if not. }
function __tsan_get_report_mutex(report:pointer; idx:dword; mutex_id:Puint64_t; addr:Ppointer; destroyed:Plongint; 
           trace:Ppointer; trace_size:dword):longint;cdecl;external libasan;
{/ Returns information about threads included in the report. }
{/ }
{/ \param report Opaque pointer to the current report. }
{/ \param idx Index to the report's threads. }
{/ \param[out] tid Thread ID of the thread. }
{/ \param[out] os_id Operating system's ID of the thread. }
{/ \param[out] running Running flag of the thread. }
{/ \param[out] name Name of the thread. }
{/ \param[out] parent_tid ID of the parent thread. }
{/ \param trace A buffer to store the stack trace. }
{/ \param trace_size Size in bytes of the trace buffer. }
{/ \returns Returns 1 if successful, 0 if not. }
function __tsan_get_report_thread(report:pointer; idx:dword; tid:Plongint; os_id:Puint64_t; running:Plongint; 
           name:PPchar; parent_tid:Plongint; trace:Ppointer; trace_size:dword):longint;cdecl;external libasan;
{/ Returns information about unique thread IDs included in the report. }
{/ }
{/ \param report Opaque pointer to the current report. }
{/ \param idx Index to the report's unique thread IDs. }
{/ \param[out] tid Unique thread ID of the report. }
{/ \returns Returns 1 if successful, 0 if not. }
function __tsan_get_report_unique_tid(report:pointer; idx:dword; tid:Plongint):longint;cdecl;external libasan;
{/ Returns the current report. }
{/ }
{/ If TSan is currently reporting a detected issue on the current thread, }
{/ returns an opaque pointer to the current report. Otherwise returns NULL. }
{/ \returns An opaque pointer to the current report. Otherwise returns NULL. }
function __tsan_get_current_report:pointer;cdecl;external libasan;
{$endif}
{ SANITIZER_TSAN_INTERFACE_H }

// === Konventiert am: 10-10-26 14:05:26 ===


implementation



end.
