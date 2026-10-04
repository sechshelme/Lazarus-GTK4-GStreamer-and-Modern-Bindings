unit fp_clang;

interface

const
  {$IFDEF Linux}
  libgclang = 'clang'; // ????
  {$ENDIF}

  {$IFDEF Windows}
  libclang = 'clang.dll';
  {$ENDIF}


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
//  {$include fp_clang_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
//  {$include fp_clang_includes.inc}
{$UNDEF read_implementation}

end.

