unit factory;

interface

uses
  fp_objc;

type
  TSetterIMP1 = procedure(self: Tid; cmd: TSEL; AValue: integer); cdecl;
  TSetterIMP2 = procedure(self: Tid; cmd: TSEL; AValue_a, AValue_b: integer); cdecl;
  TGetterIMP = function(self: Tid; cmd: TSEL): integer; cdecl;

procedure Init;

implementation

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

function get_value_cb(self: Tid; cmd: TSEL): integer; cdecl;
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

procedure Init;
var
  baseCls, newCls: TClass;
  setVal_a_ID, setVal_b_ID, setVal_ab_ID, getVal_ID: TSEL;
begin
  baseCls := objc_getClass('Object');
  newCls := objc_allocateClassPair(baseCls, 'CalculatorClass', 0);

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
end;



end.
