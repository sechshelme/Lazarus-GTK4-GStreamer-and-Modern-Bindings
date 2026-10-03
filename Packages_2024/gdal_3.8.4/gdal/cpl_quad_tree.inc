{$IFDEF read_interface}


type
  PCPLRectObj = ^TCPLRectObj;
  TCPLRectObj = record
    minx: double;
    miny: double;
    maxx: double;
    maxy: double;
  end;

  PCPLQuadTree = type Pointer;

  TCPLQuadTreeGetBoundsFunc = procedure(hFeature: pointer; pBounds: PCPLRectObj); cdecl;
  TCPLQuadTreeGetBoundsExFunc = procedure(hFeature: pointer; pUserData: pointer; pBounds: PCPLRectObj); cdecl;
  TCPLQuadTreeForeachFunc = function(pElt: pointer; pUserData: pointer): longint; cdecl;
  TCPLQuadTreeDumpFeatureFunc = procedure(hFeature: pointer; nIndentLevel: longint; pUserData: pointer); cdecl;

function CPLQuadTreeCreate(pGlobalBounds: PCPLRectObj; pfnGetBounds: TCPLQuadTreeGetBoundsFunc): PCPLQuadTree; cdecl; external libgdal;
function CPLQuadTreeCreateEx(pGlobalBounds: PCPLRectObj; pfnGetBounds: TCPLQuadTreeGetBoundsExFunc; pUserData: pointer): PCPLQuadTree; cdecl; external libgdal;
procedure CPLQuadTreeDestroy(hQuadtree: PCPLQuadTree); cdecl; external libgdal;
procedure CPLQuadTreeSetBucketCapacity(hQuadtree: PCPLQuadTree; nBucketCapacity: longint); cdecl; external libgdal;
procedure CPLQuadTreeForceUseOfSubNodes(hQuadTree: PCPLQuadTree); cdecl; external libgdal;
function CPLQuadTreeGetAdvisedMaxDepth(nExpectedFeatures: longint): longint; cdecl; external libgdal;
procedure CPLQuadTreeSetMaxDepth(hQuadtree: PCPLQuadTree; nMaxDepth: longint); cdecl; external libgdal;
procedure CPLQuadTreeInsert(hQuadtree: PCPLQuadTree; hFeature: pointer); cdecl; external libgdal;
procedure CPLQuadTreeInsertWithBounds(hQuadtree: PCPLQuadTree; hFeature: pointer; psBounds: PCPLRectObj); cdecl; external libgdal;
procedure CPLQuadTreeRemove(hQuadtree: PCPLQuadTree; hFeature: pointer; psBounds: PCPLRectObj); cdecl; external libgdal;
function CPLQuadTreeSearch(hQuadtree: PCPLQuadTree; pAoi: PCPLRectObj; pnFeatureCount: Plongint): Ppointer; cdecl; external libgdal;
procedure CPLQuadTreeForeach(hQuadtree: PCPLQuadTree; pfnForeach: TCPLQuadTreeForeachFunc; pUserData: pointer); cdecl; external libgdal;
procedure CPLQuadTreeDump(hQuadtree: PCPLQuadTree; pfnDumpFeatureFunc: TCPLQuadTreeDumpFeatureFunc; pUserData: pointer); cdecl; external libgdal;
procedure CPLQuadTreeGetStats(hQuadtree: PCPLQuadTree; pnFeatureCount: Plongint; pnNodeCount: Plongint; pnMaxDepth: Plongint; pnMaxBucketCapacity: Plongint); cdecl; external libgdal;

// === Konventiert am: 2-10-26 16:33:01 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
