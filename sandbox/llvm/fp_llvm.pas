unit fp_llvm;

interface

const
  {$IFDEF Linux}
  libllvm = 'LLVM-20';
  {$ENDIF}

  {$IFDEF Windows}
  libllvm = 'LLVM-20.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
//  {$include fp_llvm_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
//  {$include fp_llvm_includes.inc}
{$UNDEF read_implementation}

end.

