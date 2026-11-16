unit fp_mb;

interface

uses
  x, xlib, xutil, xft, fp_pango;

const
  {$IFDEF Linux}
  libmb = 'mb';
  {$ENDIF}

  {$IFDEF Windows}
  {$FATAL  no supported}
  {$ENDIF}

type
  Tsize_t = SizeUInt;
  Ptimeval = type Pointer;

  {$DEFINE read_interface}
  {$include fp_mb_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include fp_mb_includes.inc}
{$UNDEF read_implementation}

end.
