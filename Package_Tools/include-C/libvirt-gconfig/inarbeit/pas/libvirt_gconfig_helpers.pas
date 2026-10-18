unit libvirt_gconfig_helpers;

interface

uses
  fp_glib2, fp_virtgconfig;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gvir_config_object_error_quark: TGQuark; cdecl; external libvirtgconfig;

function GVIR_CONFIG_OBJECT_ERROR: TGQuark;


// === Konventiert am: 18-10-26 12:53:31 ===


implementation


function GVIR_CONFIG_OBJECT_ERROR: TGQuark;
begin
  GVIR_CONFIG_OBJECT_ERROR := gvir_config_object_error_quark;
end;


end.
