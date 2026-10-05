unit fp_clang;

interface

const
  {$IFDEF Linux}
  libclang = 'clang-20';
  {$ENDIF}

  {$IFDEF Windows}
  libclang = 'clang-20.dll';
  {$ENDIF}

type
  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;

  Ttime_t = uint64;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_clang_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include fp_clang_includes.inc}
{$UNDEF read_implementation}

end.
