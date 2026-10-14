unit fp_virt;

interface

const
  {$IFDEF Linux}
  libvirt = 'virt';
  {$ENDIF}

  {$IFDEF Windows}
  libvirt = 'virt.dll';
  {$ENDIF}


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
//  {$include fp_virt_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
//  {$include fp_virt_includes.inc}
{$UNDEF read_implementation}

end.
