{$IFDEF read_interface}


type
  PLsmMathmlPresentationTokenType = ^TLsmMathmlPresentationTokenType;
  TLsmMathmlPresentationTokenType = longint;

const
  LSM_MATHML_PRESENTATION_TOKEN_TYPE_NUMBER = 0;
  LSM_MATHML_PRESENTATION_TOKEN_TYPE_IDENTIFIER = 1;
  LSM_MATHML_PRESENTATION_TOKEN_TYPE_TEXT = 2;

type
//  TLsmMathmlPresentationToken = record
    //element: TLsmMathmlElement;
    //_type: TLsmMathmlPresentationTokenType;
    //math_family: TLsmMathmlStringAttribute;
    //math_variant: TLsmMathmlEnumAttribute;
    //math_size: TLsmMathmlLengthAttribute;
    //math_color: TLsmMathmlColorAttribute;
    //math_background: TLsmMathmlColorAttribute;
    //font_weight: TLsmMathmlEnumAttribute;
    //font_style: TLsmMathmlEnumAttribute;
//  end;
  PLsmMathmlPresentationToken = type Pointer;

  //TLsmMathmlPresentationTokenClass = record
  //  parent_class: TLsmMathmlElementClass;
  //  get_text: function(self: PLsmMathmlPresentationToken): pchar; cdecl;
  //end;
  PLsmMathmlPresentationTokenClass = type Pointer;

function lsm_mathml_presentation_token_get_type: TGType; cdecl; external liblasem;
function lsm_mathml_number_element_new: PLsmDomNode; cdecl; external liblasem;
function lsm_mathml_identifier_element_new: PLsmDomNode; cdecl; external liblasem;
function lsm_mathml_text_element_new: PLsmDomNode; cdecl; external liblasem;
function lsm_mathml_presentation_token_get_text(self: PLsmMathmlPresentationToken): pchar; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:46:17 ===

function LSM_TYPE_MATHML_PRESENTATION_TOKEN: TGType;
function LSM_MATHML_PRESENTATION_TOKEN(obj: Pointer): PLsmMathmlPresentationToken;
function LSM_MATHML_PRESENTATION_TOKEN_CLASS(klass: Pointer): PLsmMathmlPresentationTokenClass;
function LSM_IS_MATHML_PRESENTATION_TOKEN(obj: Pointer): Tgboolean;
function LSM_IS_MATHML_PRESENTATION_TOKEN_CLASS(klass: Pointer): Tgboolean;
function LSM_MATHML_PRESENTATION_TOKEN_GET_CLASS(obj: Pointer): PLsmMathmlPresentationTokenClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_MATHML_PRESENTATION_TOKEN: TGType;
begin
  LSM_TYPE_MATHML_PRESENTATION_TOKEN := lsm_mathml_presentation_token_get_type;
end;

function LSM_MATHML_PRESENTATION_TOKEN(obj: Pointer): PLsmMathmlPresentationToken;
begin
  Result := PLsmMathmlPresentationToken(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_PRESENTATION_TOKEN));
end;

function LSM_MATHML_PRESENTATION_TOKEN_CLASS(klass: Pointer): PLsmMathmlPresentationTokenClass;
begin
  Result := PLsmMathmlPresentationTokenClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_PRESENTATION_TOKEN));
end;

function LSM_IS_MATHML_PRESENTATION_TOKEN(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_MATHML_PRESENTATION_TOKEN);
end;

function LSM_IS_MATHML_PRESENTATION_TOKEN_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_MATHML_PRESENTATION_TOKEN);
end;

function LSM_MATHML_PRESENTATION_TOKEN_GET_CLASS(obj: Pointer): PLsmMathmlPresentationTokenClass;
begin
  Result := PLsmMathmlPresentationTokenClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
