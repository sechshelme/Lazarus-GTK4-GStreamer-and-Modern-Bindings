{$IFDEF read_interface}


{
 * Copyright (c) 1983, 1993
 *	The Regents of the University of California.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 4. Neither the name of the University nor the names of its contributors
 *    may be used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 *
 *	@(#)telnet.h	8.2 (Berkeley) 12/15/93
  }
{$ifndef _ARPA_TELNET_H}

const
  _ARPA_TELNET_H = 1;  
{
 * Definitions for the TELNET protocol.
  }
{ interpret as command:  }
  IAC = 255;  
{ you are not to use option  }
  DONT = 254;  
{ please, you use option  }
  DO = 253;  
{ I won't use option  }
  WONT = 252;  
{ I will use option  }
  WILL = 251;  
{ interpret as subnegotiation  }
  SB = 250;  
{ you may reverse the line  }
  GA = 249;  
{ erase the current line  }
  EL = 248;  
{ erase the current character  }
  EC = 247;  
{ are you there  }
  AYT = 246;  
{ abort output--but let prog finish  }
  AO = 245;  
{ interrupt process--permanently  }
  IP = 244;  
{ break  }
  BREAK = 243;  
{ data mark--for connect. cleaning  }
  DM = 242;  
{ nop  }
  NOP = 241;  
{ end sub negotiation  }
  SE = 240;  
{ end of record (transparent mode)  }
  EOR = 239;  
{ Abort process  }
  ABORT = 238;  
{ Suspend process  }
  SUSP = 237;  
{ End of file: EOF is already used...  }
  xEOF = 236;  
{ for telfunc calls  }
  SYNCH = 242;  
{$ifdef TELCMDS}
{ xxxxxxxxxxxxxxxxx
char *telcmds[] = 
	"EOF", "SUSP", "ABORT", "EOR",
	"SE", "NOP", "DMARK", "BRK", "IP", "AO", "AYT", "EC",
	"EL", "GA", "SB", "WILL", "WONT", "DO", "DONT", "IAC", 0,
;
#else
 }
  var
    telcmds : ^Pchar;cvar;external libc;
{$endif}

const
  TELCMD_FIRST = xEOF;  
  TELCMD_LAST = IAC;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function TELCMD_OK(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function TELCMD(x : longint) : longint;

{ telnet options  }
{ 8-bit data path  }
const
  TELOPT_BINARY = 0;  
{ echo  }
  TELOPT_ECHO = 1;  
{ prepare to reconnect  }
  TELOPT_RCP = 2;  
{ suppress go ahead  }
  TELOPT_SGA = 3;  
{ approximate message size  }
  TELOPT_NAMS = 4;  
{ give status  }
  TELOPT_STATUS = 5;  
{ timing mark  }
  TELOPT_TM = 6;  
{ remote controlled transmission and echo  }
  TELOPT_RCTE = 7;  
{ negotiate about output line width  }
  TELOPT_NAOL = 8;  
{ negotiate about output page size  }
  TELOPT_NAOP = 9;  
{ negotiate about CR disposition  }
  TELOPT_NAOCRD = 10;  
{ negotiate about horizontal tabstops  }
  TELOPT_NAOHTS = 11;  
{ negotiate about horizontal tab disposition  }
  TELOPT_NAOHTD = 12;  
{ negotiate about formfeed disposition  }
  TELOPT_NAOFFD = 13;  
{ negotiate about vertical tab stops  }
  TELOPT_NAOVTS = 14;  
{ negotiate about vertical tab disposition  }
  TELOPT_NAOVTD = 15;  
{ negotiate about output LF disposition  }
  TELOPT_NAOLFD = 16;  
{ extended ascii character set  }
  TELOPT_XASCII = 17;  
{ force logout  }
  TELOPT_LOGOUT = 18;  
{ byte macro  }
  TELOPT_BM = 19;  
{ data entry terminal  }
  TELOPT_DET = 20;  
{ supdup protocol  }
  TELOPT_SUPDUP = 21;  
{ supdup output  }
  TELOPT_SUPDUPOUTPUT = 22;  
{ send location  }
  TELOPT_SNDLOC = 23;  
{ terminal type  }
  TELOPT_TTYPE = 24;  
{ end or record  }
  TELOPT_EOR = 25;  
{ TACACS user identification  }
  TELOPT_TUID = 26;  
{ output marking  }
  TELOPT_OUTMRK = 27;  
{ terminal location number  }
  TELOPT_TTYLOC = 28;  
{ 3270 regime  }
  TELOPT_3270REGIME = 29;  
{ X.3 PAD  }
  TELOPT_X3PAD = 30;  
{ window size  }
  TELOPT_NAWS = 31;  
{ terminal speed  }
  TELOPT_TSPEED = 32;  
{ remote flow control  }
  TELOPT_LFLOW = 33;  
{ Linemode option  }
  TELOPT_LINEMODE = 34;  
{ X Display Location  }
  TELOPT_XDISPLOC = 35;  
{ Old - Environment variables  }
  TELOPT_OLD_ENVIRON = 36;  
{ Authenticate  }
  TELOPT_AUTHENTICATION = 37;  
{ Encryption option  }
  TELOPT_ENCRYPT = 38;  
{ New - Environment variables  }
  TELOPT_NEW_ENVIRON = 39;  
{ extended-options-list  }
  TELOPT_EXOPL = 255;  
  NTELOPTS = 1+TELOPT_NEW_ENVIRON;  
{ xxxxxxxxx
#ifdef TELOPTS
char *telopts[NTELOPTS+1] = 
	"BINARY", "ECHO", "RCP", "SUPPRESS GO AHEAD", "NAME",
	"STATUS", "TIMING MARK", "RCTE", "NAOL", "NAOP",
	"NAOCRD", "NAOHTS", "NAOHTD", "NAOFFD", "NAOVTS",
	"NAOVTD", "NAOLFD", "EXTEND ASCII", "LOGOUT", "BYTE MACRO",
	"DATA ENTRY TERMINAL", "SUPDUP", "SUPDUP OUTPUT",
	"SEND LOCATION", "TERMINAL TYPE", "END OF RECORD",
	"TACACS UID", "OUTPUT MARKING", "TTYLOC",
	"3270 REGIME", "X.3 PAD", "NAWS", "TSPEED", "LFLOW",
	"LINEMODE", "XDISPLOC", "OLD-ENVIRON", "AUTHENTICATION",
	"ENCRYPT", "NEW-ENVIRON",
	0,
;
 }
  TELOPT_FIRST = TELOPT_BINARY;  
  TELOPT_LAST = TELOPT_NEW_ENVIRON;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function TELOPT_OK(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function TELOPT(x : longint) : longint;

{$endif}
{ sub-option qualifiers  }
{ option is...  }

const
  TELQUAL_IS = 0;  
{ send option  }
  TELQUAL_SEND = 1;  
{ ENVIRON: informational version of IS  }
  TELQUAL_INFO = 2;  
{ AUTHENTICATION: client version of IS  }
  TELQUAL_REPLY = 2;  
{ AUTHENTICATION: client version of IS  }
  TELQUAL_NAME = 3;  
{ Disable remote flow control  }
  LFLOW_OFF = 0;  
{ Enable remote flow control  }
  LFLOW_ON = 1;  
{ Restart output on any char  }
  LFLOW_RESTART_ANY = 2;  
{ Restart output only on XON  }
  LFLOW_RESTART_XON = 3;  
{
 * LINEMODE suboptions
  }
  LM_MODE = 1;  
  LM_FORWARDMASK = 2;  
  LM_SLC = 3;  
  MODE_EDIT = $01;  
  MODE_TRAPSIG = $02;  
  MODE_ACK = $04;  
  MODE_SOFT_TAB = $08;  
  MODE_LIT_ECHO = $10;  
  MODE_MASK = $1f;  
{ Not part of protocol, but needed to simplify things...  }
  MODE_FLOW = $0100;  
  MODE_ECHO = $0200;  
  MODE_INBIN = $0400;  
  MODE_OUTBIN = $0800;  
  MODE_FORCE = $1000;  
  SLC_SYNCH = 1;  
  SLC_BRK = 2;  
  SLC_IP = 3;  
  SLC_AO = 4;  
  SLC_AYT = 5;  
  SLC_EOR = 6;  
  SLC_ABORT = 7;  
  SLC_EOF = 8;  
  SLC_SUSP = 9;  
  SLC_EC = 10;  
  SLC_EL = 11;  
  SLC_EW = 12;  
  SLC_RP = 13;  
  SLC_LNEXT = 14;  
  SLC_XON = 15;  
  SLC_XOFF = 16;  
  SLC_FORW1 = 17;  
  SLC_FORW2 = 18;  
  NSLC = 18;  
{
 * For backwards compatibility, we define SLC_NAMES to be the
 * list of names if SLC_NAMES is not defined.
  }
{ xxxxxxxxxxxxxxxx
#define	SLC_NAMELIST	"0", "SYNCH", "BRK", "IP", "AO", "AYT", "EOR", \
			"ABORT", "EOF", "SUSP", "EC", "EL", "EW", "RP", \
			"LNEXT", "XON", "XOFF", "FORW1", "FORW2", 0,
#ifdef	SLC_NAMES
char *slc_names[] = 
	SLC_NAMELIST
;
#else
 }
  var
    slc_names : ^Pchar;cvar;external libc;

const
  SLC_NAMES = SLC_NAMELIST;  
{$endif}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function SLC_NAME_OK(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SLC_NAME(x : longint) : longint;

const
  SLC_NOSUPPORT = 0;  
  SLC_CANTCHANGE = 1;  
  SLC_VARIABLE = 2;  
  SLC_DEFAULT = 3;  
  SLC_LEVELBITS = $03;  
  SLC_FUNC = 0;  
  SLC_FLAGS = 1;  
  SLC_VALUE = 2;  
  SLC_ACK = $80;  
  SLC_FLUSHIN = $40;  
  SLC_FLUSHOUT = $20;  
  OLD_ENV_VAR = 1;  
  OLD_ENV_VALUE = 0;  
  NEW_ENV_VAR = 0;  
  NEW_ENV_VALUE = 1;  
  ENV_ESC = 2;  
  ENV_USERVAR = 3;  
{
 * AUTHENTICATION suboptions
  }
{
 * Who is authenticating who ...
  }
{ Client authenticating server  }
  AUTH_WHO_CLIENT = 0;  
{ Server authenticating client  }
  AUTH_WHO_SERVER = 1;  
  AUTH_WHO_MASK = 1;  
{
 * amount of authentication done
  }
  AUTH_HOW_ONE_WAY = 0;  
  AUTH_HOW_MUTUAL = 2;  
  AUTH_HOW_MASK = 2;  
  AUTHTYPE_NULL = 0;  
  AUTHTYPE_KERBEROS_V4 = 1;  
  AUTHTYPE_KERBEROS_V5 = 2;  
  AUTHTYPE_SPX = 3;  
  AUTHTYPE_MINK = 4;  
  AUTHTYPE_CNT = 5;  
  AUTHTYPE_TEST = 99;  
{ xxxxxxxxxxxx
#ifdef	AUTH_NAMES
char *authtype_names[] = 
	"NULL", "KERBEROS_V4", "KERBEROS_V5", "SPX", "MINK", 0,
;
 }
{$else}
  var
    authtype_names : ^Pchar;cvar;external libc;
{$endif}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function AUTHTYPE_NAME_OK(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AUTHTYPE_NAME(x : longint) : longint;

{
 * ENCRYPTion suboptions
  }
{ I pick encryption type ...  }
const
  ENCRYPT_IS = 0;  
{ I support encryption types ...  }
  ENCRYPT_SUPPORT = 1;  
{ Initial setup response  }
  ENCRYPT_REPLY = 2;  
{ Am starting to send encrypted  }
  ENCRYPT_START = 3;  
{ Am ending encrypted  }
  ENCRYPT_END = 4;  
{ Request you start encrypting  }
  ENCRYPT_REQSTART = 5;  
{ Request you send encrypting  }
  ENCRYPT_REQEND = 6;  
  ENCRYPT_ENC_KEYID = 7;  
  ENCRYPT_DEC_KEYID = 8;  
  ENCRYPT_CNT = 9;  
  ENCTYPE_ANY = 0;  
  ENCTYPE_DES_CFB64 = 1;  
  ENCTYPE_DES_OFB64 = 2;  
  ENCTYPE_CNT = 3;  
{ xxxxxxxxxxxx
#ifdef	ENCRYPT_NAMES
char *encrypt_names[] = 
	"IS", "SUPPORT", "REPLY", "START", "END",
	"REQUEST-START", "REQUEST-END", "ENC-KEYID", "DEC-KEYID",
	0,
;
char *enctype_names[] = 
	"ANY", "DES_CFB64",  "DES_OFB64",  0,
;
#else
 }
  var
    encrypt_names : ^Pchar;cvar;external libc;
    enctype_names : ^Pchar;cvar;external libc;
{$endif}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function ENCRYPT_NAME_OK(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ENCRYPT_NAME(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ENCTYPE_NAME_OK(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ENCTYPE_NAME(x : longint) : longint;

{$endif}
{ arpa/telnet.h  }

// === Konventiert am: 15-8-25 13:58:54 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function TELCMD_OK(x : longint) : longint;
begin
  TELCMD_OK:=((dword(x))<=(TELCMD_LAST and (@(dword(x)))))>=TELCMD_FIRST;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function TELCMD(x : longint) : longint;
begin
  TELCMD:=telcmds[Tx(-(TELCMD_FIRST))];
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function TELOPT_OK(x : longint) : longint;
begin
  TELOPT_OK:=(dword(x))<=TELOPT_LAST;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function TELOPT(x : longint) : longint;
begin
  TELOPT:=telopts[Tx(-(TELOPT_FIRST))];
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SLC_NAME_OK(x : longint) : longint;
begin
  SLC_NAME_OK:=(dword(x))<=NSLC;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SLC_NAME(x : longint) : longint;
begin
  SLC_NAME:=slc_names[x];
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AUTHTYPE_NAME_OK(x : longint) : longint;
begin
  AUTHTYPE_NAME_OK:=(dword(x))<AUTHTYPE_CNT;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AUTHTYPE_NAME(x : longint) : longint;
begin
  AUTHTYPE_NAME:=authtype_names[x];
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ENCRYPT_NAME_OK(x : longint) : longint;
begin
  ENCRYPT_NAME_OK:=(dword(x))<ENCRYPT_CNT;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ENCRYPT_NAME(x : longint) : longint;
begin
  ENCRYPT_NAME:=encrypt_names[x];
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ENCTYPE_NAME_OK(x : longint) : longint;
begin
  ENCTYPE_NAME_OK:=(dword(x))<ENCTYPE_CNT;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ENCTYPE_NAME(x : longint) : longint;
begin
  ENCTYPE_NAME:=enctype_names[x];
end;


{$ENDIF read_implementation}
