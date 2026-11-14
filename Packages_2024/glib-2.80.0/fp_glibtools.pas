unit fp_GLIBTools;

interface

uses
  fp_glib2;

procedure GValueShow(Value: PGValue);
procedure GVariantShow(variant: PGVariant);
procedure GObjectShowProperty(obj: Pointer);
procedure GSignalShow(typ: TGType);

implementation

function getVariant(variant: PGVariant): string;
var
  objv: PPgchar;
  len: Tgsize;
  i: integer;
  val_str: Pgchar;
begin
  if variant = nil then begin
    Result := 'variant=(null)';
    exit;
  end;
  case g_variant_classify(variant) of
    G_VARIANT_CLASS_BOOLEAN: begin
      WriteStr(Result, 'Boolean ( ', g_variant_get_boolean(variant), ' )');
    end;
    G_VARIANT_CLASS_BYTE: begin
      WriteStr(Result, 'Byte ( ', g_variant_get_byte(variant), ' )');
    end;
    G_VARIANT_CLASS_INT16: begin
      WriteStr(Result, 'int16 ( ', g_variant_get_int16(variant), ' )');
    end;
    G_VARIANT_CLASS_UINT16: begin
      WriteStr(Result, 'uint16 ( ', g_variant_get_uint16(variant), ' )');
    end;
    G_VARIANT_CLASS_INT32: begin
      WriteStr(Result, 'int32 ( ', g_variant_get_int32(variant), ' )');
    end;
    G_VARIANT_CLASS_UINT32: begin
      WriteStr(Result, 'uint32 ( ', g_variant_get_uint32(variant), ' )');
    end;
    G_VARIANT_CLASS_INT64: begin
      WriteStr(Result, 'int64 ( ', g_variant_get_int64(variant), ' )');
    end;
    G_VARIANT_CLASS_UINT64: begin
      WriteStr(Result, 'uint64 ( ', g_variant_get_uint64(variant), ' )');
    end;
    G_VARIANT_CLASS_HANDLE: begin
      WriteStr(Result, 'Handle ( ', g_variant_get_handle(variant), ' )');
    end;
    G_VARIANT_CLASS_DOUBLE: begin
      WriteStr(Result, 'Double ( ', g_variant_get_double(variant): 8: 4, ' )');
    end;
    G_VARIANT_CLASS_STRING: begin
      WriteStr(Result, 'String ( ', g_variant_get_string(variant, nil), ' )');
    end;
    G_VARIANT_CLASS_OBJECT_PATH: begin
      Result := 'ObjectPath (';
      objv := g_variant_get_objv(variant, @len);
      for i := 0 to len - 1 do begin
        WriteStr(Result, Result, '"', objv[i], '" ');
      end;
    end;
    G_VARIANT_CLASS_SIGNATURE: begin
      WriteStr(Result, 'Signature ( ', g_variant_get_string(variant, nil), ' )');
    end;
    G_VARIANT_CLASS_VARIANT: begin
      WriteStr(Result, 'Variant');
    end;
    G_VARIANT_CLASS_MAYBE: begin
      WriteStr(Result, 'Maybe');
    end;
    G_VARIANT_CLASS_ARRAY: begin
      WriteStr(Result, 'Array');
    end;
    G_VARIANT_CLASS_TUPLE: begin
      WriteStr(Result, 'Tuple (', g_variant_n_children(variant), ')');
    end;
    G_VARIANT_CLASS_DICT_ENTRY: begin
      WriteStr(Result, 'DictEntry');
    end;
    else begin
      WriteStr(Result, '<unknow> (', g_variant_classify(variant), ')');
    end;
  end;

  val_str := g_variant_print(variant, True);
  WriteStr(Result, Result,' ---- ', val_str);
  g_free(val_str)

end;

procedure GVariantShow(variant: PGVariant);
begin
  WriteLn(getVariant(variant));
end;

procedure GValueShow(Value: PGValue);
var
  typ: TGType;
  valueType, ValueStr: string;
  ValueName, objName: Pgchar;
  obj: PGObject = nil;
  variant: PGVariant;
begin
  typ := G_VALUE_TYPE(Value);
  ValueName := G_VALUE_TYPE_NAME(Value);
  case typ of
    G_TYPE_INVALID: begin
      valueType := 'G_TYPE_INVALID';
    end;
    G_TYPE_NONE: begin
      valueType := 'G_TYPE_NONE';
    end;
    G_TYPE_INTERFACE: begin
      valueType := 'G_TYPE_INTERFACE';
    end;
    G_TYPE_CHAR: begin
      valueType := 'G_TYPE_CHAR';
      WriteStr(ValueStr, char(g_value_get_char(Value)));
    end;
    G_TYPE_UCHAR: begin
      valueType := 'G_TYPE_UCHAR';
      WriteStr(ValueStr, Tguint8(g_value_get_char(Value)));
    end;
    G_TYPE_BOOLEAN: begin
      valueType := 'G_TYPE_BOOLEAN';
      WriteStr(ValueStr, g_value_get_boolean(Value));
    end;
    G_TYPE_INT: begin
      valueType := 'G_TYPE_INT';
      WriteStr(ValueStr, g_value_get_int(Value));
    end;
    G_TYPE_UINT: begin
      valueType := 'G_TYPE_UINT';
      WriteStr(ValueStr, g_value_get_uint(Value));
    end;
    G_TYPE_LONG: begin
      valueType := 'G_TYPE_ULONG';
      WriteStr(ValueStr, g_value_get_ulong(Value));
    end;
    G_TYPE_ULONG: begin
      valueType := 'G_TYPE_LONG';
      WriteStr(ValueStr, g_value_get_long(Value));
    end;
    G_TYPE_INT64: begin
      valueType := 'G_TYPE_INT64';
      WriteStr(ValueStr, g_value_get_int64(Value));
    end;
    G_TYPE_UINT64: begin
      valueType := 'G_TYPE_UINT64';
      WriteStr(ValueStr, g_value_get_uint64(Value));
    end;
    G_TYPE_ENUM: begin
      valueType := 'G_TYPE_ENUM';
      WriteStr(ValueStr, g_value_get_enum(Value));
    end;
    G_TYPE_FLAGS: begin
      valueType := 'G_TYPE_FLAGS';
      WriteStr(ValueStr, g_value_get_flags(Value));
    end;
    G_TYPE_FLOAT: begin
      valueType := 'G_TYPE_FLOAT';
      WriteStr(ValueStr, g_value_get_float(Value): 8: 4);
    end;
    G_TYPE_DOUBLE: begin
      valueType := 'G_TYPE_DOUBLE';
      WriteStr(ValueStr, g_value_get_double(Value): 8: 4);
    end;
    G_TYPE_STRING: begin
      valueType := 'G_TYPE_STRING';
      WriteStr(ValueStr, g_value_get_string(Value));
    end;
    G_TYPE_POINTER: begin
      valueType := 'G_TYPE_POINTER';
      WriteStr(ValueStr, PtrUInt(g_value_get_pointer(Value)));
    end;
    G_TYPE_BOXED: begin
      valueType := 'G_TYPE_BOXED';
      WriteStr(ValueStr, PtrUInt(g_value_get_boxed(Value)));
    end;
    G_TYPE_OBJECT: begin
      valueType := 'G_TYPE_OBJECT';
      obj := g_value_get_object(Value);
      objName := G_OBJECT_TYPE_NAME(obj);
      WriteStr(ValueStr, objName);
    end;
    G_TYPE_VARIANT: begin
      valueType := 'G_TYPE_VARIANT';
      variant := g_value_get_variant(Value);
      WriteStr(ValueStr, getVariant(variant));
    end;
    else begin
      if g_type_is_a(typ, G_TYPE_BOXED) then begin
        valueType := 'G_TYPE_BOXED';
        WriteStr(ValueStr, g_type_name(typ));
      end else begin
        WriteStr(valueType, '<unknow> (', typ, ')');
      end;
    end;
  end;
  WriteLn('Name: ', ValueName: 20, '  Valuetype: ', valueType: 15, '  Value: ', ValueStr);
end;

procedure GObjectShowProperty(obj: Pointer);
var
  paramspec: PPGParamSpec;
  n_properties: Tguint;
  i: integer;
  Name: Pgchar;
  Value: TGValue;
  objectClass, parent_class: PGObjectClass;
begin
//  if G_IS_OBJECT(obj) then     objectClass := G_OBJECT_GET_CLASS(obj);
//  if G_IS_OBJECT_CLASS(obj) then     objectClass := obj;


  if (obj <> nil) and G_IS_OBJECT(obj) then begin
    objectClass := G_OBJECT_GET_CLASS(obj);
    paramspec := g_object_class_list_properties(objectClass, @n_properties);

    WriteLn('Property count: ', n_properties);
    for i := 0 to n_properties - 1 do begin
      Write(i: 3, '. ');
      if (paramspec[i]^.flags and G_PARAM_READABLE) = G_PARAM_READABLE then begin
        Value := G_VALUE_INIT_;
        Name := paramspec[i]^.Name;
        Write('Name: ', Name: 35, '   ');
        g_object_get_property(obj, Name, @Value);
        GValueShow(@Value);
        g_value_unset(@Value);
      end else begin
        WriteLn('readonly');
      end;
    end;
    g_free(paramspec);

// https://www.perplexity.ai/search/gib-mir-ein-beispiel-mit-gdk-m-DZJc2RVLS4iP0laDTVRtiA?0=d

    parent_class := G_OBJECT_CLASS(g_type_class_peek_parent(objectClass));
    if parent_class <> nil then begin

       GSignalShow(G_OBJECT_TYPE(obj));
//      GObjectShowProperty(parent_class);
      WriteLn('parent Klasse');
    end else begin
      WriteLn('keine parent Klasse');
    end;
  end else begin
    WriteLn('not a Object');
  end;
  WriteLn();
end;

procedure GSignalShow(typ: TGType);
var
  c: PGTypeClass;
  Count: Tguint;
  signals: Pguint;
  query: TGSignalQuery;
  i: integer;
  children: PGType;
  Name: Pgchar;
  specs: PPGParamSpec;
  pt: TGType;
begin
  if G_TYPE_IS_OBJECT(typ) then begin
    c := g_type_class_ref(typ);

    // Signals
    signals := g_signal_list_ids(typ, @Count);
    g_printf('Signal Count: %d'#10, Count);
    for i := 0 to Count - 1 do begin
      g_signal_query(signals[i], @query);
      g_printf('  %3d. %s'#10, i, query.signal_name);
    end;
    g_free(signals);
    g_type_class_unref(c);

    // Property
    specs := g_object_class_list_properties(G_OBJECT_CLASS(c), @Count);
    g_printf('Property Count: %d'#10, Count);
    for i := 0 to Count - 1 do begin
      g_printf('  %3d. %s'#10, i, g_param_spec_get_name(specs[i]));
    end;
    g_free(specs);

    // Parents
    pt := typ;
    g_printf('Parents:'#10);
    repeat
      if pt <> typ then  begin
        g_printf(' <- ');
      end;
      g_printf('%s', g_type_name(pt));
      pt := g_type_parent(pt);
    until pt = G_TYPE_INVALID;
    g_printf(#10);

    // Childs
    children := g_type_children(typ, @Count);
    g_printf('Name: %s    Child Count: %d'#10, g_type_name(typ), Count);
    for i := 0 to Count - 1 do begin
      Name := g_type_name(children[i]);
      g_printf('  %3d. %s'#10, i, Name);
      //      g_free(Name);
    end;
    g_free(children);
    GSignalShow(g_type_parent( typ));
  end else begin
    g_printf('Typ is not GObject'#10);
  end;
end;


end.
