unit atspi_hypertext;

interface

uses
  fp_glib2, fp_atspi, atspi_hyperlink;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function atspi_hypertext_get_type: TGType; cdecl; external libatspi;

type
  PAtspiHypertext = ^TAtspiHypertext;
  TAtspiHypertext = record
    parent: TGTypeInterface;
  end;

function atspi_hypertext_get_n_links(obj: PAtspiHypertext; error: PPGError): Tgint; cdecl; external libatspi;
function atspi_hypertext_get_link(obj: PAtspiHypertext; link_index: Tgint; error: PPGError): PAtspiHyperlink; cdecl; external libatspi;
function atspi_hypertext_get_link_index(obj: PAtspiHypertext; character_offset: Tgint; error: PPGError): Tgint; cdecl; external libatspi;

// === Konventiert am: 26-9-26 13:06:58 ===

function ATSPI_TYPE_HYPERTEXT: TGType;
function ATSPI_HYPERTEXT(obj: Pointer): PAtspiHypertext;
function ATSPI_IS_HYPERTEXT(obj: Pointer): Tgboolean;
function ATSPI_HYPERTEXT_GET_IFACE(obj: Pointer): PAtspiHypertext;

implementation

function ATSPI_TYPE_HYPERTEXT: TGType;
begin
  ATSPI_TYPE_HYPERTEXT := atspi_hypertext_get_type;
end;

function ATSPI_HYPERTEXT(obj: Pointer): PAtspiHypertext;
begin
  Result := PAtspiHypertext(g_type_check_instance_cast(obj, ATSPI_TYPE_HYPERTEXT));
end;

function ATSPI_IS_HYPERTEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ATSPI_TYPE_HYPERTEXT);
end;

function ATSPI_HYPERTEXT_GET_IFACE(obj: Pointer): PAtspiHypertext;
begin
  Result := g_type_interface_peek(obj, ATSPI_TYPE_HYPERTEXT);
end;



end.
