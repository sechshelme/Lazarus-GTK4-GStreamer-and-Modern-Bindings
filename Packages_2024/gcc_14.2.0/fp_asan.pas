unit fp_asan;

interface

uses
  fp_gcc_common;

const
  {$IFDEF Linux}
  libasan = 'asan';
  {$ENDIF}

  {$IFDEF Windows}
  libasan = 'libasan-1.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include sanitizer/asan_interface.inc}
  {$include sanitizer/common_interface_defs.inc}
  {$include sanitizer/hwasan_interface.inc}
  {$include sanitizer/lsan_interface.inc}
  {$include sanitizer/tsan_interface.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include sanitizer/asan_interface.inc}
{$include sanitizer/common_interface_defs.inc}
{$include sanitizer/hwasan_interface.inc}
{$include sanitizer/lsan_interface.inc}
{$include sanitizer/tsan_interface.inc}
{$UNDEF read_implementation}

end.
