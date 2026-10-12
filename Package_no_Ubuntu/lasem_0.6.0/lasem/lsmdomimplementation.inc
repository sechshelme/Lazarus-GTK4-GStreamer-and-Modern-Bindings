{$IFDEF read_interface}


type
  TLsmDomDocumentCreateFunction = function: PLsmDomDocument; cdecl;

function lsm_dom_implementation_create_document(namespace_uri: pchar; qualified_name: pchar): PLsmDomDocument; cdecl; external liblasem;
procedure lsm_dom_implementation_cleanup; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:37:25 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
