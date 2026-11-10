program project1;

uses
  fp_gee,
  fp_glib2;

  procedure printTitle(title: Pgchar);
  begin
    g_printf(#10#10#10'=========== %s ==============='#10#10, title);
  end;


type
  TPerson = record
    Name: array[0..49] of char;
    age: Integer;
  end;
  PPerson = ^TPerson;

  procedure PrintArray(g_arr: PGArray);
  var
    i: integer;
    p: TPerson;
  begin
    g_printf('Count: %i'#10, g_arr^.len);
    for i := 0 to g_arr^.len - 1 do begin
      p := PPerson(g_arr^.Data)[i];
      g_printf('%4i. Name: %-16s Alter: %4i'#10, i, p.Name, p.age);
    end;
  end;

  procedure ptr_free_func(Data: Tgpointer); cdecl;
  begin
    g_printf('"%s" freigegeben'#10, Data);
    g_free(Data);
  end;

  function compare(a: Tgconstpointer; b: Tgconstpointer): Tgint; cdecl;
  var
    ia:Pgint32 absolute a;
    ib:Pgint32 absolute b;
  begin
    Result:=ia^-ib^;
  end;

  procedure main;
  var
    garray: PGArray;
    i: Integer;
    p: TPerson;
    gptrarray: PGPtrArray;
  begin
    // === Integer Array

    garray := g_array_new(False, False, SizeOf(Integer));
    for i := 0 to 15 do begin
      g_array_append_val(garray, g_random_int_range(0, 15));
    end;

    printTitle('Integer array');
    for i := 0 to garray^.len - 1 do begin
      g_printf('%4i  ', PInteger(garray^.Data)[i]);
    end;

    g_array_sort(garray, @compare);

    printTitle('Integer Array sortiert');
    for i := 0 to garray^.len - 1 do begin
      g_printf('%4i  ', PInteger(garray^.Data)[i]);
    end;

    g_array_free(garray, True);


    // === record Array
    printTitle('record array');

    garray := g_array_new(False, False, SizeOf(TPerson));

    for i := 0 to 15 do begin
      g_snprintf(p.Name, SizeOf(p.Name), 'Person %d', i + 1);
      p.age := g_random_int_range(1, 99);
      g_array_append_val(garray, p);
    end;

    PrintArray(garray);
    g_array_free(garray, True);

    // === Pointer Array
    printTitle('Pointer array');

    gptrarray := g_ptr_array_new_with_free_func(@ptr_free_func);
    g_ptr_array_add(gptrarray, g_strdup('Pointer eins'));
    g_ptr_array_add(gptrarray, g_strdup('Pointer zwei'));
    g_ptr_array_add(gptrarray, g_strdup('Pointer drei'));

    for i := 0 to gptrarray^.len - 1 do begin
      g_print('Value: %s'#10, g_ptr_array_index(gptrarray, i));
    end;
    g_print(#10);

    g_ptr_array_unref(gptrarray);

    printTitle('Ende');
  end;

begin
  main;
end.
