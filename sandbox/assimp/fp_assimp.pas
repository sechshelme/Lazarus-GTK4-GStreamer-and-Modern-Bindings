unit fp_assimp;

interface

const
  {$IFDEF Linux}
  libassimp = 'assimp';
  {$ENDIF}

  {$IFDEF Windows}
  libassimp = 'libassimp-6.dll';
  {$ENDIF}

  type
  Tint32_t=Int32;
  Tuint32_t=UInt32;

  Tsize_t=SizeUInt;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
//  {$include fp_assimp_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
//  {$include fp_assimp_includes.inc}
{$UNDEF read_implementation}

end.
