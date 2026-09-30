unit mlt_profile;

interface

uses
  fp_mlt;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file mlt_profile.h
 * \brief video output definition
 * \see mlt_profile_s
 *
 * Copyright (C) 2007-2018 Meltytech, LLC
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
{$ifndef MLT_PROFILE_H}
{$define MLT_PROFILE_H}
{$include "mlt_types.h"}
{* \brief Profile class
 *
 * \envvar \em MLT_PROFILES_PATH overrides the default full path to the profile preset files, defaults to \p MLT_DATA/profiles
 * \envvar \em MLT_PROFILE the profile preset to use, defaults to "dv_pal"
  }
{*< a brief description suitable as a label in UI menu  }
{*< the numerator of the video frame rate  }
{*< the denominator of the video frame rate  }
{*< the horizontal resolution of the video  }
{*< the vertical resolution of the video  }
{*< a flag to indicate if the video is progressive scan, interlace if not set  }
{*< the numerator of the pixel aspect ratio  }
{*< the denominator of the pixel aspect ratio  }
{*< the numerator of the image aspect ratio in case it can not be simply derived (e.g. ITU-R 601)  }
{*< the denominator of the image aspect ratio in case it can not be simply derived (e.g. ITU-R 601)  }
{*< the Y'CbCr colorspace standard: =601 for ITU-R 601, =709 for ITU-R 709, or =240 for SMPTE240M  }
{*< used internally to indicate if the profile was requested explicitly or computed or defaulted  }
type
  Pmlt_profile_s = ^Tmlt_profile_s;
  Tmlt_profile_s = record
      description : Pchar;
      frame_rate_num : longint;
      frame_rate_den : longint;
      width : longint;
      height : longint;
      progressive : longint;
      sample_aspect_num : longint;
      sample_aspect_den : longint;
      display_aspect_num : longint;
      display_aspect_den : longint;
      colorspace : longint;
      is_explicit : longint;
    end;


function mlt_profile_init(name:Pchar):Tmlt_profile;cdecl;external libmlt;
function mlt_profile_load_file(file:Pchar):Tmlt_profile;cdecl;external libmlt;
function mlt_profile_load_properties(properties:Tmlt_properties):Tmlt_profile;cdecl;external libmlt;
function mlt_profile_load_string(_string:Pchar):Tmlt_profile;cdecl;external libmlt;
function mlt_profile_fps(profile:Tmlt_profile):Tdouble;cdecl;external libmlt;
function mlt_profile_sar(profile:Tmlt_profile):Tdouble;cdecl;external libmlt;
function mlt_profile_dar(profile:Tmlt_profile):Tdouble;cdecl;external libmlt;
procedure mlt_profile_close(profile:Tmlt_profile);cdecl;external libmlt;
function mlt_profile_clone(profile:Tmlt_profile):Tmlt_profile;cdecl;external libmlt;
function mlt_profile_list:Tmlt_properties;cdecl;external libmlt;
procedure mlt_profile_from_producer(profile:Tmlt_profile; producer:Tmlt_producer);cdecl;external libmlt;
function mlt_profile_lumas_dir(profile:Tmlt_profile):Pchar;cdecl;external libmlt;
function mlt_profile_scale_width(profile:Tmlt_profile; width:longint):Tdouble;cdecl;external libmlt;
function mlt_profile_scale_height(profile:Tmlt_profile; height:longint):Tdouble;cdecl;external libmlt;
{$endif}

// === Konventiert am: 30-9-26 19:35:55 ===


implementation



end.
