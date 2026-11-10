unit fp_gee;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


const
  GEE_QUEUE_UNBOUNDED_CAPACITY = -(1);  

type
  TGeeForallFunc = function (g:Tgpointer; user_data:Tgpointer):Tgboolean;cdecl;

  PGeeTraversableStream = ^TGeeTraversableStream;
  TGeeTraversableStream =  Longint;
  Const
    GEE_TRAVERSABLE_STREAM_YIELD = 0;
    GEE_TRAVERSABLE_STREAM_CONTINUE = 1;
    GEE_TRAVERSABLE_STREAM_END = 2;
    GEE_TRAVERSABLE_STREAM_WAIT = 3;

type
  TGeeStreamFunc = function (state:TGeeTraversableStream; g:PGeeLazy; lazy:PPGeeLazy; user_data:Tgpointer):TGeeTraversableStream;cdecl;

type
  TGeeFoldFunc = function (g:Tgpointer; a:Tgpointer; user_data:Tgpointer):Tgpointer;cdecl;
  TGeeMapFunc = function (g:Tgpointer; user_data:Tgpointer):Tgpointer;cdecl;
  TGeePredicate = function (g:Tgconstpointer; user_data:Tgpointer):Tgboolean;cdecl;
  TGeeFlatMapFunc = function (g:Tgpointer; user_data:Tgpointer):PGeeIterator;cdecl;


type
  TGeeFoldMapFunc = function (k:Tgconstpointer; v:Tgconstpointer; a:Tgpointer; user_data:Tgpointer):Tgpointer;cdecl;
  TGeeForallMapFunc = function (k:Tgconstpointer; v:Tgconstpointer; user_data:Tgpointer):Tgboolean;cdecl;

type
  TGeeEqualDataFunc = function (a:Tgconstpointer; b:Tgconstpointer; user_data:Tgpointer):Tgboolean;cdecl;

type
  PGeeConcurrentSetRangeType = ^TGeeConcurrentSetRangeType;
  TGeeConcurrentSetRangeType =  Longint;
  Const
    GEE_CONCURRENT_SET_RANGE_TYPE_HEAD = 0;
    GEE_CONCURRENT_SET_RANGE_TYPE_TAIL = 1;
    GEE_CONCURRENT_SET_RANGE_TYPE_BOUNDED = 2;
    GEE_CONCURRENT_SET_RANGE_TYPE_EMPTY = 3;

type
  TGeeHashDataFunc = function (v:Tgconstpointer; user_data:Tgpointer):Tguint;cdecl;

function GEE_TYPE_FUTURE_ERROR : longint; { return type might be wrong }

type
  TGeeFutureMapFunc = function (value:Tgconstpointer; user_data:Tgpointer):Tgpointer;cdecl;
  TGeeFutureLightMapFunc = function (value:Tgconstpointer; user_data:Tgpointer):Tgconstpointer;cdecl;
  TGeeFutureZipFunc = function (a:Tgconstpointer; b:Tgconstpointer; user_data:Tgpointer):Tgpointer;cdecl;
  TGeeFutureFlatMapFunc = function (value:Tgconstpointer; user_data:Tgpointer):PGeeFuture;cdecl;

type
  PGeeHazardPointerPolicy = ^TGeeHazardPointerPolicy;
  TGeeHazardPointerPolicy =  Longint;
  Const
    GEE_HAZARD_POINTER_POLICY_DEFAULT = 0;
    GEE_HAZARD_POINTER_POLICY_THREAD_EXIT = 1;
    GEE_HAZARD_POINTER_POLICY_TRY_FREE = 2;
    GEE_HAZARD_POINTER_POLICY_FREE = 3;
    GEE_HAZARD_POINTER_POLICY_TRY_RELEASE = 4;
    GEE_HAZARD_POINTER_POLICY_RELEASE = 5;

type
  PGeeHazardPointerReleasePolicy = ^TGeeHazardPointerReleasePolicy;
  TGeeHazardPointerReleasePolicy =  Longint;
  Const
    GEE_HAZARD_POINTER_RELEASE_POLICY_HELPER_THREAD = 0;
    GEE_HAZARD_POINTER_RELEASE_POLICY_MAIN_LOOP = 1;

type
  TGeeUnfoldFunc = function (user_data:Tgpointer):PGeeLazy;cdecl;
  TGeeLazyFunc = function (user_data:Tgpointer):Tgpointer;cdecl;

type
  TGeeTask = function (user_data:Tgpointer):Tgpointer;cdecl;

type
  PGeeIteratorIface = ^TGeeIteratorIface;
  TGeeIteratorIface = record
      parent_iface : TGTypeInterface;cdecl;
      next : function (self:PGeeIterator):Tgboolean;cdecl;
      has_next : function (self:PGeeIterator):Tgboolean;cdecl;
      get : function (self:PGeeIterator):Tgpointer;cdecl;
      remove : procedure (self:PGeeIterator);cdecl;
      get_valid : function (self:PGeeIterator):Tgboolean;cdecl;
      get_read_only : function (self:PGeeIterator):Tgboolean;cdecl;
    end;

  PGeeTraversableIface = ^TGeeTraversableIface;
  TGeeTraversableIface = record
      parent_iface : TGTypeInterface;
      get_g_type : function (self:PGeeTraversable):TGType;cdecl;
      get_g_dup_func : function (self:PGeeTraversable):TGBoxedCopyFunc;cdecl;
      get_g_destroy_func : function (self:PGeeTraversable):TGDestroyNotify;cdecl;
      foreach : function (self:PGeeTraversable; f:TGeeForallFunc; f_target:Tgpointer):Tgboolean;cdecl;
      stream : function (self:PGeeTraversable; a_type:TGType; a_dup_func:TGBoxedCopyFunc; a_destroy_func:TGDestroyNotify; f:TGeeStreamFunc; 
                   f_target:Tgpointer; f_target_destroy_notify:TGDestroyNotify):PGeeIterator;cdecl;
      fold : function (self:PGeeTraversable; a_type:TGType; a_dup_func:TGBoxedCopyFunc; a_destroy_func:TGDestroyNotify; f:TGeeFoldFunc; 
                   f_target:Tgpointer; seed:Tgpointer):Tgpointer;cdecl;
      map : function (self:PGeeTraversable; a_type:TGType; a_dup_func:TGBoxedCopyFunc; a_destroy_func:TGDestroyNotify; f:TGeeMapFunc; 
                   f_target:Tgpointer):PGeeIterator;cdecl;
      scan : function (self:PGeeTraversable; a_type:TGType; a_dup_func:TGBoxedCopyFunc; a_destroy_func:TGDestroyNotify; f:TGeeFoldFunc; 
                   f_target:Tgpointer; seed:Tgpointer):PGeeIterator;cdecl;
      filter : function (self:PGeeTraversable; pred:TGeePredicate; pred_target:Tgpointer; pred_target_destroy_notify:TGDestroyNotify):PGeeIterator;cdecl;
      chop : function (self:PGeeTraversable; offset:Tgint; length:Tgint):PGeeIterator;cdecl;
      get_element_type : function (self:PGeeTraversable):TGType;cdecl;
      flat_map : function (self:PGeeTraversable; a_type:TGType; a_dup_func:TGBoxedCopyFunc; a_destroy_func:TGDestroyNotify; f:TGeeFlatMapFunc; 
                   f_target:Tgpointer; f_target_destroy_notify:TGDestroyNotify):PGeeIterator;cdecl;
      tee : function (self:PGeeTraversable; forks:Tguint; result_length1:Pgint):PPGeeIterator;cdecl;
      first_match : function (self:PGeeTraversable; pred:TGeePredicate; pred_target:Tgpointer; pred_target_destroy_notify:TGDestroyNotify):Tgpointer;cdecl;
      any_match : function (self:PGeeTraversable; pred:TGeePredicate; pred_target:Tgpointer; pred_target_destroy_notify:TGDestroyNotify):Tgboolean;cdecl;
      all_match : function (self:PGeeTraversable; pred:TGeePredicate; pred_target:Tgpointer; pred_target_destroy_notify:TGDestroyNotify):Tgboolean;cdecl;
      max : function (self:PGeeTraversable; compare:TGCompareDataFunc; compare_target:Tgpointer; compare_target_destroy_notify:TGDestroyNotify):Tgpointer;cdecl;
      min : function (self:PGeeTraversable; compare:TGCompareDataFunc; compare_target:Tgpointer; compare_target_destroy_notify:TGDestroyNotify):Tgpointer;cdecl;
      order_by : function (self:PGeeTraversable; compare:TGCompareDataFunc; compare_target:Tgpointer; compare_target_destroy_notify:TGDestroyNotify):PGeeIterator;cdecl;
    end;

  PGeeIterableIface = ^TGeeIterableIface;
  TGeeIterableIface = record
      parent_iface : TGTypeInterface;
      get_g_type : function (self:PGeeIterable):TGType;cdecl;
      get_g_dup_func : function (self:PGeeIterable):TGBoxedCopyFunc;cdecl;
      get_g_destroy_func : function (self:PGeeIterable):TGDestroyNotify;cdecl;
      iterator : function (self:PGeeIterable):PGeeIterator;cdecl;
    end;

  PGeeCollectionIface = ^TGeeCollectionIface;
  TGeeCollectionIface = record
      parent_iface : TGTypeInterface;
      get_g_type : function (self:PGeeCollection):TGType;cdecl;
      get_g_dup_func : function (self:PGeeCollection):TGBoxedCopyFunc;cdecl;
      get_g_destroy_func : function (self:PGeeCollection):TGDestroyNotify;cdecl;
      contains : function (self:PGeeCollection; item:Tgconstpointer):Tgboolean;cdecl;
      add : function (self:PGeeCollection; item:Tgconstpointer):Tgboolean;cdecl;
      remove : function (self:PGeeCollection; item:Tgconstpointer):Tgboolean;cdecl;
      clear : procedure (self:PGeeCollection);cdecl;
      add_all : function (self:PGeeCollection; collection:PGeeCollection):Tgboolean;cdecl;
      contains_all : function (self:PGeeCollection; collection:PGeeCollection):Tgboolean;cdecl;
      remove_all : function (self:PGeeCollection; collection:PGeeCollection):Tgboolean;cdecl;
      retain_all : function (self:PGeeCollection; collection:PGeeCollection):Tgboolean;cdecl;
      to_array : function (self:PGeeCollection; result_length1:Pgint):Pgpointer;cdecl;
      get_size : function (self:PGeeCollection):Tgint;cdecl;
      get_is_empty : function (self:PGeeCollection):Tgboolean;cdecl;
      get_read_only : function (self:PGeeCollection):Tgboolean;cdecl;
      get_read_only_view : function (self:PGeeCollection):PGeeCollection;cdecl;
      add_all_array : function (self:PGeeCollection; array:Pgpointer; array_length1:Tgint):Tgboolean;cdecl;
      contains_all_array : function (self:PGeeCollection; array:Pgpointer; array_length1:Tgint):Tgboolean;cdecl;
      remove_all_array : function (self:PGeeCollection; array:Pgpointer; array_length1:Tgint):Tgboolean;cdecl;
      add_all_iterator : function (self:PGeeCollection; iter:PGeeIterator):Tgboolean;cdecl;
      contains_all_iterator : function (self:PGeeCollection; iter:PGeeIterator):Tgboolean;cdecl;
      remove_all_iterator : function (self:PGeeCollection; iter:PGeeIterator):Tgboolean;cdecl;
    end;

  PGeeAbstractCollection = ^TGeeAbstractCollection;
  TGeeAbstractCollection = record
      parent_instance : TGObject;
      priv : PGeeAbstractCollectionPrivate;
    end;

  PGeeAbstractCollectionClass = ^TGeeAbstractCollectionClass;
  TGeeAbstractCollectionClass = record
      parent_class : TGObjectClass;
      contains : function (self:PGeeAbstractCollection; item:Tgconstpointer):Tgboolean;cdecl;
      add : function (self:PGeeAbstractCollection; item:Tgconstpointer):Tgboolean;cdecl;
      remove : function (self:PGeeAbstractCollection; item:Tgconstpointer):Tgboolean;cdecl;
      clear : procedure (self:PGeeAbstractCollection);cdecl;
      iterator : function (self:PGeeAbstractCollection):PGeeIterator;cdecl;
      foreach : function (self:PGeeAbstractCollection; f:TGeeForallFunc; f_target:Tgpointer):Tgboolean;cdecl;
      reserved0 : procedure (self:PGeeAbstractCollection);cdecl;
      reserved1 : procedure (self:PGeeAbstractCollection);cdecl;
      reserved2 : procedure (self:PGeeAbstractCollection);cdecl;
      reserved3 : procedure (self:PGeeAbstractCollection);cdecl;
      reserved4 : procedure (self:PGeeAbstractCollection);cdecl;
      reserved5 : procedure (self:PGeeAbstractCollection);cdecl;
      reserved6 : procedure (self:PGeeAbstractCollection);cdecl;
      reserved7 : procedure (self:PGeeAbstractCollection);cdecl;
      reserved8 : procedure (self:PGeeAbstractCollection);cdecl;
      reserved9 : procedure (self:PGeeAbstractCollection);cdecl;
      get_size : function (self:PGeeAbstractCollection):Tgint;cdecl;
      get_read_only : function (self:PGeeAbstractCollection):Tgboolean;cdecl;
      get_read_only_view : function (self:PGeeAbstractCollection):PGeeCollection;cdecl;
    end;

  PGeeListIteratorIface = ^TGeeListIteratorIface;
  TGeeListIteratorIface = record
      parent_iface : TGTypeInterface;
      set : procedure (self:PGeeListIterator; item:Tgconstpointer);cdecl;
      add : procedure (self:PGeeListIterator; item:Tgconstpointer);cdecl;
      index : function (self:PGeeListIterator):Tgint;cdecl;
    end;

  PGeeListIface = ^TGeeListIface;
  TGeeListIface = record
      parent_iface : TGTypeInterface;
      get_g_type : function (self:PGeeList):TGType;cdecl;
      get_g_dup_func : function (self:PGeeList):TGBoxedCopyFunc;cdecl;
      get_g_destroy_func : function (self:PGeeList):TGDestroyNotify;cdecl;
      list_iterator : function (self:PGeeList):PGeeListIterator;cdecl;
      get : function (self:PGeeList; index:Tgint):Tgpointer;cdecl;
      set : procedure (self:PGeeList; index:Tgint; item:Tgconstpointer);cdecl;
      index_of : function (self:PGeeList; item:Tgconstpointer):Tgint;cdecl;
      insert : procedure (self:PGeeList; index:Tgint; item:Tgconstpointer);cdecl;
      remove_at : function (self:PGeeList; index:Tgint):Tgpointer;cdecl;
      slice : function (self:PGeeList; start:Tgint; stop:Tgint):PGeeList;cdecl;
      first : function (self:PGeeList):Tgpointer;cdecl;
      last : function (self:PGeeList):Tgpointer;cdecl;
      insert_all : procedure (self:PGeeList; index:Tgint; collection:PGeeCollection);cdecl;
      sort : procedure (self:PGeeList; compare_func:TGCompareDataFunc; compare_func_target:Tgpointer; compare_func_target_destroy_notify:TGDestroyNotify);cdecl;
      get_read_only_view : function (self:PGeeList):PGeeList;cdecl;
    end;

  PGeeAbstractList = ^TGeeAbstractList;
  TGeeAbstractList = record
      parent_instance : TGeeAbstractCollection;
      priv : PGeeAbstractListPrivate;
    end;

  PGeeAbstractListClass = ^TGeeAbstractListClass;
  TGeeAbstractListClass = record
      parent_class : TGeeAbstractCollectionClass;
      list_iterator : function (self:PGeeAbstractList):PGeeListIterator;cdecl;
      get : function (self:PGeeAbstractList; index:Tgint):Tgpointer;cdecl;
      set : procedure (self:PGeeAbstractList; index:Tgint; item:Tgconstpointer);cdecl;
      index_of : function (self:PGeeAbstractList; item:Tgconstpointer):Tgint;cdecl;
      insert : procedure (self:PGeeAbstractList; index:Tgint; item:Tgconstpointer);cdecl;
      remove_at : function (self:PGeeAbstractList; index:Tgint):Tgpointer;cdecl;
      slice : function (self:PGeeAbstractList; start:Tgint; stop:Tgint):PGeeList;cdecl;
      reserved0 : procedure (self:PGeeAbstractList);cdecl;
      reserved1 : procedure (self:PGeeAbstractList);cdecl;
      reserved2 : procedure (self:PGeeAbstractList);cdecl;
      reserved3 : procedure (self:PGeeAbstractList);cdecl;
      reserved4 : procedure (self:PGeeAbstractList);cdecl;
      reserved5 : procedure (self:PGeeAbstractList);cdecl;
      reserved6 : procedure (self:PGeeAbstractList);cdecl;
      reserved7 : procedure (self:PGeeAbstractList);cdecl;
      reserved8 : procedure (self:PGeeAbstractList);cdecl;
      reserved9 : procedure (self:PGeeAbstractList);cdecl;
      get_read_only_view : function (self:PGeeAbstractList):PGeeList;cdecl;
    end;

  PGeeBidirIteratorIface = ^TGeeBidirIteratorIface;
  TGeeBidirIteratorIface = record
      parent_iface : TGTypeInterface;
      get_g_type : function (self:PGeeBidirIterator):TGType;cdecl;
      get_g_dup_func : function (self:PGeeBidirIterator):TGBoxedCopyFunc;cdecl;
      get_g_destroy_func : function (self:PGeeBidirIterator):TGDestroyNotify;cdecl;
      previous : function (self:PGeeBidirIterator):Tgboolean;cdecl;
      has_previous : function (self:PGeeBidirIterator):Tgboolean;cdecl;
      first : function (self:PGeeBidirIterator):Tgboolean;cdecl;
      last : function (self:PGeeBidirIterator):Tgboolean;cdecl;
    end;

  PGeeBidirListIteratorIface = ^TGeeBidirListIteratorIface;
  TGeeBidirListIteratorIface = record
      parent_iface : TGTypeInterface;
      get_g_type : function (self:PGeeBidirListIterator):TGType;cdecl;
      get_g_dup_func : function (self:PGeeBidirListIterator):TGBoxedCopyFunc;cdecl;
      get_g_destroy_func : function (self:PGeeBidirListIterator):TGDestroyNotify;cdecl;
      insert : procedure (self:PGeeBidirListIterator; item:Tgconstpointer);cdecl;
    end;

  PGeeBidirListIface = ^TGeeBidirListIface;
  TGeeBidirListIface = record
      parent_iface : TGTypeInterface;
      get_g_type : function (self:PGeeBidirList):TGType;cdecl;
      get_g_dup_func : function (self:PGeeBidirList):TGBoxedCopyFunc;cdecl;
      get_g_destroy_func : function (self:PGeeBidirList):TGDestroyNotify;cdecl;
      bidir_list_iterator : function (self:PGeeBidirList):PGeeBidirListIterator;cdecl;
      get_read_only_view : function (self:PGeeBidirList):PGeeBidirList;cdecl;
    end;

  PGeeAbstractBidirList = ^TGeeAbstractBidirList;
  TGeeAbstractBidirList = record
      parent_instance : TGeeAbstractList;
      priv : PGeeAbstractBidirListPrivate;
    end;

  PGeeAbstractBidirListClass = ^TGeeAbstractBidirListClass;
  TGeeAbstractBidirListClass = record
      parent_class : TGeeAbstractListClass;
      bidir_list_iterator : function (self:PGeeAbstractBidirList):PGeeBidirListIterator;cdecl;
      reserved0 : procedure (self:PGeeAbstractBidirList);cdecl;
      reserved1 : procedure (self:PGeeAbstractBidirList);cdecl;
      reserved2 : procedure (self:PGeeAbstractBidirList);cdecl;
      reserved3 : procedure (self:PGeeAbstractBidirList);cdecl;
      reserved4 : procedure (self:PGeeAbstractBidirList);cdecl;
      reserved5 : procedure (self:PGeeAbstractBidirList);cdecl;
      reserved6 : procedure (self:PGeeAbstractBidirList);cdecl;
      reserved7 : procedure (self:PGeeAbstractBidirList);cdecl;
      reserved8 : procedure (self:PGeeAbstractBidirList);cdecl;
      reserved9 : procedure (self:PGeeAbstractBidirList);cdecl;
      get_read_only_view : function (self:PGeeAbstractBidirList):PGeeBidirList;cdecl;
    end;

  PGeeSetIface = ^TGeeSetIface;
  TGeeSetIface = record
      parent_iface : TGTypeInterface;
      get_g_type : function (self:PGeeSet):TGType;cdecl;
      get_g_dup_func : function (self:PGeeSet):TGBoxedCopyFunc;cdecl;
      get_g_destroy_func : function (self:PGeeSet):TGDestroyNotify;cdecl;
      get_read_only_view : function (self:PGeeSet):PGeeSet;cdecl;
    end;

  PGeeAbstractSet = ^TGeeAbstractSet;
  TGeeAbstractSet = record
      parent_instance : TGeeAbstractCollection;
      priv : PGeeAbstractSetPrivate;
    end;

  PGeeAbstractSetClass = ^TGeeAbstractSetClass;
  TGeeAbstractSetClass = record
      parent_class : TGeeAbstractCollectionClass;
      reserved0 : procedure (self:PGeeAbstractSet);cdecl;
      reserved1 : procedure (self:PGeeAbstractSet);cdecl;
      reserved2 : procedure (self:PGeeAbstractSet);cdecl;
      reserved3 : procedure (self:PGeeAbstractSet);cdecl;
      reserved4 : procedure (self:PGeeAbstractSet);cdecl;
      reserved5 : procedure (self:PGeeAbstractSet);cdecl;
      reserved6 : procedure (self:PGeeAbstractSet);cdecl;
      reserved7 : procedure (self:PGeeAbstractSet);cdecl;
      reserved8 : procedure (self:PGeeAbstractSet);cdecl;
      reserved9 : procedure (self:PGeeAbstractSet);cdecl;
      get_read_only_view : function (self:PGeeAbstractSet):PGeeSet;cdecl;
    end;

  PGeeSortedSetIface = ^TGeeSortedSetIface;
  TGeeSortedSetIface = record
      parent_iface : TGTypeInterface;
      get_g_type : function (self:PGeeSortedSet):TGType;cdecl;
      get_g_dup_func : function (self:PGeeSortedSet):TGBoxedCopyFunc;cdecl;
      get_g_destroy_func : function (self:PGeeSortedSet):TGDestroyNotify;cdecl;
      first : function (self:PGeeSortedSet):Tgpointer;cdecl;
      last : function (self:PGeeSortedSet):Tgpointer;cdecl;
      iterator_at : function (self:PGeeSortedSet; element:Tgconstpointer):PGeeIterator;cdecl;
      lower : function (self:PGeeSortedSet; element:Tgconstpointer):Tgpointer;cdecl;
      higher : function (self:PGeeSortedSet; element:Tgconstpointer):Tgpointer;cdecl;
      floor : function (self:PGeeSortedSet; element:Tgconstpointer):Tgpointer;cdecl;
      ceil : function (self:PGeeSortedSet; element:Tgconstpointer):Tgpointer;cdecl;
      head_set : function (self:PGeeSortedSet; before:Tgconstpointer):PGeeSortedSet;cdecl;
      tail_set : function (self:PGeeSortedSet; after:Tgconstpointer):PGeeSortedSet;cdecl;
      sub_set : function (self:PGeeSortedSet; from:Tgconstpointer; to:Tgconstpointer):PGeeSortedSet;cdecl;
      get_read_only_view : function (self:PGeeSortedSet):PGeeSortedSet;cdecl;
    end;

  PGeeAbstractSortedSet = ^TGeeAbstractSortedSet;
  TGeeAbstractSortedSet = record
      parent_instance : TGeeAbstractSet;
      priv : PGeeAbstractSortedSetPrivate;
    end;

  PGeeAbstractSortedSetClass = ^TGeeAbstractSortedSetClass;
  TGeeAbstractSortedSetClass = record
      parent_class : TGeeAbstractSetClass;
      first : function (self:PGeeAbstractSortedSet):Tgpointer;cdecl;
      last : function (self:PGeeAbstractSortedSet):Tgpointer;cdecl;
      iterator_at : function (self:PGeeAbstractSortedSet; element:Tgconstpointer):PGeeIterator;cdecl;
      lower : function (self:PGeeAbstractSortedSet; element:Tgconstpointer):Tgpointer;cdecl;
      higher : function (self:PGeeAbstractSortedSet; element:Tgconstpointer):Tgpointer;cdecl;
      floor : function (self:PGeeAbstractSortedSet; element:Tgconstpointer):Tgpointer;cdecl;
      ceil : function (self:PGeeAbstractSortedSet; element:Tgconstpointer):Tgpointer;cdecl;
      head_set : function (self:PGeeAbstractSortedSet; before:Tgconstpointer):PGeeSortedSet;cdecl;
      tail_set : function (self:PGeeAbstractSortedSet; after:Tgconstpointer):PGeeSortedSet;cdecl;
      sub_set : function (self:PGeeAbstractSortedSet; from:Tgconstpointer; to:Tgconstpointer):PGeeSortedSet;cdecl;
      reserved0 : procedure (self:PGeeAbstractSortedSet);cdecl;
      reserved1 : procedure (self:PGeeAbstractSortedSet);cdecl;
      reserved2 : procedure (self:PGeeAbstractSortedSet);cdecl;
      reserved3 : procedure (self:PGeeAbstractSortedSet);cdecl;
      reserved4 : procedure (self:PGeeAbstractSortedSet);cdecl;
      reserved5 : procedure (self:PGeeAbstractSortedSet);cdecl;
      reserved6 : procedure (self:PGeeAbstractSortedSet);cdecl;
      reserved7 : procedure (self:PGeeAbstractSortedSet);cdecl;
      reserved8 : procedure (self:PGeeAbstractSortedSet);cdecl;
      reserved9 : procedure (self:PGeeAbstractSortedSet);cdecl;
      get_read_only_view : function (self:PGeeAbstractSortedSet):PGeeSortedSet;cdecl;
    end;

  PGeeBidirSortedSetIface = ^TGeeBidirSortedSetIface;
  TGeeBidirSortedSetIface = record
      parent_iface : TGTypeInterface;
      get_g_type : function (self:PGeeBidirSortedSet):TGType;cdecl;
      get_g_dup_func : function (self:PGeeBidirSortedSet):TGBoxedCopyFunc;cdecl;
      get_g_destroy_func : function (self:PGeeBidirSortedSet):TGDestroyNotify;cdecl;
      bidir_iterator : function (self:PGeeBidirSortedSet):PGeeBidirIterator;cdecl;
      get_read_only_view : function (self:PGeeBidirSortedSet):PGeeBidirSortedSet;cdecl;
    end;

  PGeeAbstractBidirSortedSet = ^TGeeAbstractBidirSortedSet;
  TGeeAbstractBidirSortedSet = record
      parent_instance : TGeeAbstractSortedSet;
      priv : PGeeAbstractBidirSortedSetPrivate;
    end;

  PGeeAbstractBidirSortedSetClass = ^TGeeAbstractBidirSortedSetClass;
  TGeeAbstractBidirSortedSetClass = record
      parent_class : TGeeAbstractSortedSetClass;
      bidir_iterator : function (self:PGeeAbstractBidirSortedSet):PGeeBidirIterator;cdecl;
      reserved0 : procedure (self:PGeeAbstractBidirSortedSet);cdecl;
      reserved1 : procedure (self:PGeeAbstractBidirSortedSet);cdecl;
      reserved2 : procedure (self:PGeeAbstractBidirSortedSet);cdecl;
      reserved3 : procedure (self:PGeeAbstractBidirSortedSet);cdecl;
      reserved4 : procedure (self:PGeeAbstractBidirSortedSet);cdecl;
      reserved5 : procedure (self:PGeeAbstractBidirSortedSet);cdecl;
      reserved6 : procedure (self:PGeeAbstractBidirSortedSet);cdecl;
      reserved7 : procedure (self:PGeeAbstractBidirSortedSet);cdecl;
      reserved8 : procedure (self:PGeeAbstractBidirSortedSet);cdecl;
      reserved9 : procedure (self:PGeeAbstractBidirSortedSet);cdecl;
      get_read_only_view : function (self:PGeeAbstractBidirSortedSet):PGeeBidirSortedSet;cdecl;
    end;

  PGeeMapIteratorIface = ^TGeeMapIteratorIface;
  TGeeMapIteratorIface = record
      parent_iface : TGTypeInterface;
      get_k_type : function (self:PGeeMapIterator):TGType;cdecl;
      get_k_dup_func : function (self:PGeeMapIterator):TGBoxedCopyFunc;cdecl;
      get_k_destroy_func : function (self:PGeeMapIterator):TGDestroyNotify;cdecl;
      get_v_type : function (self:PGeeMapIterator):TGType;cdecl;
      get_v_dup_func : function (self:PGeeMapIterator):TGBoxedCopyFunc;cdecl;
      get_v_destroy_func : function (self:PGeeMapIterator):TGDestroyNotify;cdecl;
      next : function (self:PGeeMapIterator):Tgboolean;cdecl;
      has_next : function (self:PGeeMapIterator):Tgboolean;cdecl;
      get_key : function (self:PGeeMapIterator):Tgpointer;cdecl;
      get_value : function (self:PGeeMapIterator):Tgpointer;cdecl;
      set_value : procedure (self:PGeeMapIterator; value:Tgconstpointer);cdecl;
      unset : procedure (self:PGeeMapIterator);cdecl;
      fold : function (self:PGeeMapIterator; a_type:TGType; a_dup_func:TGBoxedCopyFunc; a_destroy_func:TGDestroyNotify; f:TGeeFoldMapFunc; 
                   f_target:Tgpointer; seed:Tgpointer):Tgpointer;cdecl;
      foreach : function (self:PGeeMapIterator; f:TGeeForallMapFunc; f_target:Tgpointer):Tgboolean;cdecl;
      get_valid : function (self:PGeeMapIterator):Tgboolean;cdecl;
      get_mutable : function (self:PGeeMapIterator):Tgboolean;cdecl;
      get_read_only : function (self:PGeeMapIterator):Tgboolean;cdecl;
    end;

  PGeeMapIface = ^TGeeMapIface;
  TGeeMapIface = record
      parent_iface : TGTypeInterface;
      get_k_type : function (self:PGeeMap):TGType;cdecl;
      get_k_dup_func : function (self:PGeeMap):TGBoxedCopyFunc;cdecl;
      get_k_destroy_func : function (self:PGeeMap):TGDestroyNotify;cdecl;
      get_v_type : function (self:PGeeMap):TGType;cdecl;
      get_v_dup_func : function (self:PGeeMap):TGBoxedCopyFunc;cdecl;
      get_v_destroy_func : function (self:PGeeMap):TGDestroyNotify;cdecl;
      has_key : function (self:PGeeMap; key:Tgconstpointer):Tgboolean;cdecl;
      has : function (self:PGeeMap; key:Tgconstpointer; value:Tgconstpointer):Tgboolean;cdecl;
      get : function (self:PGeeMap; key:Tgconstpointer):Tgpointer;cdecl;
      set : procedure (self:PGeeMap; key:Tgconstpointer; value:Tgconstpointer);cdecl;
      unset : function (self:PGeeMap; key:Tgconstpointer; value:Pgpointer):Tgboolean;cdecl;
      clear : procedure (self:PGeeMap);cdecl;
      map_iterator : function (self:PGeeMap):PGeeMapIterator;cdecl;
      set_all : procedure (self:PGeeMap; map:PGeeMap);cdecl;
      unset_all : function (self:PGeeMap; map:PGeeMap):Tgboolean;cdecl;
      has_all : function (self:PGeeMap; map:PGeeMap):Tgboolean;cdecl;
      get_size : function (self:PGeeMap):Tgint;cdecl;
      get_is_empty : function (self:PGeeMap):Tgboolean;cdecl;
      get_read_only : function (self:PGeeMap):Tgboolean;cdecl;
      get_keys : function (self:PGeeMap):PGeeSet;cdecl;
      get_values : function (self:PGeeMap):PGeeCollection;cdecl;
      get_entries : function (self:PGeeMap):PGeeSet;cdecl;
      get_read_only_view : function (self:PGeeMap):PGeeMap;cdecl;
    end;

  PGeeAbstractMap = ^TGeeAbstractMap;
  TGeeAbstractMap = record
      parent_instance : TGObject;
      priv : PGeeAbstractMapPrivate;
    end;

  PGeeAbstractMapClass = ^TGeeAbstractMapClass;
  TGeeAbstractMapClass = record
      parent_class : TGObjectClass;
      has_key : function (self:PGeeAbstractMap; key:Tgconstpointer):Tgboolean;cdecl;
      has : function (self:PGeeAbstractMap; key:Tgconstpointer; value:Tgconstpointer):Tgboolean;cdecl;
      get : function (self:PGeeAbstractMap; key:Tgconstpointer):Tgpointer;cdecl;
      set : procedure (self:PGeeAbstractMap; key:Tgconstpointer; value:Tgconstpointer);cdecl;
      unset : function (self:PGeeAbstractMap; key:Tgconstpointer; value:Pgpointer):Tgboolean;cdecl;
      map_iterator : function (self:PGeeAbstractMap):PGeeMapIterator;cdecl;
      clear : procedure (self:PGeeAbstractMap);cdecl;
      foreach : function (self:PGeeAbstractMap; f:TGeeForallFunc; f_target:Tgpointer):Tgboolean;cdecl;
      stream : function (self:PGeeAbstractMap; a_type:TGType; a_dup_func:TGBoxedCopyFunc; a_destroy_func:TGDestroyNotify; f:TGeeStreamFunc; 
                   f_target:Tgpointer; f_target_destroy_notify:TGDestroyNotify):PGeeIterator;cdecl;
      reserved0 : procedure (self:PGeeAbstractMap);cdecl;
      reserved1 : procedure (self:PGeeAbstractMap);cdecl;
      reserved2 : procedure (self:PGeeAbstractMap);cdecl;
      reserved3 : procedure (self:PGeeAbstractMap);cdecl;
      reserved4 : procedure (self:PGeeAbstractMap);cdecl;
      reserved5 : procedure (self:PGeeAbstractMap);cdecl;
      reserved6 : procedure (self:PGeeAbstractMap);cdecl;
      reserved7 : procedure (self:PGeeAbstractMap);cdecl;
      reserved8 : procedure (self:PGeeAbstractMap);cdecl;
      reserved9 : procedure (self:PGeeAbstractMap);cdecl;
      get_size : function (self:PGeeAbstractMap):Tgint;cdecl;
      get_read_only : function (self:PGeeAbstractMap):Tgboolean;cdecl;
      get_keys : function (self:PGeeAbstractMap):PGeeSet;cdecl;
      get_values : function (self:PGeeAbstractMap):PGeeCollection;cdecl;
      get_entries : function (self:PGeeAbstractMap):PGeeSet;cdecl;
      get_read_only_view : function (self:PGeeAbstractMap):PGeeMap;cdecl;
    end;

  PGeeSortedMapIface = ^TGeeSortedMapIface;
  TGeeSortedMapIface = record
      parent_iface : TGTypeInterface;
      head_map : function (self:PGeeSortedMap; before:Tgconstpointer):PGeeSortedMap;cdecl;
      tail_map : function (self:PGeeSortedMap; after:Tgconstpointer):PGeeSortedMap;cdecl;
      sub_map : function (self:PGeeSortedMap; before:Tgconstpointer; after:Tgconstpointer):PGeeSortedMap;cdecl;
      get_ascending_keys : function (self:PGeeSortedMap):PGeeSortedSet;cdecl;
      get_ascending_entries : function (self:PGeeSortedMap):PGeeSortedSet;cdecl;
      get_read_only_view : function (self:PGeeSortedMap):PGeeSortedMap;cdecl;
    end;

  PGeeAbstractSortedMap = ^TGeeAbstractSortedMap;
  TGeeAbstractSortedMap = record
      parent_instance : TGeeAbstractMap;
      priv : PGeeAbstractSortedMapPrivate;
    end;

  PGeeAbstractSortedMapClass = ^TGeeAbstractSortedMapClass;
  TGeeAbstractSortedMapClass = record
      parent_class : TGeeAbstractMapClass;
      head_map : function (self:PGeeAbstractSortedMap; before:Tgconstpointer):PGeeSortedMap;cdecl;
      tail_map : function (self:PGeeAbstractSortedMap; after:Tgconstpointer):PGeeSortedMap;cdecl;
      sub_map : function (self:PGeeAbstractSortedMap; before:Tgconstpointer; after:Tgconstpointer):PGeeSortedMap;cdecl;
      reserved0 : procedure (self:PGeeAbstractSortedMap);cdecl;
      reserved1 : procedure (self:PGeeAbstractSortedMap);cdecl;
      reserved2 : procedure (self:PGeeAbstractSortedMap);cdecl;
      reserved3 : procedure (self:PGeeAbstractSortedMap);cdecl;
      reserved4 : procedure (self:PGeeAbstractSortedMap);cdecl;
      reserved5 : procedure (self:PGeeAbstractSortedMap);cdecl;
      reserved6 : procedure (self:PGeeAbstractSortedMap);cdecl;
      reserved7 : procedure (self:PGeeAbstractSortedMap);cdecl;
      reserved8 : procedure (self:PGeeAbstractSortedMap);cdecl;
      reserved9 : procedure (self:PGeeAbstractSortedMap);cdecl;
      get_ascending_keys : function (self:PGeeAbstractSortedMap):PGeeSortedSet;cdecl;
      get_ascending_entries : function (self:PGeeAbstractSortedMap):PGeeSortedSet;cdecl;
    end;

  PGeeBidirMapIteratorIface = ^TGeeBidirMapIteratorIface;
  TGeeBidirMapIteratorIface = record
      parent_iface : TGTypeInterface;
      get_k_type : function (self:PGeeBidirMapIterator):TGType;cdecl;
      get_k_dup_func : function (self:PGeeBidirMapIterator):TGBoxedCopyFunc;cdecl;
      get_k_destroy_func : function (self:PGeeBidirMapIterator):TGDestroyNotify;cdecl;
      get_v_type : function (self:PGeeBidirMapIterator):TGType;cdecl;
      get_v_dup_func : function (self:PGeeBidirMapIterator):TGBoxedCopyFunc;cdecl;
      get_v_destroy_func : function (self:PGeeBidirMapIterator):TGDestroyNotify;cdecl;
      previous : function (self:PGeeBidirMapIterator):Tgboolean;cdecl;
      has_previous : function (self:PGeeBidirMapIterator):Tgboolean;cdecl;
      first : function (self:PGeeBidirMapIterator):Tgboolean;cdecl;
      last : function (self:PGeeBidirMapIterator):Tgboolean;cdecl;
    end;

  PGeeBidirSortedMapIface = ^TGeeBidirSortedMapIface;
  TGeeBidirSortedMapIface = record
      parent_iface : TGTypeInterface;
      get_k_type : function (self:PGeeBidirSortedMap):TGType;cdecl;
      get_k_dup_func : function (self:PGeeBidirSortedMap):TGBoxedCopyFunc;cdecl;
      get_k_destroy_func : function (self:PGeeBidirSortedMap):TGDestroyNotify;cdecl;
      get_v_type : function (self:PGeeBidirSortedMap):TGType;cdecl;
      get_v_dup_func : function (self:PGeeBidirSortedMap):TGBoxedCopyFunc;cdecl;
      get_v_destroy_func : function (self:PGeeBidirSortedMap):TGDestroyNotify;cdecl;
      bidir_map_iterator : function (self:PGeeBidirSortedMap):PGeeBidirMapIterator;cdecl;
      get_read_only_view : function (self:PGeeBidirSortedMap):PGeeBidirSortedMap;cdecl;
    end;

  PGeeAbstractBidirSortedMap = ^TGeeAbstractBidirSortedMap;
  TGeeAbstractBidirSortedMap = record
      parent_instance : TGeeAbstractSortedMap;
      priv : PGeeAbstractBidirSortedMapPrivate;
    end;

  PGeeAbstractBidirSortedMapClass = ^TGeeAbstractBidirSortedMapClass;
  TGeeAbstractBidirSortedMapClass = record
      parent_class : TGeeAbstractSortedMapClass;
      bidir_map_iterator : function (self:PGeeAbstractBidirSortedMap):PGeeBidirMapIterator;cdecl;
      reserved0 : procedure (self:PGeeAbstractBidirSortedMap);cdecl;
      reserved1 : procedure (self:PGeeAbstractBidirSortedMap);cdecl;
      reserved2 : procedure (self:PGeeAbstractBidirSortedMap);cdecl;
      reserved3 : procedure (self:PGeeAbstractBidirSortedMap);cdecl;
      reserved4 : procedure (self:PGeeAbstractBidirSortedMap);cdecl;
      reserved5 : procedure (self:PGeeAbstractBidirSortedMap);cdecl;
      reserved6 : procedure (self:PGeeAbstractBidirSortedMap);cdecl;
      reserved7 : procedure (self:PGeeAbstractBidirSortedMap);cdecl;
      reserved8 : procedure (self:PGeeAbstractBidirSortedMap);cdecl;
      reserved9 : procedure (self:PGeeAbstractBidirSortedMap);cdecl;
      get_read_only_view : function (self:PGeeAbstractBidirSortedMap):PGeeBidirSortedMap;cdecl;
    end;

  PGeeMultiSetIface = ^TGeeMultiSetIface;
  TGeeMultiSetIface = record
      parent_iface : TGTypeInterface;
      get_g_type : function (self:PGeeMultiSet):TGType;cdecl;
      get_g_dup_func : function (self:PGeeMultiSet):TGBoxedCopyFunc;cdecl;
      get_g_destroy_func : function (self:PGeeMultiSet):TGDestroyNotify;cdecl;
      count : function (self:PGeeMultiSet; item:Tgconstpointer):Tgint;cdecl;
      get_read_only_view : function (self:PGeeMultiSet):PGeeMultiSet;cdecl;
    end;

  PGeeMultiMapIface = ^TGeeMultiMapIface;
  TGeeMultiMapIface = record
      parent_iface : TGTypeInterface;
      get_k_type : function (self:PGeeMultiMap):TGType;cdecl;
      get_k_dup_func : function (self:PGeeMultiMap):TGBoxedCopyFunc;cdecl;
      get_k_destroy_func : function (self:PGeeMultiMap):TGDestroyNotify;cdecl;
      get_v_type : function (self:PGeeMultiMap):TGType;cdecl;
      get_v_dup_func : function (self:PGeeMultiMap):TGBoxedCopyFunc;cdecl;
      get_v_destroy_func : function (self:PGeeMultiMap):TGDestroyNotify;cdecl;
      get_keys : function (self:PGeeMultiMap):PGeeSet;cdecl;
      get_all_keys : function (self:PGeeMultiMap):PGeeMultiSet;cdecl;
      get_values : function (self:PGeeMultiMap):PGeeCollection;cdecl;
      contains : function (self:PGeeMultiMap; key:Tgconstpointer):Tgboolean;cdecl;
      get : function (self:PGeeMultiMap; key:Tgconstpointer):PGeeCollection;cdecl;
      set : procedure (self:PGeeMultiMap; key:Tgconstpointer; value:Tgconstpointer);cdecl;
      remove : function (self:PGeeMultiMap; key:Tgconstpointer; value:Tgconstpointer):Tgboolean;cdecl;
      remove_all : function (self:PGeeMultiMap; key:Tgconstpointer):Tgboolean;cdecl;
      clear : procedure (self:PGeeMultiMap);cdecl;
      map_iterator : function (self:PGeeMultiMap):PGeeMapIterator;cdecl;
      get_size : function (self:PGeeMultiMap):Tgint;cdecl;
      get_read_only : function (self:PGeeMultiMap):Tgboolean;cdecl;
      get_read_only_view : function (self:PGeeMultiMap):PGeeMultiMap;cdecl;
    end;

  PGeeAbstractMultiMap = ^TGeeAbstractMultiMap;
  TGeeAbstractMultiMap = record
      parent_instance : TGObject;
      priv : PGeeAbstractMultiMapPrivate;
      _storage_map : PGeeMap;
    end;

  PGeeAbstractMultiMapClass = ^TGeeAbstractMultiMapClass;
  TGeeAbstractMultiMapClass = record
      parent_class : TGObjectClass;
      create_value_storage : function (self:PGeeAbstractMultiMap):PGeeCollection;cdecl;
      create_multi_key_set : function (self:PGeeAbstractMultiMap):PGeeMultiSet;cdecl;
      get_value_equal_func : function (self:PGeeAbstractMultiMap; result_target:Pgpointer; result_target_destroy_notify:PGDestroyNotify):TGeeEqualDataFunc;cdecl;
      reserved0 : procedure (self:PGeeAbstractMultiMap);cdecl;
      reserved1 : procedure (self:PGeeAbstractMultiMap);cdecl;
      reserved2 : procedure (self:PGeeAbstractMultiMap);cdecl;
      reserved3 : procedure (self:PGeeAbstractMultiMap);cdecl;
      reserved4 : procedure (self:PGeeAbstractMultiMap);cdecl;
      reserved5 : procedure (self:PGeeAbstractMultiMap);cdecl;
      reserved6 : procedure (self:PGeeAbstractMultiMap);cdecl;
      reserved7 : procedure (self:PGeeAbstractMultiMap);cdecl;
      reserved8 : procedure (self:PGeeAbstractMultiMap);cdecl;
      get_read_only_view : function (self:PGeeAbstractMultiMap):PGeeMultiMap;cdecl;
    end;

  PGeeAbstractMultiSet = ^TGeeAbstractMultiSet;
  TGeeAbstractMultiSet = record
      parent_instance : TGeeAbstractCollection;
      priv : PGeeAbstractMultiSetPrivate;
      _storage_map : PGeeMap;
    end;

  PGeeAbstractMultiSetClass = ^TGeeAbstractMultiSetClass;
  TGeeAbstractMultiSetClass = record
      parent_class : TGeeAbstractCollectionClass;
      reserved0 : procedure (self:PGeeAbstractMultiSet);cdecl;
      reserved1 : procedure (self:PGeeAbstractMultiSet);cdecl;
      reserved2 : procedure (self:PGeeAbstractMultiSet);cdecl;
      reserved3 : procedure (self:PGeeAbstractMultiSet);cdecl;
      reserved4 : procedure (self:PGeeAbstractMultiSet);cdecl;
      reserved5 : procedure (self:PGeeAbstractMultiSet);cdecl;
      reserved6 : procedure (self:PGeeAbstractMultiSet);cdecl;
      reserved7 : procedure (self:PGeeAbstractMultiSet);cdecl;
      reserved8 : procedure (self:PGeeAbstractMultiSet);cdecl;
      get_read_only_view : function (self:PGeeAbstractMultiSet):PGeeMultiSet;cdecl;
    end;

  PGeeQueueIface = ^TGeeQueueIface;
  TGeeQueueIface = record
      parent_iface : TGTypeInterface;
      get_g_type : function (self:PGeeQueue):TGType;cdecl;
      get_g_dup_func : function (self:PGeeQueue):TGBoxedCopyFunc;cdecl;
      get_g_destroy_func : function (self:PGeeQueue):TGDestroyNotify;cdecl;
      offer : function (self:PGeeQueue; element:Tgconstpointer):Tgboolean;cdecl;
      peek : function (self:PGeeQueue):Tgpointer;cdecl;
      poll : function (self:PGeeQueue):Tgpointer;cdecl;
      drain : function (self:PGeeQueue; recipient:PGeeCollection; amount:Tgint):Tgint;cdecl;
      get_capacity : function (self:PGeeQueue):Tgint;cdecl;
      get_remaining_capacity : function (self:PGeeQueue):Tgint;cdecl;
      get_is_full : function (self:PGeeQueue):Tgboolean;cdecl;
    end;

  PGeeAbstractQueue = ^TGeeAbstractQueue;
  TGeeAbstractQueue = record
      parent_instance : TGeeAbstractCollection;
      priv : PGeeAbstractQueuePrivate;
    end;

  PGeeAbstractQueueClass = ^TGeeAbstractQueueClass;
  TGeeAbstractQueueClass = record
      parent_class : TGeeAbstractCollectionClass;
      peek : function (self:PGeeAbstractQueue):Tgpointer;cdecl;
      poll : function (self:PGeeAbstractQueue):Tgpointer;cdecl;
      reserved0 : procedure (self:PGeeAbstractQueue);cdecl;
      reserved1 : procedure (self:PGeeAbstractQueue);cdecl;
      reserved2 : procedure (self:PGeeAbstractQueue);cdecl;
      reserved3 : procedure (self:PGeeAbstractQueue);cdecl;
      reserved4 : procedure (self:PGeeAbstractQueue);cdecl;
      reserved5 : procedure (self:PGeeAbstractQueue);cdecl;
      reserved6 : procedure (self:PGeeAbstractQueue);cdecl;
      reserved7 : procedure (self:PGeeAbstractQueue);cdecl;
      reserved8 : procedure (self:PGeeAbstractQueue);cdecl;
      reserved9 : procedure (self:PGeeAbstractQueue);cdecl;
      get_capacity : function (self:PGeeAbstractQueue):Tgint;cdecl;
      get_remaining_capacity : function (self:PGeeAbstractQueue):Tgint;cdecl;
      get_is_full : function (self:PGeeAbstractQueue):Tgboolean;cdecl;
    end;

  PGeeArrayList = ^TGeeArrayList;
  TGeeArrayList = record
      parent_instance : TGeeAbstractBidirList;
      priv : PGeeArrayListPrivate;
      _items : Pgpointer;
      _items_length1 : Tgint;
      __items_size_ : Tgint;
      _size : Tgint;
    end;

  PGeeArrayListClass = ^TGeeArrayListClass;
  TGeeArrayListClass = record
      parent_class : TGeeAbstractBidirListClass;
    end;

  PGeeDequeIface = ^TGeeDequeIface;
  TGeeDequeIface = record
      parent_iface : TGTypeInterface;
      get_g_type : function (self:PGeeDeque):TGType;cdecl;
      get_g_dup_func : function (self:PGeeDeque):TGBoxedCopyFunc;cdecl;
      get_g_destroy_func : function (self:PGeeDeque):TGDestroyNotify;cdecl;
      offer_head : function (self:PGeeDeque; element:Tgconstpointer):Tgboolean;cdecl;
      peek_head : function (self:PGeeDeque):Tgpointer;cdecl;
      poll_head : function (self:PGeeDeque):Tgpointer;cdecl;
      drain_head : function (self:PGeeDeque; recipient:PGeeCollection; amount:Tgint):Tgint;cdecl;
      offer_tail : function (self:PGeeDeque; element:Tgconstpointer):Tgboolean;cdecl;
      peek_tail : function (self:PGeeDeque):Tgpointer;cdecl;
      poll_tail : function (self:PGeeDeque):Tgpointer;cdecl;
      drain_tail : function (self:PGeeDeque; recipient:PGeeCollection; amount:Tgint):Tgint;cdecl;
    end;

  PGeeArrayQueue = ^TGeeArrayQueue;
  TGeeArrayQueue = record
      parent_instance : TGeeAbstractQueue;
      priv : PGeeArrayQueuePrivate;
    end;

  PGeeArrayQueueClass = ^TGeeArrayQueueClass;
  TGeeArrayQueueClass = record
      parent_class : TGeeAbstractQueueClass;
    end;

  PGeeComparableIface = ^TGeeComparableIface;
  TGeeComparableIface = record
      parent_iface : TGTypeInterface;
      compare_to : function (self:PGeeComparable; object:Tgconstpointer):Tgint;cdecl;
    end;

  PGeeConcurrentList = ^TGeeConcurrentList;
  TGeeConcurrentList = record
      parent_instance : TGeeAbstractList;
      priv : PGeeConcurrentListPrivate;
    end;

  PGeeConcurrentListClass = ^TGeeConcurrentListClass;
  TGeeConcurrentListClass = record
      parent_class : TGeeAbstractListClass;
    end;

  PGeeConcurrentSet = ^TGeeConcurrentSet;
  TGeeConcurrentSet = record
      parent_instance : TGeeAbstractSortedSet;
      priv : PGeeConcurrentSetPrivate;
    end;

  PGeeConcurrentSetClass = ^TGeeConcurrentSetClass;
  TGeeConcurrentSetClass = record
      parent_class : TGeeAbstractSortedSetClass;
    end;

    type
  PGeeFutureError = ^TGeeFutureError;
  TGeeFutureError =  Longint;
  Const
    GEE_FUTURE_ERROR_ABANDON_PROMISE = 0;
    GEE_FUTURE_ERROR_EXCEPTION = 1;


{ was #define dname def_expr }
function GEE_FUTURE_ERROR : longint; { return type might be wrong }

type
  PGeeFutureIface = ^TGeeFutureIface;
  TGeeFutureIface = record
      parent_iface : TGTypeInterface;
      get_g_type : function (self:PGeeFuture):TGType;cdecl;
      get_g_dup_func : function (self:PGeeFuture):TGBoxedCopyFunc;cdecl;
      get_g_destroy_func : function (self:PGeeFuture):TGDestroyNotify;cdecl;
      wait : function (self:PGeeFuture; error:PPGError):Tgconstpointer;cdecl;
      wait_until : function (self:PGeeFuture; end_time:Tgint64; value:Pgconstpointer; error:PPGError):Tgboolean;cdecl;
      wait_async : procedure (self:PGeeFuture; _callback_:TGAsyncReadyCallback; _user_data_:Tgpointer);cdecl;
      wait_finish : function (self:PGeeFuture; _res_:PGAsyncResult; error:PPGError):Tgconstpointer;cdecl;
      map : function (self:PGeeFuture; a_type:TGType; a_dup_func:TGBoxedCopyFunc; a_destroy_func:TGDestroyNotify; func:TGeeFutureMapFunc; 
                   func_target:Tgpointer; func_target_destroy_notify:TGDestroyNotify):PGeeFuture;cdecl;
      light_map : function (self:PGeeFuture; a_type:TGType; a_dup_func:TGBoxedCopyFunc; a_destroy_func:TGDestroyNotify; func:TGeeFutureLightMapFunc; 
                   func_target:Tgpointer):PGeeFuture;cdecl;
      zip : function (self:PGeeFuture; a_type:TGType; a_dup_func:TGBoxedCopyFunc; a_destroy_func:TGDestroyNotify; b_type:TGType; 
                   b_dup_func:TGBoxedCopyFunc; b_destroy_func:TGDestroyNotify; zip_func:TGeeFutureZipFunc; zip_func_target:Tgpointer; second:PGeeFuture):PGeeFuture;cdecl;
      flat_map : function (self:PGeeFuture; a_type:TGType; a_dup_func:TGBoxedCopyFunc; a_destroy_func:TGDestroyNotify; func:TGeeFutureFlatMapFunc; 
                   func_target:Tgpointer; func_target_destroy_notify:TGDestroyNotify):PGeeFuture;cdecl;
      get_value : function (self:PGeeFuture):Tgconstpointer;cdecl;
      get_ready : function (self:PGeeFuture):Tgboolean;cdecl;
      get_exception : function (self:PGeeFuture):PGError;cdecl;
      light_map_fixed : function (self:PGeeFuture; a_type:TGType; a_dup_func:TGBoxedCopyFunc; a_destroy_func:TGDestroyNotify; func:TGeeFutureLightMapFunc; 
                   func_target:Tgpointer; func_target_destroy_notify:TGDestroyNotify):PGeeFuture;cdecl;
    end;

  PGeeHashableIface = ^TGeeHashableIface;
  TGeeHashableIface = record
      parent_iface : TGTypeInterface;
      hash : function (self:PGeeHashable):Tguint;cdecl;
      equal_to : function (self:PGeeHashable; object:Tgconstpointer):Tgboolean;cdecl;
    end;

  PGeeHashMap = ^TGeeHashMap;
  TGeeHashMap = record
      parent_instance : TGeeAbstractMap;
      priv : PGeeHashMapPrivate;
    end;

  PGeeHashMapClass = ^TGeeHashMapClass;
  TGeeHashMapClass = record
      parent_class : TGeeAbstractMapClass;
    end;

  PGeeHashMultiMap = ^TGeeHashMultiMap;
  TGeeHashMultiMap = record
      parent_instance : TGeeAbstractMultiMap;
      priv : PGeeHashMultiMapPrivate;
    end;

  PGeeHashMultiMapClass = ^TGeeHashMultiMapClass;
  TGeeHashMultiMapClass = record
      parent_class : TGeeAbstractMultiMapClass;
    end;

  PGeeHashMultiSet = ^TGeeHashMultiSet;
  TGeeHashMultiSet = record
      parent_instance : TGeeAbstractMultiSet;
      priv : PGeeHashMultiSetPrivate;
    end;

  PGeeHashMultiSetClass = ^TGeeHashMultiSetClass;
  TGeeHashMultiSetClass = record
      parent_class : TGeeAbstractMultiSetClass;
    end;

  PGeeHashSet = ^TGeeHashSet;
  TGeeHashSet = record
      parent_instance : TGeeAbstractSet;
      priv : PGeeHashSetPrivate;
    end;

  PGeeHashSetClass = ^TGeeHashSetClass;
  TGeeHashSetClass = record
      parent_class : TGeeAbstractSetClass;
    end;

  PGeeHazardPointer = ^TGeeHazardPointer;
  TGeeHazardPointer = record
      _node : PGeeHazardPointerNode;
    end;

  PGeeHazardPointerContext = ^TGeeHazardPointerContext;
  TGeeHazardPointerContext = record
      _parent : PGeeHazardPointerContext;
      _to_free : PGeeArrayList;
      _policy : PGeeHazardPointerPolicy;
    end;

  PGeeLazy = ^TGeeLazy;
  TGeeLazy = record
      parent_instance : TGTypeInstance;
      ref_count : longint;
      priv : PGeeLazyPrivate;
    end;

  PGeeLazyClass = ^TGeeLazyClass;
  TGeeLazyClass = record
      parent_class : TGTypeClass;
      finalize : procedure (self:PGeeLazy);cdecl;
    end;

  PGeeLinkedList = ^TGeeLinkedList;
  TGeeLinkedList = record
      parent_instance : TGeeAbstractBidirList;
      priv : PGeeLinkedListPrivate;
    end;

  PGeeLinkedListClass = ^TGeeLinkedListClass;
  TGeeLinkedListClass = record
      parent_class : TGeeAbstractBidirListClass;
    end;

  PGeeMapEntry = ^TGeeMapEntry;
  TGeeMapEntry = record
      parent_instance : TGObject;
      priv : PGeeMapEntryPrivate;
    end;

  PGeeMapEntryClass = ^TGeeMapEntryClass;
  TGeeMapEntryClass = record
      parent_class : TGObjectClass;
      get_key : function (self:PGeeMapEntry):Tgconstpointer;cdecl;
      get_value : function (self:PGeeMapEntry):Tgconstpointer;cdecl;
      set_value : procedure (self:PGeeMapEntry; value:Tgconstpointer);cdecl;
      get_read_only : function (self:PGeeMapEntry):Tgboolean;cdecl;
    end;

  PGeePriorityQueue = ^TGeePriorityQueue;
  TGeePriorityQueue = record
      parent_instance : TGeeAbstractQueue;
      priv : PGeePriorityQueuePrivate;
    end;

  PGeePriorityQueueClass = ^TGeePriorityQueueClass;
  TGeePriorityQueueClass = record
      parent_class : TGeeAbstractQueueClass;
    end;

  PGeePromise = ^TGeePromise;
  TGeePromise = record
      parent_instance : TGTypeInstance;
      ref_count : longint;
      priv : PGeePromisePrivate;
    end;

  PGeePromiseClass = ^TGeePromiseClass;
  TGeePromiseClass = record
      parent_class : TGTypeClass;
      finalize : procedure (self:PGeePromise);cdecl;
    end;

  PGeeTreeMap = ^TGeeTreeMap;
  TGeeTreeMap = record
      parent_instance : TGeeAbstractBidirSortedMap;
      priv : PGeeTreeMapPrivate;
    end;

  PGeeTreeMapClass = ^TGeeTreeMapClass;
  TGeeTreeMapClass = record
      parent_class : TGeeAbstractBidirSortedMapClass;
    end;

  PGeeTreeMultiMap = ^TGeeTreeMultiMap;
  TGeeTreeMultiMap = record
      parent_instance : TGeeAbstractMultiMap;
      priv : PGeeTreeMultiMapPrivate;
    end;

  PGeeTreeMultiMapClass = ^TGeeTreeMultiMapClass;
  TGeeTreeMultiMapClass = record
      parent_class : TGeeAbstractMultiMapClass;
    end;

  PGeeTreeMultiSet = ^TGeeTreeMultiSet;
  TGeeTreeMultiSet = record
      parent_instance : TGeeAbstractMultiSet;
      priv : PGeeTreeMultiSetPrivate;
    end;

  PGeeTreeMultiSetClass = ^TGeeTreeMultiSetClass;
  TGeeTreeMultiSetClass = record
      parent_class : TGeeAbstractMultiSetClass;
    end;

  PGeeTreeSet = ^TGeeTreeSet;
  TGeeTreeSet = record
      parent_instance : TGeeAbstractBidirSortedSet;
      priv : PGeeTreeSetPrivate;
    end;

  PGeeTreeSetClass = ^TGeeTreeSetClass;
  TGeeTreeSetClass = record
      parent_class : TGeeAbstractBidirSortedSetClass;
    end;

  PGeeUnrolledLinkedList = ^TGeeUnrolledLinkedList;
  TGeeUnrolledLinkedList = record
      parent_instance : TGeeAbstractBidirList;
      priv : PGeeUnrolledLinkedListPrivate;
    end;

  PGeeUnrolledLinkedListClass = ^TGeeUnrolledLinkedListClass;
  TGeeUnrolledLinkedListClass = record
      parent_class : TGeeAbstractBidirListClass;
    end;

function gee_traversable_stream_get_type:TGType;cdecl;external libexttextcat;
function gee_lazy_ref(instance:Tgpointer):Tgpointer;cdecl;external libexttextcat;
procedure gee_lazy_unref(instance:Tgpointer);cdecl;external libexttextcat;
function gee_param_spec_lazy(name:Pgchar; nick:Pgchar; blurb:Pgchar; object_type:TGType; flags:TGParamFlags):PGParamSpec;cdecl;external libexttextcat;
procedure gee_value_set_lazy(value:PGValue; v_object:Tgpointer);cdecl;external libexttextcat;
procedure gee_value_take_lazy(value:PGValue; v_object:Tgpointer);cdecl;external libexttextcat;
function gee_value_get_lazy(value:PGValue):Tgpointer;cdecl;external libexttextcat;
function gee_lazy_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeLazy, gee_lazy_unref) }
function gee_iterator_get_type:TGType;cdecl;external libexttextcat;
function gee_traversable_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeTraversable, g_object_unref) }
function gee_iterable_get_type:TGType;cdecl;external libexttextcat;
function gee_collection_get_type:TGType;cdecl;external libexttextcat;
function gee_abstract_collection_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeAbstractCollection, g_object_unref) }
function gee_list_iterator_get_type:TGType;cdecl;external libexttextcat;
function gee_list_get_type:TGType;cdecl;external libexttextcat;
function gee_abstract_list_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeAbstractList, g_object_unref) }
function gee_bidir_iterator_get_type:TGType;cdecl;external libexttextcat;
function gee_bidir_list_iterator_get_type:TGType;cdecl;external libexttextcat;
function gee_bidir_list_get_type:TGType;cdecl;external libexttextcat;
function gee_abstract_bidir_list_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeAbstractBidirList, g_object_unref) }
function gee_abstract_bidir_list_bidir_list_iterator(self:PGeeAbstractBidirList):PGeeBidirListIterator;cdecl;external libexttextcat;
function gee_abstract_bidir_list_construct(object_type:TGType; g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify):PGeeAbstractBidirList;cdecl;external libexttextcat;
function gee_abstract_bidir_list_get_read_only_view(self:PGeeAbstractBidirList):PGeeBidirList;cdecl;external libexttextcat;
function gee_set_get_type:TGType;cdecl;external libexttextcat;
function gee_abstract_set_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeAbstractSet, g_object_unref) }
function gee_sorted_set_get_type:TGType;cdecl;external libexttextcat;
function gee_abstract_sorted_set_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeAbstractSortedSet, g_object_unref) }
function gee_bidir_sorted_set_get_type:TGType;cdecl;external libexttextcat;
function gee_abstract_bidir_sorted_set_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeAbstractBidirSortedSet, g_object_unref) }
function gee_abstract_bidir_sorted_set_bidir_iterator(self:PGeeAbstractBidirSortedSet):PGeeBidirIterator;cdecl;external libexttextcat;
function gee_abstract_bidir_sorted_set_construct(object_type:TGType; g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify):PGeeAbstractBidirSortedSet;cdecl;external libexttextcat;
function gee_abstract_bidir_sorted_set_get_read_only_view(self:PGeeAbstractBidirSortedSet):PGeeBidirSortedSet;cdecl;external libexttextcat;
function gee_map_iterator_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeMapIterator, g_object_unref) }
function gee_map_entry_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeMapEntry, g_object_unref) }
function gee_map_get_type:TGType;cdecl;external libexttextcat;
function gee_abstract_map_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeAbstractMap, g_object_unref) }
function gee_sorted_map_get_type:TGType;cdecl;external libexttextcat;
function gee_abstract_sorted_map_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeAbstractSortedMap, g_object_unref) }
function gee_bidir_map_iterator_get_type:TGType;cdecl;external libexttextcat;
function gee_bidir_sorted_map_get_type:TGType;cdecl;external libexttextcat;
function gee_abstract_bidir_sorted_map_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeAbstractBidirSortedMap, g_object_unref) }
function gee_abstract_bidir_sorted_map_bidir_map_iterator(self:PGeeAbstractBidirSortedMap):PGeeBidirMapIterator;cdecl;external libexttextcat;
function gee_abstract_bidir_sorted_map_construct(object_type:TGType; k_type:TGType; k_dup_func:TGBoxedCopyFunc; k_destroy_func:TGDestroyNotify; v_type:TGType; 
           v_dup_func:TGBoxedCopyFunc; v_destroy_func:TGDestroyNotify):PGeeAbstractBidirSortedMap;cdecl;external libexttextcat;
function gee_abstract_bidir_sorted_map_get_read_only_view(self:PGeeAbstractBidirSortedMap):PGeeBidirSortedMap;cdecl;external libexttextcat;
function gee_abstract_collection_contains(self:PGeeAbstractCollection; item:Tgconstpointer):Tgboolean;cdecl;external libexttextcat;
function gee_abstract_collection_add(self:PGeeAbstractCollection; item:Tgconstpointer):Tgboolean;cdecl;external libexttextcat;
function gee_abstract_collection_remove(self:PGeeAbstractCollection; item:Tgconstpointer):Tgboolean;cdecl;external libexttextcat;
procedure gee_abstract_collection_clear(self:PGeeAbstractCollection);cdecl;external libexttextcat;
function gee_abstract_collection_iterator(self:PGeeAbstractCollection):PGeeIterator;cdecl;external libexttextcat;
function gee_abstract_collection_foreach(self:PGeeAbstractCollection; f:TGeeForallFunc; f_target:Tgpointer):Tgboolean;cdecl;external libexttextcat;
function gee_abstract_collection_construct(object_type:TGType; g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify):PGeeAbstractCollection;cdecl;external libexttextcat;
function gee_abstract_collection_get_size(self:PGeeAbstractCollection):Tgint;cdecl;external libexttextcat;
function gee_abstract_collection_get_read_only(self:PGeeAbstractCollection):Tgboolean;cdecl;external libexttextcat;
function gee_abstract_collection_get_read_only_view(self:PGeeAbstractCollection):PGeeCollection;cdecl;external libexttextcat;
function gee_abstract_list_list_iterator(self:PGeeAbstractList):PGeeListIterator;cdecl;external libexttextcat;
function gee_abstract_list_get(self:PGeeAbstractList; index:Tgint):Tgpointer;cdecl;external libexttextcat;
procedure gee_abstract_list_set(self:PGeeAbstractList; index:Tgint; item:Tgconstpointer);cdecl;external libexttextcat;
function gee_abstract_list_index_of(self:PGeeAbstractList; item:Tgconstpointer):Tgint;cdecl;external libexttextcat;
procedure gee_abstract_list_insert(self:PGeeAbstractList; index:Tgint; item:Tgconstpointer);cdecl;external libexttextcat;
function gee_abstract_list_remove_at(self:PGeeAbstractList; index:Tgint):Tgpointer;cdecl;external libexttextcat;
function gee_abstract_list_slice(self:PGeeAbstractList; start:Tgint; stop:Tgint):PGeeList;cdecl;external libexttextcat;
function gee_abstract_list_construct(object_type:TGType; g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify):PGeeAbstractList;cdecl;external libexttextcat;
function gee_abstract_list_get_read_only_view(self:PGeeAbstractList):PGeeList;cdecl;external libexttextcat;
function gee_abstract_map_has_key(self:PGeeAbstractMap; key:Tgconstpointer):Tgboolean;cdecl;external libexttextcat;
function gee_abstract_map_has(self:PGeeAbstractMap; key:Tgconstpointer; value:Tgconstpointer):Tgboolean;cdecl;external libexttextcat;
function gee_abstract_map_get(self:PGeeAbstractMap; key:Tgconstpointer):Tgpointer;cdecl;external libexttextcat;
procedure gee_abstract_map_set(self:PGeeAbstractMap; key:Tgconstpointer; value:Tgconstpointer);cdecl;external libexttextcat;
function gee_abstract_map_unset(self:PGeeAbstractMap; key:Tgconstpointer; value:Pgpointer):Tgboolean;cdecl;external libexttextcat;
function gee_abstract_map_map_iterator(self:PGeeAbstractMap):PGeeMapIterator;cdecl;external libexttextcat;
procedure gee_abstract_map_clear(self:PGeeAbstractMap);cdecl;external libexttextcat;
function gee_abstract_map_foreach(self:PGeeAbstractMap; f:TGeeForallFunc; f_target:Tgpointer):Tgboolean;cdecl;external libexttextcat;
function gee_abstract_map_stream(self:PGeeAbstractMap; a_type:TGType; a_dup_func:TGBoxedCopyFunc; a_destroy_func:TGDestroyNotify; f:TGeeStreamFunc; 
           f_target:Tgpointer; f_target_destroy_notify:TGDestroyNotify):PGeeIterator;cdecl;external libexttextcat;
function gee_abstract_map_construct(object_type:TGType; k_type:TGType; k_dup_func:TGBoxedCopyFunc; k_destroy_func:TGDestroyNotify; v_type:TGType; 
           v_dup_func:TGBoxedCopyFunc; v_destroy_func:TGDestroyNotify):PGeeAbstractMap;cdecl;external libexttextcat;
function gee_abstract_map_get_size(self:PGeeAbstractMap):Tgint;cdecl;external libexttextcat;
function gee_abstract_map_get_read_only(self:PGeeAbstractMap):Tgboolean;cdecl;external libexttextcat;
function gee_abstract_map_get_keys(self:PGeeAbstractMap):PGeeSet;cdecl;external libexttextcat;
function gee_abstract_map_get_values(self:PGeeAbstractMap):PGeeCollection;cdecl;external libexttextcat;
function gee_abstract_map_get_entries(self:PGeeAbstractMap):PGeeSet;cdecl;external libexttextcat;
function gee_abstract_map_get_read_only_view(self:PGeeAbstractMap):PGeeMap;cdecl;external libexttextcat;
function gee_multi_set_get_type:TGType;cdecl;external libexttextcat;
function gee_multi_map_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeMultiMap, g_object_unref) }
function gee_abstract_multi_map_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeAbstractMultiMap, g_object_unref) }
function gee_abstract_multi_map_construct(object_type:TGType; k_type:TGType; k_dup_func:TGBoxedCopyFunc; k_destroy_func:TGDestroyNotify; v_type:TGType; 
           v_dup_func:TGBoxedCopyFunc; v_destroy_func:TGDestroyNotify; storage_map:PGeeMap):PGeeAbstractMultiMap;cdecl;external libexttextcat;
function gee_abstract_multi_map_create_value_storage(self:PGeeAbstractMultiMap):PGeeCollection;cdecl;external libexttextcat;
function gee_abstract_multi_map_create_multi_key_set(self:PGeeAbstractMultiMap):PGeeMultiSet;cdecl;external libexttextcat;
function gee_abstract_multi_map_get_value_equal_func(self:PGeeAbstractMultiMap; result_target:Pgpointer; result_target_destroy_notify:PGDestroyNotify):TGeeEqualDataFunc;cdecl;external libexttextcat;
function gee_abstract_multi_map_get_read_only_view(self:PGeeAbstractMultiMap):PGeeMultiMap;cdecl;external libexttextcat;
function gee_abstract_multi_set_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeAbstractMultiSet, g_object_unref) }
function gee_abstract_multi_set_construct(object_type:TGType; g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; storage_map:PGeeMap):PGeeAbstractMultiSet;cdecl;external libexttextcat;
function gee_abstract_multi_set_get_read_only_view(self:PGeeAbstractMultiSet):PGeeMultiSet;cdecl;external libexttextcat;
function gee_queue_get_type:TGType;cdecl;external libexttextcat;
function gee_abstract_queue_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeAbstractQueue, g_object_unref) }
function gee_abstract_queue_peek(self:PGeeAbstractQueue):Tgpointer;cdecl;external libexttextcat;
function gee_abstract_queue_poll(self:PGeeAbstractQueue):Tgpointer;cdecl;external libexttextcat;
function gee_abstract_queue_construct(object_type:TGType; g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify):PGeeAbstractQueue;cdecl;external libexttextcat;
function gee_abstract_queue_get_capacity(self:PGeeAbstractQueue):Tgint;cdecl;external libexttextcat;
function gee_abstract_queue_get_remaining_capacity(self:PGeeAbstractQueue):Tgint;cdecl;external libexttextcat;
function gee_abstract_queue_get_is_full(self:PGeeAbstractQueue):Tgboolean;cdecl;external libexttextcat;
function gee_abstract_set_construct(object_type:TGType; g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify):PGeeAbstractSet;cdecl;external libexttextcat;
function gee_abstract_set_get_read_only_view(self:PGeeAbstractSet):PGeeSet;cdecl;external libexttextcat;
function gee_abstract_sorted_map_head_map(self:PGeeAbstractSortedMap; before:Tgconstpointer):PGeeSortedMap;cdecl;external libexttextcat;
function gee_abstract_sorted_map_tail_map(self:PGeeAbstractSortedMap; after:Tgconstpointer):PGeeSortedMap;cdecl;external libexttextcat;
function gee_abstract_sorted_map_sub_map(self:PGeeAbstractSortedMap; before:Tgconstpointer; after:Tgconstpointer):PGeeSortedMap;cdecl;external libexttextcat;
function gee_abstract_sorted_map_construct(object_type:TGType; k_type:TGType; k_dup_func:TGBoxedCopyFunc; k_destroy_func:TGDestroyNotify; v_type:TGType; 
           v_dup_func:TGBoxedCopyFunc; v_destroy_func:TGDestroyNotify):PGeeAbstractSortedMap;cdecl;external libexttextcat;
function gee_abstract_sorted_map_get_ascending_keys(self:PGeeAbstractSortedMap):PGeeSortedSet;cdecl;external libexttextcat;
function gee_abstract_sorted_map_get_ascending_entries(self:PGeeAbstractSortedMap):PGeeSortedSet;cdecl;external libexttextcat;
function gee_abstract_sorted_set_first(self:PGeeAbstractSortedSet):Tgpointer;cdecl;external libexttextcat;
function gee_abstract_sorted_set_last(self:PGeeAbstractSortedSet):Tgpointer;cdecl;external libexttextcat;
function gee_abstract_sorted_set_iterator_at(self:PGeeAbstractSortedSet; element:Tgconstpointer):PGeeIterator;cdecl;external libexttextcat;
function gee_abstract_sorted_set_lower(self:PGeeAbstractSortedSet; element:Tgconstpointer):Tgpointer;cdecl;external libexttextcat;
function gee_abstract_sorted_set_higher(self:PGeeAbstractSortedSet; element:Tgconstpointer):Tgpointer;cdecl;external libexttextcat;
function gee_abstract_sorted_set_floor(self:PGeeAbstractSortedSet; element:Tgconstpointer):Tgpointer;cdecl;external libexttextcat;
function gee_abstract_sorted_set_ceil(self:PGeeAbstractSortedSet; element:Tgconstpointer):Tgpointer;cdecl;external libexttextcat;
function gee_abstract_sorted_set_head_set(self:PGeeAbstractSortedSet; before:Tgconstpointer):PGeeSortedSet;cdecl;external libexttextcat;
function gee_abstract_sorted_set_tail_set(self:PGeeAbstractSortedSet; after:Tgconstpointer):PGeeSortedSet;cdecl;external libexttextcat;
function gee_abstract_sorted_set_sub_set(self:PGeeAbstractSortedSet; from:Tgconstpointer; to:Tgconstpointer):PGeeSortedSet;cdecl;external libexttextcat;
function gee_abstract_sorted_set_construct(object_type:TGType; g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify):PGeeAbstractSortedSet;cdecl;external libexttextcat;
function gee_abstract_sorted_set_get_read_only_view(self:PGeeAbstractSortedSet):PGeeSortedSet;cdecl;external libexttextcat;
function gee_array_list_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeArrayList, g_object_unref) }
function gee_array_list_new(g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; equal_func:TGeeEqualDataFunc; equal_func_target:Tgpointer; 
           equal_func_target_destroy_notify:TGDestroyNotify):PGeeArrayList;cdecl;external libexttextcat;
function gee_array_list_construct(object_type:TGType; g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; equal_func:TGeeEqualDataFunc; 
           equal_func_target:Tgpointer; equal_func_target_destroy_notify:TGDestroyNotify):PGeeArrayList;cdecl;external libexttextcat;
function gee_array_list_new_wrap(g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; items:Pgpointer; items_length1:Tgint; 
           equal_func:TGeeEqualDataFunc; equal_func_target:Tgpointer; equal_func_target_destroy_notify:TGDestroyNotify):PGeeArrayList;cdecl;external libexttextcat;
function gee_array_list_construct_wrap(object_type:TGType; g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; items:Pgpointer; 
           items_length1:Tgint; equal_func:TGeeEqualDataFunc; equal_func_target:Tgpointer; equal_func_target_destroy_notify:TGDestroyNotify):PGeeArrayList;cdecl;external libexttextcat;
function gee_array_list_add_all(self:PGeeArrayList; collection:PGeeCollection):Tgboolean;cdecl;external libexttextcat;
function gee_array_list_get_equal_func(self:PGeeArrayList; result_target:Pgpointer):TGeeEqualDataFunc;cdecl;external libexttextcat;
function gee_deque_get_type:TGType;cdecl;external libexttextcat;
function gee_array_queue_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeArrayQueue, g_object_unref) }
function gee_array_queue_new(g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; equal_func:TGeeEqualDataFunc; equal_func_target:Tgpointer; 
           equal_func_target_destroy_notify:TGDestroyNotify):PGeeArrayQueue;cdecl;external libexttextcat;
function gee_array_queue_construct(object_type:TGType; g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; equal_func:TGeeEqualDataFunc; 
           equal_func_target:Tgpointer; equal_func_target_destroy_notify:TGDestroyNotify):PGeeArrayQueue;cdecl;external libexttextcat;
function gee_array_queue_get_equal_func(self:PGeeArrayQueue; result_target:Pgpointer):TGeeEqualDataFunc;cdecl;external libexttextcat;
function gee_array_queue_get_is_empty(self:PGeeArrayQueue):Tgboolean;cdecl;external libexttextcat;
function gee_bidir_iterator_previous(self:PGeeBidirIterator):Tgboolean;cdecl;external libexttextcat;
function gee_bidir_iterator_has_previous(self:PGeeBidirIterator):Tgboolean;cdecl;external libexttextcat;
function gee_bidir_iterator_first(self:PGeeBidirIterator):Tgboolean;cdecl;external libexttextcat;
function gee_bidir_iterator_last(self:PGeeBidirIterator):Tgboolean;cdecl;external libexttextcat;
function gee_bidir_list_bidir_list_iterator(self:PGeeBidirList):PGeeBidirListIterator;cdecl;external libexttextcat;
function gee_bidir_list_get_read_only_view(self:PGeeBidirList):PGeeBidirList;cdecl;external libexttextcat;
procedure gee_bidir_list_iterator_insert(self:PGeeBidirListIterator; item:Tgconstpointer);cdecl;external libexttextcat;
function gee_bidir_map_iterator_previous(self:PGeeBidirMapIterator):Tgboolean;cdecl;external libexttextcat;
function gee_bidir_map_iterator_has_previous(self:PGeeBidirMapIterator):Tgboolean;cdecl;external libexttextcat;
function gee_bidir_map_iterator_first(self:PGeeBidirMapIterator):Tgboolean;cdecl;external libexttextcat;
function gee_bidir_map_iterator_last(self:PGeeBidirMapIterator):Tgboolean;cdecl;external libexttextcat;
function gee_bidir_sorted_set_bidir_iterator(self:PGeeBidirSortedSet):PGeeBidirIterator;cdecl;external libexttextcat;
function gee_bidir_sorted_set_empty(g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify):PGeeBidirSortedSet;cdecl;external libexttextcat;
function gee_bidir_sorted_set_get_read_only_view(self:PGeeBidirSortedSet):PGeeBidirSortedSet;cdecl;external libexttextcat;
function gee_bidir_sorted_map_bidir_map_iterator(self:PGeeBidirSortedMap):PGeeBidirMapIterator;cdecl;external libexttextcat;
function gee_bidir_sorted_map_empty(k_type:TGType; k_dup_func:TGBoxedCopyFunc; k_destroy_func:TGDestroyNotify; v_type:TGType; v_dup_func:TGBoxedCopyFunc; 
           v_destroy_func:TGDestroyNotify):PGeeBidirSortedMap;cdecl;external libexttextcat;
function gee_bidir_sorted_map_get_read_only_view(self:PGeeBidirSortedMap):PGeeBidirSortedMap;cdecl;external libexttextcat;
function gee_collection_contains(self:PGeeCollection; item:Tgconstpointer):Tgboolean;cdecl;external libexttextcat;
function gee_collection_add(self:PGeeCollection; item:Tgconstpointer):Tgboolean;cdecl;external libexttextcat;
function gee_collection_remove(self:PGeeCollection; item:Tgconstpointer):Tgboolean;cdecl;external libexttextcat;
procedure gee_collection_clear(self:PGeeCollection);cdecl;external libexttextcat;
function gee_collection_add_all(self:PGeeCollection; collection:PGeeCollection):Tgboolean;cdecl;external libexttextcat;
function gee_collection_contains_all(self:PGeeCollection; collection:PGeeCollection):Tgboolean;cdecl;external libexttextcat;
function gee_collection_remove_all(self:PGeeCollection; collection:PGeeCollection):Tgboolean;cdecl;external libexttextcat;
function gee_collection_retain_all(self:PGeeCollection; collection:PGeeCollection):Tgboolean;cdecl;external libexttextcat;
function gee_collection_to_array(self:PGeeCollection; result_length1:Pgint):Pgpointer;cdecl;external libexttextcat;
function gee_collection_add_all_array(self:PGeeCollection; array:Pgpointer; array_length1:Tgint):Tgboolean;cdecl;external libexttextcat;
function gee_collection_contains_all_array(self:PGeeCollection; array:Pgpointer; array_length1:Tgint):Tgboolean;cdecl;external libexttextcat;
function gee_collection_remove_all_array(self:PGeeCollection; array:Pgpointer; array_length1:Tgint):Tgboolean;cdecl;external libexttextcat;
function gee_collection_add_all_iterator(self:PGeeCollection; iter:PGeeIterator):Tgboolean;cdecl;external libexttextcat;
function gee_collection_contains_all_iterator(self:PGeeCollection; iter:PGeeIterator):Tgboolean;cdecl;external libexttextcat;
function gee_collection_remove_all_iterator(self:PGeeCollection; iter:PGeeIterator):Tgboolean;cdecl;external libexttextcat;
function gee_collection_empty(g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify):PGeeCollection;cdecl;external libexttextcat;
function gee_collection_get_size(self:PGeeCollection):Tgint;cdecl;external libexttextcat;
function gee_collection_get_is_empty(self:PGeeCollection):Tgboolean;cdecl;external libexttextcat;
function gee_collection_get_read_only(self:PGeeCollection):Tgboolean;cdecl;external libexttextcat;
function gee_collection_get_read_only_view(self:PGeeCollection):PGeeCollection;cdecl;external libexttextcat;
function gee_comparable_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeComparable, g_object_unref) }
function gee_comparable_compare_to(self:PGeeComparable; object:Tgconstpointer):Tgint;cdecl;external libexttextcat;
function gee_concurrent_list_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeConcurrentList, g_object_unref) }
function gee_concurrent_list_new(g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; equal_func:TGeeEqualDataFunc; equal_func_target:Tgpointer; 
           equal_func_target_destroy_notify:TGDestroyNotify):PGeeConcurrentList;cdecl;external libexttextcat;
function gee_concurrent_list_construct(object_type:TGType; g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; equal_func:TGeeEqualDataFunc; 
           equal_func_target:Tgpointer; equal_func_target_destroy_notify:TGDestroyNotify):PGeeConcurrentList;cdecl;external libexttextcat;
function gee_concurrent_list_get_equal_func(self:PGeeConcurrentList; result_target:Pgpointer):TGeeEqualDataFunc;cdecl;external libexttextcat;
function gee_concurrent_list_get_is_empty(self:PGeeConcurrentList):Tgboolean;cdecl;external libexttextcat;
function gee_concurrent_set_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeConcurrentSet, g_object_unref) }
function gee_concurrent_set_range_type_get_type:TGType;cdecl;external libexttextcat;
function gee_concurrent_set_new(g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; compare_func:TGCompareDataFunc; compare_func_target:Tgpointer; 
           compare_func_target_destroy_notify:TGDestroyNotify):PGeeConcurrentSet;cdecl;external libexttextcat;
function gee_concurrent_set_construct(object_type:TGType; g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; compare_func:TGCompareDataFunc; 
           compare_func_target:Tgpointer; compare_func_target_destroy_notify:TGDestroyNotify):PGeeConcurrentSet;cdecl;external libexttextcat;
function gee_deque_offer_head(self:PGeeDeque; element:Tgconstpointer):Tgboolean;cdecl;external libexttextcat;
function gee_deque_peek_head(self:PGeeDeque):Tgpointer;cdecl;external libexttextcat;
function gee_deque_poll_head(self:PGeeDeque):Tgpointer;cdecl;external libexttextcat;
function gee_deque_drain_head(self:PGeeDeque; recipient:PGeeCollection; amount:Tgint):Tgint;cdecl;external libexttextcat;
function gee_deque_offer_tail(self:PGeeDeque; element:Tgconstpointer):Tgboolean;cdecl;external libexttextcat;
function gee_deque_peek_tail(self:PGeeDeque):Tgpointer;cdecl;external libexttextcat;
function gee_deque_poll_tail(self:PGeeDeque):Tgpointer;cdecl;external libexttextcat;
function gee_deque_drain_tail(self:PGeeDeque; recipient:PGeeCollection; amount:Tgint):Tgint;cdecl;external libexttextcat;
function gee_functions_get_equal_func_for(t:TGType; result_target:Pgpointer; result_target_destroy_notify:PGDestroyNotify):TGeeEqualDataFunc;cdecl;external libexttextcat;
function gee_functions_get_hash_func_for(t:TGType; result_target:Pgpointer; result_target_destroy_notify:PGDestroyNotify):TGeeHashDataFunc;cdecl;external libexttextcat;
function gee_functions_get_compare_func_for(t:TGType; result_target:Pgpointer; result_target_destroy_notify:PGDestroyNotify):TGCompareDataFunc;cdecl;external libexttextcat;
function gee_future_error_quark:TGQuark;cdecl;external libexttextcat;
function gee_future_error_get_type:TGType;cdecl;external libexttextcat;
function gee_future_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeFuture, g_object_unref) }
function gee_future_wait(self:PGeeFuture; error:PPGError):Tgconstpointer;cdecl;external libexttextcat;
function gee_future_wait_until(self:PGeeFuture; end_time:Tgint64; value:Pgconstpointer; error:PPGError):Tgboolean;cdecl;external libexttextcat;
procedure gee_future_wait_async(self:PGeeFuture; _callback_:TGAsyncReadyCallback; _user_data_:Tgpointer);cdecl;external libexttextcat;
function gee_future_wait_finish(self:PGeeFuture; _res_:PGAsyncResult; error:PPGError):Tgconstpointer;cdecl;external libexttextcat;
function gee_future_map(self:PGeeFuture; a_type:TGType; a_dup_func:TGBoxedCopyFunc; a_destroy_func:TGDestroyNotify; func:TGeeFutureMapFunc; 
           func_target:Tgpointer; func_target_destroy_notify:TGDestroyNotify):PGeeFuture;cdecl;external libexttextcat;
function gee_future_light_map_fixed(self:PGeeFuture; a_type:TGType; a_dup_func:TGBoxedCopyFunc; a_destroy_func:TGDestroyNotify; func:TGeeFutureLightMapFunc; 
           func_target:Tgpointer; func_target_destroy_notify:TGDestroyNotify):PGeeFuture;cdecl;external libexttextcat;
function gee_future_light_map(self:PGeeFuture; a_type:TGType; a_dup_func:TGBoxedCopyFunc; a_destroy_func:TGDestroyNotify; func:TGeeFutureLightMapFunc; 
           func_target:Tgpointer):PGeeFuture;cdecl;external libexttextcat;
function gee_future_zip(self:PGeeFuture; a_type:TGType; a_dup_func:TGBoxedCopyFunc; a_destroy_func:TGDestroyNotify; b_type:TGType; 
           b_dup_func:TGBoxedCopyFunc; b_destroy_func:TGDestroyNotify; zip_func:TGeeFutureZipFunc; zip_func_target:Tgpointer; second:PGeeFuture):PGeeFuture;cdecl;external libexttextcat;
function gee_future_flat_map(self:PGeeFuture; a_type:TGType; a_dup_func:TGBoxedCopyFunc; a_destroy_func:TGDestroyNotify; func:TGeeFutureFlatMapFunc; 
           func_target:Tgpointer; func_target_destroy_notify:TGDestroyNotify):PGeeFuture;cdecl;external libexttextcat;
function gee_future_get_value(self:PGeeFuture):Tgconstpointer;cdecl;external libexttextcat;
function gee_future_get_ready(self:PGeeFuture):Tgboolean;cdecl;external libexttextcat;
function gee_future_get_exception(self:PGeeFuture):PGError;cdecl;external libexttextcat;
function gee_hashable_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeHashable, g_object_unref) }
function gee_hashable_hash(self:PGeeHashable):Tguint;cdecl;external libexttextcat;
function gee_hashable_equal_to(self:PGeeHashable; object:Tgconstpointer):Tgboolean;cdecl;external libexttextcat;
function gee_hash_map_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeHashMap, g_object_unref) }
function gee_hash_map_new(k_type:TGType; k_dup_func:TGBoxedCopyFunc; k_destroy_func:TGDestroyNotify; v_type:TGType; v_dup_func:TGBoxedCopyFunc; 
           v_destroy_func:TGDestroyNotify; key_hash_func:TGeeHashDataFunc; key_hash_func_target:Tgpointer; key_hash_func_target_destroy_notify:TGDestroyNotify; key_equal_func:TGeeEqualDataFunc; 
           key_equal_func_target:Tgpointer; key_equal_func_target_destroy_notify:TGDestroyNotify; value_equal_func:TGeeEqualDataFunc; value_equal_func_target:Tgpointer; value_equal_func_target_destroy_notify:TGDestroyNotify):PGeeHashMap;cdecl;external libexttextcat;
function gee_hash_map_construct(object_type:TGType; k_type:TGType; k_dup_func:TGBoxedCopyFunc; k_destroy_func:TGDestroyNotify; v_type:TGType; 
           v_dup_func:TGBoxedCopyFunc; v_destroy_func:TGDestroyNotify; key_hash_func:TGeeHashDataFunc; key_hash_func_target:Tgpointer; key_hash_func_target_destroy_notify:TGDestroyNotify; 
           key_equal_func:TGeeEqualDataFunc; key_equal_func_target:Tgpointer; key_equal_func_target_destroy_notify:TGDestroyNotify; value_equal_func:TGeeEqualDataFunc; value_equal_func_target:Tgpointer; 
           value_equal_func_target_destroy_notify:TGDestroyNotify):PGeeHashMap;cdecl;external libexttextcat;
function gee_hash_map_get_key_hash_func(self:PGeeHashMap; result_target:Pgpointer):TGeeHashDataFunc;cdecl;external libexttextcat;
function gee_hash_map_get_key_equal_func(self:PGeeHashMap; result_target:Pgpointer):TGeeEqualDataFunc;cdecl;external libexttextcat;
function gee_hash_map_get_value_equal_func(self:PGeeHashMap; result_target:Pgpointer):TGeeEqualDataFunc;cdecl;external libexttextcat;
function gee_hash_multi_map_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeHashMultiMap, g_object_unref) }
function gee_hash_multi_map_new(k_type:TGType; k_dup_func:TGBoxedCopyFunc; k_destroy_func:TGDestroyNotify; v_type:TGType; v_dup_func:TGBoxedCopyFunc; 
           v_destroy_func:TGDestroyNotify; key_hash_func:TGeeHashDataFunc; key_hash_func_target:Tgpointer; key_hash_func_target_destroy_notify:TGDestroyNotify; key_equal_func:TGeeEqualDataFunc; 
           key_equal_func_target:Tgpointer; key_equal_func_target_destroy_notify:TGDestroyNotify; value_hash_func:TGeeHashDataFunc; value_hash_func_target:Tgpointer; value_hash_func_target_destroy_notify:TGDestroyNotify; 
           value_equal_func:TGeeEqualDataFunc; value_equal_func_target:Tgpointer; value_equal_func_target_destroy_notify:TGDestroyNotify):PGeeHashMultiMap;cdecl;external libexttextcat;
function gee_hash_multi_map_construct(object_type:TGType; k_type:TGType; k_dup_func:TGBoxedCopyFunc; k_destroy_func:TGDestroyNotify; v_type:TGType; 
           v_dup_func:TGBoxedCopyFunc; v_destroy_func:TGDestroyNotify; key_hash_func:TGeeHashDataFunc; key_hash_func_target:Tgpointer; key_hash_func_target_destroy_notify:TGDestroyNotify; 
           key_equal_func:TGeeEqualDataFunc; key_equal_func_target:Tgpointer; key_equal_func_target_destroy_notify:TGDestroyNotify; value_hash_func:TGeeHashDataFunc; value_hash_func_target:Tgpointer; 
           value_hash_func_target_destroy_notify:TGDestroyNotify; value_equal_func:TGeeEqualDataFunc; value_equal_func_target:Tgpointer; value_equal_func_target_destroy_notify:TGDestroyNotify):PGeeHashMultiMap;cdecl;external libexttextcat;
function gee_hash_multi_map_get_key_hash_func(self:PGeeHashMultiMap; result_target:Pgpointer):TGeeHashDataFunc;cdecl;external libexttextcat;
function gee_hash_multi_map_get_key_equal_func(self:PGeeHashMultiMap; result_target:Pgpointer):TGeeEqualDataFunc;cdecl;external libexttextcat;
function gee_hash_multi_map_get_value_hash_func(self:PGeeHashMultiMap; result_target:Pgpointer):TGeeHashDataFunc;cdecl;external libexttextcat;
function gee_hash_multi_map_get_value_equal_func(self:PGeeHashMultiMap; result_target:Pgpointer):TGeeEqualDataFunc;cdecl;external libexttextcat;
function gee_hash_multi_set_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeHashMultiSet, g_object_unref) }
function gee_hash_multi_set_new_fixed(g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; hash_func:TGeeHashDataFunc; hash_func_target:Tgpointer; 
           hash_func_target_destroy_notify:TGDestroyNotify; equal_func:TGeeEqualDataFunc; equal_func_target:Tgpointer; equal_func_target_destroy_notify:TGDestroyNotify):PGeeHashMultiSet;cdecl;external libexttextcat;
function gee_hash_multi_set_construct(object_type:TGType; g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; hash_func:TGeeHashDataFunc; 
           hash_func_target:Tgpointer; hash_func_target_destroy_notify:TGDestroyNotify; equal_func:TGeeEqualDataFunc; equal_func_target:Tgpointer; equal_func_target_destroy_notify:TGDestroyNotify):PGeeHashMultiSet;cdecl;external libexttextcat;
function gee_hash_multi_set_new(g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; hash_func:TGeeHashDataFunc; hash_func_target:Tgpointer; 
           equal_func:TGeeEqualDataFunc; equal_func_target:Tgpointer):PGeeHashMultiSet;cdecl;external libexttextcat;
{xxxxxxxxxxxx G_GNUC_DEPRECATED ; }
function gee_hash_multi_set_construct_broken(object_type:TGType; g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; hash_func:TGeeHashDataFunc; 
           hash_func_target:Tgpointer; equal_func:TGeeEqualDataFunc; equal_func_target:Tgpointer):PGeeHashMultiSet;cdecl;external libexttextcat;
{xxxxxxxxxxxx G_GNUC_DEPRECATED ; }
function gee_hash_multi_set_get_hash_func(self:PGeeHashMultiSet; result_target:Pgpointer):TGeeHashDataFunc;cdecl;external libexttextcat;
function gee_hash_multi_set_get_equal_func(self:PGeeHashMultiSet; result_target:Pgpointer):TGeeEqualDataFunc;cdecl;external libexttextcat;
function gee_hash_set_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeHashSet, g_object_unref) }
function gee_hash_set_new(g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; hash_func:TGeeHashDataFunc; hash_func_target:Tgpointer; 
           hash_func_target_destroy_notify:TGDestroyNotify; equal_func:TGeeEqualDataFunc; equal_func_target:Tgpointer; equal_func_target_destroy_notify:TGDestroyNotify):PGeeHashSet;cdecl;external libexttextcat;
function gee_hash_set_construct(object_type:TGType; g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; hash_func:TGeeHashDataFunc; 
           hash_func_target:Tgpointer; hash_func_target_destroy_notify:TGDestroyNotify; equal_func:TGeeEqualDataFunc; equal_func_target:Tgpointer; equal_func_target_destroy_notify:TGDestroyNotify):PGeeHashSet;cdecl;external libexttextcat;
function gee_hash_set_get_hash_func(self:PGeeHashSet; result_target:Pgpointer):TGeeHashDataFunc;cdecl;external libexttextcat;
function gee_hash_set_get_equal_func(self:PGeeHashSet; result_target:Pgpointer):TGeeEqualDataFunc;cdecl;external libexttextcat;
procedure gee_hazard_pointer_free(self:PGeeHazardPointer);cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeHazardPointer, gee_hazard_pointer_free) }
procedure gee_hazard_pointer_node_free(self:PGeeHazardPointerNode);cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeHazardPointerNode, gee_hazard_pointer_node_free) }
function gee_hazard_pointer_policy_get_type:TGType;cdecl;external libexttextcat;
function gee_hazard_pointer_policy_is_concrete(self:TGeeHazardPointerPolicy):Tgboolean;cdecl;external libexttextcat;
function gee_hazard_pointer_policy_is_blocking(self:TGeeHazardPointerPolicy):Tgboolean;cdecl;external libexttextcat;
function gee_hazard_pointer_policy_is_safe(self:TGeeHazardPointerPolicy):Tgboolean;cdecl;external libexttextcat;
function gee_hazard_pointer_policy_to_concrete(self:TGeeHazardPointerPolicy):TGeeHazardPointerPolicy;cdecl;external libexttextcat;
function gee_hazard_pointer_release_policy_get_type:TGType;cdecl;external libexttextcat;
function gee_hazard_pointer_new(ptr:Pgconstpointer):PGeeHazardPointer;cdecl;external libexttextcat;
function gee_hazard_pointer_get_hazard_pointer(g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; aptr:PPgconstpointer; mask:Tgsize; 
           mask_out:Pgsize):PGeeHazardPointer;cdecl;external libexttextcat;
function gee_hazard_pointer_get_pointer(g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; aptr:PPgconstpointer; mask:Tgsize; 
           mask_out:Pgsize):Tgpointer;cdecl;external libexttextcat;
function gee_hazard_pointer_exchange_hazard_pointer(g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; aptr:PPgconstpointer; new_ptr:Tgpointer; 
           mask:Tgsize; new_mask:Tgsize; old_mask:Pgsize):PGeeHazardPointer;cdecl;external libexttextcat;
procedure gee_hazard_pointer_set_pointer(g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; aptr:PPgconstpointer; new_ptr:Tgpointer; 
            mask:Tgsize; new_mask:Tgsize);cdecl;external libexttextcat;
function gee_hazard_pointer_exchange_pointer(g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; aptr:PPgconstpointer; new_ptr:Tgpointer; 
           mask:Tgsize; new_mask:Tgsize; old_mask:Pgsize):Tgpointer;cdecl;external libexttextcat;
function gee_hazard_pointer_compare_and_exchange_pointer(g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; aptr:PPgconstpointer; old_ptr:Tgconstpointer; 
           _new_ptr:Tgpointer; mask:Tgsize; old_mask:Tgsize; new_mask:Tgsize):Tgboolean;cdecl;external libexttextcat;
function gee_hazard_pointer_get(self:PGeeHazardPointer; other_thread:Tgboolean):Tgconstpointer;cdecl;external libexttextcat;
procedure gee_hazard_pointer_release(self:PGeeHazardPointer; notify:TGDestroyNotify);cdecl;external libexttextcat;
procedure gee_hazard_pointer_set_default_policy(policy:TGeeHazardPointerPolicy);cdecl;external libexttextcat;
procedure gee_hazard_pointer_set_thread_exit_policy(policy:TGeeHazardPointerPolicy);cdecl;external libexttextcat;
function gee_hazard_pointer_set_release_policy(policy:TGeeHazardPointerReleasePolicy):Tgboolean;cdecl;external libexttextcat;
procedure gee_hazard_pointer_context_free(self:PGeeHazardPointerContext);cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeHazardPointerContext, gee_hazard_pointer_context_free) }
procedure gee_hazard_pointer_free_node_free(self:PGeeHazardPointerFreeNode);cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeHazardPointerFreeNode, gee_hazard_pointer_free_node_free) }
function gee_hazard_pointer_context_new(policy:PGeeHazardPointerPolicy):PGeeHazardPointerContext;cdecl;external libexttextcat;
procedure gee_hazard_pointer_context_try_free(self:PGeeHazardPointerContext);cdecl;external libexttextcat;
procedure gee_hazard_pointer_context_free_all(self:PGeeHazardPointerContext);cdecl;external libexttextcat;
procedure gee_hazard_pointer_context_try_release(self:PGeeHazardPointerContext);cdecl;external libexttextcat;
procedure gee_hazard_pointer_context_release(self:PGeeHazardPointerContext);cdecl;external libexttextcat;
function gee_iterable_iterator(self:PGeeIterable):PGeeIterator;cdecl;external libexttextcat;
function gee_iterator_next(self:PGeeIterator):Tgboolean;cdecl;external libexttextcat;
function gee_iterator_has_next(self:PGeeIterator):Tgboolean;cdecl;external libexttextcat;
function gee_iterator_get(self:PGeeIterator):Tgpointer;cdecl;external libexttextcat;
procedure gee_iterator_remove(self:PGeeIterator);cdecl;external libexttextcat;
function gee_iterator_unfold(a_type:TGType; a_dup_func:TGBoxedCopyFunc; a_destroy_func:TGDestroyNotify; f:TGeeUnfoldFunc; f_target:Tgpointer; 
           f_target_destroy_notify:TGDestroyNotify; current:PGeeLazy):PGeeIterator;cdecl;external libexttextcat;
function gee_iterator_concat(g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; iters:PGeeIterator):PGeeIterator;cdecl;external libexttextcat;
function gee_iterator_get_valid(self:PGeeIterator):Tgboolean;cdecl;external libexttextcat;
function gee_iterator_get_read_only(self:PGeeIterator):Tgboolean;cdecl;external libexttextcat;
function gee_lazy_new(g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; func:TGeeLazyFunc; func_target:Tgpointer; 
           func_target_destroy_notify:TGDestroyNotify):PGeeLazy;cdecl;external libexttextcat;
function gee_lazy_construct(object_type:TGType; g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; func:TGeeLazyFunc; 
           func_target:Tgpointer; func_target_destroy_notify:TGDestroyNotify):PGeeLazy;cdecl;external libexttextcat;
function gee_lazy_new_from_value(g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; item:Tgconstpointer):PGeeLazy;cdecl;external libexttextcat;
function gee_lazy_construct_from_value(object_type:TGType; g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; item:Tgconstpointer):PGeeLazy;cdecl;external libexttextcat;
procedure gee_lazy_eval(self:PGeeLazy);cdecl;external libexttextcat;
function gee_lazy_get(self:PGeeLazy):Tgpointer;cdecl;external libexttextcat;
function gee_lazy_get_value(self:PGeeLazy):Tgconstpointer;cdecl;external libexttextcat;
function gee_lazy_get_future(self:PGeeLazy):PGeeFuture;cdecl;external libexttextcat;
function gee_linked_list_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeLinkedList, g_object_unref) }
function gee_linked_list_new(g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; equal_func:TGeeEqualDataFunc; equal_func_target:Tgpointer; 
           equal_func_target_destroy_notify:TGDestroyNotify):PGeeLinkedList;cdecl;external libexttextcat;
function gee_linked_list_construct(object_type:TGType; g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; equal_func:TGeeEqualDataFunc; 
           equal_func_target:Tgpointer; equal_func_target_destroy_notify:TGDestroyNotify):PGeeLinkedList;cdecl;external libexttextcat;
function gee_linked_list_first(self:PGeeLinkedList):Tgpointer;cdecl;external libexttextcat;
function gee_linked_list_last(self:PGeeLinkedList):Tgpointer;cdecl;external libexttextcat;
function gee_linked_list_get_equal_func(self:PGeeLinkedList; result_target:Pgpointer):TGeeEqualDataFunc;cdecl;external libexttextcat;
function gee_list_list_iterator(self:PGeeList):PGeeListIterator;cdecl;external libexttextcat;
function gee_list_get(self:PGeeList; index:Tgint):Tgpointer;cdecl;external libexttextcat;
procedure gee_list_set(self:PGeeList; index:Tgint; item:Tgconstpointer);cdecl;external libexttextcat;
function gee_list_index_of(self:PGeeList; item:Tgconstpointer):Tgint;cdecl;external libexttextcat;
procedure gee_list_insert(self:PGeeList; index:Tgint; item:Tgconstpointer);cdecl;external libexttextcat;
function gee_list_remove_at(self:PGeeList; index:Tgint):Tgpointer;cdecl;external libexttextcat;
function gee_list_slice(self:PGeeList; start:Tgint; stop:Tgint):PGeeList;cdecl;external libexttextcat;
function gee_list_first(self:PGeeList):Tgpointer;cdecl;external libexttextcat;
function gee_list_last(self:PGeeList):Tgpointer;cdecl;external libexttextcat;
procedure gee_list_insert_all(self:PGeeList; index:Tgint; collection:PGeeCollection);cdecl;external libexttextcat;
procedure gee_list_sort(self:PGeeList; compare_func:TGCompareDataFunc; compare_func_target:Tgpointer; compare_func_target_destroy_notify:TGDestroyNotify);cdecl;external libexttextcat;
function gee_list_empty(g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify):PGeeList;cdecl;external libexttextcat;
function gee_list_get_read_only_view(self:PGeeList):PGeeList;cdecl;external libexttextcat;
procedure gee_list_iterator_set(self:PGeeListIterator; item:Tgconstpointer);cdecl;external libexttextcat;
procedure gee_list_iterator_add(self:PGeeListIterator; item:Tgconstpointer);cdecl;external libexttextcat;
function gee_list_iterator_index(self:PGeeListIterator):Tgint;cdecl;external libexttextcat;
function gee_map_has_key(self:PGeeMap; key:Tgconstpointer):Tgboolean;cdecl;external libexttextcat;
function gee_map_contains(self:PGeeMap; key:Tgconstpointer):Tgboolean;cdecl;external libexttextcat;
{xxxxxxxxxxxx G_GNUC_DEPRECATED ; }
function gee_map_has(self:PGeeMap; key:Tgconstpointer; value:Tgconstpointer):Tgboolean;cdecl;external libexttextcat;
function gee_map_get(self:PGeeMap; key:Tgconstpointer):Tgpointer;cdecl;external libexttextcat;
procedure gee_map_set(self:PGeeMap; key:Tgconstpointer; value:Tgconstpointer);cdecl;external libexttextcat;
function gee_map_unset(self:PGeeMap; key:Tgconstpointer; value:Pgpointer):Tgboolean;cdecl;external libexttextcat;
function gee_map_remove(self:PGeeMap; key:Tgconstpointer; value:Pgpointer):Tgboolean;cdecl;external libexttextcat;
{xxxxxxxxxxxx G_GNUC_DEPRECATED ; }
procedure gee_map_clear(self:PGeeMap);cdecl;external libexttextcat;
function gee_map_map_iterator(self:PGeeMap):PGeeMapIterator;cdecl;external libexttextcat;
procedure gee_map_set_all(self:PGeeMap; map:PGeeMap);cdecl;external libexttextcat;
function gee_map_unset_all(self:PGeeMap; map:PGeeMap):Tgboolean;cdecl;external libexttextcat;
function gee_map_remove_all(self:PGeeMap; map:PGeeMap):Tgboolean;cdecl;external libexttextcat;
{xxxxxxxxxxxx G_GNUC_DEPRECATED ; }
function gee_map_has_all(self:PGeeMap; map:PGeeMap):Tgboolean;cdecl;external libexttextcat;
function gee_map_contains_all(self:PGeeMap; map:PGeeMap):Tgboolean;cdecl;external libexttextcat;
{xxxxxxxxxxxx G_GNUC_DEPRECATED ; }
function gee_map_empty(k_type:TGType; k_dup_func:TGBoxedCopyFunc; k_destroy_func:TGDestroyNotify; v_type:TGType; v_dup_func:TGBoxedCopyFunc; 
           v_destroy_func:TGDestroyNotify):PGeeMap;cdecl;external libexttextcat;
function gee_map_get_size(self:PGeeMap):Tgint;cdecl;external libexttextcat;
function gee_map_get_is_empty(self:PGeeMap):Tgboolean;cdecl;external libexttextcat;
function gee_map_get_read_only(self:PGeeMap):Tgboolean;cdecl;external libexttextcat;
function gee_map_get_keys(self:PGeeMap):PGeeSet;cdecl;external libexttextcat;
function gee_map_get_values(self:PGeeMap):PGeeCollection;cdecl;external libexttextcat;
function gee_map_get_entries(self:PGeeMap):PGeeSet;cdecl;external libexttextcat;
function gee_map_get_read_only_view(self:PGeeMap):PGeeMap;cdecl;external libexttextcat;
function gee_map_get_key_type(self:PGeeMap):TGType;cdecl;external libexttextcat;
function gee_map_get_value_type(self:PGeeMap):TGType;cdecl;external libexttextcat;
function gee_map_entry_construct(object_type:TGType; k_type:TGType; k_dup_func:TGBoxedCopyFunc; k_destroy_func:TGDestroyNotify; v_type:TGType; 
           v_dup_func:TGBoxedCopyFunc; v_destroy_func:TGDestroyNotify):PGeeMapEntry;cdecl;external libexttextcat;
function gee_map_entry_get_key(self:PGeeMapEntry):Tgconstpointer;cdecl;external libexttextcat;
function gee_map_entry_get_value(self:PGeeMapEntry):Tgconstpointer;cdecl;external libexttextcat;
procedure gee_map_entry_set_value(self:PGeeMapEntry; value:Tgconstpointer);cdecl;external libexttextcat;
function gee_map_entry_get_read_only(self:PGeeMapEntry):Tgboolean;cdecl;external libexttextcat;
function gee_map_iterator_next(self:PGeeMapIterator):Tgboolean;cdecl;external libexttextcat;
function gee_map_iterator_has_next(self:PGeeMapIterator):Tgboolean;cdecl;external libexttextcat;
function gee_map_iterator_get_key(self:PGeeMapIterator):Tgpointer;cdecl;external libexttextcat;
function gee_map_iterator_get_value(self:PGeeMapIterator):Tgpointer;cdecl;external libexttextcat;
procedure gee_map_iterator_set_value(self:PGeeMapIterator; value:Tgconstpointer);cdecl;external libexttextcat;
procedure gee_map_iterator_unset(self:PGeeMapIterator);cdecl;external libexttextcat;
function gee_map_iterator_fold(self:PGeeMapIterator; a_type:TGType; a_dup_func:TGBoxedCopyFunc; a_destroy_func:TGDestroyNotify; f:TGeeFoldMapFunc; 
           f_target:Tgpointer; seed:Tgpointer):Tgpointer;cdecl;external libexttextcat;
function gee_map_iterator_foreach(self:PGeeMapIterator; f:TGeeForallMapFunc; f_target:Tgpointer):Tgboolean;cdecl;external libexttextcat;
function gee_map_iterator_get_valid(self:PGeeMapIterator):Tgboolean;cdecl;external libexttextcat;
function gee_map_iterator_get_mutable(self:PGeeMapIterator):Tgboolean;cdecl;external libexttextcat;
function gee_map_iterator_get_read_only(self:PGeeMapIterator):Tgboolean;cdecl;external libexttextcat;
function gee_multi_map_get_keys(self:PGeeMultiMap):PGeeSet;cdecl;external libexttextcat;
function gee_multi_map_get_all_keys(self:PGeeMultiMap):PGeeMultiSet;cdecl;external libexttextcat;
function gee_multi_map_get_values(self:PGeeMultiMap):PGeeCollection;cdecl;external libexttextcat;
function gee_multi_map_contains(self:PGeeMultiMap; key:Tgconstpointer):Tgboolean;cdecl;external libexttextcat;
function gee_multi_map_get(self:PGeeMultiMap; key:Tgconstpointer):PGeeCollection;cdecl;external libexttextcat;
procedure gee_multi_map_set(self:PGeeMultiMap; key:Tgconstpointer; value:Tgconstpointer);cdecl;external libexttextcat;
function gee_multi_map_remove(self:PGeeMultiMap; key:Tgconstpointer; value:Tgconstpointer):Tgboolean;cdecl;external libexttextcat;
function gee_multi_map_remove_all(self:PGeeMultiMap; key:Tgconstpointer):Tgboolean;cdecl;external libexttextcat;
procedure gee_multi_map_clear(self:PGeeMultiMap);cdecl;external libexttextcat;
function gee_multi_map_map_iterator(self:PGeeMultiMap):PGeeMapIterator;cdecl;external libexttextcat;
function gee_multi_map_get_size(self:PGeeMultiMap):Tgint;cdecl;external libexttextcat;
function gee_multi_map_get_read_only(self:PGeeMultiMap):Tgboolean;cdecl;external libexttextcat;
function gee_multi_map_get_key_type(self:PGeeMultiMap):TGType;cdecl;external libexttextcat;
function gee_multi_map_get_value_type(self:PGeeMultiMap):TGType;cdecl;external libexttextcat;
function gee_multi_map_get_read_only_view(self:PGeeMultiMap):PGeeMultiMap;cdecl;external libexttextcat;
function gee_multi_set_count(self:PGeeMultiSet; item:Tgconstpointer):Tgint;cdecl;external libexttextcat;
function gee_multi_set_empty(g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify):PGeeSet;cdecl;external libexttextcat;
function gee_multi_set_get_read_only_view(self:PGeeMultiSet):PGeeMultiSet;cdecl;external libexttextcat;
function gee_priority_queue_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeePriorityQueue, g_object_unref) }
function gee_priority_queue_new(g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; compare_func:TGCompareDataFunc; compare_func_target:Tgpointer; 
           compare_func_target_destroy_notify:TGDestroyNotify):PGeePriorityQueue;cdecl;external libexttextcat;
function gee_priority_queue_construct(object_type:TGType; g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; compare_func:TGCompareDataFunc; 
           compare_func_target:Tgpointer; compare_func_target_destroy_notify:TGDestroyNotify):PGeePriorityQueue;cdecl;external libexttextcat;
function gee_priority_queue_offer(self:PGeePriorityQueue; element:Tgconstpointer):Tgboolean;cdecl;external libexttextcat;
function gee_priority_queue_drain(self:PGeePriorityQueue; recipient:PGeeCollection; amount:Tgint):Tgint;cdecl;external libexttextcat;
function gee_priority_queue_get_compare_func(self:PGeePriorityQueue; result_target:Pgpointer):TGCompareDataFunc;cdecl;external libexttextcat;
function gee_promise_ref(instance:Tgpointer):Tgpointer;cdecl;external libexttextcat;
procedure gee_promise_unref(instance:Tgpointer);cdecl;external libexttextcat;
function gee_param_spec_promise(name:Pgchar; nick:Pgchar; blurb:Pgchar; object_type:TGType; flags:TGParamFlags):PGParamSpec;cdecl;external libexttextcat;
procedure gee_value_set_promise(value:PGValue; v_object:Tgpointer);cdecl;external libexttextcat;
procedure gee_value_take_promise(value:PGValue; v_object:Tgpointer);cdecl;external libexttextcat;
function gee_value_get_promise(value:PGValue):Tgpointer;cdecl;external libexttextcat;
function gee_promise_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeePromise, gee_promise_unref) }
function gee_promise_new(g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify):PGeePromise;cdecl;external libexttextcat;
function gee_promise_construct(object_type:TGType; g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify):PGeePromise;cdecl;external libexttextcat;
procedure gee_promise_set_value(self:PGeePromise; value:Tgpointer);cdecl;external libexttextcat;
procedure gee_promise_set_exception(self:PGeePromise; exception:PGError);cdecl;external libexttextcat;
function gee_promise_get_future(self:PGeePromise):PGeeFuture;cdecl;external libexttextcat;
function gee_queue_offer(self:PGeeQueue; element:Tgconstpointer):Tgboolean;cdecl;external libexttextcat;
function gee_queue_peek(self:PGeeQueue):Tgpointer;cdecl;external libexttextcat;
function gee_queue_poll(self:PGeeQueue):Tgpointer;cdecl;external libexttextcat;
function gee_queue_drain(self:PGeeQueue; recipient:PGeeCollection; amount:Tgint):Tgint;cdecl;external libexttextcat;
function gee_queue_get_capacity(self:PGeeQueue):Tgint;cdecl;external libexttextcat;
function gee_queue_get_remaining_capacity(self:PGeeQueue):Tgint;cdecl;external libexttextcat;
function gee_queue_get_is_full(self:PGeeQueue):Tgboolean;cdecl;external libexttextcat;
function gee_set_empty(g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify):PGeeSet;cdecl;external libexttextcat;
function gee_set_get_read_only_view(self:PGeeSet):PGeeSet;cdecl;external libexttextcat;
function gee_sorted_map_head_map(self:PGeeSortedMap; before:Tgconstpointer):PGeeSortedMap;cdecl;external libexttextcat;
function gee_sorted_map_tail_map(self:PGeeSortedMap; after:Tgconstpointer):PGeeSortedMap;cdecl;external libexttextcat;
function gee_sorted_map_sub_map(self:PGeeSortedMap; before:Tgconstpointer; after:Tgconstpointer):PGeeSortedMap;cdecl;external libexttextcat;
function gee_sorted_map_empty(k_type:TGType; k_dup_func:TGBoxedCopyFunc; k_destroy_func:TGDestroyNotify; v_type:TGType; v_dup_func:TGBoxedCopyFunc; 
           v_destroy_func:TGDestroyNotify):PGeeMap;cdecl;external libexttextcat;
function gee_sorted_map_get_ascending_keys(self:PGeeSortedMap):PGeeSortedSet;cdecl;external libexttextcat;
function gee_sorted_map_get_ascending_entries(self:PGeeSortedMap):PGeeSortedSet;cdecl;external libexttextcat;
function gee_sorted_map_get_read_only_view(self:PGeeSortedMap):PGeeSortedMap;cdecl;external libexttextcat;
function gee_sorted_set_first(self:PGeeSortedSet):Tgpointer;cdecl;external libexttextcat;
function gee_sorted_set_last(self:PGeeSortedSet):Tgpointer;cdecl;external libexttextcat;
function gee_sorted_set_iterator_at(self:PGeeSortedSet; element:Tgconstpointer):PGeeIterator;cdecl;external libexttextcat;
function gee_sorted_set_lower(self:PGeeSortedSet; element:Tgconstpointer):Tgpointer;cdecl;external libexttextcat;
function gee_sorted_set_higher(self:PGeeSortedSet; element:Tgconstpointer):Tgpointer;cdecl;external libexttextcat;
function gee_sorted_set_floor(self:PGeeSortedSet; element:Tgconstpointer):Tgpointer;cdecl;external libexttextcat;
function gee_sorted_set_ceil(self:PGeeSortedSet; element:Tgconstpointer):Tgpointer;cdecl;external libexttextcat;
function gee_sorted_set_head_set(self:PGeeSortedSet; before:Tgconstpointer):PGeeSortedSet;cdecl;external libexttextcat;
function gee_sorted_set_tail_set(self:PGeeSortedSet; after:Tgconstpointer):PGeeSortedSet;cdecl;external libexttextcat;
function gee_sorted_set_sub_set(self:PGeeSortedSet; from:Tgconstpointer; to:Tgconstpointer):PGeeSortedSet;cdecl;external libexttextcat;
function gee_sorted_set_empty(g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify):PGeeSortedSet;cdecl;external libexttextcat;
function gee_sorted_set_get_read_only_view(self:PGeeSortedSet):PGeeSortedSet;cdecl;external libexttextcat;
function gee_task(g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; task:TGeeTask; task_target:Tgpointer; 
           error:PPGError):PGeeFuture;cdecl;external libexttextcat;
procedure gee_async_task(_callback_:TGAsyncReadyCallback; _user_data_:Tgpointer);cdecl;external libexttextcat;
procedure gee_async_task_finish(_res_:PGAsyncResult; error:PPGError);cdecl;external libexttextcat;
function gee_traversable_foreach(self:PGeeTraversable; f:TGeeForallFunc; f_target:Tgpointer):Tgboolean;cdecl;external libexttextcat;
function gee_traversable_stream(self:PGeeTraversable; a_type:TGType; a_dup_func:TGBoxedCopyFunc; a_destroy_func:TGDestroyNotify; f:TGeeStreamFunc; 
           f_target:Tgpointer; f_target_destroy_notify:TGDestroyNotify):PGeeIterator;cdecl;external libexttextcat;
function gee_traversable_fold(self:PGeeTraversable; a_type:TGType; a_dup_func:TGBoxedCopyFunc; a_destroy_func:TGDestroyNotify; f:TGeeFoldFunc; 
           f_target:Tgpointer; seed:Tgpointer):Tgpointer;cdecl;external libexttextcat;
function gee_traversable_map(self:PGeeTraversable; a_type:TGType; a_dup_func:TGBoxedCopyFunc; a_destroy_func:TGDestroyNotify; f:TGeeMapFunc; 
           f_target:Tgpointer):PGeeIterator;cdecl;external libexttextcat;
function gee_traversable_scan(self:PGeeTraversable; a_type:TGType; a_dup_func:TGBoxedCopyFunc; a_destroy_func:TGDestroyNotify; f:TGeeFoldFunc; 
           f_target:Tgpointer; seed:Tgpointer):PGeeIterator;cdecl;external libexttextcat;
function gee_traversable_filter(self:PGeeTraversable; pred:TGeePredicate; pred_target:Tgpointer; pred_target_destroy_notify:TGDestroyNotify):PGeeIterator;cdecl;external libexttextcat;
function gee_traversable_chop(self:PGeeTraversable; offset:Tgint; length:Tgint):PGeeIterator;cdecl;external libexttextcat;
function gee_traversable_flat_map(self:PGeeTraversable; a_type:TGType; a_dup_func:TGBoxedCopyFunc; a_destroy_func:TGDestroyNotify; f:TGeeFlatMapFunc; 
           f_target:Tgpointer; f_target_destroy_notify:TGDestroyNotify):PGeeIterator;cdecl;external libexttextcat;
function gee_traversable_tee(self:PGeeTraversable; forks:Tguint; result_length1:Pgint):^PGeeIterator;cdecl;external libexttextcat;
function gee_traversable_first_match(self:PGeeTraversable; pred:TGeePredicate; pred_target:Tgpointer; pred_target_destroy_notify:TGDestroyNotify):Tgpointer;cdecl;external libexttextcat;
function gee_traversable_any_match(self:PGeeTraversable; pred:TGeePredicate; pred_target:Tgpointer; pred_target_destroy_notify:TGDestroyNotify):Tgboolean;cdecl;external libexttextcat;
function gee_traversable_all_match(self:PGeeTraversable; pred:TGeePredicate; pred_target:Tgpointer; pred_target_destroy_notify:TGDestroyNotify):Tgboolean;cdecl;external libexttextcat;
function gee_traversable_max(self:PGeeTraversable; compare:TGCompareDataFunc; compare_target:Tgpointer; compare_target_destroy_notify:TGDestroyNotify):Tgpointer;cdecl;external libexttextcat;
function gee_traversable_min(self:PGeeTraversable; compare:TGCompareDataFunc; compare_target:Tgpointer; compare_target_destroy_notify:TGDestroyNotify):Tgpointer;cdecl;external libexttextcat;
function gee_traversable_order_by(self:PGeeTraversable; compare:TGCompareDataFunc; compare_target:Tgpointer; compare_target_destroy_notify:TGDestroyNotify):PGeeIterator;cdecl;external libexttextcat;
function gee_traversable_get_element_type(self:PGeeTraversable):TGType;cdecl;external libexttextcat;
function gee_tree_map_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeTreeMap, g_object_unref) }
function gee_tree_map_new(k_type:TGType; k_dup_func:TGBoxedCopyFunc; k_destroy_func:TGDestroyNotify; v_type:TGType; v_dup_func:TGBoxedCopyFunc; 
           v_destroy_func:TGDestroyNotify; key_compare_func:TGCompareDataFunc; key_compare_func_target:Tgpointer; key_compare_func_target_destroy_notify:TGDestroyNotify; value_equal_func:TGeeEqualDataFunc; 
           value_equal_func_target:Tgpointer; value_equal_func_target_destroy_notify:TGDestroyNotify):PGeeTreeMap;cdecl;external libexttextcat;
function gee_tree_map_construct(object_type:TGType; k_type:TGType; k_dup_func:TGBoxedCopyFunc; k_destroy_func:TGDestroyNotify; v_type:TGType; 
           v_dup_func:TGBoxedCopyFunc; v_destroy_func:TGDestroyNotify; key_compare_func:TGCompareDataFunc; key_compare_func_target:Tgpointer; key_compare_func_target_destroy_notify:TGDestroyNotify; 
           value_equal_func:TGeeEqualDataFunc; value_equal_func_target:Tgpointer; value_equal_func_target_destroy_notify:TGDestroyNotify):PGeeTreeMap;cdecl;external libexttextcat;
function gee_tree_map_get_key_compare_func(self:PGeeTreeMap; result_target:Pgpointer):TGCompareDataFunc;cdecl;external libexttextcat;
function gee_tree_map_get_value_equal_func(self:PGeeTreeMap; result_target:Pgpointer):TGeeEqualDataFunc;cdecl;external libexttextcat;
function gee_tree_multi_map_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeTreeMultiMap, g_object_unref) }
function gee_tree_multi_map_new(k_type:TGType; k_dup_func:TGBoxedCopyFunc; k_destroy_func:TGDestroyNotify; v_type:TGType; v_dup_func:TGBoxedCopyFunc; 
           v_destroy_func:TGDestroyNotify; key_compare_func:TGCompareDataFunc; key_compare_func_target:Tgpointer; key_compare_func_target_destroy_notify:TGDestroyNotify; value_compare_func:TGCompareDataFunc; 
           value_compare_func_target:Tgpointer; value_compare_func_target_destroy_notify:TGDestroyNotify):PGeeTreeMultiMap;cdecl;external libexttextcat;
function gee_tree_multi_map_construct(object_type:TGType; k_type:TGType; k_dup_func:TGBoxedCopyFunc; k_destroy_func:TGDestroyNotify; v_type:TGType; 
           v_dup_func:TGBoxedCopyFunc; v_destroy_func:TGDestroyNotify; key_compare_func:TGCompareDataFunc; key_compare_func_target:Tgpointer; key_compare_func_target_destroy_notify:TGDestroyNotify; 
           value_compare_func:TGCompareDataFunc; value_compare_func_target:Tgpointer; value_compare_func_target_destroy_notify:TGDestroyNotify):PGeeTreeMultiMap;cdecl;external libexttextcat;
function gee_tree_multi_map_get_key_compare_func(self:PGeeTreeMultiMap; result_target:Pgpointer):TGCompareDataFunc;cdecl;external libexttextcat;
function gee_tree_multi_map_get_value_compare_func(self:PGeeTreeMultiMap; result_target:Pgpointer):TGCompareDataFunc;cdecl;external libexttextcat;
function gee_tree_multi_set_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeTreeMultiSet, g_object_unref) }
function gee_tree_multi_set_new(g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; compare_func:TGCompareDataFunc; compare_func_target:Tgpointer; 
           compare_func_target_destroy_notify:TGDestroyNotify):PGeeTreeMultiSet;cdecl;external libexttextcat;
function gee_tree_multi_set_construct(object_type:TGType; g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; compare_func:TGCompareDataFunc; 
           compare_func_target:Tgpointer; compare_func_target_destroy_notify:TGDestroyNotify):PGeeTreeMultiSet;cdecl;external libexttextcat;
function gee_tree_multi_set_get_compare_func(self:PGeeTreeMultiSet; result_target:Pgpointer):TGCompareDataFunc;cdecl;external libexttextcat;
function gee_tree_set_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeTreeSet, g_object_unref) }
function gee_tree_set_new(g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; compare_func:TGCompareDataFunc; compare_func_target:Tgpointer; 
           compare_func_target_destroy_notify:TGDestroyNotify):PGeeTreeSet;cdecl;external libexttextcat;
function gee_tree_set_construct(object_type:TGType; g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; compare_func:TGCompareDataFunc; 
           compare_func_target:Tgpointer; compare_func_target_destroy_notify:TGDestroyNotify):PGeeTreeSet;cdecl;external libexttextcat;
function gee_tree_set_get_compare_func(self:PGeeTreeSet; result_target:Pgpointer):TGCompareDataFunc;cdecl;external libexttextcat;
function gee_unrolled_linked_list_get_type:TGType;cdecl;external libexttextcat;
{ G_DEFINE_AUTOPTR_CLEANUP_FUNC (GeeUnrolledLinkedList, g_object_unref) }
function gee_unrolled_linked_list_new(g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; equal_func:TGeeEqualDataFunc; equal_func_target:Tgpointer; 
           equal_func_target_destroy_notify:TGDestroyNotify):PGeeUnrolledLinkedList;cdecl;external libexttextcat;
function gee_unrolled_linked_list_construct(object_type:TGType; g_type:TGType; g_dup_func:TGBoxedCopyFunc; g_destroy_func:TGDestroyNotify; equal_func:TGeeEqualDataFunc; 
           equal_func_target:Tgpointer; equal_func_target_destroy_notify:TGDestroyNotify):PGeeUnrolledLinkedList;cdecl;external libexttextcat;
function gee_unrolled_linked_list_get_equal_func(self:PGeeUnrolledLinkedList; result_target:Pgpointer):TGeeEqualDataFunc;cdecl;external libexttextcat;
{$endif}

// === Konventiert am: 10-11-26 16:09:35 ===


implementation


{ was #define dname def_expr }
function GEE_TYPE_TRAVERSABLE : longint; { return type might be wrong }
  begin
    GEE_TYPE_TRAVERSABLE:=gee_traversable_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_TRAVERSABLE(obj : longint) : longint;
begin
  GEE_TRAVERSABLE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_TRAVERSABLE,GeeTraversable);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_TRAVERSABLE(obj : longint) : longint;
begin
  GEE_IS_TRAVERSABLE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_TRAVERSABLE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_TRAVERSABLE_GET_INTERFACE(obj : longint) : longint;
begin
  GEE_TRAVERSABLE_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,GEE_TYPE_TRAVERSABLE,GeeTraversableIface);
end;

{ was #define dname def_expr }
function GEE_TRAVERSABLE_TYPE_STREAM : longint; { return type might be wrong }
  begin
    GEE_TRAVERSABLE_TYPE_STREAM:=gee_traversable_stream_get_type;
  end;

{ was #define dname def_expr }
function GEE_TYPE_LAZY : longint; { return type might be wrong }
  begin
    GEE_TYPE_LAZY:=gee_lazy_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_LAZY(obj : longint) : longint;
begin
  GEE_LAZY:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_LAZY,GeeLazy);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_LAZY_CLASS(klass : longint) : longint;
begin
  GEE_LAZY_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEE_TYPE_LAZY,GeeLazyClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_LAZY(obj : longint) : longint;
begin
  GEE_IS_LAZY:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_LAZY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_LAZY_CLASS(klass : longint) : longint;
begin
  GEE_IS_LAZY_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEE_TYPE_LAZY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_LAZY_GET_CLASS(obj : longint) : longint;
begin
  GEE_LAZY_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEE_TYPE_LAZY,GeeLazyClass);
end;

{ was #define dname def_expr }
function GEE_TYPE_ITERATOR : longint; { return type might be wrong }
  begin
    GEE_TYPE_ITERATOR:=gee_iterator_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ITERATOR(obj : longint) : longint;
begin
  GEE_ITERATOR:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_ITERATOR,GeeIterator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_ITERATOR(obj : longint) : longint;
begin
  GEE_IS_ITERATOR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_ITERATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ITERATOR_GET_INTERFACE(obj : longint) : longint;
begin
  GEE_ITERATOR_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,GEE_TYPE_ITERATOR,GeeIteratorIface);
end;

{ was #define dname def_expr }
function GEE_TYPE_ITERABLE : longint; { return type might be wrong }
  begin
    GEE_TYPE_ITERABLE:=gee_iterable_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ITERABLE(obj : longint) : longint;
begin
  GEE_ITERABLE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_ITERABLE,GeeIterable);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_ITERABLE(obj : longint) : longint;
begin
  GEE_IS_ITERABLE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_ITERABLE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ITERABLE_GET_INTERFACE(obj : longint) : longint;
begin
  GEE_ITERABLE_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,GEE_TYPE_ITERABLE,GeeIterableIface);
end;

{ was #define dname def_expr }
function GEE_TYPE_COLLECTION : longint; { return type might be wrong }
  begin
    GEE_TYPE_COLLECTION:=gee_collection_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_COLLECTION(obj : longint) : longint;
begin
  GEE_COLLECTION:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_COLLECTION,GeeCollection);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_COLLECTION(obj : longint) : longint;
begin
  GEE_IS_COLLECTION:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_COLLECTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_COLLECTION_GET_INTERFACE(obj : longint) : longint;
begin
  GEE_COLLECTION_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,GEE_TYPE_COLLECTION,GeeCollectionIface);
end;

{ was #define dname def_expr }
function GEE_TYPE_ABSTRACT_COLLECTION : longint; { return type might be wrong }
  begin
    GEE_TYPE_ABSTRACT_COLLECTION:=gee_abstract_collection_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_COLLECTION(obj : longint) : longint;
begin
  GEE_ABSTRACT_COLLECTION:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_ABSTRACT_COLLECTION,GeeAbstractCollection);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_COLLECTION_CLASS(klass : longint) : longint;
begin
  GEE_ABSTRACT_COLLECTION_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEE_TYPE_ABSTRACT_COLLECTION,GeeAbstractCollectionClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_ABSTRACT_COLLECTION(obj : longint) : longint;
begin
  GEE_IS_ABSTRACT_COLLECTION:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_ABSTRACT_COLLECTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_ABSTRACT_COLLECTION_CLASS(klass : longint) : longint;
begin
  GEE_IS_ABSTRACT_COLLECTION_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEE_TYPE_ABSTRACT_COLLECTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_COLLECTION_GET_CLASS(obj : longint) : longint;
begin
  GEE_ABSTRACT_COLLECTION_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEE_TYPE_ABSTRACT_COLLECTION,GeeAbstractCollectionClass);
end;

{ was #define dname def_expr }
function GEE_TYPE_LIST : longint; { return type might be wrong }
  begin
    GEE_TYPE_LIST:=gee_list_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_LIST(obj : longint) : longint;
begin
  GEE_LIST:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_LIST,GeeList);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_LIST(obj : longint) : longint;
begin
  GEE_IS_LIST:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_LIST_GET_INTERFACE(obj : longint) : longint;
begin
  GEE_LIST_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,GEE_TYPE_LIST,GeeListIface);
end;

{ was #define dname def_expr }
function GEE_TYPE_LIST_ITERATOR : longint; { return type might be wrong }
  begin
    GEE_TYPE_LIST_ITERATOR:=gee_list_iterator_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_LIST_ITERATOR(obj : longint) : longint;
begin
  GEE_LIST_ITERATOR:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_LIST_ITERATOR,GeeListIterator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_LIST_ITERATOR(obj : longint) : longint;
begin
  GEE_IS_LIST_ITERATOR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_LIST_ITERATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_LIST_ITERATOR_GET_INTERFACE(obj : longint) : longint;
begin
  GEE_LIST_ITERATOR_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,GEE_TYPE_LIST_ITERATOR,GeeListIteratorIface);
end;

{ was #define dname def_expr }
function GEE_TYPE_ABSTRACT_LIST : longint; { return type might be wrong }
  begin
    GEE_TYPE_ABSTRACT_LIST:=gee_abstract_list_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_LIST(obj : longint) : longint;
begin
  GEE_ABSTRACT_LIST:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_ABSTRACT_LIST,GeeAbstractList);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_LIST_CLASS(klass : longint) : longint;
begin
  GEE_ABSTRACT_LIST_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEE_TYPE_ABSTRACT_LIST,GeeAbstractListClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_ABSTRACT_LIST(obj : longint) : longint;
begin
  GEE_IS_ABSTRACT_LIST:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_ABSTRACT_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_ABSTRACT_LIST_CLASS(klass : longint) : longint;
begin
  GEE_IS_ABSTRACT_LIST_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEE_TYPE_ABSTRACT_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_LIST_GET_CLASS(obj : longint) : longint;
begin
  GEE_ABSTRACT_LIST_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEE_TYPE_ABSTRACT_LIST,GeeAbstractListClass);
end;

{ was #define dname def_expr }
function GEE_TYPE_BIDIR_LIST : longint; { return type might be wrong }
  begin
    GEE_TYPE_BIDIR_LIST:=gee_bidir_list_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_BIDIR_LIST(obj : longint) : longint;
begin
  GEE_BIDIR_LIST:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_BIDIR_LIST,GeeBidirList);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_BIDIR_LIST(obj : longint) : longint;
begin
  GEE_IS_BIDIR_LIST:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_BIDIR_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_BIDIR_LIST_GET_INTERFACE(obj : longint) : longint;
begin
  GEE_BIDIR_LIST_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,GEE_TYPE_BIDIR_LIST,GeeBidirListIface);
end;

{ was #define dname def_expr }
function GEE_TYPE_BIDIR_LIST_ITERATOR : longint; { return type might be wrong }
  begin
    GEE_TYPE_BIDIR_LIST_ITERATOR:=gee_bidir_list_iterator_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_BIDIR_LIST_ITERATOR(obj : longint) : longint;
begin
  GEE_BIDIR_LIST_ITERATOR:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_BIDIR_LIST_ITERATOR,GeeBidirListIterator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_BIDIR_LIST_ITERATOR(obj : longint) : longint;
begin
  GEE_IS_BIDIR_LIST_ITERATOR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_BIDIR_LIST_ITERATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_BIDIR_LIST_ITERATOR_GET_INTERFACE(obj : longint) : longint;
begin
  GEE_BIDIR_LIST_ITERATOR_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,GEE_TYPE_BIDIR_LIST_ITERATOR,GeeBidirListIteratorIface);
end;

{ was #define dname def_expr }
function GEE_TYPE_BIDIR_ITERATOR : longint; { return type might be wrong }
  begin
    GEE_TYPE_BIDIR_ITERATOR:=gee_bidir_iterator_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_BIDIR_ITERATOR(obj : longint) : longint;
begin
  GEE_BIDIR_ITERATOR:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_BIDIR_ITERATOR,GeeBidirIterator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_BIDIR_ITERATOR(obj : longint) : longint;
begin
  GEE_IS_BIDIR_ITERATOR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_BIDIR_ITERATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_BIDIR_ITERATOR_GET_INTERFACE(obj : longint) : longint;
begin
  GEE_BIDIR_ITERATOR_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,GEE_TYPE_BIDIR_ITERATOR,GeeBidirIteratorIface);
end;

{ was #define dname def_expr }
function GEE_TYPE_ABSTRACT_BIDIR_LIST : longint; { return type might be wrong }
  begin
    GEE_TYPE_ABSTRACT_BIDIR_LIST:=gee_abstract_bidir_list_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_BIDIR_LIST(obj : longint) : longint;
begin
  GEE_ABSTRACT_BIDIR_LIST:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_ABSTRACT_BIDIR_LIST,GeeAbstractBidirList);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_BIDIR_LIST_CLASS(klass : longint) : longint;
begin
  GEE_ABSTRACT_BIDIR_LIST_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEE_TYPE_ABSTRACT_BIDIR_LIST,GeeAbstractBidirListClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_ABSTRACT_BIDIR_LIST(obj : longint) : longint;
begin
  GEE_IS_ABSTRACT_BIDIR_LIST:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_ABSTRACT_BIDIR_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_ABSTRACT_BIDIR_LIST_CLASS(klass : longint) : longint;
begin
  GEE_IS_ABSTRACT_BIDIR_LIST_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEE_TYPE_ABSTRACT_BIDIR_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_BIDIR_LIST_GET_CLASS(obj : longint) : longint;
begin
  GEE_ABSTRACT_BIDIR_LIST_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEE_TYPE_ABSTRACT_BIDIR_LIST,GeeAbstractBidirListClass);
end;

{ was #define dname def_expr }
function GEE_TYPE_SET : longint; { return type might be wrong }
  begin
    GEE_TYPE_SET:=gee_set_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_SET(obj : longint) : longint;
begin
  GEE_SET:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_SET,GeeSet);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_SET(obj : longint) : longint;
begin
  GEE_IS_SET:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_SET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_SET_GET_INTERFACE(obj : longint) : longint;
begin
  GEE_SET_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,GEE_TYPE_SET,GeeSetIface);
end;

{ was #define dname def_expr }
function GEE_TYPE_ABSTRACT_SET : longint; { return type might be wrong }
  begin
    GEE_TYPE_ABSTRACT_SET:=gee_abstract_set_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_SET(obj : longint) : longint;
begin
  GEE_ABSTRACT_SET:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_ABSTRACT_SET,GeeAbstractSet);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_SET_CLASS(klass : longint) : longint;
begin
  GEE_ABSTRACT_SET_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEE_TYPE_ABSTRACT_SET,GeeAbstractSetClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_ABSTRACT_SET(obj : longint) : longint;
begin
  GEE_IS_ABSTRACT_SET:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_ABSTRACT_SET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_ABSTRACT_SET_CLASS(klass : longint) : longint;
begin
  GEE_IS_ABSTRACT_SET_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEE_TYPE_ABSTRACT_SET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_SET_GET_CLASS(obj : longint) : longint;
begin
  GEE_ABSTRACT_SET_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEE_TYPE_ABSTRACT_SET,GeeAbstractSetClass);
end;

{ was #define dname def_expr }
function GEE_TYPE_SORTED_SET : longint; { return type might be wrong }
  begin
    GEE_TYPE_SORTED_SET:=gee_sorted_set_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_SORTED_SET(obj : longint) : longint;
begin
  GEE_SORTED_SET:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_SORTED_SET,GeeSortedSet);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_SORTED_SET(obj : longint) : longint;
begin
  GEE_IS_SORTED_SET:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_SORTED_SET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_SORTED_SET_GET_INTERFACE(obj : longint) : longint;
begin
  GEE_SORTED_SET_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,GEE_TYPE_SORTED_SET,GeeSortedSetIface);
end;

{ was #define dname def_expr }
function GEE_TYPE_ABSTRACT_SORTED_SET : longint; { return type might be wrong }
  begin
    GEE_TYPE_ABSTRACT_SORTED_SET:=gee_abstract_sorted_set_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_SORTED_SET(obj : longint) : longint;
begin
  GEE_ABSTRACT_SORTED_SET:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_ABSTRACT_SORTED_SET,GeeAbstractSortedSet);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_SORTED_SET_CLASS(klass : longint) : longint;
begin
  GEE_ABSTRACT_SORTED_SET_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEE_TYPE_ABSTRACT_SORTED_SET,GeeAbstractSortedSetClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_ABSTRACT_SORTED_SET(obj : longint) : longint;
begin
  GEE_IS_ABSTRACT_SORTED_SET:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_ABSTRACT_SORTED_SET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_ABSTRACT_SORTED_SET_CLASS(klass : longint) : longint;
begin
  GEE_IS_ABSTRACT_SORTED_SET_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEE_TYPE_ABSTRACT_SORTED_SET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_SORTED_SET_GET_CLASS(obj : longint) : longint;
begin
  GEE_ABSTRACT_SORTED_SET_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEE_TYPE_ABSTRACT_SORTED_SET,GeeAbstractSortedSetClass);
end;

{ was #define dname def_expr }
function GEE_TYPE_BIDIR_SORTED_SET : longint; { return type might be wrong }
  begin
    GEE_TYPE_BIDIR_SORTED_SET:=gee_bidir_sorted_set_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_BIDIR_SORTED_SET(obj : longint) : longint;
begin
  GEE_BIDIR_SORTED_SET:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_BIDIR_SORTED_SET,GeeBidirSortedSet);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_BIDIR_SORTED_SET(obj : longint) : longint;
begin
  GEE_IS_BIDIR_SORTED_SET:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_BIDIR_SORTED_SET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_BIDIR_SORTED_SET_GET_INTERFACE(obj : longint) : longint;
begin
  GEE_BIDIR_SORTED_SET_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,GEE_TYPE_BIDIR_SORTED_SET,GeeBidirSortedSetIface);
end;

{ was #define dname def_expr }
function GEE_TYPE_ABSTRACT_BIDIR_SORTED_SET : longint; { return type might be wrong }
  begin
    GEE_TYPE_ABSTRACT_BIDIR_SORTED_SET:=gee_abstract_bidir_sorted_set_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_BIDIR_SORTED_SET(obj : longint) : longint;
begin
  GEE_ABSTRACT_BIDIR_SORTED_SET:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_ABSTRACT_BIDIR_SORTED_SET,GeeAbstractBidirSortedSet);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_BIDIR_SORTED_SET_CLASS(klass : longint) : longint;
begin
  GEE_ABSTRACT_BIDIR_SORTED_SET_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEE_TYPE_ABSTRACT_BIDIR_SORTED_SET,GeeAbstractBidirSortedSetClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_ABSTRACT_BIDIR_SORTED_SET(obj : longint) : longint;
begin
  GEE_IS_ABSTRACT_BIDIR_SORTED_SET:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_ABSTRACT_BIDIR_SORTED_SET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_ABSTRACT_BIDIR_SORTED_SET_CLASS(klass : longint) : longint;
begin
  GEE_IS_ABSTRACT_BIDIR_SORTED_SET_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEE_TYPE_ABSTRACT_BIDIR_SORTED_SET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_BIDIR_SORTED_SET_GET_CLASS(obj : longint) : longint;
begin
  GEE_ABSTRACT_BIDIR_SORTED_SET_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEE_TYPE_ABSTRACT_BIDIR_SORTED_SET,GeeAbstractBidirSortedSetClass);
end;

{ was #define dname def_expr }
function GEE_TYPE_MAP : longint; { return type might be wrong }
  begin
    GEE_TYPE_MAP:=gee_map_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_MAP(obj : longint) : longint;
begin
  GEE_MAP:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_MAP,GeeMap);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_MAP(obj : longint) : longint;
begin
  GEE_IS_MAP:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_MAP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_MAP_GET_INTERFACE(obj : longint) : longint;
begin
  GEE_MAP_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,GEE_TYPE_MAP,GeeMapIface);
end;

{ was #define dname def_expr }
function GEE_TYPE_MAP_ITERATOR : longint; { return type might be wrong }
  begin
    GEE_TYPE_MAP_ITERATOR:=gee_map_iterator_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_MAP_ITERATOR(obj : longint) : longint;
begin
  GEE_MAP_ITERATOR:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_MAP_ITERATOR,GeeMapIterator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_MAP_ITERATOR(obj : longint) : longint;
begin
  GEE_IS_MAP_ITERATOR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_MAP_ITERATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_MAP_ITERATOR_GET_INTERFACE(obj : longint) : longint;
begin
  GEE_MAP_ITERATOR_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,GEE_TYPE_MAP_ITERATOR,GeeMapIteratorIface);
end;

{ was #define dname def_expr }
function GEE_MAP_TYPE_ENTRY : longint; { return type might be wrong }
  begin
    GEE_MAP_TYPE_ENTRY:=gee_map_entry_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_MAP_ENTRY(obj : longint) : longint;
begin
  GEE_MAP_ENTRY:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_MAP_TYPE_ENTRY,GeeMapEntry);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_MAP_ENTRY_CLASS(klass : longint) : longint;
begin
  GEE_MAP_ENTRY_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEE_MAP_TYPE_ENTRY,GeeMapEntryClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_MAP_IS_ENTRY(obj : longint) : longint;
begin
  GEE_MAP_IS_ENTRY:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_MAP_TYPE_ENTRY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_MAP_IS_ENTRY_CLASS(klass : longint) : longint;
begin
  GEE_MAP_IS_ENTRY_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEE_MAP_TYPE_ENTRY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_MAP_ENTRY_GET_CLASS(obj : longint) : longint;
begin
  GEE_MAP_ENTRY_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEE_MAP_TYPE_ENTRY,GeeMapEntryClass);
end;

{ was #define dname def_expr }
function GEE_TYPE_ABSTRACT_MAP : longint; { return type might be wrong }
  begin
    GEE_TYPE_ABSTRACT_MAP:=gee_abstract_map_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_MAP(obj : longint) : longint;
begin
  GEE_ABSTRACT_MAP:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_ABSTRACT_MAP,GeeAbstractMap);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_MAP_CLASS(klass : longint) : longint;
begin
  GEE_ABSTRACT_MAP_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEE_TYPE_ABSTRACT_MAP,GeeAbstractMapClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_ABSTRACT_MAP(obj : longint) : longint;
begin
  GEE_IS_ABSTRACT_MAP:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_ABSTRACT_MAP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_ABSTRACT_MAP_CLASS(klass : longint) : longint;
begin
  GEE_IS_ABSTRACT_MAP_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEE_TYPE_ABSTRACT_MAP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_MAP_GET_CLASS(obj : longint) : longint;
begin
  GEE_ABSTRACT_MAP_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEE_TYPE_ABSTRACT_MAP,GeeAbstractMapClass);
end;

{ was #define dname def_expr }
function GEE_TYPE_SORTED_MAP : longint; { return type might be wrong }
  begin
    GEE_TYPE_SORTED_MAP:=gee_sorted_map_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_SORTED_MAP(obj : longint) : longint;
begin
  GEE_SORTED_MAP:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_SORTED_MAP,GeeSortedMap);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_SORTED_MAP(obj : longint) : longint;
begin
  GEE_IS_SORTED_MAP:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_SORTED_MAP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_SORTED_MAP_GET_INTERFACE(obj : longint) : longint;
begin
  GEE_SORTED_MAP_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,GEE_TYPE_SORTED_MAP,GeeSortedMapIface);
end;

{ was #define dname def_expr }
function GEE_TYPE_ABSTRACT_SORTED_MAP : longint; { return type might be wrong }
  begin
    GEE_TYPE_ABSTRACT_SORTED_MAP:=gee_abstract_sorted_map_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_SORTED_MAP(obj : longint) : longint;
begin
  GEE_ABSTRACT_SORTED_MAP:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_ABSTRACT_SORTED_MAP,GeeAbstractSortedMap);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_SORTED_MAP_CLASS(klass : longint) : longint;
begin
  GEE_ABSTRACT_SORTED_MAP_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEE_TYPE_ABSTRACT_SORTED_MAP,GeeAbstractSortedMapClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_ABSTRACT_SORTED_MAP(obj : longint) : longint;
begin
  GEE_IS_ABSTRACT_SORTED_MAP:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_ABSTRACT_SORTED_MAP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_ABSTRACT_SORTED_MAP_CLASS(klass : longint) : longint;
begin
  GEE_IS_ABSTRACT_SORTED_MAP_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEE_TYPE_ABSTRACT_SORTED_MAP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_SORTED_MAP_GET_CLASS(obj : longint) : longint;
begin
  GEE_ABSTRACT_SORTED_MAP_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEE_TYPE_ABSTRACT_SORTED_MAP,GeeAbstractSortedMapClass);
end;

{ was #define dname def_expr }
function GEE_TYPE_BIDIR_SORTED_MAP : longint; { return type might be wrong }
  begin
    GEE_TYPE_BIDIR_SORTED_MAP:=gee_bidir_sorted_map_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_BIDIR_SORTED_MAP(obj : longint) : longint;
begin
  GEE_BIDIR_SORTED_MAP:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_BIDIR_SORTED_MAP,GeeBidirSortedMap);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_BIDIR_SORTED_MAP(obj : longint) : longint;
begin
  GEE_IS_BIDIR_SORTED_MAP:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_BIDIR_SORTED_MAP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_BIDIR_SORTED_MAP_GET_INTERFACE(obj : longint) : longint;
begin
  GEE_BIDIR_SORTED_MAP_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,GEE_TYPE_BIDIR_SORTED_MAP,GeeBidirSortedMapIface);
end;

{ was #define dname def_expr }
function GEE_TYPE_BIDIR_MAP_ITERATOR : longint; { return type might be wrong }
  begin
    GEE_TYPE_BIDIR_MAP_ITERATOR:=gee_bidir_map_iterator_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_BIDIR_MAP_ITERATOR(obj : longint) : longint;
begin
  GEE_BIDIR_MAP_ITERATOR:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_BIDIR_MAP_ITERATOR,GeeBidirMapIterator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_BIDIR_MAP_ITERATOR(obj : longint) : longint;
begin
  GEE_IS_BIDIR_MAP_ITERATOR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_BIDIR_MAP_ITERATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_BIDIR_MAP_ITERATOR_GET_INTERFACE(obj : longint) : longint;
begin
  GEE_BIDIR_MAP_ITERATOR_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,GEE_TYPE_BIDIR_MAP_ITERATOR,GeeBidirMapIteratorIface);
end;

{ was #define dname def_expr }
function GEE_TYPE_ABSTRACT_BIDIR_SORTED_MAP : longint; { return type might be wrong }
  begin
    GEE_TYPE_ABSTRACT_BIDIR_SORTED_MAP:=gee_abstract_bidir_sorted_map_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_BIDIR_SORTED_MAP(obj : longint) : longint;
begin
  GEE_ABSTRACT_BIDIR_SORTED_MAP:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_ABSTRACT_BIDIR_SORTED_MAP,GeeAbstractBidirSortedMap);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_BIDIR_SORTED_MAP_CLASS(klass : longint) : longint;
begin
  GEE_ABSTRACT_BIDIR_SORTED_MAP_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEE_TYPE_ABSTRACT_BIDIR_SORTED_MAP,GeeAbstractBidirSortedMapClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_ABSTRACT_BIDIR_SORTED_MAP(obj : longint) : longint;
begin
  GEE_IS_ABSTRACT_BIDIR_SORTED_MAP:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_ABSTRACT_BIDIR_SORTED_MAP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_ABSTRACT_BIDIR_SORTED_MAP_CLASS(klass : longint) : longint;
begin
  GEE_IS_ABSTRACT_BIDIR_SORTED_MAP_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEE_TYPE_ABSTRACT_BIDIR_SORTED_MAP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_BIDIR_SORTED_MAP_GET_CLASS(obj : longint) : longint;
begin
  GEE_ABSTRACT_BIDIR_SORTED_MAP_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEE_TYPE_ABSTRACT_BIDIR_SORTED_MAP,GeeAbstractBidirSortedMapClass);
end;

{ was #define dname def_expr }
function GEE_TYPE_MULTI_MAP : longint; { return type might be wrong }
  begin
    GEE_TYPE_MULTI_MAP:=gee_multi_map_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_MULTI_MAP(obj : longint) : longint;
begin
  GEE_MULTI_MAP:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_MULTI_MAP,GeeMultiMap);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_MULTI_MAP(obj : longint) : longint;
begin
  GEE_IS_MULTI_MAP:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_MULTI_MAP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_MULTI_MAP_GET_INTERFACE(obj : longint) : longint;
begin
  GEE_MULTI_MAP_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,GEE_TYPE_MULTI_MAP,GeeMultiMapIface);
end;

{ was #define dname def_expr }
function GEE_TYPE_MULTI_SET : longint; { return type might be wrong }
  begin
    GEE_TYPE_MULTI_SET:=gee_multi_set_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_MULTI_SET(obj : longint) : longint;
begin
  GEE_MULTI_SET:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_MULTI_SET,GeeMultiSet);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_MULTI_SET(obj : longint) : longint;
begin
  GEE_IS_MULTI_SET:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_MULTI_SET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_MULTI_SET_GET_INTERFACE(obj : longint) : longint;
begin
  GEE_MULTI_SET_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,GEE_TYPE_MULTI_SET,GeeMultiSetIface);
end;

{ was #define dname def_expr }
function GEE_TYPE_ABSTRACT_MULTI_MAP : longint; { return type might be wrong }
  begin
    GEE_TYPE_ABSTRACT_MULTI_MAP:=gee_abstract_multi_map_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_MULTI_MAP(obj : longint) : longint;
begin
  GEE_ABSTRACT_MULTI_MAP:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_ABSTRACT_MULTI_MAP,GeeAbstractMultiMap);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_MULTI_MAP_CLASS(klass : longint) : longint;
begin
  GEE_ABSTRACT_MULTI_MAP_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEE_TYPE_ABSTRACT_MULTI_MAP,GeeAbstractMultiMapClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_ABSTRACT_MULTI_MAP(obj : longint) : longint;
begin
  GEE_IS_ABSTRACT_MULTI_MAP:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_ABSTRACT_MULTI_MAP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_ABSTRACT_MULTI_MAP_CLASS(klass : longint) : longint;
begin
  GEE_IS_ABSTRACT_MULTI_MAP_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEE_TYPE_ABSTRACT_MULTI_MAP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_MULTI_MAP_GET_CLASS(obj : longint) : longint;
begin
  GEE_ABSTRACT_MULTI_MAP_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEE_TYPE_ABSTRACT_MULTI_MAP,GeeAbstractMultiMapClass);
end;

{ was #define dname def_expr }
function GEE_TYPE_ABSTRACT_MULTI_SET : longint; { return type might be wrong }
  begin
    GEE_TYPE_ABSTRACT_MULTI_SET:=gee_abstract_multi_set_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_MULTI_SET(obj : longint) : longint;
begin
  GEE_ABSTRACT_MULTI_SET:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_ABSTRACT_MULTI_SET,GeeAbstractMultiSet);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_MULTI_SET_CLASS(klass : longint) : longint;
begin
  GEE_ABSTRACT_MULTI_SET_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEE_TYPE_ABSTRACT_MULTI_SET,GeeAbstractMultiSetClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_ABSTRACT_MULTI_SET(obj : longint) : longint;
begin
  GEE_IS_ABSTRACT_MULTI_SET:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_ABSTRACT_MULTI_SET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_ABSTRACT_MULTI_SET_CLASS(klass : longint) : longint;
begin
  GEE_IS_ABSTRACT_MULTI_SET_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEE_TYPE_ABSTRACT_MULTI_SET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_MULTI_SET_GET_CLASS(obj : longint) : longint;
begin
  GEE_ABSTRACT_MULTI_SET_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEE_TYPE_ABSTRACT_MULTI_SET,GeeAbstractMultiSetClass);
end;

{ was #define dname def_expr }
function GEE_TYPE_QUEUE : longint; { return type might be wrong }
  begin
    GEE_TYPE_QUEUE:=gee_queue_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_QUEUE(obj : longint) : longint;
begin
  GEE_QUEUE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_QUEUE,GeeQueue);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_QUEUE(obj : longint) : longint;
begin
  GEE_IS_QUEUE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_QUEUE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_QUEUE_GET_INTERFACE(obj : longint) : longint;
begin
  GEE_QUEUE_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,GEE_TYPE_QUEUE,GeeQueueIface);
end;

{ was #define dname def_expr }
function GEE_TYPE_ABSTRACT_QUEUE : longint; { return type might be wrong }
  begin
    GEE_TYPE_ABSTRACT_QUEUE:=gee_abstract_queue_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_QUEUE(obj : longint) : longint;
begin
  GEE_ABSTRACT_QUEUE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_ABSTRACT_QUEUE,GeeAbstractQueue);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_QUEUE_CLASS(klass : longint) : longint;
begin
  GEE_ABSTRACT_QUEUE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEE_TYPE_ABSTRACT_QUEUE,GeeAbstractQueueClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_ABSTRACT_QUEUE(obj : longint) : longint;
begin
  GEE_IS_ABSTRACT_QUEUE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_ABSTRACT_QUEUE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_ABSTRACT_QUEUE_CLASS(klass : longint) : longint;
begin
  GEE_IS_ABSTRACT_QUEUE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEE_TYPE_ABSTRACT_QUEUE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ABSTRACT_QUEUE_GET_CLASS(obj : longint) : longint;
begin
  GEE_ABSTRACT_QUEUE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEE_TYPE_ABSTRACT_QUEUE,GeeAbstractQueueClass);
end;

{ was #define dname def_expr }
function GEE_TYPE_ARRAY_LIST : longint; { return type might be wrong }
  begin
    GEE_TYPE_ARRAY_LIST:=gee_array_list_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ARRAY_LIST(obj : longint) : longint;
begin
  GEE_ARRAY_LIST:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_ARRAY_LIST,GeeArrayList);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ARRAY_LIST_CLASS(klass : longint) : longint;
begin
  GEE_ARRAY_LIST_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEE_TYPE_ARRAY_LIST,GeeArrayListClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_ARRAY_LIST(obj : longint) : longint;
begin
  GEE_IS_ARRAY_LIST:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_ARRAY_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_ARRAY_LIST_CLASS(klass : longint) : longint;
begin
  GEE_IS_ARRAY_LIST_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEE_TYPE_ARRAY_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ARRAY_LIST_GET_CLASS(obj : longint) : longint;
begin
  GEE_ARRAY_LIST_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEE_TYPE_ARRAY_LIST,GeeArrayListClass);
end;

{ was #define dname def_expr }
function GEE_TYPE_DEQUE : longint; { return type might be wrong }
  begin
    GEE_TYPE_DEQUE:=gee_deque_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_DEQUE(obj : longint) : longint;
begin
  GEE_DEQUE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_DEQUE,GeeDeque);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_DEQUE(obj : longint) : longint;
begin
  GEE_IS_DEQUE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_DEQUE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_DEQUE_GET_INTERFACE(obj : longint) : longint;
begin
  GEE_DEQUE_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,GEE_TYPE_DEQUE,GeeDequeIface);
end;

{ was #define dname def_expr }
function GEE_TYPE_ARRAY_QUEUE : longint; { return type might be wrong }
  begin
    GEE_TYPE_ARRAY_QUEUE:=gee_array_queue_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ARRAY_QUEUE(obj : longint) : longint;
begin
  GEE_ARRAY_QUEUE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_ARRAY_QUEUE,GeeArrayQueue);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ARRAY_QUEUE_CLASS(klass : longint) : longint;
begin
  GEE_ARRAY_QUEUE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEE_TYPE_ARRAY_QUEUE,GeeArrayQueueClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_ARRAY_QUEUE(obj : longint) : longint;
begin
  GEE_IS_ARRAY_QUEUE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_ARRAY_QUEUE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_ARRAY_QUEUE_CLASS(klass : longint) : longint;
begin
  GEE_IS_ARRAY_QUEUE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEE_TYPE_ARRAY_QUEUE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_ARRAY_QUEUE_GET_CLASS(obj : longint) : longint;
begin
  GEE_ARRAY_QUEUE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEE_TYPE_ARRAY_QUEUE,GeeArrayQueueClass);
end;

{ was #define dname def_expr }
function GEE_TYPE_COMPARABLE : longint; { return type might be wrong }
  begin
    GEE_TYPE_COMPARABLE:=gee_comparable_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_COMPARABLE(obj : longint) : longint;
begin
  GEE_COMPARABLE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_COMPARABLE,GeeComparable);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_COMPARABLE(obj : longint) : longint;
begin
  GEE_IS_COMPARABLE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_COMPARABLE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_COMPARABLE_GET_INTERFACE(obj : longint) : longint;
begin
  GEE_COMPARABLE_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,GEE_TYPE_COMPARABLE,GeeComparableIface);
end;

{ was #define dname def_expr }
function GEE_TYPE_CONCURRENT_LIST : longint; { return type might be wrong }
  begin
    GEE_TYPE_CONCURRENT_LIST:=gee_concurrent_list_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_CONCURRENT_LIST(obj : longint) : longint;
begin
  GEE_CONCURRENT_LIST:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_CONCURRENT_LIST,GeeConcurrentList);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_CONCURRENT_LIST_CLASS(klass : longint) : longint;
begin
  GEE_CONCURRENT_LIST_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEE_TYPE_CONCURRENT_LIST,GeeConcurrentListClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_CONCURRENT_LIST(obj : longint) : longint;
begin
  GEE_IS_CONCURRENT_LIST:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_CONCURRENT_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_CONCURRENT_LIST_CLASS(klass : longint) : longint;
begin
  GEE_IS_CONCURRENT_LIST_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEE_TYPE_CONCURRENT_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_CONCURRENT_LIST_GET_CLASS(obj : longint) : longint;
begin
  GEE_CONCURRENT_LIST_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEE_TYPE_CONCURRENT_LIST,GeeConcurrentListClass);
end;

{ was #define dname def_expr }
function GEE_TYPE_CONCURRENT_SET : longint; { return type might be wrong }
  begin
    GEE_TYPE_CONCURRENT_SET:=gee_concurrent_set_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_CONCURRENT_SET(obj : longint) : longint;
begin
  GEE_CONCURRENT_SET:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_CONCURRENT_SET,GeeConcurrentSet);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_CONCURRENT_SET_CLASS(klass : longint) : longint;
begin
  GEE_CONCURRENT_SET_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEE_TYPE_CONCURRENT_SET,GeeConcurrentSetClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_CONCURRENT_SET(obj : longint) : longint;
begin
  GEE_IS_CONCURRENT_SET:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_CONCURRENT_SET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_CONCURRENT_SET_CLASS(klass : longint) : longint;
begin
  GEE_IS_CONCURRENT_SET_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEE_TYPE_CONCURRENT_SET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_CONCURRENT_SET_GET_CLASS(obj : longint) : longint;
begin
  GEE_CONCURRENT_SET_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEE_TYPE_CONCURRENT_SET,GeeConcurrentSetClass);
end;

{ was #define dname def_expr }
function GEE_CONCURRENT_SET_TYPE_RANGE_TYPE : longint; { return type might be wrong }
  begin
    GEE_CONCURRENT_SET_TYPE_RANGE_TYPE:=gee_concurrent_set_range_type_get_type;
  end;

{ was #define dname def_expr }
function GEE_TYPE_FUTURE : longint; { return type might be wrong }
  begin
    GEE_TYPE_FUTURE:=gee_future_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_FUTURE(obj : longint) : longint;
begin
  GEE_FUTURE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_FUTURE,GeeFuture);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_FUTURE(obj : longint) : longint;
begin
  GEE_IS_FUTURE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_FUTURE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_FUTURE_GET_INTERFACE(obj : longint) : longint;
begin
  GEE_FUTURE_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,GEE_TYPE_FUTURE,GeeFutureIface);
end;

{ was #define dname def_expr }
function GEE_TYPE_FUTURE_ERROR : longint; { return type might be wrong }
  begin
    GEE_TYPE_FUTURE_ERROR:=gee_future_error_get_type;
  end;

{ was #define dname def_expr }
function GEE_TYPE_HASHABLE : longint; { return type might be wrong }
  begin
    GEE_TYPE_HASHABLE:=gee_hashable_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_HASHABLE(obj : longint) : longint;
begin
  GEE_HASHABLE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_HASHABLE,GeeHashable);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_HASHABLE(obj : longint) : longint;
begin
  GEE_IS_HASHABLE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_HASHABLE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_HASHABLE_GET_INTERFACE(obj : longint) : longint;
begin
  GEE_HASHABLE_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,GEE_TYPE_HASHABLE,GeeHashableIface);
end;

{ was #define dname def_expr }
function GEE_TYPE_HASH_MAP : longint; { return type might be wrong }
  begin
    GEE_TYPE_HASH_MAP:=gee_hash_map_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_HASH_MAP(obj : longint) : longint;
begin
  GEE_HASH_MAP:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_HASH_MAP,GeeHashMap);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_HASH_MAP_CLASS(klass : longint) : longint;
begin
  GEE_HASH_MAP_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEE_TYPE_HASH_MAP,GeeHashMapClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_HASH_MAP(obj : longint) : longint;
begin
  GEE_IS_HASH_MAP:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_HASH_MAP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_HASH_MAP_CLASS(klass : longint) : longint;
begin
  GEE_IS_HASH_MAP_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEE_TYPE_HASH_MAP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_HASH_MAP_GET_CLASS(obj : longint) : longint;
begin
  GEE_HASH_MAP_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEE_TYPE_HASH_MAP,GeeHashMapClass);
end;

{ was #define dname def_expr }
function GEE_TYPE_HASH_MULTI_MAP : longint; { return type might be wrong }
  begin
    GEE_TYPE_HASH_MULTI_MAP:=gee_hash_multi_map_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_HASH_MULTI_MAP(obj : longint) : longint;
begin
  GEE_HASH_MULTI_MAP:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_HASH_MULTI_MAP,GeeHashMultiMap);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_HASH_MULTI_MAP_CLASS(klass : longint) : longint;
begin
  GEE_HASH_MULTI_MAP_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEE_TYPE_HASH_MULTI_MAP,GeeHashMultiMapClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_HASH_MULTI_MAP(obj : longint) : longint;
begin
  GEE_IS_HASH_MULTI_MAP:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_HASH_MULTI_MAP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_HASH_MULTI_MAP_CLASS(klass : longint) : longint;
begin
  GEE_IS_HASH_MULTI_MAP_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEE_TYPE_HASH_MULTI_MAP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_HASH_MULTI_MAP_GET_CLASS(obj : longint) : longint;
begin
  GEE_HASH_MULTI_MAP_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEE_TYPE_HASH_MULTI_MAP,GeeHashMultiMapClass);
end;

{ was #define dname def_expr }
function GEE_TYPE_HASH_MULTI_SET : longint; { return type might be wrong }
  begin
    GEE_TYPE_HASH_MULTI_SET:=gee_hash_multi_set_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_HASH_MULTI_SET(obj : longint) : longint;
begin
  GEE_HASH_MULTI_SET:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_HASH_MULTI_SET,GeeHashMultiSet);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_HASH_MULTI_SET_CLASS(klass : longint) : longint;
begin
  GEE_HASH_MULTI_SET_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEE_TYPE_HASH_MULTI_SET,GeeHashMultiSetClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_HASH_MULTI_SET(obj : longint) : longint;
begin
  GEE_IS_HASH_MULTI_SET:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_HASH_MULTI_SET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_HASH_MULTI_SET_CLASS(klass : longint) : longint;
begin
  GEE_IS_HASH_MULTI_SET_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEE_TYPE_HASH_MULTI_SET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_HASH_MULTI_SET_GET_CLASS(obj : longint) : longint;
begin
  GEE_HASH_MULTI_SET_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEE_TYPE_HASH_MULTI_SET,GeeHashMultiSetClass);
end;

{ was #define dname def_expr }
function GEE_TYPE_HASH_SET : longint; { return type might be wrong }
  begin
    GEE_TYPE_HASH_SET:=gee_hash_set_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_HASH_SET(obj : longint) : longint;
begin
  GEE_HASH_SET:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_HASH_SET,GeeHashSet);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_HASH_SET_CLASS(klass : longint) : longint;
begin
  GEE_HASH_SET_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEE_TYPE_HASH_SET,GeeHashSetClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_HASH_SET(obj : longint) : longint;
begin
  GEE_IS_HASH_SET:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_HASH_SET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_HASH_SET_CLASS(klass : longint) : longint;
begin
  GEE_IS_HASH_SET_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEE_TYPE_HASH_SET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_HASH_SET_GET_CLASS(obj : longint) : longint;
begin
  GEE_HASH_SET_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEE_TYPE_HASH_SET,GeeHashSetClass);
end;

{ was #define dname def_expr }
function GEE_HAZARD_POINTER_TYPE_POLICY : longint; { return type might be wrong }
  begin
    GEE_HAZARD_POINTER_TYPE_POLICY:=gee_hazard_pointer_policy_get_type;
  end;

{ was #define dname def_expr }
function GEE_HAZARD_POINTER_TYPE_RELEASE_POLICY : longint; { return type might be wrong }
  begin
    GEE_HAZARD_POINTER_TYPE_RELEASE_POLICY:=gee_hazard_pointer_release_policy_get_type;
  end;

{ was #define dname def_expr }
function GEE_TYPE_LINKED_LIST : longint; { return type might be wrong }
  begin
    GEE_TYPE_LINKED_LIST:=gee_linked_list_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_LINKED_LIST(obj : longint) : longint;
begin
  GEE_LINKED_LIST:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_LINKED_LIST,GeeLinkedList);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_LINKED_LIST_CLASS(klass : longint) : longint;
begin
  GEE_LINKED_LIST_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEE_TYPE_LINKED_LIST,GeeLinkedListClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_LINKED_LIST(obj : longint) : longint;
begin
  GEE_IS_LINKED_LIST:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_LINKED_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_LINKED_LIST_CLASS(klass : longint) : longint;
begin
  GEE_IS_LINKED_LIST_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEE_TYPE_LINKED_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_LINKED_LIST_GET_CLASS(obj : longint) : longint;
begin
  GEE_LINKED_LIST_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEE_TYPE_LINKED_LIST,GeeLinkedListClass);
end;

{ was #define dname def_expr }
function GEE_TYPE_PRIORITY_QUEUE : longint; { return type might be wrong }
  begin
    GEE_TYPE_PRIORITY_QUEUE:=gee_priority_queue_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_PRIORITY_QUEUE(obj : longint) : longint;
begin
  GEE_PRIORITY_QUEUE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_PRIORITY_QUEUE,GeePriorityQueue);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_PRIORITY_QUEUE_CLASS(klass : longint) : longint;
begin
  GEE_PRIORITY_QUEUE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEE_TYPE_PRIORITY_QUEUE,GeePriorityQueueClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_PRIORITY_QUEUE(obj : longint) : longint;
begin
  GEE_IS_PRIORITY_QUEUE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_PRIORITY_QUEUE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_PRIORITY_QUEUE_CLASS(klass : longint) : longint;
begin
  GEE_IS_PRIORITY_QUEUE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEE_TYPE_PRIORITY_QUEUE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_PRIORITY_QUEUE_GET_CLASS(obj : longint) : longint;
begin
  GEE_PRIORITY_QUEUE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEE_TYPE_PRIORITY_QUEUE,GeePriorityQueueClass);
end;

{ was #define dname def_expr }
function GEE_TYPE_PROMISE : longint; { return type might be wrong }
  begin
    GEE_TYPE_PROMISE:=gee_promise_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_PROMISE(obj : longint) : longint;
begin
  GEE_PROMISE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_PROMISE,GeePromise);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_PROMISE_CLASS(klass : longint) : longint;
begin
  GEE_PROMISE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEE_TYPE_PROMISE,GeePromiseClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_PROMISE(obj : longint) : longint;
begin
  GEE_IS_PROMISE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_PROMISE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_PROMISE_CLASS(klass : longint) : longint;
begin
  GEE_IS_PROMISE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEE_TYPE_PROMISE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_PROMISE_GET_CLASS(obj : longint) : longint;
begin
  GEE_PROMISE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEE_TYPE_PROMISE,GeePromiseClass);
end;

{ was #define dname def_expr }
function GEE_TYPE_TREE_MAP : longint; { return type might be wrong }
  begin
    GEE_TYPE_TREE_MAP:=gee_tree_map_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_TREE_MAP(obj : longint) : longint;
begin
  GEE_TREE_MAP:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_TREE_MAP,GeeTreeMap);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_TREE_MAP_CLASS(klass : longint) : longint;
begin
  GEE_TREE_MAP_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEE_TYPE_TREE_MAP,GeeTreeMapClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_TREE_MAP(obj : longint) : longint;
begin
  GEE_IS_TREE_MAP:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_TREE_MAP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_TREE_MAP_CLASS(klass : longint) : longint;
begin
  GEE_IS_TREE_MAP_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEE_TYPE_TREE_MAP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_TREE_MAP_GET_CLASS(obj : longint) : longint;
begin
  GEE_TREE_MAP_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEE_TYPE_TREE_MAP,GeeTreeMapClass);
end;

{ was #define dname def_expr }
function GEE_TYPE_TREE_MULTI_MAP : longint; { return type might be wrong }
  begin
    GEE_TYPE_TREE_MULTI_MAP:=gee_tree_multi_map_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_TREE_MULTI_MAP(obj : longint) : longint;
begin
  GEE_TREE_MULTI_MAP:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_TREE_MULTI_MAP,GeeTreeMultiMap);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_TREE_MULTI_MAP_CLASS(klass : longint) : longint;
begin
  GEE_TREE_MULTI_MAP_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEE_TYPE_TREE_MULTI_MAP,GeeTreeMultiMapClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_TREE_MULTI_MAP(obj : longint) : longint;
begin
  GEE_IS_TREE_MULTI_MAP:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_TREE_MULTI_MAP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_TREE_MULTI_MAP_CLASS(klass : longint) : longint;
begin
  GEE_IS_TREE_MULTI_MAP_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEE_TYPE_TREE_MULTI_MAP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_TREE_MULTI_MAP_GET_CLASS(obj : longint) : longint;
begin
  GEE_TREE_MULTI_MAP_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEE_TYPE_TREE_MULTI_MAP,GeeTreeMultiMapClass);
end;

{ was #define dname def_expr }
function GEE_TYPE_TREE_MULTI_SET : longint; { return type might be wrong }
  begin
    GEE_TYPE_TREE_MULTI_SET:=gee_tree_multi_set_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_TREE_MULTI_SET(obj : longint) : longint;
begin
  GEE_TREE_MULTI_SET:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_TREE_MULTI_SET,GeeTreeMultiSet);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_TREE_MULTI_SET_CLASS(klass : longint) : longint;
begin
  GEE_TREE_MULTI_SET_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEE_TYPE_TREE_MULTI_SET,GeeTreeMultiSetClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_TREE_MULTI_SET(obj : longint) : longint;
begin
  GEE_IS_TREE_MULTI_SET:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_TREE_MULTI_SET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_TREE_MULTI_SET_CLASS(klass : longint) : longint;
begin
  GEE_IS_TREE_MULTI_SET_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEE_TYPE_TREE_MULTI_SET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_TREE_MULTI_SET_GET_CLASS(obj : longint) : longint;
begin
  GEE_TREE_MULTI_SET_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEE_TYPE_TREE_MULTI_SET,GeeTreeMultiSetClass);
end;

{ was #define dname def_expr }
function GEE_TYPE_TREE_SET : longint; { return type might be wrong }
  begin
    GEE_TYPE_TREE_SET:=gee_tree_set_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_TREE_SET(obj : longint) : longint;
begin
  GEE_TREE_SET:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_TREE_SET,GeeTreeSet);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_TREE_SET_CLASS(klass : longint) : longint;
begin
  GEE_TREE_SET_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEE_TYPE_TREE_SET,GeeTreeSetClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_TREE_SET(obj : longint) : longint;
begin
  GEE_IS_TREE_SET:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_TREE_SET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_TREE_SET_CLASS(klass : longint) : longint;
begin
  GEE_IS_TREE_SET_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEE_TYPE_TREE_SET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_TREE_SET_GET_CLASS(obj : longint) : longint;
begin
  GEE_TREE_SET_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEE_TYPE_TREE_SET,GeeTreeSetClass);
end;

{ was #define dname def_expr }
function GEE_TYPE_UNROLLED_LINKED_LIST : longint; { return type might be wrong }
  begin
    GEE_TYPE_UNROLLED_LINKED_LIST:=gee_unrolled_linked_list_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_UNROLLED_LINKED_LIST(obj : longint) : longint;
begin
  GEE_UNROLLED_LINKED_LIST:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEE_TYPE_UNROLLED_LINKED_LIST,GeeUnrolledLinkedList);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_UNROLLED_LINKED_LIST_CLASS(klass : longint) : longint;
begin
  GEE_UNROLLED_LINKED_LIST_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEE_TYPE_UNROLLED_LINKED_LIST,GeeUnrolledLinkedListClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_UNROLLED_LINKED_LIST(obj : longint) : longint;
begin
  GEE_IS_UNROLLED_LINKED_LIST:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEE_TYPE_UNROLLED_LINKED_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_IS_UNROLLED_LINKED_LIST_CLASS(klass : longint) : longint;
begin
  GEE_IS_UNROLLED_LINKED_LIST_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEE_TYPE_UNROLLED_LINKED_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEE_UNROLLED_LINKED_LIST_GET_CLASS(obj : longint) : longint;
begin
  GEE_UNROLLED_LINKED_LIST_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEE_TYPE_UNROLLED_LINKED_LIST,GeeUnrolledLinkedListClass);
end;

{ was #define dname def_expr }
function GEE_FUTURE_ERROR : longint; { return type might be wrong }
  begin
    GEE_FUTURE_ERROR:=gee_future_error_quark;
  end;


end.
