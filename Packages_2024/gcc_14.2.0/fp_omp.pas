unit fp_omp;

interface

const
  {$IFDEF Linux}
  libgomp = 'gomp';
  {$ENDIF}

  {$IFDEF Windows}
  libgomp = 'libgomp-1.dll';
  {$ENDIF}

type
  Tbool = boolean;

  Tuintptr_t = PtrUInt;
  Puintptr_t = ^Tuintptr_t;

  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;

type
  {$IFDEF Linux}
  Tculong = uint64;
  Tclong = int64;
  {$ENDIF}
  {$IFDEF windows}
  Tculong = uint32;
  Tclong = int32;
  {$ENDIF}
  Pculong = ^Tculong;
  Pclong = ^Tclong;

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
