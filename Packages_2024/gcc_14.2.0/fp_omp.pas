unit fp_omp;

interface

uses
  fp_gcc_common;

const
  {$IFDEF Linux}
  libgomp = 'gomp';
  {$ENDIF}

  {$IFDEF Windows}
  libgomp = 'libgomp-1.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include omp/omp.inc}
  {$include omp/libgomp_g.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include omp/omp.inc}
{$include omp/libgomp_g.inc}
{$UNDEF read_implementation}

end.
