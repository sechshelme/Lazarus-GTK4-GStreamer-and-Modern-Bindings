unit atspi_gmain;

interface

uses
  fp_glib2, fp_atspi;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure atspi_dbus_connection_setup_with_g_main(connection: PDBusConnection; context: PGMainContext); cdecl; external libatspi;
procedure atspi_dbus_server_setup_with_g_main(server: PDBusServer; context: PGMainContext); cdecl; external libatspi;

// === Konventiert am: 26-9-26 13:07:56 ===


implementation



end.
