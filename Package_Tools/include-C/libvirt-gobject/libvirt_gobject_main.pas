unit libvirt_gobject_main;

interface

uses
  fp_glib2, fp_virt_glib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure gvir_init_object(argc: Plongint; argv: PPPchar); cdecl; external libvirtgobject;
function gvir_init_object_check(argc: Plongint; argv: PPPchar; err: PPGError): Tgboolean; cdecl; external libvirtgobject;

// === Konventiert am: 18-10-26 19:32:54 ===


implementation



end.
