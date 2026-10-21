unit fp_gvnc;

interface

uses
  fp_virt,
  fp_glib2;

const
  {$IFDEF Linux}
  libgvnc = 'libgvnc-1.0';
  libgvncpulse = 'libgvncpulse-1.0';
  {$ENDIF}

  {$IFDEF Windows}
  libgvnc = 'libgvnc-1.0.dll';
  libgvncpulse = 'libgvncpulse-1.0-dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_gvnc_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_gvnc_includes.inc}
{$UNDEF read_implementation}


end.
