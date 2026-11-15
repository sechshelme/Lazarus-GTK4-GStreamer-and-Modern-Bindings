unit fp_mb;

interface

const
  {$IFDEF Linux}
  libmb = 'mb';
  {$ENDIF}

  {$IFDEF Windows}
  {$FATAL  no supported}
  {$ENDIF}

  {$DEFINE read_interface}
//  {$include fp_mb_includes.inc}
  {$UNDEF read_interface}

  implementation

  {$DEFINE read_implementation}
  //  {$include fp_mb_includes.inc}
  {$UNDEF read_implementation}

end.

