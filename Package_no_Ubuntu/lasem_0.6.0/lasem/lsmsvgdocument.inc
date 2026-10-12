{$IFDEF read_interface}


function lsm_svg_document_get_type: TGType; cdecl; external liblasem;
function lsm_svg_document_new: PLsmDomDocument; cdecl; external liblasem;
function lsm_svg_document_get_root_element(document: PLsmSvgDocument): PLsmSvgSvgElement; cdecl; external liblasem;
function lsm_svg_document_get_element_by_url(document: PLsmSvgDocument; url: pchar): PLsmSvgElement; cdecl; external liblasem;
function lsm_svg_document_get_element_by_id(self: PLsmSvgDocument; id: pchar): PLsmSvgElement; cdecl; external liblasem;
procedure lsm_svg_document_register_element(self: PLsmSvgDocument; element: PLsmSvgElement; id: pchar; old_id: pchar); cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:58:52 ===

function LSM_TYPE_SVG_DOCUMENT: TGType;
function LSM_SVG_DOCUMENT(obj: Pointer): PLsmSvgDocument;
function LSM_SVG_DOCUMENT_CLASS(klass: Pointer): PLsmSvgDocumentClass;
function LSM_IS_SVG_DOCUMENT(obj: Pointer): Tgboolean;
function LSM_IS_SVG_DOCUMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_DOCUMENT_GET_CLASS(obj: Pointer): PLsmSvgDocumentClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_DOCUMENT: TGType;
begin
  LSM_TYPE_SVG_DOCUMENT := lsm_svg_document_get_type;
end;

function LSM_SVG_DOCUMENT(obj: Pointer): PLsmSvgDocument;
begin
  Result := PLsmSvgDocument(g_type_check_instance_cast(obj, LSM_TYPE_SVG_DOCUMENT));
end;

function LSM_SVG_DOCUMENT_CLASS(klass: Pointer): PLsmSvgDocumentClass;
begin
  Result := PLsmSvgDocumentClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_DOCUMENT));
end;

function LSM_IS_SVG_DOCUMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_DOCUMENT);
end;

function LSM_IS_SVG_DOCUMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_DOCUMENT);
end;

function LSM_SVG_DOCUMENT_GET_CLASS(obj: Pointer): PLsmSvgDocumentClass;
begin
  Result := PLsmSvgDocumentClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
