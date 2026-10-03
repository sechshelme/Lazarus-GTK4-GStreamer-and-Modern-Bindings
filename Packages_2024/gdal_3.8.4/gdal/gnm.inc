{$IFDEF read_interface}


type
  PGNMDirection = ^TGNMDirection;
  TGNMDirection = longint;

const
  GNM_MD_NAME = 'net_name';
  GNM_MD_DESCR = 'net_description';
  GNM_MD_SRS = 'net_srs';
  GNM_MD_VERSION = 'net_version';
  GNM_MD_RULE = 'net_rule';
  GNM_MD_FORMAT = 'FORMAT';
  GNM_MD_FETCHEDGES = 'fetch_edge';
  GNM_MD_FETCHVERTEX = 'fetch_vertex';
  GNM_MD_NUM_PATHS = 'num_paths';
  GNM_MD_EMITTER = 'emitter';

type
  PGNMGraphAlgorithmType = ^TGNMGraphAlgorithmType;
  TGNMGraphAlgorithmType = longint;
const
  GATDijkstraShortestPath = 1;
  GATKShortestPath = 2;
  GATConnectedComponents = 3;

type
  PGNMRuleType = ^TGNMRuleType;
  TGNMRuleType = longint;
const
  GRTConnection = 0;

  // === Konventiert am: 2-10-26 16:54:28 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
