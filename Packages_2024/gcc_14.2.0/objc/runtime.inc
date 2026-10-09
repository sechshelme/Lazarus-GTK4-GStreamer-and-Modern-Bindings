{$IFDEF read_interface}


type
  PIvar = ^TIvar;
  TIvar = Pointer;

  PProperty = ^TProperty;
  TProperty = Pointer;

  Pobjc_property_t = ^Tobjc_property_t;
  Tobjc_property_t = Pointer;

  PMethod = ^TMethod;
  TMethod = Pointer;

  Pobjc_category = Pointer;

  PCategory = ^TCategory;
  TCategory = ^Pobjc_category;

  Tobjc_method_description = record
    name: TSEL;
    types: pchar;
  end;
  Pobjc_method_description = ^Tobjc_method_description;

const
  _C_ID = '@';
  _C_CLASS = '#';
  _C_SEL = ':';
  _C_CHR = 'c';
  _C_UCHR = 'C';
  _C_SHT = 's';
  _C_USHT = 'S';
  _C_INT = 'i';
  _C_UINT = 'I';
  _C_LNG = 'l';
  _C_ULNG = 'L';
  _C_LNG_LNG = 'q';
  _C_ULNG_LNG = 'Q';
  _C_FLT = 'f';
  _C_DBL = 'd';
  _C_LNG_DBL = 'D';
  _C_BFLD = 'b';
  _C_BOOL = 'B';
  _C_VOID = 'v';
  _C_UNDEF = '?';
  _C_PTR = '^';
  _C_CHARPTR = '*';
  _C_ARY_B = '[';
  _C_ARY_E = ']';
  _C_UNION_B = '(';
  _C_UNION_E = ')';
  _C_STRUCT_B = '{';
  _C_STRUCT_E = '}';
  _C_VECTOR = '!';
  _C_COMPLEX = 'j';
  _C_ATOM = '%';
  _C_CONST = 'r';
  _C_IN = 'n';
  _C_INOUT = 'N';
  _C_OUT = 'o';
  _C_BYCOPY = 'O';
  _C_BYREF = 'R';
  _C_ONEWAY = 'V';
  _C_GCINVISIBLE = '|';
  _F_CONST = $01;
  _F_IN = $01;
  _F_OUT = $02;
  _F_INOUT = $03;
  _F_BYCOPY = $04;
  _F_BYREF = $08;
  _F_ONEWAY = $10;
  _F_GCINVISIBLE = $20;

function object_getClass(obj: Tid): TClass;

function sel_getName(selector: TSEL): pchar; cdecl; external libobjc;
function sel_getTypeEncoding(selector: TSEL): pchar; cdecl; external libobjc;
function sel_getUid(name: pchar): TSEL; cdecl; external libobjc;
function sel_registerName(name: pchar): TSEL; cdecl; external libobjc;
function sel_registerTypedName(name: pchar; _type: pchar): TSEL; cdecl; external libobjc;
function sel_isEqual(first_selector: TSEL; second_selector: TSEL): TBOOL; cdecl; external libobjc;
function sel_copyTypedSelectorList(name: pchar; numberOfReturnedSelectors: Pdword): PSEL; cdecl; external libobjc;
function sel_getTypedSelector(name: pchar): TSEL; cdecl; external libobjc;
function class_createInstance(class_: TClass; extraBytes: Tsize_t): Tid; cdecl; external libobjc;
function object_copy(obj: Tid; extraBytes: Tsize_t): Tid; cdecl; external libobjc;
function object_dispose(obj: Tid): Tid; cdecl; external libobjc;
function object_getClassName(obj: Tid): pchar; cdecl; external libobjc;
function object_setClass(obj: Tid; class_: TClass): TClass; cdecl; external libobjc;
function class_getInstanceVariable(class_: TClass; name: pchar): TIvar; cdecl; external libobjc;
function class_getClassVariable(class_: TClass; name: pchar): TIvar; cdecl; external libobjc;
function object_getIndexedIvars(obj: Tid): pointer; cdecl; external libobjc;
function object_getInstanceVariable(obj: Tid; name: pchar; returnValue: Ppointer): TIvar; cdecl; external libobjc;
function object_setInstanceVariable(obj: Tid; name: pchar; newValue: pointer): TIvar; cdecl; external libobjc;
function object_getIvar(obj: Tid; variable: TIvar): Tid; cdecl; external libobjc;
procedure object_setIvar(obj: Tid; variable: TIvar; value: Tid); cdecl; external libobjc;
function ivar_getName(variable: TIvar): pchar; cdecl; external libobjc;
function ivar_getOffset(variable: TIvar): Tptrdiff_t; cdecl; external libobjc;
function ivar_getTypeEncoding(variable: TIvar): pchar; cdecl; external libobjc;
function class_copyIvarList(class_: TClass; numberOfReturnedIvars: Pdword): PIvar; cdecl; external libobjc;
function class_addIvar(class_: TClass; ivar_name: pchar; size: Tsize_t; log_2_of_alignment: byte; _type: pchar): TBOOL; cdecl; external libobjc;
function property_getName(_property: TProperty): pchar; cdecl; external libobjc;
function property_getAttributes(_property: TProperty): pchar; cdecl; external libobjc;
function class_getProperty(class_: TClass; propertyName: pchar): TProperty; cdecl; external libobjc;
function class_copyPropertyList(class_: TClass; numberOfReturnedProperties: Pdword): PProperty; cdecl; external libobjc;
function class_getIvarLayout(class_: TClass): pchar; cdecl; external libobjc;
function class_getWeakIvarLayout(class_: TClass): pchar; cdecl; external libobjc;
procedure class_setIvarLayout(class_: TClass; layout: pchar); cdecl; external libobjc;
procedure class_setWeakIvarLayout(class_: TClass; layout: pchar); cdecl; external libobjc;

type
  Tobjc_get_unknown_class_handler = function(class_name: pchar): TClass; cdecl;

function objc_setGetUnknownClassHandler(new_handler: Tobjc_get_unknown_class_handler): Tobjc_get_unknown_class_handler; cdecl; external libobjc;
function objc_getClass(name: pchar): TClass; cdecl; external libobjc;
function objc_lookUpClass(name: pchar): TClass; cdecl; external libobjc;
function objc_getMetaClass(name: pchar): TClass; cdecl; external libobjc;
function objc_getRequiredClass(name: pchar): TClass; cdecl; external libobjc;
function objc_getClassList(returnValue: PClass; maxNumberOfClassesToReturn: longint): longint; cdecl; external libobjc;
function class_getName(class_: TClass): pchar; cdecl; external libobjc;
function class_isMetaClass(class_: TClass): TBOOL; cdecl; external libobjc;
function class_getSuperclass(class_: TClass): TClass; cdecl; external libobjc;
function class_getVersion(class_: TClass): longint; cdecl; external libobjc;
procedure class_setVersion(class_: TClass; version: longint); cdecl; external libobjc;
function class_getInstanceSize(class_: TClass): Tsize_t; cdecl; external libobjc;
function method_setImplementation(method: TMethod; impl: TIMP): TIMP; cdecl; external libobjc;
procedure method_exchangeImplementations(method_a: TMethod; method_b: TMethod); cdecl; external libobjc;
function objc_allocateClassPair(super_class: TClass; class_name: pchar; extraBytes: Tsize_t): TClass; cdecl; external libobjc;
procedure objc_registerClassPair(class_: TClass); cdecl; external libobjc;
procedure objc_disposeClassPair(class_: TClass); cdecl; external libobjc;
function class_getInstanceMethod(class_: TClass; selector: TSEL): TMethod; cdecl; external libobjc;
function class_getClassMethod(class_: TClass; selector: TSEL): TMethod; cdecl; external libobjc;
function class_getMethodImplementation(class_: TClass; selector: TSEL): TIMP; cdecl; external libobjc;
function class_respondsToSelector(class_: TClass; selector: TSEL): TBOOL; cdecl; external libobjc;
function class_addMethod(class_: TClass; selector: TSEL; impl: TIMP; method_types: pchar): TBOOL; cdecl; external libobjc;
function class_replaceMethod(class_: TClass; selector: TSEL; impl: TIMP; method_types: pchar): TIMP; cdecl; external libobjc;
function method_getName(method: TMethod): TSEL; cdecl; external libobjc;
function method_getImplementation(method: TMethod): TIMP; cdecl; external libobjc;
function method_getTypeEncoding(method: TMethod): pchar; cdecl; external libobjc;
function method_getDescription(method: TMethod): Pobjc_method_description; cdecl; external libobjc;
function class_copyMethodList(class_: TClass; numberOfReturnedMethods: Pdword): PMethod; cdecl; external libobjc;
function method_getNumberOfArguments(method: TMethod): dword; cdecl; external libobjc;
function method_copyReturnType(method: TMethod): pchar; cdecl; external libobjc;
function method_copyArgumentType(method: TMethod; argumentNumber: dword): pchar; cdecl; external libobjc;
procedure method_getReturnType(method: TMethod; returnValue: pchar; returnValueSize: Tsize_t); cdecl; external libobjc;
procedure method_getArgumentType(method: TMethod; argumentNumber: dword; returnValue: pchar; returnValueSize: Tsize_t); cdecl; external libobjc;
function objc_getProtocol(name: pchar): PProtocol; cdecl; external libobjc;
function objc_copyProtocolList(numberOfReturnedProtocols: Pdword): PPProtocol; cdecl; external libobjc;
function class_addProtocol(class_: TClass; protocol: PProtocol): TBOOL; cdecl; external libobjc;
function class_conformsToProtocol(class_: TClass; protocol: PProtocol): TBOOL; cdecl; external libobjc;
function class_copyProtocolList(class_: TClass; numberOfReturnedProtocols: Pdword): PPProtocol; cdecl; external libobjc;
function protocol_conformsToProtocol(protocol: PProtocol; anotherProtocol: PProtocol): TBOOL; cdecl; external libobjc;
function protocol_isEqual(protocol: PProtocol; anotherProtocol: PProtocol): TBOOL; cdecl; external libobjc;
function protocol_getName(protocol: PProtocol): pchar; cdecl; external libobjc;
function protocol_getMethodDescription(protocol: PProtocol; selector: TSEL; requiredMethod: TBOOL; instanceMethod: TBOOL): Tobjc_method_description; cdecl; external libobjc;
function protocol_copyMethodDescriptionList(protocol: PProtocol; requiredMethod: TBOOL; instanceMethod: TBOOL; numberOfReturnedMethods: Pdword): Pobjc_method_description; cdecl; external libobjc;
function protocol_getProperty(protocol: PProtocol; propertyName: pchar; requiredProperty: TBOOL; instanceProperty: TBOOL): TProperty; cdecl; external libobjc;
function protocol_copyPropertyList(protocol: PProtocol; numberOfReturnedProperties: Pdword): PProperty; cdecl; external libobjc;
function protocol_copyProtocolList(protocol: PProtocol; numberOfReturnedProtocols: Pdword): PPProtocol; cdecl; external libobjc;

var
  _objc_load_callback: procedure(_class: TClass; category: Pobjc_category); cvar;external libobjc;

type
  TsetEnumerationfunc = procedure(para1: Tid); cdecl;

procedure objc_enumerationMutation(collection: Tid); cdecl; external libobjc;
procedure objc_setEnumerationMutationHandler(handler: TsetEnumerationfunc); cdecl; external libobjc;
function objc_malloc(size: Tsize_t): pointer; cdecl; external libobjc;
function objc_atomic_malloc(size: Tsize_t): pointer; cdecl; external libobjc;
function objc_realloc(mem: pointer; size: Tsize_t): pointer; cdecl; external libobjc;
function objc_calloc(nelem: Tsize_t; size: Tsize_t): pointer; cdecl; external libobjc;
procedure objc_free(mem: pointer); cdecl; external libobjc;
procedure class_ivar_set_gcinvisible(_class: TClass; ivarname: pchar; gcInvisible: TBOOL); cdecl; external libobjc;
function objc_sizeof_type(_type: pchar): longint; cdecl; external libobjc;
function objc_alignof_type(_type: pchar): longint; cdecl; external libobjc;
function objc_aligned_size(_type: pchar): longint; cdecl; external libobjc;
function objc_promoted_size(_type: pchar): longint; cdecl; external libobjc;
function objc_skip_type_qualifiers(_type: pchar): pchar; cdecl; external libobjc;
function objc_skip_typespec(_type: pchar): pchar; cdecl; external libobjc;
function objc_skip_offset(_type: pchar): pchar; cdecl; external libobjc;
function objc_skip_argspec(_type: pchar): pchar; cdecl; external libobjc;
function objc_get_type_qualifiers(_type: pchar): dword; cdecl; external libobjc;

type
  Tobjc_struct_layout = record
    original_type: pchar;
    _type: pchar;
    prev_type: pchar;
    record_size: dword;
    record_align: dword;
  end;
  Pobjc_struct_layout = ^Tobjc_struct_layout;

procedure objc_layout_structure(_type: pchar; layout: Pobjc_struct_layout); cdecl; external libobjc;
function objc_layout_structure_next_member(layout: Pobjc_struct_layout): TBOOL; cdecl; external libobjc;
procedure objc_layout_finish_structure(layout: Pobjc_struct_layout; size: Pdword; align: Pdword); cdecl; external libobjc;
procedure objc_layout_structure_get_info(layout: Pobjc_struct_layout; offset: Pdword; align: Pdword; _type: PPchar); cdecl; external libobjc;

// === Konventiert am: 31-1-26 15:22:14 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function object_getClass(obj: Tid): TClass;
begin
  if obj <> nil then begin
    Result := obj^.class_pointer;
  end else begin
    Result := nil;
  end;
end;

{$ENDIF read_implementation}
