{$IFDEF read_interface}


function objc_msg_lookup(receiver: Tid; op: TSEL): TIMP; cdecl; external libobjc;

type
  Tobjc_super = record
    self: Tid;
    super_class: TClass;
  end;
  Pobjc_super = ^Tobjc_super;

function objc_msg_lookup_super(super: Pobjc_super; sel: TSEL): TIMP; cdecl; external libobjc;

var
  __objc_msg_forward: function(para1: TSEL): TIMP; cvar;external libobjc;
  __objc_msg_forward2: function(para1: Tid; para2: TSEL): TIMP; cvar;external libobjc;

  // === Konventiert am: 31-1-26 15:22:03 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
