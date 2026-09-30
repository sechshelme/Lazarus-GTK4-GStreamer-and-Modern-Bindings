unit mlt_image;

interface

uses
  fp_mlt;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file mlt_image.h
 * \brief Image class
 * \see mlt_image_s
 *
 * Copyright (C) 2022 Meltytech, LLC
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
  }
{$ifndef MLT_IMAGE_H}
{$define MLT_IMAGE_H}
{$include "mlt_types.h"}
{* \brief Image class
 *
 * Image is the data object that represents image for a period of time.
  }

const
  MLT_IMAGE_MAX_PLANES = 4;  
type
  Pmlt_image_s = ^Tmlt_image_s;
  Tmlt_image_s = record
      format : Tmlt_image_format;
      width : longint;
      height : longint;
      colorspace : longint;
      planes : array[0..(MLT_IMAGE_MAX_PLANES)-1] of Puint8_t;
      strides : array[0..(MLT_IMAGE_MAX_PLANES)-1] of longint;
      data : pointer;
      release_data : Tmlt_destructor;
      alpha : pointer;
      release_alpha : Tmlt_destructor;
      close : Tmlt_destructor;
    end;


function mlt_image_new:Tmlt_image;cdecl;external libmlt;
procedure mlt_image_close(self:Tmlt_image);cdecl;external libmlt;
procedure mlt_image_set_values(self:Tmlt_image; data:pointer; format:Tmlt_image_format; width:longint; height:longint);cdecl;external libmlt;
procedure mlt_image_get_values(self:Tmlt_image; data:Ppointer; format:Pmlt_image_format; width:Plongint; height:Plongint);cdecl;external libmlt;
procedure mlt_image_alloc_data(self:Tmlt_image);cdecl;external libmlt;
procedure mlt_image_alloc_alpha(self:Tmlt_image);cdecl;external libmlt;
function mlt_image_calculate_size(self:Tmlt_image):longint;cdecl;external libmlt;
procedure mlt_image_fill_black(self:Tmlt_image);cdecl;external libmlt;
procedure mlt_image_fill_checkerboard(self:Tmlt_image; sample_aspect_ratio:Tdouble);cdecl;external libmlt;
procedure mlt_image_fill_white(self:Tmlt_image; full_range:longint);cdecl;external libmlt;
procedure mlt_image_fill_opaque(self:Tmlt_image);cdecl;external libmlt;
function mlt_image_format_name(format:Tmlt_image_format):Pchar;cdecl;external libmlt;
function mlt_image_format_id(name:Pchar):Tmlt_image_format;cdecl;external libmlt;
function mlt_image_rgba_opaque(image:Puint8_t; width:longint; height:longint):longint;cdecl;external libmlt;
{ Deprecated functions }
function mlt_image_format_size(format:Tmlt_image_format; width:longint; height:longint; bpp:Plongint):longint;cdecl;external libmlt;
procedure mlt_image_format_planes(format:Tmlt_image_format; width:longint; height:longint; data:pointer; planes:array[0..3] of Puint8_t; 
            strides:array[0..3] of longint);cdecl;external libmlt;
{$endif}

// === Konventiert am: 30-9-26 19:36:23 ===


implementation



end.
