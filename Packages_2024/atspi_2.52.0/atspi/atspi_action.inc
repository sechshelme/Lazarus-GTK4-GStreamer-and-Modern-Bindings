

  {$IFDEF read_struct}
type
  PAtspiAction = ^TAtspiAction;
  TAtspiAction = record
    parent: TGTypeInterface;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function atspi_action_get_type: TGType; cdecl; external libatspi;
function atspi_action_get_action_description(obj: PAtspiAction; i: longint; error: PPGError): Pgchar; cdecl; external libatspi;
function atspi_action_get_action_name(obj: PAtspiAction; i: Tgint; error: PPGError): Pgchar; cdecl; external libatspi;
function atspi_action_get_n_actions(obj: PAtspiAction; error: PPGError): Tgint; cdecl; external libatspi;
function atspi_action_get_key_binding(obj: PAtspiAction; i: Tgint; error: PPGError): Pgchar; cdecl; external libatspi;
function atspi_action_get_localized_name(obj: PAtspiAction; i: Tgint; error: PPGError): Pgchar; cdecl; external libatspi;
function atspi_action_do_action(obj: PAtspiAction; i: Tgint; error: PPGError): Tgboolean; cdecl; external libatspi;

function atspi_action_get_description(obj: PAtspiAction; i: Tgint; error: PPGError): Pgchar; cdecl; external libatspi; deprecated;
function atspi_action_get_name(obj: PAtspiAction; i: Tgint; error: PPGError): Pgchar; cdecl; external libatspi; deprecated;

// === Konventiert am: 26-9-26 12:58:37 ===

function ATSPI_TYPE_ACTION: TGType;
function ATSPI_ACTION(obj: Pointer): PAtspiAction;
function ATSPI_IS_ACTION(obj: Pointer): Tgboolean;
function ATSPI_ACTION_GET_IFACE(obj: Pointer): PAtspiAction;
{$ENDIF read_function}


{$IFDEF read_implementation}

function ATSPI_TYPE_ACTION: TGType;
begin
  ATSPI_TYPE_ACTION := atspi_action_get_type;
end;

function ATSPI_ACTION(obj: Pointer): PAtspiAction;
begin
  Result := PAtspiAction(g_type_check_instance_cast(obj, ATSPI_TYPE_ACTION));
end;

function ATSPI_IS_ACTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ATSPI_TYPE_ACTION);
end;

function ATSPI_ACTION_GET_IFACE(obj: Pointer): PAtspiAction;
begin
  Result := g_type_interface_peek(obj, ATSPI_TYPE_ACTION);
end;



{$ENDIF read_implementation}
