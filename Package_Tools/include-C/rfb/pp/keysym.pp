
unit keysym;
interface

{
  Automatically converted by H2Pas 1.0.0 from keysym.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    keysym.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef XK_0}
{ $XConsortium: keysym.h,v 1.15 94/04/17 20:10:55 rws Exp $  }
{**********************************************************

Copyright (c) 1987  X Consortium

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
X CONSORTIUM BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Except as contained in this notice, the name of the X Consortium shall not be
used in advertising or otherwise to promote the sale, use or other dealings
in this Software without prior written authorization from the X Consortium.


Copyright 1987 by Digital Equipment Corporation, Maynard, Massachusetts.

                        All Rights Reserved

Permission to use, copy, modify, and distribute this software and its 
documentation for any purpose and without fee is hereby granted, 
provided that the above copyright notice appear in all copies and that
both that copyright notice and this permission notice appear in 
supporting documentation, and that the name of Digital not be
used in advertising or publicity pertaining to distribution of the
software without specific, written prior permission.  

DIGITAL DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING
ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL
DIGITAL BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR
ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS,
WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,
ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
SOFTWARE.

***************************************************************** }
{ default keysyms  }
{$define XK_MISCELLANY}
{$define XK_XKB_KEYS}
{$define XK_LATIN1}
{$define XK_LATIN2}
{$define XK_LATIN3}
{$define XK_LATIN4}
{$define XK_GREEK}
{ $TOG: keysymdef.h /main/25 1997/06/21 10:54:51 kaleb $  }
{**********************************************************
Copyright (c) 1987, 1994  X Consortium

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE X CONSORTIUM BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

Except as contained in this notice, the name of the X Consortium shall
not be used in advertising or otherwise to promote the sale, use or
other dealings in this Software without prior written authorization
from the X Consortium.


Copyright 1987 by Digital Equipment Corporation, Maynard, Massachusetts

                        All Rights Reserved

Permission to use, copy, modify, and distribute this software and its
documentation for any purpose and without fee is hereby granted,
provided that the above copyright notice appear in all copies and that
both that copyright notice and this permission notice appear in
supporting documentation, and that the name of Digital not be
used in advertising or publicity pertaining to distribution of the
software without specific, written prior permission.

DIGITAL DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING
ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL
DIGITAL BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR
ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS,
WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,
ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
SOFTWARE.

***************************************************************** }
{ void symbol  }

const
  XK_VoidSymbol = $FFFFFF;  
{$ifdef XK_MISCELLANY}
{
 * TTY Functions, cleverly chosen to map to ascii, for convenience of
 * programming, but could have been arbitrary (at the cost of lookup
 * tables in client code.
  }
{ back space, back char  }
  XK_BackSpace = $FF08;  
  XK_Tab = $FF09;  
{ Linefeed, LF  }
  XK_Linefeed = $FF0A;  
  XK_Clear = $FF0B;  
{ Return, enter  }
  XK_Return = $FF0D;  
{ Pause, hold  }
  XK_Pause = $FF13;  
  XK_Scroll_Lock = $FF14;  
  XK_Sys_Req = $FF15;  
  XK_Escape = $FF1B;  
{ Delete, rubout  }
  XK_Delete = $FFFF;  
{ International & multi-key character composition  }
{ Multi-key character compose  }
  XK_Multi_key = $FF20;  
  XK_SingleCandidate = $FF3C;  
  XK_MultipleCandidate = $FF3D;  
  XK_PreviousCandidate = $FF3E;  
{ Japanese keyboard support  }
{ Kanji, Kanji convert  }
  XK_Kanji = $FF21;  
{ Cancel Conversion  }
  XK_Muhenkan = $FF22;  
{ Start/Stop Conversion  }
  XK_Henkan_Mode = $FF23;  
{ Alias for Henkan_Mode  }
  XK_Henkan = $FF23;  
{ to Romaji  }
  XK_Romaji = $FF24;  
{ to Hiragana  }
  XK_Hiragana = $FF25;  
{ to Katakana  }
  XK_Katakana = $FF26;  
{ Hiragana/Katakana toggle  }
  XK_Hiragana_Katakana = $FF27;  
{ to Zenkaku  }
  XK_Zenkaku = $FF28;  
{ to Hankaku  }
  XK_Hankaku = $FF29;  
{ Zenkaku/Hankaku toggle  }
  XK_Zenkaku_Hankaku = $FF2A;  
{ Add to Dictionary  }
  XK_Touroku = $FF2B;  
{ Delete from Dictionary  }
  XK_Massyo = $FF2C;  
{ Kana Lock  }
  XK_Kana_Lock = $FF2D;  
{ Kana Shift  }
  XK_Kana_Shift = $FF2E;  
{ Alphanumeric Shift  }
  XK_Eisu_Shift = $FF2F;  
{ Alphanumeric toggle  }
  XK_Eisu_toggle = $FF30;  
{ Multiple/All Candidate(s)  }
  XK_Zen_Koho = $FF3D;  
{ Previous Candidate  }
  XK_Mae_Koho = $FF3E;  
{ 0xFF31 through 0xFF3F are under XK_KOREAN  }
{ Cursor control & motion  }
  XK_Home = $FF50;  
{ Move left, left arrow  }
  XK_Left = $FF51;  
{ Move up, up arrow  }
  XK_Up = $FF52;  
{ Move right, right arrow  }
  XK_Right = $FF53;  
{ Move down, down arrow  }
  XK_Down = $FF54;  
{ Prior, previous  }
  XK_Prior = $FF55;  
  XK_Page_Up = $FF55;  
{ Next  }
  XK_Next = $FF56;  
  XK_Page_Down = $FF56;  
{ EOL  }
  XK_End = $FF57;  
{ BOL  }
  XK_Begin = $FF58;  
{ Misc Functions  }
{ Select, mark  }
  XK_Select = $FF60;  
  XK_Print = $FF61;  
{ Execute, run, do  }
  XK_Execute = $FF62;  
{ Insert, insert here  }
  XK_Insert = $FF63;  
{ Undo, oops  }
  XK_Undo = $FF65;  
{ redo, again  }
  XK_Redo = $FF66;  
  XK_Menu = $FF67;  
{ Find, search  }
  XK_Find = $FF68;  
{ Cancel, stop, abort, exit  }
  XK_Cancel = $FF69;  
{ Help  }
  XK_Help = $FF6A;  
  XK_Break = $FF6B;  
{ Character set switch  }
  XK_Mode_switch = $FF7E;  
{ Alias for mode_switch  }
  XK_script_switch = $FF7E;  
  XK_Num_Lock = $FF7F;  
{ Keypad Functions, keypad numbers cleverly chosen to map to ascii  }
{ space  }
  XK_KP_Space = $FF80;  
  XK_KP_Tab = $FF89;  
{ enter  }
  XK_KP_Enter = $FF8D;  
{ PF1, KP_A, ...  }
  XK_KP_F1 = $FF91;  
  XK_KP_F2 = $FF92;  
  XK_KP_F3 = $FF93;  
  XK_KP_F4 = $FF94;  
  XK_KP_Home = $FF95;  
  XK_KP_Left = $FF96;  
  XK_KP_Up = $FF97;  
  XK_KP_Right = $FF98;  
  XK_KP_Down = $FF99;  
  XK_KP_Prior = $FF9A;  
  XK_KP_Page_Up = $FF9A;  
  XK_KP_Next = $FF9B;  
  XK_KP_Page_Down = $FF9B;  
  XK_KP_End = $FF9C;  
  XK_KP_Begin = $FF9D;  
  XK_KP_Insert = $FF9E;  
  XK_KP_Delete = $FF9F;  
{ equals  }
  XK_KP_Equal = $FFBD;  
  XK_KP_Multiply = $FFAA;  
  XK_KP_Add = $FFAB;  
{ separator, often comma  }
  XK_KP_Separator = $FFAC;  
  XK_KP_Subtract = $FFAD;  
  XK_KP_Decimal = $FFAE;  
  XK_KP_Divide = $FFAF;  
  XK_KP_0 = $FFB0;  
  XK_KP_1 = $FFB1;  
  XK_KP_2 = $FFB2;  
  XK_KP_3 = $FFB3;  
  XK_KP_4 = $FFB4;  
  XK_KP_5 = $FFB5;  
  XK_KP_6 = $FFB6;  
  XK_KP_7 = $FFB7;  
  XK_KP_8 = $FFB8;  
  XK_KP_9 = $FFB9;  
{
 * Auxiliary Functions; note the duplicate definitions for left and right
 * function keys;  Sun keyboards and a few other manufactures have such
 * function key groups on the left and/or right sides of the keyboard.
 * We've not found a keyboard with more than 35 function keys total.
  }
  XK_F1 = $FFBE;  
  XK_F2 = $FFBF;  
  XK_F3 = $FFC0;  
  XK_F4 = $FFC1;  
  XK_F5 = $FFC2;  
  XK_F6 = $FFC3;  
  XK_F7 = $FFC4;  
  XK_F8 = $FFC5;  
  XK_F9 = $FFC6;  
  XK_F10 = $FFC7;  
  XK_F11 = $FFC8;  
  XK_L1 = $FFC8;  
  XK_F12 = $FFC9;  
  XK_L2 = $FFC9;  
  XK_F13 = $FFCA;  
  XK_L3 = $FFCA;  
  XK_F14 = $FFCB;  
  XK_L4 = $FFCB;  
  XK_F15 = $FFCC;  
  XK_L5 = $FFCC;  
  XK_F16 = $FFCD;  
  XK_L6 = $FFCD;  
  XK_F17 = $FFCE;  
  XK_L7 = $FFCE;  
  XK_F18 = $FFCF;  
  XK_L8 = $FFCF;  
  XK_F19 = $FFD0;  
  XK_L9 = $FFD0;  
  XK_F20 = $FFD1;  
  XK_L10 = $FFD1;  
  XK_F21 = $FFD2;  
  XK_R1 = $FFD2;  
  XK_F22 = $FFD3;  
  XK_R2 = $FFD3;  
  XK_F23 = $FFD4;  
  XK_R3 = $FFD4;  
  XK_F24 = $FFD5;  
  XK_R4 = $FFD5;  
  XK_F25 = $FFD6;  
  XK_R5 = $FFD6;  
  XK_F26 = $FFD7;  
  XK_R6 = $FFD7;  
  XK_F27 = $FFD8;  
  XK_R7 = $FFD8;  
  XK_F28 = $FFD9;  
  XK_R8 = $FFD9;  
  XK_F29 = $FFDA;  
  XK_R9 = $FFDA;  
  XK_F30 = $FFDB;  
  XK_R10 = $FFDB;  
  XK_F31 = $FFDC;  
  XK_R11 = $FFDC;  
  XK_F32 = $FFDD;  
  XK_R12 = $FFDD;  
  XK_F33 = $FFDE;  
  XK_R13 = $FFDE;  
  XK_F34 = $FFDF;  
  XK_R14 = $FFDF;  
  XK_F35 = $FFE0;  
  XK_R15 = $FFE0;  
{ Modifiers  }
{ Left shift  }
  XK_Shift_L = $FFE1;  
{ Right shift  }
  XK_Shift_R = $FFE2;  
{ Left control  }
  XK_Control_L = $FFE3;  
{ Right control  }
  XK_Control_R = $FFE4;  
{ Caps lock  }
  XK_Caps_Lock = $FFE5;  
{ Shift lock  }
  XK_Shift_Lock = $FFE6;  
{ Left meta  }
  XK_Meta_L = $FFE7;  
{ Right meta  }
  XK_Meta_R = $FFE8;  
{ Left alt  }
  XK_Alt_L = $FFE9;  
{ Right alt  }
  XK_Alt_R = $FFEA;  
{ Left super  }
  XK_Super_L = $FFEB;  
{ Right super  }
  XK_Super_R = $FFEC;  
{ Left hyper  }
  XK_Hyper_L = $FFED;  
{ Right hyper  }
  XK_Hyper_R = $FFEE;  
{$endif}
{ XK_MISCELLANY  }
{
 * ISO 9995 Function and Modifier Keys
 * Byte 3 = 0xFE
  }
{$ifdef XK_XKB_KEYS}

const
  XK_ISO_Lock = $FE01;  
  XK_ISO_Level2_Latch = $FE02;  
  XK_ISO_Level3_Shift = $FE03;  
  XK_ISO_Level3_Latch = $FE04;  
  XK_ISO_Level3_Lock = $FE05;  
{ Alias for mode_switch  }
  XK_ISO_Group_Shift = $FF7E;  
  XK_ISO_Group_Latch = $FE06;  
  XK_ISO_Group_Lock = $FE07;  
  XK_ISO_Next_Group = $FE08;  
  XK_ISO_Next_Group_Lock = $FE09;  
  XK_ISO_Prev_Group = $FE0A;  
  XK_ISO_Prev_Group_Lock = $FE0B;  
  XK_ISO_First_Group = $FE0C;  
  XK_ISO_First_Group_Lock = $FE0D;  
  XK_ISO_Last_Group = $FE0E;  
  XK_ISO_Last_Group_Lock = $FE0F;  
  XK_ISO_Left_Tab = $FE20;  
  XK_ISO_Move_Line_Up = $FE21;  
  XK_ISO_Move_Line_Down = $FE22;  
  XK_ISO_Partial_Line_Up = $FE23;  
  XK_ISO_Partial_Line_Down = $FE24;  
  XK_ISO_Partial_Space_Left = $FE25;  
  XK_ISO_Partial_Space_Right = $FE26;  
  XK_ISO_Set_Margin_Left = $FE27;  
  XK_ISO_Set_Margin_Right = $FE28;  
  XK_ISO_Release_Margin_Left = $FE29;  
  XK_ISO_Release_Margin_Right = $FE2A;  
  XK_ISO_Release_Both_Margins = $FE2B;  
  XK_ISO_Fast_Cursor_Left = $FE2C;  
  XK_ISO_Fast_Cursor_Right = $FE2D;  
  XK_ISO_Fast_Cursor_Up = $FE2E;  
  XK_ISO_Fast_Cursor_Down = $FE2F;  
  XK_ISO_Continuous_Underline = $FE30;  
  XK_ISO_Discontinuous_Underline = $FE31;  
  XK_ISO_Emphasize = $FE32;  
  XK_ISO_Center_Object = $FE33;  
  XK_ISO_Enter = $FE34;  
  XK_dead_grave = $FE50;  
  XK_dead_acute = $FE51;  
  XK_dead_circumflex = $FE52;  
  XK_dead_tilde = $FE53;  
  XK_dead_macron = $FE54;  
  XK_dead_breve = $FE55;  
  XK_dead_abovedot = $FE56;  
  XK_dead_diaeresis = $FE57;  
  XK_dead_abovering = $FE58;  
  XK_dead_doubleacute = $FE59;  
  XK_dead_caron = $FE5A;  
  XK_dead_cedilla = $FE5B;  
  XK_dead_ogonek = $FE5C;  
  XK_dead_iota = $FE5D;  
  XK_dead_voiced_sound = $FE5E;  
  XK_dead_semivoiced_sound = $FE5F;  
  XK_dead_belowdot = $FE60;  
  XK_First_Virtual_Screen = $FED0;  
  XK_Prev_Virtual_Screen = $FED1;  
  XK_Next_Virtual_Screen = $FED2;  
  XK_Last_Virtual_Screen = $FED4;  
  XK_Terminate_Server = $FED5;  
  XK_AccessX_Enable = $FE70;  
  XK_AccessX_Feedback_Enable = $FE71;  
  XK_RepeatKeys_Enable = $FE72;  
  XK_SlowKeys_Enable = $FE73;  
  XK_BounceKeys_Enable = $FE74;  
  XK_StickyKeys_Enable = $FE75;  
  XK_MouseKeys_Enable = $FE76;  
  XK_MouseKeys_Accel_Enable = $FE77;  
  XK_Overlay1_Enable = $FE78;  
  XK_Overlay2_Enable = $FE79;  
  XK_AudibleBell_Enable = $FE7A;  
  XK_Pointer_Left = $FEE0;  
  XK_Pointer_Right = $FEE1;  
  XK_Pointer_Up = $FEE2;  
  XK_Pointer_Down = $FEE3;  
  XK_Pointer_UpLeft = $FEE4;  
  XK_Pointer_UpRight = $FEE5;  
  XK_Pointer_DownLeft = $FEE6;  
  XK_Pointer_DownRight = $FEE7;  
  XK_Pointer_Button_Dflt = $FEE8;  
  XK_Pointer_Button1 = $FEE9;  
  XK_Pointer_Button2 = $FEEA;  
  XK_Pointer_Button3 = $FEEB;  
  XK_Pointer_Button4 = $FEEC;  
  XK_Pointer_Button5 = $FEED;  
  XK_Pointer_DblClick_Dflt = $FEEE;  
  XK_Pointer_DblClick1 = $FEEF;  
  XK_Pointer_DblClick2 = $FEF0;  
  XK_Pointer_DblClick3 = $FEF1;  
  XK_Pointer_DblClick4 = $FEF2;  
  XK_Pointer_DblClick5 = $FEF3;  
  XK_Pointer_Drag_Dflt = $FEF4;  
  XK_Pointer_Drag1 = $FEF5;  
  XK_Pointer_Drag2 = $FEF6;  
  XK_Pointer_Drag3 = $FEF7;  
  XK_Pointer_Drag4 = $FEF8;  
  XK_Pointer_Drag5 = $FEFD;  
  XK_Pointer_EnableKeys = $FEF9;  
  XK_Pointer_Accelerate = $FEFA;  
  XK_Pointer_DfltBtnNext = $FEFB;  
  XK_Pointer_DfltBtnPrev = $FEFC;  
{$endif}
{
 * 3270 Terminal Keys
 * Byte 3 = 0xFD
  }
{$ifdef XK_3270}

const
  XK_3270_Duplicate = $FD01;  
  XK_3270_FieldMark = $FD02;  
  XK_3270_Right2 = $FD03;  
  XK_3270_Left2 = $FD04;  
  XK_3270_BackTab = $FD05;  
  XK_3270_EraseEOF = $FD06;  
  XK_3270_EraseInput = $FD07;  
  XK_3270_Reset = $FD08;  
  XK_3270_Quit = $FD09;  
  XK_3270_PA1 = $FD0A;  
  XK_3270_PA2 = $FD0B;  
  XK_3270_PA3 = $FD0C;  
  XK_3270_Test = $FD0D;  
  XK_3270_Attn = $FD0E;  
  XK_3270_CursorBlink = $FD0F;  
  XK_3270_AltCursor = $FD10;  
  XK_3270_KeyClick = $FD11;  
  XK_3270_Jump = $FD12;  
  XK_3270_Ident = $FD13;  
  XK_3270_Rule = $FD14;  
  XK_3270_Copy = $FD15;  
  XK_3270_Play = $FD16;  
  XK_3270_Setup = $FD17;  
  XK_3270_Record = $FD18;  
  XK_3270_ChangeScreen = $FD19;  
  XK_3270_DeleteWord = $FD1A;  
  XK_3270_ExSelect = $FD1B;  
  XK_3270_CursorSelect = $FD1C;  
  XK_3270_PrintScreen = $FD1D;  
  XK_3270_Enter = $FD1E;  
{$endif}
{
 *  Latin 1
 *  Byte 3 = 0
  }
{$ifdef XK_LATIN1}

const
  XK_space = $020;  
  XK_exclam = $021;  
  XK_quotedbl = $022;  
  XK_numbersign = $023;  
  XK_dollar = $024;  
  XK_percent = $025;  
  XK_ampersand = $026;  
  XK_apostrophe = $027;  
{ deprecated  }
  XK_quoteright = $027;  
  XK_parenleft = $028;  
  XK_parenright = $029;  
  XK_asterisk = $02a;  
  XK_plus = $02b;  
  XK_comma = $02c;  
  XK_minus = $02d;  
  XK_period = $02e;  
  XK_slash = $02f;  
  XK_0 = $030;  
  XK_1 = $031;  
  XK_2 = $032;  
  XK_3 = $033;  
  XK_4 = $034;  
  XK_5 = $035;  
  XK_6 = $036;  
  XK_7 = $037;  
  XK_8 = $038;  
  XK_9 = $039;  
  XK_colon = $03a;  
  XK_semicolon = $03b;  
  XK_less = $03c;  
  XK_equal = $03d;  
  XK_greater = $03e;  
  XK_question = $03f;  
  XK_at = $040;  
  XK_A = $041;  
  XK_B = $042;  
  XK_C = $043;  
  XK_D = $044;  
  XK_E = $045;  
  XK_F = $046;  
  XK_G = $047;  
  XK_H = $048;  
  XK_I = $049;  
  XK_J = $04a;  
  XK_K = $04b;  
  XK_L = $04c;  
  XK_M = $04d;  
  XK_N = $04e;  
  XK_O = $04f;  
  XK_P = $050;  
  XK_Q = $051;  
  XK_R = $052;  
  XK_S = $053;  
  XK_T = $054;  
  XK_U = $055;  
  XK_V = $056;  
  XK_W = $057;  
  XK_X = $058;  
  XK_Y = $059;  
  XK_Z = $05a;  
  XK_bracketleft = $05b;  
  XK_backslash = $05c;  
  XK_bracketright = $05d;  
  XK_asciicircum = $05e;  
  XK_underscore = $05f;  
  XK_grave = $060;  
{ deprecated  }
  XK_quoteleft = $060;  
  XK_a = $061;  
  XK_b = $062;  
  XK_c = $063;  
  XK_d = $064;  
  XK_e = $065;  
  XK_f = $066;  
  XK_g = $067;  
  XK_h = $068;  
  XK_i = $069;  
  XK_j = $06a;  
  XK_k = $06b;  
  XK_l = $06c;  
  XK_m = $06d;  
  XK_n = $06e;  
  XK_o = $06f;  
  XK_p = $070;  
  XK_q = $071;  
  XK_r = $072;  
  XK_s = $073;  
  XK_t = $074;  
  XK_u = $075;  
  XK_v = $076;  
  XK_w = $077;  
  XK_x = $078;  
  XK_y = $079;  
  XK_z = $07a;  
  XK_braceleft = $07b;  
  XK_bar = $07c;  
  XK_braceright = $07d;  
  XK_asciitilde = $07e;  
  XK_nobreakspace = $0a0;  
  XK_exclamdown = $0a1;  
  XK_cent = $0a2;  
  XK_sterling = $0a3;  
  XK_currency = $0a4;  
  XK_yen = $0a5;  
  XK_brokenbar = $0a6;  
  XK_section = $0a7;  
  XK_diaeresis = $0a8;  
  XK_copyright = $0a9;  
  XK_ordfeminine = $0aa;  
{ left angle quotation mark  }
  XK_guillemotleft = $0ab;  
  XK_notsign = $0ac;  
  XK_hyphen = $0ad;  
  XK_registered = $0ae;  
  XK_macron = $0af;  
  XK_degree = $0b0;  
  XK_plusminus = $0b1;  
  XK_twosuperior = $0b2;  
  XK_threesuperior = $0b3;  
  XK_acute = $0b4;  
  XK_mu = $0b5;  
  XK_paragraph = $0b6;  
  XK_periodcentered = $0b7;  
  XK_cedilla = $0b8;  
  XK_onesuperior = $0b9;  
  XK_masculine = $0ba;  
{ right angle quotation mark  }
  XK_guillemotright = $0bb;  
  XK_onequarter = $0bc;  
  XK_onehalf = $0bd;  
  XK_threequarters = $0be;  
  XK_questiondown = $0bf;  
  XK_Agrave = $0c0;  
  XK_Aacute = $0c1;  
  XK_Acircumflex = $0c2;  
  XK_Atilde = $0c3;  
  XK_Adiaeresis = $0c4;  
  XK_Aring = $0c5;  
  XK_AE = $0c6;  
  XK_Ccedilla = $0c7;  
  XK_Egrave = $0c8;  
  XK_Eacute = $0c9;  
  XK_Ecircumflex = $0ca;  
  XK_Ediaeresis = $0cb;  
  XK_Igrave = $0cc;  
  XK_Iacute = $0cd;  
  XK_Icircumflex = $0ce;  
  XK_Idiaeresis = $0cf;  
  XK_ETH = $0d0;  
{ deprecated  }
  XK_Eth = $0d0;  
  XK_Ntilde = $0d1;  
  XK_Ograve = $0d2;  
  XK_Oacute = $0d3;  
  XK_Ocircumflex = $0d4;  
  XK_Otilde = $0d5;  
  XK_Odiaeresis = $0d6;  
  XK_multiply = $0d7;  
  XK_Ooblique = $0d8;  
  XK_Ugrave = $0d9;  
  XK_Uacute = $0da;  
  XK_Ucircumflex = $0db;  
  XK_Udiaeresis = $0dc;  
  XK_Yacute = $0dd;  
  XK_THORN = $0de;  
{ deprecated  }
  XK_Thorn = $0de;  
  XK_ssharp = $0df;  
  XK_agrave = $0e0;  
  XK_aacute = $0e1;  
  XK_acircumflex = $0e2;  
  XK_atilde = $0e3;  
  XK_adiaeresis = $0e4;  
  XK_aring = $0e5;  
  XK_ae = $0e6;  
  XK_ccedilla = $0e7;  
  XK_egrave = $0e8;  
  XK_eacute = $0e9;  
  XK_ecircumflex = $0ea;  
  XK_ediaeresis = $0eb;  
  XK_igrave = $0ec;  
  XK_iacute = $0ed;  
  XK_icircumflex = $0ee;  
  XK_idiaeresis = $0ef;  
  XK_eth = $0f0;  
  XK_ntilde = $0f1;  
  XK_ograve = $0f2;  
  XK_oacute = $0f3;  
  XK_ocircumflex = $0f4;  
  XK_otilde = $0f5;  
  XK_odiaeresis = $0f6;  
  XK_division = $0f7;  
  XK_oslash = $0f8;  
  XK_ugrave = $0f9;  
  XK_uacute = $0fa;  
  XK_ucircumflex = $0fb;  
  XK_udiaeresis = $0fc;  
  XK_yacute = $0fd;  
  XK_thorn = $0fe;  
  XK_ydiaeresis = $0ff;  
{$endif}
{ XK_LATIN1  }
{
 *   Latin 2
 *   Byte 3 = 1
  }
{$ifdef XK_LATIN2}

const
  XK_Aogonek = $1a1;  
  XK_breve = $1a2;  
  XK_Lstroke = $1a3;  
  XK_Lcaron = $1a5;  
  XK_Sacute = $1a6;  
  XK_Scaron = $1a9;  
  XK_Scedilla = $1aa;  
  XK_Tcaron = $1ab;  
  XK_Zacute = $1ac;  
  XK_Zcaron = $1ae;  
  XK_Zabovedot = $1af;  
  XK_aogonek = $1b1;  
  XK_ogonek = $1b2;  
  XK_lstroke = $1b3;  
  XK_lcaron = $1b5;  
  XK_sacute = $1b6;  
  XK_caron = $1b7;  
  XK_scaron = $1b9;  
  XK_scedilla = $1ba;  
  XK_tcaron = $1bb;  
  XK_zacute = $1bc;  
  XK_doubleacute = $1bd;  
  XK_zcaron = $1be;  
  XK_zabovedot = $1bf;  
  XK_Racute = $1c0;  
  XK_Abreve = $1c3;  
  XK_Lacute = $1c5;  
  XK_Cacute = $1c6;  
  XK_Ccaron = $1c8;  
  XK_Eogonek = $1ca;  
  XK_Ecaron = $1cc;  
  XK_Dcaron = $1cf;  
  XK_Dstroke = $1d0;  
  XK_Nacute = $1d1;  
  XK_Ncaron = $1d2;  
  XK_Odoubleacute = $1d5;  
  XK_Rcaron = $1d8;  
  XK_Uring = $1d9;  
  XK_Udoubleacute = $1db;  
  XK_Tcedilla = $1de;  
  XK_racute = $1e0;  
  XK_abreve = $1e3;  
  XK_lacute = $1e5;  
  XK_cacute = $1e6;  
  XK_ccaron = $1e8;  
  XK_eogonek = $1ea;  
  XK_ecaron = $1ec;  
  XK_dcaron = $1ef;  
  XK_dstroke = $1f0;  
  XK_nacute = $1f1;  
  XK_ncaron = $1f2;  
  XK_odoubleacute = $1f5;  
  XK_udoubleacute = $1fb;  
  XK_rcaron = $1f8;  
  XK_uring = $1f9;  
  XK_tcedilla = $1fe;  
  XK_abovedot = $1ff;  
{$endif}
{ XK_LATIN2  }
{
 *   Latin 3
 *   Byte 3 = 2
  }
{$ifdef XK_LATIN3}

const
  XK_Hstroke = $2a1;  
  XK_Hcircumflex = $2a6;  
  XK_Iabovedot = $2a9;  
  XK_Gbreve = $2ab;  
  XK_Jcircumflex = $2ac;  
  XK_hstroke = $2b1;  
  XK_hcircumflex = $2b6;  
  XK_idotless = $2b9;  
  XK_gbreve = $2bb;  
  XK_jcircumflex = $2bc;  
  XK_Cabovedot = $2c5;  
  XK_Ccircumflex = $2c6;  
  XK_Gabovedot = $2d5;  
  XK_Gcircumflex = $2d8;  
  XK_Ubreve = $2dd;  
  XK_Scircumflex = $2de;  
  XK_cabovedot = $2e5;  
  XK_ccircumflex = $2e6;  
  XK_gabovedot = $2f5;  
  XK_gcircumflex = $2f8;  
  XK_ubreve = $2fd;  
  XK_scircumflex = $2fe;  
{$endif}
{ XK_LATIN3  }
{
 *   Latin 4
 *   Byte 3 = 3
  }
{$ifdef XK_LATIN4}

const
  XK_kra = $3a2;  
{ deprecated  }
  XK_kappa = $3a2;  
  XK_Rcedilla = $3a3;  
  XK_Itilde = $3a5;  
  XK_Lcedilla = $3a6;  
  XK_Emacron = $3aa;  
  XK_Gcedilla = $3ab;  
  XK_Tslash = $3ac;  
  XK_rcedilla = $3b3;  
  XK_itilde = $3b5;  
  XK_lcedilla = $3b6;  
  XK_emacron = $3ba;  
  XK_gcedilla = $3bb;  
  XK_tslash = $3bc;  
  XK_ENG = $3bd;  
  XK_eng = $3bf;  
  XK_Amacron = $3c0;  
  XK_Iogonek = $3c7;  
  XK_Eabovedot = $3cc;  
  XK_Imacron = $3cf;  
  XK_Ncedilla = $3d1;  
  XK_Omacron = $3d2;  
  XK_Kcedilla = $3d3;  
  XK_Uogonek = $3d9;  
  XK_Utilde = $3dd;  
  XK_Umacron = $3de;  
  XK_amacron = $3e0;  
  XK_iogonek = $3e7;  
  XK_eabovedot = $3ec;  
  XK_imacron = $3ef;  
  XK_ncedilla = $3f1;  
  XK_omacron = $3f2;  
  XK_kcedilla = $3f3;  
  XK_uogonek = $3f9;  
  XK_utilde = $3fd;  
  XK_umacron = $3fe;  
{$endif}
{ XK_LATIN4  }
{
 * Katakana
 * Byte 3 = 4
  }
{$ifdef XK_KATAKANA}

const
  XK_overline = $47e;  
  XK_kana_fullstop = $4a1;  
  XK_kana_openingbracket = $4a2;  
  XK_kana_closingbracket = $4a3;  
  XK_kana_comma = $4a4;  
  XK_kana_conjunctive = $4a5;  
{ deprecated  }
  XK_kana_middledot = $4a5;  
  XK_kana_WO = $4a6;  
  XK_kana_a = $4a7;  
  XK_kana_i = $4a8;  
  XK_kana_u = $4a9;  
  XK_kana_e = $4aa;  
  XK_kana_o = $4ab;  
  XK_kana_ya = $4ac;  
  XK_kana_yu = $4ad;  
  XK_kana_yo = $4ae;  
  XK_kana_tsu = $4af;  
{ deprecated  }
  XK_kana_tu = $4af;  
  XK_prolongedsound = $4b0;  
  XK_kana_A = $4b1;  
  XK_kana_I = $4b2;  
  XK_kana_U = $4b3;  
  XK_kana_E = $4b4;  
  XK_kana_O = $4b5;  
  XK_kana_KA = $4b6;  
  XK_kana_KI = $4b7;  
  XK_kana_KU = $4b8;  
  XK_kana_KE = $4b9;  
  XK_kana_KO = $4ba;  
  XK_kana_SA = $4bb;  
  XK_kana_SHI = $4bc;  
  XK_kana_SU = $4bd;  
  XK_kana_SE = $4be;  
  XK_kana_SO = $4bf;  
  XK_kana_TA = $4c0;  
  XK_kana_CHI = $4c1;  
{ deprecated  }
  XK_kana_TI = $4c1;  
  XK_kana_TSU = $4c2;  
{ deprecated  }
  XK_kana_TU = $4c2;  
  XK_kana_TE = $4c3;  
  XK_kana_TO = $4c4;  
  XK_kana_NA = $4c5;  
  XK_kana_NI = $4c6;  
  XK_kana_NU = $4c7;  
  XK_kana_NE = $4c8;  
  XK_kana_NO = $4c9;  
  XK_kana_HA = $4ca;  
  XK_kana_HI = $4cb;  
  XK_kana_FU = $4cc;  
{ deprecated  }
  XK_kana_HU = $4cc;  
  XK_kana_HE = $4cd;  
  XK_kana_HO = $4ce;  
  XK_kana_MA = $4cf;  
  XK_kana_MI = $4d0;  
  XK_kana_MU = $4d1;  
  XK_kana_ME = $4d2;  
  XK_kana_MO = $4d3;  
  XK_kana_YA = $4d4;  
  XK_kana_YU = $4d5;  
  XK_kana_YO = $4d6;  
  XK_kana_RA = $4d7;  
  XK_kana_RI = $4d8;  
  XK_kana_RU = $4d9;  
  XK_kana_RE = $4da;  
  XK_kana_RO = $4db;  
  XK_kana_WA = $4dc;  
  XK_kana_N = $4dd;  
  XK_voicedsound = $4de;  
  XK_semivoicedsound = $4df;  
{ Alias for mode_switch  }
  XK_kana_switch = $FF7E;  
{$endif}
{ XK_KATAKANA  }
{
 *  Arabic
 *  Byte 3 = 5
  }
{$ifdef XK_ARABIC}

const
  XK_Arabic_comma = $5ac;  
  XK_Arabic_semicolon = $5bb;  
  XK_Arabic_question_mark = $5bf;  
  XK_Arabic_hamza = $5c1;  
  XK_Arabic_maddaonalef = $5c2;  
  XK_Arabic_hamzaonalef = $5c3;  
  XK_Arabic_hamzaonwaw = $5c4;  
  XK_Arabic_hamzaunderalef = $5c5;  
  XK_Arabic_hamzaonyeh = $5c6;  
  XK_Arabic_alef = $5c7;  
  XK_Arabic_beh = $5c8;  
  XK_Arabic_tehmarbuta = $5c9;  
  XK_Arabic_teh = $5ca;  
  XK_Arabic_theh = $5cb;  
  XK_Arabic_jeem = $5cc;  
  XK_Arabic_hah = $5cd;  
  XK_Arabic_khah = $5ce;  
  XK_Arabic_dal = $5cf;  
  XK_Arabic_thal = $5d0;  
  XK_Arabic_ra = $5d1;  
  XK_Arabic_zain = $5d2;  
  XK_Arabic_seen = $5d3;  
  XK_Arabic_sheen = $5d4;  
  XK_Arabic_sad = $5d5;  
  XK_Arabic_dad = $5d6;  
  XK_Arabic_tah = $5d7;  
  XK_Arabic_zah = $5d8;  
  XK_Arabic_ain = $5d9;  
  XK_Arabic_ghain = $5da;  
  XK_Arabic_tatweel = $5e0;  
  XK_Arabic_feh = $5e1;  
  XK_Arabic_qaf = $5e2;  
  XK_Arabic_kaf = $5e3;  
  XK_Arabic_lam = $5e4;  
  XK_Arabic_meem = $5e5;  
  XK_Arabic_noon = $5e6;  
  XK_Arabic_ha = $5e7;  
{ deprecated  }
  XK_Arabic_heh = $5e7;  
  XK_Arabic_waw = $5e8;  
  XK_Arabic_alefmaksura = $5e9;  
  XK_Arabic_yeh = $5ea;  
  XK_Arabic_fathatan = $5eb;  
  XK_Arabic_dammatan = $5ec;  
  XK_Arabic_kasratan = $5ed;  
  XK_Arabic_fatha = $5ee;  
  XK_Arabic_damma = $5ef;  
  XK_Arabic_kasra = $5f0;  
  XK_Arabic_shadda = $5f1;  
  XK_Arabic_sukun = $5f2;  
{ Alias for mode_switch  }
  XK_Arabic_switch = $FF7E;  
{$endif}
{ XK_ARABIC  }
{
 * Cyrillic
 * Byte 3 = 6
  }
{$ifdef XK_CYRILLIC}

const
  XK_Serbian_dje = $6a1;  
  XK_Macedonia_gje = $6a2;  
  XK_Cyrillic_io = $6a3;  
  XK_Ukrainian_ie = $6a4;  
{ deprecated  }
  XK_Ukranian_je = $6a4;  
  XK_Macedonia_dse = $6a5;  
  XK_Ukrainian_i = $6a6;  
{ deprecated  }
  XK_Ukranian_i = $6a6;  
  XK_Ukrainian_yi = $6a7;  
{ deprecated  }
  XK_Ukranian_yi = $6a7;  
  XK_Cyrillic_je = $6a8;  
{ deprecated  }
  XK_Serbian_je = $6a8;  
  XK_Cyrillic_lje = $6a9;  
{ deprecated  }
  XK_Serbian_lje = $6a9;  
  XK_Cyrillic_nje = $6aa;  
{ deprecated  }
  XK_Serbian_nje = $6aa;  
  XK_Serbian_tshe = $6ab;  
  XK_Macedonia_kje = $6ac;  
  XK_Byelorussian_shortu = $6ae;  
  XK_Cyrillic_dzhe = $6af;  
{ deprecated  }
  XK_Serbian_dze = $6af;  
  XK_numerosign = $6b0;  
  XK_Serbian_DJE = $6b1;  
  XK_Macedonia_GJE = $6b2;  
  XK_Cyrillic_IO = $6b3;  
  XK_Ukrainian_IE = $6b4;  
{ deprecated  }
  XK_Ukranian_JE = $6b4;  
  XK_Macedonia_DSE = $6b5;  
  XK_Ukrainian_I = $6b6;  
{ deprecated  }
  XK_Ukranian_I = $6b6;  
  XK_Ukrainian_YI = $6b7;  
{ deprecated  }
  XK_Ukranian_YI = $6b7;  
  XK_Cyrillic_JE = $6b8;  
{ deprecated  }
  XK_Serbian_JE = $6b8;  
  XK_Cyrillic_LJE = $6b9;  
{ deprecated  }
  XK_Serbian_LJE = $6b9;  
  XK_Cyrillic_NJE = $6ba;  
{ deprecated  }
  XK_Serbian_NJE = $6ba;  
  XK_Serbian_TSHE = $6bb;  
  XK_Macedonia_KJE = $6bc;  
  XK_Byelorussian_SHORTU = $6be;  
  XK_Cyrillic_DZHE = $6bf;  
{ deprecated  }
  XK_Serbian_DZE = $6bf;  
  XK_Cyrillic_yu = $6c0;  
  XK_Cyrillic_a = $6c1;  
  XK_Cyrillic_be = $6c2;  
  XK_Cyrillic_tse = $6c3;  
  XK_Cyrillic_de = $6c4;  
  XK_Cyrillic_ie = $6c5;  
  XK_Cyrillic_ef = $6c6;  
  XK_Cyrillic_ghe = $6c7;  
  XK_Cyrillic_ha = $6c8;  
  XK_Cyrillic_i = $6c9;  
  XK_Cyrillic_shorti = $6ca;  
  XK_Cyrillic_ka = $6cb;  
  XK_Cyrillic_el = $6cc;  
  XK_Cyrillic_em = $6cd;  
  XK_Cyrillic_en = $6ce;  
  XK_Cyrillic_o = $6cf;  
  XK_Cyrillic_pe = $6d0;  
  XK_Cyrillic_ya = $6d1;  
  XK_Cyrillic_er = $6d2;  
  XK_Cyrillic_es = $6d3;  
  XK_Cyrillic_te = $6d4;  
  XK_Cyrillic_u = $6d5;  
  XK_Cyrillic_zhe = $6d6;  
  XK_Cyrillic_ve = $6d7;  
  XK_Cyrillic_softsign = $6d8;  
  XK_Cyrillic_yeru = $6d9;  
  XK_Cyrillic_ze = $6da;  
  XK_Cyrillic_sha = $6db;  
  XK_Cyrillic_e = $6dc;  
  XK_Cyrillic_shcha = $6dd;  
  XK_Cyrillic_che = $6de;  
  XK_Cyrillic_hardsign = $6df;  
  XK_Cyrillic_YU = $6e0;  
  XK_Cyrillic_A = $6e1;  
  XK_Cyrillic_BE = $6e2;  
  XK_Cyrillic_TSE = $6e3;  
  XK_Cyrillic_DE = $6e4;  
  XK_Cyrillic_IE = $6e5;  
  XK_Cyrillic_EF = $6e6;  
  XK_Cyrillic_GHE = $6e7;  
  XK_Cyrillic_HA = $6e8;  
  XK_Cyrillic_I = $6e9;  
  XK_Cyrillic_SHORTI = $6ea;  
  XK_Cyrillic_KA = $6eb;  
  XK_Cyrillic_EL = $6ec;  
  XK_Cyrillic_EM = $6ed;  
  XK_Cyrillic_EN = $6ee;  
  XK_Cyrillic_O = $6ef;  
  XK_Cyrillic_PE = $6f0;  
  XK_Cyrillic_YA = $6f1;  
  XK_Cyrillic_ER = $6f2;  
  XK_Cyrillic_ES = $6f3;  
  XK_Cyrillic_TE = $6f4;  
  XK_Cyrillic_U = $6f5;  
  XK_Cyrillic_ZHE = $6f6;  
  XK_Cyrillic_VE = $6f7;  
  XK_Cyrillic_SOFTSIGN = $6f8;  
  XK_Cyrillic_YERU = $6f9;  
  XK_Cyrillic_ZE = $6fa;  
  XK_Cyrillic_SHA = $6fb;  
  XK_Cyrillic_E = $6fc;  
  XK_Cyrillic_SHCHA = $6fd;  
  XK_Cyrillic_CHE = $6fe;  
  XK_Cyrillic_HARDSIGN = $6ff;  
{$endif}
{ XK_CYRILLIC  }
{
 * Greek
 * Byte 3 = 7
  }
{$ifdef XK_GREEK}

const
  XK_Greek_ALPHAaccent = $7a1;  
  XK_Greek_EPSILONaccent = $7a2;  
  XK_Greek_ETAaccent = $7a3;  
  XK_Greek_IOTAaccent = $7a4;  
  XK_Greek_IOTAdieresis = $7a5;  
  XK_Greek_OMICRONaccent = $7a7;  
  XK_Greek_UPSILONaccent = $7a8;  
  XK_Greek_UPSILONdieresis = $7a9;  
  XK_Greek_OMEGAaccent = $7ab;  
  XK_Greek_accentdieresis = $7ae;  
  XK_Greek_horizbar = $7af;  
  XK_Greek_alphaaccent = $7b1;  
  XK_Greek_epsilonaccent = $7b2;  
  XK_Greek_etaaccent = $7b3;  
  XK_Greek_iotaaccent = $7b4;  
  XK_Greek_iotadieresis = $7b5;  
  XK_Greek_iotaaccentdieresis = $7b6;  
  XK_Greek_omicronaccent = $7b7;  
  XK_Greek_upsilonaccent = $7b8;  
  XK_Greek_upsilondieresis = $7b9;  
  XK_Greek_upsilonaccentdieresis = $7ba;  
  XK_Greek_omegaaccent = $7bb;  
  XK_Greek_ALPHA = $7c1;  
  XK_Greek_BETA = $7c2;  
  XK_Greek_GAMMA = $7c3;  
  XK_Greek_DELTA = $7c4;  
  XK_Greek_EPSILON = $7c5;  
  XK_Greek_ZETA = $7c6;  
  XK_Greek_ETA = $7c7;  
  XK_Greek_THETA = $7c8;  
  XK_Greek_IOTA = $7c9;  
  XK_Greek_KAPPA = $7ca;  
  XK_Greek_LAMDA = $7cb;  
  XK_Greek_LAMBDA = $7cb;  
  XK_Greek_MU = $7cc;  
  XK_Greek_NU = $7cd;  
  XK_Greek_XI = $7ce;  
  XK_Greek_OMICRON = $7cf;  
  XK_Greek_PI = $7d0;  
  XK_Greek_RHO = $7d1;  
  XK_Greek_SIGMA = $7d2;  
  XK_Greek_TAU = $7d4;  
  XK_Greek_UPSILON = $7d5;  
  XK_Greek_PHI = $7d6;  
  XK_Greek_CHI = $7d7;  
  XK_Greek_PSI = $7d8;  
  XK_Greek_OMEGA = $7d9;  
  XK_Greek_alpha = $7e1;  
  XK_Greek_beta = $7e2;  
  XK_Greek_gamma = $7e3;  
  XK_Greek_delta = $7e4;  
  XK_Greek_epsilon = $7e5;  
  XK_Greek_zeta = $7e6;  
  XK_Greek_eta = $7e7;  
  XK_Greek_theta = $7e8;  
  XK_Greek_iota = $7e9;  
  XK_Greek_kappa = $7ea;  
  XK_Greek_lamda = $7eb;  
  XK_Greek_lambda = $7eb;  
  XK_Greek_mu = $7ec;  
  XK_Greek_nu = $7ed;  
  XK_Greek_xi = $7ee;  
  XK_Greek_omicron = $7ef;  
  XK_Greek_pi = $7f0;  
  XK_Greek_rho = $7f1;  
  XK_Greek_sigma = $7f2;  
  XK_Greek_finalsmallsigma = $7f3;  
  XK_Greek_tau = $7f4;  
  XK_Greek_upsilon = $7f5;  
  XK_Greek_phi = $7f6;  
  XK_Greek_chi = $7f7;  
  XK_Greek_psi = $7f8;  
  XK_Greek_omega = $7f9;  
{ Alias for mode_switch  }
  XK_Greek_switch = $FF7E;  
{$endif}
{ XK_GREEK  }
{
 * Technical
 * Byte 3 = 8
  }
{$ifdef XK_TECHNICAL}

const
  XK_leftradical = $8a1;  
  XK_topleftradical = $8a2;  
  XK_horizconnector = $8a3;  
  XK_topintegral = $8a4;  
  XK_botintegral = $8a5;  
  XK_vertconnector = $8a6;  
  XK_topleftsqbracket = $8a7;  
  XK_botleftsqbracket = $8a8;  
  XK_toprightsqbracket = $8a9;  
  XK_botrightsqbracket = $8aa;  
  XK_topleftparens = $8ab;  
  XK_botleftparens = $8ac;  
  XK_toprightparens = $8ad;  
  XK_botrightparens = $8ae;  
  XK_leftmiddlecurlybrace = $8af;  
  XK_rightmiddlecurlybrace = $8b0;  
  XK_topleftsummation = $8b1;  
  XK_botleftsummation = $8b2;  
  XK_topvertsummationconnector = $8b3;  
  XK_botvertsummationconnector = $8b4;  
  XK_toprightsummation = $8b5;  
  XK_botrightsummation = $8b6;  
  XK_rightmiddlesummation = $8b7;  
  XK_lessthanequal = $8bc;  
  XK_notequal = $8bd;  
  XK_greaterthanequal = $8be;  
  XK_integral = $8bf;  
  XK_therefore = $8c0;  
  XK_variation = $8c1;  
  XK_infinity = $8c2;  
  XK_nabla = $8c5;  
  XK_approximate = $8c8;  
  XK_similarequal = $8c9;  
  XK_ifonlyif = $8cd;  
  XK_implies = $8ce;  
  XK_identical = $8cf;  
  XK_radical = $8d6;  
  XK_includedin = $8da;  
  XK_includes = $8db;  
  XK_intersection = $8dc;  
  XK_union = $8dd;  
  XK_logicaland = $8de;  
  XK_logicalor = $8df;  
  XK_partialderivative = $8ef;  
  XK_function = $8f6;  
  XK_leftarrow = $8fb;  
  XK_uparrow = $8fc;  
  XK_rightarrow = $8fd;  
  XK_downarrow = $8fe;  
{$endif}
{ XK_TECHNICAL  }
{
 *  Special
 *  Byte 3 = 9
  }
{$ifdef XK_SPECIAL}

const
  XK_blank = $9df;  
  XK_soliddiamond = $9e0;  
  XK_checkerboard = $9e1;  
  XK_ht = $9e2;  
  XK_ff = $9e3;  
  XK_cr = $9e4;  
  XK_lf = $9e5;  
  XK_nl = $9e8;  
  XK_vt = $9e9;  
  XK_lowrightcorner = $9ea;  
  XK_uprightcorner = $9eb;  
  XK_upleftcorner = $9ec;  
  XK_lowleftcorner = $9ed;  
  XK_crossinglines = $9ee;  
  XK_horizlinescan1 = $9ef;  
  XK_horizlinescan3 = $9f0;  
  XK_horizlinescan5 = $9f1;  
  XK_horizlinescan7 = $9f2;  
  XK_horizlinescan9 = $9f3;  
  XK_leftt = $9f4;  
  XK_rightt = $9f5;  
  XK_bott = $9f6;  
  XK_topt = $9f7;  
  XK_vertbar = $9f8;  
{$endif}
{ XK_SPECIAL  }
{
 *  Publishing
 *  Byte 3 = a
  }
{$ifdef XK_PUBLISHING}

const
  XK_emspace = $aa1;  
  XK_enspace = $aa2;  
  XK_em3space = $aa3;  
  XK_em4space = $aa4;  
  XK_digitspace = $aa5;  
  XK_punctspace = $aa6;  
  XK_thinspace = $aa7;  
  XK_hairspace = $aa8;  
  XK_emdash = $aa9;  
  XK_endash = $aaa;  
  XK_signifblank = $aac;  
  XK_ellipsis = $aae;  
  XK_doubbaselinedot = $aaf;  
  XK_onethird = $ab0;  
  XK_twothirds = $ab1;  
  XK_onefifth = $ab2;  
  XK_twofifths = $ab3;  
  XK_threefifths = $ab4;  
  XK_fourfifths = $ab5;  
  XK_onesixth = $ab6;  
  XK_fivesixths = $ab7;  
  XK_careof = $ab8;  
  XK_figdash = $abb;  
  XK_leftanglebracket = $abc;  
  XK_decimalpoint = $abd;  
  XK_rightanglebracket = $abe;  
  XK_marker = $abf;  
  XK_oneeighth = $ac3;  
  XK_threeeighths = $ac4;  
  XK_fiveeighths = $ac5;  
  XK_seveneighths = $ac6;  
  XK_trademark = $ac9;  
  XK_signaturemark = $aca;  
  XK_trademarkincircle = $acb;  
  XK_leftopentriangle = $acc;  
  XK_rightopentriangle = $acd;  
  XK_emopencircle = $ace;  
  XK_emopenrectangle = $acf;  
  XK_leftsinglequotemark = $ad0;  
  XK_rightsinglequotemark = $ad1;  
  XK_leftdoublequotemark = $ad2;  
  XK_rightdoublequotemark = $ad3;  
  XK_prescription = $ad4;  
  XK_minutes = $ad6;  
  XK_seconds = $ad7;  
  XK_latincross = $ad9;  
  XK_hexagram = $ada;  
  XK_filledrectbullet = $adb;  
  XK_filledlefttribullet = $adc;  
  XK_filledrighttribullet = $add;  
  XK_emfilledcircle = $ade;  
  XK_emfilledrect = $adf;  
  XK_enopencircbullet = $ae0;  
  XK_enopensquarebullet = $ae1;  
  XK_openrectbullet = $ae2;  
  XK_opentribulletup = $ae3;  
  XK_opentribulletdown = $ae4;  
  XK_openstar = $ae5;  
  XK_enfilledcircbullet = $ae6;  
  XK_enfilledsqbullet = $ae7;  
  XK_filledtribulletup = $ae8;  
  XK_filledtribulletdown = $ae9;  
  XK_leftpointer = $aea;  
  XK_rightpointer = $aeb;  
  XK_club = $aec;  
  XK_diamond = $aed;  
  XK_heart = $aee;  
  XK_maltesecross = $af0;  
  XK_dagger = $af1;  
  XK_doubledagger = $af2;  
  XK_checkmark = $af3;  
  XK_ballotcross = $af4;  
  XK_musicalsharp = $af5;  
  XK_musicalflat = $af6;  
  XK_malesymbol = $af7;  
  XK_femalesymbol = $af8;  
  XK_telephone = $af9;  
  XK_telephonerecorder = $afa;  
  XK_phonographcopyright = $afb;  
  XK_caret = $afc;  
  XK_singlelowquotemark = $afd;  
  XK_doublelowquotemark = $afe;  
  XK_cursor = $aff;  
{$endif}
{ XK_PUBLISHING  }
{
 *  APL
 *  Byte 3 = b
  }
{$ifdef XK_APL}

const
  XK_leftcaret = $ba3;  
  XK_rightcaret = $ba6;  
  XK_downcaret = $ba8;  
  XK_upcaret = $ba9;  
  XK_overbar = $bc0;  
  XK_downtack = $bc2;  
  XK_upshoe = $bc3;  
  XK_downstile = $bc4;  
  XK_underbar = $bc6;  
  XK_jot = $bca;  
  XK_quad = $bcc;  
  XK_uptack = $bce;  
  XK_circle = $bcf;  
  XK_upstile = $bd3;  
  XK_downshoe = $bd6;  
  XK_rightshoe = $bd8;  
  XK_leftshoe = $bda;  
  XK_lefttack = $bdc;  
  XK_righttack = $bfc;  
{$endif}
{ XK_APL  }
{
 * Hebrew
 * Byte 3 = c
  }
{$ifdef XK_HEBREW}

const
  XK_hebrew_doublelowline = $cdf;  
  XK_hebrew_aleph = $ce0;  
  XK_hebrew_bet = $ce1;  
{ deprecated  }
  XK_hebrew_beth = $ce1;  
  XK_hebrew_gimel = $ce2;  
{ deprecated  }
  XK_hebrew_gimmel = $ce2;  
  XK_hebrew_dalet = $ce3;  
{ deprecated  }
  XK_hebrew_daleth = $ce3;  
  XK_hebrew_he = $ce4;  
  XK_hebrew_waw = $ce5;  
  XK_hebrew_zain = $ce6;  
{ deprecated  }
  XK_hebrew_zayin = $ce6;  
  XK_hebrew_chet = $ce7;  
{ deprecated  }
  XK_hebrew_het = $ce7;  
  XK_hebrew_tet = $ce8;  
{ deprecated  }
  XK_hebrew_teth = $ce8;  
  XK_hebrew_yod = $ce9;  
  XK_hebrew_finalkaph = $cea;  
  XK_hebrew_kaph = $ceb;  
  XK_hebrew_lamed = $cec;  
  XK_hebrew_finalmem = $ced;  
  XK_hebrew_mem = $cee;  
  XK_hebrew_finalnun = $cef;  
  XK_hebrew_nun = $cf0;  
  XK_hebrew_samech = $cf1;  
{ deprecated  }
  XK_hebrew_samekh = $cf1;  
  XK_hebrew_ayin = $cf2;  
  XK_hebrew_finalpe = $cf3;  
  XK_hebrew_pe = $cf4;  
  XK_hebrew_finalzade = $cf5;  
{ deprecated  }
  XK_hebrew_finalzadi = $cf5;  
  XK_hebrew_zade = $cf6;  
{ deprecated  }
  XK_hebrew_zadi = $cf6;  
  XK_hebrew_qoph = $cf7;  
{ deprecated  }
  XK_hebrew_kuf = $cf7;  
  XK_hebrew_resh = $cf8;  
  XK_hebrew_shin = $cf9;  
  XK_hebrew_taw = $cfa;  
{ deprecated  }
  XK_hebrew_taf = $cfa;  
{ Alias for mode_switch  }
  XK_Hebrew_switch = $FF7E;  
{$endif}
{ XK_HEBREW  }
{
 * Thai
 * Byte 3 = d
  }
{$ifdef XK_THAI}

const
  XK_Thai_kokai = $da1;  
  XK_Thai_khokhai = $da2;  
  XK_Thai_khokhuat = $da3;  
  XK_Thai_khokhwai = $da4;  
  XK_Thai_khokhon = $da5;  
  XK_Thai_khorakhang = $da6;  
  XK_Thai_ngongu = $da7;  
  XK_Thai_chochan = $da8;  
  XK_Thai_choching = $da9;  
  XK_Thai_chochang = $daa;  
  XK_Thai_soso = $dab;  
  XK_Thai_chochoe = $dac;  
  XK_Thai_yoying = $dad;  
  XK_Thai_dochada = $dae;  
  XK_Thai_topatak = $daf;  
  XK_Thai_thothan = $db0;  
  XK_Thai_thonangmontho = $db1;  
  XK_Thai_thophuthao = $db2;  
  XK_Thai_nonen = $db3;  
  XK_Thai_dodek = $db4;  
  XK_Thai_totao = $db5;  
  XK_Thai_thothung = $db6;  
  XK_Thai_thothahan = $db7;  
  XK_Thai_thothong = $db8;  
  XK_Thai_nonu = $db9;  
  XK_Thai_bobaimai = $dba;  
  XK_Thai_popla = $dbb;  
  XK_Thai_phophung = $dbc;  
  XK_Thai_fofa = $dbd;  
  XK_Thai_phophan = $dbe;  
  XK_Thai_fofan = $dbf;  
  XK_Thai_phosamphao = $dc0;  
  XK_Thai_moma = $dc1;  
  XK_Thai_yoyak = $dc2;  
  XK_Thai_rorua = $dc3;  
  XK_Thai_ru = $dc4;  
  XK_Thai_loling = $dc5;  
  XK_Thai_lu = $dc6;  
  XK_Thai_wowaen = $dc7;  
  XK_Thai_sosala = $dc8;  
  XK_Thai_sorusi = $dc9;  
  XK_Thai_sosua = $dca;  
  XK_Thai_hohip = $dcb;  
  XK_Thai_lochula = $dcc;  
  XK_Thai_oang = $dcd;  
  XK_Thai_honokhuk = $dce;  
  XK_Thai_paiyannoi = $dcf;  
  XK_Thai_saraa = $dd0;  
  XK_Thai_maihanakat = $dd1;  
  XK_Thai_saraaa = $dd2;  
  XK_Thai_saraam = $dd3;  
  XK_Thai_sarai = $dd4;  
  XK_Thai_saraii = $dd5;  
  XK_Thai_saraue = $dd6;  
  XK_Thai_sarauee = $dd7;  
  XK_Thai_sarau = $dd8;  
  XK_Thai_sarauu = $dd9;  
  XK_Thai_phinthu = $dda;  
  XK_Thai_maihanakat_maitho = $dde;  
  XK_Thai_baht = $ddf;  
  XK_Thai_sarae = $de0;  
  XK_Thai_saraae = $de1;  
  XK_Thai_sarao = $de2;  
  XK_Thai_saraaimaimuan = $de3;  
  XK_Thai_saraaimaimalai = $de4;  
  XK_Thai_lakkhangyao = $de5;  
  XK_Thai_maiyamok = $de6;  
  XK_Thai_maitaikhu = $de7;  
  XK_Thai_maiek = $de8;  
  XK_Thai_maitho = $de9;  
  XK_Thai_maitri = $dea;  
  XK_Thai_maichattawa = $deb;  
  XK_Thai_thanthakhat = $dec;  
  XK_Thai_nikhahit = $ded;  
  XK_Thai_leksun = $df0;  
  XK_Thai_leknung = $df1;  
  XK_Thai_leksong = $df2;  
  XK_Thai_leksam = $df3;  
  XK_Thai_leksi = $df4;  
  XK_Thai_lekha = $df5;  
  XK_Thai_lekhok = $df6;  
  XK_Thai_lekchet = $df7;  
  XK_Thai_lekpaet = $df8;  
  XK_Thai_lekkao = $df9;  
{$endif}
{ XK_THAI  }
{
 *   Korean
 *   Byte 3 = e
  }
{$ifdef XK_KOREAN}
{ Hangul start/stop(toggle)  }

const
  XK_Hangul = $ff31;  
{ Hangul start  }
  XK_Hangul_Start = $ff32;  
{ Hangul end, English start  }
  XK_Hangul_End = $ff33;  
{ Start Hangul->Hanja Conversion  }
  XK_Hangul_Hanja = $ff34;  
{ Hangul Jamo mode  }
  XK_Hangul_Jamo = $ff35;  
{ Hangul Romaja mode  }
  XK_Hangul_Romaja = $ff36;  
{ Hangul code input mode  }
  XK_Hangul_Codeinput = $ff37;  
{ Jeonja mode  }
  XK_Hangul_Jeonja = $ff38;  
{ Banja mode  }
  XK_Hangul_Banja = $ff39;  
{ Pre Hanja conversion  }
  XK_Hangul_PreHanja = $ff3a;  
{ Post Hanja conversion  }
  XK_Hangul_PostHanja = $ff3b;  
{ Single candidate  }
  XK_Hangul_SingleCandidate = $ff3c;  
{ Multiple candidate  }
  XK_Hangul_MultipleCandidate = $ff3d;  
{ Previous candidate  }
  XK_Hangul_PreviousCandidate = $ff3e;  
{ Special symbols  }
  XK_Hangul_Special = $ff3f;  
{ Alias for mode_switch  }
  XK_Hangul_switch = $FF7E;  
{ Hangul Consonant Characters  }
  XK_Hangul_Kiyeog = $ea1;  
  XK_Hangul_SsangKiyeog = $ea2;  
  XK_Hangul_KiyeogSios = $ea3;  
  XK_Hangul_Nieun = $ea4;  
  XK_Hangul_NieunJieuj = $ea5;  
  XK_Hangul_NieunHieuh = $ea6;  
  XK_Hangul_Dikeud = $ea7;  
  XK_Hangul_SsangDikeud = $ea8;  
  XK_Hangul_Rieul = $ea9;  
  XK_Hangul_RieulKiyeog = $eaa;  
  XK_Hangul_RieulMieum = $eab;  
  XK_Hangul_RieulPieub = $eac;  
  XK_Hangul_RieulSios = $ead;  
  XK_Hangul_RieulTieut = $eae;  
  XK_Hangul_RieulPhieuf = $eaf;  
  XK_Hangul_RieulHieuh = $eb0;  
  XK_Hangul_Mieum = $eb1;  
  XK_Hangul_Pieub = $eb2;  
  XK_Hangul_SsangPieub = $eb3;  
  XK_Hangul_PieubSios = $eb4;  
  XK_Hangul_Sios = $eb5;  
  XK_Hangul_SsangSios = $eb6;  
  XK_Hangul_Ieung = $eb7;  
  XK_Hangul_Jieuj = $eb8;  
  XK_Hangul_SsangJieuj = $eb9;  
  XK_Hangul_Cieuc = $eba;  
  XK_Hangul_Khieuq = $ebb;  
  XK_Hangul_Tieut = $ebc;  
  XK_Hangul_Phieuf = $ebd;  
  XK_Hangul_Hieuh = $ebe;  
{ Hangul Vowel Characters  }
  XK_Hangul_A = $ebf;  
  XK_Hangul_AE = $ec0;  
  XK_Hangul_YA = $ec1;  
  XK_Hangul_YAE = $ec2;  
  XK_Hangul_EO = $ec3;  
  XK_Hangul_E = $ec4;  
  XK_Hangul_YEO = $ec5;  
  XK_Hangul_YE = $ec6;  
  XK_Hangul_O = $ec7;  
  XK_Hangul_WA = $ec8;  
  XK_Hangul_WAE = $ec9;  
  XK_Hangul_OE = $eca;  
  XK_Hangul_YO = $ecb;  
  XK_Hangul_U = $ecc;  
  XK_Hangul_WEO = $ecd;  
  XK_Hangul_WE = $ece;  
  XK_Hangul_WI = $ecf;  
  XK_Hangul_YU = $ed0;  
  XK_Hangul_EU = $ed1;  
  XK_Hangul_YI = $ed2;  
  XK_Hangul_I = $ed3;  
{ Hangul syllable-final (JongSeong) Characters  }
  XK_Hangul_J_Kiyeog = $ed4;  
  XK_Hangul_J_SsangKiyeog = $ed5;  
  XK_Hangul_J_KiyeogSios = $ed6;  
  XK_Hangul_J_Nieun = $ed7;  
  XK_Hangul_J_NieunJieuj = $ed8;  
  XK_Hangul_J_NieunHieuh = $ed9;  
  XK_Hangul_J_Dikeud = $eda;  
  XK_Hangul_J_Rieul = $edb;  
  XK_Hangul_J_RieulKiyeog = $edc;  
  XK_Hangul_J_RieulMieum = $edd;  
  XK_Hangul_J_RieulPieub = $ede;  
  XK_Hangul_J_RieulSios = $edf;  
  XK_Hangul_J_RieulTieut = $ee0;  
  XK_Hangul_J_RieulPhieuf = $ee1;  
  XK_Hangul_J_RieulHieuh = $ee2;  
  XK_Hangul_J_Mieum = $ee3;  
  XK_Hangul_J_Pieub = $ee4;  
  XK_Hangul_J_PieubSios = $ee5;  
  XK_Hangul_J_Sios = $ee6;  
  XK_Hangul_J_SsangSios = $ee7;  
  XK_Hangul_J_Ieung = $ee8;  
  XK_Hangul_J_Jieuj = $ee9;  
  XK_Hangul_J_Cieuc = $eea;  
  XK_Hangul_J_Khieuq = $eeb;  
  XK_Hangul_J_Tieut = $eec;  
  XK_Hangul_J_Phieuf = $eed;  
  XK_Hangul_J_Hieuh = $eee;  
{ Ancient Hangul Consonant Characters  }
  XK_Hangul_RieulYeorinHieuh = $eef;  
  XK_Hangul_SunkyeongeumMieum = $ef0;  
  XK_Hangul_SunkyeongeumPieub = $ef1;  
  XK_Hangul_PanSios = $ef2;  
  XK_Hangul_KkogjiDalrinIeung = $ef3;  
  XK_Hangul_SunkyeongeumPhieuf = $ef4;  
  XK_Hangul_YeorinHieuh = $ef5;  
{ Ancient Hangul Vowel Characters  }
  XK_Hangul_AraeA = $ef6;  
  XK_Hangul_AraeAE = $ef7;  
{ Ancient Hangul syllable-final (JongSeong) Characters  }
  XK_Hangul_J_PanSios = $ef8;  
  XK_Hangul_J_KkogjiDalrinIeung = $ef9;  
  XK_Hangul_J_YeorinHieuh = $efa;  
{ Korean currency symbol  }
  XK_Korean_Won = $eff;  
{$endif}
{ XK_KOREAN  }
{ Euro currency symbol  }

const
  XK_EuroSign = $20ac;  
{$endif}

implementation


end.
