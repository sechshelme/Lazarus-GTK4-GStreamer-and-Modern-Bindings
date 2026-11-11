program project1;

uses
  fp_gee,
  fp_glib2;

  function my_str_equal(a: Tgconstpointer; b: Tgconstpointer; user_data: Tgpointer): Tgboolean; cdecl;
  begin
    Result := g_str_equal(a, b);
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
    gee_abstract_collection_add(GEE_ABSTRACT_COLLECTION(list), PChar('bbb'));
    gee_abstract_collection_add(GEE_ABSTRACT_COLLECTION(list), PChar('aaa'));

    it := gee_iterable_iterator(GEE_ITERABLE(list));

    g_printf('Inhalt der Libgee-Liste:'#10);
    while gee_iterator_next(it) do begin
      g_printf('- %s'#10, gee_iterator_get(it));
    end;

    g_object_unref(it);
    g_object_unref(list);
  end;

begin
  main;
end.
