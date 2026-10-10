
unit asan_interface;
interface

{
  Automatically converted by H2Pas 1.0.0 from asan_interface.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    asan_interface.h
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
Plongint  = ^longint;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{===-- sanitizer/asan_interface.h ------------------------------*- C++ -*-===// }
{ }
{ Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions. }
{ See https://llvm.org/LICENSE.txt for license information. }
{ SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception }
{ }
{===----------------------------------------------------------------------===// }
{ }
{ This file is a part of AddressSanitizer (ASan). }
{ }
{ Public interface header. }
{===----------------------------------------------------------------------===// }
{$ifndef SANITIZER_ASAN_INTERFACE_H}
{$define SANITIZER_ASAN_INTERFACE_H}
{$include <sanitizer/common_interface_defs.h>}
{ C++ extern C conditionnal removed }
{/ Marks a memory region (<c>[addr, addr+size)</c>) as unaddressable. }
{/ }
{/ This memory must be previously allocated by your program. Instrumented }
{/ code is forbidden from accessing addresses in this region until it is }
{/ unpoisoned. This function is not guaranteed to poison the entire region - }
{/ it could poison only a subregion of <c>[addr, addr+size)</c> due to ASan }
{/ alignment restrictions. }
{/ }
{/ \note This function is not thread-safe because no two threads can poison or }
{/ unpoison memory in the same memory region simultaneously. }
{/ }
{/ \param addr Start of memory region. }
{/ \param size Size of memory region. }
(* Const before declarator ignored *)

procedure __asan_poison_memory_region(addr:pointer; size:Tsize_t);cdecl;external;
{/ Marks a memory region (<c>[addr, addr+size)</c>) as addressable. }
{/ }
{/ This memory must be previously allocated by your program. Accessing }
{/ addresses in this region is allowed until this region is poisoned again. }
{/ This function could unpoison a super-region of <c>[addr, addr+size)</c> due }
{/ to ASan alignment restrictions. }
{/ }
{/ \note This function is not thread-safe because no two threads can }
{/ poison or unpoison memory in the same memory region simultaneously. }
{/ }
{/ \param addr Start of memory region. }
{/ \param size Size of memory region. }
(* Const before declarator ignored *)
procedure __asan_unpoison_memory_region(addr:pointer; size:Tsize_t);cdecl;external;
{ Macros provided for convenience. }
{$ifdef __has_feature}
{$if __has_feature(address_sanitizer)}
{$define ASAN_DEFINE_REGION_MACROS}
{$endif}
(*** was #elif ****){$else defined(__SANITIZE_ADDRESS__)}
{$define ASAN_DEFINE_REGION_MACROS}
{$endif}
{$ifdef ASAN_DEFINE_REGION_MACROS}
{/ Marks a memory region as unaddressable. }
{/ }
{/ \note Macro provided for convenience; defined as a no-op if ASan is not }
{/ enabled. }
{/ }
{/ \param addr Start of memory region. }
{/ \param size Size of memory region. }
{/ Checks if an address is poisoned. }
{/ }
{/ Returns 1 if <c><i>addr</i></c> is poisoned (that is, 1-byte read/write }
{/ access to this address would result in an error report from ASan). }
{/ Otherwise returns 0. }
{/ }
{/ \param addr Address to check. }
{/ }
{/ \retval 1 Address is poisoned. }
{/ \retval 0 Address is not poisoned. }
(* Const before declarator ignored *)

function __asan_address_is_poisoned(addr:pointer):longint;cdecl;external;
{/ Checks if a region is poisoned. }
{/ }
{/ If at least one byte in <c>[beg, beg+size)</c> is poisoned, returns the }
{/ address of the first such byte. Otherwise returns 0. }
{/ }
{/ \param beg Start of memory region. }
{/ \param size Start of memory region. }
{/ \returns Address of first poisoned byte. }
function __asan_region_is_poisoned(beg:pointer; size:Tsize_t):pointer;cdecl;external;
{/ Describes an address (useful for calling from the debugger). }
{/ }
{/ Prints the description of <c><i>addr</i></c>. }
{/ }
{/ \param addr Address to describe. }
procedure __asan_describe_address(addr:pointer);cdecl;external;
{/ Checks if an error has been or is being reported (useful for calling from }
{/ the debugger to get information about an ASan error). }
{/ }
{/ Returns 1 if an error has been (or is being) reported. Otherwise returns 0. }
{/ }
{/ \returns 1 if an error has been (or is being) reported. Otherwise returns }
{/ 0. }
function __asan_report_present:longint;cdecl;external;
{/ Gets the PC (program counter) register value of an ASan error (useful for }
{/ calling from the debugger). }
{/ }
{/ Returns PC if an error has been (or is being) reported. }
{/ Otherwise returns 0. }
{/ }
{/ \returns PC value. }
function __asan_get_report_pc:pointer;cdecl;external;
{/ Gets the BP (base pointer) register value of an ASan error (useful for }
{/ calling from the debugger). }
{/ }
{/ Returns BP if an error has been (or is being) reported. }
{/ Otherwise returns 0. }
{/ }
{/ \returns BP value. }
function __asan_get_report_bp:pointer;cdecl;external;
{/ Gets the SP (stack pointer) register value of an ASan error (useful for }
{/ calling from the debugger). }
{/ }
{/ If an error has been (or is being) reported, returns SP. }
{/ Otherwise returns 0. }
{/ }
{/ \returns SP value. }
function __asan_get_report_sp:pointer;cdecl;external;
{/ Gets the address of the report buffer of an ASan error (useful for calling }
{/ from the debugger). }
{/ }
{/ Returns the address of the report buffer if an error has been (or is being) }
{/ reported. Otherwise returns 0. }
{/ }
{/ \returns Address of report buffer. }
function __asan_get_report_address:pointer;cdecl;external;
{/ Gets access type of an ASan error (useful for calling from the debugger). }
{/ }
{/ Returns access type (read or write) if an error has been (or is being) }
{/ reported. Otherwise returns 0. }
{/ }
{/ \returns Access type (0 = read, 1 = write). }
function __asan_get_report_access_type:longint;cdecl;external;
{/ Gets access size of an ASan error (useful for calling from the debugger). }
{/ }
{/ Returns access size if an error has been (or is being) reported. Otherwise }
{/ returns 0. }
{/ }
{/ \returns Access size in bytes. }
function __asan_get_report_access_size:Tsize_t;cdecl;external;
{/ Gets the bug description of an ASan error (useful for calling from a }
{/ debugger). }
{/ }
{/ \returns Returns a bug description if an error has been (or is being) }
{/ reported - for example, "heap-use-after-free". Otherwise returns an empty }
{/ string. }
(* Const before type ignored *)
function __asan_get_report_description:Pchar;cdecl;external;
{/ Gets information about a pointer (useful for calling from the debugger). }
{/ }
{/ Returns the category of the given pointer as a constant string. }
{/ Possible return values are <c>global</c>, <c>stack</c>, <c>stack-fake</c>, }
{/ <c>heap</c>, <c>heap-invalid</c>, <c>shadow-low</c>, <c>shadow-gap</c>, }
{/ <c>shadow-high</c>, and <c>unknown</c>. }
{/ }
{/ If the return value is <c>global</c> or <c>stack</c>, tries to also return }
{/ the variable name, address, and size. If the return value is <c>heap</c>, }
{/ tries to return the chunk address and size. <c><i>name</i></c> should point }
{/ to an allocated buffer of size <c><i>name_size</i></c>. }
{/ }
{/ \param addr Address to locate. }
{/ \param name Buffer to store the variable's name. }
{/ \param name_size Size in bytes of the variable's name buffer. }
{/ \param[out] region_address Address of the region. }
{/ \param[out] region_size Size of the region in bytes. }
{/ }
{/ \returns Returns the category of the given pointer as a constant string. }
(* Const before type ignored *)
function __asan_locate_address(addr:pointer; name:Pchar; name_size:Tsize_t; region_address:Ppointer; region_size:Psize_t):Pchar;cdecl;external;
{/ Gets the allocation stack trace and thread ID for a heap address (useful }
{/ for calling from the debugger). }
{/ }
{/ Stores up to <c><i>size</i></c> frames in <c><i>trace</i></c>. Returns }
{/ the number of stored frames or 0 on error. }
{/ }
{/ \param addr A heap address. }
{/ \param trace A buffer to store the stack trace. }
{/ \param size Size in bytes of the trace buffer. }
{/ \param[out] thread_id The thread ID of the address. }
{/ }
{/ \returns Returns the number of stored frames or 0 on error. }
function __asan_get_alloc_stack(addr:pointer; trace:Ppointer; size:Tsize_t; thread_id:Plongint):Tsize_t;cdecl;external;
{/ Gets the free stack trace and thread ID for a heap address (useful for }
{/ calling from the debugger). }
{/ }
{/ Stores up to <c><i>size</i></c> frames in <c><i>trace</i></c>. Returns }
{/ the number of stored frames or 0 on error. }
{/ }
{/ \param addr A heap address. }
{/ \param trace A buffer to store the stack trace. }
{/ \param size Size in bytes of the trace buffer. }
{/ \param[out] thread_id The thread ID of the address. }
{/ }
{/ \returns Returns the number of stored frames or 0 on error. }
function __asan_get_free_stack(addr:pointer; trace:Ppointer; size:Tsize_t; thread_id:Plongint):Tsize_t;cdecl;external;
{/ Gets the current shadow memory mapping (useful for calling from the }
{/ debugger). }
{/ }
{/ \param[out] shadow_scale Shadow scale value. }
{/ \param[out] shadow_offset Offset value. }
procedure __asan_get_shadow_mapping(shadow_scale:Psize_t; shadow_offset:Psize_t);cdecl;external;
{/ This is an internal function that is called to report an error. However, }
{/ it is still a part of the interface because you might want to set a }
{/ breakpoint on this function in the debugger. }
{/ }
{/ \param pc <c><i>pc</i></c> value of the ASan error. }
{/ \param bp <c><i>bp</i></c> value of the ASan error. }
{/ \param sp <c><i>sp</i></c> value of the ASan error. }
{/ \param addr Address of the ASan error. }
{/ \param is_write True if the error is a write error; false otherwise. }
{/ \param access_size Size of the memory access of the ASan error. }
procedure __asan_report_error(pc:pointer; bp:pointer; sp:pointer; addr:pointer; is_write:longint; 
            access_size:Tsize_t);cdecl;external;
{ Deprecated. Call __sanitizer_set_death_callback instead. }
procedure __asan_set_death_callback(callback:procedure );cdecl;external;
{/ Sets the callback function to be called during ASan error reporting. }
{/ }
{/ The callback provides a string pointer to the report. }
{/ }
{/ \param callback User-provided function. }
(* Const before type ignored *)
procedure __asan_set_error_report_callback(callback:procedure (para1:Pchar));cdecl;external;
{/ User-provided callback on ASan errors. }
{/ }
{/ You can provide a function that would be called immediately when ASan }
{/ detects an error. This is useful in cases when ASan detects an error but }
{/ your program crashes before the ASan report is printed. }
procedure __asan_on_error;cdecl;external;
{/ Prints accumulated statistics to <c>stderr</c> (useful for calling from the }
{/ debugger). }
procedure __asan_print_accumulated_stats;cdecl;external;
{/ User-provided default option settings. }
{/ }
{/ You can provide your own implementation of this function to return a string }
{/ containing ASan runtime options (for example, }
{/ <c>verbosity=1:halt_on_error=0</c>). }
{/ }
{/ \returns Default options string. }
(* Const before type ignored *)
function __asan_default_options:Pchar;cdecl;external;
{ The following two functions facilitate garbage collection in presence of }
{ ASan's fake stack. }
{/ Gets an opaque handler to the current thread's fake stack. }
{/ }
{/ Returns an opaque handler to be used by }
{/ <c>__asan_addr_is_in_fake_stack()</c>. Returns NULL if the current thread }
{/ does not have a fake stack. }
{/ }
{/ \returns An opaque handler to the fake stack or NULL. }
function __asan_get_current_fake_stack:pointer;cdecl;external;
{/ Checks if an address belongs to a given fake stack. }
{/ }
{/ If <c><i>fake_stack</i></c> is non-NULL and <c><i>addr</i></c> belongs to a }
{/ fake frame in <c><i>fake_stack</i></c>, returns the address of the real }
{/ stack that corresponds to the fake frame and sets <c><i>beg</i></c> and }
{/ <c><i>end</i></c> to the boundaries of this fake frame. Otherwise returns }
{/ NULL and does not touch <c><i>beg</i></c> and <c><i>end</i></c>. }
{/ }
{/ If <c><i>beg</i></c> or <c><i>end</i></c> are NULL, they are not touched. }
{/ }
{/ \note This function can be called from a thread other than the owner of }
{/ <c><i>fake_stack</i></c>, but the owner thread needs to be alive. }
{/ }
{/ \param fake_stack An opaque handler to a fake stack. }
{/ \param addr Address to test. }
{/ \param[out] beg Beginning of fake frame. }
{/ \param[out] end End of fake frame. }
{/ \returns Stack address or NULL. }
function __asan_addr_is_in_fake_stack(fake_stack:pointer; addr:pointer; beg:Ppointer; end:Ppointer):pointer;cdecl;external;
{/ Performs shadow memory cleanup of the current thread's stack before a }
{/ function marked with the <c>[[noreturn]]</c> attribute is called. }
{/ }
{/ To avoid false positives on the stack, must be called before no-return }
{/ functions like <c>_exit()</c> and <c>execl()</c>. }
procedure __asan_handle_no_return;cdecl;external;
{/ Update allocation stack trace for the given allocation to the current stack }
{/ trace. Returns 1 if successful, 0 if not. }
function __asan_update_allocation_context(addr:pointer):longint;cdecl;external;
{$endif}
{ SANITIZER_ASAN_INTERFACE_H }

implementation


end.
