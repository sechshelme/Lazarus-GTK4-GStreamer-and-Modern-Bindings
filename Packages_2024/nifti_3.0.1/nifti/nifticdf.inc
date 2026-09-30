{$IFDEF read_interface}


var
  inam: PPchar; cvar;external libnifticdf;

function nifti_intent_code(name: pchar): longint; cdecl; external libnifticdf;
function nifti_stat2cdf(val: double; code: longint; p1: double; p2: double; p3: double): double; cdecl; external libnifticdf;
function nifti_stat2rcdf(val: double; code: longint; p1: double; p2: double; p3: double): double; cdecl; external libnifticdf;
function nifti_cdf2stat(p: double; code: longint; p1: double; p2: double; p3: double): double; cdecl; external libnifticdf;

function nifti_rcdf2stat(q: double; code: longint; p1: double; p2: double; p3: double): double; cdecl; external libnifticdf;

function nifti_stat2zscore(val: double; code: longint; p1: double; p2: double; p3: double): double; cdecl; external libnifticdf;
function nifti_stat2hzscore(val: double; code: longint; p1: double; p2: double; p3: double): double; cdecl; external libnifticdf;

function algdiv(para1: Pdouble; para2: Pdouble): double; cdecl; external libnifticdf;
function alngam(para1: Pdouble): double; cdecl; external libnifticdf;
function alnrel(para1: Pdouble): double; cdecl; external libnifticdf;
function apser(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble): double; cdecl; external libnifticdf;
function basym(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble): double; cdecl; external libnifticdf;
function bcorr(para1: Pdouble; para2: Pdouble): double; cdecl; external libnifticdf;
function betaln(para1: Pdouble; para2: Pdouble): double; cdecl; external libnifticdf;
function bfrac(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble): double; cdecl; external libnifticdf;
procedure bgrat(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble; ierr: Plongint); cdecl; external libnifticdf;
function bpser(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble): double; cdecl; external libnifticdf;
procedure bratio(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble; para7: Plongint); cdecl; external libnifticdf;
function brcmp1(para1: Plongint; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble): double; cdecl; external libnifticdf;
function brcomp(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble): double; cdecl; external libnifticdf;
function bup(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Plongint;
  para6: Pdouble): double; cdecl; external libnifticdf;
procedure cdfbet(para1: Plongint; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble; para7: Pdouble; para8: Plongint; para9: Pdouble); cdecl; external libnifticdf;
procedure cdfbin(para1: Plongint; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble; para7: Pdouble; para8: Plongint; para9: Pdouble); cdecl; external libnifticdf;
procedure cdfchi(para1: Plongint; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Plongint; para7: Pdouble); cdecl; external libnifticdf;
procedure cdfchn(para1: Plongint; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble; para7: Plongint; para8: Pdouble); cdecl; external libnifticdf;
procedure cdff(para1: Plongint; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble; para7: Plongint; para8: Pdouble); cdecl; external libnifticdf;
procedure cdffnc(para1: Plongint; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble; para7: Pdouble; status: Plongint; para9: Pdouble); cdecl; external libnifticdf;
procedure cdfgam(para1: Plongint; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble; para7: Plongint; para8: Pdouble); cdecl; external libnifticdf;

procedure cdfnbn(para1: Plongint; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble; para7: Pdouble; para8: Plongint; para9: Pdouble); cdecl; external libnifticdf;
procedure cdfnor(para1: Plongint; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble; para7: Plongint; para8: Pdouble); cdecl; external libnifticdf;

procedure cdfpoi(para1: Plongint; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Plongint; para7: Pdouble); cdecl; external libnifticdf;
procedure cdft(para1: Plongint; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Plongint; para7: Pdouble); cdecl; external libnifticdf;
procedure cumbet(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libnifticdf;
procedure cumbin(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libnifticdf;
procedure cumchi(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble); cdecl; external libnifticdf;
procedure cumchn(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble); cdecl; external libnifticdf;
procedure cumf(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble); cdecl; external libnifticdf;
procedure cumfnc(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libnifticdf;
procedure cumgam(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble); cdecl; external libnifticdf;

procedure cumnbn(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libnifticdf;

procedure cumnor(para1: Pdouble; para2: Pdouble; para3: Pdouble); cdecl; external libnifticdf;
procedure cumpoi(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble); cdecl; external libnifticdf;
procedure cumt(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble); cdecl; external libnifticdf;

function dbetrm(para1: Pdouble; para2: Pdouble): double; cdecl; external libnifticdf;
function devlpl(para1: Pdouble; para2: PInteger; para3: Pdouble): double; cdecl; external libnifticdf;

function dexpm1(para1: Pdouble): double; cdecl; external libnifticdf;
function dinvnr(p: Pdouble; q: Pdouble): double; cdecl; external libnifticdf;

procedure E0000(para1: longint; para2: Plongint; para3: Pdouble; para4: Pdouble; para5: Pdword;
  para6: Pdword; para7: Pdouble; para8: Pdouble; para9: Pdouble; para10: Pdouble;
  para11: Pdouble; para12: Pdouble; para13: Pdouble); cdecl; external libnifticdf;
procedure dinvr(para1: Plongint; para2: Pdouble; para3: Pdouble; para4: Pdword; para5: Pdword); cdecl; external libnifticdf;
procedure dstinv(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble; para7: Pdouble); cdecl; external libnifticdf;

function dlanor(para1: Pdouble): double; cdecl; external libnifticdf;
function dln1mx(para1: Pdouble): double; cdecl; external libnifticdf;
function dln1px(para1: Pdouble): double; cdecl; external libnifticdf;
function dlnbet(para1: Pdouble; para2: Pdouble): double; cdecl; external libnifticdf;
function dlngam(para1: Pdouble): double; cdecl; external libnifticdf;
function dstrem(para1: Pdouble): double; cdecl; external libnifticdf;

function dt1(para1: Pdouble; para2: Pdouble; para3: Pdouble): double; cdecl; external libnifticdf;
procedure E0001(para1: longint; para2: Plongint; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble; para7: Pdword; para8: Pdword; para9: Pdouble; para10: Pdouble;
  para11: Pdouble; para12: Pdouble); cdecl; external libnifticdf;
procedure dzror(para1: Plongint; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdword; para7: Pdword); cdecl; external libnifticdf;
procedure dstzr(zxlo: Pdouble; zxhi: Pdouble; zabstl: Pdouble; zreltl: Pdouble); cdecl; external libnifticdf;
function erf1(para1: Pdouble): double; cdecl; external libnifticdf;
function erfc1(para1: Plongint; para2: Pdouble): double; cdecl; external libnifticdf;
function esum(para1: Plongint; para2: Pdouble): double; cdecl; external libnifticdf;
function exparg(para1: Plongint): double; cdecl; external libnifticdf;
function fpser(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble): double; cdecl; external libnifticdf;
function gam1(para1: Pdouble): double; cdecl; external libnifticdf;
procedure gaminv(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Plongint); cdecl; external libnifticdf;
function gamln(para1: Pdouble): double; cdecl; external libnifticdf;
function gamln1(para1: Pdouble): double; cdecl; external libnifticdf;
function Xgamm(para1: Pdouble): double; cdecl; external libnifticdf;
procedure grat1(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libnifticdf;
procedure gratio(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Plongint); cdecl; external libnifticdf;
function gsumln(para1: Pdouble; para2: Pdouble): double; cdecl; external libnifticdf;
function psi(para1: Pdouble): double; cdecl; external libnifticdf;
function rcomp(para1: Pdouble; para2: Pdouble): double; cdecl; external libnifticdf;
function rexp(para1: Pdouble): double; cdecl; external libnifticdf;
function rlog(para1: Pdouble): double; cdecl; external libnifticdf;
function rlog1(para1: Pdouble): double; cdecl; external libnifticdf;
function spmpar(para1: Plongint): double; cdecl; external libnifticdf;
function stvaln(para1: Pdouble): double; cdecl; external libnifticdf;
function fifdint(para1: double): double; cdecl; external libnifticdf;
function fifdmax1(para1: double; para2: double): double; cdecl; external libnifticdf;
function fifdmin1(para1: double; para2: double): double; cdecl; external libnifticdf;
function fifdsign(para1: double; para2: double): double; cdecl; external libnifticdf;
function fifidint(para1: double): longint; cdecl; external libnifticdf;
function fifmod(para1: longint; para2: longint): longint; cdecl; external libnifticdf;
procedure ftnstop(para1: pchar); cdecl; external libnifticdf;
function ipmpar(para1: Plongint): longint; cdecl; external libnifticdf;

// === Konventiert am: 29-9-26 14:50:12 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
