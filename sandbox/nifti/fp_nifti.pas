unit fp_nifti;

interface

const
  {$IFDEF Linux}
  libniftiio = 'niftiio'; // ???
  {$ENDIF}

  {$IFDEF Windows}
  libnifti = 'niftiio.dll';
  {$ENDIF}

type
  Tint8_t   = Int8;
  Pint8_t   = ^Tint8_t;

  Tint16_t  = Int16;
  Pint16_t  = ^Tint16_t;

  Tint32_t  = Int32;
  Pint32_t  = ^Tint32_t;

  Tint64_t  = Int64;
  Pint64_t  = ^Tint64_t;

  Tsize_t=SizeUInt;
  PFILE=type Pointer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
//  {$include fp_nadwaita_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
//{$include fp_adwaita_includes.inc}
{$UNDEF read_implementation}

end.

