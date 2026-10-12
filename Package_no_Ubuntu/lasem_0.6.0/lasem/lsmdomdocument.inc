{$IFDEF read_interface}


type
  TLsmDomDocumentClass = record
    parent_class: TLsmDomNodeClass;
    get_document_element: function(self: PLsmDomDocument): PLsmDomElement; cdecl;
    create_element: function(self: PLsmDomDocument; tag_name: pchar): PLsmDomElement; cdecl;
    create_text_node: function(self: PLsmDomDocument; data: pchar): PLsmDomText; cdecl;
    create_view: function(self: PLsmDomDocument): PLsmDomView; cdecl;
  end;
  PLsmDomDocumentClass = ^TLsmDomDocumentClass;

function lsm_dom_document_get_type: TGType; cdecl; external liblasem;
function lsm_dom_document_get_document_element(self: PLsmDomDocument): PLsmDomElement; cdecl; external liblasem;
function lsm_dom_document_create_element(self: PLsmDomDocument; tag_name: pchar): PLsmDomElement; cdecl; external liblasem;
function lsm_dom_document_create_text_node(self: PLsmDomDocument; data: pchar): PLsmDomText; cdecl; external liblasem;
function lsm_dom_document_create_view(self: PLsmDomDocument): PLsmDomView; cdecl; external liblasem;
function lsm_dom_document_get_url(self: PLsmDomDocument): pchar; cdecl; external liblasem;
procedure lsm_dom_document_set_url(self: PLsmDomDocument; url: pchar); cdecl; external liblasem;
procedure lsm_dom_document_set_path(self: PLsmDomDocument; path: pchar); cdecl; external liblasem;
function lsm_dom_document_get_href_data(self: PLsmDomDocument; href: pchar; size: Pgsize): pointer; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:11:52 ===

function LSM_TYPE_DOM_DOCUMENT: TGType;
function LSM_DOM_DOCUMENT(obj: Pointer): PLsmDomDocument;
function LSM_DOM_DOCUMENT_CLASS(klass: Pointer): PLsmDomDocumentClass;
function LSM_IS_DOM_DOCUMENT(obj: Pointer): Tgboolean;
function LSM_IS_DOM_DOCUMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_DOM_DOCUMENT_GET_CLASS(obj: Pointer): PLsmDomDocumentClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_DOM_DOCUMENT: TGType;
begin
  LSM_TYPE_DOM_DOCUMENT := lsm_dom_document_get_type;
end;

function LSM_DOM_DOCUMENT(obj: Pointer): PLsmDomDocument;
begin
  Result := PLsmDomDocument(g_type_check_instance_cast(obj, LSM_TYPE_DOM_DOCUMENT));
end;

function LSM_DOM_DOCUMENT_CLASS(klass: Pointer): PLsmDomDocumentClass;
begin
  Result := PLsmDomDocumentClass(g_type_check_class_cast(klass, LSM_TYPE_DOM_DOCUMENT));
end;

function LSM_IS_DOM_DOCUMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_DOM_DOCUMENT);
end;

function LSM_IS_DOM_DOCUMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_DOM_DOCUMENT);
end;

function LSM_DOM_DOCUMENT_GET_CLASS(obj: Pointer): PLsmDomDocumentClass;
begin
  Result := PLsmDomDocumentClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
