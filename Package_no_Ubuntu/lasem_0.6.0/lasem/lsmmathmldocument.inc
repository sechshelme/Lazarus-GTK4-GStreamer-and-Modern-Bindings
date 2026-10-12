{$IFDEF read_interface}


type
  TLsmMathmlDocument = record
    document: TLsmDomDocument;
  end;
  PLsmMathmlDocument = ^TLsmMathmlDocument;

  TLsmMathmlDocumentClass = record
    parent_class: TLsmDomDocumentClass;
  end;
  PLsmMathmlDocumentClass = ^TLsmMathmlDocumentClass;

function lsm_mathml_document_get_type: TGType; cdecl; external liblasem;
function lsm_mathml_document_new: PLsmDomDocument; cdecl; external liblasem;
function lsm_mathml_document_get_root_element(document: PLsmMathmlDocument): PLsmMathmlMathElement; cdecl; external liblasem;
function lsm_mathml_document_new_from_itex(itex: pchar; size: Tgssize; error: PPGError): PLsmMathmlDocument; cdecl; external liblasem;
function lsm_mathml_document_new_from_itex_path(url: pchar; error: PPGError): PLsmMathmlDocument; cdecl; external liblasem;
function lsm_mathml_document_new_from_itex_url(url: pchar; error: PPGError): PLsmMathmlDocument; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:39:43 ===

function LSM_TYPE_MATHML_DOCUMENT: TGType;
function LSM_MATHML_DOCUMENT(obj: Pointer): PLsmMathmlDocument;
function LSM_MATHML_DOCUMENT_CLASS(klass: Pointer): PLsmMathmlDocumentClass;
function LSM_IS_MATHML_DOCUMENT(obj: Pointer): Tgboolean;
function LSM_IS_MATHML_DOCUMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_MATHML_DOCUMENT_GET_CLASS(obj: Pointer): PLsmMathmlDocumentClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_MATHML_DOCUMENT: TGType;
begin
  LSM_TYPE_MATHML_DOCUMENT := lsm_mathml_document_get_type;
end;

function LSM_MATHML_DOCUMENT(obj: Pointer): PLsmMathmlDocument;
begin
  Result := PLsmMathmlDocument(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_DOCUMENT));
end;

function LSM_MATHML_DOCUMENT_CLASS(klass: Pointer): PLsmMathmlDocumentClass;
begin
  Result := PLsmMathmlDocumentClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_DOCUMENT));
end;

function LSM_IS_MATHML_DOCUMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_MATHML_DOCUMENT);
end;

function LSM_IS_MATHML_DOCUMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_MATHML_DOCUMENT);
end;

function LSM_MATHML_DOCUMENT_GET_CLASS(obj: Pointer): PLsmMathmlDocumentClass;
begin
  Result := PLsmMathmlDocumentClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
