
unit nifticdf;
interface

{
  Automatically converted by H2Pas 1.0.0 from nifticdf.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nifticdf.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
Pdouble  = ^double;
Pdword  = ^dword;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{********************************************************************** }
{*  Functions to compute cumulative distributions and their inverses  * }
{*  for the NIfTI-1 statistical types.  Much of this code is taken    * }
{*  from other sources.  In particular, the cdflib functions by       * }
{*  Brown and Lovato make up the bulk of this file.  That code        * }
{*  was placed in the public domain.  The code by K. Krishnamoorthy   * }
{*  is also released for unrestricted use.  Finally, the other parts  * }
{*  of this file (by RW Cox) are released to the public domain.       * }
{*                                                                    * }
{*  Most of this file comprises a set of "static" functions, to be    * }
{*  called by the user-level functions at the very end of the file.   * }
{*  At the end of the file is a simple main program to drive these    * }
{*  functions.                                                        * }
{*                                                                    * }
{*  To find the user-level functions, search forward for the string   * }
{*  "nifti_", which will be at about line 11000.                      * }
{********************************************************************** }
{****==============================================================**** }
{**** Neither the National Institutes of Health (NIH), the DFWG,   **** }
{**** nor any of the members or employees of these institutions    **** }
{**** imply any warranty of usefulness of this material for any    **** }
{**** purpose, and do not assume any liability for damages,        **** }
{**** incidental or otherwise, caused by any use of this document. **** }
{**** If these conditions are not acceptable, do not use this!     **** }
{****==============================================================**** }
{********************************************************************** }
{$include <stdlib.h>}
{***************************************************************************
 Statistical codes implemented :

     NIFTI_INTENT_CORREL     = correlation statistic
     NIFTI_INTENT_TTEST      = t statistic (central)
     NIFTI_INTENT_FTEST      = F statistic (central)
     NIFTI_INTENT_ZSCORE     = N(0,1) statistic
     NIFTI_INTENT_CHISQ      = Chi-squared (central)
     NIFTI_INTENT_BETA       = Beta variable (central)
     NIFTI_INTENT_BINOM      = Binomial variable
     NIFTI_INTENT_GAMMA      = Gamma distribution
     NIFTI_INTENT_POISSON    = Poisson distribution
     NIFTI_INTENT_FTEST_NONC = noncentral F statistic
     NIFTI_INTENT_CHISQ_NONC = noncentral chi-squared
     NIFTI_INTENT_TTEST_NONC = noncentral t statistic
     NIFTI_INTENT_CHI        = Chi statistic (central)
     NIFTI_INTENT_INVGAUSS   = inverse Gaussian variable
     NIFTI_INTENT_WEIBULL    = Weibull distribution
     NIFTI_INTENT_EXTVAL     = Extreme value type I
     NIFTI_INTENT_NORMAL     = N(mu,variance) normal
     NIFTI_INTENT_LOGISTIC   = Logistic distribution
     NIFTI_INTENT_LAPLACE    = Laplace distribution
     NIFTI_INTENT_UNIFORM    = Uniform distribution
     NIFTI_INTENT_PVAL       = "p-value"
     NIFTI_INTENT_LOGPVAL    = -ln(p)
     NIFTI_INTENT_LOG10PVAL  = -log10(p)
**************************************************************************** }
(* Const before declarator ignored *)
(* Const before declarator ignored *)
  var
    inam : ^Pchar;cvar;external;

function nifti_intent_code(name:Pchar):longint;cdecl;external;
function nifti_stat2cdf(val:Tdouble; code:longint; p1:Tdouble; p2:Tdouble; p3:Tdouble):Tdouble;cdecl;external;
function nifti_stat2rcdf(val:Tdouble; code:longint; p1:Tdouble; p2:Tdouble; p3:Tdouble):Tdouble;cdecl;external;
function nifti_cdf2stat(p:Tdouble; code:longint; p1:Tdouble; p2:Tdouble; p3:Tdouble):Tdouble;cdecl;external;
{$if defined(__COMPILE_UNUSED_FUNCTIONS__)}

function nifti_rcdf2stat(q:Tdouble; code:longint; p1:Tdouble; p2:Tdouble; p3:Tdouble):Tdouble;cdecl;external;
{$endif}
{(__COMPILE_UNUSED_FUNCTIONS__) }

function nifti_stat2zscore(val:Tdouble; code:longint; p1:Tdouble; p2:Tdouble; p3:Tdouble):Tdouble;cdecl;external;
function nifti_stat2hzscore(val:Tdouble; code:longint; p1:Tdouble; p2:Tdouble; p3:Tdouble):Tdouble;cdecl;external;
{* Prototypes for cdflib functions * }
(* Const before type ignored *)
(* Const before type ignored *)
function algdiv(para1:Pdouble; para2:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function alngam(para1:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function alnrel(para1:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function apser(para1:Pdouble; para2:Pdouble; para3:Pdouble; para4:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function basym(para1:Pdouble; para2:Pdouble; para3:Pdouble; para4:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function bcorr(para1:Pdouble; para2:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function betaln(para1:Pdouble; para2:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function bfrac(para1:Pdouble; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
           para6:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure bgrat(para1:Pdouble; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble; ierr:Plongint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function bpser(para1:Pdouble; para2:Pdouble; para3:Pdouble; para4:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure bratio(para1:Pdouble; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble; para7:Plongint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function brcmp1(para1:Plongint; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function brcomp(para1:Pdouble; para2:Pdouble; para3:Pdouble; para4:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function bup(para1:Pdouble; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:Plongint; 
           para6:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
procedure cdfbet(para1:Plongint; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble; para7:Pdouble; para8:Plongint; para9:Pdouble);cdecl;external;
(* Const before type ignored *)
procedure cdfbin(para1:Plongint; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble; para7:Pdouble; para8:Plongint; para9:Pdouble);cdecl;external;
(* Const before type ignored *)
procedure cdfchi(para1:Plongint; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
            para6:Plongint; para7:Pdouble);cdecl;external;
(* Const before type ignored *)
procedure cdfchn(para1:Plongint; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble; para7:Plongint; para8:Pdouble);cdecl;external;
(* Const before type ignored *)
procedure cdff(para1:Plongint; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble; para7:Plongint; para8:Pdouble);cdecl;external;
(* Const before type ignored *)
procedure cdffnc(para1:Plongint; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble; para7:Pdouble; status:Plongint; para9:Pdouble);cdecl;external;
(* Const before type ignored *)
procedure cdfgam(para1:Plongint; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble; para7:Plongint; para8:Pdouble);cdecl;external;
{$if defined(__COMPILE_UNUSED_FUNCTIONS__)}

procedure cdfnbn(para1:Plongint; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble; para7:Pdouble; para8:Plongint; para9:Pdouble);cdecl;external;
procedure cdfnor(para1:Plongint; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble; para7:Plongint; para8:Pdouble);cdecl;external;
{$endif}
{defined(__COMPILE_UNUSED_FUNCTIONS__) }
(* Const before type ignored *)

procedure cdfpoi(para1:Plongint; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
            para6:Plongint; para7:Pdouble);cdecl;external;
(* Const before type ignored *)
procedure cdft(para1:Plongint; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
            para6:Plongint; para7:Pdouble);cdecl;external;
procedure cumbet(para1:Pdouble; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure cumbin(para1:Pdouble; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure cumchi(para1:Pdouble; para2:Pdouble; para3:Pdouble; para4:Pdouble);cdecl;external;
(* Const before type ignored *)
procedure cumchn(para1:Pdouble; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:Pdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cumf(para1:Pdouble; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:Pdouble);cdecl;external;
(* Const before type ignored *)
procedure cumfnc(para1:Pdouble; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble);cdecl;external;
procedure cumgam(para1:Pdouble; para2:Pdouble; para3:Pdouble; para4:Pdouble);cdecl;external;
{$if defined(__COMPILE_UNUSED_FUNCTIONS__)}

procedure cumnbn(para1:Pdouble; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble);cdecl;external;
{$endif}
{defined(__COMPILE_UNUSED_FUNCTIONS__) }
(* Const before type ignored *)

procedure cumnor(para1:Pdouble; para2:Pdouble; para3:Pdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure cumpoi(para1:Pdouble; para2:Pdouble; para3:Pdouble; para4:Pdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure cumt(para1:Pdouble; para2:Pdouble; para3:Pdouble; para4:Pdouble);cdecl;external;
{$if defined(__COMPILE_UNUSED_FUNCTIONS__)}

function dbetrm(para1:Pdouble; para2:Pdouble):Tdouble;cdecl;external;
{$endif}
{defined(__COMPILE_UNUSED_FUNCTIONS__) }
{xxxxxxxdouble devlpl(const double [],const int*,const double*); }
{$if defined(__COMPILE_UNUSED_FUNCTIONS__)}

function dexpm1(para1:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function dinvnr(p:Pdouble; q:Pdouble):Tdouble;cdecl;external;
{$endif}
{defined(__COMPILE_UNUSED_FUNCTIONS__) }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

procedure E0000(para1:longint; para2:Plongint; para3:Pdouble; para4:Pdouble; para5:Pdword; 
            para6:Pdword; para7:Pdouble; para8:Pdouble; para9:Pdouble; para10:Pdouble; 
            para11:Pdouble; para12:Pdouble; para13:Pdouble);cdecl;external;
procedure dinvr(para1:Plongint; para2:Pdouble; para3:Pdouble; para4:Pdword; para5:Pdword);cdecl;external;
procedure dstinv(para1:Pdouble; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble; para7:Pdouble);cdecl;external;
{$if defined(__COMPILE_UNUSED_FUNCTIONS__)}

function dlanor(para1:Pdouble):Tdouble;cdecl;external;
function dln1mx(para1:Pdouble):Tdouble;cdecl;external;
function dln1px(para1:Pdouble):Tdouble;cdecl;external;
function dlnbet(para1:Pdouble; para2:Pdouble):Tdouble;cdecl;external;
function dlngam(para1:Pdouble):Tdouble;cdecl;external;
function dstrem(para1:Pdouble):Tdouble;cdecl;external;
{$endif}
{defined(__COMPILE_UNUSED_FUNCTIONS__) }
(* Const before type ignored *)

function dt1(para1:Pdouble; para2:Pdouble; para3:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure E0001(para1:longint; para2:Plongint; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble; para7:Pdword; para8:Pdword; para9:Pdouble; para10:Pdouble; 
            para11:Pdouble; para12:Pdouble);cdecl;external;
procedure dzror(para1:Plongint; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
            para6:Pdword; para7:Pdword);cdecl;external;
procedure dstzr(zxlo:Pdouble; zxhi:Pdouble; zabstl:Pdouble; zreltl:Pdouble);cdecl;external;
(* Const before type ignored *)
function erf1(para1:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function erfc1(para1:Plongint; para2:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function esum(para1:Plongint; para2:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function exparg(para1:Plongint):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function fpser(para1:Pdouble; para2:Pdouble; para3:Pdouble; para4:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function gam1(para1:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gaminv(para1:Pdouble; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
            para6:Plongint);cdecl;external;
function gamln(para1:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function gamln1(para1:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function Xgamm(para1:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure grat1(para1:Pdouble; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
            para6:Pdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gratio(para1:Pdouble; para2:Pdouble; para3:Pdouble; para4:Pdouble; para5:Plongint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsumln(para1:Pdouble; para2:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function psi(para1:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function rcomp(para1:Pdouble; para2:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function rexp(para1:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function rlog(para1:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function rlog1(para1:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function spmpar(para1:Plongint):Tdouble;cdecl;external;
(* Const before type ignored *)
function stvaln(para1:Pdouble):Tdouble;cdecl;external;
function fifdint(para1:Tdouble):Tdouble;cdecl;external;
function fifdmax1(para1:Tdouble; para2:Tdouble):Tdouble;cdecl;external;
function fifdmin1(para1:Tdouble; para2:Tdouble):Tdouble;cdecl;external;
function fifdsign(para1:Tdouble; para2:Tdouble):Tdouble;cdecl;external;
function fifidint(para1:Tdouble):longint;cdecl;external;
function fifmod(para1:longint; para2:longint):longint;cdecl;external;
(* Const before type ignored *)
procedure ftnstop(para1:Pchar);cdecl;external;
(* Const before type ignored *)
function ipmpar(para1:Plongint):longint;cdecl;external;
{* end: prototypes for cdflib functions * }

implementation


end.
