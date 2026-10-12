{$IFDEF read_interface}

type
  Tb2WorldId = record
    index1: Tuint16_t;
    generation: Tuint16_t;
  end;
  Pb2WorldId = ^Tb2WorldId;

  Tb2BodyId = record
    index1: Tint32_t;
    world0: Tuint16_t;
    generation: Tuint16_t;
  end;
  Pb2BodyId = ^Tb2BodyId;

  Tb2ShapeId = record
    index1: Tint32_t;
    world0: Tuint16_t;
    generation: Tuint16_t;
  end;
  Pb2ShapeId = ^Tb2ShapeId;

  Tb2ChainId = record
    index1: Tint32_t;
    world0: Tuint16_t;
    generation: Tuint16_t;
  end;
  Pb2ChainId = ^Tb2ChainId;

  Tb2JointId = record
    index1: Tint32_t;
    world0: Tuint16_t;
    generation: Tuint16_t;
  end;
  Pb2JointId = ^Tb2JointId;

  Tb2ContactId = record
    index1: Tint32_t;
    world0: Tuint16_t;
    padding: Tint16_t;
    generation: Tuint32_t;
  end;
  Pb2ContactId = ^Tb2ContactId;

const
  b2_nullWorldId: Tb2WorldId = (index1: 0; generation: 0);
  b2_nullBodyId: Tb2BodyId = (index1: 0; world0: 0; generation: 0);
  b2_nullShapeId: Tb2ShapeId = (index1: 0; world0: 0; generation: 0);
  b2_nullChainId: Tb2ChainId = (index1: 0; world0: 0; generation: 0);
  b2_nullJointId: Tb2JointId = (index1: 0; world0: 0; generation: 0);
  b2_nullContactId: Tb2ContactId = (index1: 0; world0: 0; padding: 0; generation: 0);

function b2StoreWorldId(id: Tb2WorldId): Tuint32_t; cdecl; external libbox2d;
function b2LoadWorldId(x: Tuint32_t): Tb2WorldId; cdecl; external libbox2d;
function b2StoreBodyId(id: Tb2BodyId): Tuint64_t; cdecl; external libbox2d;
function b2LoadBodyId(x: Tuint64_t): Tb2BodyId; cdecl; external libbox2d;
function b2StoreShapeId(id: Tb2ShapeId): Tuint64_t; cdecl; external libbox2d;
function b2LoadShapeId(x: Tuint64_t): Tb2ShapeId; cdecl; external libbox2d;
function b2StoreChainId(id: Tb2ChainId): Tuint64_t; cdecl; external libbox2d;
function b2LoadChainId(x: Tuint64_t): Tb2ChainId; cdecl; external libbox2d;
function b2StoreJointId(id: Tb2JointId): Tuint64_t; cdecl; external libbox2d;
function b2LoadJointId(x: Tuint64_t): Tb2JointId; cdecl; external libbox2d;
procedure b2StoreContactId(id: Tb2ContactId; values: Puint32_t); cdecl; external libbox2d;
function b2LoadContactId(values: Puint32_t): Tb2ContactId; cdecl; external libbox2d;

// === Konventiert am: 7-3-26 17:01:54 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
