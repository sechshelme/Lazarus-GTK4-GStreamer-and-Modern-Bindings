unit fp_gee;

interface

uses
  fp_glib2;

const
  {$IFDEF Linux}
  libgee = 'gee-0.8 ';
  {$ENDIF}

  {$IFDEF Windows}
  {$FATAL  no supported}
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GEE_QUEUE_UNBOUNDED_CAPACITY = -(1);

type
  PGeeTraversableStream = ^TGeeTraversableStream;
  TGeeTraversableStream = longint;
const
  GEE_TRAVERSABLE_STREAM_YIELD = 0;
  GEE_TRAVERSABLE_STREAM_CONTINUE = 1;
  GEE_TRAVERSABLE_STREAM_END = 2;
  GEE_TRAVERSABLE_STREAM_WAIT = 3;

type
  PGeeConcurrentSetRangeType = ^TGeeConcurrentSetRangeType;
  TGeeConcurrentSetRangeType = longint;
const
  GEE_CONCURRENT_SET_RANGE_TYPE_HEAD = 0;
  GEE_CONCURRENT_SET_RANGE_TYPE_TAIL = 1;
  GEE_CONCURRENT_SET_RANGE_TYPE_BOUNDED = 2;
  GEE_CONCURRENT_SET_RANGE_TYPE_EMPTY = 3;

type
  PGeeHazardPointerPolicy = ^TGeeHazardPointerPolicy;
  TGeeHazardPointerPolicy = longint;
const
  GEE_HAZARD_POINTER_POLICY_DEFAULT = 0;
  GEE_HAZARD_POINTER_POLICY_THREAD_EXIT = 1;
  GEE_HAZARD_POINTER_POLICY_TRY_FREE = 2;
  GEE_HAZARD_POINTER_POLICY_FREE = 3;
  GEE_HAZARD_POINTER_POLICY_TRY_RELEASE = 4;
  GEE_HAZARD_POINTER_POLICY_RELEASE = 5;

type
  PGeeHazardPointerReleasePolicy = ^TGeeHazardPointerReleasePolicy;
  TGeeHazardPointerReleasePolicy = longint;
const
  GEE_HAZARD_POINTER_RELEASE_POLICY_HELPER_THREAD = 0;
  GEE_HAZARD_POINTER_RELEASE_POLICY_MAIN_LOOP = 1;

type
  PGeeIterator = type Pointer;
  PPGeeIterator = ^PGeeIterator;
  PGeeTraversable = type Pointer;
  PGeeIterable = type Pointer;
  PGeeCollection = type Pointer;
  PGeeListIterator = type Pointer;
  PGeeList = type Pointer;
  PGeeBidirIterator = type Pointer;
  PGeeBidirListIterator = type Pointer;
  PGeeBidirList = type Pointer;
  PGeeSet = type Pointer;
  PGeeSortedSet = type Pointer;
  PGeeBidirSortedSet = type Pointer;
  PGeeMapIterator = type Pointer;
  PGeeFuture = type Pointer;
  PGeeMap = type Pointer;
  PGeeSortedMap = type Pointer;
  PGeeBidirMapIterator = type Pointer;
  PGeeBidirSortedMap = type Pointer;
  PGeeMultiSet = type Pointer;
  PGeeMultiMap = type Pointer;
  PGeeQueue = type Pointer;
  PGeeDeque = type Pointer;
  PGeeComparable = type Pointer;
  PGeeHashable = type Pointer;
  PGeeHazardPointerFreeNode = type Pointer;

type
  PGeeLazyPrivate = type Pointer;
  PPGeeLazy = ^PGeeLazy;
  PGeeLazy = ^TGeeLazy;
  TGeeLazy = record
    parent_instance: TGTypeInstance;
    ref_count: longint;
    priv: PGeeLazyPrivate;
  end;

  PGeeLazyClass = ^TGeeLazyClass;
  TGeeLazyClass = record
    parent_class: TGTypeClass;
    finalize: procedure(self: PGeeLazy); cdecl;
  end;

  TGeeForallFunc = function(g: Tgpointer; user_data: Tgpointer): Tgboolean; cdecl;
  TGeeStreamFunc = function(state: TGeeTraversableStream; g: PGeeLazy; lazy: PPGeeLazy; user_data: Tgpointer): TGeeTraversableStream; cdecl;
  TGeeFoldFunc = function(g: Tgpointer; a: Tgpointer; user_data: Tgpointer): Tgpointer; cdecl;
  TGeeMapFunc = function(g: Tgpointer; user_data: Tgpointer): Tgpointer; cdecl;
  TGeePredicate = function(g: Tgconstpointer; user_data: Tgpointer): Tgboolean; cdecl;
  TGeeFlatMapFunc = function(g: Tgpointer; user_data: Tgpointer): PGeeIterator; cdecl;
  TGeeFoldMapFunc = function(k: Tgconstpointer; v: Tgconstpointer; a: Tgpointer; user_data: Tgpointer): Tgpointer; cdecl;
  TGeeForallMapFunc = function(k: Tgconstpointer; v: Tgconstpointer; user_data: Tgpointer): Tgboolean; cdecl;
  TGeeEqualDataFunc = function(a: Tgconstpointer; b: Tgconstpointer; user_data: Tgpointer): Tgboolean; cdecl;
  TGeeHashDataFunc = function(v: Tgconstpointer; user_data: Tgpointer): Tguint; cdecl;
  TGeeFutureMapFunc = function(value: Tgconstpointer; user_data: Tgpointer): Tgpointer; cdecl;
  TGeeFutureLightMapFunc = function(value: Tgconstpointer; user_data: Tgpointer): Tgconstpointer; cdecl;
  TGeeFutureZipFunc = function(a: Tgconstpointer; b: Tgconstpointer; user_data: Tgpointer): Tgpointer; cdecl;
  TGeeFutureFlatMapFunc = function(value: Tgconstpointer; user_data: Tgpointer): PGeeFuture; cdecl;
  TGeeUnfoldFunc = function(user_data: Tgpointer): PGeeLazy; cdecl;
  TGeeLazyFunc = function(user_data: Tgpointer): Tgpointer; cdecl;
  TGeeTask = function(user_data: Tgpointer): Tgpointer; cdecl;

type
  PGeeIteratorIface = ^TGeeIteratorIface;
  TGeeIteratorIface = record
    parent_iface: TGTypeInterface;
    next: function(self: PGeeIterator): Tgboolean; cdecl;
    has_next: function(self: PGeeIterator): Tgboolean; cdecl;
    get: function(self: PGeeIterator): Tgpointer; cdecl;
    remove: procedure(self: PGeeIterator); cdecl;
    get_valid: function(self: PGeeIterator): Tgboolean; cdecl;
    get_read_only: function(self: PGeeIterator): Tgboolean; cdecl;
  end;




  PGeeTraversableIface = ^TGeeTraversableIface;
  TGeeTraversableIface = record
    parent_iface: TGTypeInterface;
    get_g_type: function(self: PGeeTraversable): TGType; cdecl;
    get_g_dup_func: function(self: PGeeTraversable): TGBoxedCopyFunc; cdecl;
    get_g_destroy_func: function(self: PGeeTraversable): TGDestroyNotify; cdecl;
    foreach: function(self: PGeeTraversable; f: TGeeForallFunc; f_target: Tgpointer): Tgboolean; cdecl;
    stream: function(self: PGeeTraversable; a_type: TGType; a_dup_func: TGBoxedCopyFunc; a_destroy_func: TGDestroyNotify; f: TGeeStreamFunc;
      f_target: Tgpointer; f_target_destroy_notify: TGDestroyNotify): PGeeIterator; cdecl;
    fold: function(self: PGeeTraversable; a_type: TGType; a_dup_func: TGBoxedCopyFunc; a_destroy_func: TGDestroyNotify; f: TGeeFoldFunc;
      f_target: Tgpointer; seed: Tgpointer): Tgpointer; cdecl;
    map: function(self: PGeeTraversable; a_type: TGType; a_dup_func: TGBoxedCopyFunc; a_destroy_func: TGDestroyNotify; f: TGeeMapFunc;
      f_target: Tgpointer): PGeeIterator; cdecl;
    scan: function(self: PGeeTraversable; a_type: TGType; a_dup_func: TGBoxedCopyFunc; a_destroy_func: TGDestroyNotify; f: TGeeFoldFunc;
      f_target: Tgpointer; seed: Tgpointer): PGeeIterator; cdecl;
    filter: function(self: PGeeTraversable; pred: TGeePredicate; pred_target: Tgpointer; pred_target_destroy_notify: TGDestroyNotify): PGeeIterator; cdecl;
    chop: function(self: PGeeTraversable; offset: Tgint; length: Tgint): PGeeIterator; cdecl;
    get_element_type: function(self: PGeeTraversable): TGType; cdecl;
    flat_map: function(self: PGeeTraversable; a_type: TGType; a_dup_func: TGBoxedCopyFunc; a_destroy_func: TGDestroyNotify; f: TGeeFlatMapFunc;
      f_target: Tgpointer; f_target_destroy_notify: TGDestroyNotify): PGeeIterator; cdecl;
    tee: function(self: PGeeTraversable; forks: Tguint; result_length1: Pgint): PPGeeIterator; cdecl;
    first_match: function(self: PGeeTraversable; pred: TGeePredicate; pred_target: Tgpointer; pred_target_destroy_notify: TGDestroyNotify): Tgpointer; cdecl;
    any_match: function(self: PGeeTraversable; pred: TGeePredicate; pred_target: Tgpointer; pred_target_destroy_notify: TGDestroyNotify): Tgboolean; cdecl;
    all_match: function(self: PGeeTraversable; pred: TGeePredicate; pred_target: Tgpointer; pred_target_destroy_notify: TGDestroyNotify): Tgboolean; cdecl;
    max: function(self: PGeeTraversable; compare: TGCompareDataFunc; compare_target: Tgpointer; compare_target_destroy_notify: TGDestroyNotify): Tgpointer; cdecl;
    min: function(self: PGeeTraversable; compare: TGCompareDataFunc; compare_target: Tgpointer; compare_target_destroy_notify: TGDestroyNotify): Tgpointer; cdecl;
    order_by: function(self: PGeeTraversable; compare: TGCompareDataFunc; compare_target: Tgpointer; compare_target_destroy_notify: TGDestroyNotify): PGeeIterator; cdecl;
  end;

  PGeeIterableIface = ^TGeeIterableIface;
  TGeeIterableIface = record
    parent_iface: TGTypeInterface;
    get_g_type: function(self: PGeeIterable): TGType; cdecl;
    get_g_dup_func: function(self: PGeeIterable): TGBoxedCopyFunc; cdecl;
    get_g_destroy_func: function(self: PGeeIterable): TGDestroyNotify; cdecl;
    iterator: function(self: PGeeIterable): PGeeIterator; cdecl;
  end;

  PGeeCollectionIface = ^TGeeCollectionIface;
  TGeeCollectionIface = record
    parent_iface: TGTypeInterface;
    get_g_type: function(self: PGeeCollection): TGType; cdecl;
    get_g_dup_func: function(self: PGeeCollection): TGBoxedCopyFunc; cdecl;
    get_g_destroy_func: function(self: PGeeCollection): TGDestroyNotify; cdecl;
    contains: function(self: PGeeCollection; item: Tgconstpointer): Tgboolean; cdecl;
    add: function(self: PGeeCollection; item: Tgconstpointer): Tgboolean; cdecl;
    remove: function(self: PGeeCollection; item: Tgconstpointer): Tgboolean; cdecl;
    clear: procedure(self: PGeeCollection); cdecl;
    add_all: function(self: PGeeCollection; collection: PGeeCollection): Tgboolean; cdecl;
    contains_all: function(self: PGeeCollection; collection: PGeeCollection): Tgboolean; cdecl;
    remove_all: function(self: PGeeCollection; collection: PGeeCollection): Tgboolean; cdecl;
    retain_all: function(self: PGeeCollection; collection: PGeeCollection): Tgboolean; cdecl;
    to_array: function(self: PGeeCollection; result_length1: Pgint): Pgpointer; cdecl;
    get_size: function(self: PGeeCollection): Tgint; cdecl;
    get_is_empty: function(self: PGeeCollection): Tgboolean; cdecl;
    get_read_only: function(self: PGeeCollection): Tgboolean; cdecl;
    get_read_only_view: function(self: PGeeCollection): PGeeCollection; cdecl;
    add_all_array: function(self: PGeeCollection; arr: Pgpointer; array_length1: Tgint): Tgboolean; cdecl;
    contains_all_array: function(self: PGeeCollection; arr: Pgpointer; array_length1: Tgint): Tgboolean; cdecl;
    remove_all_array: function(self: PGeeCollection; arr: Pgpointer; array_length1: Tgint): Tgboolean; cdecl;
    add_all_iterator: function(self: PGeeCollection; iter: PGeeIterator): Tgboolean; cdecl;
    contains_all_iterator: function(self: PGeeCollection; iter: PGeeIterator): Tgboolean; cdecl;
    remove_all_iterator: function(self: PGeeCollection; iter: PGeeIterator): Tgboolean; cdecl;
  end;

  PGeeAbstractCollectionPrivate = type Pointer;
  PGeeAbstractCollection = ^TGeeAbstractCollection;
  TGeeAbstractCollection = record
    parent_instance: TGObject;
    priv: PGeeAbstractCollectionPrivate;
  end;

  PGeeAbstractCollectionClass = ^TGeeAbstractCollectionClass;
  TGeeAbstractCollectionClass = record
    parent_class: TGObjectClass;
    contains: function(self: PGeeAbstractCollection; item: Tgconstpointer): Tgboolean; cdecl;
    add: function(self: PGeeAbstractCollection; item: Tgconstpointer): Tgboolean; cdecl;
    remove: function(self: PGeeAbstractCollection; item: Tgconstpointer): Tgboolean; cdecl;
    clear: procedure(self: PGeeAbstractCollection); cdecl;
    iterator: function(self: PGeeAbstractCollection): PGeeIterator; cdecl;
    foreach: function(self: PGeeAbstractCollection; f: TGeeForallFunc; f_target: Tgpointer): Tgboolean; cdecl;
    reserved0: procedure(self: PGeeAbstractCollection); cdecl;
    reserved1: procedure(self: PGeeAbstractCollection); cdecl;
    reserved2: procedure(self: PGeeAbstractCollection); cdecl;
    reserved3: procedure(self: PGeeAbstractCollection); cdecl;
    reserved4: procedure(self: PGeeAbstractCollection); cdecl;
    reserved5: procedure(self: PGeeAbstractCollection); cdecl;
    reserved6: procedure(self: PGeeAbstractCollection); cdecl;
    reserved7: procedure(self: PGeeAbstractCollection); cdecl;
    reserved8: procedure(self: PGeeAbstractCollection); cdecl;
    reserved9: procedure(self: PGeeAbstractCollection); cdecl;
    get_size: function(self: PGeeAbstractCollection): Tgint; cdecl;
    get_read_only: function(self: PGeeAbstractCollection): Tgboolean; cdecl;
    get_read_only_view: function(self: PGeeAbstractCollection): PGeeCollection; cdecl;
  end;

  PGeeListIteratorIface = ^TGeeListIteratorIface;
  TGeeListIteratorIface = record
    parent_iface: TGTypeInterface;
    set_: procedure(self: PGeeListIterator; item: Tgconstpointer); cdecl;
    add: procedure(self: PGeeListIterator; item: Tgconstpointer); cdecl;
    index: function(self: PGeeListIterator): Tgint; cdecl;
  end;

  PGeeListIface = ^TGeeListIface;
  TGeeListIface = record
    parent_iface: TGTypeInterface;
    get_g_type: function(self: PGeeList): TGType; cdecl;
    get_g_dup_func: function(self: PGeeList): TGBoxedCopyFunc; cdecl;
    get_g_destroy_func: function(self: PGeeList): TGDestroyNotify; cdecl;
    list_iterator: function(self: PGeeList): PGeeListIterator; cdecl;
    get: function(self: PGeeList; index: Tgint): Tgpointer; cdecl;
    set_: procedure(self: PGeeList; index: Tgint; item: Tgconstpointer); cdecl;
    index_of: function(self: PGeeList; item: Tgconstpointer): Tgint; cdecl;
    insert: procedure(self: PGeeList; index: Tgint; item: Tgconstpointer); cdecl;
    remove_at: function(self: PGeeList; index: Tgint): Tgpointer; cdecl;
    slice: function(self: PGeeList; start: Tgint; stop: Tgint): PGeeList; cdecl;
    first: function(self: PGeeList): Tgpointer; cdecl;
    last: function(self: PGeeList): Tgpointer; cdecl;
    insert_all: procedure(self: PGeeList; index: Tgint; collection: PGeeCollection); cdecl;
    sort: procedure(self: PGeeList; compare_func: TGCompareDataFunc; compare_func_target: Tgpointer; compare_func_target_destroy_notify: TGDestroyNotify); cdecl;
    get_read_only_view: function(self: PGeeList): PGeeList; cdecl;
  end;

  PGeeAbstractListPrivate = type Pointer;
  PGeeAbstractList = ^TGeeAbstractList;
  TGeeAbstractList = record
    parent_instance: TGeeAbstractCollection;
    priv: PGeeAbstractListPrivate;
  end;

  PGeeAbstractListClass = ^TGeeAbstractListClass;
  TGeeAbstractListClass = record
    parent_class: TGeeAbstractCollectionClass;
    list_iterator: function(self: PGeeAbstractList): PGeeListIterator; cdecl;
    get: function(self: PGeeAbstractList; index: Tgint): Tgpointer; cdecl;
    set_: procedure(self: PGeeAbstractList; index: Tgint; item: Tgconstpointer); cdecl;
    index_of: function(self: PGeeAbstractList; item: Tgconstpointer): Tgint; cdecl;
    insert: procedure(self: PGeeAbstractList; index: Tgint; item: Tgconstpointer); cdecl;
    remove_at: function(self: PGeeAbstractList; index: Tgint): Tgpointer; cdecl;
    slice: function(self: PGeeAbstractList; start: Tgint; stop: Tgint): PGeeList; cdecl;
    reserved0: procedure(self: PGeeAbstractList); cdecl;
    reserved1: procedure(self: PGeeAbstractList); cdecl;
    reserved2: procedure(self: PGeeAbstractList); cdecl;
    reserved3: procedure(self: PGeeAbstractList); cdecl;
    reserved4: procedure(self: PGeeAbstractList); cdecl;
    reserved5: procedure(self: PGeeAbstractList); cdecl;
    reserved6: procedure(self: PGeeAbstractList); cdecl;
    reserved7: procedure(self: PGeeAbstractList); cdecl;
    reserved8: procedure(self: PGeeAbstractList); cdecl;
    reserved9: procedure(self: PGeeAbstractList); cdecl;
    get_read_only_view: function(self: PGeeAbstractList): PGeeList; cdecl;
  end;

  PGeeBidirIteratorIface = ^TGeeBidirIteratorIface;
  TGeeBidirIteratorIface = record
    parent_iface: TGTypeInterface;
    get_g_type: function(self: PGeeBidirIterator): TGType; cdecl;
    get_g_dup_func: function(self: PGeeBidirIterator): TGBoxedCopyFunc; cdecl;
    get_g_destroy_func: function(self: PGeeBidirIterator): TGDestroyNotify; cdecl;
    previous: function(self: PGeeBidirIterator): Tgboolean; cdecl;
    has_previous: function(self: PGeeBidirIterator): Tgboolean; cdecl;
    first: function(self: PGeeBidirIterator): Tgboolean; cdecl;
    last: function(self: PGeeBidirIterator): Tgboolean; cdecl;
  end;

  PGeeBidirListIteratorIface = ^TGeeBidirListIteratorIface;
  TGeeBidirListIteratorIface = record
    parent_iface: TGTypeInterface;
    get_g_type: function(self: PGeeBidirListIterator): TGType; cdecl;
    get_g_dup_func: function(self: PGeeBidirListIterator): TGBoxedCopyFunc; cdecl;
    get_g_destroy_func: function(self: PGeeBidirListIterator): TGDestroyNotify; cdecl;
    insert: procedure(self: PGeeBidirListIterator; item: Tgconstpointer); cdecl;
  end;

  PGeeBidirListIface = ^TGeeBidirListIface;
  TGeeBidirListIface = record
    parent_iface: TGTypeInterface;
    get_g_type: function(self: PGeeBidirList): TGType; cdecl;
    get_g_dup_func: function(self: PGeeBidirList): TGBoxedCopyFunc; cdecl;
    get_g_destroy_func: function(self: PGeeBidirList): TGDestroyNotify; cdecl;
    bidir_list_iterator: function(self: PGeeBidirList): PGeeBidirListIterator; cdecl;
    get_read_only_view: function(self: PGeeBidirList): PGeeBidirList; cdecl;
  end;

  PGeeAbstractBidirListPrivate = type Pointer;
  PGeeAbstractBidirList = ^TGeeAbstractBidirList;
  TGeeAbstractBidirList = record
    parent_instance: TGeeAbstractList;
    priv: PGeeAbstractBidirListPrivate;
  end;

  PGeeAbstractBidirListClass = ^TGeeAbstractBidirListClass;
  TGeeAbstractBidirListClass = record
    parent_class: TGeeAbstractListClass;
    bidir_list_iterator: function(self: PGeeAbstractBidirList): PGeeBidirListIterator; cdecl;
    reserved0: procedure(self: PGeeAbstractBidirList); cdecl;
    reserved1: procedure(self: PGeeAbstractBidirList); cdecl;
    reserved2: procedure(self: PGeeAbstractBidirList); cdecl;
    reserved3: procedure(self: PGeeAbstractBidirList); cdecl;
    reserved4: procedure(self: PGeeAbstractBidirList); cdecl;
    reserved5: procedure(self: PGeeAbstractBidirList); cdecl;
    reserved6: procedure(self: PGeeAbstractBidirList); cdecl;
    reserved7: procedure(self: PGeeAbstractBidirList); cdecl;
    reserved8: procedure(self: PGeeAbstractBidirList); cdecl;
    reserved9: procedure(self: PGeeAbstractBidirList); cdecl;
    get_read_only_view: function(self: PGeeAbstractBidirList): PGeeBidirList; cdecl;
  end;

  PGeeSetIface = ^TGeeSetIface;
  TGeeSetIface = record
    parent_iface: TGTypeInterface;
    get_g_type: function(self: PGeeSet): TGType; cdecl;
    get_g_dup_func: function(self: PGeeSet): TGBoxedCopyFunc; cdecl;
    get_g_destroy_func: function(self: PGeeSet): TGDestroyNotify; cdecl;
    get_read_only_view: function(self: PGeeSet): PGeeSet; cdecl;
  end;

  PGeeAbstractSetPrivate = type Pointer;
  PGeeAbstractSet = ^TGeeAbstractSet;
  TGeeAbstractSet = record
    parent_instance: TGeeAbstractCollection;
    priv: PGeeAbstractSetPrivate;
  end;

  PGeeAbstractSetClass = ^TGeeAbstractSetClass;
  TGeeAbstractSetClass = record
    parent_class: TGeeAbstractCollectionClass;
    reserved0: procedure(self: PGeeAbstractSet); cdecl;
    reserved1: procedure(self: PGeeAbstractSet); cdecl;
    reserved2: procedure(self: PGeeAbstractSet); cdecl;
    reserved3: procedure(self: PGeeAbstractSet); cdecl;
    reserved4: procedure(self: PGeeAbstractSet); cdecl;
    reserved5: procedure(self: PGeeAbstractSet); cdecl;
    reserved6: procedure(self: PGeeAbstractSet); cdecl;
    reserved7: procedure(self: PGeeAbstractSet); cdecl;
    reserved8: procedure(self: PGeeAbstractSet); cdecl;
    reserved9: procedure(self: PGeeAbstractSet); cdecl;
    get_read_only_view: function(self: PGeeAbstractSet): PGeeSet; cdecl;
  end;

  PGeeSortedSetIface = ^TGeeSortedSetIface;
  TGeeSortedSetIface = record
    parent_iface: TGTypeInterface;
    get_g_type: function(self: PGeeSortedSet): TGType; cdecl;
    get_g_dup_func: function(self: PGeeSortedSet): TGBoxedCopyFunc; cdecl;
    get_g_destroy_func: function(self: PGeeSortedSet): TGDestroyNotify; cdecl;
    first: function(self: PGeeSortedSet): Tgpointer; cdecl;
    last: function(self: PGeeSortedSet): Tgpointer; cdecl;
    iterator_at: function(self: PGeeSortedSet; element: Tgconstpointer): PGeeIterator; cdecl;
    lower: function(self: PGeeSortedSet; element: Tgconstpointer): Tgpointer; cdecl;
    higher: function(self: PGeeSortedSet; element: Tgconstpointer): Tgpointer; cdecl;
    floor: function(self: PGeeSortedSet; element: Tgconstpointer): Tgpointer; cdecl;
    ceil: function(self: PGeeSortedSet; element: Tgconstpointer): Tgpointer; cdecl;
    head_set: function(self: PGeeSortedSet; before: Tgconstpointer): PGeeSortedSet; cdecl;
    tail_set: function(self: PGeeSortedSet; after: Tgconstpointer): PGeeSortedSet; cdecl;
    sub_set: function(self: PGeeSortedSet; from: Tgconstpointer; to_: Tgconstpointer): PGeeSortedSet; cdecl;
    get_read_only_view: function(self: PGeeSortedSet): PGeeSortedSet; cdecl;
  end;

  PGeeAbstractSortedSetPrivate = type Pointer;
  PGeeAbstractSortedSet = ^TGeeAbstractSortedSet;
  TGeeAbstractSortedSet = record
    parent_instance: TGeeAbstractSet;
    priv: PGeeAbstractSortedSetPrivate;
  end;

  PGeeAbstractSortedSetClass = ^TGeeAbstractSortedSetClass;
  TGeeAbstractSortedSetClass = record
    parent_class: TGeeAbstractSetClass;
    first: function(self: PGeeAbstractSortedSet): Tgpointer; cdecl;
    last: function(self: PGeeAbstractSortedSet): Tgpointer; cdecl;
    iterator_at: function(self: PGeeAbstractSortedSet; element: Tgconstpointer): PGeeIterator; cdecl;
    lower: function(self: PGeeAbstractSortedSet; element: Tgconstpointer): Tgpointer; cdecl;
    higher: function(self: PGeeAbstractSortedSet; element: Tgconstpointer): Tgpointer; cdecl;
    floor: function(self: PGeeAbstractSortedSet; element: Tgconstpointer): Tgpointer; cdecl;
    ceil: function(self: PGeeAbstractSortedSet; element: Tgconstpointer): Tgpointer; cdecl;
    head_set: function(self: PGeeAbstractSortedSet; before: Tgconstpointer): PGeeSortedSet; cdecl;
    tail_set: function(self: PGeeAbstractSortedSet; after: Tgconstpointer): PGeeSortedSet; cdecl;
    sub_set: function(self: PGeeAbstractSortedSet; from: Tgconstpointer; to_: Tgconstpointer): PGeeSortedSet; cdecl;
    reserved0: procedure(self: PGeeAbstractSortedSet); cdecl;
    reserved1: procedure(self: PGeeAbstractSortedSet); cdecl;
    reserved2: procedure(self: PGeeAbstractSortedSet); cdecl;
    reserved3: procedure(self: PGeeAbstractSortedSet); cdecl;
    reserved4: procedure(self: PGeeAbstractSortedSet); cdecl;
    reserved5: procedure(self: PGeeAbstractSortedSet); cdecl;
    reserved6: procedure(self: PGeeAbstractSortedSet); cdecl;
    reserved7: procedure(self: PGeeAbstractSortedSet); cdecl;
    reserved8: procedure(self: PGeeAbstractSortedSet); cdecl;
    reserved9: procedure(self: PGeeAbstractSortedSet); cdecl;
    get_read_only_view: function(self: PGeeAbstractSortedSet): PGeeSortedSet; cdecl;
  end;

  PGeeBidirSortedSetIface = ^TGeeBidirSortedSetIface;
  TGeeBidirSortedSetIface = record
    parent_iface: TGTypeInterface;
    get_g_type: function(self: PGeeBidirSortedSet): TGType; cdecl;
    get_g_dup_func: function(self: PGeeBidirSortedSet): TGBoxedCopyFunc; cdecl;
    get_g_destroy_func: function(self: PGeeBidirSortedSet): TGDestroyNotify; cdecl;
    bidir_iterator: function(self: PGeeBidirSortedSet): PGeeBidirIterator; cdecl;
    get_read_only_view: function(self: PGeeBidirSortedSet): PGeeBidirSortedSet; cdecl;
  end;

  PGeeAbstractBidirSortedSetPrivate = type Pointer;
  PGeeAbstractBidirSortedSet = ^TGeeAbstractBidirSortedSet;
  TGeeAbstractBidirSortedSet = record
    parent_instance: TGeeAbstractSortedSet;
    priv: PGeeAbstractBidirSortedSetPrivate;
  end;

  PGeeAbstractBidirSortedSetClass = ^TGeeAbstractBidirSortedSetClass;
  TGeeAbstractBidirSortedSetClass = record
    parent_class: TGeeAbstractSortedSetClass;
    bidir_iterator: function(self: PGeeAbstractBidirSortedSet): PGeeBidirIterator; cdecl;
    reserved0: procedure(self: PGeeAbstractBidirSortedSet); cdecl;
    reserved1: procedure(self: PGeeAbstractBidirSortedSet); cdecl;
    reserved2: procedure(self: PGeeAbstractBidirSortedSet); cdecl;
    reserved3: procedure(self: PGeeAbstractBidirSortedSet); cdecl;
    reserved4: procedure(self: PGeeAbstractBidirSortedSet); cdecl;
    reserved5: procedure(self: PGeeAbstractBidirSortedSet); cdecl;
    reserved6: procedure(self: PGeeAbstractBidirSortedSet); cdecl;
    reserved7: procedure(self: PGeeAbstractBidirSortedSet); cdecl;
    reserved8: procedure(self: PGeeAbstractBidirSortedSet); cdecl;
    reserved9: procedure(self: PGeeAbstractBidirSortedSet); cdecl;
    get_read_only_view: function(self: PGeeAbstractBidirSortedSet): PGeeBidirSortedSet; cdecl;
  end;

  PGeeMapIteratorIface = ^TGeeMapIteratorIface;
  TGeeMapIteratorIface = record
    parent_iface: TGTypeInterface;
    get_k_type: function(self: PGeeMapIterator): TGType; cdecl;
    get_k_dup_func: function(self: PGeeMapIterator): TGBoxedCopyFunc; cdecl;
    get_k_destroy_func: function(self: PGeeMapIterator): TGDestroyNotify; cdecl;
    get_v_type: function(self: PGeeMapIterator): TGType; cdecl;
    get_v_dup_func: function(self: PGeeMapIterator): TGBoxedCopyFunc; cdecl;
    get_v_destroy_func: function(self: PGeeMapIterator): TGDestroyNotify; cdecl;
    next: function(self: PGeeMapIterator): Tgboolean; cdecl;
    has_next: function(self: PGeeMapIterator): Tgboolean; cdecl;
    get_key: function(self: PGeeMapIterator): Tgpointer; cdecl;
    get_value: function(self: PGeeMapIterator): Tgpointer; cdecl;
    set_value: procedure(self: PGeeMapIterator; value: Tgconstpointer); cdecl;
    unset: procedure(self: PGeeMapIterator); cdecl;
    fold: function(self: PGeeMapIterator; a_type: TGType; a_dup_func: TGBoxedCopyFunc; a_destroy_func: TGDestroyNotify; f: TGeeFoldMapFunc;
      f_target: Tgpointer; seed: Tgpointer): Tgpointer; cdecl;
    foreach: function(self: PGeeMapIterator; f: TGeeForallMapFunc; f_target: Tgpointer): Tgboolean; cdecl;
    get_valid: function(self: PGeeMapIterator): Tgboolean; cdecl;
    get_mutable: function(self: PGeeMapIterator): Tgboolean; cdecl;
    get_read_only: function(self: PGeeMapIterator): Tgboolean; cdecl;
  end;

  PGeeMapIface = ^TGeeMapIface;
  TGeeMapIface = record
    parent_iface: TGTypeInterface;
    get_k_type: function(self: PGeeMap): TGType; cdecl;
    get_k_dup_func: function(self: PGeeMap): TGBoxedCopyFunc; cdecl;
    get_k_destroy_func: function(self: PGeeMap): TGDestroyNotify; cdecl;
    get_v_type: function(self: PGeeMap): TGType; cdecl;
    get_v_dup_func: function(self: PGeeMap): TGBoxedCopyFunc; cdecl;
    get_v_destroy_func: function(self: PGeeMap): TGDestroyNotify; cdecl;
    has_key: function(self: PGeeMap; key: Tgconstpointer): Tgboolean; cdecl;
    has: function(self: PGeeMap; key: Tgconstpointer; value: Tgconstpointer): Tgboolean; cdecl;
    get: function(self: PGeeMap; key: Tgconstpointer): Tgpointer; cdecl;
    set_: procedure(self: PGeeMap; key: Tgconstpointer; value: Tgconstpointer); cdecl;
    unset: function(self: PGeeMap; key: Tgconstpointer; value: Pgpointer): Tgboolean; cdecl;
    clear: procedure(self: PGeeMap); cdecl;
    map_iterator: function(self: PGeeMap): PGeeMapIterator; cdecl;
    set_all: procedure(self: PGeeMap; map: PGeeMap); cdecl;
    unset_all: function(self: PGeeMap; map: PGeeMap): Tgboolean; cdecl;
    has_all: function(self: PGeeMap; map: PGeeMap): Tgboolean; cdecl;
    get_size: function(self: PGeeMap): Tgint; cdecl;
    get_is_empty: function(self: PGeeMap): Tgboolean; cdecl;
    get_read_only: function(self: PGeeMap): Tgboolean; cdecl;
    get_keys: function(self: PGeeMap): PGeeSet; cdecl;
    get_values: function(self: PGeeMap): PGeeCollection; cdecl;
    get_entries: function(self: PGeeMap): PGeeSet; cdecl;
    get_read_only_view: function(self: PGeeMap): PGeeMap; cdecl;
  end;

  PGeeAbstractMapPrivate = type Pointer;
  PGeeAbstractMap = ^TGeeAbstractMap;
  TGeeAbstractMap = record
    parent_instance: TGObject;
    priv: PGeeAbstractMapPrivate;
  end;

  PGeeAbstractMapClass = ^TGeeAbstractMapClass;
  TGeeAbstractMapClass = record
    parent_class: TGObjectClass;
    has_key: function(self: PGeeAbstractMap; key: Tgconstpointer): Tgboolean; cdecl;
    has: function(self: PGeeAbstractMap; key: Tgconstpointer; value: Tgconstpointer): Tgboolean; cdecl;
    get: function(self: PGeeAbstractMap; key: Tgconstpointer): Tgpointer; cdecl;
    set_: procedure(self: PGeeAbstractMap; key: Tgconstpointer; value: Tgconstpointer); cdecl;
    unset: function(self: PGeeAbstractMap; key: Tgconstpointer; value: Pgpointer): Tgboolean; cdecl;
    map_iterator: function(self: PGeeAbstractMap): PGeeMapIterator; cdecl;
    clear: procedure(self: PGeeAbstractMap); cdecl;
    foreach: function(self: PGeeAbstractMap; f: TGeeForallFunc; f_target: Tgpointer): Tgboolean; cdecl;
    stream: function(self: PGeeAbstractMap; a_type: TGType; a_dup_func: TGBoxedCopyFunc; a_destroy_func: TGDestroyNotify; f: TGeeStreamFunc;
      f_target: Tgpointer; f_target_destroy_notify: TGDestroyNotify): PGeeIterator; cdecl;
    reserved0: procedure(self: PGeeAbstractMap); cdecl;
    reserved1: procedure(self: PGeeAbstractMap); cdecl;
    reserved2: procedure(self: PGeeAbstractMap); cdecl;
    reserved3: procedure(self: PGeeAbstractMap); cdecl;
    reserved4: procedure(self: PGeeAbstractMap); cdecl;
    reserved5: procedure(self: PGeeAbstractMap); cdecl;
    reserved6: procedure(self: PGeeAbstractMap); cdecl;
    reserved7: procedure(self: PGeeAbstractMap); cdecl;
    reserved8: procedure(self: PGeeAbstractMap); cdecl;
    reserved9: procedure(self: PGeeAbstractMap); cdecl;
    get_size: function(self: PGeeAbstractMap): Tgint; cdecl;
    get_read_only: function(self: PGeeAbstractMap): Tgboolean; cdecl;
    get_keys: function(self: PGeeAbstractMap): PGeeSet; cdecl;
    get_values: function(self: PGeeAbstractMap): PGeeCollection; cdecl;
    get_entries: function(self: PGeeAbstractMap): PGeeSet; cdecl;
    get_read_only_view: function(self: PGeeAbstractMap): PGeeMap; cdecl;
  end;

  PGeeSortedMapIface = ^TGeeSortedMapIface;
  TGeeSortedMapIface = record
    parent_iface: TGTypeInterface;
    head_map: function(self: PGeeSortedMap; before: Tgconstpointer): PGeeSortedMap; cdecl;
    tail_map: function(self: PGeeSortedMap; after: Tgconstpointer): PGeeSortedMap; cdecl;
    sub_map: function(self: PGeeSortedMap; before: Tgconstpointer; after: Tgconstpointer): PGeeSortedMap; cdecl;
    get_ascending_keys: function(self: PGeeSortedMap): PGeeSortedSet; cdecl;
    get_ascending_entries: function(self: PGeeSortedMap): PGeeSortedSet; cdecl;
    get_read_only_view: function(self: PGeeSortedMap): PGeeSortedMap; cdecl;
  end;

  PGeeAbstractSortedMapPrivate = type Pointer;
  PGeeAbstractSortedMap = ^TGeeAbstractSortedMap;
  TGeeAbstractSortedMap = record
    parent_instance: TGeeAbstractMap;
    priv: PGeeAbstractSortedMapPrivate;
  end;

  PGeeAbstractSortedMapClass = ^TGeeAbstractSortedMapClass;
  TGeeAbstractSortedMapClass = record
    parent_class: TGeeAbstractMapClass;
    head_map: function(self: PGeeAbstractSortedMap; before: Tgconstpointer): PGeeSortedMap; cdecl;
    tail_map: function(self: PGeeAbstractSortedMap; after: Tgconstpointer): PGeeSortedMap; cdecl;
    sub_map: function(self: PGeeAbstractSortedMap; before: Tgconstpointer; after: Tgconstpointer): PGeeSortedMap; cdecl;
    reserved0: procedure(self: PGeeAbstractSortedMap); cdecl;
    reserved1: procedure(self: PGeeAbstractSortedMap); cdecl;
    reserved2: procedure(self: PGeeAbstractSortedMap); cdecl;
    reserved3: procedure(self: PGeeAbstractSortedMap); cdecl;
    reserved4: procedure(self: PGeeAbstractSortedMap); cdecl;
    reserved5: procedure(self: PGeeAbstractSortedMap); cdecl;
    reserved6: procedure(self: PGeeAbstractSortedMap); cdecl;
    reserved7: procedure(self: PGeeAbstractSortedMap); cdecl;
    reserved8: procedure(self: PGeeAbstractSortedMap); cdecl;
    reserved9: procedure(self: PGeeAbstractSortedMap); cdecl;
    get_ascending_keys: function(self: PGeeAbstractSortedMap): PGeeSortedSet; cdecl;
    get_ascending_entries: function(self: PGeeAbstractSortedMap): PGeeSortedSet; cdecl;
  end;

  PGeeBidirMapIteratorIface = ^TGeeBidirMapIteratorIface;
  TGeeBidirMapIteratorIface = record
    parent_iface: TGTypeInterface;
    get_k_type: function(self: PGeeBidirMapIterator): TGType; cdecl;
    get_k_dup_func: function(self: PGeeBidirMapIterator): TGBoxedCopyFunc; cdecl;
    get_k_destroy_func: function(self: PGeeBidirMapIterator): TGDestroyNotify; cdecl;
    get_v_type: function(self: PGeeBidirMapIterator): TGType; cdecl;
    get_v_dup_func: function(self: PGeeBidirMapIterator): TGBoxedCopyFunc; cdecl;
    get_v_destroy_func: function(self: PGeeBidirMapIterator): TGDestroyNotify; cdecl;
    previous: function(self: PGeeBidirMapIterator): Tgboolean; cdecl;
    has_previous: function(self: PGeeBidirMapIterator): Tgboolean; cdecl;
    first: function(self: PGeeBidirMapIterator): Tgboolean; cdecl;
    last: function(self: PGeeBidirMapIterator): Tgboolean; cdecl;
  end;

  PGeeBidirSortedMapIface = ^TGeeBidirSortedMapIface;
  TGeeBidirSortedMapIface = record
    parent_iface: TGTypeInterface;
    get_k_type: function(self: PGeeBidirSortedMap): TGType; cdecl;
    get_k_dup_func: function(self: PGeeBidirSortedMap): TGBoxedCopyFunc; cdecl;
    get_k_destroy_func: function(self: PGeeBidirSortedMap): TGDestroyNotify; cdecl;
    get_v_type: function(self: PGeeBidirSortedMap): TGType; cdecl;
    get_v_dup_func: function(self: PGeeBidirSortedMap): TGBoxedCopyFunc; cdecl;
    get_v_destroy_func: function(self: PGeeBidirSortedMap): TGDestroyNotify; cdecl;
    bidir_map_iterator: function(self: PGeeBidirSortedMap): PGeeBidirMapIterator; cdecl;
    get_read_only_view: function(self: PGeeBidirSortedMap): PGeeBidirSortedMap; cdecl;
  end;

  PGeeAbstractBidirSortedMapPrivate = type Pointer;
  PGeeAbstractBidirSortedMap = ^TGeeAbstractBidirSortedMap;
  TGeeAbstractBidirSortedMap = record
    parent_instance: TGeeAbstractSortedMap;
    priv: PGeeAbstractBidirSortedMapPrivate;
  end;

  PGeeAbstractBidirSortedMapClass = ^TGeeAbstractBidirSortedMapClass;
  TGeeAbstractBidirSortedMapClass = record
    parent_class: TGeeAbstractSortedMapClass;
    bidir_map_iterator: function(self: PGeeAbstractBidirSortedMap): PGeeBidirMapIterator; cdecl;
    reserved0: procedure(self: PGeeAbstractBidirSortedMap); cdecl;
    reserved1: procedure(self: PGeeAbstractBidirSortedMap); cdecl;
    reserved2: procedure(self: PGeeAbstractBidirSortedMap); cdecl;
    reserved3: procedure(self: PGeeAbstractBidirSortedMap); cdecl;
    reserved4: procedure(self: PGeeAbstractBidirSortedMap); cdecl;
    reserved5: procedure(self: PGeeAbstractBidirSortedMap); cdecl;
    reserved6: procedure(self: PGeeAbstractBidirSortedMap); cdecl;
    reserved7: procedure(self: PGeeAbstractBidirSortedMap); cdecl;
    reserved8: procedure(self: PGeeAbstractBidirSortedMap); cdecl;
    reserved9: procedure(self: PGeeAbstractBidirSortedMap); cdecl;
    get_read_only_view: function(self: PGeeAbstractBidirSortedMap): PGeeBidirSortedMap; cdecl;
  end;

  PGeeMultiSetIface = ^TGeeMultiSetIface;
  TGeeMultiSetIface = record
    parent_iface: TGTypeInterface;
    get_g_type: function(self: PGeeMultiSet): TGType; cdecl;
    get_g_dup_func: function(self: PGeeMultiSet): TGBoxedCopyFunc; cdecl;
    get_g_destroy_func: function(self: PGeeMultiSet): TGDestroyNotify; cdecl;
    count: function(self: PGeeMultiSet; item: Tgconstpointer): Tgint; cdecl;
    get_read_only_view: function(self: PGeeMultiSet): PGeeMultiSet; cdecl;
  end;

  PGeeMultiMapIface = ^TGeeMultiMapIface;
  TGeeMultiMapIface = record
    parent_iface: TGTypeInterface;
    get_k_type: function(self: PGeeMultiMap): TGType; cdecl;
    get_k_dup_func: function(self: PGeeMultiMap): TGBoxedCopyFunc; cdecl;
    get_k_destroy_func: function(self: PGeeMultiMap): TGDestroyNotify; cdecl;
    get_v_type: function(self: PGeeMultiMap): TGType; cdecl;
    get_v_dup_func: function(self: PGeeMultiMap): TGBoxedCopyFunc; cdecl;
    get_v_destroy_func: function(self: PGeeMultiMap): TGDestroyNotify; cdecl;
    get_keys: function(self: PGeeMultiMap): PGeeSet; cdecl;
    get_all_keys: function(self: PGeeMultiMap): PGeeMultiSet; cdecl;
    get_values: function(self: PGeeMultiMap): PGeeCollection; cdecl;
    contains: function(self: PGeeMultiMap; key: Tgconstpointer): Tgboolean; cdecl;
    get: function(self: PGeeMultiMap; key: Tgconstpointer): PGeeCollection; cdecl;
    set_: procedure(self: PGeeMultiMap; key: Tgconstpointer; value: Tgconstpointer); cdecl;
    remove: function(self: PGeeMultiMap; key: Tgconstpointer; value: Tgconstpointer): Tgboolean; cdecl;
    remove_all: function(self: PGeeMultiMap; key: Tgconstpointer): Tgboolean; cdecl;
    clear: procedure(self: PGeeMultiMap); cdecl;
    map_iterator: function(self: PGeeMultiMap): PGeeMapIterator; cdecl;
    get_size: function(self: PGeeMultiMap): Tgint; cdecl;
    get_read_only: function(self: PGeeMultiMap): Tgboolean; cdecl;
    get_read_only_view: function(self: PGeeMultiMap): PGeeMultiMap; cdecl;
  end;

  PGeeAbstractMultiMapPrivate = type Pointer;
  PGeeAbstractMultiMap = ^TGeeAbstractMultiMap;
  TGeeAbstractMultiMap = record
    parent_instance: TGObject;
    priv: PGeeAbstractMultiMapPrivate;
    _storage_map: PGeeMap;
  end;

  PGeeAbstractMultiMapClass = ^TGeeAbstractMultiMapClass;
  TGeeAbstractMultiMapClass = record
    parent_class: TGObjectClass;
    create_value_storage: function(self: PGeeAbstractMultiMap): PGeeCollection; cdecl;
    create_multi_key_set: function(self: PGeeAbstractMultiMap): PGeeMultiSet; cdecl;
    get_value_equal_func: function(self: PGeeAbstractMultiMap; result_target: Pgpointer; result_target_destroy_notify: PGDestroyNotify): TGeeEqualDataFunc; cdecl;
    reserved0: procedure(self: PGeeAbstractMultiMap); cdecl;
    reserved1: procedure(self: PGeeAbstractMultiMap); cdecl;
    reserved2: procedure(self: PGeeAbstractMultiMap); cdecl;
    reserved3: procedure(self: PGeeAbstractMultiMap); cdecl;
    reserved4: procedure(self: PGeeAbstractMultiMap); cdecl;
    reserved5: procedure(self: PGeeAbstractMultiMap); cdecl;
    reserved6: procedure(self: PGeeAbstractMultiMap); cdecl;
    reserved7: procedure(self: PGeeAbstractMultiMap); cdecl;
    reserved8: procedure(self: PGeeAbstractMultiMap); cdecl;
    get_read_only_view: function(self: PGeeAbstractMultiMap): PGeeMultiMap; cdecl;
  end;

  PGeeAbstractMultiSetPrivate = type Pointer;
  PGeeAbstractMultiSet = ^TGeeAbstractMultiSet;
  TGeeAbstractMultiSet = record
    parent_instance: TGeeAbstractCollection;
    priv: PGeeAbstractMultiSetPrivate;
    _storage_map: PGeeMap;
  end;

  PGeeAbstractMultiSetClass = ^TGeeAbstractMultiSetClass;
  TGeeAbstractMultiSetClass = record
    parent_class: TGeeAbstractCollectionClass;
    reserved0: procedure(self: PGeeAbstractMultiSet); cdecl;
    reserved1: procedure(self: PGeeAbstractMultiSet); cdecl;
    reserved2: procedure(self: PGeeAbstractMultiSet); cdecl;
    reserved3: procedure(self: PGeeAbstractMultiSet); cdecl;
    reserved4: procedure(self: PGeeAbstractMultiSet); cdecl;
    reserved5: procedure(self: PGeeAbstractMultiSet); cdecl;
    reserved6: procedure(self: PGeeAbstractMultiSet); cdecl;
    reserved7: procedure(self: PGeeAbstractMultiSet); cdecl;
    reserved8: procedure(self: PGeeAbstractMultiSet); cdecl;
    get_read_only_view: function(self: PGeeAbstractMultiSet): PGeeMultiSet; cdecl;
  end;

  PGeeQueueIface = ^TGeeQueueIface;
  TGeeQueueIface = record
    parent_iface: TGTypeInterface;
    get_g_type: function(self: PGeeQueue): TGType; cdecl;
    get_g_dup_func: function(self: PGeeQueue): TGBoxedCopyFunc; cdecl;
    get_g_destroy_func: function(self: PGeeQueue): TGDestroyNotify; cdecl;
    offer: function(self: PGeeQueue; element: Tgconstpointer): Tgboolean; cdecl;
    peek: function(self: PGeeQueue): Tgpointer; cdecl;
    poll: function(self: PGeeQueue): Tgpointer; cdecl;
    drain: function(self: PGeeQueue; recipient: PGeeCollection; amount: Tgint): Tgint; cdecl;
    get_capacity: function(self: PGeeQueue): Tgint; cdecl;
    get_remaining_capacity: function(self: PGeeQueue): Tgint; cdecl;
    get_is_full: function(self: PGeeQueue): Tgboolean; cdecl;
  end;

  PGeeAbstractQueuePrivate = type Pointer;
  PGeeAbstractQueue = ^TGeeAbstractQueue;
  TGeeAbstractQueue = record
    parent_instance: TGeeAbstractCollection;
    priv: PGeeAbstractQueuePrivate;
  end;

  PGeeAbstractQueueClass = ^TGeeAbstractQueueClass;
  TGeeAbstractQueueClass = record
    parent_class: TGeeAbstractCollectionClass;
    peek: function(self: PGeeAbstractQueue): Tgpointer; cdecl;
    poll: function(self: PGeeAbstractQueue): Tgpointer; cdecl;
    reserved0: procedure(self: PGeeAbstractQueue); cdecl;
    reserved1: procedure(self: PGeeAbstractQueue); cdecl;
    reserved2: procedure(self: PGeeAbstractQueue); cdecl;
    reserved3: procedure(self: PGeeAbstractQueue); cdecl;
    reserved4: procedure(self: PGeeAbstractQueue); cdecl;
    reserved5: procedure(self: PGeeAbstractQueue); cdecl;
    reserved6: procedure(self: PGeeAbstractQueue); cdecl;
    reserved7: procedure(self: PGeeAbstractQueue); cdecl;
    reserved8: procedure(self: PGeeAbstractQueue); cdecl;
    reserved9: procedure(self: PGeeAbstractQueue); cdecl;
    get_capacity: function(self: PGeeAbstractQueue): Tgint; cdecl;
    get_remaining_capacity: function(self: PGeeAbstractQueue): Tgint; cdecl;
    get_is_full: function(self: PGeeAbstractQueue): Tgboolean; cdecl;
  end;

  PGeeArrayListPrivate = type Pointer;
  PGeeArrayList = ^TGeeArrayList;
  TGeeArrayList = record
    parent_instance: TGeeAbstractBidirList;
    priv: PGeeArrayListPrivate;
    _items: Pgpointer;
    _items_length1: Tgint;
    __items_size_: Tgint;
    _size: Tgint;
  end;

  PGeeArrayListClass = ^TGeeArrayListClass;
  TGeeArrayListClass = record
    parent_class: TGeeAbstractBidirListClass;
  end;

  PGeeDequeIface = ^TGeeDequeIface;
  TGeeDequeIface = record
    parent_iface: TGTypeInterface;
    get_g_type: function(self: PGeeDeque): TGType; cdecl;
    get_g_dup_func: function(self: PGeeDeque): TGBoxedCopyFunc; cdecl;
    get_g_destroy_func: function(self: PGeeDeque): TGDestroyNotify; cdecl;
    offer_head: function(self: PGeeDeque; element: Tgconstpointer): Tgboolean; cdecl;
    peek_head: function(self: PGeeDeque): Tgpointer; cdecl;
    poll_head: function(self: PGeeDeque): Tgpointer; cdecl;
    drain_head: function(self: PGeeDeque; recipient: PGeeCollection; amount: Tgint): Tgint; cdecl;
    offer_tail: function(self: PGeeDeque; element: Tgconstpointer): Tgboolean; cdecl;
    peek_tail: function(self: PGeeDeque): Tgpointer; cdecl;
    poll_tail: function(self: PGeeDeque): Tgpointer; cdecl;
    drain_tail: function(self: PGeeDeque; recipient: PGeeCollection; amount: Tgint): Tgint; cdecl;
  end;

  PGeeArrayQueuePrivate = type Pointer;
  PGeeArrayQueue = ^TGeeArrayQueue;
  TGeeArrayQueue = record
    parent_instance: TGeeAbstractQueue;
    priv: PGeeArrayQueuePrivate;
  end;

  PGeeArrayQueueClass = ^TGeeArrayQueueClass;
  TGeeArrayQueueClass = record
    parent_class: TGeeAbstractQueueClass;
  end;

  PGeeComparableIface = ^TGeeComparableIface;
  TGeeComparableIface = record
    parent_iface: TGTypeInterface;
    compare_to: function(self: PGeeComparable; obj: Tgconstpointer): Tgint; cdecl;
  end;

  PGeeConcurrentListPrivate = type Pointer;
  PGeeConcurrentList = ^TGeeConcurrentList;
  TGeeConcurrentList = record
    parent_instance: TGeeAbstractList;
    priv: PGeeConcurrentListPrivate;
  end;

  PGeeConcurrentListClass = ^TGeeConcurrentListClass;
  TGeeConcurrentListClass = record
    parent_class: TGeeAbstractListClass;
  end;

  PGeeConcurrentSetPrivate = type Pointer;
  PGeeConcurrentSet = ^TGeeConcurrentSet;
  TGeeConcurrentSet = record
    parent_instance: TGeeAbstractSortedSet;
    priv: PGeeConcurrentSetPrivate;
  end;

  PGeeConcurrentSetClass = ^TGeeConcurrentSetClass;
  TGeeConcurrentSetClass = record
    parent_class: TGeeAbstractSortedSetClass;
  end;

type
  PGeeFutureError = ^TGeeFutureError;
  TGeeFutureError = longint;
const
  GEE_FUTURE_ERROR_ABANDON_PROMISE = 0;
  GEE_FUTURE_ERROR_EXCEPTION = 1;

type
  PGeeFutureIface = ^TGeeFutureIface;
  TGeeFutureIface = record
    parent_iface: TGTypeInterface;
    get_g_type: function(self: PGeeFuture): TGType; cdecl;
    get_g_dup_func: function(self: PGeeFuture): TGBoxedCopyFunc; cdecl;
    get_g_destroy_func: function(self: PGeeFuture): TGDestroyNotify; cdecl;
    wait: function(self: PGeeFuture; error: PPGError): Tgconstpointer; cdecl;
    wait_until: function(self: PGeeFuture; end_time: Tgint64; value: Pgconstpointer; error: PPGError): Tgboolean; cdecl;
    wait_async: procedure(self: PGeeFuture; _callback_: TGAsyncReadyCallback; _user_data_: Tgpointer); cdecl;
    wait_finish: function(self: PGeeFuture; _res_: PGAsyncResult; error: PPGError): Tgconstpointer; cdecl;
    map: function(self: PGeeFuture; a_type: TGType; a_dup_func: TGBoxedCopyFunc; a_destroy_func: TGDestroyNotify; func: TGeeFutureMapFunc;
      func_target: Tgpointer; func_target_destroy_notify: TGDestroyNotify): PGeeFuture; cdecl;
    light_map: function(self: PGeeFuture; a_type: TGType; a_dup_func: TGBoxedCopyFunc; a_destroy_func: TGDestroyNotify; func: TGeeFutureLightMapFunc;
      func_target: Tgpointer): PGeeFuture; cdecl;
    zip: function(self: PGeeFuture; a_type: TGType; a_dup_func: TGBoxedCopyFunc; a_destroy_func: TGDestroyNotify; b_type: TGType;
      b_dup_func: TGBoxedCopyFunc; b_destroy_func: TGDestroyNotify; zip_func: TGeeFutureZipFunc; zip_func_target: Tgpointer; second: PGeeFuture): PGeeFuture; cdecl;
    flat_map: function(self: PGeeFuture; a_type: TGType; a_dup_func: TGBoxedCopyFunc; a_destroy_func: TGDestroyNotify; func: TGeeFutureFlatMapFunc;
      func_target: Tgpointer; func_target_destroy_notify: TGDestroyNotify): PGeeFuture; cdecl;
    get_value: function(self: PGeeFuture): Tgconstpointer; cdecl;
    get_ready: function(self: PGeeFuture): Tgboolean; cdecl;
    get_exception: function(self: PGeeFuture): PGError; cdecl;
    light_map_fixed: function(self: PGeeFuture; a_type: TGType; a_dup_func: TGBoxedCopyFunc; a_destroy_func: TGDestroyNotify; func: TGeeFutureLightMapFunc;
      func_target: Tgpointer; func_target_destroy_notify: TGDestroyNotify): PGeeFuture; cdecl;
  end;

  PGeeHashableIface = ^TGeeHashableIface;
  TGeeHashableIface = record
    parent_iface: TGTypeInterface;
    hash: function(self: PGeeHashable): Tguint; cdecl;
    equal_to: function(self: PGeeHashable; obj: Tgconstpointer): Tgboolean; cdecl;
  end;

  PGeeHashMapPrivate = type Pointer;
  PGeeHashMap = ^TGeeHashMap;
  TGeeHashMap = record
    parent_instance: TGeeAbstractMap;
    priv: PGeeHashMapPrivate;
  end;

  PGeeHashMapClass = ^TGeeHashMapClass;
  TGeeHashMapClass = record
    parent_class: TGeeAbstractMapClass;
  end;

  PGeeHashMultiMapPrivate = type Pointer;
  PGeeHashMultiMap = ^TGeeHashMultiMap;
  TGeeHashMultiMap = record
    parent_instance: TGeeAbstractMultiMap;
    priv: PGeeHashMultiMapPrivate;
  end;

  PGeeHashMultiMapClass = ^TGeeHashMultiMapClass;
  TGeeHashMultiMapClass = record
    parent_class: TGeeAbstractMultiMapClass;
  end;

  PGeeHashMultiSetPrivate = type Pointer;
  PGeeHashMultiSet = ^TGeeHashMultiSet;
  TGeeHashMultiSet = record
    parent_instance: TGeeAbstractMultiSet;
    priv: PGeeHashMultiSetPrivate;
  end;

  PGeeHashMultiSetClass = ^TGeeHashMultiSetClass;
  TGeeHashMultiSetClass = record
    parent_class: TGeeAbstractMultiSetClass;
  end;

  PGeeHashSetPrivate = type Pointer;
  PGeeHashSet = ^TGeeHashSet;
  TGeeHashSet = record
    parent_instance: TGeeAbstractSet;
    priv: PGeeHashSetPrivate;
  end;

  PGeeHashSetClass = ^TGeeHashSetClass;
  TGeeHashSetClass = record
    parent_class: TGeeAbstractSetClass;
  end;

  PGeeHazardPointerNode = type Pointer;
  PGeeHazardPointer = ^TGeeHazardPointer;
  TGeeHazardPointer = record
    _node: PGeeHazardPointerNode;
  end;

  PGeeHazardPointerContext = ^TGeeHazardPointerContext;
  TGeeHazardPointerContext = record
    _parent: PGeeHazardPointerContext;
    _to_free: PGeeArrayList;
    _policy: PGeeHazardPointerPolicy;
  end;

  PGeeLinkedListPrivate = type Pointer;
  PGeeLinkedList = ^TGeeLinkedList;
  TGeeLinkedList = record
    parent_instance: TGeeAbstractBidirList;
    priv: PGeeLinkedListPrivate;
  end;

  PGeeLinkedListClass = ^TGeeLinkedListClass;
  TGeeLinkedListClass = record
    parent_class: TGeeAbstractBidirListClass;
  end;

  PGeeMapEntryPrivate = type Pointer;
  PGeeMapEntry = ^TGeeMapEntry;
  TGeeMapEntry = record
    parent_instance: TGObject;
    priv: PGeeMapEntryPrivate;
  end;

  PGeeMapEntryClass = ^TGeeMapEntryClass;
  TGeeMapEntryClass = record
    parent_class: TGObjectClass;
    get_key: function(self: PGeeMapEntry): Tgconstpointer; cdecl;
    get_value: function(self: PGeeMapEntry): Tgconstpointer; cdecl;
    set_value: procedure(self: PGeeMapEntry; value: Tgconstpointer); cdecl;
    get_read_only: function(self: PGeeMapEntry): Tgboolean; cdecl;
  end;

  PGeePriorityQueuePrivate = type Pointer;
  PGeePriorityQueue = ^TGeePriorityQueue;
  TGeePriorityQueue = record
    parent_instance: TGeeAbstractQueue;
    priv: PGeePriorityQueuePrivate;
  end;

  PGeePriorityQueueClass = ^TGeePriorityQueueClass;
  TGeePriorityQueueClass = record
    parent_class: TGeeAbstractQueueClass;
  end;

  PGeePromisePrivate = type Pointer;
  PGeePromise = ^TGeePromise;
  TGeePromise = record
    parent_instance: TGTypeInstance;
    ref_count: longint;
    priv: PGeePromisePrivate;
  end;

  PGeePromiseClass = ^TGeePromiseClass;
  TGeePromiseClass = record
    parent_class: TGTypeClass;
    finalize: procedure(self: PGeePromise); cdecl;
  end;

  PGeeTreeMapPrivate = type Pointer;
  PGeeTreeMap = ^TGeeTreeMap;
  TGeeTreeMap = record
    parent_instance: TGeeAbstractBidirSortedMap;
    priv: PGeeTreeMapPrivate;
  end;

  PGeeTreeMapClass = ^TGeeTreeMapClass;
  TGeeTreeMapClass = record
    parent_class: TGeeAbstractBidirSortedMapClass;
  end;

  PGeeTreeMultiMapPrivate = type Pointer;
  PGeeTreeMultiMap = ^TGeeTreeMultiMap;
  TGeeTreeMultiMap = record
    parent_instance: TGeeAbstractMultiMap;
    priv: PGeeTreeMultiMapPrivate;
  end;

  PGeeTreeMultiMapClass = ^TGeeTreeMultiMapClass;
  TGeeTreeMultiMapClass = record
    parent_class: TGeeAbstractMultiMapClass;
  end;

  PGeeTreeMultiSetPrivate = type Pointer;
  PGeeTreeMultiSet = ^TGeeTreeMultiSet;
  TGeeTreeMultiSet = record
    parent_instance: TGeeAbstractMultiSet;
    priv: PGeeTreeMultiSetPrivate;
  end;

  PGeeTreeMultiSetClass = ^TGeeTreeMultiSetClass;
  TGeeTreeMultiSetClass = record
    parent_class: TGeeAbstractMultiSetClass;
  end;

  PGeeTreeSetPrivate = type Pointer;
  PGeeTreeSet = ^TGeeTreeSet;
  TGeeTreeSet = record
    parent_instance: TGeeAbstractBidirSortedSet;
    priv: PGeeTreeSetPrivate;
  end;

  PGeeTreeSetClass = ^TGeeTreeSetClass;
  TGeeTreeSetClass = record
    parent_class: TGeeAbstractBidirSortedSetClass;
  end;

  PGeeUnrolledLinkedListPrivate = type Pointer;
  PGeeUnrolledLinkedList = ^TGeeUnrolledLinkedList;
  TGeeUnrolledLinkedList = record
    parent_instance: TGeeAbstractBidirList;
    priv: PGeeUnrolledLinkedListPrivate;
  end;

  PGeeUnrolledLinkedListClass = ^TGeeUnrolledLinkedListClass;
  TGeeUnrolledLinkedListClass = record
    parent_class: TGeeAbstractBidirListClass;
  end;

function gee_traversable_stream_get_type: TGType; cdecl; external libgee;
function gee_lazy_ref(instance: Tgpointer): Tgpointer; cdecl; external libgee;
procedure gee_lazy_unref(instance: Tgpointer); cdecl; external libgee;
function gee_param_spec_lazy(name: Pgchar; nick: Pgchar; blurb: Pgchar; object_type: TGType; flags: TGParamFlags): PGParamSpec; cdecl; external libgee;
procedure gee_value_set_lazy(value: PGValue; v_object: Tgpointer); cdecl; external libgee;
procedure gee_value_take_lazy(value: PGValue; v_object: Tgpointer); cdecl; external libgee;
function gee_value_get_lazy(value: PGValue): Tgpointer; cdecl; external libgee;
function gee_lazy_get_type: TGType; cdecl; external libgee;
function gee_iterator_get_type: TGType; cdecl; external libgee;
function gee_traversable_get_type: TGType; cdecl; external libgee;
function gee_iterable_get_type: TGType; cdecl; external libgee;
function gee_collection_get_type: TGType; cdecl; external libgee;
function gee_abstract_collection_get_type: TGType; cdecl; external libgee;
function gee_list_iterator_get_type: TGType; cdecl; external libgee;
function gee_list_get_type: TGType; cdecl; external libgee;
function gee_abstract_list_get_type: TGType; cdecl; external libgee;
function gee_bidir_iterator_get_type: TGType; cdecl; external libgee;
function gee_bidir_list_iterator_get_type: TGType; cdecl; external libgee;
function gee_bidir_list_get_type: TGType; cdecl; external libgee;
function gee_abstract_bidir_list_get_type: TGType; cdecl; external libgee;
function gee_abstract_bidir_list_bidir_list_iterator(self: PGeeAbstractBidirList): PGeeBidirListIterator; cdecl; external libgee;
function gee_abstract_bidir_list_construct(object_type: TGType; g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify): PGeeAbstractBidirList; cdecl; external libgee;
function gee_abstract_bidir_list_get_read_only_view(self: PGeeAbstractBidirList): PGeeBidirList; cdecl; external libgee;
function gee_set_get_type: TGType; cdecl; external libgee;
function gee_abstract_set_get_type: TGType; cdecl; external libgee;
function gee_sorted_set_get_type: TGType; cdecl; external libgee;
function gee_abstract_sorted_set_get_type: TGType; cdecl; external libgee;
function gee_bidir_sorted_set_get_type: TGType; cdecl; external libgee;
function gee_abstract_bidir_sorted_set_get_type: TGType; cdecl; external libgee;
function gee_abstract_bidir_sorted_set_bidir_iterator(self: PGeeAbstractBidirSortedSet): PGeeBidirIterator; cdecl; external libgee;
function gee_abstract_bidir_sorted_set_construct(object_type: TGType; g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify): PGeeAbstractBidirSortedSet; cdecl; external libgee;
function gee_abstract_bidir_sorted_set_get_read_only_view(self: PGeeAbstractBidirSortedSet): PGeeBidirSortedSet; cdecl; external libgee;
function gee_map_iterator_get_type: TGType; cdecl; external libgee;
function gee_map_entry_get_type: TGType; cdecl; external libgee;
function gee_map_get_type: TGType; cdecl; external libgee;
function gee_abstract_map_get_type: TGType; cdecl; external libgee;
function gee_sorted_map_get_type: TGType; cdecl; external libgee;
function gee_abstract_sorted_map_get_type: TGType; cdecl; external libgee;
function gee_bidir_map_iterator_get_type: TGType; cdecl; external libgee;
function gee_bidir_sorted_map_get_type: TGType; cdecl; external libgee;
function gee_abstract_bidir_sorted_map_get_type: TGType; cdecl; external libgee;
function gee_abstract_bidir_sorted_map_bidir_map_iterator(self: PGeeAbstractBidirSortedMap): PGeeBidirMapIterator; cdecl; external libgee;
function gee_abstract_bidir_sorted_map_construct(object_type: TGType; k_type: TGType; k_dup_func: TGBoxedCopyFunc; k_destroy_func: TGDestroyNotify; v_type: TGType;
  v_dup_func: TGBoxedCopyFunc; v_destroy_func: TGDestroyNotify): PGeeAbstractBidirSortedMap; cdecl; external libgee;
function gee_abstract_bidir_sorted_map_get_read_only_view(self: PGeeAbstractBidirSortedMap): PGeeBidirSortedMap; cdecl; external libgee;
function gee_abstract_collection_contains(self: PGeeAbstractCollection; item: Tgconstpointer): Tgboolean; cdecl; external libgee;
function gee_abstract_collection_add(self: PGeeAbstractCollection; item: Tgconstpointer): Tgboolean; cdecl; external libgee;
function gee_abstract_collection_remove(self: PGeeAbstractCollection; item: Tgconstpointer): Tgboolean; cdecl; external libgee;
procedure gee_abstract_collection_clear(self: PGeeAbstractCollection); cdecl; external libgee;
function gee_abstract_collection_iterator(self: PGeeAbstractCollection): PGeeIterator; cdecl; external libgee;
function gee_abstract_collection_foreach(self: PGeeAbstractCollection; f: TGeeForallFunc; f_target: Tgpointer): Tgboolean; cdecl; external libgee;
function gee_abstract_collection_construct(object_type: TGType; g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify): PGeeAbstractCollection; cdecl; external libgee;
function gee_abstract_collection_get_size(self: PGeeAbstractCollection): Tgint; cdecl; external libgee;
function gee_abstract_collection_get_read_only(self: PGeeAbstractCollection): Tgboolean; cdecl; external libgee;
function gee_abstract_collection_get_read_only_view(self: PGeeAbstractCollection): PGeeCollection; cdecl; external libgee;
function gee_abstract_list_list_iterator(self: PGeeAbstractList): PGeeListIterator; cdecl; external libgee;
function gee_abstract_list_get(self: PGeeAbstractList; index: Tgint): Tgpointer; cdecl; external libgee;
procedure gee_abstract_list_set(self: PGeeAbstractList; index: Tgint; item: Tgconstpointer); cdecl; external libgee;
function gee_abstract_list_index_of(self: PGeeAbstractList; item: Tgconstpointer): Tgint; cdecl; external libgee;
procedure gee_abstract_list_insert(self: PGeeAbstractList; index: Tgint; item: Tgconstpointer); cdecl; external libgee;
function gee_abstract_list_remove_at(self: PGeeAbstractList; index: Tgint): Tgpointer; cdecl; external libgee;
function gee_abstract_list_slice(self: PGeeAbstractList; start: Tgint; stop: Tgint): PGeeList; cdecl; external libgee;
function gee_abstract_list_construct(object_type: TGType; g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify): PGeeAbstractList; cdecl; external libgee;
function gee_abstract_list_get_read_only_view(self: PGeeAbstractList): PGeeList; cdecl; external libgee;
function gee_abstract_map_has_key(self: PGeeAbstractMap; key: Tgconstpointer): Tgboolean; cdecl; external libgee;
function gee_abstract_map_has(self: PGeeAbstractMap; key: Tgconstpointer; value: Tgconstpointer): Tgboolean; cdecl; external libgee;
function gee_abstract_map_get(self: PGeeAbstractMap; key: Tgconstpointer): Tgpointer; cdecl; external libgee;
procedure gee_abstract_map_set(self: PGeeAbstractMap; key: Tgconstpointer; value: Tgconstpointer); cdecl; external libgee;
function gee_abstract_map_unset(self: PGeeAbstractMap; key: Tgconstpointer; value: Pgpointer): Tgboolean; cdecl; external libgee;
function gee_abstract_map_map_iterator(self: PGeeAbstractMap): PGeeMapIterator; cdecl; external libgee;
procedure gee_abstract_map_clear(self: PGeeAbstractMap); cdecl; external libgee;
function gee_abstract_map_foreach(self: PGeeAbstractMap; f: TGeeForallFunc; f_target: Tgpointer): Tgboolean; cdecl; external libgee;
function gee_abstract_map_stream(self: PGeeAbstractMap; a_type: TGType; a_dup_func: TGBoxedCopyFunc; a_destroy_func: TGDestroyNotify; f: TGeeStreamFunc;
  f_target: Tgpointer; f_target_destroy_notify: TGDestroyNotify): PGeeIterator; cdecl; external libgee;
function gee_abstract_map_construct(object_type: TGType; k_type: TGType; k_dup_func: TGBoxedCopyFunc; k_destroy_func: TGDestroyNotify; v_type: TGType;
  v_dup_func: TGBoxedCopyFunc; v_destroy_func: TGDestroyNotify): PGeeAbstractMap; cdecl; external libgee;
function gee_abstract_map_get_size(self: PGeeAbstractMap): Tgint; cdecl; external libgee;
function gee_abstract_map_get_read_only(self: PGeeAbstractMap): Tgboolean; cdecl; external libgee;
function gee_abstract_map_get_keys(self: PGeeAbstractMap): PGeeSet; cdecl; external libgee;
function gee_abstract_map_get_values(self: PGeeAbstractMap): PGeeCollection; cdecl; external libgee;
function gee_abstract_map_get_entries(self: PGeeAbstractMap): PGeeSet; cdecl; external libgee;
function gee_abstract_map_get_read_only_view(self: PGeeAbstractMap): PGeeMap; cdecl; external libgee;
function gee_multi_set_get_type: TGType; cdecl; external libgee;
function gee_multi_map_get_type: TGType; cdecl; external libgee;
function gee_abstract_multi_map_get_type: TGType; cdecl; external libgee;
function gee_abstract_multi_map_construct(object_type: TGType; k_type: TGType; k_dup_func: TGBoxedCopyFunc; k_destroy_func: TGDestroyNotify; v_type: TGType;
  v_dup_func: TGBoxedCopyFunc; v_destroy_func: TGDestroyNotify; storage_map: PGeeMap): PGeeAbstractMultiMap; cdecl; external libgee;
function gee_abstract_multi_map_create_value_storage(self: PGeeAbstractMultiMap): PGeeCollection; cdecl; external libgee;
function gee_abstract_multi_map_create_multi_key_set(self: PGeeAbstractMultiMap): PGeeMultiSet; cdecl; external libgee;
function gee_abstract_multi_map_get_value_equal_func(self: PGeeAbstractMultiMap; result_target: Pgpointer; result_target_destroy_notify: PGDestroyNotify): TGeeEqualDataFunc; cdecl; external libgee;
function gee_abstract_multi_map_get_read_only_view(self: PGeeAbstractMultiMap): PGeeMultiMap; cdecl; external libgee;
function gee_abstract_multi_set_get_type: TGType; cdecl; external libgee;
function gee_abstract_multi_set_construct(object_type: TGType; g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; storage_map: PGeeMap): PGeeAbstractMultiSet; cdecl; external libgee;
function gee_abstract_multi_set_get_read_only_view(self: PGeeAbstractMultiSet): PGeeMultiSet; cdecl; external libgee;
function gee_queue_get_type: TGType; cdecl; external libgee;
function gee_abstract_queue_get_type: TGType; cdecl; external libgee;
function gee_abstract_queue_peek(self: PGeeAbstractQueue): Tgpointer; cdecl; external libgee;
function gee_abstract_queue_poll(self: PGeeAbstractQueue): Tgpointer; cdecl; external libgee;
function gee_abstract_queue_construct(object_type: TGType; g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify): PGeeAbstractQueue; cdecl; external libgee;
function gee_abstract_queue_get_capacity(self: PGeeAbstractQueue): Tgint; cdecl; external libgee;
function gee_abstract_queue_get_remaining_capacity(self: PGeeAbstractQueue): Tgint; cdecl; external libgee;
function gee_abstract_queue_get_is_full(self: PGeeAbstractQueue): Tgboolean; cdecl; external libgee;
function gee_abstract_set_construct(object_type: TGType; g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify): PGeeAbstractSet; cdecl; external libgee;
function gee_abstract_set_get_read_only_view(self: PGeeAbstractSet): PGeeSet; cdecl; external libgee;
function gee_abstract_sorted_map_head_map(self: PGeeAbstractSortedMap; before: Tgconstpointer): PGeeSortedMap; cdecl; external libgee;
function gee_abstract_sorted_map_tail_map(self: PGeeAbstractSortedMap; after: Tgconstpointer): PGeeSortedMap; cdecl; external libgee;
function gee_abstract_sorted_map_sub_map(self: PGeeAbstractSortedMap; before: Tgconstpointer; after: Tgconstpointer): PGeeSortedMap; cdecl; external libgee;
function gee_abstract_sorted_map_construct(object_type: TGType; k_type: TGType; k_dup_func: TGBoxedCopyFunc; k_destroy_func: TGDestroyNotify; v_type: TGType;
  v_dup_func: TGBoxedCopyFunc; v_destroy_func: TGDestroyNotify): PGeeAbstractSortedMap; cdecl; external libgee;
function gee_abstract_sorted_map_get_ascending_keys(self: PGeeAbstractSortedMap): PGeeSortedSet; cdecl; external libgee;
function gee_abstract_sorted_map_get_ascending_entries(self: PGeeAbstractSortedMap): PGeeSortedSet; cdecl; external libgee;
function gee_abstract_sorted_set_first(self: PGeeAbstractSortedSet): Tgpointer; cdecl; external libgee;
function gee_abstract_sorted_set_last(self: PGeeAbstractSortedSet): Tgpointer; cdecl; external libgee;
function gee_abstract_sorted_set_iterator_at(self: PGeeAbstractSortedSet; element: Tgconstpointer): PGeeIterator; cdecl; external libgee;
function gee_abstract_sorted_set_lower(self: PGeeAbstractSortedSet; element: Tgconstpointer): Tgpointer; cdecl; external libgee;
function gee_abstract_sorted_set_higher(self: PGeeAbstractSortedSet; element: Tgconstpointer): Tgpointer; cdecl; external libgee;
function gee_abstract_sorted_set_floor(self: PGeeAbstractSortedSet; element: Tgconstpointer): Tgpointer; cdecl; external libgee;
function gee_abstract_sorted_set_ceil(self: PGeeAbstractSortedSet; element: Tgconstpointer): Tgpointer; cdecl; external libgee;
function gee_abstract_sorted_set_head_set(self: PGeeAbstractSortedSet; before: Tgconstpointer): PGeeSortedSet; cdecl; external libgee;
function gee_abstract_sorted_set_tail_set(self: PGeeAbstractSortedSet; after: Tgconstpointer): PGeeSortedSet; cdecl; external libgee;
function gee_abstract_sorted_set_sub_set(self: PGeeAbstractSortedSet; from: Tgconstpointer; to_: Tgconstpointer): PGeeSortedSet; cdecl; external libgee;
function gee_abstract_sorted_set_construct(object_type: TGType; g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify): PGeeAbstractSortedSet; cdecl; external libgee;
function gee_abstract_sorted_set_get_read_only_view(self: PGeeAbstractSortedSet): PGeeSortedSet; cdecl; external libgee;
function gee_array_list_get_type: TGType; cdecl; external libgee;
function gee_array_list_new(g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; equal_func: TGeeEqualDataFunc; equal_func_target: Tgpointer;
  equal_func_target_destroy_notify: TGDestroyNotify): PGeeArrayList; cdecl; external libgee;
function gee_array_list_construct(object_type: TGType; g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; equal_func: TGeeEqualDataFunc;
  equal_func_target: Tgpointer; equal_func_target_destroy_notify: TGDestroyNotify): PGeeArrayList; cdecl; external libgee;
function gee_array_list_new_wrap(g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; items: Pgpointer; items_length1: Tgint;
  equal_func: TGeeEqualDataFunc; equal_func_target: Tgpointer; equal_func_target_destroy_notify: TGDestroyNotify): PGeeArrayList; cdecl; external libgee;
function gee_array_list_construct_wrap(object_type: TGType; g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; items: Pgpointer;
  items_length1: Tgint; equal_func: TGeeEqualDataFunc; equal_func_target: Tgpointer; equal_func_target_destroy_notify: TGDestroyNotify): PGeeArrayList; cdecl; external libgee;
function gee_array_list_add_all(self: PGeeArrayList; collection: PGeeCollection): Tgboolean; cdecl; external libgee;
function gee_array_list_get_equal_func(self: PGeeArrayList; result_target: Pgpointer): TGeeEqualDataFunc; cdecl; external libgee;
function gee_deque_get_type: TGType; cdecl; external libgee;
function gee_array_queue_get_type: TGType; cdecl; external libgee;
function gee_array_queue_new(g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; equal_func: TGeeEqualDataFunc; equal_func_target: Tgpointer;
  equal_func_target_destroy_notify: TGDestroyNotify): PGeeArrayQueue; cdecl; external libgee;
function gee_array_queue_construct(object_type: TGType; g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; equal_func: TGeeEqualDataFunc;
  equal_func_target: Tgpointer; equal_func_target_destroy_notify: TGDestroyNotify): PGeeArrayQueue; cdecl; external libgee;
function gee_array_queue_get_equal_func(self: PGeeArrayQueue; result_target: Pgpointer): TGeeEqualDataFunc; cdecl; external libgee;
function gee_array_queue_get_is_empty(self: PGeeArrayQueue): Tgboolean; cdecl; external libgee;
function gee_bidir_iterator_previous(self: PGeeBidirIterator): Tgboolean; cdecl; external libgee;
function gee_bidir_iterator_has_previous(self: PGeeBidirIterator): Tgboolean; cdecl; external libgee;
function gee_bidir_iterator_first(self: PGeeBidirIterator): Tgboolean; cdecl; external libgee;
function gee_bidir_iterator_last(self: PGeeBidirIterator): Tgboolean; cdecl; external libgee;
function gee_bidir_list_bidir_list_iterator(self: PGeeBidirList): PGeeBidirListIterator; cdecl; external libgee;
function gee_bidir_list_get_read_only_view(self: PGeeBidirList): PGeeBidirList; cdecl; external libgee;
procedure gee_bidir_list_iterator_insert(self: PGeeBidirListIterator; item: Tgconstpointer); cdecl; external libgee;
function gee_bidir_map_iterator_previous(self: PGeeBidirMapIterator): Tgboolean; cdecl; external libgee;
function gee_bidir_map_iterator_has_previous(self: PGeeBidirMapIterator): Tgboolean; cdecl; external libgee;
function gee_bidir_map_iterator_first(self: PGeeBidirMapIterator): Tgboolean; cdecl; external libgee;
function gee_bidir_map_iterator_last(self: PGeeBidirMapIterator): Tgboolean; cdecl; external libgee;
function gee_bidir_sorted_set_bidir_iterator(self: PGeeBidirSortedSet): PGeeBidirIterator; cdecl; external libgee;
function gee_bidir_sorted_set_empty(g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify): PGeeBidirSortedSet; cdecl; external libgee;
function gee_bidir_sorted_set_get_read_only_view(self: PGeeBidirSortedSet): PGeeBidirSortedSet; cdecl; external libgee;
function gee_bidir_sorted_map_bidir_map_iterator(self: PGeeBidirSortedMap): PGeeBidirMapIterator; cdecl; external libgee;
function gee_bidir_sorted_map_empty(k_type: TGType; k_dup_func: TGBoxedCopyFunc; k_destroy_func: TGDestroyNotify; v_type: TGType; v_dup_func: TGBoxedCopyFunc;
  v_destroy_func: TGDestroyNotify): PGeeBidirSortedMap; cdecl; external libgee;
function gee_bidir_sorted_map_get_read_only_view(self: PGeeBidirSortedMap): PGeeBidirSortedMap; cdecl; external libgee;
function gee_collection_contains(self: PGeeCollection; item: Tgconstpointer): Tgboolean; cdecl; external libgee;
function gee_collection_add(self: PGeeCollection; item: Tgconstpointer): Tgboolean; cdecl; external libgee;
function gee_collection_remove(self: PGeeCollection; item: Tgconstpointer): Tgboolean; cdecl; external libgee;
procedure gee_collection_clear(self: PGeeCollection); cdecl; external libgee;
function gee_collection_add_all(self: PGeeCollection; collection: PGeeCollection): Tgboolean; cdecl; external libgee;
function gee_collection_contains_all(self: PGeeCollection; collection: PGeeCollection): Tgboolean; cdecl; external libgee;
function gee_collection_remove_all(self: PGeeCollection; collection: PGeeCollection): Tgboolean; cdecl; external libgee;
function gee_collection_retain_all(self: PGeeCollection; collection: PGeeCollection): Tgboolean; cdecl; external libgee;
function gee_collection_to_array(self: PGeeCollection; result_length1: Pgint): Pgpointer; cdecl; external libgee;
function gee_collection_add_all_array(self: PGeeCollection; arr: Pgpointer; array_length1: Tgint): Tgboolean; cdecl; external libgee;
function gee_collection_contains_all_array(self: PGeeCollection; arr: Pgpointer; array_length1: Tgint): Tgboolean; cdecl; external libgee;
function gee_collection_remove_all_array(self: PGeeCollection; arr: Pgpointer; array_length1: Tgint): Tgboolean; cdecl; external libgee;
function gee_collection_add_all_iterator(self: PGeeCollection; iter: PGeeIterator): Tgboolean; cdecl; external libgee;
function gee_collection_contains_all_iterator(self: PGeeCollection; iter: PGeeIterator): Tgboolean; cdecl; external libgee;
function gee_collection_remove_all_iterator(self: PGeeCollection; iter: PGeeIterator): Tgboolean; cdecl; external libgee;
function gee_collection_empty(g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify): PGeeCollection; cdecl; external libgee;
function gee_collection_get_size(self: PGeeCollection): Tgint; cdecl; external libgee;
function gee_collection_get_is_empty(self: PGeeCollection): Tgboolean; cdecl; external libgee;
function gee_collection_get_read_only(self: PGeeCollection): Tgboolean; cdecl; external libgee;
function gee_collection_get_read_only_view(self: PGeeCollection): PGeeCollection; cdecl; external libgee;
function gee_comparable_get_type: TGType; cdecl; external libgee;
function gee_comparable_compare_to(self: PGeeComparable; obj: Tgconstpointer): Tgint; cdecl; external libgee;
function gee_concurrent_list_get_type: TGType; cdecl; external libgee;
function gee_concurrent_list_new(g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; equal_func: TGeeEqualDataFunc; equal_func_target: Tgpointer;
  equal_func_target_destroy_notify: TGDestroyNotify): PGeeConcurrentList; cdecl; external libgee;
function gee_concurrent_list_construct(object_type: TGType; g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; equal_func: TGeeEqualDataFunc;
  equal_func_target: Tgpointer; equal_func_target_destroy_notify: TGDestroyNotify): PGeeConcurrentList; cdecl; external libgee;
function gee_concurrent_list_get_equal_func(self: PGeeConcurrentList; result_target: Pgpointer): TGeeEqualDataFunc; cdecl; external libgee;
function gee_concurrent_list_get_is_empty(self: PGeeConcurrentList): Tgboolean; cdecl; external libgee;
function gee_concurrent_set_get_type: TGType; cdecl; external libgee;
function gee_concurrent_set_range_type_get_type: TGType; cdecl; external libgee;
function gee_concurrent_set_new(g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; compare_func: TGCompareDataFunc; compare_func_target: Tgpointer;
  compare_func_target_destroy_notify: TGDestroyNotify): PGeeConcurrentSet; cdecl; external libgee;
function gee_concurrent_set_construct(object_type: TGType; g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; compare_func: TGCompareDataFunc;
  compare_func_target: Tgpointer; compare_func_target_destroy_notify: TGDestroyNotify): PGeeConcurrentSet; cdecl; external libgee;
function gee_deque_offer_head(self: PGeeDeque; element: Tgconstpointer): Tgboolean; cdecl; external libgee;
function gee_deque_peek_head(self: PGeeDeque): Tgpointer; cdecl; external libgee;
function gee_deque_poll_head(self: PGeeDeque): Tgpointer; cdecl; external libgee;
function gee_deque_drain_head(self: PGeeDeque; recipient: PGeeCollection; amount: Tgint): Tgint; cdecl; external libgee;
function gee_deque_offer_tail(self: PGeeDeque; element: Tgconstpointer): Tgboolean; cdecl; external libgee;
function gee_deque_peek_tail(self: PGeeDeque): Tgpointer; cdecl; external libgee;
function gee_deque_poll_tail(self: PGeeDeque): Tgpointer; cdecl; external libgee;
function gee_deque_drain_tail(self: PGeeDeque; recipient: PGeeCollection; amount: Tgint): Tgint; cdecl; external libgee;
function gee_functions_get_equal_func_for(t: TGType; result_target: Pgpointer; result_target_destroy_notify: PGDestroyNotify): TGeeEqualDataFunc; cdecl; external libgee;
function gee_functions_get_hash_func_for(t: TGType; result_target: Pgpointer; result_target_destroy_notify: PGDestroyNotify): TGeeHashDataFunc; cdecl; external libgee;
function gee_functions_get_compare_func_for(t: TGType; result_target: Pgpointer; result_target_destroy_notify: PGDestroyNotify): TGCompareDataFunc; cdecl; external libgee;
function gee_future_error_quark: TGQuark; cdecl; external libgee;
function gee_future_error_get_type: TGType; cdecl; external libgee;
function gee_future_get_type: TGType; cdecl; external libgee;
function gee_future_wait(self: PGeeFuture; error: PPGError): Tgconstpointer; cdecl; external libgee;
function gee_future_wait_until(self: PGeeFuture; end_time: Tgint64; value: Pgconstpointer; error: PPGError): Tgboolean; cdecl; external libgee;
procedure gee_future_wait_async(self: PGeeFuture; _callback_: TGAsyncReadyCallback; _user_data_: Tgpointer); cdecl; external libgee;
function gee_future_wait_finish(self: PGeeFuture; _res_: PGAsyncResult; error: PPGError): Tgconstpointer; cdecl; external libgee;
function gee_future_map(self: PGeeFuture; a_type: TGType; a_dup_func: TGBoxedCopyFunc; a_destroy_func: TGDestroyNotify; func: TGeeFutureMapFunc;
  func_target: Tgpointer; func_target_destroy_notify: TGDestroyNotify): PGeeFuture; cdecl; external libgee;
function gee_future_light_map_fixed(self: PGeeFuture; a_type: TGType; a_dup_func: TGBoxedCopyFunc; a_destroy_func: TGDestroyNotify; func: TGeeFutureLightMapFunc;
  func_target: Tgpointer; func_target_destroy_notify: TGDestroyNotify): PGeeFuture; cdecl; external libgee;
function gee_future_light_map(self: PGeeFuture; a_type: TGType; a_dup_func: TGBoxedCopyFunc; a_destroy_func: TGDestroyNotify; func: TGeeFutureLightMapFunc;
  func_target: Tgpointer): PGeeFuture; cdecl; external libgee;
function gee_future_zip(self: PGeeFuture; a_type: TGType; a_dup_func: TGBoxedCopyFunc; a_destroy_func: TGDestroyNotify; b_type: TGType;
  b_dup_func: TGBoxedCopyFunc; b_destroy_func: TGDestroyNotify; zip_func: TGeeFutureZipFunc; zip_func_target: Tgpointer; second: PGeeFuture): PGeeFuture; cdecl; external libgee;
function gee_future_flat_map(self: PGeeFuture; a_type: TGType; a_dup_func: TGBoxedCopyFunc; a_destroy_func: TGDestroyNotify; func: TGeeFutureFlatMapFunc;
  func_target: Tgpointer; func_target_destroy_notify: TGDestroyNotify): PGeeFuture; cdecl; external libgee;
function gee_future_get_value(self: PGeeFuture): Tgconstpointer; cdecl; external libgee;
function gee_future_get_ready(self: PGeeFuture): Tgboolean; cdecl; external libgee;
function gee_future_get_exception(self: PGeeFuture): PGError; cdecl; external libgee;
function gee_hashable_get_type: TGType; cdecl; external libgee;
function gee_hashable_hash(self: PGeeHashable): Tguint; cdecl; external libgee;
function gee_hashable_equal_to(self: PGeeHashable; obj: Tgconstpointer): Tgboolean; cdecl; external libgee;
function gee_hash_map_get_type: TGType; cdecl; external libgee;
function gee_hash_map_new(k_type: TGType; k_dup_func: TGBoxedCopyFunc; k_destroy_func: TGDestroyNotify; v_type: TGType; v_dup_func: TGBoxedCopyFunc;
  v_destroy_func: TGDestroyNotify; key_hash_func: TGeeHashDataFunc; key_hash_func_target: Tgpointer; key_hash_func_target_destroy_notify: TGDestroyNotify; key_equal_func: TGeeEqualDataFunc;
  key_equal_func_target: Tgpointer; key_equal_func_target_destroy_notify: TGDestroyNotify; value_equal_func: TGeeEqualDataFunc; value_equal_func_target: Tgpointer; value_equal_func_target_destroy_notify: TGDestroyNotify): PGeeHashMap; cdecl; external libgee;
function gee_hash_map_construct(object_type: TGType; k_type: TGType; k_dup_func: TGBoxedCopyFunc; k_destroy_func: TGDestroyNotify; v_type: TGType;
  v_dup_func: TGBoxedCopyFunc; v_destroy_func: TGDestroyNotify; key_hash_func: TGeeHashDataFunc; key_hash_func_target: Tgpointer; key_hash_func_target_destroy_notify: TGDestroyNotify;
  key_equal_func: TGeeEqualDataFunc; key_equal_func_target: Tgpointer; key_equal_func_target_destroy_notify: TGDestroyNotify; value_equal_func: TGeeEqualDataFunc; value_equal_func_target: Tgpointer;
  value_equal_func_target_destroy_notify: TGDestroyNotify): PGeeHashMap; cdecl; external libgee;
function gee_hash_map_get_key_hash_func(self: PGeeHashMap; result_target: Pgpointer): TGeeHashDataFunc; cdecl; external libgee;
function gee_hash_map_get_key_equal_func(self: PGeeHashMap; result_target: Pgpointer): TGeeEqualDataFunc; cdecl; external libgee;
function gee_hash_map_get_value_equal_func(self: PGeeHashMap; result_target: Pgpointer): TGeeEqualDataFunc; cdecl; external libgee;
function gee_hash_multi_map_get_type: TGType; cdecl; external libgee;
function gee_hash_multi_map_new(k_type: TGType; k_dup_func: TGBoxedCopyFunc; k_destroy_func: TGDestroyNotify; v_type: TGType; v_dup_func: TGBoxedCopyFunc;
  v_destroy_func: TGDestroyNotify; key_hash_func: TGeeHashDataFunc; key_hash_func_target: Tgpointer; key_hash_func_target_destroy_notify: TGDestroyNotify; key_equal_func: TGeeEqualDataFunc;
  key_equal_func_target: Tgpointer; key_equal_func_target_destroy_notify: TGDestroyNotify; value_hash_func: TGeeHashDataFunc; value_hash_func_target: Tgpointer; value_hash_func_target_destroy_notify: TGDestroyNotify;
  value_equal_func: TGeeEqualDataFunc; value_equal_func_target: Tgpointer; value_equal_func_target_destroy_notify: TGDestroyNotify): PGeeHashMultiMap; cdecl; external libgee;
function gee_hash_multi_map_construct(object_type: TGType; k_type: TGType; k_dup_func: TGBoxedCopyFunc; k_destroy_func: TGDestroyNotify; v_type: TGType;
  v_dup_func: TGBoxedCopyFunc; v_destroy_func: TGDestroyNotify; key_hash_func: TGeeHashDataFunc; key_hash_func_target: Tgpointer; key_hash_func_target_destroy_notify: TGDestroyNotify;
  key_equal_func: TGeeEqualDataFunc; key_equal_func_target: Tgpointer; key_equal_func_target_destroy_notify: TGDestroyNotify; value_hash_func: TGeeHashDataFunc; value_hash_func_target: Tgpointer;
  value_hash_func_target_destroy_notify: TGDestroyNotify; value_equal_func: TGeeEqualDataFunc; value_equal_func_target: Tgpointer; value_equal_func_target_destroy_notify: TGDestroyNotify): PGeeHashMultiMap; cdecl; external libgee;
function gee_hash_multi_map_get_key_hash_func(self: PGeeHashMultiMap; result_target: Pgpointer): TGeeHashDataFunc; cdecl; external libgee;
function gee_hash_multi_map_get_key_equal_func(self: PGeeHashMultiMap; result_target: Pgpointer): TGeeEqualDataFunc; cdecl; external libgee;
function gee_hash_multi_map_get_value_hash_func(self: PGeeHashMultiMap; result_target: Pgpointer): TGeeHashDataFunc; cdecl; external libgee;
function gee_hash_multi_map_get_value_equal_func(self: PGeeHashMultiMap; result_target: Pgpointer): TGeeEqualDataFunc; cdecl; external libgee;
function gee_hash_multi_set_get_type: TGType; cdecl; external libgee;
function gee_hash_multi_set_new_fixed(g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; hash_func: TGeeHashDataFunc; hash_func_target: Tgpointer;
  hash_func_target_destroy_notify: TGDestroyNotify; equal_func: TGeeEqualDataFunc; equal_func_target: Tgpointer; equal_func_target_destroy_notify: TGDestroyNotify): PGeeHashMultiSet; cdecl; external libgee;
function gee_hash_multi_set_construct(object_type: TGType; g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; hash_func: TGeeHashDataFunc;
  hash_func_target: Tgpointer; hash_func_target_destroy_notify: TGDestroyNotify; equal_func: TGeeEqualDataFunc; equal_func_target: Tgpointer; equal_func_target_destroy_notify: TGDestroyNotify): PGeeHashMultiSet; cdecl; external libgee;
function gee_hash_multi_set_new(g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; hash_func: TGeeHashDataFunc; hash_func_target: Tgpointer;
  equal_func: TGeeEqualDataFunc; equal_func_target: Tgpointer): PGeeHashMultiSet; cdecl; external libgee; deprecated;
function gee_hash_multi_set_construct_broken(object_type: TGType; g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; hash_func: TGeeHashDataFunc;
  hash_func_target: Tgpointer; equal_func: TGeeEqualDataFunc; equal_func_target: Tgpointer): PGeeHashMultiSet; cdecl; external libgee; deprecated;
function gee_hash_multi_set_get_hash_func(self: PGeeHashMultiSet; result_target: Pgpointer): TGeeHashDataFunc; cdecl; external libgee;
function gee_hash_multi_set_get_equal_func(self: PGeeHashMultiSet; result_target: Pgpointer): TGeeEqualDataFunc; cdecl; external libgee;
function gee_hash_set_get_type: TGType; cdecl; external libgee;
function gee_hash_set_new(g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; hash_func: TGeeHashDataFunc; hash_func_target: Tgpointer;
  hash_func_target_destroy_notify: TGDestroyNotify; equal_func: TGeeEqualDataFunc; equal_func_target: Tgpointer; equal_func_target_destroy_notify: TGDestroyNotify): PGeeHashSet; cdecl; external libgee;
function gee_hash_set_construct(object_type: TGType; g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; hash_func: TGeeHashDataFunc;
  hash_func_target: Tgpointer; hash_func_target_destroy_notify: TGDestroyNotify; equal_func: TGeeEqualDataFunc; equal_func_target: Tgpointer; equal_func_target_destroy_notify: TGDestroyNotify): PGeeHashSet; cdecl; external libgee;
function gee_hash_set_get_hash_func(self: PGeeHashSet; result_target: Pgpointer): TGeeHashDataFunc; cdecl; external libgee;
function gee_hash_set_get_equal_func(self: PGeeHashSet; result_target: Pgpointer): TGeeEqualDataFunc; cdecl; external libgee;
procedure gee_hazard_pointer_free(self: PGeeHazardPointer); cdecl; external libgee;
procedure gee_hazard_pointer_node_free(self: PGeeHazardPointerNode); cdecl; external libgee;
function gee_hazard_pointer_policy_get_type: TGType; cdecl; external libgee;
function gee_hazard_pointer_policy_is_concrete(self: TGeeHazardPointerPolicy): Tgboolean; cdecl; external libgee;
function gee_hazard_pointer_policy_is_blocking(self: TGeeHazardPointerPolicy): Tgboolean; cdecl; external libgee;
function gee_hazard_pointer_policy_is_safe(self: TGeeHazardPointerPolicy): Tgboolean; cdecl; external libgee;
function gee_hazard_pointer_policy_to_concrete(self: TGeeHazardPointerPolicy): TGeeHazardPointerPolicy; cdecl; external libgee;
function gee_hazard_pointer_release_policy_get_type: TGType; cdecl; external libgee;
function gee_hazard_pointer_new(ptr: Pgconstpointer): PGeeHazardPointer; cdecl; external libgee;
function gee_hazard_pointer_get_hazard_pointer(g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; aptr: PPgconstpointer; mask: Tgsize;
  mask_out: Pgsize): PGeeHazardPointer; cdecl; external libgee;
function gee_hazard_pointer_get_pointer(g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; aptr: PPgconstpointer; mask: Tgsize;
  mask_out: Pgsize): Tgpointer; cdecl; external libgee;
function gee_hazard_pointer_exchange_hazard_pointer(g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; aptr: PPgconstpointer; new_ptr: Tgpointer;
  mask: Tgsize; new_mask: Tgsize; old_mask: Pgsize): PGeeHazardPointer; cdecl; external libgee;
procedure gee_hazard_pointer_set_pointer(g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; aptr: PPgconstpointer; new_ptr: Tgpointer;
  mask: Tgsize; new_mask: Tgsize); cdecl; external libgee;
function gee_hazard_pointer_exchange_pointer(g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; aptr: PPgconstpointer; new_ptr: Tgpointer;
  mask: Tgsize; new_mask: Tgsize; old_mask: Pgsize): Tgpointer; cdecl; external libgee;
function gee_hazard_pointer_compare_and_exchange_pointer(g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; aptr: PPgconstpointer; old_ptr: Tgconstpointer;
  _new_ptr: Tgpointer; mask: Tgsize; old_mask: Tgsize; new_mask: Tgsize): Tgboolean; cdecl; external libgee;
function gee_hazard_pointer_get(self: PGeeHazardPointer; other_thread: Tgboolean): Tgconstpointer; cdecl; external libgee;
procedure gee_hazard_pointer_release(self: PGeeHazardPointer; notify: TGDestroyNotify); cdecl; external libgee;
procedure gee_hazard_pointer_set_default_policy(policy: TGeeHazardPointerPolicy); cdecl; external libgee;
procedure gee_hazard_pointer_set_thread_exit_policy(policy: TGeeHazardPointerPolicy); cdecl; external libgee;
function gee_hazard_pointer_set_release_policy(policy: TGeeHazardPointerReleasePolicy): Tgboolean; cdecl; external libgee;
procedure gee_hazard_pointer_context_free(self: PGeeHazardPointerContext); cdecl; external libgee;
procedure gee_hazard_pointer_free_node_free(self: PGeeHazardPointerFreeNode); cdecl; external libgee;
function gee_hazard_pointer_context_new(policy: PGeeHazardPointerPolicy): PGeeHazardPointerContext; cdecl; external libgee;
procedure gee_hazard_pointer_context_try_free(self: PGeeHazardPointerContext); cdecl; external libgee;
procedure gee_hazard_pointer_context_free_all(self: PGeeHazardPointerContext); cdecl; external libgee;
procedure gee_hazard_pointer_context_try_release(self: PGeeHazardPointerContext); cdecl; external libgee;
procedure gee_hazard_pointer_context_release(self: PGeeHazardPointerContext); cdecl; external libgee;
function gee_iterable_iterator(self: PGeeIterable): PGeeIterator; cdecl; external libgee;
function gee_iterator_next(self: PGeeIterator): Tgboolean; cdecl; external libgee;
function gee_iterator_has_next(self: PGeeIterator): Tgboolean; cdecl; external libgee;
function gee_iterator_get(self: PGeeIterator): Tgpointer; cdecl; external libgee;
procedure gee_iterator_remove(self: PGeeIterator); cdecl; external libgee;
function gee_iterator_unfold(a_type: TGType; a_dup_func: TGBoxedCopyFunc; a_destroy_func: TGDestroyNotify; f: TGeeUnfoldFunc; f_target: Tgpointer;
  f_target_destroy_notify: TGDestroyNotify; current: PGeeLazy): PGeeIterator; cdecl; external libgee;
function gee_iterator_concat(g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; iters: PGeeIterator): PGeeIterator; cdecl; external libgee;
function gee_iterator_get_valid(self: PGeeIterator): Tgboolean; cdecl; external libgee;
function gee_iterator_get_read_only(self: PGeeIterator): Tgboolean; cdecl; external libgee;
function gee_lazy_new(g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; func: TGeeLazyFunc; func_target: Tgpointer;
  func_target_destroy_notify: TGDestroyNotify): PGeeLazy; cdecl; external libgee;
function gee_lazy_construct(object_type: TGType; g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; func: TGeeLazyFunc;
  func_target: Tgpointer; func_target_destroy_notify: TGDestroyNotify): PGeeLazy; cdecl; external libgee;
function gee_lazy_new_from_value(g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; item: Tgconstpointer): PGeeLazy; cdecl; external libgee;
function gee_lazy_construct_from_value(object_type: TGType; g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; item: Tgconstpointer): PGeeLazy; cdecl; external libgee;
procedure gee_lazy_eval(self: PGeeLazy); cdecl; external libgee;
function gee_lazy_get(self: PGeeLazy): Tgpointer; cdecl; external libgee;
function gee_lazy_get_value(self: PGeeLazy): Tgconstpointer; cdecl; external libgee;
function gee_lazy_get_future(self: PGeeLazy): PGeeFuture; cdecl; external libgee;
function gee_linked_list_get_type: TGType; cdecl; external libgee;
function gee_linked_list_new(g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; equal_func: TGeeEqualDataFunc; equal_func_target: Tgpointer;
  equal_func_target_destroy_notify: TGDestroyNotify): PGeeLinkedList; cdecl; external libgee;
function gee_linked_list_construct(object_type: TGType; g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; equal_func: TGeeEqualDataFunc;
  equal_func_target: Tgpointer; equal_func_target_destroy_notify: TGDestroyNotify): PGeeLinkedList; cdecl; external libgee;
function gee_linked_list_first(self: PGeeLinkedList): Tgpointer; cdecl; external libgee;
function gee_linked_list_last(self: PGeeLinkedList): Tgpointer; cdecl; external libgee;
function gee_linked_list_get_equal_func(self: PGeeLinkedList; result_target: Pgpointer): TGeeEqualDataFunc; cdecl; external libgee;
function gee_list_list_iterator(self: PGeeList): PGeeListIterator; cdecl; external libgee;
function gee_list_get(self: PGeeList; index: Tgint): Tgpointer; cdecl; external libgee;
procedure gee_list_set(self: PGeeList; index: Tgint; item: Tgconstpointer); cdecl; external libgee;
function gee_list_index_of(self: PGeeList; item: Tgconstpointer): Tgint; cdecl; external libgee;
procedure gee_list_insert(self: PGeeList; index: Tgint; item: Tgconstpointer); cdecl; external libgee;
function gee_list_remove_at(self: PGeeList; index: Tgint): Tgpointer; cdecl; external libgee;
function gee_list_slice(self: PGeeList; start: Tgint; stop: Tgint): PGeeList; cdecl; external libgee;
function gee_list_first(self: PGeeList): Tgpointer; cdecl; external libgee;
function gee_list_last(self: PGeeList): Tgpointer; cdecl; external libgee;
procedure gee_list_insert_all(self: PGeeList; index: Tgint; collection: PGeeCollection); cdecl; external libgee;
procedure gee_list_sort(self: PGeeList; compare_func: TGCompareDataFunc; compare_func_target: Tgpointer; compare_func_target_destroy_notify: TGDestroyNotify); cdecl; external libgee;
function gee_list_empty(g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify): PGeeList; cdecl; external libgee;
function gee_list_get_read_only_view(self: PGeeList): PGeeList; cdecl; external libgee;
procedure gee_list_iterator_set(self: PGeeListIterator; item: Tgconstpointer); cdecl; external libgee;
procedure gee_list_iterator_add(self: PGeeListIterator; item: Tgconstpointer); cdecl; external libgee;
function gee_list_iterator_index(self: PGeeListIterator): Tgint; cdecl; external libgee;
function gee_map_has_key(self: PGeeMap; key: Tgconstpointer): Tgboolean; cdecl; external libgee;
function gee_map_contains(self: PGeeMap; key: Tgconstpointer): Tgboolean; cdecl; external libgee;
function gee_map_has(self: PGeeMap; key: Tgconstpointer; value: Tgconstpointer): Tgboolean; cdecl; external libgee; deprecated;
function gee_map_get(self: PGeeMap; key: Tgconstpointer): Tgpointer; cdecl; external libgee;
procedure gee_map_set(self: PGeeMap; key: Tgconstpointer; value: Tgconstpointer); cdecl; external libgee;
function gee_map_unset(self: PGeeMap; key: Tgconstpointer; value: Pgpointer): Tgboolean; cdecl; external libgee;
function gee_map_remove(self: PGeeMap; key: Tgconstpointer; value: Pgpointer): Tgboolean; cdecl; external libgee;
procedure gee_map_clear(self: PGeeMap); cdecl; external libgee; deprecated;
function gee_map_map_iterator(self: PGeeMap): PGeeMapIterator; cdecl; external libgee;
procedure gee_map_set_all(self: PGeeMap; map: PGeeMap); cdecl; external libgee;
function gee_map_unset_all(self: PGeeMap; map: PGeeMap): Tgboolean; cdecl; external libgee;
function gee_map_remove_all(self: PGeeMap; map: PGeeMap): Tgboolean; cdecl; external libgee;
function gee_map_has_all(self: PGeeMap; map: PGeeMap): Tgboolean; cdecl; external libgee; deprecated;
function gee_map_contains_all(self: PGeeMap; map: PGeeMap): Tgboolean; cdecl; external libgee;
function gee_map_empty(k_type: TGType; k_dup_func: TGBoxedCopyFunc; k_destroy_func: TGDestroyNotify; v_type: TGType; v_dup_func: TGBoxedCopyFunc;
  v_destroy_func: TGDestroyNotify): PGeeMap; cdecl; external libgee; deprecated;
function gee_map_get_size(self: PGeeMap): Tgint; cdecl; external libgee;
function gee_map_get_is_empty(self: PGeeMap): Tgboolean; cdecl; external libgee;
function gee_map_get_read_only(self: PGeeMap): Tgboolean; cdecl; external libgee;
function gee_map_get_keys(self: PGeeMap): PGeeSet; cdecl; external libgee;
function gee_map_get_values(self: PGeeMap): PGeeCollection; cdecl; external libgee;
function gee_map_get_entries(self: PGeeMap): PGeeSet; cdecl; external libgee;
function gee_map_get_read_only_view(self: PGeeMap): PGeeMap; cdecl; external libgee;
function gee_map_get_key_type(self: PGeeMap): TGType; cdecl; external libgee;
function gee_map_get_value_type(self: PGeeMap): TGType; cdecl; external libgee;
function gee_map_entry_construct(object_type: TGType; k_type: TGType; k_dup_func: TGBoxedCopyFunc; k_destroy_func: TGDestroyNotify; v_type: TGType;
  v_dup_func: TGBoxedCopyFunc; v_destroy_func: TGDestroyNotify): PGeeMapEntry; cdecl; external libgee;
function gee_map_entry_get_key(self: PGeeMapEntry): Tgconstpointer; cdecl; external libgee;
function gee_map_entry_get_value(self: PGeeMapEntry): Tgconstpointer; cdecl; external libgee;
procedure gee_map_entry_set_value(self: PGeeMapEntry; value: Tgconstpointer); cdecl; external libgee;
function gee_map_entry_get_read_only(self: PGeeMapEntry): Tgboolean; cdecl; external libgee;
function gee_map_iterator_next(self: PGeeMapIterator): Tgboolean; cdecl; external libgee;
function gee_map_iterator_has_next(self: PGeeMapIterator): Tgboolean; cdecl; external libgee;
function gee_map_iterator_get_key(self: PGeeMapIterator): Tgpointer; cdecl; external libgee;
function gee_map_iterator_get_value(self: PGeeMapIterator): Tgpointer; cdecl; external libgee;
procedure gee_map_iterator_set_value(self: PGeeMapIterator; value: Tgconstpointer); cdecl; external libgee;
procedure gee_map_iterator_unset(self: PGeeMapIterator); cdecl; external libgee;
function gee_map_iterator_fold(self: PGeeMapIterator; a_type: TGType; a_dup_func: TGBoxedCopyFunc; a_destroy_func: TGDestroyNotify; f: TGeeFoldMapFunc;
  f_target: Tgpointer; seed: Tgpointer): Tgpointer; cdecl; external libgee;
function gee_map_iterator_foreach(self: PGeeMapIterator; f: TGeeForallMapFunc; f_target: Tgpointer): Tgboolean; cdecl; external libgee;
function gee_map_iterator_get_valid(self: PGeeMapIterator): Tgboolean; cdecl; external libgee;
function gee_map_iterator_get_mutable(self: PGeeMapIterator): Tgboolean; cdecl; external libgee;
function gee_map_iterator_get_read_only(self: PGeeMapIterator): Tgboolean; cdecl; external libgee;
function gee_multi_map_get_keys(self: PGeeMultiMap): PGeeSet; cdecl; external libgee;
function gee_multi_map_get_all_keys(self: PGeeMultiMap): PGeeMultiSet; cdecl; external libgee;
function gee_multi_map_get_values(self: PGeeMultiMap): PGeeCollection; cdecl; external libgee;
function gee_multi_map_contains(self: PGeeMultiMap; key: Tgconstpointer): Tgboolean; cdecl; external libgee;
function gee_multi_map_get(self: PGeeMultiMap; key: Tgconstpointer): PGeeCollection; cdecl; external libgee;
procedure gee_multi_map_set(self: PGeeMultiMap; key: Tgconstpointer; value: Tgconstpointer); cdecl; external libgee;
function gee_multi_map_remove(self: PGeeMultiMap; key: Tgconstpointer; value: Tgconstpointer): Tgboolean; cdecl; external libgee;
function gee_multi_map_remove_all(self: PGeeMultiMap; key: Tgconstpointer): Tgboolean; cdecl; external libgee;
procedure gee_multi_map_clear(self: PGeeMultiMap); cdecl; external libgee;
function gee_multi_map_map_iterator(self: PGeeMultiMap): PGeeMapIterator; cdecl; external libgee;
function gee_multi_map_get_size(self: PGeeMultiMap): Tgint; cdecl; external libgee;
function gee_multi_map_get_read_only(self: PGeeMultiMap): Tgboolean; cdecl; external libgee;
function gee_multi_map_get_key_type(self: PGeeMultiMap): TGType; cdecl; external libgee;
function gee_multi_map_get_value_type(self: PGeeMultiMap): TGType; cdecl; external libgee;
function gee_multi_map_get_read_only_view(self: PGeeMultiMap): PGeeMultiMap; cdecl; external libgee;
function gee_multi_set_count(self: PGeeMultiSet; item: Tgconstpointer): Tgint; cdecl; external libgee;
function gee_multi_set_empty(g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify): PGeeSet; cdecl; external libgee;
function gee_multi_set_get_read_only_view(self: PGeeMultiSet): PGeeMultiSet; cdecl; external libgee;
function gee_priority_queue_get_type: TGType; cdecl; external libgee;
function gee_priority_queue_new(g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; compare_func: TGCompareDataFunc; compare_func_target: Tgpointer;
  compare_func_target_destroy_notify: TGDestroyNotify): PGeePriorityQueue; cdecl; external libgee;
function gee_priority_queue_construct(object_type: TGType; g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; compare_func: TGCompareDataFunc;
  compare_func_target: Tgpointer; compare_func_target_destroy_notify: TGDestroyNotify): PGeePriorityQueue; cdecl; external libgee;
function gee_priority_queue_offer(self: PGeePriorityQueue; element: Tgconstpointer): Tgboolean; cdecl; external libgee;
function gee_priority_queue_drain(self: PGeePriorityQueue; recipient: PGeeCollection; amount: Tgint): Tgint; cdecl; external libgee;
function gee_priority_queue_get_compare_func(self: PGeePriorityQueue; result_target: Pgpointer): TGCompareDataFunc; cdecl; external libgee;
function gee_promise_ref(instance: Tgpointer): Tgpointer; cdecl; external libgee;
procedure gee_promise_unref(instance: Tgpointer); cdecl; external libgee;
function gee_param_spec_promise(name: Pgchar; nick: Pgchar; blurb: Pgchar; object_type: TGType; flags: TGParamFlags): PGParamSpec; cdecl; external libgee;
procedure gee_value_set_promise(value: PGValue; v_object: Tgpointer); cdecl; external libgee;
procedure gee_value_take_promise(value: PGValue; v_object: Tgpointer); cdecl; external libgee;
function gee_value_get_promise(value: PGValue): Tgpointer; cdecl; external libgee;
function gee_promise_get_type: TGType; cdecl; external libgee;
function gee_promise_new(g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify): PGeePromise; cdecl; external libgee;
function gee_promise_construct(object_type: TGType; g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify): PGeePromise; cdecl; external libgee;
procedure gee_promise_set_value(self: PGeePromise; value: Tgpointer); cdecl; external libgee;
procedure gee_promise_set_exception(self: PGeePromise; exception: PGError); cdecl; external libgee;
function gee_promise_get_future(self: PGeePromise): PGeeFuture; cdecl; external libgee;
function gee_queue_offer(self: PGeeQueue; element: Tgconstpointer): Tgboolean; cdecl; external libgee;
function gee_queue_peek(self: PGeeQueue): Tgpointer; cdecl; external libgee;
function gee_queue_poll(self: PGeeQueue): Tgpointer; cdecl; external libgee;
function gee_queue_drain(self: PGeeQueue; recipient: PGeeCollection; amount: Tgint): Tgint; cdecl; external libgee;
function gee_queue_get_capacity(self: PGeeQueue): Tgint; cdecl; external libgee;
function gee_queue_get_remaining_capacity(self: PGeeQueue): Tgint; cdecl; external libgee;
function gee_queue_get_is_full(self: PGeeQueue): Tgboolean; cdecl; external libgee;
function gee_set_empty(g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify): PGeeSet; cdecl; external libgee;
function gee_set_get_read_only_view(self: PGeeSet): PGeeSet; cdecl; external libgee;
function gee_sorted_map_head_map(self: PGeeSortedMap; before: Tgconstpointer): PGeeSortedMap; cdecl; external libgee;
function gee_sorted_map_tail_map(self: PGeeSortedMap; after: Tgconstpointer): PGeeSortedMap; cdecl; external libgee;
function gee_sorted_map_sub_map(self: PGeeSortedMap; before: Tgconstpointer; after: Tgconstpointer): PGeeSortedMap; cdecl; external libgee;
function gee_sorted_map_empty(k_type: TGType; k_dup_func: TGBoxedCopyFunc; k_destroy_func: TGDestroyNotify; v_type: TGType; v_dup_func: TGBoxedCopyFunc;
  v_destroy_func: TGDestroyNotify): PGeeMap; cdecl; external libgee;
function gee_sorted_map_get_ascending_keys(self: PGeeSortedMap): PGeeSortedSet; cdecl; external libgee;
function gee_sorted_map_get_ascending_entries(self: PGeeSortedMap): PGeeSortedSet; cdecl; external libgee;
function gee_sorted_map_get_read_only_view(self: PGeeSortedMap): PGeeSortedMap; cdecl; external libgee;
function gee_sorted_set_first(self: PGeeSortedSet): Tgpointer; cdecl; external libgee;
function gee_sorted_set_last(self: PGeeSortedSet): Tgpointer; cdecl; external libgee;
function gee_sorted_set_iterator_at(self: PGeeSortedSet; element: Tgconstpointer): PGeeIterator; cdecl; external libgee;
function gee_sorted_set_lower(self: PGeeSortedSet; element: Tgconstpointer): Tgpointer; cdecl; external libgee;
function gee_sorted_set_higher(self: PGeeSortedSet; element: Tgconstpointer): Tgpointer; cdecl; external libgee;
function gee_sorted_set_floor(self: PGeeSortedSet; element: Tgconstpointer): Tgpointer; cdecl; external libgee;
function gee_sorted_set_ceil(self: PGeeSortedSet; element: Tgconstpointer): Tgpointer; cdecl; external libgee;
function gee_sorted_set_head_set(self: PGeeSortedSet; before: Tgconstpointer): PGeeSortedSet; cdecl; external libgee;
function gee_sorted_set_tail_set(self: PGeeSortedSet; after: Tgconstpointer): PGeeSortedSet; cdecl; external libgee;
function gee_sorted_set_sub_set(self: PGeeSortedSet; from: Tgconstpointer; to_: Tgconstpointer): PGeeSortedSet; cdecl; external libgee;
function gee_sorted_set_empty(g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify): PGeeSortedSet; cdecl; external libgee;
function gee_sorted_set_get_read_only_view(self: PGeeSortedSet): PGeeSortedSet; cdecl; external libgee;
function gee_task(g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; task: TGeeTask; task_target: Tgpointer;
  error: PPGError): PGeeFuture; cdecl; external libgee;
procedure gee_async_task(_callback_: TGAsyncReadyCallback; _user_data_: Tgpointer); cdecl; external libgee;
procedure gee_async_task_finish(_res_: PGAsyncResult; error: PPGError); cdecl; external libgee;
function gee_traversable_foreach(self: PGeeTraversable; f: TGeeForallFunc; f_target: Tgpointer): Tgboolean; cdecl; external libgee;
function gee_traversable_stream(self: PGeeTraversable; a_type: TGType; a_dup_func: TGBoxedCopyFunc; a_destroy_func: TGDestroyNotify; f: TGeeStreamFunc;
  f_target: Tgpointer; f_target_destroy_notify: TGDestroyNotify): PGeeIterator; cdecl; external libgee;
function gee_traversable_fold(self: PGeeTraversable; a_type: TGType; a_dup_func: TGBoxedCopyFunc; a_destroy_func: TGDestroyNotify; f: TGeeFoldFunc;
  f_target: Tgpointer; seed: Tgpointer): Tgpointer; cdecl; external libgee;
function gee_traversable_map(self: PGeeTraversable; a_type: TGType; a_dup_func: TGBoxedCopyFunc; a_destroy_func: TGDestroyNotify; f: TGeeMapFunc;
  f_target: Tgpointer): PGeeIterator; cdecl; external libgee;
function gee_traversable_scan(self: PGeeTraversable; a_type: TGType; a_dup_func: TGBoxedCopyFunc; a_destroy_func: TGDestroyNotify; f: TGeeFoldFunc;
  f_target: Tgpointer; seed: Tgpointer): PGeeIterator; cdecl; external libgee;
function gee_traversable_filter(self: PGeeTraversable; pred: TGeePredicate; pred_target: Tgpointer; pred_target_destroy_notify: TGDestroyNotify): PGeeIterator; cdecl; external libgee;
function gee_traversable_chop(self: PGeeTraversable; offset: Tgint; length: Tgint): PGeeIterator; cdecl; external libgee;
function gee_traversable_flat_map(self: PGeeTraversable; a_type: TGType; a_dup_func: TGBoxedCopyFunc; a_destroy_func: TGDestroyNotify; f: TGeeFlatMapFunc;
  f_target: Tgpointer; f_target_destroy_notify: TGDestroyNotify): PGeeIterator; cdecl; external libgee;
function gee_traversable_tee(self: PGeeTraversable; forks: Tguint; result_length1: Pgint): PPGeeIterator; cdecl; external libgee;
function gee_traversable_first_match(self: PGeeTraversable; pred: TGeePredicate; pred_target: Tgpointer; pred_target_destroy_notify: TGDestroyNotify): Tgpointer; cdecl; external libgee;
function gee_traversable_any_match(self: PGeeTraversable; pred: TGeePredicate; pred_target: Tgpointer; pred_target_destroy_notify: TGDestroyNotify): Tgboolean; cdecl; external libgee;
function gee_traversable_all_match(self: PGeeTraversable; pred: TGeePredicate; pred_target: Tgpointer; pred_target_destroy_notify: TGDestroyNotify): Tgboolean; cdecl; external libgee;
function gee_traversable_max(self: PGeeTraversable; compare: TGCompareDataFunc; compare_target: Tgpointer; compare_target_destroy_notify: TGDestroyNotify): Tgpointer; cdecl; external libgee;
function gee_traversable_min(self: PGeeTraversable; compare: TGCompareDataFunc; compare_target: Tgpointer; compare_target_destroy_notify: TGDestroyNotify): Tgpointer; cdecl; external libgee;
function gee_traversable_order_by(self: PGeeTraversable; compare: TGCompareDataFunc; compare_target: Tgpointer; compare_target_destroy_notify: TGDestroyNotify): PGeeIterator; cdecl; external libgee;
function gee_traversable_get_element_type(self: PGeeTraversable): TGType; cdecl; external libgee;
function gee_tree_map_get_type: TGType; cdecl; external libgee;
function gee_tree_map_new(k_type: TGType; k_dup_func: TGBoxedCopyFunc; k_destroy_func: TGDestroyNotify; v_type: TGType; v_dup_func: TGBoxedCopyFunc;
  v_destroy_func: TGDestroyNotify; key_compare_func: TGCompareDataFunc; key_compare_func_target: Tgpointer; key_compare_func_target_destroy_notify: TGDestroyNotify; value_equal_func: TGeeEqualDataFunc;
  value_equal_func_target: Tgpointer; value_equal_func_target_destroy_notify: TGDestroyNotify): PGeeTreeMap; cdecl; external libgee;
function gee_tree_map_construct(object_type: TGType; k_type: TGType; k_dup_func: TGBoxedCopyFunc; k_destroy_func: TGDestroyNotify; v_type: TGType;
  v_dup_func: TGBoxedCopyFunc; v_destroy_func: TGDestroyNotify; key_compare_func: TGCompareDataFunc; key_compare_func_target: Tgpointer; key_compare_func_target_destroy_notify: TGDestroyNotify;
  value_equal_func: TGeeEqualDataFunc; value_equal_func_target: Tgpointer; value_equal_func_target_destroy_notify: TGDestroyNotify): PGeeTreeMap; cdecl; external libgee;
function gee_tree_map_get_key_compare_func(self: PGeeTreeMap; result_target: Pgpointer): TGCompareDataFunc; cdecl; external libgee;
function gee_tree_map_get_value_equal_func(self: PGeeTreeMap; result_target: Pgpointer): TGeeEqualDataFunc; cdecl; external libgee;
function gee_tree_multi_map_get_type: TGType; cdecl; external libgee;
function gee_tree_multi_map_new(k_type: TGType; k_dup_func: TGBoxedCopyFunc; k_destroy_func: TGDestroyNotify; v_type: TGType; v_dup_func: TGBoxedCopyFunc;
  v_destroy_func: TGDestroyNotify; key_compare_func: TGCompareDataFunc; key_compare_func_target: Tgpointer; key_compare_func_target_destroy_notify: TGDestroyNotify; value_compare_func: TGCompareDataFunc;
  value_compare_func_target: Tgpointer; value_compare_func_target_destroy_notify: TGDestroyNotify): PGeeTreeMultiMap; cdecl; external libgee;
function gee_tree_multi_map_construct(object_type: TGType; k_type: TGType; k_dup_func: TGBoxedCopyFunc; k_destroy_func: TGDestroyNotify; v_type: TGType;
  v_dup_func: TGBoxedCopyFunc; v_destroy_func: TGDestroyNotify; key_compare_func: TGCompareDataFunc; key_compare_func_target: Tgpointer; key_compare_func_target_destroy_notify: TGDestroyNotify;
  value_compare_func: TGCompareDataFunc; value_compare_func_target: Tgpointer; value_compare_func_target_destroy_notify: TGDestroyNotify): PGeeTreeMultiMap; cdecl; external libgee;
function gee_tree_multi_map_get_key_compare_func(self: PGeeTreeMultiMap; result_target: Pgpointer): TGCompareDataFunc; cdecl; external libgee;
function gee_tree_multi_map_get_value_compare_func(self: PGeeTreeMultiMap; result_target: Pgpointer): TGCompareDataFunc; cdecl; external libgee;
function gee_tree_multi_set_get_type: TGType; cdecl; external libgee;
function gee_tree_multi_set_new(g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; compare_func: TGCompareDataFunc; compare_func_target: Tgpointer;
  compare_func_target_destroy_notify: TGDestroyNotify): PGeeTreeMultiSet; cdecl; external libgee;
function gee_tree_multi_set_construct(object_type: TGType; g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; compare_func: TGCompareDataFunc;
  compare_func_target: Tgpointer; compare_func_target_destroy_notify: TGDestroyNotify): PGeeTreeMultiSet; cdecl; external libgee;
function gee_tree_multi_set_get_compare_func(self: PGeeTreeMultiSet; result_target: Pgpointer): TGCompareDataFunc; cdecl; external libgee;
function gee_tree_set_get_type: TGType; cdecl; external libgee;
function gee_tree_set_new(g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; compare_func: TGCompareDataFunc; compare_func_target: Tgpointer;
  compare_func_target_destroy_notify: TGDestroyNotify): PGeeTreeSet; cdecl; external libgee;
function gee_tree_set_construct(object_type: TGType; g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; compare_func: TGCompareDataFunc;
  compare_func_target: Tgpointer; compare_func_target_destroy_notify: TGDestroyNotify): PGeeTreeSet; cdecl; external libgee;
function gee_tree_set_get_compare_func(self: PGeeTreeSet; result_target: Pgpointer): TGCompareDataFunc; cdecl; external libgee;
function gee_unrolled_linked_list_get_type: TGType; cdecl; external libgee;
function gee_unrolled_linked_list_new(g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; equal_func: TGeeEqualDataFunc; equal_func_target: Tgpointer;
  equal_func_target_destroy_notify: TGDestroyNotify): PGeeUnrolledLinkedList; cdecl; external libgee;
function gee_unrolled_linked_list_construct(object_type: TGType; g_type: TGType; g_dup_func: TGBoxedCopyFunc; g_destroy_func: TGDestroyNotify; equal_func: TGeeEqualDataFunc;
  equal_func_target: Tgpointer; equal_func_target_destroy_notify: TGDestroyNotify): PGeeUnrolledLinkedList; cdecl; external libgee;
function gee_unrolled_linked_list_get_equal_func(self: PGeeUnrolledLinkedList; result_target: Pgpointer): TGeeEqualDataFunc; cdecl; external libgee;

// === Konventiert am: 10-11-26 16:09:35 ===

function GEE_FUTURE_ERROR: TGQuark;

// ====

function GEE_TYPE_TRAVERSABLE: TGType;
function GEE_TRAVERSABLE(obj: Pointer): PGeeTraversable;
function GEE_IS_TRAVERSABLE(obj: Pointer): Tgboolean;
function GEE_TRAVERSABLE_GET_IFACE(inst: Pointer): PGeeTraversableIface;

function GEE_TYPE_TRAVERSABLE_STREAM: TGType;

// ====

function GEE_TYPE_LAZY: TGType;
function GEE_LAZY(obj: Pointer): PGeeLazy;
function GEE_LAZY_CLASS(klass: Pointer): PGeeLazyClass;
function GEE_IS_LAZY(obj: Pointer): Tgboolean;
function GEE_IS_LAZY_CLASS(klass: Pointer): Tgboolean;
function GEE_LAZY_GET_CLASS(obj: Pointer): PGeeLazyClass;

// ====

function GEE_TYPE_ITERATOR: TGType;
function GEE_ITERATOR(obj: Pointer): PGeeIterator;
function GEE_IS_ITERATOR(obj: Pointer): Tgboolean;
function GEE_ITERATOR_GET_IFACE(inst: Pointer): PGeeIteratorIface;

// ====

function GEE_TYPE_ITERABLE: TGType;
function GEE_ITERABLE(obj: Pointer): PGeeIterable;
function GEE_IS_ITERABLE(obj: Pointer): Tgboolean;
function GEE_ITERABLE_GET_IFACE(inst: Pointer): PGeeIterableIface;

// ====

function GEE_TYPE_COLLECTION: TGType;
function GEE_COLLECTION(obj: Pointer): PGeeCollection;
function GEE_IS_COLLECTION(obj: Pointer): Tgboolean;
function GEE_COLLECTION_GET_IFACE(inst: Pointer): PGeeCollectionIface;

// ====

function GEE_TYPE_ABSTRACT_COLLECTION: TGType;
function GEE_ABSTRACT_COLLECTION(obj: Pointer): PGeeAbstractCollection;
function GEE_ABSTRACT_COLLECTION_CLASS(klass: Pointer): PGeeAbstractCollectionClass;
function GEE_IS_ABSTRACT_COLLECTION(obj: Pointer): Tgboolean;
function GEE_IS_ABSTRACT_COLLECTION_CLASS(klass: Pointer): Tgboolean;
function GEE_ABSTRACT_COLLECTION_GET_CLASS(obj: Pointer): PGeeAbstractCollectionClass;

// ====

function GEE_TYPE_LIST: TGType;
function GEE_LIST(obj: Pointer): PGeeList;
function GEE_IS_LIST(obj: Pointer): Tgboolean;
function GEE_LIST_GET_IFACE(inst: Pointer): PGeeListIface;

// ====

function GEE_TYPE_LIST_ITERATOR: TGType;
function GEE_LIST_ITERATOR(obj: Pointer): PGeeListIterator;
function GEE_IS_LIST_ITERATOR(obj: Pointer): Tgboolean;
function GEE_LIST_ITERATOR_GET_IFACE(inst: Pointer): PGeeListIteratorIface;

// ====

function GEE_TYPE_ABSTRACT_LIST: TGType;
function GEE_ABSTRACT_LIST(obj: Pointer): PGeeAbstractList;
function GEE_ABSTRACT_LIST_CLASS(klass: Pointer): PGeeAbstractListClass;
function GEE_IS_ABSTRACT_LIST(obj: Pointer): Tgboolean;
function GEE_IS_ABSTRACT_LIST_CLASS(klass: Pointer): Tgboolean;
function GEE_ABSTRACT_LIST_GET_CLASS(obj: Pointer): PGeeAbstractListClass;

// ====

function GEE_TYPE_BIDIR_LIST: TGType;
function GEE_BIDIR_LIST(obj: Pointer): PGeeBidirList;
function GEE_IS_BIDIR_LIST(obj: Pointer): Tgboolean;
function GEE_BIDIR_LIST_GET_IFACE(inst: Pointer): PGeeBidirListIface;

// ====

function GEE_TYPE_BIDIR_LIST_ITERATOR: TGType;
function GEE_BIDIR_LIST_ITERATOR(obj: Pointer): PGeeBidirListIterator;
function GEE_IS_BIDIR_LIST_ITERATOR(obj: Pointer): Tgboolean;
function GEE_BIDIR_LIST_ITERATOR_GET_IFACE(inst: Pointer): PGeeBidirListIteratorIface;

// ====

function GEE_TYPE_BIDIR_ITERATOR: TGType;
function GEE_BIDIR_ITERATOR(obj: Pointer): PGeeBidirIterator;
function GEE_IS_BIDIR_ITERATOR(obj: Pointer): Tgboolean;
function GEE_BIDIR_ITERATOR_GET_IFACE(inst: Pointer): PGeeBidirIteratorIface;

// ====

function GEE_TYPE_ABSTRACT_BIDIR_LIST: TGType;
function GEE_ABSTRACT_BIDIR_LIST(obj: Pointer): PGeeAbstractBidirList;
function GEE_ABSTRACT_BIDIR_LIST_CLASS(klass: Pointer): PGeeAbstractBidirListClass;
function GEE_IS_ABSTRACT_BIDIR_LIST(obj: Pointer): Tgboolean;
function GEE_IS_ABSTRACT_BIDIR_LIST_CLASS(klass: Pointer): Tgboolean;
function GEE_ABSTRACT_BIDIR_LIST_GET_CLASS(obj: Pointer): PGeeAbstractBidirListClass;

// ====

function GEE_TYPE_SET: TGType;
function GEE_SET(obj: Pointer): PGeeSet;
function GEE_IS_SET(obj: Pointer): Tgboolean;
function GEE_SET_GET_IFACE(inst: Pointer): PGeeSetIface;

// ====

function GEE_TYPE_ABSTRACT_SET: TGType;
function GEE_ABSTRACT_SET(obj: Pointer): PGeeAbstractSet;
function GEE_ABSTRACT_SET_CLASS(klass: Pointer): PGeeAbstractSetClass;
function GEE_IS_ABSTRACT_SET(obj: Pointer): Tgboolean;
function GEE_IS_ABSTRACT_SET_CLASS(klass: Pointer): Tgboolean;
function GEE_ABSTRACT_SET_GET_CLASS(obj: Pointer): PGeeAbstractSetClass;

// ====

function GEE_TYPE_SORTED_SET: TGType;
function GEE_SORTED_SET(obj: Pointer): PGeeSortedSet;
function GEE_IS_SORTED_SET(obj: Pointer): Tgboolean;
function GEE_SORTED_SET_GET_IFACE(inst: Pointer): PGeeSortedSetIface;

// ====

function GEE_TYPE_ABSTRACT_SORTED_SET: TGType;
function GEE_ABSTRACT_SORTED_SET(obj: Pointer): PGeeAbstractSortedSet;
function GEE_ABSTRACT_SORTED_SET_CLASS(klass: Pointer): PGeeAbstractSortedSetClass;
function GEE_IS_ABSTRACT_SORTED_SET(obj: Pointer): Tgboolean;
function GEE_IS_ABSTRACT_SORTED_SET_CLASS(klass: Pointer): Tgboolean;
function GEE_ABSTRACT_SORTED_SET_GET_CLASS(obj: Pointer): PGeeAbstractSortedSetClass;

// ====

function GEE_TYPE_BIDIR_SORTED_SET: TGType;
function GEE_BIDIR_SORTED_SET(obj: Pointer): PGeeBidirSortedSet;
function GEE_IS_BIDIR_SORTED_SET(obj: Pointer): Tgboolean;
function GEE_BIDIR_SORTED_SET_GET_IFACE(inst: Pointer): PGeeBidirSortedSetIface;

// ====

function GEE_TYPE_ABSTRACT_BIDIR_SORTED_SET: TGType;
function GEE_ABSTRACT_BIDIR_SORTED_SET(obj: Pointer): PGeeAbstractBidirSortedSet;
function GEE_ABSTRACT_BIDIR_SORTED_SET_CLASS(klass: Pointer): PGeeAbstractBidirSortedSetClass;
function GEE_IS_ABSTRACT_BIDIR_SORTED_SET(obj: Pointer): Tgboolean;
function GEE_IS_ABSTRACT_BIDIR_SORTED_SET_CLASS(klass: Pointer): Tgboolean;
function GEE_ABSTRACT_BIDIR_SORTED_SET_GET_CLASS(obj: Pointer): PGeeAbstractBidirSortedSetClass;

// ====

function GEE_TYPE_MAP: TGType;
function GEE_MAP(obj: Pointer): PGeeMap;
function GEE_IS_MAP(obj: Pointer): Tgboolean;
function GEE_MAP_GET_IFACE(inst: Pointer): PGeeMapIface;

// ====

function GEE_TYPE_MAP_ITERATOR: TGType;
function GEE_MAP_ITERATOR(obj: Pointer): PGeeMapIterator;
function GEE_IS_MAP_ITERATOR(obj: Pointer): Tgboolean;
function GEE_MAP_ITERATOR_GET_IFACE(inst: Pointer): PGeeMapIteratorIface;

// ====

function GEE_TYPE_MAP_ENTRY: TGType;
function GEE_MAP_ENTRY(obj: Pointer): PGeeMapEntry;
function GEE_MAP_ENTRY_CLASS(klass: Pointer): PGeeMapEntryClass;
function GEE_IS_MAP_ENTRY(obj: Pointer): Tgboolean;
function GEE_IS_MAP_ENTRY_CLASS(klass: Pointer): Tgboolean;
function GEE_MAP_ENTRY_GET_CLASS(obj: Pointer): PGeeMapEntryClass;

// ====

function GEE_TYPE_ABSTRACT_MAP: TGType;
function GEE_ABSTRACT_MAP(obj: Pointer): PGeeAbstractMap;
function GEE_ABSTRACT_MAP_CLASS(klass: Pointer): PGeeAbstractMapClass;
function GEE_IS_ABSTRACT_MAP(obj: Pointer): Tgboolean;
function GEE_IS_ABSTRACT_MAP_CLASS(klass: Pointer): Tgboolean;
function GEE_ABSTRACT_MAP_GET_CLASS(obj: Pointer): PGeeAbstractMapClass;

// ====

function GEE_TYPE_SORTED_MAP: TGType;
function GEE_SORTED_MAP(obj: Pointer): PGeeSortedMap;
function GEE_IS_SORTED_MAP(obj: Pointer): Tgboolean;
function GEE_SORTED_MAP_GET_IFACE(inst: Pointer): PGeeSortedMapIface;

// ====

function GEE_TYPE_ABSTRACT_SORTED_MAP: TGType;
function GEE_ABSTRACT_SORTED_MAP(obj: Pointer): PGeeAbstractSortedMap;
function GEE_ABSTRACT_SORTED_MAP_CLASS(klass: Pointer): PGeeAbstractSortedMapClass;
function GEE_IS_ABSTRACT_SORTED_MAP(obj: Pointer): Tgboolean;
function GEE_IS_ABSTRACT_SORTED_MAP_CLASS(klass: Pointer): Tgboolean;
function GEE_ABSTRACT_SORTED_MAP_GET_CLASS(obj: Pointer): PGeeAbstractSortedMapClass;

// ====

function GEE_TYPE_BIDIR_SORTED_MAP: TGType;
function GEE_BIDIR_SORTED_MAP(obj: Pointer): PGeeBidirSortedMap;
function GEE_IS_BIDIR_SORTED_MAP(obj: Pointer): Tgboolean;
function GEE_BIDIR_SORTED_MAP_GET_IFACE(inst: Pointer): PGeeBidirSortedMapIface;

// ====

function GEE_TYPE_BIDIR_MAP_ITERATOR: TGType;
function GEE_BIDIR_MAP_ITERATOR(obj: Pointer): PGeeBidirMapIterator;
function GEE_IS_BIDIR_MAP_ITERATOR(obj: Pointer): Tgboolean;
function GEE_BIDIR_MAP_ITERATOR_GET_IFACE(inst: Pointer): PGeeBidirMapIteratorIface;

// ====

function GEE_TYPE_ABSTRACT_BIDIR_SORTED_MAP: TGType;
function GEE_ABSTRACT_BIDIR_SORTED_MAP(obj: Pointer): PGeeAbstractBidirSortedMap;
function GEE_ABSTRACT_BIDIR_SORTED_MAP_CLASS(klass: Pointer): PGeeAbstractBidirSortedMapClass;
function GEE_IS_ABSTRACT_BIDIR_SORTED_MAP(obj: Pointer): Tgboolean;
function GEE_IS_ABSTRACT_BIDIR_SORTED_MAP_CLASS(klass: Pointer): Tgboolean;
function GEE_ABSTRACT_BIDIR_SORTED_MAP_GET_CLASS(obj: Pointer): PGeeAbstractBidirSortedMapClass;

// ====

function GEE_TYPE_MULTI_MAP: TGType;
function GEE_MULTI_MAP(obj: Pointer): PGeeMultiMap;
function GEE_IS_MULTI_MAP(obj: Pointer): Tgboolean;
function GEE_MULTI_MAP_GET_IFACE(inst: Pointer): PGeeMultiMapIface;

// ====

function GEE_TYPE_MULTI_SET: TGType;
function GEE_MULTI_SET(obj: Pointer): PGeeMultiSet;
function GEE_IS_MULTI_SET(obj: Pointer): Tgboolean;
function GEE_MULTI_SET_GET_IFACE(inst: Pointer): PGeeMultiSetIface;

// ====

function GEE_TYPE_ABSTRACT_MULTI_MAP: TGType;
function GEE_ABSTRACT_MULTI_MAP(obj: Pointer): PGeeAbstractMultiMap;
function GEE_ABSTRACT_MULTI_MAP_CLASS(klass: Pointer): PGeeAbstractMultiMapClass;
function GEE_IS_ABSTRACT_MULTI_MAP(obj: Pointer): Tgboolean;
function GEE_IS_ABSTRACT_MULTI_MAP_CLASS(klass: Pointer): Tgboolean;
function GEE_ABSTRACT_MULTI_MAP_GET_CLASS(obj: Pointer): PGeeAbstractMultiMapClass;

// ====

function GEE_TYPE_ABSTRACT_MULTI_SET: TGType;
function GEE_ABSTRACT_MULTI_SET(obj: Pointer): PGeeAbstractMultiSet;
function GEE_ABSTRACT_MULTI_SET_CLASS(klass: Pointer): PGeeAbstractMultiSetClass;
function GEE_IS_ABSTRACT_MULTI_SET(obj: Pointer): Tgboolean;
function GEE_IS_ABSTRACT_MULTI_SET_CLASS(klass: Pointer): Tgboolean;
function GEE_ABSTRACT_MULTI_SET_GET_CLASS(obj: Pointer): PGeeAbstractMultiSetClass;

// ====

function GEE_TYPE_QUEUE: TGType;
function GEE_QUEUE(obj: Pointer): PGeeQueue;
function GEE_IS_QUEUE(obj: Pointer): Tgboolean;
function GEE_QUEUE_GET_IFACE(inst: Pointer): PGeeQueueIface;

// ====

function GEE_TYPE_ABSTRACT_QUEUE: TGType;
function GEE_ABSTRACT_QUEUE(obj: Pointer): PGeeAbstractQueue;
function GEE_ABSTRACT_QUEUE_CLASS(klass: Pointer): PGeeAbstractQueueClass;
function GEE_IS_ABSTRACT_QUEUE(obj: Pointer): Tgboolean;
function GEE_IS_ABSTRACT_QUEUE_CLASS(klass: Pointer): Tgboolean;
function GEE_ABSTRACT_QUEUE_GET_CLASS(obj: Pointer): PGeeAbstractQueueClass;

// ====

function GEE_TYPE_ARRAY_LIST: TGType;
function GEE_ARRAY_LIST(obj: Pointer): PGeeArrayList;
function GEE_ARRAY_LIST_CLASS(klass: Pointer): PGeeArrayListClass;
function GEE_IS_ARRAY_LIST(obj: Pointer): Tgboolean;
function GEE_IS_ARRAY_LIST_CLASS(klass: Pointer): Tgboolean;
function GEE_ARRAY_LIST_GET_CLASS(obj: Pointer): PGeeArrayListClass;

// ====

function GEE_TYPE_DEQUE: TGType;
function GEE_DEQUE(obj: Pointer): PGeeDeque;
function GEE_IS_DEQUE(obj: Pointer): Tgboolean;
function GEE_DEQUE_GET_IFACE(inst: Pointer): PGeeDequeIface;

// ====

function GEE_TYPE_ARRAY_QUEUE: TGType;
function GEE_ARRAY_QUEUE(obj: Pointer): PGeeArrayQueue;
function GEE_ARRAY_QUEUE_CLASS(klass: Pointer): PGeeArrayQueueClass;
function GEE_IS_ARRAY_QUEUE(obj: Pointer): Tgboolean;
function GEE_IS_ARRAY_QUEUE_CLASS(klass: Pointer): Tgboolean;
function GEE_ARRAY_QUEUE_GET_CLASS(obj: Pointer): PGeeArrayQueueClass;

// ====

function GEE_TYPE_COMPARABLE: TGType;
function GEE_COMPARABLE(obj: Pointer): PGeeComparable;
function GEE_IS_COMPARABLE(obj: Pointer): Tgboolean;
function GEE_COMPARABLE_GET_IFACE(inst: Pointer): PGeeComparableIface;

// ====

function GEE_TYPE_CONCURRENT_LIST: TGType;
function GEE_CONCURRENT_LIST(obj: Pointer): PGeeConcurrentList;
function GEE_CONCURRENT_LIST_CLASS(klass: Pointer): PGeeConcurrentListClass;
function GEE_IS_CONCURRENT_LIST(obj: Pointer): Tgboolean;
function GEE_IS_CONCURRENT_LIST_CLASS(klass: Pointer): Tgboolean;
function GEE_CONCURRENT_LIST_GET_CLASS(obj: Pointer): PGeeConcurrentListClass;

// ====

function GEE_TYPE_CONCURRENT_SET: TGType;
function GEE_CONCURRENT_SET(obj: Pointer): PGeeConcurrentSet;
function GEE_CONCURRENT_SET_CLASS(klass: Pointer): PGeeConcurrentSetClass;
function GEE_IS_CONCURRENT_SET(obj: Pointer): Tgboolean;
function GEE_IS_CONCURRENT_SET_CLASS(klass: Pointer): Tgboolean;
function GEE_CONCURRENT_SET_GET_CLASS(obj: Pointer): PGeeConcurrentSetClass;
function GEE_TYPE_CONCURRENT_SET_RANGE_TYPE: TGType;

// ====

function GEE_TYPE_FUTURE: TGType;
function GEE_FUTURE(obj: Pointer): PGeeFuture;
function GEE_IS_FUTURE(obj: Pointer): Tgboolean;
function GEE_FUTURE_GET_IFACE(inst: Pointer): PGeeFutureIface;

// ====

function GEE_TYPE_FUTURE_ERROR: TGType;

// ====

function GEE_TYPE_HASHABLE: TGType;
function GEE_HASHABLE(obj: Pointer): PGeeHashable;
function GEE_IS_HASHABLE(obj: Pointer): Tgboolean;
function GEE_HASHABLE_GET_IFACE(inst: Pointer): PGeeHashableIface;

// ====

function GEE_TYPE_HASH_MAP: TGType;
function GEE_HASH_MAP(obj: Pointer): PGeeHashMap;
function GEE_HASH_MAP_CLASS(klass: Pointer): PGeeHashMapClass;
function GEE_IS_HASH_MAP(obj: Pointer): Tgboolean;
function GEE_IS_HASH_MAP_CLASS(klass: Pointer): Tgboolean;
function GEE_HASH_MAP_GET_CLASS(obj: Pointer): PGeeHashMapClass;

// ====

function GEE_TYPE_HASH_MULTI_MAP: TGType;
function GEE_HASH_MULTI_MAP(obj: Pointer): PGeeHashMultiMap;
function GEE_HASH_MULTI_MAP_CLASS(klass: Pointer): PGeeHashMultiMapClass;
function GEE_IS_HASH_MULTI_MAP(obj: Pointer): Tgboolean;
function GEE_IS_HASH_MULTI_MAP_CLASS(klass: Pointer): Tgboolean;
function GEE_HASH_MULTI_MAP_GET_CLASS(obj: Pointer): PGeeHashMultiMapClass;

// ====

function GEE_TYPE_HASH_MULTI_SET: TGType;
function GEE_HASH_MULTI_SET(obj: Pointer): PGeeHashMultiSet;
function GEE_HASH_MULTI_SET_CLASS(klass: Pointer): PGeeHashMultiSetClass;
function GEE_IS_HASH_MULTI_SET(obj: Pointer): Tgboolean;
function GEE_IS_HASH_MULTI_SET_CLASS(klass: Pointer): Tgboolean;
function GEE_HASH_MULTI_SET_GET_CLASS(obj: Pointer): PGeeHashMultiSetClass;

// ====

function GEE_TYPE_HASH_SET: TGType;
function GEE_HASH_SET(obj: Pointer): PGeeHashSet;
function GEE_HASH_SET_CLASS(klass: Pointer): PGeeHashSetClass;
function GEE_IS_HASH_SET(obj: Pointer): Tgboolean;
function GEE_IS_HASH_SET_CLASS(klass: Pointer): Tgboolean;
function GEE_HASH_SET_GET_CLASS(obj: Pointer): PGeeHashSetClass;

// ====

function GEE_TYPE_HAZARD_POINTER_POLICY: TGType;

// =====

function GEE_TYPE_HAZARD_POINTER_RELEASE_POLICY: TGType;

// ====

function GEE_TYPE_LINKED_LIST: TGType;
function GEE_LINKED_LIST(obj: Pointer): PGeeLinkedList;
function GEE_LINKED_LIST_CLASS(klass: Pointer): PGeeLinkedListClass;
function GEE_IS_LINKED_LIST(obj: Pointer): Tgboolean;
function GEE_IS_LINKED_LIST_CLASS(klass: Pointer): Tgboolean;
function GEE_LINKED_LIST_GET_CLASS(obj: Pointer): PGeeLinkedListClass;

// ====

function GEE_TYPE_PRIORITY_QUEUE: TGType;
function GEE_PRIORITY_QUEUE(obj: Pointer): PGeePriorityQueue;
function GEE_PRIORITY_QUEUE_CLASS(klass: Pointer): PGeePriorityQueueClass;
function GEE_IS_PRIORITY_QUEUE(obj: Pointer): Tgboolean;
function GEE_IS_PRIORITY_QUEUE_CLASS(klass: Pointer): Tgboolean;
function GEE_PRIORITY_QUEUE_GET_CLASS(obj: Pointer): PGeePriorityQueueClass;

// ====

function GEE_TYPE_PROMISE: TGType;
function GEE_PROMISE(obj: Pointer): PGeePromise;
function GEE_PROMISE_CLASS(klass: Pointer): PGeePromiseClass;
function GEE_IS_PROMISE(obj: Pointer): Tgboolean;
function GEE_IS_PROMISE_CLASS(klass: Pointer): Tgboolean;
function GEE_PROMISE_GET_CLASS(obj: Pointer): PGeePromiseClass;

// ====

function GEE_TYPE_TREE_MAP: TGType;
function GEE_TREE_MAP(obj: Pointer): PGeeTreeMap;
function GEE_TREE_MAP_CLASS(klass: Pointer): PGeeTreeMapClass;
function GEE_IS_TREE_MAP(obj: Pointer): Tgboolean;
function GEE_IS_TREE_MAP_CLASS(klass: Pointer): Tgboolean;
function GEE_TREE_MAP_GET_CLASS(obj: Pointer): PGeeTreeMapClass;

// ====

function GEE_TYPE_TREE_MULTI_MAP: TGType;
function GEE_TREE_MULTI_MAP(obj: Pointer): PGeeTreeMultiMap;
function GEE_TREE_MULTI_MAP_CLASS(klass: Pointer): PGeeTreeMultiMapClass;
function GEE_IS_TREE_MULTI_MAP(obj: Pointer): Tgboolean;
function GEE_IS_TREE_MULTI_MAP_CLASS(klass: Pointer): Tgboolean;
function GEE_TREE_MULTI_MAP_GET_CLASS(obj: Pointer): PGeeTreeMultiMapClass;

// ====

function GEE_TYPE_TREE_MULTI_SET: TGType;
function GEE_TREE_MULTI_SET(obj: Pointer): PGeeTreeMultiSet;
function GEE_TREE_MULTI_SET_CLASS(klass: Pointer): PGeeTreeMultiSetClass;
function GEE_IS_TREE_MULTI_SET(obj: Pointer): Tgboolean;
function GEE_IS_TREE_MULTI_SET_CLASS(klass: Pointer): Tgboolean;
function GEE_TREE_MULTI_SET_GET_CLASS(obj: Pointer): PGeeTreeMultiSetClass;

// ====

function GEE_TYPE_TREE_SET: TGType;
function GEE_TREE_SET(obj: Pointer): PGeeTreeSet;
function GEE_TREE_SET_CLASS(klass: Pointer): PGeeTreeSetClass;
function GEE_IS_TREE_SET(obj: Pointer): Tgboolean;
function GEE_IS_TREE_SET_CLASS(klass: Pointer): Tgboolean;
function GEE_TREE_SET_GET_CLASS(obj: Pointer): PGeeTreeSetClass;

// ====

function GEE_TYPE_UNROLLED_LINKED_LIST: TGType;
function GEE_UNROLLED_LINKED_LIST(obj: Pointer): PGeeUnrolledLinkedList;
function GEE_UNROLLED_LINKED_LIST_CLASS(klass: Pointer): PGeeUnrolledLinkedListClass;
function GEE_IS_UNROLLED_LINKED_LIST(obj: Pointer): Tgboolean;
function GEE_IS_UNROLLED_LINKED_LIST_CLASS(klass: Pointer): Tgboolean;
function GEE_UNROLLED_LINKED_LIST_GET_CLASS(obj: Pointer): PGeeUnrolledLinkedListClass;

implementation

function GEE_FUTURE_ERROR: TGQuark;
begin
  GEE_FUTURE_ERROR := gee_future_error_quark;
end;

// ====

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

function GEE_TRAVERSABLE_GET_IFACE(inst: Pointer): PGeeTraversableIface;
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

function GEE_ITERATOR_GET_IFACE(inst: Pointer): PGeeIteratorIface;
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

function GEE_ITERABLE_GET_IFACE(inst: Pointer): PGeeIterableIface;
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

function GEE_COLLECTION_GET_IFACE(inst: Pointer): PGeeCollectionIface;
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

function GEE_LIST_GET_IFACE(inst: Pointer): PGeeListIface;
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

function GEE_LIST_ITERATOR_GET_IFACE(inst: Pointer): PGeeListIteratorIface;
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

function GEE_BIDIR_LIST_GET_IFACE(inst: Pointer): PGeeBidirListIface;
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

function GEE_BIDIR_LIST_ITERATOR_GET_IFACE(inst: Pointer
  ): PGeeBidirListIteratorIface;
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

function GEE_BIDIR_ITERATOR_GET_IFACE(inst: Pointer): PGeeBidirIteratorIface;
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

function GEE_SET_GET_IFACE(inst: Pointer): PGeeSetIface;
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

function GEE_SORTED_SET(obj: Pointer): PGeeSortedSet;
begin
  Result := PGeeSortedSet(g_type_check_instance_cast(obj, GEE_TYPE_SORTED_SET));
end;

function GEE_IS_SORTED_SET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEE_TYPE_SORTED_SET);
end;

function GEE_SORTED_SET_GET_IFACE(inst: Pointer): PGeeSortedSetIface;
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

function GEE_BIDIR_SORTED_SET_GET_IFACE(inst: Pointer): PGeeBidirSortedSetIface;
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

function GEE_MAP_GET_IFACE(inst: Pointer): PGeeMapIface;
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

function GEE_MAP_ITERATOR_GET_IFACE(inst: Pointer): PGeeMapIteratorIface;
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

function GEE_SORTED_MAP_GET_IFACE(inst: Pointer): PGeeSortedMapIface;
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

function GEE_BIDIR_SORTED_MAP_GET_IFACE(inst: Pointer): PGeeBidirSortedMapIface;
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

function GEE_BIDIR_MAP_ITERATOR_GET_IFACE(inst: Pointer
  ): PGeeBidirMapIteratorIface;
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

function GEE_MULTI_MAP_GET_IFACE(inst: Pointer): PGeeMultiMapIface;
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

function GEE_MULTI_SET_GET_IFACE(inst: Pointer): PGeeMultiSetIface;
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

function GEE_QUEUE_GET_IFACE(inst: Pointer): PGeeQueueIface;
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

function GEE_DEQUE_GET_IFACE(inst: Pointer): PGeeDequeIface;
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

function GEE_COMPARABLE_GET_IFACE(inst: Pointer): PGeeComparableIface;
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

function GEE_FUTURE_GET_IFACE(inst: Pointer): PGeeFutureIface;
begin
  Result := g_type_interface_peek(inst, GEE_TYPE_FUTURE);
end;

// ====

function GEE_TYPE_FUTURE_ERROR: TGType;
begin
  Result := gee_future_error_get_type;
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

function GEE_HASHABLE_GET_IFACE(inst: Pointer): PGeeHashableIface;
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

end.
