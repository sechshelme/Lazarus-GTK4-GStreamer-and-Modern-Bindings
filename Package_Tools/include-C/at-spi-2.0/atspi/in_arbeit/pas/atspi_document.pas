unit atspi_document;

interface

uses
  fp_glib2, fp_atspi;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function atspi_document_get_type: TGType; cdecl; external libatspi;

type
  PAtspiTextSelection = ^TAtspiTextSelection;
  TAtspiTextSelection = record
    start_object: PAtspiAccessible;
    start_offset: Tgint;
    end_object: PAtspiAccessible;
    end_offset: Tgint;
    start_is_active: Tgboolean;
  end;

  PAtspiDocument = ^TAtspiDocument;
  TAtspiDocument = record
    parent: TGTypeInterface;
  end;


function atspi_document_get_locale(obj: PAtspiDocument; error: PPGError): Pgchar; cdecl; external libatspi;

function atspi_document_get_attribute_value(obj: PAtspiDocument; attribute: Pgchar; error: PPGError): Pgchar; cdecl; external libatspi; deprecated;

function atspi_document_get_document_attribute_value(obj: PAtspiDocument; attribute: Pgchar; error: PPGError): Pgchar; cdecl; external libatspi;

function atspi_document_get_attributes(obj: PAtspiDocument; error: PPGError): PGHashTable; cdecl; external libatspi; deprecated;

function atspi_document_get_document_attributes(obj: PAtspiDocument; error: PPGError): PGHashTable; cdecl; external libatspi;
function atspi_document_get_page_count(obj: PAtspiDocument; error: PPGError): Tgint; cdecl; external libatspi;
function atspi_document_get_current_page_number(obj: PAtspiDocument; error: PPGError): Tgint; cdecl; external libatspi;
function atspi_document_get_text_selections(document: PAtspiDocument; error: PPGError): PGArray; cdecl; external libatspi;
function atspi_document_set_text_selections(document: PAtspiDocument; selections: PGArray; error: PPGError): Tgboolean; cdecl; external libatspi;

// === Konventiert am: 26-9-26 13:11:24 ===

function ATSPI_TYPE_DOCUMENT: TGType;
function ATSPI_DOCUMENT(obj: Pointer): PAtspiDocument;
function ATSPI_IS_DOCUMENT(obj: Pointer): Tgboolean;
function ATSPI_DOCUMENT_GET_IFACE(obj: Pointer): PAtspiDocument;

implementation

function ATSPI_TYPE_DOCUMENT: TGType;
begin
  ATSPI_TYPE_DOCUMENT := atspi_document_get_type;
end;

function ATSPI_DOCUMENT(obj: Pointer): PAtspiDocument;
begin
  Result := PAtspiDocument(g_type_check_instance_cast(obj, ATSPI_TYPE_DOCUMENT));
end;

function ATSPI_IS_DOCUMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ATSPI_TYPE_DOCUMENT);
end;

function ATSPI_DOCUMENT_GET_IFACE(obj: Pointer): PAtspiDocument;
begin
  Result := g_type_interface_peek(obj, ATSPI_TYPE_DOCUMENT);
end;



end.
