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


//  type
//  PAtspiApplication=Pointer;
//  PAtspiAccessible=Pointer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  type
  Ttimeval=Int64;

  PDBusConnection=type Pointer;
  PDBusServer=type Pointer;
  PDBusMessageIter=type Pointer;


  {$DEFINE read_enum}
  {$include fp_atspi_includes.inc}
  {$UNDEF read_enum}

  {$DEFINE read_struct}
  {$include fp_atspi_includes.inc}
  {$UNDEF read_struct}

  {$DEFINE read_function}
  {$include fp_atspi_includes.inc}
  {$UNDEF read_function}

implementation

{$DEFINE read_implementation}
{$include fp_atspi_includes.inc}
{$UNDEF read_implementation}

end.

