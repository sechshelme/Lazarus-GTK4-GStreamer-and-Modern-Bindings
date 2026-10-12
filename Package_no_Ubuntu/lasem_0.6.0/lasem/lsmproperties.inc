{$IFDEF read_interface}


type
  TLsmProperty = record
    id: Tguint16;
    flags: Tguint16;
    value: pchar;
  end;
  PLsmProperty = ^TLsmProperty;

  TLsmPropertyInfos = record
    name: pchar;
    id: Tguint16;
    trait_class: PLsmTraitClass;
    trait_default: pchar;
  end;
  PLsmPropertyInfos = ^TLsmPropertyInfos;

  TLsmPropertyBag = record
    properties: PGSList;
  end;
  PLsmPropertyBag = ^TLsmPropertyBag;

  PLsmPropertyManager = type Pointer;

function lsm_property_manager_get_type: TGType; cdecl; external liblasem;
function lsm_property_manager_new(n_properties: dword; property_infos: PLsmPropertyInfos): PLsmPropertyManager; cdecl; external liblasem;
function lsm_property_manager_ref(manager: PLsmPropertyManager): PLsmPropertyManager; cdecl; external liblasem;
procedure lsm_property_manager_unref(manager: PLsmPropertyManager); cdecl; external liblasem;
function lsm_property_manager_set_property(manager: PLsmPropertyManager; property_bag: PLsmPropertyBag; name: pchar; value: pchar): Tgboolean; cdecl; external liblasem;
function lsm_property_manager_get_property(manager: PLsmPropertyManager; property_bag: PLsmPropertyBag; name: pchar): pchar; cdecl; external liblasem;
procedure lsm_property_manager_clean_properties(manager: PLsmPropertyManager; property_bag: PLsmPropertyBag); cdecl; external liblasem;
function lsm_property_manager_serialize(property_manager: PLsmPropertyManager; property_bag: PLsmPropertyBag): pchar; cdecl; external liblasem;
procedure lsm_property_manager_apply_property_bag(property_manager: PLsmPropertyManager; property_bag: PLsmPropertyBag; style: pointer; parent_style: pointer); cdecl; external liblasem;
procedure lsm_property_manager_init_default_style(property_manager: PLsmPropertyManager; style: pointer); cdecl; external liblasem;
procedure lsm_property_bag_init(bag: PLsmPropertyBag); cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:55:36 ===

function LSM_TYPE_PROPERTY_MANAGER: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_PROPERTY_MANAGER: TGType;
begin
  LSM_TYPE_PROPERTY_MANAGER := lsm_property_manager_get_type;
end;



{$ENDIF read_implementation}
