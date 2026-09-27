unit atspi_misc;

interface

uses
  fp_glib2, fp_atspi, atspi_constants;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function atspi_init: longint; cdecl; external libatspi;
function atspi_is_initialized: Tgboolean; cdecl; external libatspi;
procedure atspi_event_main; cdecl; external libatspi;
procedure atspi_event_quit; cdecl; external libatspi;
function atspi_exit: longint; cdecl; external libatspi;
function atspi_get_a11y_bus: PDBusConnection; cdecl; external libatspi;
procedure atspi_set_timeout(val: Tgint; startup_time: Tgint); cdecl; external libatspi;
procedure atspi_set_main_context(cnx: PGMainContext); cdecl; external libatspi;
function atspi_role_get_name(role: TAtspiRole): Pgchar; cdecl; external libatspi;
function atspi_role_get_localized_name(role: TAtspiRole): Pgchar; cdecl; external libatspi;
procedure atspi_get_version(major: Pgint; minor: Pgint; micro: Pgint); cdecl; external libatspi;

// === Konventiert am: 26-9-26 13:04:50 ===


implementation



end.
