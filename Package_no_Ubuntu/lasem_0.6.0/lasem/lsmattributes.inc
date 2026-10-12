{$IFDEF read_interface}


type
  TLsmAttribute = record
    value: pchar;
  end;
  PLsmAttribute = ^TLsmAttribute;

function lsm_attribute_is_defined(attribute: PLsmAttribute): Tgboolean; cdecl; external liblasem;

type
  TLsmAttributeInfos = record
    name: pchar;
    attribute_offset: longint;
    trait_class: PLsmTraitClass;
    trait_default: pointer;
  end;
  PLsmAttributeInfos = ^TLsmAttributeInfos;

  PLsmAttributeManager = type Pointer;

function lsm_attribute_manager_get_type: TGType; cdecl; external liblasem;
function lsm_attribute_manager_new(n_attributes: dword; attribute_infos: PLsmAttributeInfos): PLsmAttributeManager; cdecl; external liblasem;
function lsm_attribute_manager_duplicate(origin: PLsmAttributeManager): PLsmAttributeManager; cdecl; external liblasem;
function lsm_attribute_manager_ref(manager: PLsmAttributeManager): PLsmAttributeManager; cdecl; external liblasem;
procedure lsm_attribute_manager_unref(manager: PLsmAttributeManager); cdecl; external liblasem;
procedure lsm_attribute_manager_add_attributes(manager: PLsmAttributeManager; n_attributes: dword; attribute_infos: PLsmAttributeInfos); cdecl; external liblasem;
function lsm_attribute_manager_set_attribute(manager: PLsmAttributeManager; instance: pointer; name: pchar; value: pchar): Tgboolean; cdecl; external liblasem;
function lsm_attribute_manager_get_attribute(manager: PLsmAttributeManager; instance: pointer; name: pchar): pchar; cdecl; external liblasem;
procedure lsm_attribute_manager_clean_attributes(manager: PLsmAttributeManager; instance: pointer); cdecl; external liblasem;
function lsm_attribute_manager_serialize(manager: PLsmAttributeManager; instance: pointer): pchar; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:10:31 ===

function LSM_TYPE_ATTRIBUTE_MANAGER: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_ATTRIBUTE_MANAGER: TGType;
begin
  LSM_TYPE_ATTRIBUTE_MANAGER := lsm_attribute_manager_get_type;
end;



{$ENDIF read_implementation}
