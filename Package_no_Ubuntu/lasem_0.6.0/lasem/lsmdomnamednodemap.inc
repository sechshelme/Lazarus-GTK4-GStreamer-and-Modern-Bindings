{$IFDEF read_interface}


type
  TLsmDomNamedNodeMap = record
    obj: TGObject;
  end;
  PLsmDomNamedNodeMap = ^TLsmDomNamedNodeMap;

  TLsmDomNamedNodeMapClass = record
    parent_class: TGObjectClass;
    get: function(map: PLsmDomNamedNodeMap; name: pchar): PLsmDomNode; cdecl;
    set_: function(map: PLsmDomNamedNodeMap; node: PLsmDomNode): PLsmDomNode; cdecl;
    remove: function(map: PLsmDomNamedNodeMap; name: pchar): PLsmDomNode; cdecl;
    get_item: function(map: PLsmDomNamedNodeMap; index: dword): PLsmDomNode; cdecl;
    get_length: function(map: PLsmDomNamedNodeMap): dword; cdecl;
  end;
  PLsmDomNamedNodeMapClass = ^TLsmDomNamedNodeMapClass;

function lsm_dom_named_node_map_get_type: TGType; cdecl; external liblasem;
function lsm_dom_named_node_map_get_named_item(map: PLsmDomNamedNodeMap; name: pchar): PLsmDomNode; cdecl; external liblasem;
function lsm_dom_named_node_map_set_named_item(map: PLsmDomNamedNodeMap; node: PLsmDomNode): PLsmDomNode; cdecl; external liblasem;
function lsm_dom_named_node_map_remove_named_item(map: PLsmDomNamedNodeMap; name: pchar): PLsmDomNode; cdecl; external liblasem;
function lsm_dom_named_node_map_get_item(map: PLsmDomNamedNodeMap; index: dword): PLsmDomNode; cdecl; external liblasem;
function lsm_dom_named_node_map_get_length(map: PLsmDomNamedNodeMap): dword; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:37:35 ===

function LSM_TYPE_DOM_NAMED_NODE_MAP: TGType;
function LSM_DOM_NAMED_NODE_MAP(obj: Pointer): PLsmDomNamedNodeMap;
function LSM_DOM_NAMED_NODE_MAP_CLASS(klass: Pointer): PLsmDomNamedNodeMapClass;
function LSM_IS_DOM_NAMED_NODE_MAP(obj: Pointer): Tgboolean;
function LSM_IS_DOM_NAMED_NODE_MAP_CLASS(klass: Pointer): Tgboolean;
function LSM_DOM_NAMED_NODE_MAP_GET_CLASS(obj: Pointer): PLsmDomNamedNodeMapClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_DOM_NAMED_NODE_MAP: TGType;
begin
  LSM_TYPE_DOM_NAMED_NODE_MAP := lsm_dom_named_node_map_get_type;
end;

function LSM_DOM_NAMED_NODE_MAP(obj: Pointer): PLsmDomNamedNodeMap;
begin
  Result := PLsmDomNamedNodeMap(g_type_check_instance_cast(obj, LSM_TYPE_DOM_NAMED_NODE_MAP));
end;

function LSM_DOM_NAMED_NODE_MAP_CLASS(klass: Pointer): PLsmDomNamedNodeMapClass;
begin
  Result := PLsmDomNamedNodeMapClass(g_type_check_class_cast(klass, LSM_TYPE_DOM_NAMED_NODE_MAP));
end;

function LSM_IS_DOM_NAMED_NODE_MAP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_DOM_NAMED_NODE_MAP);
end;

function LSM_IS_DOM_NAMED_NODE_MAP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_DOM_NAMED_NODE_MAP);
end;

function LSM_DOM_NAMED_NODE_MAP_GET_CLASS(obj: Pointer): PLsmDomNamedNodeMapClass;
begin
  Result := PLsmDomNamedNodeMapClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
