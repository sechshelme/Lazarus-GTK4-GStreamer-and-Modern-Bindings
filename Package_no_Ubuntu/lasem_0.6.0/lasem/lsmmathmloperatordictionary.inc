{$IFDEF read_interface}


type
  TLsmMathmlOperatorDictionaryEntry = record
    name: pchar;
    form: TLsmMathmlForm;
    left_space: TLsmMathmlSpace;
    right_space: TLsmMathmlSpace;
    stretchy: Tgboolean;
    fence: Tgboolean;
    accent: Tgboolean;
    large_op: Tgboolean;
    movable_limits: Tgboolean;
    separator: Tgboolean;
    min_size: TLsmMathmlSpace;
    max_size: TLsmMathmlSpace;
    symmetric: Tgboolean;
  end;
  PLsmMathmlOperatorDictionaryEntry = ^TLsmMathmlOperatorDictionaryEntry;

function lsm_mathml_operator_dictionary_lookup(utf8: pchar; form: TLsmMathmlForm): PLsmMathmlOperatorDictionaryEntry; cdecl; external liblasem;
procedure lsm_mathml_operator_dictionary_cleanup; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:45:53 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
