program project1;

uses
  fp_objc,
  factory;

  procedure main;
  var
    newCls: TClass;
    myObj: Tid;
    setVal_a, setVal_b: TSetterIMP1;
    setVal_ab: TSetterIMP2;
    getSum: TGetterIMP;
    res: integer;
    setVal_a_ID, setVal_b_ID, getVal_ID, setVal_ab_ID: TSEL;
  begin
    Init;

    newCls := objc_getClass('CalculatorClass');
    if newCls = nil then begin
      WriteLn('CalculatorClass nicht gefunden');
      Exit;
    end;
    myObj := class_createInstance(newCls, 0);

    setVal_a_ID := sel_getUid('setVal_a:');
    setVal_b_ID := sel_getUid('setVal_b:');
    setVal_ab_ID := sel_getUid('setValab:');
    getVal_ID := sel_getUid('getVal:');

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

    object_dispose(myObj);
    objc_disposeClassPair(newCls);
  end;

begin
  main;
end.
