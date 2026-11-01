unit vterm_keycodes;

interface

uses
  fp_vnc;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef __VTERM_INPUT_H__}
{$define __VTERM_INPUT_H__}
type
  PVTermModifier = ^TVTermModifier;
  TVTermModifier =  Longint;
  Const
    VTERM_MOD_NONE = $00;
    VTERM_MOD_SHIFT = $01;
    VTERM_MOD_ALT = $02;
    VTERM_MOD_CTRL = $04;
    VTERM_ALL_MODS_MASK = $07;
;
{ Must be last }
type
  PVTermKey = ^TVTermKey;
  TVTermKey =  Longint;
  Const
    VTERM_KEY_NONE = 0;
    VTERM_KEY_ENTER = 1;
    VTERM_KEY_TAB = 2;
    VTERM_KEY_BACKSPACE = 3;
    VTERM_KEY_ESCAPE = 4;
    VTERM_KEY_UP = 5;
    VTERM_KEY_DOWN = 6;
    VTERM_KEY_LEFT = 7;
    VTERM_KEY_RIGHT = 8;
    VTERM_KEY_INS = 9;
    VTERM_KEY_DEL = 10;
    VTERM_KEY_HOME = 11;
    VTERM_KEY_END = 12;
    VTERM_KEY_PAGEUP = 13;
    VTERM_KEY_PAGEDOWN = 14;
    VTERM_KEY_FUNCTION_0 = 256;
    VTERM_KEY_FUNCTION_MAX = VTERM_KEY_FUNCTION_0+255;
    VTERM_KEY_KP_0 = (VTERM_KEY_FUNCTION_0+255)+1;
    VTERM_KEY_KP_1 = (VTERM_KEY_FUNCTION_0+255)+2;
    VTERM_KEY_KP_2 = (VTERM_KEY_FUNCTION_0+255)+3;
    VTERM_KEY_KP_3 = (VTERM_KEY_FUNCTION_0+255)+4;
    VTERM_KEY_KP_4 = (VTERM_KEY_FUNCTION_0+255)+5;
    VTERM_KEY_KP_5 = (VTERM_KEY_FUNCTION_0+255)+6;
    VTERM_KEY_KP_6 = (VTERM_KEY_FUNCTION_0+255)+7;
    VTERM_KEY_KP_7 = (VTERM_KEY_FUNCTION_0+255)+8;
    VTERM_KEY_KP_8 = (VTERM_KEY_FUNCTION_0+255)+9;
    VTERM_KEY_KP_9 = (VTERM_KEY_FUNCTION_0+255)+10;
    VTERM_KEY_KP_MULT = (VTERM_KEY_FUNCTION_0+255)+11;
    VTERM_KEY_KP_PLUS = (VTERM_KEY_FUNCTION_0+255)+12;
    VTERM_KEY_KP_COMMA = (VTERM_KEY_FUNCTION_0+255)+13;
    VTERM_KEY_KP_MINUS = (VTERM_KEY_FUNCTION_0+255)+14;
    VTERM_KEY_KP_PERIOD = (VTERM_KEY_FUNCTION_0+255)+15;
    VTERM_KEY_KP_DIVIDE = (VTERM_KEY_FUNCTION_0+255)+16;
    VTERM_KEY_KP_ENTER = (VTERM_KEY_FUNCTION_0+255)+17;
    VTERM_KEY_KP_EQUAL = (VTERM_KEY_FUNCTION_0+255)+18;
    VTERM_KEY_MAX = (VTERM_KEY_FUNCTION_0+255)+19;
    VTERM_N_KEYS = VTERM_KEY_MAX;
;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function VTERM_KEY_FUNCTION(n : longint) : longint;

{$endif}

// === Konventiert am: 1-11-26 19:19:28 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VTERM_KEY_FUNCTION(n : longint) : longint;
begin
  VTERM_KEY_FUNCTION:=VTERM_KEY_FUNCTION_0+n;
end;


end.
