{$IFDEF read_interface}


function CPLUnixTimeToYMDHMS(unixTime: TGIntBig; pRet: Ptm): Ptm; cdecl; external libgdal;
function CPLYMDHMSToUnixTime(brokendowntime: Ptm): TGIntBig; cdecl; external libgdal;
function CPLParseRFC822DateTime(pszRFC822DateTime: pchar; pnYear: Plongint; pnMonth: Plongint; pnDay: Plongint; pnHour: Plongint;
  pnMinute: Plongint; pnSecond: Plongint; pnTZFlag: Plongint; pnWeekDay: Plongint): longint; cdecl; external libgdal;

// === Konventiert am: 2-10-26 16:32:54 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
