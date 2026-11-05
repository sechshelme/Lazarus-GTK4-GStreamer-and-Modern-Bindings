unit printer_type;

interface

uses
  fp_isl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ISL_PRINTER_TYPE_H}
{$define ISL_PRINTER_TYPE_H}
{$if defined(__cplusplus)}
{$endif}
type
  Pisl_printer = ^Tisl_printer;
  Tisl_printer = record
      {undefined structure}
    end;

{$endif}

// === Konventiert am: 5-11-26 15:51:27 ===


implementation



end.
