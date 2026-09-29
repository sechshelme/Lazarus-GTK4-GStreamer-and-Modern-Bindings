unit nifticdf;

interface

uses
  fp_nifti;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


var
  inam: PPchar; cvar;external libniftiio;

function nifti_intent_code(name: pchar): longint; cdecl; external libniftiio;
function nifti_stat2cdf(val: double; code: longint; p1: double; p2: double; p3: double): double; cdecl; external libniftiio;
function nifti_stat2rcdf(val: double; code: longint; p1: double; p2: double; p3: double): double; cdecl; external libniftiio;
function nifti_cdf2stat(p: double; code: longint; p1: double; p2: double; p3: double): double; cdecl; external libniftiio;

function nifti_rcdf2stat(q: double; code: longint; p1: double; p2: double; p3: double): double; cdecl; external libniftiio;

function nifti_stat2zscore(val: double; code: longint; p1: double; p2: double; p3: double): double; cdecl; external libniftiio;
function nifti_stat2hzscore(val: double; code: longint; p1: double; p2: double; p3: double): double; cdecl; external libniftiio;

function algdiv(para1: Pdouble; para2: Pdouble): double; cdecl; external libniftiio;
function alngam(para1: Pdouble): double; cdecl; external libniftiio;
function alnrel(para1: Pdouble): double; cdecl; external libniftiio;
function apser(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble): double; cdecl; external libniftiio;
function basym(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble): double; cdecl; external libniftiio;
function bcorr(para1: Pdouble; para2: Pdouble): double; cdecl; external libniftiio;
function betaln(para1: Pdouble; para2: Pdouble): double; cdecl; external libniftiio;
function bfrac(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble): double; cdecl; external libniftiio;
procedure bgrat(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble; ierr: Plongint); cdecl; external libniftiio;
function bpser(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble): double; cdecl; external libniftiio;
procedure bratio(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble; para7: Plongint); cdecl; external libniftiio;
function brcmp1(para1: Plongint; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble): double; cdecl; external libniftiio;
function brcomp(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble): double; cdecl; external libniftiio;
function bup(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Plongint;
  para6: Pdouble): double; cdecl; external libniftiio;
procedure cdfbet(para1: Plongint; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble; para7: Pdouble; para8: Plongint; para9: Pdouble); cdecl; external libniftiio;
procedure cdfbin(para1: Plongint; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble; para7: Pdouble; para8: Plongint; para9: Pdouble); cdecl; external libniftiio;
procedure cdfchi(para1: Plongint; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Plongint; para7: Pdouble); cdecl; external libniftiio;
procedure cdfchn(para1: Plongint; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble; para7: Plongint; para8: Pdouble); cdecl; external libniftiio;
procedure cdff(para1: Plongint; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble; para7: Plongint; para8: Pdouble); cdecl; external libniftiio;
procedure cdffnc(para1: Plongint; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble; para7: Pdouble; status: Plongint; para9: Pdouble); cdecl; external libniftiio;
procedure cdfgam(para1: Plongint; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble; para7: Plongint; para8: Pdouble); cdecl; external libniftiio;

procedure cdfnbn(para1: Plongint; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble; para7: Pdouble; para8: Plongint; para9: Pdouble); cdecl; external libniftiio;
procedure cdfnor(para1: Plongint; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble; para7: Plongint; para8: Pdouble); cdecl; external libniftiio;

procedure cdfpoi(para1: Plongint; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Plongint; para7: Pdouble); cdecl; external libniftiio;
procedure cdft(para1: Plongint; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Plongint; para7: Pdouble); cdecl; external libniftiio;
procedure cumbet(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libniftiio;
procedure cumbin(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libniftiio;
procedure cumchi(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble); cdecl; external libniftiio;
procedure cumchn(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble); cdecl; external libniftiio;
procedure cumf(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble); cdecl; external libniftiio;
procedure cumfnc(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libniftiio;
procedure cumgam(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble); cdecl; external libniftiio;

procedure cumnbn(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libniftiio;

procedure cumnor(para1: Pdouble; para2: Pdouble; para3: Pdouble); cdecl; external libniftiio;
procedure cumpoi(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble); cdecl; external libniftiio;
procedure cumt(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble); cdecl; external libniftiio;

function dbetrm(para1: Pdouble; para2: Pdouble): double; cdecl; external libniftiio;
function devlpl(para1: Pdouble; para2: PInteger; para3: Pdouble): double; cdecl; external libniftiio;

function dexpm1(para1: Pdouble): double; cdecl; external libniftiio;
function dinvnr(p: Pdouble; q: Pdouble): double; cdecl; external libniftiio;

procedure E0000(para1: longint; para2: Plongint; para3: Pdouble; para4: Pdouble; para5: Pdword;
  para6: Pdword; para7: Pdouble; para8: Pdouble; para9: Pdouble; para10: Pdouble;
  para11: Pdouble; para12: Pdouble; para13: Pdouble); cdecl; external libniftiio;
procedure dinvr(para1: Plongint; para2: Pdouble; para3: Pdouble; para4: Pdword; para5: Pdword); cdecl; external libniftiio;
procedure dstinv(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble; para7: Pdouble); cdecl; external libniftiio;

function dlanor(para1: Pdouble): double; cdecl; external libniftiio;
function dln1mx(para1: Pdouble): double; cdecl; external libniftiio;
function dln1px(para1: Pdouble): double; cdecl; external libniftiio;
function dlnbet(para1: Pdouble; para2: Pdouble): double; cdecl; external libniftiio;
function dlngam(para1: Pdouble): double; cdecl; external libniftiio;
function dstrem(para1: Pdouble): double; cdecl; external libniftiio;

function dt1(para1: Pdouble; para2: Pdouble; para3: Pdouble): double; cdecl; external libniftiio;
procedure E0001(para1: longint; para2: Plongint; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble; para7: Pdword; para8: Pdword; para9: Pdouble; para10: Pdouble;
  para11: Pdouble; para12: Pdouble); cdecl; external libniftiio;
procedure dzror(para1: Plongint; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdword; para7: Pdword); cdecl; external libniftiio;
procedure dstzr(zxlo: Pdouble; zxhi: Pdouble; zabstl: Pdouble; zreltl: Pdouble); cdecl; external libniftiio;
function erf1(para1: Pdouble): double; cdecl; external libniftiio;
function erfc1(para1: Plongint; para2: Pdouble): double; cdecl; external libniftiio;
function esum(para1: Plongint; para2: Pdouble): double; cdecl; external libniftiio;
function exparg(para1: Plongint): double; cdecl; external libniftiio;
function fpser(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble): double; cdecl; external libniftiio;
function gam1(para1: Pdouble): double; cdecl; external libniftiio;
procedure gaminv(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Plongint); cdecl; external libniftiio;
function gamln(para1: Pdouble): double; cdecl; external libniftiio;
function gamln1(para1: Pdouble): double; cdecl; external libniftiio;
function Xgamm(para1: Pdouble): double; cdecl; external libniftiio;
procedure grat1(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libniftiio;
procedure gratio(para1: Pdouble; para2: Pdouble; para3: Pdouble; para4: Pdouble; para5: Plongint); cdecl; external libniftiio;
function gsumln(para1: Pdouble; para2: Pdouble): double; cdecl; external libniftiio;
function psi(para1: Pdouble): double; cdecl; external libniftiio;
function rcomp(para1: Pdouble; para2: Pdouble): double; cdecl; external libniftiio;
function rexp(para1: Pdouble): double; cdecl; external libniftiio;
function rlog(para1: Pdouble): double; cdecl; external libniftiio;
function rlog1(para1: Pdouble): double; cdecl; external libniftiio;
function spmpar(para1: Plongint): double; cdecl; external libniftiio;
function stvaln(para1: Pdouble): double; cdecl; external libniftiio;
function fifdint(para1: double): double; cdecl; external libniftiio;
function fifdmax1(para1: double; para2: double): double; cdecl; external libniftiio;
function fifdmin1(para1: double; para2: double): double; cdecl; external libniftiio;
function fifdsign(para1: double; para2: double): double; cdecl; external libniftiio;
function fifidint(para1: double): longint; cdecl; external libniftiio;
function fifmod(para1: longint; para2: longint): longint; cdecl; external libniftiio;
procedure ftnstop(para1: pchar); cdecl; external libniftiio;
function ipmpar(para1: Plongint): longint; cdecl; external libniftiio;

// === Konventiert am: 29-9-26 14:50:12 ===


implementation



end.
