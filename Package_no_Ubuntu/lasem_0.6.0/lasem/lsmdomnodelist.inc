{$IFDEF read_interface}


type
  TLsmDomNodeListClass = record
    parent_class: TGObjectClass;
    get_item: function(list: PLsmDomNodeList; index: dword): PLsmDomNode; cdecl;
    get_length: function(list: PLsmDomNodeList): dword; cdecl;
  end;
  PLsmDomNodeListClass = ^TLsmDomNodeListClass;

function lsm_dom_node_list_get_type: TGType; cdecl; external liblasem;
function lsm_dom_node_list_get_item(list: PLsmDomNodeList; index: dword): PLsmDomNode; cdecl; external liblasem;
function lsm_dom_node_list_get_length(list: PLsmDomNodeList): dword; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:37:48 ===

function LSM_TYPE_DOM_NODE_LIST: TGType;
function LSM_DOM_NODE_LIST(obj: Pointer): PLsmDomNodeList;
function LSM_DOM_NODE_LIST_CLASS(klass: Pointer): PLsmDomNodeListClass;
function LSM_IS_DOM_NODE_LIST(obj: Pointer): Tgboolean;
function LSM_IS_DOM_NODE_LIST_CLASS(klass: Pointer): Tgboolean;
function LSM_DOM_NODE_LIST_GET_CLASS(obj: Pointer): PLsmDomNodeListClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_DOM_NODE_LIST: TGType;
begin
  LSM_TYPE_DOM_NODE_LIST := lsm_dom_node_list_get_type;
end;

function LSM_DOM_NODE_LIST(obj: Pointer): PLsmDomNodeList;
begin
  Result := PLsmDomNodeList(g_type_check_instance_cast(obj, LSM_TYPE_DOM_NODE_LIST));
end;

function LSM_DOM_NODE_LIST_CLASS(klass: Pointer): PLsmDomNodeListClass;
begin
  Result := PLsmDomNodeListClass(g_type_check_class_cast(klass, LSM_TYPE_DOM_NODE_LIST));
end;

function LSM_IS_DOM_NODE_LIST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_DOM_NODE_LIST);
end;

function LSM_IS_DOM_NODE_LIST_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_DOM_NODE_LIST);
end;

function LSM_DOM_NODE_LIST_GET_CLASS(obj: Pointer): PLsmDomNodeListClass;
begin
  Result := PLsmDomNodeListClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
