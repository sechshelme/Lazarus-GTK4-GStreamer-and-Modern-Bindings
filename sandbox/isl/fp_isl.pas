unit fp_isl;

interface

const
  {$IFDEF Linux}
  libisl = 'isl';
  {$ENDIF}

  {$IFDEF Windows}
  libisl = 'libisl-23.dll';
  {$ENDIF}

  type
  Tsize_t=SizeUInt;


{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}



// === Konventiert am: 5-11-26 16:55:29 ===


{$DEFINE read_interface}
//{$include fp_isl_includes.inc}
{$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
//{$include fp_isl_includes.inc}
{$UNDEF read_implementation}


end.
