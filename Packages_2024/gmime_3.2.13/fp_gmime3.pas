unit fp_gmime3;

interface

uses
  fp_glib2;

const
  {$IFDEF Linux}
  libgmime3 = 'gmime-3.0';
  {$ENDIF}

  {$IFDEF Windows}
  libgmime3 = 'libgmime-3.0-0.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;

  Tssize_t = SizeInt;

const  // libc
  SEEK_SET = 0;
  SEEK_CUR = 1;
  SEEK_END = 2;

type // Herkunft unbekannte
  Pcat_node = type Pointer;
  Ticonv_t = Pointer;

  {$DEFINE read_interface}
  {$include fp_gmime3_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_gmime3_includes.inc}
{$UNDEF read_implementation}

end.
