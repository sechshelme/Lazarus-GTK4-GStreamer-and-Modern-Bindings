program project1;

uses
  fp_glib2,
  fp_gee;

  function my_str_equal(a: Tgconstpointer; b: Tgconstpointer; user_data: Tgpointer): Tgboolean; cdecl;
  begin
    Result := g_str_equal(a, b);
  end;

  procedure find(list: PGeeArrayList; s: PChar);
  begin
    if gee_abstract_collection_contains(GEE_ABSTRACT_COLLECTION(list), s) then begin
      g_printf('"%s" gefunden'#10, s);
    end else begin
      g_printf('"%s" nicht gefunden'#10);
    end;
  end;

  procedure main;
  var
    list: PGeeArrayList;
    it: PGeeIterator;
  begin
    list := gee_array_list_new(G_TYPE_POINTER, nil, nil, @my_str_equal, nil, nil);

    gee_abstract_collection_add(GEE_ABSTRACT_COLLECTION(list), PChar('Hallo'));
    gee_abstract_collection_add(GEE_ABSTRACT_COLLECTION(list), PChar('Welt'));
    gee_abstract_collection_add(GEE_ABSTRACT_COLLECTION(list), PChar('aus Libgee'));
    gee_abstract_collection_add(GEE_ABSTRACT_COLLECTION(list), PChar('BBB'));
    gee_abstract_collection_add(GEE_ABSTRACT_COLLECTION(list), PChar('aaa'));

    it := gee_iterable_iterator(GEE_ITERABLE(list));
    g_printf('Inhalt der Libgee-Liste:'#10);
    while gee_iterator_next(it) do begin
      g_printf('- %s'#10, gee_iterator_get(it));
    end;

    g_printf('"BBB" befindet sich an index %d'#10, gee_abstract_list_index_of(GEE_ABSTRACT_LIST(list), PChar('BBB')));

    find(list, 'Welt');
    find(list, 'World');

    g_object_unref(it);
    g_object_unref(list);
  end;

begin
  main;
end.
