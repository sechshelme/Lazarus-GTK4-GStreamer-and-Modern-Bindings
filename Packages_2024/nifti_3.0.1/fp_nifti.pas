unit fp_nifti;

interface

const
  {$IFDEF Linux}
  libniftiio = 'niftiio';
  libnifti2 = 'nifti2';
  libnifticdf = 'nifticdf';
  libznz = 'znz';
  {$ENDIF}

  {$IFDEF Windows}
  libnifti2 = 'nifti2.dll';
  libniftiio = 'niftiio.dll';
  libnifticdf = 'nifticdf.dll';
  libznz = 'znz.dll';
  {$ENDIF}

type
  Tint8_t = int8;
  Pint8_t = ^Tint8_t;

  Tint16_t = int16;
  Pint16_t = ^Tint16_t;

  Tint32_t = int32;
  Pint32_t = ^Tint32_t;

  Tint64_t = int64;
  Pint64_t = ^Tint64_t;

  Tsize_t = SizeUInt;
  PFILE = type Pointer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include nifti/znzlib.inc}
  {$include nifti/nifti1.inc}
  {$include nifti/nifti1_io.inc}
  {$include nifti/nifticdf.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include nifti/znzlib.inc}
{$include nifti/nifti1.inc}
{$include nifti/nifti1_io.inc}
{$include nifti/nifticdf.inc}
{$UNDEF read_implementation}

end.
