unit atspi_image;

interface

uses
  fp_glib2, fp_atspi, atspi_component, atspi_constants;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function atspi_image_get_type: TGType; cdecl; external libatspi;

type
  PAtspiImage = ^TAtspiImage;
  TAtspiImage = record
    parent: TGTypeInterface;
  end;

function atspi_image_get_image_description(obj: PAtspiImage; error: PPGError): Pgchar; cdecl; external libatspi;
function atspi_image_get_image_size(obj: PAtspiImage; error: PPGError): PAtspiPoint; cdecl; external libatspi;
function atspi_image_get_image_position(obj: PAtspiImage; ctype: TAtspiCoordType; error: PPGError): PAtspiPoint; cdecl; external libatspi;
function atspi_image_get_image_extents(obj: PAtspiImage; ctype: TAtspiCoordType; error: PPGError): PAtspiRect; cdecl; external libatspi;
function atspi_image_get_image_locale(obj: PAtspiImage; error: PPGError): Pgchar; cdecl; external libatspi;

// === Konventiert am: 26-9-26 13:06:00 ===

function ATSPI_TYPE_IMAGE: TGType;
function ATSPI_IMAGE(obj: Pointer): PAtspiImage;
function ATSPI_IS_IMAGE(obj: Pointer): Tgboolean;
function ATSPI_IMAGE_GET_IFACE(obj: Pointer): PAtspiImage;

implementation

function ATSPI_TYPE_IMAGE: TGType;
begin
  ATSPI_TYPE_IMAGE := atspi_image_get_type;
end;

function ATSPI_IMAGE(obj: Pointer): PAtspiImage;
begin
  Result := PAtspiImage(g_type_check_instance_cast(obj, ATSPI_TYPE_IMAGE));
end;

function ATSPI_IS_IMAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ATSPI_TYPE_IMAGE);
end;

function ATSPI_IMAGE_GET_IFACE(obj: Pointer): PAtspiImage;
begin
  Result := g_type_interface_peek(obj, ATSPI_TYPE_IMAGE);
end;



end.
