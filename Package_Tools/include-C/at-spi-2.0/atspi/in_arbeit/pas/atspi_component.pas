unit atspi_component;

interface

uses
  fp_glib2, fp_atspi, atspi_constants;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAtspiRect = ^TAtspiRect;
  TAtspiRect = record
    x: Tgint;
    y: Tgint;
    width: Tgint;
    height: Tgint;
  end;

function atspi_rect_get_type: TGType; cdecl; external libatspi;
function atspi_rect_copy(src: PAtspiRect): PAtspiRect; cdecl; external libatspi;

type
  PAtspiPoint = ^TAtspiPoint;
  TAtspiPoint = record
    x: Tgint;
    y: Tgint;
  end;

function atspi_point_get_type: TGType; cdecl; external libatspi;
function atspi_point_copy(src: PAtspiPoint): PAtspiPoint; cdecl; external libatspi;

function atspi_component_get_type: TGType; cdecl; external libatspi;

type
  PAtspiComponent = ^TAtspiComponent;
  TAtspiComponent = record
    parent: TGTypeInterface;
  end;

function atspi_component_contains(obj: PAtspiComponent; x: Tgint; y: Tgint; ctype: TAtspiCoordType; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_component_get_accessible_at_point(obj: PAtspiComponent; x: Tgint; y: Tgint; ctype: TAtspiCoordType; error: PPGError): PAtspiAccessible; cdecl; external libatspi;
function atspi_component_get_extents(obj: PAtspiComponent; ctype: TAtspiCoordType; error: PPGError): PAtspiRect; cdecl; external libatspi;
function atspi_component_get_position(obj: PAtspiComponent; ctype: TAtspiCoordType; error: PPGError): PAtspiPoint; cdecl; external libatspi;
function atspi_component_get_size(obj: PAtspiComponent; error: PPGError): PAtspiPoint; cdecl; external libatspi;
function atspi_component_get_layer(obj: PAtspiComponent; error: PPGError): TAtspiComponentLayer; cdecl; external libatspi;
function atspi_component_get_mdi_z_order(obj: PAtspiComponent; error: PPGError): Tgshort; cdecl; external libatspi;
function atspi_component_grab_focus(obj: PAtspiComponent; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_component_get_alpha(obj: PAtspiComponent; error: PPGError): Tgdouble; cdecl; external libatspi;
function atspi_component_set_extents(obj: PAtspiComponent; x: Tgint; y: Tgint; width: Tgint; height: Tgint;
  ctype: TAtspiCoordType; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_component_set_position(obj: PAtspiComponent; x: Tgint; y: Tgint; ctype: TAtspiCoordType; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_component_set_size(obj: PAtspiComponent; width: Tgint; height: Tgint; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_component_scroll_to(obj: PAtspiComponent; _type: TAtspiScrollType; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_component_scroll_to_point(obj: PAtspiComponent; coords: TAtspiCoordType; x: Tgint; y: Tgint; error: PPGError): Tgboolean; cdecl; external libatspi;

function ATSPI_TYPE_RECT: TGType;
function ATSPI_TYPE_POINT: TGType;

// === Konventiert am: 26-9-26 12:56:18 ===

function ATSPI_TYPE_COMPONENT: TGType;
function ATSPI_COMPONENT(obj: Pointer): PAtspiComponent;
function ATSPI_IS_COMPONENT(obj: Pointer): Tgboolean;
function ATSPI_COMPONENT_GET_IFACE(obj: Pointer): PAtspiComponent;

implementation

function ATSPI_TYPE_COMPONENT: TGType;
begin
  ATSPI_TYPE_COMPONENT := atspi_component_get_type;
end;

function ATSPI_COMPONENT(obj: Pointer): PAtspiComponent;
begin
  Result := PAtspiComponent(g_type_check_instance_cast(obj, ATSPI_TYPE_COMPONENT));
end;

function ATSPI_IS_COMPONENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ATSPI_TYPE_COMPONENT);
end;

function ATSPI_COMPONENT_GET_IFACE(obj: Pointer): PAtspiComponent;
begin
  Result := g_type_interface_peek(obj, ATSPI_TYPE_COMPONENT);
end;


function ATSPI_TYPE_RECT: TGType;
begin
  ATSPI_TYPE_RECT := atspi_rect_get_type;
end;

function ATSPI_TYPE_POINT: TGType;
begin
  ATSPI_TYPE_POINT := atspi_point_get_type;
end;


end.
