
{$IFDEF read_interface}

type
  TPangoLogAttr = bitpacked record
    is_line_break: 0..1;
    is_mandatory_break: 0..1;
    is_char_break: 0..1;
    is_white: 0..1;
    is_cursor_position: 0..1;
    is_word_start: 0..1;
    is_word_end: 0..1;
    is_sentence_boundary: 0..1;
    is_sentence_start: 0..1;
    is_sentence_end: 0..1;
    backspace_deletes_character: 0..1;
    is_expandable_space: 0..1;
    is_word_boundary: 0..1;
    break_inserts_hyphen: 0..1;
    break_removes_preceding: 0..1;
    reserved: UInt16;
//    reserved: 0..1 shl 17;
  end;
  PPangoLogAttr = ^TPangoLogAttr;
  PPPangoLogAttr = ^PPangoLogAttr;

procedure pango_break(Text: pchar; length: longint; analysis: PPangoAnalysis; attrs: PPangoLogAttr; attrs_len: longint); cdecl; external libpango; deprecated 'PANGO_DEPRECATED_IN_1_44';
procedure pango_get_log_attrs(Text: pchar; length: longint; level: longint; language: PPangoLanguage; attrs: PPangoLogAttr;
  attrs_len: longint); cdecl; external libpango;
procedure pango_default_break(Text: pchar; length: longint; analysis: PPangoAnalysis; attrs: PPangoLogAttr; attrs_len: longint); cdecl; external libpango;
procedure pango_tailor_break(Text: pchar; length: longint; analysis: PPangoAnalysis; offset: longint; attrs: PPangoLogAttr;
  attrs_len: longint); cdecl; external libpango;
procedure pango_attr_break(Text: pchar; length: longint; attr_list: PPangoAttrList; offset: longint; attrs: PPangoLogAttr;
  attrs_len: longint); cdecl; external libpango;

// === Konventiert am: 23-11-24 19:50:02 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
