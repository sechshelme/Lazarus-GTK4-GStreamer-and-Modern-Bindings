
function GEE_TYPE_TRAVERSABLE: TGType;
begin
  Result := gee_traversable_get_type;
end;

function GEE_TRAVERSABLE(obj: Pointer): PGeeTraversable;
begin
  Result := PGeeTraversable(g_type_check_instance_cast(obj, GEE_TYPE_TRAVERSABLE));
end;

function GEE_IS_TRAVERSABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_TRAVERSABLE);
end;

function GEE_TRAVERSABLE_GET_IFACE(inst: Pointer): PGeeTraversableInterface;
begin
  Result := g_type_interface_peek(inst, GEE_TYPE_TRAVERSABLE);
end;


function GEE_TYPE_TRAVERSABLE_STREAM: TGType;
begin
  Result := gee_traversable_stream_get_type;
end;

// ====

function GEE_TYPE_LAZY: TGType;
begin
  Result := gee_lazy_get_type;
end;

function GEE_LAZY(obj: Pointer): PGeeLazy;
begin
  Result := PGeeLazy(g_type_check_instance_cast(obj, GEE_TYPE_LAZY));
end;

function GEE_LAZY_CLASS(klass: Pointer): PGeeLazyClass;
begin
  Result := PGeeLazyClass(g_type_check_class_cast(klass, GEE_TYPE_LAZY));
end;

function GEE_IS_LAZY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_LAZY);
end;

function GEE_IS_LAZY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEE_TYPE_LAZY);
end;

function GEE_LAZY_GET_CLASS(obj: Pointer): PGeeLazyClass;
begin
  Result := PGeeLazyClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GEE_TYPE_ITERATOR: TGType;
begin
  Result := gee_iterator_get_type;
end;

function GEE_ITERATOR(obj: Pointer): PGeeIterator;
begin
  Result := PGeeIterator(g_type_check_instance_cast(obj, GEE_TYPE_ITERATOR));
end;

function GEE_IS_ITERATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_ITERATOR);
end;

function GEE_ITERATOR_GET_IFACE(inst: Pointer): PGeeIteratorInterface;
begin
  Result := g_type_interface_peek(inst, GEE_TYPE_ITERATOR);
end;

// ====

function GEE_TYPE_ITERABLE: TGType;
begin
  Result := gee_iterable_get_type;
end;

function GEE_ITERABLE(obj: Pointer): PGeeIterable;
begin
  Result := PGeeIterable(g_type_check_instance_cast(obj, GEE_TYPE_ITERABLE));
end;

function GEE_IS_ITERABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_ITERABLE);
end;

function GEE_ITERABLE_GET_IFACE(inst: Pointer): PGeeIterableInterface;
begin
  Result := g_type_interface_peek(inst, GEE_TYPE_ITERABLE);
end;

// ====

function GEE_TYPE_COLLECTION: TGType;
begin
  Result := gee_collection_get_type;
end;

function GEE_COLLECTION(obj: Pointer): PGeeCollection;
begin
  Result := PGeeCollection(g_type_check_instance_cast(obj, GEE_TYPE_COLLECTION));
end;

function GEE_IS_COLLECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_COLLECTION);
end;

function GEE_COLLECTION_GET_IFACE(inst: Pointer): PGeeCollectionInterface;
begin
  Result := g_type_interface_peek(inst, GEE_TYPE_COLLECTION);
end;

// ====

function GEE_TYPE_ABSTRACT_COLLECTION: TGType;
begin
  Result := gee_abstract_collection_get_type;
end;

function GEE_ABSTRACT_COLLECTION(obj: Pointer): PGeeAbstractCollection;
begin
  Result := PGeeAbstractCollection(g_type_check_instance_cast(obj, GEE_TYPE_ABSTRACT_COLLECTION));
end;

function GEE_ABSTRACT_COLLECTION_CLASS(klass: Pointer): PGeeAbstractCollectionClass;
begin
  Result := PGeeAbstractCollectionClass(g_type_check_class_cast(klass, GEE_TYPE_ABSTRACT_COLLECTION));
end;

function GEE_IS_ABSTRACT_COLLECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_ABSTRACT_COLLECTION);
end;

function GEE_IS_ABSTRACT_COLLECTION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEE_TYPE_ABSTRACT_COLLECTION);
end;

function GEE_ABSTRACT_COLLECTION_GET_CLASS(obj: Pointer): PGeeAbstractCollectionClass;
begin
  Result := PGeeAbstractCollectionClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GEE_TYPE_LIST: TGType;
begin
  Result := gee_list_get_type;
end;

function GEE_LIST(obj: Pointer): PGeeList;
begin
  Result := PGeeList(g_type_check_instance_cast(obj, GEE_TYPE_LIST));
end;

function GEE_IS_LIST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_LIST);
end;

function GEE_LIST_GET_IFACE(inst: Pointer): PGeeListInterface;
begin
  Result := g_type_interface_peek(inst, GEE_TYPE_LIST);
end;

// ====

function GEE_TYPE_LIST_ITERATOR: TGType;
begin
  Result := gee_list_iterator_get_type;
end;

function GEE_LIST_ITERATOR(obj: Pointer): PGeeListIterator;
begin
  Result := PGeeListIterator(g_type_check_instance_cast(obj, GEE_TYPE_LIST_ITERATOR));
end;

function GEE_IS_LIST_ITERATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_LIST_ITERATOR);
end;

function GEE_LIST_ITERATOR_GET_IFACE(inst: Pointer): PGeeListIteratorInterface;
begin
  Result := g_type_interface_peek(inst, GEE_TYPE_LIST_ITERATOR);
end;

// ====

function GEE_TYPE_ABSTRACT_LIST: TGType;
begin
  Result := gee_abstract_list_get_type;
end;

function GEE_ABSTRACT_LIST(obj: Pointer): PGeeAbstractList;
begin
  Result := PGeeAbstractList(g_type_check_instance_cast(obj, GEE_TYPE_ABSTRACT_LIST));
end;

function GEE_ABSTRACT_LIST_CLASS(klass: Pointer): PGeeAbstractListClass;
begin
  Result := PGeeAbstractListClass(g_type_check_class_cast(klass, GEE_TYPE_ABSTRACT_LIST));
end;

function GEE_IS_ABSTRACT_LIST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_ABSTRACT_LIST);
end;

function GEE_IS_ABSTRACT_LIST_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEE_TYPE_ABSTRACT_LIST);
end;

function GEE_ABSTRACT_LIST_GET_CLASS(obj: Pointer): PGeeAbstractListClass;
begin
  Result := PGeeAbstractListClass(PGTypeInstance(obj)^.g_class);
end;

// ==== 

function GEE_TYPE_BIDIR_LIST: TGType;
begin
  Result := gee_bidir_list_get_type;
end;

function GEE_BIDIR_LIST(obj: Pointer): PGeeBidirList;
begin
  Result := PGeeBidirList(g_type_check_instance_cast(obj, GEE_TYPE_BIDIR_LIST));
end;

function GEE_IS_BIDIR_LIST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_BIDIR_LIST);
end;

function GEE_BIDIR_LIST_GET_IFACE(inst: Pointer): PGeeBidirListInterface;
begin
  Result := g_type_interface_peek(inst, GEE_TYPE_BIDIR_LIST);
end;

// ====

function GEE_TYPE_BIDIR_LIST_ITERATOR: TGType;
begin
  Result := gee_bidir_list_iterator_get_type;
end;

function GEE_BIDIR_LIST_ITERATOR(obj: Pointer): PGeeBidirListIterator;
begin
  Result := PGeeBidirListIterator(g_type_check_instance_cast(obj, GEE_TYPE_BIDIR_LIST_ITERATOR));
end;

function GEE_IS_BIDIR_LIST_ITERATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_BIDIR_LIST_ITERATOR);
end;

function GEE_BIDIR_LIST_ITERATOR_GET_IFACE(inst: Pointer): PGeeBidirListIteratorInterface;
begin
  Result := g_type_interface_peek(inst, GEE_TYPE_BIDIR_LIST_ITERATOR);
end;

// ====

function GEE_TYPE_BIDIR_ITERATOR: TGType;
begin
  Result := gee_bidir_iterator_get_type;
end;

function GEE_BIDIR_ITERATOR(obj: Pointer): PGeeBidirIterator;
begin
  Result := PGeeBidirIterator(g_type_check_instance_cast(obj, GEE_TYPE_BIDIR_ITERATOR));
end;

function GEE_IS_BIDIR_ITERATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_BIDIR_ITERATOR);
end;

function GEE_BIDIR_ITERATOR_GET_IFACE(inst: Pointer): PGeeBidirIteratorInterface;
begin
  Result := g_type_interface_peek(inst, GEE_TYPE_BIDIR_ITERATOR);
end;

// ====

function GEE_TYPE_ABSTRACT_BIDIR_LIST: TGType;
begin
  Result := gee_abstract_bidir_list_get_type;
end;

function GEE_ABSTRACT_BIDIR_LIST(obj: Pointer): PGeeAbstractBidirList;
begin
  Result := PGeeAbstractBidirList(g_type_check_instance_cast(obj, GEE_TYPE_ABSTRACT_BIDIR_LIST));
end;

function GEE_ABSTRACT_BIDIR_LIST_CLASS(klass: Pointer): PGeeAbstractBidirListClass;
begin
  Result := PGeeAbstractBidirListClass(g_type_check_class_cast(klass, GEE_TYPE_ABSTRACT_BIDIR_LIST));
end;

function GEE_IS_ABSTRACT_BIDIR_LIST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_ABSTRACT_BIDIR_LIST);
end;

function GEE_IS_ABSTRACT_BIDIR_LIST_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEE_TYPE_ABSTRACT_BIDIR_LIST);
end;

function GEE_ABSTRACT_BIDIR_LIST_GET_CLASS(obj: Pointer): PGeeAbstractBidirListClass;
begin
  Result := PGeeAbstractBidirListClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GEE_TYPE_SET: TGType;
begin
  Result := gee_set_get_type;
end;

function GEE_SET(obj: Pointer): PGeeSet;
begin
  Result := PGeeSet(g_type_check_instance_cast(obj, GEE_TYPE_SET));
end;

function GEE_IS_SET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_SET);
end;

function GEE_SET_GET_IFACE(inst: Pointer): PGeeSetInterface;
begin
  Result := g_type_interface_peek(inst, GEE_TYPE_SET);
end;

// ====

function GEE_TYPE_ABSTRACT_SET: TGType;
begin
  Result := gee_abstract_set_get_type;
end;

function GEE_ABSTRACT_SET(obj: Pointer): PGeeAbstractSet;
begin
  Result := PGeeAbstractSet(g_type_check_instance_cast(obj, GEE_TYPE_ABSTRACT_SET));
end;

function GEE_ABSTRACT_SET_CLASS(klass: Pointer): PGeeAbstractSetClass;
begin
  Result := PGeeAbstractSetClass(g_type_check_class_cast(klass, GEE_TYPE_ABSTRACT_SET));
end;

function GEE_IS_ABSTRACT_SET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_ABSTRACT_SET);
end;

function GEE_IS_ABSTRACT_SET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEE_TYPE_ABSTRACT_SET);
end;

function GEE_ABSTRACT_SET_GET_CLASS(obj: Pointer): PGeeAbstractSetClass;
begin
  Result := PGeeAbstractSetClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GEE_TYPE_SORTED_SET: TGType;
begin
  Result := gee_sorted_set_get_type;
end;

function GEE_SORTED_SET_CLASS(klass: Pointer): PGeeSortedSetClass;
begin
  Result := PGeeSortedSetClass(g_type_check_class_cast(klass, GEE_TYPE_SORTED_SET));
end;

function GEE_IS_SORTED_SET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_SORTED_SET);
end;

function GEE_SORTED_SET_GET_IFACE(inst: Pointer): PGeeSortedSetInterface;
begin
  Result := g_type_interface_peek(inst, GEE_TYPE_SORTED_SET);
end;

// ====

function GEE_TYPE_ABSTRACT_SORTED_SET: TGType;
begin
  Result := gee_abstract_sorted_set_get_type;
end;

function GEE_ABSTRACT_SORTED_SET(obj: Pointer): PGeeAbstractSortedSet;
begin
  Result := PGeeAbstractSortedSet(g_type_check_instance_cast(obj, GEE_TYPE_ABSTRACT_SORTED_SET));
end;

function GEE_ABSTRACT_SORTED_SET_CLASS(klass: Pointer): PGeeAbstractSortedSetClass;
begin
  Result := PGeeAbstractSortedSetClass(g_type_check_class_cast(klass, GEE_TYPE_ABSTRACT_SORTED_SET));
end;

function GEE_IS_ABSTRACT_SORTED_SET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_ABSTRACT_SORTED_SET);
end;

function GEE_IS_ABSTRACT_SORTED_SET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEE_TYPE_ABSTRACT_SORTED_SET);
end;

function GEE_ABSTRACT_SORTED_SET_GET_CLASS(obj: Pointer): PGeeAbstractSortedSetClass;
begin
  Result := PGeeAbstractSortedSetClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GEE_TYPE_BIDIR_SORTED_SET: TGType;
begin
  Result := gee_bidir_sorted_set_get_type;
end;

function GEE_BIDIR_SORTED_SET(obj: Pointer): PGeeBidirSortedSet;
begin
  Result := PGeeBidirSortedSet(g_type_check_instance_cast(obj, GEE_TYPE_BIDIR_SORTED_SET));
end;

function GEE_IS_BIDIR_SORTED_SET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_BIDIR_SORTED_SET);
end;

function GEE_BIDIR_SORTED_SET_GET_IFACE(inst: Pointer): PGeeBidirSortedSetInterface;
begin
  Result := g_type_interface_peek(inst, GEE_TYPE_BIDIR_SORTED_SET);
end;

// ====

function GEE_TYPE_ABSTRACT_BIDIR_SORTED_SET: TGType;
begin
  Result := gee_abstract_bidir_sorted_set_get_type;
end;

function GEE_ABSTRACT_BIDIR_SORTED_SET(obj: Pointer): PGeeAbstractBidirSortedSet;
begin
  Result := PGeeAbstractBidirSortedSet(g_type_check_instance_cast(obj, GEE_TYPE_ABSTRACT_BIDIR_SORTED_SET));
end;

function GEE_ABSTRACT_BIDIR_SORTED_SET_CLASS(klass: Pointer): PGeeAbstractBidirSortedSetClass;
begin
  Result := PGeeAbstractBidirSortedSetClass(g_type_check_class_cast(klass, GEE_TYPE_ABSTRACT_BIDIR_SORTED_SET));
end;

function GEE_IS_ABSTRACT_BIDIR_SORTED_SET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_ABSTRACT_BIDIR_SORTED_SET);
end;

function GEE_IS_ABSTRACT_BIDIR_SORTED_SET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEE_TYPE_ABSTRACT_BIDIR_SORTED_SET);
end;

function GEE_ABSTRACT_BIDIR_SORTED_SET_GET_CLASS(obj: Pointer): PGeeAbstractBidirSortedSetClass;
begin
  Result := PGeeAbstractBidirSortedSetClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GEE_TYPE_MAP: TGType;
begin
  Result := gee_map_get_type;
end;

function GEE_MAP(obj: Pointer): PGeeMap;
begin
  Result := PGeeMap(g_type_check_instance_cast(obj, GEE_TYPE_MAP));
end;

function GEE_IS_MAP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_MAP);
end;

function GEE_MAP_GET_IFACE(inst: Pointer): PGeeMapInterface;
begin
  Result := g_type_interface_peek(inst, GEE_TYPE_MAP);
end;

// ====

function GEE_TYPE_MAP_ITERATOR: TGType;
begin
  Result := gee_map_iterator_get_type;
end;

function GEE_MAP_ITERATOR(obj: Pointer): PGeeMapIterator;
begin
  Result := PGeeMapIterator(g_type_check_instance_cast(obj, GEE_TYPE_MAP_ITERATOR));
end;

function GEE_IS_MAP_ITERATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_MAP_ITERATOR);
end;

function GEE_MAP_ITERATOR_GET_IFACE(inst: Pointer): PGeeMapIteratorInterface;
begin
  Result := g_type_interface_peek(inst, GEE_TYPE_MAP_ITERATOR);
end;

// ====

function GEE_TYPE_MAP_ENTRY: TGType;
begin
  Result := gee_map_entry_get_type;
end;

function GEE_MAP_ENTRY(obj: Pointer): PGeeMapEntry;
begin
  Result := PGeeMapEntry(g_type_check_instance_cast(obj, GEE_TYPE_MAP_ENTRY));
end;

function GEE_MAP_ENTRY_CLASS(klass: Pointer): PGeeMapEntryClass;
begin
  Result := PGeeMapEntryClass(g_type_check_class_cast(klass, GEE_TYPE_MAP_ENTRY));
end;

function GEE_IS_MAP_ENTRY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_MAP_ENTRY);
end;

function GEE_IS_MAP_ENTRY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEE_TYPE_MAP_ENTRY);
end;

function GEE_MAP_ENTRY_GET_CLASS(obj: Pointer): PGeeMapEntryClass;
begin
  Result := PGeeMapEntryClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GEE_TYPE_ABSTRACT_MAP: TGType;
begin
  Result := gee_abstract_map_get_type;
end;

function GEE_ABSTRACT_MAP(obj: Pointer): PGeeAbstractMap;
begin
  Result := PGeeAbstractMap(g_type_check_instance_cast(obj, GEE_TYPE_ABSTRACT_MAP));
end;

function GEE_ABSTRACT_MAP_CLASS(klass: Pointer): PGeeAbstractMapClass;
begin
  Result := PGeeAbstractMapClass(g_type_check_class_cast(klass, GEE_TYPE_ABSTRACT_MAP));
end;

function GEE_IS_ABSTRACT_MAP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_ABSTRACT_MAP);
end;

function GEE_IS_ABSTRACT_MAP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEE_TYPE_ABSTRACT_MAP);
end;

function GEE_ABSTRACT_MAP_GET_CLASS(obj: Pointer): PGeeAbstractMapClass;
begin
  Result := PGeeAbstractMapClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GEE_TYPE_SORTED_MAP: TGType;
begin
  Result := gee_sorted_map_get_type;
end;

function GEE_SORTED_MAP(obj: Pointer): PGeeSortedMap;
begin
  Result := PGeeSortedMap(g_type_check_instance_cast(obj, GEE_TYPE_SORTED_MAP));
end;

function GEE_IS_SORTED_MAP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_SORTED_MAP);
end;

function GEE_SORTED_MAP_GET_IFACE(inst: Pointer): PGeeSortedMapInterface;
begin
  Result := g_type_interface_peek(inst, GEE_TYPE_SORTED_MAP);
end;

// ====

function GEE_TYPE_ABSTRACT_SORTED_MAP: TGType;
begin
  Result := gee_abstract_sorted_map_get_type;
end;

function GEE_ABSTRACT_SORTED_MAP(obj: Pointer): PGeeAbstractSortedMap;
begin
  Result := PGeeAbstractSortedMap(g_type_check_instance_cast(obj, GEE_TYPE_ABSTRACT_SORTED_MAP));
end;

function GEE_ABSTRACT_SORTED_MAP_CLASS(klass: Pointer): PGeeAbstractSortedMapClass;
begin
  Result := PGeeAbstractSortedMapClass(g_type_check_class_cast(klass, GEE_TYPE_ABSTRACT_SORTED_MAP));
end;

function GEE_IS_ABSTRACT_SORTED_MAP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_ABSTRACT_SORTED_MAP);
end;

function GEE_IS_ABSTRACT_SORTED_MAP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEE_TYPE_ABSTRACT_SORTED_MAP);
end;

function GEE_ABSTRACT_SORTED_MAP_GET_CLASS(obj: Pointer): PGeeAbstractSortedMapClass;
begin
  Result := PGeeAbstractSortedMapClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GEE_TYPE_BIDIR_SORTED_MAP: TGType;
begin
  Result := gee_bidir_sorted_map_get_type;
end;

function GEE_BIDIR_SORTED_MAP(obj: Pointer): PGeeBidirSortedMap;
begin
  Result := PGeeBidirSortedMap(g_type_check_instance_cast(obj, GEE_TYPE_BIDIR_SORTED_MAP));
end;

function GEE_IS_BIDIR_SORTED_MAP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_BIDIR_SORTED_MAP);
end;

function GEE_BIDIR_SORTED_MAP_GET_IFACE(inst: Pointer): PGeeBidirSortedMapInterface;
begin
  Result := g_type_interface_peek(inst, GEE_TYPE_BIDIR_SORTED_MAP);
end;

// ====

function GEE_TYPE_BIDIR_MAP_ITERATOR: TGType;
begin
  Result := gee_bidir_map_iterator_get_type;
end;

function GEE_BIDIR_MAP_ITERATOR(obj: Pointer): PGeeBidirMapIterator;
begin
  Result := PGeeBidirMapIterator(g_type_check_instance_cast(obj, GEE_TYPE_BIDIR_MAP_ITERATOR));
end;

function GEE_IS_BIDIR_MAP_ITERATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_BIDIR_MAP_ITERATOR);
end;

function GEE_BIDIR_MAP_ITERATOR_GET_IFACE(inst: Pointer): PGeeBidirMapIteratorInterface;
begin
  Result := g_type_interface_peek(inst, GEE_TYPE_BIDIR_MAP_ITERATOR);
end;

// ====

function GEE_TYPE_ABSTRACT_BIDIR_SORTED_MAP: TGType;
begin
  Result := gee_abstract_bidir_sorted_map_get_type;
end;

function GEE_ABSTRACT_BIDIR_SORTED_MAP(obj: Pointer): PGeeAbstractBidirSortedMap;
begin
  Result := PGeeAbstractBidirSortedMap(g_type_check_instance_cast(obj, GEE_TYPE_ABSTRACT_BIDIR_SORTED_MAP));
end;

function GEE_ABSTRACT_BIDIR_SORTED_MAP_CLASS(klass: Pointer): PGeeAbstractBidirSortedMapClass;
begin
  Result := PGeeAbstractBidirSortedMapClass(g_type_check_class_cast(klass, GEE_TYPE_ABSTRACT_BIDIR_SORTED_MAP));
end;

function GEE_IS_ABSTRACT_BIDIR_SORTED_MAP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_ABSTRACT_BIDIR_SORTED_MAP);
end;

function GEE_IS_ABSTRACT_BIDIR_SORTED_MAP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEE_TYPE_ABSTRACT_BIDIR_SORTED_MAP);
end;

function GEE_ABSTRACT_BIDIR_SORTED_MAP_GET_CLASS(obj: Pointer): PGeeAbstractBidirSortedMapClass;
begin
  Result := PGeeAbstractBidirSortedMapClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GEE_TYPE_MULTI_MAP: TGType;
begin
  Result := gee_multi_map_get_type;
end;

function GEE_MULTI_MAP(obj: Pointer): PGeeMultiMap;
begin
  Result := PGeeMultiMap(g_type_check_instance_cast(obj, GEE_TYPE_MULTI_MAP));
end;

function GEE_IS_MULTI_MAP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_MULTI_MAP);
end;

function GEE_MULTI_MAP_GET_IFACE(inst: Pointer): PGeeMultiMapInterface;
begin
  Result := g_type_interface_peek(inst, GEE_TYPE_MULTI_MAP);
end;

// ====

function GEE_TYPE_MULTI_SET: TGType;
begin
  Result := gee_multi_set_get_type;
end;

function GEE_MULTI_SET(obj: Pointer): PGeeMultiSet;
begin
  Result := PGeeMultiSet(g_type_check_instance_cast(obj, GEE_TYPE_MULTI_SET));
end;

function GEE_IS_MULTI_SET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_MULTI_SET);
end;

function GEE_MULTI_SET_GET_IFACE(inst: Pointer): PGeeMultiSetInterface;
begin
  Result := g_type_interface_peek(inst, GEE_TYPE_MULTI_SET);
end;

// ====

function GEE_TYPE_ABSTRACT_MULTI_MAP: TGType;
begin
  Result := gee_abstract_multi_map_get_type;
end;

function GEE_ABSTRACT_MULTI_MAP(obj: Pointer): PGeeAbstractMultiMap;
begin
  Result := PGeeAbstractMultiMap(g_type_check_instance_cast(obj, GEE_TYPE_ABSTRACT_MULTI_MAP));
end;

function GEE_ABSTRACT_MULTI_MAP_CLASS(klass: Pointer): PGeeAbstractMultiMapClass;
begin
  Result := PGeeAbstractMultiMapClass(g_type_check_class_cast(klass, GEE_TYPE_ABSTRACT_MULTI_MAP));
end;

function GEE_IS_ABSTRACT_MULTI_MAP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_ABSTRACT_MULTI_MAP);
end;

function GEE_IS_ABSTRACT_MULTI_MAP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEE_TYPE_ABSTRACT_MULTI_MAP);
end;

function GEE_ABSTRACT_MULTI_MAP_GET_CLASS(obj: Pointer): PGeeAbstractMultiMapClass;
begin
  Result := PGeeAbstractMultiMapClass(PGTypeInstance(obj)^.g_class);
end;

// ==== 

function GEE_TYPE_ABSTRACT_MULTI_SET: TGType;
begin
  Result := gee_abstract_multi_set_get_type;
end;

function GEE_ABSTRACT_MULTI_SET(obj: Pointer): PGeeAbstractMultiSet;
begin
  Result := PGeeAbstractMultiSet(g_type_check_instance_cast(obj, GEE_TYPE_ABSTRACT_MULTI_SET));
end;

function GEE_ABSTRACT_MULTI_SET_CLASS(klass: Pointer): PGeeAbstractMultiSetClass;
begin
  Result := PGeeAbstractMultiSetClass(g_type_check_class_cast(klass, GEE_TYPE_ABSTRACT_MULTI_SET));
end;

function GEE_IS_ABSTRACT_MULTI_SET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_ABSTRACT_MULTI_SET);
end;

function GEE_IS_ABSTRACT_MULTI_SET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEE_TYPE_ABSTRACT_MULTI_SET);
end;

function GEE_ABSTRACT_MULTI_SET_GET_CLASS(obj: Pointer): PGeeAbstractMultiSetClass;
begin
  Result := PGeeAbstractMultiSetClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GEE_TYPE_QUEUE: TGType;
begin
  Result := gee_queue_get_type;
end;

function GEE_QUEUE(obj: Pointer): PGeeQueue;
begin
  Result := PGeeQueue(g_type_check_instance_cast(obj, GEE_TYPE_QUEUE));
end;

function GEE_IS_QUEUE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_QUEUE);
end;

function GEE_QUEUE_GET_IFACE(inst: Pointer): PGeeQueueInterface;
begin
  Result := g_type_interface_peek(inst, GEE_TYPE_QUEUE);
end;

// ====

function GEE_TYPE_ABSTRACT_QUEUE: TGType;
begin
  Result := gee_abstract_queue_get_type;
end;

function GEE_ABSTRACT_QUEUE(obj: Pointer): PGeeAbstractQueue;
begin
  Result := PGeeAbstractQueue(g_type_check_instance_cast(obj, GEE_TYPE_ABSTRACT_QUEUE));
end;

function GEE_ABSTRACT_QUEUE_CLASS(klass: Pointer): PGeeAbstractQueueClass;
begin
  Result := PGeeAbstractQueueClass(g_type_check_class_cast(klass, GEE_TYPE_ABSTRACT_QUEUE));
end;

function GEE_IS_ABSTRACT_QUEUE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_ABSTRACT_QUEUE);
end;

function GEE_IS_ABSTRACT_QUEUE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEE_TYPE_ABSTRACT_QUEUE);
end;

function GEE_ABSTRACT_QUEUE_GET_CLASS(obj: Pointer): PGeeAbstractQueueClass;
begin
  Result := PGeeAbstractQueueClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GEE_TYPE_ARRAY_LIST: TGType;
begin
  Result := gee_array_list_get_type;
end;

function GEE_ARRAY_LIST(obj: Pointer): PGeeArrayList;
begin
  Result := PGeeArrayList(g_type_check_instance_cast(obj, GEE_TYPE_ARRAY_LIST));
end;

function GEE_ARRAY_LIST_CLASS(klass: Pointer): PGeeArrayListClass;
begin
  Result := PGeeArrayListClass(g_type_check_class_cast(klass, GEE_TYPE_ARRAY_LIST));
end;

function GEE_IS_ARRAY_LIST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_ARRAY_LIST);
end;

function GEE_IS_ARRAY_LIST_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEE_TYPE_ARRAY_LIST);
end;

function GEE_ARRAY_LIST_GET_CLASS(obj: Pointer): PGeeArrayListClass;
begin
  Result := PGeeArrayListClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GEE_TYPE_DEQUE: TGType;
begin
  Result := gee_deque_get_type;
end;

function GEE_DEQUE(obj: Pointer): PGeeDeque;
begin
  Result := PGeeDeque(g_type_check_instance_cast(obj, GEE_TYPE_DEQUE));
end;

function GEE_IS_DEQUE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_DEQUE);
end;

function GEE_DEQUE_GET_IFACE(inst: Pointer): PGeeDequeInterface;
begin
  Result := g_type_interface_peek(inst, GEE_TYPE_DEQUE);
end;

// ====

function GEE_TYPE_ARRAY_QUEUE: TGType;
begin
  Result := gee_array_queue_get_type;
end;

function GEE_ARRAY_QUEUE(obj: Pointer): PGeeArrayQueue;
begin
  Result := PGeeArrayQueue(g_type_check_instance_cast(obj, GEE_TYPE_ARRAY_QUEUE));
end;

function GEE_ARRAY_QUEUE_CLASS(klass: Pointer): PGeeArrayQueueClass;
begin
  Result := PGeeArrayQueueClass(g_type_check_class_cast(klass, GEE_TYPE_ARRAY_QUEUE));
end;

function GEE_IS_ARRAY_QUEUE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_ARRAY_QUEUE);
end;

function GEE_IS_ARRAY_QUEUE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEE_TYPE_ARRAY_QUEUE);
end;

function GEE_ARRAY_QUEUE_GET_CLASS(obj: Pointer): PGeeArrayQueueClass;
begin
  Result := PGeeArrayQueueClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GEE_TYPE_COMPARABLE: TGType;
begin
  Result := gee_comparable_get_type;
end;

function GEE_COMPARABLE(obj: Pointer): PGeeComparable;
begin
  Result := PGeeComparable(g_type_check_instance_cast(obj, GEE_TYPE_COMPARABLE));
end;

function GEE_IS_COMPARABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_COMPARABLE);
end;

function GEE_COMPARABLE_GET_IFACE(inst: Pointer): PGeeComparableInterface;
begin
  Result := g_type_interface_peek(inst, GEE_TYPE_COMPARABLE);
end;

// ====

function GEE_TYPE_CONCURRENT_LIST: TGType;
begin
  Result := gee_concurrent_list_get_type;
end;

function GEE_CONCURRENT_LIST(obj: Pointer): PGeeConcurrentList;
begin
  Result := PGeeConcurrentList(g_type_check_instance_cast(obj, GEE_TYPE_CONCURRENT_LIST));
end;

function GEE_CONCURRENT_LIST_CLASS(klass: Pointer): PGeeConcurrentListClass;
begin
  Result := PGeeConcurrentListClass(g_type_check_class_cast(klass, GEE_TYPE_CONCURRENT_LIST));
end;

function GEE_IS_CONCURRENT_LIST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_CONCURRENT_LIST);
end;

function GEE_IS_CONCURRENT_LIST_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEE_TYPE_CONCURRENT_LIST);
end;

function GEE_CONCURRENT_LIST_GET_CLASS(obj: Pointer): PGeeConcurrentListClass;
begin
  Result := PGeeConcurrentListClass(PGTypeInstance(obj)^.g_class);
end;

// ====


function GEE_TYPE_CONCURRENT_SET: TGType;
begin
  Result := gee_concurrent_set_get_type;
end;

function GEE_CONCURRENT_SET(obj: Pointer): PGeeConcurrentSet;
begin
  Result := PGeeConcurrentSet(g_type_check_instance_cast(obj, GEE_TYPE_CONCURRENT_SET));
end;

function GEE_CONCURRENT_SET_CLASS(klass: Pointer): PGeeConcurrentSetClass;
begin
  Result := PGeeConcurrentSetClass(g_type_check_class_cast(klass, GEE_TYPE_CONCURRENT_SET));
end;

function GEE_IS_CONCURRENT_SET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_CONCURRENT_SET);
end;

function GEE_IS_CONCURRENT_SET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEE_TYPE_CONCURRENT_SET);
end;

function GEE_CONCURRENT_SET_GET_CLASS(obj: Pointer): PGeeConcurrentSetClass;
begin
  Result := PGeeConcurrentSetClass(PGTypeInstance(obj)^.g_class);
end;


function GEE_TYPE_CONCURRENT_SET_RANGE_TYPE: TGType;
begin
  Result := gee_concurrent_set_range_type_get_type;
end;

// ====

function GEE_TYPE_FUTURE: TGType;
begin
  Result := gee_future_get_type;
end;

function GEE_FUTURE(obj: Pointer): PGeeFuture;
begin
  Result := PGeeFuture(g_type_check_instance_cast(obj, GEE_TYPE_FUTURE));
end;

function GEE_IS_FUTURE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_FUTURE);
end;

function GEE_FUTURE_GET_IFACE(inst: Pointer): PGeeFutureInterface;
begin
  Result := g_type_interface_peek(inst, GEE_TYPE_FUTURE);
end;

// ====

function GEE_TYPE_HASHABLE: TGType;
begin
  Result := gee_hashable_get_type;
end;

function GEE_HASHABLE(obj: Pointer): PGeeHashable;
begin
  Result := PGeeHashable(g_type_check_instance_cast(obj, GEE_TYPE_HASHABLE));
end;

function GEE_IS_HASHABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_HASHABLE);
end;

function GEE_HASHABLE_GET_IFACE(inst: Pointer): PGeeHashableInterface;
begin
  Result := g_type_interface_peek(inst, GEE_TYPE_HASHABLE);
end;

// ====

function GEE_TYPE_HASH_MAP: TGType;
begin
  Result := gee_hash_map_get_type;
end;

function GEE_HASH_MAP(obj: Pointer): PGeeHashMap;
begin
  Result := PGeeHashMap(g_type_check_instance_cast(obj, GEE_TYPE_HASH_MAP));
end;

function GEE_HASH_MAP_CLASS(klass: Pointer): PGeeHashMapClass;
begin
  Result := PGeeHashMapClass(g_type_check_class_cast(klass, GEE_TYPE_HASH_MAP));
end;

function GEE_IS_HASH_MAP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_HASH_MAP);
end;

function GEE_IS_HASH_MAP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEE_TYPE_HASH_MAP);
end;

function GEE_HASH_MAP_GET_CLASS(obj: Pointer): PGeeHashMapClass;
begin
  Result := PGeeHashMapClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GEE_TYPE_HASH_MULTI_MAP: TGType;
begin
  Result := gee_hash_multi_map_get_type;
end;

function GEE_HASH_MULTI_MAP(obj: Pointer): PGeeHashMultiMap;
begin
  Result := PGeeHashMultiMap(g_type_check_instance_cast(obj, GEE_TYPE_HASH_MULTI_MAP));
end;

function GEE_HASH_MULTI_MAP_CLASS(klass: Pointer): PGeeHashMultiMapClass;
begin
  Result := PGeeHashMultiMapClass(g_type_check_class_cast(klass, GEE_TYPE_HASH_MULTI_MAP));
end;

function GEE_IS_HASH_MULTI_MAP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_HASH_MULTI_MAP);
end;

function GEE_IS_HASH_MULTI_MAP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEE_TYPE_HASH_MULTI_MAP);
end;

function GEE_HASH_MULTI_MAP_GET_CLASS(obj: Pointer): PGeeHashMultiMapClass;
begin
  Result := PGeeHashMultiMapClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GEE_TYPE_HASH_MULTI_SET: TGType;
begin
  Result := gee_hash_multi_set_get_type;
end;

function GEE_HASH_MULTI_SET(obj: Pointer): PGeeHashMultiSet;
begin
  Result := PGeeHashMultiSet(g_type_check_instance_cast(obj, GEE_TYPE_HASH_MULTI_SET));
end;

function GEE_HASH_MULTI_SET_CLASS(klass: Pointer): PGeeHashMultiSetClass;
begin
  Result := PGeeHashMultiSetClass(g_type_check_class_cast(klass, GEE_TYPE_HASH_MULTI_SET));
end;

function GEE_IS_HASH_MULTI_SET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_HASH_MULTI_SET);
end;

function GEE_IS_HASH_MULTI_SET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEE_TYPE_HASH_MULTI_SET);
end;

function GEE_HASH_MULTI_SET_GET_CLASS(obj: Pointer): PGeeHashMultiSetClass;
begin
  Result := PGeeHashMultiSetClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GEE_TYPE_HASH_SET: TGType;
begin
  Result := gee_hash_set_get_type;
end;

function GEE_HASH_SET(obj: Pointer): PGeeHashSet;
begin
  Result := PGeeHashSet(g_type_check_instance_cast(obj, GEE_TYPE_HASH_SET));
end;

function GEE_HASH_SET_CLASS(klass: Pointer): PGeeHashSetClass;
begin
  Result := PGeeHashSetClass(g_type_check_class_cast(klass, GEE_TYPE_HASH_SET));
end;

function GEE_IS_HASH_SET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_HASH_SET);
end;

function GEE_IS_HASH_SET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEE_TYPE_HASH_SET);
end;

function GEE_HASH_SET_GET_CLASS(obj: Pointer): PGeeHashSetClass;
begin
  Result := PGeeHashSetClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GEE_TYPE_HAZARD_POINTER_POLICY: TGType;
begin
  Result := gee_hazard_pointer_policy_get_type;
end;

// =====

function GEE_TYPE_HAZARD_POINTER_RELEASE_POLICY: TGType;
begin
  Result := gee_hazard_pointer_release_policy_get_type;
end;

// ====

function GEE_TYPE_LINKED_LIST: TGType;
begin
  Result := gee_linked_list_get_type;
end;

function GEE_LINKED_LIST(obj: Pointer): PGeeLinkedList;
begin
  Result := PGeeLinkedList(g_type_check_instance_cast(obj, GEE_TYPE_LINKED_LIST));
end;

function GEE_LINKED_LIST_CLASS(klass: Pointer): PGeeLinkedListClass;
begin
  Result := PGeeLinkedListClass(g_type_check_class_cast(klass, GEE_TYPE_LINKED_LIST));
end;

function GEE_IS_LINKED_LIST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_LINKED_LIST);
end;

function GEE_IS_LINKED_LIST_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEE_TYPE_LINKED_LIST);
end;

function GEE_LINKED_LIST_GET_CLASS(obj: Pointer): PGeeLinkedListClass;
begin
  Result := PGeeLinkedListClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GEE_TYPE_PRIORITY_QUEUE: TGType;
begin
  Result := gee_priority_queue_get_type;
end;

function GEE_PRIORITY_QUEUE(obj: Pointer): PGeePriorityQueue;
begin
  Result := PGeePriorityQueue(g_type_check_instance_cast(obj, GEE_TYPE_PRIORITY_QUEUE));
end;

function GEE_PRIORITY_QUEUE_CLASS(klass: Pointer): PGeePriorityQueueClass;
begin
  Result := PGeePriorityQueueClass(g_type_check_class_cast(klass, GEE_TYPE_PRIORITY_QUEUE));
end;

function GEE_IS_PRIORITY_QUEUE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_PRIORITY_QUEUE);
end;

function GEE_IS_PRIORITY_QUEUE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEE_TYPE_PRIORITY_QUEUE);
end;

function GEE_PRIORITY_QUEUE_GET_CLASS(obj: Pointer): PGeePriorityQueueClass;
begin
  Result := PGeePriorityQueueClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GEE_TYPE_PROMISE: TGType;
begin
  Result := gee_promise_get_type;
end;

function GEE_PROMISE(obj: Pointer): PGeePromise;
begin
  Result := PGeePromise(g_type_check_instance_cast(obj, GEE_TYPE_PROMISE));
end;

function GEE_PROMISE_CLASS(klass: Pointer): PGeePromiseClass;
begin
  Result := PGeePromiseClass(g_type_check_class_cast(klass, GEE_TYPE_PROMISE));
end;

function GEE_IS_PROMISE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_PROMISE);
end;

function GEE_IS_PROMISE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEE_TYPE_PROMISE);
end;

function GEE_PROMISE_GET_CLASS(obj: Pointer): PGeePromiseClass;
begin
  Result := PGeePromiseClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GEE_TYPE_TREE_MAP: TGType;
begin
  Result := gee_tree_map_get_type;
end;

function GEE_TREE_MAP(obj: Pointer): PGeeTreeMap;
begin
  Result := PGeeTreeMap(g_type_check_instance_cast(obj, GEE_TYPE_TREE_MAP));
end;

function GEE_TREE_MAP_CLASS(klass: Pointer): PGeeTreeMapClass;
begin
  Result := PGeeTreeMapClass(g_type_check_class_cast(klass, GEE_TYPE_TREE_MAP));
end;

function GEE_IS_TREE_MAP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_TREE_MAP);
end;

function GEE_IS_TREE_MAP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEE_TYPE_TREE_MAP);
end;

function GEE_TREE_MAP_GET_CLASS(obj: Pointer): PGeeTreeMapClass;
begin
  Result := PGeeTreeMapClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GEE_TYPE_TREE_MULTI_MAP: TGType;
begin
  Result := gee_tree_multi_map_get_type;
end;

function GEE_TREE_MULTI_MAP(obj: Pointer): PGeeTreeMultiMap;
begin
  Result := PGeeTreeMultiMap(g_type_check_instance_cast(obj, GEE_TYPE_TREE_MULTI_MAP));
end;

function GEE_TREE_MULTI_MAP_CLASS(klass: Pointer): PGeeTreeMultiMapClass;
begin
  Result := PGeeTreeMultiMapClass(g_type_check_class_cast(klass, GEE_TYPE_TREE_MULTI_MAP));
end;

function GEE_IS_TREE_MULTI_MAP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_TREE_MULTI_MAP);
end;

function GEE_IS_TREE_MULTI_MAP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEE_TYPE_TREE_MULTI_MAP);
end;

function GEE_TREE_MULTI_MAP_GET_CLASS(obj: Pointer): PGeeTreeMultiMapClass;
begin
  Result := PGeeTreeMultiMapClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GEE_TYPE_TREE_MULTI_SET: TGType;
begin
  Result := gee_tree_multi_set_get_type;
end;

function GEE_TREE_MULTI_SET(obj: Pointer): PGeeTreeMultiSet;
begin
  Result := PGeeTreeMultiSet(g_type_check_instance_cast(obj, GEE_TYPE_TREE_MULTI_SET));
end;

function GEE_TREE_MULTI_SET_CLASS(klass: Pointer): PGeeTreeMultiSetClass;
begin
  Result := PGeeTreeMultiSetClass(g_type_check_class_cast(klass, GEE_TYPE_TREE_MULTI_SET));
end;

function GEE_IS_TREE_MULTI_SET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_TREE_MULTI_SET);
end;

function GEE_IS_TREE_MULTI_SET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEE_TYPE_TREE_MULTI_SET);
end;

function GEE_TREE_MULTI_SET_GET_CLASS(obj: Pointer): PGeeTreeMultiSetClass;
begin
  Result := PGeeTreeMultiSetClass(PGTypeInstance(obj)^.g_class);
end;

// ==== 

function GEE_TYPE_TREE_SET: TGType;
begin
  Result := gee_tree_set_get_type;
end;

function GEE_TREE_SET(obj: Pointer): PGeeTreeSet;
begin
  Result := PGeeTreeSet(g_type_check_instance_cast(obj, GEE_TYPE_TREE_SET));
end;

function GEE_TREE_SET_CLASS(klass: Pointer): PGeeTreeSetClass;
begin
  Result := PGeeTreeSetClass(g_type_check_class_cast(klass, GEE_TYPE_TREE_SET));
end;

function GEE_IS_TREE_SET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_TREE_SET);
end;

function GEE_IS_TREE_SET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEE_TYPE_TREE_SET);
end;

function GEE_TREE_SET_GET_CLASS(obj: Pointer): PGeeTreeSetClass;
begin
  Result := PGeeTreeSetClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GEE_TYPE_UNROLLED_LINKED_LIST: TGType;
begin
  Result := gee_unrolled_linked_list_get_type;
end;

function GEE_UNROLLED_LINKED_LIST(obj: Pointer): PGeeUnrolledLinkedList;
begin
  Result := PGeeUnrolledLinkedList(g_type_check_instance_cast(obj, GEE_TYPE_UNROLLED_LINKED_LIST));
end;

function GEE_UNROLLED_LINKED_LIST_CLASS(klass: Pointer): PGeeUnrolledLinkedListClass;
begin
  Result := PGeeUnrolledLinkedListClass(g_type_check_class_cast(klass, GEE_TYPE_UNROLLED_LINKED_LIST));
end;

function GEE_IS_UNROLLED_LINKED_LIST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_UNROLLED_LINKED_LIST);
end;

function GEE_IS_UNROLLED_LINKED_LIST_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEE_TYPE_UNROLLED_LINKED_LIST);
end;

function GEE_UNROLLED_LINKED_LIST_GET_CLASS(obj: Pointer): PGeeUnrolledLinkedListClass;
begin
  Result := PGeeUnrolledLinkedListClass(PGTypeInstance(obj)^.g_class);
end;





























































































