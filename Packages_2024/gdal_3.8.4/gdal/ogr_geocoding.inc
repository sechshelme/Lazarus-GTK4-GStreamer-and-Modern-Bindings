{$IFDEF read_interface}


type
  POGRGeocodingSessionH = ^TOGRGeocodingSessionH;
  TOGRGeocodingSessionH = type Pointer;

function OGRGeocodeCreateSession(papszOptions: PPchar): TOGRGeocodingSessionH; cdecl; external libgdal;
procedure OGRGeocodeDestroySession(hSession: TOGRGeocodingSessionH); cdecl; external libgdal;
function OGRGeocode(hSession: TOGRGeocodingSessionH; pszQuery: pchar; papszStructuredQuery: PPchar; papszOptions: PPchar): TOGRLayerH; cdecl; external libgdal;
function OGRGeocodeReverse(hSession: TOGRGeocodingSessionH; dfLon: double; dfLat: double; papszOptions: PPchar): TOGRLayerH; cdecl; external libgdal;
procedure OGRGeocodeFreeResult(hLayer: TOGRLayerH); cdecl; external libgdal;

// === Konventiert am: 2-10-26 16:59:50 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
