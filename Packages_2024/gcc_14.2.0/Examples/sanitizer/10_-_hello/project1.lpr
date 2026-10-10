program project1;

uses
  fp_asan;

  procedure main;
  var
    arr: PInteger;
    ziel_adresse: PLongInt;
  begin
    arr :=Getmem(100 * sizeof(Integer));

    __asan_poison_memory_region(@arr[15], 15 * SizeOf(Integer));

    ziel_adresse := @arr[7];

    if __asan_address_is_poisoned(ziel_adresse)<>0 then begin
        WriteLn('7   [Manuell] Alarm! Adresse %p ist vergiftet! Programm wird beendet.',PtrUInt( ziel_adresse));
    end;

    ziel_adresse := @arr[27];

    if __asan_address_is_poisoned(ziel_adresse)<>0 then begin
        WriteLn('27   [Manuell] Alarm! Adresse %p ist vergiftet! Programm wird beendet.',PtrUInt( ziel_adresse));
    end;

    WriteLn('Wert: ', arr[7]);

    Freemem(arr);
  end;

begin
  main;
end.
