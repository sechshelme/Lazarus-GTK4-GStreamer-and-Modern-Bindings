{$IFDEF read_interface}


type
  TLsmExtents = record
    x1: double;
    y1: double;
    x2: double;
    y2: double;
  end;
  PLsmExtents = ^TLsmExtents;

function lsm_extents_get_type: TGType; cdecl; external liblasem;

type
  TLsmBox = record
    x: double;
    y: double;
    width: double;
    height: double;
  end;
  PLsmBox = ^TLsmBox;

function lsm_box_get_type: TGType; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:12:36 ===

function LSM_TYPE_BOX: TGType;
function LSM_TYPE_EXTENTS: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_EXTENTS: TGType;
begin
  LSM_TYPE_EXTENTS := lsm_extents_get_type;
end;


function LSM_TYPE_BOX: TGType;
begin
  LSM_TYPE_BOX := lsm_box_get_type;
end;


{$ENDIF read_implementation}
