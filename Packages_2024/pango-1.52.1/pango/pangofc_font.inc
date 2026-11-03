
{$IFDEF read_interface}

type
  TPangoFcFont = packed record
    parent_instance: TPangoFont;
    font_pattern: PFcPattern;
    fontmap: PPangoFontMap;
    priv: Tgpointer;
    matrix: TPangoMatrix;
    description: PPangoFontDescription;
    metrics_by_lang: PGSList;
    is_hinted: 0..1;
    is_transformed: 0..1;
  end;
  PPangoFcFont = ^TPangoFcFont;

function pango_fc_font_get_type: TGType; cdecl; external libpangoft2;
function pango_fc_font_has_char(font: PPangoFcFont; wc: Tgunichar): Tgboolean; cdecl; external libpangoft2; deprecated 'PANGO_DEPRECATED_IN_1_44';
function pango_fc_font_get_glyph(font: PPangoFcFont; wc: Tgunichar): Tguint; cdecl; external libpangoft2;
function pango_fc_font_get_languages(font: PPangoFcFont): PPPangoLanguage; cdecl; external libpangoft2; deprecated 'PANGO_DEPRECATED_IN_1_50_FOR(pango_font_get_language)';
function pango_fc_font_get_pattern(font: PPangoFcFont): PFcPattern; cdecl; external libpangoft2;
function pango_fc_font_get_unknown_glyph(font: PPangoFcFont; wc: Tgunichar): TPangoGlyph; cdecl; external libpangoft2; deprecated 'PANGO_DEPRECATED_FOR(PANGO_GET_UNKNOWN_GLYPH)';
procedure pango_fc_font_kern_glyphs(font: PPangoFcFont; glyphs: PPangoGlyphString); cdecl; external libpangoft2; deprecated 'PANGO_DEPRECATED_IN_1_32';
function pango_fc_font_lock_face(font: PPangoFcFont): TFT_Face; cdecl; external libpangoft2; deprecated 'PANGO_DEPRECATED_IN_1_44_FOR(pango_font_get_hb_font)';
procedure pango_fc_font_unlock_face(font: PPangoFcFont); cdecl; external libpangoft2; deprecated 'PANGO_DEPRECATED_IN_1_44_FOR(pango_font_get_hb_font)';

// === Konventiert am: 25-11-24 17:45:50 ===

function PANGO_TYPE_FC_FONT: TGType;
function PANGO_FC_FONT(obj: Pointer): PPangoFcFont;
function PANGO_IS_FC_FONT(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function PANGO_TYPE_FC_FONT: TGType;
begin
  PANGO_TYPE_FC_FONT := pango_fc_font_get_type;
end;

function PANGO_FC_FONT(obj: Pointer): PPangoFcFont;
begin
  Result := PPangoFcFont(g_type_check_instance_cast(obj, PANGO_TYPE_FC_FONT));
end;

function PANGO_IS_FC_FONT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PANGO_TYPE_FC_FONT);
end;

{$ENDIF read_implementation}
