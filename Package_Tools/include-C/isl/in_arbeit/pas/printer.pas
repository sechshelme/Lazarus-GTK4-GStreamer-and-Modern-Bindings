unit printer;

interface

uses
  fp_isl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ISL_PRINTER_H}
{$define ISL_PRINTER_H}
{$include <stdio.h>}
{$include <isl/ctx.h>}
{$include <isl/printer_type.h>}
{$include <isl/id_type.h>}
{$if defined(__cplusplus)}
{$endif}

function isl_printer_to_file(ctx:Pisl_ctx; file:PFILE):Pisl_printer;cdecl;external libisl;
function isl_printer_to_str(ctx:Pisl_ctx):Pisl_printer;cdecl;external libisl;
function isl_printer_free(printer:Pisl_printer):Pisl_printer;cdecl;external libisl;
function isl_printer_get_ctx(printer:Pisl_printer):Pisl_ctx;cdecl;external libisl;
function isl_printer_get_file(printer:Pisl_printer):PFILE;cdecl;external libisl;
function isl_printer_get_str(printer:Pisl_printer):Pchar;cdecl;external libisl;
function isl_printer_set_indent(p:Pisl_printer; indent:longint):Pisl_printer;cdecl;external libisl;
function isl_printer_indent(p:Pisl_printer; indent:longint):Pisl_printer;cdecl;external libisl;
const
  ISL_FORMAT_ISL = 0;  
  ISL_FORMAT_POLYLIB = 1;  
  ISL_FORMAT_POLYLIB_CONSTRAINTS = 2;  
  ISL_FORMAT_OMEGA = 3;  
  ISL_FORMAT_C = 4;  
  ISL_FORMAT_LATEX = 5;  
  ISL_FORMAT_EXT_POLYLIB = 6;  

function isl_printer_set_output_format(p:Pisl_printer; output_format:longint):Pisl_printer;cdecl;external libisl;
function isl_printer_get_output_format(p:Pisl_printer):longint;cdecl;external libisl;
const
  ISL_YAML_STYLE_BLOCK = 0;  
  ISL_YAML_STYLE_FLOW = 1;  

function isl_printer_set_yaml_style(p:Pisl_printer; yaml_style:longint):Pisl_printer;cdecl;external libisl;
function isl_printer_get_yaml_style(p:Pisl_printer):longint;cdecl;external libisl;
function isl_printer_set_indent_prefix(p:Pisl_printer; prefix:Pchar):Pisl_printer;cdecl;external libisl;
function isl_printer_set_prefix(p:Pisl_printer; prefix:Pchar):Pisl_printer;cdecl;external libisl;
function isl_printer_set_suffix(p:Pisl_printer; suffix:Pchar):Pisl_printer;cdecl;external libisl;
function isl_printer_set_isl_int_width(p:Pisl_printer; width:longint):Pisl_printer;cdecl;external libisl;
function isl_printer_has_note(p:Pisl_printer; id:Pisl_id):Tisl_bool;cdecl;external libisl;
function isl_printer_get_note(p:Pisl_printer; id:Pisl_id):Pisl_id;cdecl;external libisl;
function isl_printer_set_note(p:Pisl_printer; id:Pisl_id; note:Pisl_id):Pisl_printer;cdecl;external libisl;
function isl_printer_start_line(p:Pisl_printer):Pisl_printer;cdecl;external libisl;
function isl_printer_end_line(p:Pisl_printer):Pisl_printer;cdecl;external libisl;
function isl_printer_print_double(p:Pisl_printer; d:Tdouble):Pisl_printer;cdecl;external libisl;
function isl_printer_print_int(p:Pisl_printer; i:longint):Pisl_printer;cdecl;external libisl;
function isl_printer_print_str(p:Pisl_printer; s:Pchar):Pisl_printer;cdecl;external libisl;
function isl_printer_yaml_start_mapping(p:Pisl_printer):Pisl_printer;cdecl;external libisl;
function isl_printer_yaml_end_mapping(p:Pisl_printer):Pisl_printer;cdecl;external libisl;
function isl_printer_yaml_start_sequence(p:Pisl_printer):Pisl_printer;cdecl;external libisl;
function isl_printer_yaml_end_sequence(p:Pisl_printer):Pisl_printer;cdecl;external libisl;
function isl_printer_yaml_next(p:Pisl_printer):Pisl_printer;cdecl;external libisl;
function isl_printer_flush(p:Pisl_printer):Pisl_printer;cdecl;external libisl;
{$endif}

// === Konventiert am: 5-11-26 15:51:30 ===


implementation



end.
