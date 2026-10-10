program project1;

uses
  Crt,
  fp_asan;

  procedure main;
  const
    ARRAY_SIZE = 100;
    TEST_START = 20;
    TEST_LEN = 50;
  var
    arr: PInteger;
    addr: PLongInt;
    i: integer;
  begin
    arr := Getmem(ARRAY_SIZE * sizeof(integer));

    __asan_poison_memory_region(@arr[TEST_START], TEST_LEN * SizeOf(integer));

    for i := 0 to ARRAY_SIZE - 1 do begin
      addr := @arr[i];
      if __asan_address_is_poisoned(addr) <> 0 then begin
        TextAttr := 12;
      end;
      Write(i: 4);
      TextAttr := 7;
    end;

    WriteLn(#10);

    Freemem(arr);
  end;

begin
  main;
end.
