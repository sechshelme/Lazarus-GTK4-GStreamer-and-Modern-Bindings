unit fp_lasem;

interface

uses
  fp_glib2, fp_gdk_pixbuf2, fp_pango, fp_cairo;


const
  {$ifdef linux}
  liblasem = 'lasem-0.6';
  {$endif}

  {$ifdef windows}
  liblasem = 'liblasem-0.6-0.dll';
  {$endif}


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PLsmSvgView = type Pointer;
  PLsmSvgElement = type Pointer;
  PLsmSvgStyle = type Pointer;

  {$DEFINE read_interface}
  {$include fp_lasem_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include fp_lasem_includes.inc}
{$UNDEF read_implementation}

end.
