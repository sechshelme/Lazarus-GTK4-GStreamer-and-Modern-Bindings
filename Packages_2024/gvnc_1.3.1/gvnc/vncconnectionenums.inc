{$IFDEF read_interface}


function VNC_TYPE_CONNECTION_ENCODING: TGType;

function vnc_connection_encoding_get_type: TGType; cdecl; external libgvnc;
function VNC_TYPE_CONNECTION_AUTH: TGType;

function vnc_connection_auth_get_type: TGType; cdecl; external libgvnc;
function VNC_TYPE_CONNECTION_AUTH_VENCRYPT: TGType;

function vnc_connection_auth_vencrypt_get_type: TGType; cdecl; external libgvnc;
function VNC_TYPE_CONNECTION_CREDENTIAL: TGType;

function vnc_connection_credential_get_type: TGType; cdecl; external libgvnc;
function VNC_TYPE_CONNECTION_POWER_ACTION: TGType;

function vnc_connection_power_action_get_type: TGType; cdecl; external libgvnc;
function VNC_TYPE_CONNECTION_RESIZE_STATUS: TGType;

function vnc_connection_resize_status_get_type: TGType; cdecl; external libgvnc;

// === Konventiert am: 20-10-26 19:50:42 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function VNC_TYPE_CONNECTION_ENCODING: TGType;
begin
  VNC_TYPE_CONNECTION_ENCODING := vnc_connection_encoding_get_type;
end;

function VNC_TYPE_CONNECTION_AUTH: TGType;
begin
  VNC_TYPE_CONNECTION_AUTH := vnc_connection_auth_get_type;
end;

function VNC_TYPE_CONNECTION_AUTH_VENCRYPT: TGType;
begin
  VNC_TYPE_CONNECTION_AUTH_VENCRYPT := vnc_connection_auth_vencrypt_get_type;
end;

function VNC_TYPE_CONNECTION_CREDENTIAL: TGType;
begin
  VNC_TYPE_CONNECTION_CREDENTIAL := vnc_connection_credential_get_type;
end;

function VNC_TYPE_CONNECTION_POWER_ACTION: TGType;
begin
  VNC_TYPE_CONNECTION_POWER_ACTION := vnc_connection_power_action_get_type;
end;

function VNC_TYPE_CONNECTION_RESIZE_STATUS: TGType;
begin
  VNC_TYPE_CONNECTION_RESIZE_STATUS := vnc_connection_resize_status_get_type;
end;


{$ENDIF read_implementation}
