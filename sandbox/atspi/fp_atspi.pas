unit fp_atspi;

interface

uses
  fp_glib2;

const
  {$IFDEF Linux}
  libatspi = 'atspi';
  {$ENDIF}

  {$IFDEF Windows}
  {$FATAL  no supported}
  {$ENDIF}


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
//  {$include fp_atspi_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
//  {$include fp_atspi_includes.inc}
{$UNDEF read_implementation}

end.

