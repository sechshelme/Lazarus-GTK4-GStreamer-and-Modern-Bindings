{$IFDEF read_interface}


type
  TLsmDomDocumentFragment = record
    node: TLsmDomNode;
  end;
  PLsmDomDocumentFragment = ^TLsmDomDocumentFragment;

  TLsmDomDocumentFragmentClass = record
    parent_class: TLsmDomNodeClass;
  end;
  PLsmDomDocumentFragmentClass = ^TLsmDomDocumentFragmentClass;

function lsm_dom_document_fragment_get_type: TGType; cdecl; external liblasem;
function lsm_dom_document_fragment_new: PLsmDomDocumentFragment; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:11:59 ===

function LSM_TYPE_DOM_DOCUMENT_FRAGMENT: TGType;
function LSM_DOM_DOCUMENT_FRAGMENT(obj: Pointer): PLsmDomDocumentFragment;
function LSM_DOM_DOCUMENT_FRAGMENT_CLASS(klass: Pointer): PLsmDomDocumentFragmentClass;
function LSM_IS_DOM_DOCUMENT_FRAGMENT(obj: Pointer): Tgboolean;
function LSM_IS_DOM_DOCUMENT_FRAGMENT_CLASS(klass: Pointer): Tgboolean;
function LSM_DOM_DOCUMENT_FRAGMENT_GET_CLASS(obj: Pointer): PLsmDomDocumentFragmentClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_DOM_DOCUMENT_FRAGMENT: TGType;
begin
  LSM_TYPE_DOM_DOCUMENT_FRAGMENT := lsm_dom_document_fragment_get_type;
end;

function LSM_DOM_DOCUMENT_FRAGMENT(obj: Pointer): PLsmDomDocumentFragment;
begin
  Result := PLsmDomDocumentFragment(g_type_check_instance_cast(obj, LSM_TYPE_DOM_DOCUMENT_FRAGMENT));
end;

function LSM_DOM_DOCUMENT_FRAGMENT_CLASS(klass: Pointer): PLsmDomDocumentFragmentClass;
begin
  Result := PLsmDomDocumentFragmentClass(g_type_check_class_cast(klass, LSM_TYPE_DOM_DOCUMENT_FRAGMENT));
end;

function LSM_IS_DOM_DOCUMENT_FRAGMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_DOM_DOCUMENT_FRAGMENT);
end;

function LSM_IS_DOM_DOCUMENT_FRAGMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_DOM_DOCUMENT_FRAGMENT);
end;

function LSM_DOM_DOCUMENT_FRAGMENT_GET_CLASS(obj: Pointer): PLsmDomDocumentFragmentClass;
begin
  Result := PLsmDomDocumentFragmentClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
