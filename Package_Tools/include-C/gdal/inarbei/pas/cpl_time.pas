unit cpl_time;

interface

uses
  fp_gdal, cpl_port;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function CPLUnixTimeToYMDHMS(unixTime: TGIntBig; pRet: Ptm): Ptm; cdecl; external libgdal;
function CPLYMDHMSToUnixTime(brokendowntime: Ptm): TGIntBig; cdecl; external libgdal;
function CPLParseRFC822DateTime(pszRFC822DateTime: pchar; pnYear: Plongint; pnMonth: Plongint; pnDay: Plongint; pnHour: Plongint;
  pnMinute: Plongint; pnSecond: Plongint; pnTZFlag: Plongint; pnWeekDay: Plongint): longint; cdecl; external libgdal;

// === Konventiert am: 2-10-26 16:32:54 ===


implementation



end.
