unit lto;

interface

uses
  fp_llvm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{===-- llvm-c/lto.h - LTO Public C Interface ---------------------*- C -*-===*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* This header provides public interface to an abstract link time optimization*|
|* library.  LLVM provides an implementation of this interface for use with   *|
|* llvm bitcode files.                                                        *|
|*                                                                            *|
\*===----------------------------------------------------------------------=== }
{$ifndef LLVM_C_LTO_H}
{$define LLVM_C_LTO_H}
{$include "llvm-c/ExternC.h"}
{$include <stddef.h>}
{$include <sys/types.h>}
{$ifndef __cplusplus}
{$if !defined(_MSC_VER)}
{$include <stdbool.h>}
type
  Plto_bool_t = ^Tlto_bool_t;
  Tlto_bool_t = Tbool;
{$else}
{ MSVC in particular does not have anything like _Bool or bool in C, but we can
   at least make sure the type is the same size.  The implementation side will
   use C++ bool.  }
type
  Plto_bool_t = ^Tlto_bool_t;
  Tlto_bool_t = byte;
{$endif}
{$else}
type
  Plto_bool_t = ^Tlto_bool_t;
  Tlto_bool_t = Tbool;
{$endif}
{*
 * @defgroup LLVMCLTO LTO
 * @ingroup LLVMC
 *
 * @
  }

const
  LTO_API_VERSION = 29;  
{*
 * \since prior to LTO_API_VERSION=3
  }
{ log2 of alignment  }
type
  Plto_symbol_attributes = ^Tlto_symbol_attributes;
  Tlto_symbol_attributes =  Longint;
  Const
    LTO_SYMBOL_ALIGNMENT_MASK = $0000001F;
    LTO_SYMBOL_PERMISSIONS_MASK = $000000E0;
    LTO_SYMBOL_PERMISSIONS_CODE = $000000A0;
    LTO_SYMBOL_PERMISSIONS_DATA = $000000C0;
    LTO_SYMBOL_PERMISSIONS_RODATA = $00000080;
    LTO_SYMBOL_DEFINITION_MASK = $00000700;
    LTO_SYMBOL_DEFINITION_REGULAR = $00000100;
    LTO_SYMBOL_DEFINITION_TENTATIVE = $00000200;
    LTO_SYMBOL_DEFINITION_WEAK = $00000300;
    LTO_SYMBOL_DEFINITION_UNDEFINED = $00000400;
    LTO_SYMBOL_DEFINITION_WEAKUNDEF = $00000500;
    LTO_SYMBOL_SCOPE_MASK = $00003800;
    LTO_SYMBOL_SCOPE_INTERNAL = $00000800;
    LTO_SYMBOL_SCOPE_HIDDEN = $00001000;
    LTO_SYMBOL_SCOPE_PROTECTED = $00002000;
    LTO_SYMBOL_SCOPE_DEFAULT = $00001800;
    LTO_SYMBOL_SCOPE_DEFAULT_CAN_BE_HIDDEN = $00002800;
    LTO_SYMBOL_COMDAT = $00004000;
    LTO_SYMBOL_ALIAS = $00008000;
;
{*
 * \since prior to LTO_API_VERSION=3
  }
type
  Plto_debug_model = ^Tlto_debug_model;
  Tlto_debug_model =  Longint;
  Const
    LTO_DEBUG_MODEL_NONE = 0;
    LTO_DEBUG_MODEL_DWARF = 1;
;
{*
 * \since prior to LTO_API_VERSION=3
  }
type
  Plto_codegen_model = ^Tlto_codegen_model;
  Tlto_codegen_model =  Longint;
  Const
    LTO_CODEGEN_PIC_MODEL_STATIC = 0;
    LTO_CODEGEN_PIC_MODEL_DYNAMIC = 1;
    LTO_CODEGEN_PIC_MODEL_DYNAMIC_NO_PIC = 2;
    LTO_CODEGEN_PIC_MODEL_DEFAULT = 3;
;
{* opaque reference to a loaded object module  }
type
  Plto_module_t = ^Tlto_module_t;
  Tlto_module_t = PLLVMOpaqueLTOModule;
{* opaque reference to a code generator  }

  Plto_code_gen_t = ^Tlto_code_gen_t;
  Tlto_code_gen_t = PLLVMOpaqueLTOCodeGenerator;
{* opaque reference to a thin code generator  }

  Pthinlto_code_gen_t = ^Tthinlto_code_gen_t;
  Tthinlto_code_gen_t = PLLVMOpaqueThinLTOCodeGenerator;
{*
 * Returns a printable string.
 *
 * \since prior to LTO_API_VERSION=3
  }

function lto_get_version:Pchar;cdecl;external libllvm;
{*
 * Returns the last error string or NULL if last operation was successful.
 *
 * \since prior to LTO_API_VERSION=3
  }
function lto_get_error_message:Pchar;cdecl;external libllvm;
{*
 * Checks if a file is a loadable object file.
 *
 * \since prior to LTO_API_VERSION=3
  }
function lto_module_is_object_file(path:Pchar):Tlto_bool_t;cdecl;external libllvm;
{*
 * Checks if a file is a loadable object compiled for requested target.
 *
 * \since prior to LTO_API_VERSION=3
  }
function lto_module_is_object_file_for_target(path:Pchar; target_triple_prefix:Pchar):Tlto_bool_t;cdecl;external libllvm;
{*
 * Return true if \p Buffer contains a bitcode file with ObjC code (category
 * or class) in it.
 *
 * \since LTO_API_VERSION=20
  }
function lto_module_has_objc_category(mem:pointer; length:Tsize_t):Tlto_bool_t;cdecl;external libllvm;
{*
 * Checks if a buffer is a loadable object file.
 *
 * \since prior to LTO_API_VERSION=3
  }
function lto_module_is_object_file_in_memory(mem:pointer; length:Tsize_t):Tlto_bool_t;cdecl;external libllvm;
{*
 * Checks if a buffer is a loadable object compiled for requested target.
 *
 * \since prior to LTO_API_VERSION=3
  }
function lto_module_is_object_file_in_memory_for_target(mem:pointer; length:Tsize_t; target_triple_prefix:Pchar):Tlto_bool_t;cdecl;external libllvm;
{*
 * Loads an object file from disk.
 * Returns NULL on error (check lto_get_error_message() for details).
 *
 * \since prior to LTO_API_VERSION=3
  }
function lto_module_create(path:Pchar):Tlto_module_t;cdecl;external libllvm;
{*
 * Loads an object file from memory.
 * Returns NULL on error (check lto_get_error_message() for details).
 *
 * \since prior to LTO_API_VERSION=3
  }
function lto_module_create_from_memory(mem:pointer; length:Tsize_t):Tlto_module_t;cdecl;external libllvm;
{*
 * Loads an object file from memory with an extra path argument.
 * Returns NULL on error (check lto_get_error_message() for details).
 *
 * \since LTO_API_VERSION=9
  }
function lto_module_create_from_memory_with_path(mem:pointer; length:Tsize_t; path:Pchar):Tlto_module_t;cdecl;external libllvm;
{*
 * Loads an object file in its own context.
 *
 * Loads an object file in its own LLVMContext.  This function call is
 * thread-safe.  However, modules created this way should not be merged into an
 * lto_code_gen_t using \a lto_codegen_add_module().
 *
 * Returns NULL on error (check lto_get_error_message() for details).
 *
 * \since LTO_API_VERSION=11
  }
function lto_module_create_in_local_context(mem:pointer; length:Tsize_t; path:Pchar):Tlto_module_t;cdecl;external libllvm;
{*
 * Loads an object file in the codegen context.
 *
 * Loads an object file into the same context as \c cg.  The module is safe to
 * add using \a lto_codegen_add_module().
 *
 * Returns NULL on error (check lto_get_error_message() for details).
 *
 * \since LTO_API_VERSION=11
  }
function lto_module_create_in_codegen_context(mem:pointer; length:Tsize_t; path:Pchar; cg:Tlto_code_gen_t):Tlto_module_t;cdecl;external libllvm;
{*
 * Loads an object file from disk. The seek point of fd is not preserved.
 * Returns NULL on error (check lto_get_error_message() for details).
 *
 * \since LTO_API_VERSION=5
  }
function lto_module_create_from_fd(fd:longint; path:Pchar; file_size:Tsize_t):Tlto_module_t;cdecl;external libllvm;
{*
 * Loads an object file from disk. The seek point of fd is not preserved.
 * Returns NULL on error (check lto_get_error_message() for details).
 *
 * \since LTO_API_VERSION=5
  }
function lto_module_create_from_fd_at_offset(fd:longint; path:Pchar; file_size:Tsize_t; map_size:Tsize_t; offset:Toff_t):Tlto_module_t;cdecl;external libllvm;
{*
 * Frees all memory internally allocated by the module.
 * Upon return the lto_module_t is no longer valid.
 *
 * \since prior to LTO_API_VERSION=3
  }
procedure lto_module_dispose(mod:Tlto_module_t);cdecl;external libllvm;
{*
 * Returns triple string which the object module was compiled under.
 *
 * \since prior to LTO_API_VERSION=3
  }
function lto_module_get_target_triple(mod:Tlto_module_t):Pchar;cdecl;external libllvm;
{*
 * Sets triple string with which the object will be codegened.
 *
 * \since LTO_API_VERSION=4
  }
procedure lto_module_set_target_triple(mod:Tlto_module_t; triple:Pchar);cdecl;external libllvm;
{*
 * Returns the number of symbols in the object module.
 *
 * \since prior to LTO_API_VERSION=3
  }
function lto_module_get_num_symbols(mod:Tlto_module_t):dword;cdecl;external libllvm;
{*
 * Returns the name of the ith symbol in the object module.
 *
 * \since prior to LTO_API_VERSION=3
  }
function lto_module_get_symbol_name(mod:Tlto_module_t; index:dword):Pchar;cdecl;external libllvm;
{*
 * Returns the attributes of the ith symbol in the object module.
 *
 * \since prior to LTO_API_VERSION=3
  }
function lto_module_get_symbol_attribute(mod:Tlto_module_t; index:dword):Tlto_symbol_attributes;cdecl;external libllvm;
{*
 * Returns the module's linker options.
 *
 * The linker options may consist of multiple flags. It is the linker's
 * responsibility to split the flags using a platform-specific mechanism.
 *
 * \since LTO_API_VERSION=16
  }
function lto_module_get_linkeropts(mod:Tlto_module_t):Pchar;cdecl;external libllvm;
{*
 * If targeting mach-o on darwin, this function gets the CPU type and subtype
 * that will end up being encoded in the mach-o header. These are the values
 * that can be found in mach/machine.h.
 *
 * \p out_cputype and \p out_cpusubtype must be non-NULL.
 *
 * Returns true on error (check lto_get_error_message() for details).
 *
 * \since LTO_API_VERSION=27
  }
function lto_module_get_macho_cputype(mod:Tlto_module_t; out_cputype:Pdword; out_cpusubtype:Pdword):Tlto_bool_t;cdecl;external libllvm;
{*
 * This function can be used by the linker to check if a given module has
 * any constructor or destructor functions.
 *
 * Returns true if the module has either the @llvm.global_ctors or the
 * @llvm.global_dtors symbol. Otherwise returns false.
 *
 * \since LTO_API_VERSION=29
  }
function lto_module_has_ctor_dtor(mod:Tlto_module_t):Tlto_bool_t;cdecl;external libllvm;
{*
 * Diagnostic severity.
 *
 * \since LTO_API_VERSION=7
  }
{ Added in LTO_API_VERSION=10. }
type
  Plto_codegen_diagnostic_severity_t = ^Tlto_codegen_diagnostic_severity_t;
  Tlto_codegen_diagnostic_severity_t =  Longint;
  Const
    LTO_DS_ERROR = 0;
    LTO_DS_WARNING = 1;
    LTO_DS_REMARK = 3;
    LTO_DS_NOTE = 2;
;
{*
 * Diagnostic handler type.
 * \p severity defines the severity.
 * \p diag is the actual diagnostic.
 * The diagnostic is not prefixed by any of severity keyword, e.g., 'error: '.
 * \p ctxt is used to pass the context set with the diagnostic handler.
 *
 * \since LTO_API_VERSION=7
  }
type

  Tlto_diagnostic_handler_t = procedure (severity:Tlto_codegen_diagnostic_severity_t; diag:Pchar; ctxt:pointer);cdecl;
{*
 * Set a diagnostic handler and the related context (void *).
 * This is more general than lto_get_error_message, as the diagnostic handler
 * can be called at anytime within lto.
 *
 * \since LTO_API_VERSION=7
  }

procedure lto_codegen_set_diagnostic_handler(para1:Tlto_code_gen_t; para2:Tlto_diagnostic_handler_t; para3:pointer);cdecl;external libllvm;
{*
 * Instantiates a code generator.
 * Returns NULL on error (check lto_get_error_message() for details).
 *
 * All modules added using \a lto_codegen_add_module() must have been created
 * in the same context as the codegen.
 *
 * \since prior to LTO_API_VERSION=3
  }
function lto_codegen_create:Tlto_code_gen_t;cdecl;external libllvm;
{*
 * Instantiate a code generator in its own context.
 *
 * Instantiates a code generator in its own context.  Modules added via \a
 * lto_codegen_add_module() must have all been created in the same context,
 * using \a lto_module_create_in_codegen_context().
 *
 * \since LTO_API_VERSION=11
  }
function lto_codegen_create_in_local_context:Tlto_code_gen_t;cdecl;external libllvm;
{*
 * Frees all code generator and all memory it internally allocated.
 * Upon return the lto_code_gen_t is no longer valid.
 *
 * \since prior to LTO_API_VERSION=3
  }
procedure lto_codegen_dispose(para1:Tlto_code_gen_t);cdecl;external libllvm;
{*
 * Add an object module to the set of modules for which code will be generated.
 * Returns true on error (check lto_get_error_message() for details).
 *
 * \c cg and \c mod must both be in the same context.  See \a
 * lto_codegen_create_in_local_context() and \a
 * lto_module_create_in_codegen_context().
 *
 * \since prior to LTO_API_VERSION=3
  }
function lto_codegen_add_module(cg:Tlto_code_gen_t; mod:Tlto_module_t):Tlto_bool_t;cdecl;external libllvm;
{*
 * Sets the object module for code generation. This will transfer the ownership
 * of the module to the code generator.
 *
 * \c cg and \c mod must both be in the same context.
 *
 * \since LTO_API_VERSION=13
  }
procedure lto_codegen_set_module(cg:Tlto_code_gen_t; mod:Tlto_module_t);cdecl;external libllvm;
{*
 * Sets if debug info should be generated.
 * Returns true on error (check lto_get_error_message() for details).
 *
 * \since prior to LTO_API_VERSION=3
  }
function lto_codegen_set_debug_model(cg:Tlto_code_gen_t; para2:Tlto_debug_model):Tlto_bool_t;cdecl;external libllvm;
{*
 * Sets which PIC code model to generated.
 * Returns true on error (check lto_get_error_message() for details).
 *
 * \since prior to LTO_API_VERSION=3
  }
function lto_codegen_set_pic_model(cg:Tlto_code_gen_t; para2:Tlto_codegen_model):Tlto_bool_t;cdecl;external libllvm;
{*
 * Sets the cpu to generate code for.
 *
 * \since LTO_API_VERSION=4
  }
procedure lto_codegen_set_cpu(cg:Tlto_code_gen_t; cpu:Pchar);cdecl;external libllvm;
{*
 * Sets the location of the assembler tool to run. If not set, libLTO
 * will use gcc to invoke the assembler.
 *
 * \since LTO_API_VERSION=3
  }
procedure lto_codegen_set_assembler_path(cg:Tlto_code_gen_t; path:Pchar);cdecl;external libllvm;
{*
 * Sets extra arguments that libLTO should pass to the assembler.
 *
 * \since LTO_API_VERSION=4
  }
procedure lto_codegen_set_assembler_args(cg:Tlto_code_gen_t; args:PPchar; nargs:longint);cdecl;external libllvm;
{*
 * Adds to a list of all global symbols that must exist in the final generated
 * code. If a function is not listed there, it might be inlined into every usage
 * and optimized away.
 *
 * \since prior to LTO_API_VERSION=3
  }
procedure lto_codegen_add_must_preserve_symbol(cg:Tlto_code_gen_t; symbol:Pchar);cdecl;external libllvm;
{*
 * Writes a new object file at the specified path that contains the
 * merged contents of all modules added so far.
 * Returns true on error (check lto_get_error_message() for details).
 *
 * \since LTO_API_VERSION=5
  }
function lto_codegen_write_merged_modules(cg:Tlto_code_gen_t; path:Pchar):Tlto_bool_t;cdecl;external libllvm;
{*
 * Generates code for all added modules into one native object file.
 * This calls lto_codegen_optimize then lto_codegen_compile_optimized.
 *
 * On success returns a pointer to a generated mach-o/ELF buffer and
 * length set to the buffer size.  The buffer is owned by the
 * lto_code_gen_t and will be freed when lto_codegen_dispose()
 * is called, or lto_codegen_compile() is called again.
 * On failure, returns NULL (check lto_get_error_message() for details).
 *
 * \since prior to LTO_API_VERSION=3
  }
function lto_codegen_compile(cg:Tlto_code_gen_t; length:Psize_t):pointer;cdecl;external libllvm;
{*
 * Generates code for all added modules into one native object file.
 * This calls lto_codegen_optimize then lto_codegen_compile_optimized (instead
 * of returning a generated mach-o/ELF buffer, it writes to a file).
 *
 * The name of the file is written to name. Returns true on error.
 *
 * \since LTO_API_VERSION=5
  }
function lto_codegen_compile_to_file(cg:Tlto_code_gen_t; name:PPchar):Tlto_bool_t;cdecl;external libllvm;
{*
 * Runs optimization for the merged module. Returns true on error.
 *
 * \since LTO_API_VERSION=12
  }
function lto_codegen_optimize(cg:Tlto_code_gen_t):Tlto_bool_t;cdecl;external libllvm;
{*
 * Generates code for the optimized merged module into one native object file.
 * It will not run any IR optimizations on the merged module.
 *
 * On success returns a pointer to a generated mach-o/ELF buffer and length set
 * to the buffer size.  The buffer is owned by the lto_code_gen_t and will be
 * freed when lto_codegen_dispose() is called, or
 * lto_codegen_compile_optimized() is called again. On failure, returns NULL
 * (check lto_get_error_message() for details).
 *
 * \since LTO_API_VERSION=12
  }
function lto_codegen_compile_optimized(cg:Tlto_code_gen_t; length:Psize_t):pointer;cdecl;external libllvm;
{*
 * Returns the runtime API version.
 *
 * \since LTO_API_VERSION=12
  }
function lto_api_version:dword;cdecl;external libllvm;
{*
 * Parses options immediately, making them available as early as possible. For
 * example during executing codegen::InitTargetOptionsFromCodeGenFlags. Since
 * parsing shud only happen once, only one of lto_codegen_debug_options or
 * lto_set_debug_options should be called.
 *
 * This function takes one or more options separated by spaces.
 * Warning: passing file paths through this function may confuse the argument
 * parser if the paths contain spaces.
 *
 * \since LTO_API_VERSION=28
  }
procedure lto_set_debug_options(options:PPchar; number:longint);cdecl;external libllvm;
{*
 * Sets options to help debug codegen bugs. Since parsing shud only happen once,
 * only one of lto_codegen_debug_options or lto_set_debug_options
 * should be called.
 *
 * This function takes one or more options separated by spaces.
 * Warning: passing file paths through this function may confuse the argument
 * parser if the paths contain spaces.
 *
 * \since prior to LTO_API_VERSION=3
  }
procedure lto_codegen_debug_options(cg:Tlto_code_gen_t; para2:Pchar);cdecl;external libllvm;
{*
 * Same as the previous function, but takes every option separately through an
 * array.
 *
 * \since prior to LTO_API_VERSION=26
  }
(* Const before abstract_declarator ignored *)
procedure lto_codegen_debug_options_array(cg:Tlto_code_gen_t; para2:PPchar; number:longint);cdecl;external libllvm;
{*
 * Initializes LLVM disassemblers.
 * FIXME: This doesn't really belong here.
 *
 * \since LTO_API_VERSION=5
  }
procedure lto_initialize_disassembler;cdecl;external libllvm;
{*
 * Sets if we should run internalize pass during optimization and code
 * generation.
 *
 * \since LTO_API_VERSION=14
  }
procedure lto_codegen_set_should_internalize(cg:Tlto_code_gen_t; ShouldInternalize:Tlto_bool_t);cdecl;external libllvm;
{*
 * Set whether to embed uselists in bitcode.
 *
 * Sets whether \a lto_codegen_write_merged_modules() should embed uselists in
 * output bitcode.  This should be turned on for all -save-temps output.
 *
 * \since LTO_API_VERSION=15
  }
procedure lto_codegen_set_should_embed_uselists(cg:Tlto_code_gen_t; ShouldEmbedUselists:Tlto_bool_t);cdecl;external libllvm;
{* Opaque reference to an LTO input file  }
type
  Plto_input_t = ^Tlto_input_t;
  Tlto_input_t = PLLVMOpaqueLTOInput;
{*
  * Creates an LTO input file from a buffer. The path
  * argument is used for diagnotics as this function
  * otherwise does not know which file the given buffer
  * is associated with.
  *
  * \since LTO_API_VERSION=24
   }

function lto_input_create(buffer:pointer; buffer_size:Tsize_t; path:Pchar):Tlto_input_t;cdecl;external libllvm;
{*
  * Frees all memory internally allocated by the LTO input file.
  * Upon return the lto_module_t is no longer valid.
  *
  * \since LTO_API_VERSION=24
   }
procedure lto_input_dispose(input:Tlto_input_t);cdecl;external libllvm;
{*
  * Returns the number of dependent library specifiers
  * for the given LTO input file.
  *
  * \since LTO_API_VERSION=24
   }
function lto_input_get_num_dependent_libraries(input:Tlto_input_t):dword;cdecl;external libllvm;
{*
  * Returns the ith dependent library specifier
  * for the given LTO input file. The returned
  * string is not null-terminated.
  *
  * \since LTO_API_VERSION=24
   }
function lto_input_get_dependent_library(input:Tlto_input_t; index:Tsize_t; size:Psize_t):Pchar;cdecl;external libllvm;
{*
 * Returns the list of libcall symbols that can be generated by LTO
 * that might not be visible from the symbol table of bitcode files.
 *
 * \since prior to LTO_API_VERSION=25
  }
function lto_runtime_lib_symbols_list(size:Psize_t):^Pchar;cdecl;external libllvm;
{*
 * @ // endgoup LLVMCLTO
 * @defgroup LLVMCTLTO ThinLTO
 * @ingroup LLVMC
 *
 * @
  }
{*
 * Type to wrap a single object returned by ThinLTO.
 *
 * \since LTO_API_VERSION=18
  }
type
  PLTOObjectBuffer = ^TLTOObjectBuffer;
  TLTOObjectBuffer = record
      Buffer : Pchar;
      Size : Tsize_t;
    end;
{*
 * Instantiates a ThinLTO code generator.
 * Returns NULL on error (check lto_get_error_message() for details).
 *
 *
 * The ThinLTOCodeGenerator is not intended to be reuse for multiple
 * compilation: the model is that the client adds modules to the generator and
 * ask to perform the ThinLTO optimizations / codegen, and finally destroys the
 * codegenerator.
 *
 * \since LTO_API_VERSION=18
  }

function thinlto_create_codegen:Tthinlto_code_gen_t;cdecl;external libllvm;
{*
 * Frees the generator and all memory it internally allocated.
 * Upon return the thinlto_code_gen_t is no longer valid.
 *
 * \since LTO_API_VERSION=18
  }
procedure thinlto_codegen_dispose(cg:Tthinlto_code_gen_t);cdecl;external libllvm;
{*
 * Add a module to a ThinLTO code generator. Identifier has to be unique among
 * all the modules in a code generator. The data buffer stays owned by the
 * client, and is expected to be available for the entire lifetime of the
 * thinlto_code_gen_t it is added to.
 *
 * On failure, returns NULL (check lto_get_error_message() for details).
 *
 *
 * \since LTO_API_VERSION=18
  }
procedure thinlto_codegen_add_module(cg:Tthinlto_code_gen_t; identifier:Pchar; data:Pchar; length:longint);cdecl;external libllvm;
{*
 * Optimize and codegen all the modules added to the codegenerator using
 * ThinLTO. Resulting objects are accessible using thinlto_module_get_object().
 *
 * \since LTO_API_VERSION=18
  }
procedure thinlto_codegen_process(cg:Tthinlto_code_gen_t);cdecl;external libllvm;
{*
 * Returns the number of object files produced by the ThinLTO CodeGenerator.
 *
 * It usually matches the number of input files, but this is not a guarantee of
 * the API and may change in future implementation, so the client should not
 * assume it.
 *
 * \since LTO_API_VERSION=18
  }
function thinlto_module_get_num_objects(cg:Tthinlto_code_gen_t):dword;cdecl;external libllvm;
{*
 * Returns a reference to the ith object file produced by the ThinLTO
 * CodeGenerator.
 *
 * Client should use \p thinlto_module_get_num_objects() to get the number of
 * available objects.
 *
 * \since LTO_API_VERSION=18
  }
function thinlto_module_get_object(cg:Tthinlto_code_gen_t; index:dword):TLTOObjectBuffer;cdecl;external libllvm;
{*
 * Returns the number of object files produced by the ThinLTO CodeGenerator.
 *
 * It usually matches the number of input files, but this is not a guarantee of
 * the API and may change in future implementation, so the client should not
 * assume it.
 *
 * \since LTO_API_VERSION=21
  }
function thinlto_module_get_num_object_files(cg:Tthinlto_code_gen_t):dword;cdecl;external libllvm;
{*
 * Returns the path to the ith object file produced by the ThinLTO
 * CodeGenerator.
 *
 * Client should use \p thinlto_module_get_num_object_files() to get the number
 * of available objects.
 *
 * \since LTO_API_VERSION=21
  }
function thinlto_module_get_object_file(cg:Tthinlto_code_gen_t; index:dword):Pchar;cdecl;external libllvm;
{*
 * Sets which PIC code model to generate.
 * Returns true on error (check lto_get_error_message() for details).
 *
 * \since LTO_API_VERSION=18
  }
function thinlto_codegen_set_pic_model(cg:Tthinlto_code_gen_t; para2:Tlto_codegen_model):Tlto_bool_t;cdecl;external libllvm;
{*
 * Sets the path to a directory to use as a storage for temporary bitcode files.
 * The intention is to make the bitcode files available for debugging at various
 * stage of the pipeline.
 *
 * \since LTO_API_VERSION=18
  }
procedure thinlto_codegen_set_savetemps_dir(cg:Tthinlto_code_gen_t; save_temps_dir:Pchar);cdecl;external libllvm;
{*
 * Set the path to a directory where to save generated object files. This
 * path can be used by a linker to request on-disk files instead of in-memory
 * buffers. When set, results are available through
 * thinlto_module_get_object_file() instead of thinlto_module_get_object().
 *
 * \since LTO_API_VERSION=21
  }
procedure thinlto_set_generated_objects_dir(cg:Tthinlto_code_gen_t; save_temps_dir:Pchar);cdecl;external libllvm;
{*
 * Sets the cpu to generate code for.
 *
 * \since LTO_API_VERSION=18
  }
procedure thinlto_codegen_set_cpu(cg:Tthinlto_code_gen_t; cpu:Pchar);cdecl;external libllvm;
{*
 * Disable CodeGen, only run the stages till codegen and stop. The output will
 * be bitcode.
 *
 * \since LTO_API_VERSION=19
  }
procedure thinlto_codegen_disable_codegen(cg:Tthinlto_code_gen_t; disable:Tlto_bool_t);cdecl;external libllvm;
{*
 * Perform CodeGen only: disable all other stages.
 *
 * \since LTO_API_VERSION=19
  }
procedure thinlto_codegen_set_codegen_only(cg:Tthinlto_code_gen_t; codegen_only:Tlto_bool_t);cdecl;external libllvm;
{*
 * Parse -mllvm style debug options.
 *
 * \since LTO_API_VERSION=18
  }
procedure thinlto_debug_options(options:PPchar; number:longint);cdecl;external libllvm;
{*
 * Test if a module has support for ThinLTO linking.
 *
 * \since LTO_API_VERSION=18
  }
function lto_module_is_thinlto(mod:Tlto_module_t):Tlto_bool_t;cdecl;external libllvm;
{*
 * Adds a symbol to the list of global symbols that must exist in the final
 * generated code. If a function is not listed there, it might be inlined into
 * every usage and optimized away. For every single module, the functions
 * referenced from code outside of the ThinLTO modules need to be added here.
 *
 * \since LTO_API_VERSION=18
  }
procedure thinlto_codegen_add_must_preserve_symbol(cg:Tthinlto_code_gen_t; name:Pchar; length:longint);cdecl;external libllvm;
{*
 * Adds a symbol to the list of global symbols that are cross-referenced between
 * ThinLTO files. If the ThinLTO CodeGenerator can ensure that every
 * references from a ThinLTO module to this symbol is optimized away, then
 * the symbol can be discarded.
 *
 * \since LTO_API_VERSION=18
  }
procedure thinlto_codegen_add_cross_referenced_symbol(cg:Tthinlto_code_gen_t; name:Pchar; length:longint);cdecl;external libllvm;
{*
 * @ // endgoup LLVMCTLTO
 * @defgroup LLVMCTLTO_CACHING ThinLTO Cache Control
 * @ingroup LLVMCTLTO
 *
 * These entry points control the ThinLTO cache. The cache is intended to
 * support incremental builds, and thus needs to be persistent across builds.
 * The client enables the cache by supplying a path to an existing directory.
 * The code generator will use this to store objects files that may be reused
 * during a subsequent build.
 * To avoid filling the disk space, a few knobs are provided:
 *  - The pruning interval limits the frequency at which the garbage collector
 *    will try to scan the cache directory to prune expired entries.
 *    Setting to a negative number disables the pruning.
 *  - The pruning expiration time indicates to the garbage collector how old an
 *    entry needs to be to be removed.
 *  - Finally, the garbage collector can be instructed to prune the cache until
 *    the occupied space goes below a threshold.
 * @
  }
{*
 * Sets the path to a directory to use as a cache storage for incremental build.
 * Setting this activates caching.
 *
 * \since LTO_API_VERSION=18
  }
procedure thinlto_codegen_set_cache_dir(cg:Tthinlto_code_gen_t; cache_dir:Pchar);cdecl;external libllvm;
{*
 * Sets the cache pruning interval (in seconds). A negative value disables the
 * pruning. An unspecified default value will be applied, and a value of 0 will
 * force prunning to occur.
 *
 * \since LTO_API_VERSION=18
  }
procedure thinlto_codegen_set_cache_pruning_interval(cg:Tthinlto_code_gen_t; interval:longint);cdecl;external libllvm;
{*
 * Sets the maximum cache size that can be persistent across build, in terms of
 * percentage of the available space on the disk. Set to 100 to indicate
 * no limit, 50 to indicate that the cache size will not be left over half the
 * available space. A value over 100 will be reduced to 100, a value of 0 will
 * be ignored. An unspecified default value will be applied.
 *
 * The formula looks like:
 *  AvailableSpace = FreeSpace + ExistingCacheSize
 *  NewCacheSize = AvailableSpace * P/100
 *
 * \since LTO_API_VERSION=18
  }
procedure thinlto_codegen_set_final_cache_size_relative_to_available_space(cg:Tthinlto_code_gen_t; percentage:dword);cdecl;external libllvm;
{*
 * Sets the expiration (in seconds) for an entry in the cache. An unspecified
 * default value will be applied. A value of 0 will be ignored.
 *
 * \since LTO_API_VERSION=18
  }
procedure thinlto_codegen_set_cache_entry_expiration(cg:Tthinlto_code_gen_t; expiration:dword);cdecl;external libllvm;
{*
 * Sets the maximum size of the cache directory (in bytes). A value over the
 * amount of available space on the disk will be reduced to the amount of
 * available space. An unspecified default value will be applied. A value of 0
 * will be ignored.
 *
 * \since LTO_API_VERSION=22
  }
procedure thinlto_codegen_set_cache_size_bytes(cg:Tthinlto_code_gen_t; max_size_bytes:dword);cdecl;external libllvm;
{*
 * Same as thinlto_codegen_set_cache_size_bytes, except the maximum size is in
 * megabytes (2^20 bytes).
 *
 * \since LTO_API_VERSION=23
  }
procedure thinlto_codegen_set_cache_size_megabytes(cg:Tthinlto_code_gen_t; max_size_megabytes:dword);cdecl;external libllvm;
{*
 * Sets the maximum number of files in the cache directory. An unspecified
 * default value will be applied. A value of 0 will be ignored.
 *
 * \since LTO_API_VERSION=22
  }
procedure thinlto_codegen_set_cache_size_files(cg:Tthinlto_code_gen_t; max_size_files:dword);cdecl;external libllvm;
{*
 * @ // endgroup LLVMCTLTO_CACHING
  }
{$endif}
{ LLVM_C_LTO_H  }

// === Konventiert am: 20-9-26 17:11:18 ===


implementation



end.
