
{$IFDEF read_interface}

type
  PPangoGlyphUnit = ^TPangoGlyphUnit;
  TPangoGlyphUnit = Tgint32;

  TPangoGlyphGeometry = record
    Width: TPangoGlyphUnit;
    x_offset: TPangoGlyphUnit;
    y_offset: TPangoGlyphUnit;
  end;
  PPangoGlyphGeometry = ^TPangoGlyphGeometry;

  TPangoGlyphVisAttr = record
    is_cluster_start: 0..1;
    is_color: 0..1;
  end;
  PPangoGlyphVisAttr = ^TPangoGlyphVisAttr;

type
  TPangoGlyphInfo = record
    glyph: TPangoGlyph;
    geometry: TPangoGlyphGeometry;
    attr: TPangoGlyphVisAttr;
  end;
  PPangoGlyphInfo = ^TPangoGlyphInfo;

  TPangoGlyphString = record
    num_glyphs: longint;
    glyphs: PPangoGlyphInfo;
    log_clusters: Plongint;
    space: longint;
  end;
  PPangoGlyphString = ^TPangoGlyphString;


function pango_glyph_string_get_type: TGType; cdecl; external libpango;
function pango_glyph_string_new: PPangoGlyphString; cdecl; external libpango;
procedure pango_glyph_string_set_size(_string: PPangoGlyphString; new_len: longint); cdecl; external libpango;
function pango_glyph_string_copy(_string: PPangoGlyphString): PPangoGlyphString; cdecl; external libpango;
procedure pango_glyph_string_free(_string: PPangoGlyphString); cdecl; external libpango;
procedure pango_glyph_string_extents(glyphs: PPangoGlyphString; font: PPangoFont; ink_rect: PPangoRectangle; logical_rect: PPangoRectangle); cdecl; external libpango;
function pango_glyph_string_get_width(glyphs: PPangoGlyphString): longint; cdecl; external libpango;
procedure pango_glyph_string_extents_range(glyphs: PPangoGlyphString; start: longint; end_: longint; font: PPangoFont; ink_rect: PPangoRectangle;
  logical_rect: PPangoRectangle); cdecl; external libpango;
procedure pango_glyph_string_get_logical_widths(glyphs: PPangoGlyphString; Text: pchar; length: longint; embedding_level: longint; logical_widths: Plongint); cdecl; external libpango;
procedure pango_glyph_string_index_to_x(glyphs: PPangoGlyphString; Text: pchar; length: longint; analysis: PPangoAnalysis; index_: longint;
  trailing: Tgboolean; x_pos: Plongint); cdecl; external libpango;
procedure pango_glyph_string_x_to_index(glyphs: PPangoGlyphString; Text: pchar; length: longint; analysis: PPangoAnalysis; x_pos: longint;
  index_: Plongint; trailing: Plongint); cdecl; external libpango;
procedure pango_glyph_string_index_to_x_full(glyphs: PPangoGlyphString; Text: pchar; length: longint; analysis: PPangoAnalysis; attrs: PPangoLogAttr;
  index_: longint; trailing: Tgboolean; x_pos: Plongint); cdecl; external libpango;

type
  PPangoShapeFlags = ^TPangoShapeFlags;
  TPangoShapeFlags = longint;

const
  PANGO_SHAPE_NONE = 0;
  PANGO_SHAPE_ROUND_POSITIONS = 1 shl 0;

procedure pango_shape(Text: pchar; length: longint; analysis: PPangoAnalysis; glyphs: PPangoGlyphString); cdecl; external libpango;
procedure pango_shape_full(item_text: pchar; item_length: longint; paragraph_text: pchar; paragraph_length: longint; analysis: PPangoAnalysis;
  glyphs: PPangoGlyphString); cdecl; external libpango;
procedure pango_shape_with_flags(item_text: pchar; item_length: longint; paragraph_text: pchar; paragraph_length: longint; analysis: PPangoAnalysis;
  glyphs: PPangoGlyphString; flags: TPangoShapeFlags); cdecl; external libpango;
procedure pango_shape_item(item: PPangoItem; paragraph_text: pchar; paragraph_length: longint; log_attrs: PPangoLogAttr; glyphs: PPangoGlyphString;
  flags: TPangoShapeFlags); cdecl; external libpango;

function PANGO_TYPE_GLYPH_STRING: TGType;


// === Konventiert am: 24-11-24 13:28:00 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function PANGO_TYPE_GLYPH_STRING: TGType;
begin
  PANGO_TYPE_GLYPH_STRING := pango_glyph_string_get_type;
end;


{$ENDIF read_implementation}
