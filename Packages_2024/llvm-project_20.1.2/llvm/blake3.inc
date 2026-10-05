{$IFDEF read_interface}


const
  LLVM_BLAKE3_VERSION_STRING = '1.3.1';
  LLVM_BLAKE3_KEY_LEN = 32;
  LLVM_BLAKE3_OUT_LEN = 32;
  LLVM_BLAKE3_BLOCK_LEN = 64;
  LLVM_BLAKE3_CHUNK_LEN = 1024;
  LLVM_BLAKE3_MAX_DEPTH = 54;

type
  Pllvm_blake3_chunk_state = ^Tllvm_blake3_chunk_state;
  Tllvm_blake3_chunk_state = record
    cv: array[0..7] of Tuint32_t;
    chunk_counter: Tuint64_t;
    buf: array[0..(LLVM_BLAKE3_BLOCK_LEN) - 1] of Tuint8_t;
    buf_len: Tuint8_t;
    blocks_compressed: Tuint8_t;
    flags: Tuint8_t;
  end;

  Pllvm_blake3_hasher = ^Tllvm_blake3_hasher;
  Tllvm_blake3_hasher = record
    key: array[0..7] of Tuint32_t;
    chunk: Tllvm_blake3_chunk_state;
    cv_stack_len: Tuint8_t;
    cv_stack: array[0..((LLVM_BLAKE3_MAX_DEPTH + 1) * LLVM_BLAKE3_OUT_LEN) - 1] of Tuint8_t;
  end;

function llvm_blake3_version: pchar; cdecl; external libllvm;
procedure llvm_blake3_hasher_init(self: Pllvm_blake3_hasher); cdecl; external libllvm;
procedure llvm_blake3_hasher_init_keyed(self: Pllvm_blake3_hasher; key: Puint8_t); cdecl; external libllvm;
procedure llvm_blake3_hasher_init_derive_key(self: Pllvm_blake3_hasher; context: pchar); cdecl; external libllvm;
procedure llvm_blake3_hasher_init_derive_key_raw(self: Pllvm_blake3_hasher; context: pointer; context_len: Tsize_t); cdecl; external libllvm;
procedure llvm_blake3_hasher_update(self: Pllvm_blake3_hasher; input: pointer; input_len: Tsize_t); cdecl; external libllvm;
procedure llvm_blake3_hasher_finalize(self: Pllvm_blake3_hasher; out_: Puint8_t; out_len: Tsize_t); cdecl; external libllvm;
procedure llvm_blake3_hasher_finalize_seek(self: Pllvm_blake3_hasher; seek: Tuint64_t; out_: Puint8_t; out_len: Tsize_t); cdecl; external libllvm;
procedure llvm_blake3_hasher_reset(self: Pllvm_blake3_hasher); cdecl; external libllvm;

// === Konventiert am: 20-9-26 16:00:04 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
