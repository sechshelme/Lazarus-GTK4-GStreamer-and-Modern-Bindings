{$IFDEF read_interface}


const
  ARROW_FLAG_DICTIONARY_ORDERED = 1;
  ARROW_FLAG_NULLABLE = 2;
  ARROW_FLAG_MAP_KEYS_SORTED = 4;

type
  PArrowSchema = ^TArrowSchema;
  TArrowSchema = record
    format: pchar;
    name: pchar;
    metadata: pchar;
    flags: Tint64_t;
    n_children: Tint64_t;
    children: ^PArrowSchema;
    dictionary: PArrowSchema;
    release: procedure(para1: PArrowSchema); cdecl;
    private_data: pointer;
  end;

  PArrowArray = ^TArrowArray;
  TArrowArray = record
    length: Tint64_t;
    null_count: Tint64_t;
    offset: Tint64_t;
    n_buffers: Tint64_t;
    n_children: Tint64_t;
    buffers: ^pointer;
    children: ^PArrowArray;
    dictionary: PArrowArray;
    release: procedure(para1: PArrowArray); cdecl;
    private_data: pointer;
  end;

  PArrowArrayStream = ^TArrowArrayStream;
  TArrowArrayStream = record
    get_schema: function(para1: PArrowArrayStream; out_: PArrowSchema): longint; cdecl;
    get_next: function(para1: PArrowArrayStream; out_: PArrowArray): longint; cdecl;
    get_last_error: function(para1: PArrowArrayStream): pchar; cdecl;
    release: procedure(para1: PArrowArrayStream); cdecl;
    private_data: pointer;
  end;

  // === Konventiert am: 2-10-26 16:59:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
