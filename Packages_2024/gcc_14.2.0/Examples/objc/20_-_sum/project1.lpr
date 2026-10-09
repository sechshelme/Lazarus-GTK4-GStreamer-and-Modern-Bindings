program project1;

uses
  fp_objc;

  procedure print_class_info(cls: TClass);
  var
    ivars: PIvar;
    Count: DWord = 0;
    i: integer;
    methods: PMethod;
    sel: TSEL;
    props: PProperty;
    protos: PPProtocol;
  begin
    WriteLn('  Name: ', class_getName(cls));

    ivars := class_copyIvarList(cls, @Count);
    for  i := 0 to Count - 1 do begin
      WriteLn('    Variable [', i, ']: ', ivar_getName(ivars[i]), ' (Typ: ', ivar_getTypeEncoding(ivars[i]), ', Offset: ', ivar_getOffset(ivars[i]), ')');
    end;
    objc_free(ivars);

    methods := class_copyMethodList(cls, @Count);
    for  i := 0 to Count - 1 do begin
      sel := method_getName(methods[i]);
      WriteLn('    Methode  [', i, ']: ', sel_getName(sel), ' (Typ: ', method_getTypeEncoding(methods[i]), ')');
    end;
    objc_free(methods);

    props := class_copyPropertyList(cls, @Count);
    for  i := 0 to Count - 1 do begin
      WriteLn('    Property [', i, ']: ', property_getName(props[i]), ' (Attribs: ', property_getAttributes(props[i]), ')');
    end;
    objc_free(props);

    protos := class_copyProtocolList(cls, @Count);
    for  i := 0 to Count - 1 do begin
      WriteLn('    Protocol [', i, ']: <', protocol_getName(protos[i]), '>');
    end;
    objc_free(protos);

    WriteLn(#10);
  end;

  procedure print_classes;
  var
    numClasses: longint;
    classes: PClass;
    i: integer;
  begin
    numClasses := objc_getClassList(nil, 0);
    if numClasses > 0 then begin
      classes := objc_malloc(SizeOf(TClass) * numClasses);
      numClasses := objc_getClassList(classes, numClasses);
      WriteLn('Klassen Liste:   (', numClasses, ')');
      for i := 0 to numClasses - 1 do begin
        print_class_info(classes[i]);
      end;
      objc_free(classes);
    end;
  end;

  procedure set_value_cb(self: Tid; cmd: TSEL; AValue: integer); cdecl;
  var
    cls: TClass;
    ivar: TIvar;
    name: string;
    val: Pointer;
  begin
    name := sel_getName(cmd);
    cls := object_getClass(self);
    case name of
      'setVal_a:': begin
        ivar := class_getInstanceVariable(cls, 'Int_a');
      end;
      'setVal_b:': begin
        ivar := class_getInstanceVariable(cls, 'Int_b');
      end;
      else begin
        WriteLn('Unbekannt: ', name);
      end;
    end;

    val := pbyte(self) + ivar_getOffset(ivar);
    PInteger(val)^ := AValue;
  end;

  procedure set_value_ab_cb(self: Tid; cmd: TSEL; AValue_a, AValue_b: integer); cdecl;
  var
    cls: TClass;
    ivara, ivarb: TIvar;
    val: Pointer;
  begin
    cls := object_getClass(self);
    ivara := class_getInstanceVariable(cls, 'Int_a');
    ivarb := class_getInstanceVariable(cls, 'Int_b');

    val := pbyte(self) + ivar_getOffset(ivara);
    PInteger(val)^ := AValue_a;

    val := pbyte(self) + ivar_getOffset(ivarb);
    PInteger(val)^ := AValue_b;
  end;

  function get_value_cb(self: Tid; cmd: TSEL): integer;
  var
    cls: TClass;
    ivar: TIvar;
    val_a, val_b: Pointer;
  begin
    cls := object_getClass(self);
    ivar := class_getInstanceVariable(cls, 'Int_a');
    val_a := pbyte(self) + ivar_getOffset(ivar);

    ivar := class_getInstanceVariable(cls, 'Int_b');
    val_b := pbyte(self) + ivar_getOffset(ivar);

    Result := PInteger(val_a)^ + PInteger(val_b)^;
  end;

type
  TSetterIMP1 = procedure(self: Tid; cmd: TSEL; AValue: integer); cdecl;
  TSetterIMP2 = procedure(self: Tid; cmd: TSEL; AValue_a, AValue_b: integer); cdecl;
  TGetterIMP = function(self: Tid; cmd: TSEL): integer; cdecl;

  procedure main;
  var
    baseCls, newCls: TClass;
    myObj: Tid;
    setVal_a, setVal_b: TSetterIMP1;
    setVal_ab: TSetterIMP2;
    getSum: TGetterIMP;
    res: integer;
    setVal_a_ID, setVal_b_ID, getVal_ID, setVal_ab_ID: TSEL;
  begin
    baseCls := objc_getClass('Object');
    newCls := objc_allocateClassPair(baseCls, 'MyClass', 0);

    class_addIvar(newCls, 'Int_a', sizeof(integer), 0, 'i');
    class_addIvar(newCls, 'Int_b', sizeof(integer), 0, 'i');

    setVal_a_ID := sel_getUid('setVal_a:');
    setVal_b_ID := sel_getUid('setVal_b:');
    setVal_ab_ID := sel_getUid('setValab:');
    getVal_ID := sel_getUid('getVal:');

    class_addMethod(newCls, setVal_a_ID, TIMP(@set_value_cb), 'v@:i');
    class_addMethod(newCls, setVal_b_ID, TIMP(@set_value_cb), 'v@:i');
    class_addMethod(newCls, setVal_ab_ID, TIMP(@set_value_ab_cb), 'v@:ii');
    class_addMethod(newCls, getVal_ID, TIMP(@get_value_cb), 'i@:');

    objc_registerClassPair(newCls);
    myObj := class_createInstance(newCls, 0);

    setVal_a := TSetterIMP1(class_getMethodImplementation(newCls, setVal_a_ID));
    setVal_a(myObj, setVal_a_ID, 100);

    setVal_b := TSetterIMP1(class_getMethodImplementation(newCls, setVal_b_ID));
    setVal_b(myObj, setVal_b_ID, 200);

    getSum := TGetterIMP(class_getMethodImplementation(newCls, getVal_ID));
    res := integer(getSum(myObj, getVal_ID));

    Write('Ergebnis der Summe: ', res, #10#10);

    // -------

    setVal_ab := TSetterIMP2(class_getMethodImplementation(newCls, setVal_ab_ID));
    setVal_ab(myObj, setVal_ab_ID, 123, 321);

    getSum := TGetterIMP(class_getMethodImplementation(newCls, getVal_ID));
    res := integer(getSum(myObj, getVal_ID));

    Write('Ergebnis der Summe: ', res, #10#10);

    // -------

    WriteLn(#10);
    print_classes;

    object_dispose(myObj);
    objc_disposeClassPair(newCls);
  end;

begin
  main;
end.
