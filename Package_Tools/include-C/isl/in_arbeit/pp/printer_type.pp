
unit printer_type;
interface

{
  Automatically converted by H2Pas 1.0.0 from printer_type.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    printer_type.h
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
Pisl_printer  = ^isl_printer;
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

implementation


end.
