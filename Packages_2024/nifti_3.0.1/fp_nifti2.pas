unit fp_nifti2;

interface

uses
  fp_nifti;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include nifti/znzlib.inc}
  {$include nifti/nifticdf.inc}
  //{$include nifti/nifti1.inc}
//  {$include nifti/nifti1_io.inc}
  {$include nifti/nifti2.inc}
  {$include nifti/nifti2_io.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include nifti/znzlib.inc}
{$include nifti/nifticdf.inc}
//{$include nifti/nifti1.inc}
//{$include nifti/nifti1_io.inc}
{$include nifti/nifti2.inc}
{$include nifti/nifti2_io.inc}
{$UNDEF read_implementation}

end.
