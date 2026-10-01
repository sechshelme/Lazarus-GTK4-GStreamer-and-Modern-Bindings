unit mlt_animation;

interface

uses
  fp_mlt, mlt_types, mlt_property;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  Pmlt_animation_item_s = ^Tmlt_animation_item_s;
  Tmlt_animation_item_s = record
      is_key : longint;
      frame : longint;
      _property : Tmlt_property;
      keyframe_type : Tmlt_keyframe_type;
    end;

  Pmlt_animation_item = ^Tmlt_animation_item;
  Tmlt_animation_item = Pmlt_animation_item_s;

function mlt_animation_new:Tmlt_animation;cdecl;external libmlt;
function mlt_animation_parse(self:Tmlt_animation; data:Pchar; length:longint; fps:double; locale:Tmlt_locale_t):longint;cdecl;external libmlt;
function mlt_animation_refresh(self:Tmlt_animation; data:Pchar; length:longint):longint;cdecl;external libmlt;
function mlt_animation_get_length(self:Tmlt_animation):longint;cdecl;external libmlt;
procedure mlt_animation_set_length(self:Tmlt_animation; length:longint);cdecl;external libmlt;
function mlt_animation_parse_item(self:Tmlt_animation; item:Tmlt_animation_item; data:Pchar):longint;cdecl;external libmlt;
function mlt_animation_get_item(self:Tmlt_animation; item:Tmlt_animation_item; position:longint):longint;cdecl;external libmlt;
function mlt_animation_insert(self:Tmlt_animation; item:Tmlt_animation_item):longint;cdecl;external libmlt;
function mlt_animation_remove(self:Tmlt_animation; position:longint):longint;cdecl;external libmlt;
procedure mlt_animation_interpolate(self:Tmlt_animation);cdecl;external libmlt;
function mlt_animation_next_key(self:Tmlt_animation; item:Tmlt_animation_item; position:longint):longint;cdecl;external libmlt;
function mlt_animation_prev_key(self:Tmlt_animation; item:Tmlt_animation_item; position:longint):longint;cdecl;external libmlt;
function mlt_animation_serialize_cut_tf(self:Tmlt_animation; in_:longint; out_:longint; para4:Tmlt_time_format):Pchar;cdecl;external libmlt;
function mlt_animation_serialize_cut(self:Tmlt_animation; in_:longint; out_:longint):Pchar;cdecl;external libmlt;
function mlt_animation_serialize_tf(self:Tmlt_animation; para2:Tmlt_time_format):Pchar;cdecl;external libmlt;
function mlt_animation_serialize(self:Tmlt_animation):Pchar;cdecl;external libmlt;
function mlt_animation_key_count(self:Tmlt_animation):longint;cdecl;external libmlt;
function mlt_animation_key_get(self:Tmlt_animation; item:Tmlt_animation_item; index:longint):longint;cdecl;external libmlt;
procedure mlt_animation_close(self:Tmlt_animation);cdecl;external libmlt;
function mlt_animation_key_set_type(self:Tmlt_animation; index:longint; _type:Tmlt_keyframe_type):longint;cdecl;external libmlt;
function mlt_animation_key_set_frame(self:Tmlt_animation; index:longint; frame:longint):longint;cdecl;external libmlt;
procedure mlt_animation_shift_frames(self:Tmlt_animation; shift:longint);cdecl;external libmlt;
function mlt_animation_get_string(self:Tmlt_animation):Pchar;cdecl;external libmlt;

// === Konventiert am: 30-9-26 19:27:35 ===


implementation



end.
