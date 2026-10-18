unit fp_virtgconfig;

interface

uses
fp_glib2;

const
  {$IFDEF Linux}
  libvirtgconfig = 'libvirt-gconfig-1.0';
  {$ENDIF}

  {$IFDEF Windows}
  libvirtgconfig = 'libvirt-gconfig-1.0.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

implementation

end.

