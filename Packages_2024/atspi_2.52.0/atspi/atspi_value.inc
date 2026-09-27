

  {$IFDEF read_struct}
type
  PAtspiValue = ^TAtspiValue;
  TAtspiValue = record
    parent: TGTypeInterface;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function atspi_value_get_type: TGType; cdecl; external libatspi;
function atspi_value_get_minimum_value(obj: PAtspiValue; error: PPGError): Tgdouble; cdecl; external libatspi;
function atspi_value_get_current_value(obj: PAtspiValue; error: PPGError): Tgdouble; cdecl; external libatspi;
function atspi_value_get_maximum_value(obj: PAtspiValue; error: PPGError): Tgdouble; cdecl; external libatspi;
function atspi_value_set_current_value(obj: PAtspiValue; new_value: Tgdouble; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_value_get_minimum_increment(obj: PAtspiValue; error: PPGError): Tgdouble; cdecl; external libatspi;
function atspi_value_get_text(obj: PAtspiValue; error: PPGError): Pgchar; cdecl; external libatspi;

// === Konventiert am: 26-9-26 13:14:40 ===

function ATSPI_TYPE_VALUE: TGType;
function ATSPI_VALUE(obj: Pointer): PAtspiValue;
function ATSPI_IS_VALUE(obj: Pointer): Tgboolean;
function ATSPI_VALUE_GET_IFACE(obj: Pointer): PAtspiValue;
{$ENDIF read_function}


{$IFDEF read_implementation}

function ATSPI_TYPE_VALUE: TGType;
begin
  ATSPI_TYPE_VALUE := atspi_value_get_type;
end;

function ATSPI_VALUE(obj: Pointer): PAtspiValue;
begin
  Result := PAtspiValue(g_type_check_instance_cast(obj, ATSPI_TYPE_VALUE));
end;

function ATSPI_IS_VALUE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ATSPI_TYPE_VALUE);
end;

function ATSPI_VALUE_GET_IFACE(obj: Pointer): PAtspiValue;
begin
  Result := g_type_interface_peek(obj, ATSPI_TYPE_VALUE);
end;



{$ENDIF read_implementation}
