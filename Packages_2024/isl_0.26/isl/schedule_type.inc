{$IFDEF read_interface}


type
  Tisl_schedule_node_type = longint;
const
  isl_schedule_node_error = -(1);
  isl_schedule_node_band = (-(1)) + 1;
  isl_schedule_node_context = (-(1)) + 2;
  isl_schedule_node_domain = (-(1)) + 3;
  isl_schedule_node_expansion = (-(1)) + 4;
  isl_schedule_node_extension = (-(1)) + 5;
  sl_schedule_node_filter = (-(1)) + 6;
  isl_schedule_node_leaf = (-(1)) + 7;
  isl_schedule_node_guard = (-(1)) + 8;
  isl_schedule_node_mark = (-(1)) + 9;
  isl_schedule_node_sequence = (-(1)) + 10;
  isl_schedule_node_set = (-(1)) + 11;

type
  Pisl_schedule_node = type Pointer;
  Pisl_schedule = type Pointer;

  // === Konventiert am: 5-11-26 15:53:51 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
