unit fp_virt;

interface

const
  {$IFDEF Linux}
  libvirt = 'virt';
  libc='c';
  {$ENDIF}

  {$IFDEF Windows}
  libvirt = 'virt.dll';
  libc = 'msvcrt.dll';
    {$ENDIF}


type
  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

procedure free(p: Pointer); cdecl; external libc;
function execvp(f: pchar; argv: PPchar): longint; cdecl; external libc;



  {$DEFINE read_interface}
  {$include fp_virt_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include fp_virt_includes.inc}
{$UNDEF read_implementation}

end.
