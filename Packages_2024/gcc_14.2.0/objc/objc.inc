{$IFDEF read_interface}


const
  __GNU_LIBOBJC__ = 20110608;

type
  PBOOL = ^TBOOL;
  TBOOL = byte;

function YES: TBOOL;
function NO: TBOOL;

type
  PSEL = ^TSEL;
  TSEL = Pointer;

  PClass = ^TClass;
  TClass = Pointer;

  Tobjc_object = record
    class_pointer: TClass;
  end;
  Pobjc_object = ^Tobjc_object;

  Tid = Pobjc_object;
  Pid = ^Tid;

  TIMP = function(para1: Tid; para2: TSEL): Tid; varargs; cdecl;

function nil_: Tid;
function Nil__: TClass;

type
  TProtocol = Tobjc_object;
  PProtocol = ^TProtocol;
  PPProtocol = ^PProtocol;

  // === Konventiert am: 31-1-26 15:22:06 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function YES: TBOOL;
begin
  YES := TBOOL(1);
end;

function NO: TBOOL;
begin
  NO := TBOOL(0);
end;

function nil_: Tid;
begin
  Result := Tid(0);
end;

function Nil__: TClass;
begin
  Result := TClass(0);
end;


{$ENDIF read_implementation}
