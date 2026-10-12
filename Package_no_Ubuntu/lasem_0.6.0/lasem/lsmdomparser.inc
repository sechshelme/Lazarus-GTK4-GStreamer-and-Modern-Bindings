{$IFDEF read_interface}


procedure lsm_dom_document_append_from_memory(document: PLsmDomDocument; node: PLsmDomNode; buffer: pchar; size: Tgssize; error: PPGError); cdecl; external liblasem;
function lsm_dom_document_new_from_memory(buffer: pchar; size: Tgssize; error: PPGError): PLsmDomDocument; cdecl; external liblasem;
function lsm_dom_document_new_from_path(path: pchar; error: PPGError): PLsmDomDocument; cdecl; external liblasem;
function lsm_dom_document_new_from_url(url: pchar; error: PPGError): PLsmDomDocument; cdecl; external liblasem;
procedure lsm_dom_document_save_to_stream(document: PLsmDomDocument; stream: PGOutputStream; error: PPGError); cdecl; external liblasem;
procedure lsm_dom_document_save_to_memory(document: PLsmDomDocument; buffer: PPchar; size: Pgsize; error: PPGError); cdecl; external liblasem;
procedure lsm_dom_document_save_to_path(document: PLsmDomDocument; path: pchar; error: PPGError); cdecl; external liblasem;
procedure lsm_dom_document_save_to_url(document: PLsmDomDocument; url: pchar; error: PPGError); cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:38:00 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
