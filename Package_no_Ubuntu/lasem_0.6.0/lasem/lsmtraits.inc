{$IFDEF read_interface}


type
  PLsmTrait = ^TLsmTrait;
  TLsmTrait = pointer;

  TLsmTraitClass = record
    size: Tsize_t;
    init: procedure(abstract_trait: PLsmTrait; trait_default: PLsmTrait); cdecl;
    finalize: procedure(abstract_trait: PLsmTrait); cdecl;
    from_string: function(abstract_trait: PLsmTrait; _string: pchar): Tgboolean; cdecl;
    to_string: function(abstract_trait: PLsmTrait): pchar; cdecl;
  end;
  PLsmTraitClass = ^TLsmTraitClass;

var
  lsm_null_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_boolean_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_integer_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_double_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_box_trait_class : TLsmTraitClass;cvar;external liblasem;

function lsm_enum_value_from_string(_string: pchar; strings: PPchar; n_strings: dword): longint; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:12:23 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
