unit fp_virt_glib;

interface

uses
  fp_virt,
  fp_glib2;

const
  {$IFDEF Linux}
  libvirtgconfig = 'virt-gconfig-1.0';
  libvirtglib = 'virt-glib-1.0';
  libvirtgobject = 'virt-gobject-1.0';

  {$ENDIF}

  {$IFDEF Windows}
  libvirtgconfig = 'libvirt-gconfig-1.0.dll';
  libvirtglib = 'libvirt-glib-1.0.dll';
  libvirtgobject = 'libvirt-gobject-1.0.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_virt_glib_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_virt_glib_includes.inc}
{$UNDEF read_implementation}

end.
