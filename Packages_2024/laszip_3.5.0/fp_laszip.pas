unit fp_laszip;

interface

const
  {$ifdef linux}
  liblaszip = 'laszip';
  {$endif}

  {$ifdef windows}
  liblaszip = 'liblaszip3.dll';
  {$endif}


type
  Tuint8_t = uint8;
  Puint8_t = ^Tuint8_t;
  PPuint8_t = ^Puint8_t;
  Tuint16_t = uint16;
  Puint16_t = ^Tuint16_t;
  PPuint16_t = ^Puint16_t;
  Tuint32_t = uint32;
  Puint32_t = ^Tuint32_t;
  PPuint32_t = ^Puint32_t;
  Tuint64_t = uint64;
  Puint64_t = ^Tuint64_t;
  PPuint64_t = ^Puint64_t;

  Tint8_t = int8;
  Pint8_t = ^Tint8_t;
  PPint8_t = ^Pint8_t;
  Tint16_t = int16;
  Pint16_t = ^Tint16_t;
  PPint16_t = ^Pint16_t;
  Tint32_t = int32;
  Pint32_t = ^Tint32_t;
  PPint32_t = ^Pint32_t;
  Tint64_t = int64;
  Pint64_t = ^Tint64_t;
  PPint64_t = ^Pint64_t;


{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}




const
  LASZIP_API_VERSION_MAJOR = 3;
  LASZIP_API_VERSION_MINOR = 5;
  LASZIP_API_VERSION_PATCH = 0;
  HAVE_UNORDERED_MAP = 1;

// =====

type
  Plaszip_BOOL = ^Tlaszip_BOOL;
  Tlaszip_BOOL = longint;

  Plaszip_U8 = ^Tlaszip_U8;
  Tlaszip_U8 = Tuint8_t;

  Plaszip_U16 = ^Tlaszip_U16;
  Tlaszip_U16 = Tuint16_t;

  Plaszip_U32 = ^Tlaszip_U32;
  Tlaszip_U32 = Tuint32_t;

  Plaszip_U64 = ^Tlaszip_U64;
  Tlaszip_U64 = Tuint64_t;

  Plaszip_I8 = ^Tlaszip_I8;
  Tlaszip_I8 = Tint8_t;

  Plaszip_I16 = ^Tlaszip_I16;
  Tlaszip_I16 = Tint16_t;

  Plaszip_I32 = ^Tlaszip_I32;
  Tlaszip_I32 = Tint32_t;

  Plaszip_I64 = ^Tlaszip_I64;
  Tlaszip_I64 = Tint64_t;

  PPlaszip_CHAR = ^Plaszip_CHAR;
  Plaszip_CHAR = ^Tlaszip_CHAR;
  Tlaszip_CHAR = char;

  Plaszip_F32 = ^Tlaszip_F32;
  Tlaszip_F32 = single;

  Plaszip_F64 = ^Tlaszip_F64;
  Tlaszip_F64 = double;

  Plaszip_POINTER = ^Tlaszip_POINTER;
  Tlaszip_POINTER = pointer;

  Tlaszip_geokey = record
      key_id : Tlaszip_U16;
      tiff_tag_location : Tlaszip_U16;
      count : Tlaszip_U16;
      value_offset : Tlaszip_U16;
    end;
  Plaszip_geokey = ^Tlaszip_geokey;

  Tlaszip_vlr = record
      reserved : Tlaszip_U16;
      user_id : array[0..15] of Tlaszip_CHAR;
      record_id : Tlaszip_U16;
      record_length_after_header : Tlaszip_U16;
      description : array[0..31] of Tlaszip_CHAR;
      data : Plaszip_U8;
    end;
  Plaszip_vlr = ^Tlaszip_vlr;

  Tlaszip_header = record
      file_source_ID : Tlaszip_U16;
      global_encoding : Tlaszip_U16;
      project_ID_GUID_data_1 : Tlaszip_U32;
      project_ID_GUID_data_2 : Tlaszip_U16;
      project_ID_GUID_data_3 : Tlaszip_U16;
      project_ID_GUID_data_4 : array[0..7] of Tlaszip_CHAR;
      version_major : Tlaszip_U8;
      version_minor : Tlaszip_U8;
      system_identifier : array[0..31] of Tlaszip_CHAR;
      generating_software : array[0..31] of Tlaszip_CHAR;
      file_creation_day : Tlaszip_U16;
      file_creation_year : Tlaszip_U16;
      header_size : Tlaszip_U16;
      offset_to_point_data : Tlaszip_U32;
      number_of_variable_length_records : Tlaszip_U32;
      point_data_format : Tlaszip_U8;
      point_data_record_length : Tlaszip_U16;
      number_of_point_records : Tlaszip_U32;
      number_of_points_by_return : array[0..4] of Tlaszip_U32;
      x_scale_factor : Tlaszip_F64;
      y_scale_factor : Tlaszip_F64;
      z_scale_factor : Tlaszip_F64;
      x_offset : Tlaszip_F64;
      y_offset : Tlaszip_F64;
      z_offset : Tlaszip_F64;
      max_x : Tlaszip_F64;
      min_x : Tlaszip_F64;
      max_y : Tlaszip_F64;
      min_y : Tlaszip_F64;
      max_z : Tlaszip_F64;
      min_z : Tlaszip_F64;
      start_of_waveform_data_packet_record : Tlaszip_U64;
      start_of_first_extended_variable_length_record : Tlaszip_U64;
      number_of_extended_variable_length_records : Tlaszip_U32;
      extended_number_of_point_records : Tlaszip_U64;
      extended_number_of_points_by_return : array[0..14] of Tlaszip_U64;
      user_data_in_header_size : Tlaszip_U32;
      user_data_in_header : Plaszip_U8;
      vlrs : Plaszip_vlr;
      user_data_after_header_size : Tlaszip_U32;
      user_data_after_header : Plaszip_U8;
    end;
  Plaszip_header = ^Tlaszip_header;
  PPlaszip_header = ^Plaszip_header;

  Tlaszip_point =bitpacked record
      X : Tlaszip_I32;
      Y : Tlaszip_I32;
      Z : Tlaszip_I32;
      intensity : Tlaszip_U16;
      flag0 : word;
      scan_angle_rank : Tlaszip_I8;
      user_data : Tlaszip_U8;
      point_source_ID : Tlaszip_U16;
      extended_scan_angle : Tlaszip_I16;

      return_number : 0..7;
      number_of_returns : 0..7;
      scan_direction_flag : 0..1;
      edge_of_flight_line : 0..1;
      classification : 0..31;
      synthetic_flag : 0..1;
      keypoint_flag  : 0..1;
      withheld_flag  : 0..1;

      extended_classification : Tlaszip_U8;

      extended_point_type : 0..3;
      extended_scanner_channel : 0..3;
      extended_classification_flags : 0..15;
      extended_classificatio: Tlaszip_U8;
      extended_return_number : 0..15;
      extended_number_of_returns : 0..15;

      dummy : array[0..6] of Tlaszip_U8;
      gps_time : Tlaszip_F64;
      rgb : array[0..3] of Tlaszip_U16;
      wave_packet : array[0..28] of Tlaszip_U8;
      num_extra_bytes : Tlaszip_I32;
      extra_bytes : Plaszip_U8;
    end;
  Plaszip_point = ^Tlaszip_point;
  PPlaszip_point = ^Plaszip_point;

const
  laszip_DECOMPRESS_SELECTIVE_ALL = $FFFFFFFF;  
  laszip_DECOMPRESS_SELECTIVE_CHANNEL_RETURNS_XY = $00000000;  
  laszip_DECOMPRESS_SELECTIVE_Z = $00000001;  
  laszip_DECOMPRESS_SELECTIVE_CLASSIFICATION = $00000002;  
  laszip_DECOMPRESS_SELECTIVE_FLAGS = $00000004;  
  laszip_DECOMPRESS_SELECTIVE_INTENSITY = $00000008;  
  laszip_DECOMPRESS_SELECTIVE_SCAN_ANGLE = $00000010;  
  laszip_DECOMPRESS_SELECTIVE_USER_DATA = $00000020;  
  laszip_DECOMPRESS_SELECTIVE_POINT_SOURCE = $00000040;  
  laszip_DECOMPRESS_SELECTIVE_GPS_TIME = $00000080;  
  laszip_DECOMPRESS_SELECTIVE_RGB = $00000100;  
  laszip_DECOMPRESS_SELECTIVE_NIR = $00000200;  
  laszip_DECOMPRESS_SELECTIVE_WAVEPACKET = $00000400;  
  laszip_DECOMPRESS_SELECTIVE_BYTE0 = $00010000;  
  laszip_DECOMPRESS_SELECTIVE_BYTE1 = $00020000;  
  laszip_DECOMPRESS_SELECTIVE_BYTE2 = $00040000;  
  laszip_DECOMPRESS_SELECTIVE_BYTE3 = $00080000;  
  laszip_DECOMPRESS_SELECTIVE_BYTE4 = $00100000;  
  laszip_DECOMPRESS_SELECTIVE_BYTE5 = $00200000;  
  laszip_DECOMPRESS_SELECTIVE_BYTE6 = $00400000;  
  laszip_DECOMPRESS_SELECTIVE_BYTE7 = $00800000;  
  laszip_DECOMPRESS_SELECTIVE_EXTRA_BYTES = $FFFF0000;  

function laszip_get_version(version_major:Plaszip_U8; version_minor:Plaszip_U8; version_revision:Plaszip_U16; version_build:Plaszip_U32):Tlaszip_I32;cdecl;external liblaszip;
function laszip_create(pointer:Plaszip_POINTER):Tlaszip_I32;cdecl;external liblaszip;
function laszip_get_error(pointer:Tlaszip_POINTER; error:PPlaszip_CHAR):Tlaszip_I32;cdecl;external liblaszip;
function laszip_get_warning(pointer:Tlaszip_POINTER; warning:PPlaszip_CHAR):Tlaszip_I32;cdecl;external liblaszip;
function laszip_clean(pointer:Tlaszip_POINTER):Tlaszip_I32;cdecl;external liblaszip;
function laszip_destroy(pointer:Tlaszip_POINTER):Tlaszip_I32;cdecl;external liblaszip;

function laszip_get_header_pointer(pointer:Tlaszip_POINTER; header_pointer:PPlaszip_header):Tlaszip_I32;cdecl;external liblaszip;
function laszip_get_point_pointer(pointer:Tlaszip_POINTER; point_pointer:PPlaszip_point):Tlaszip_I32;cdecl;external liblaszip;
function laszip_get_point_count(pointer:Tlaszip_POINTER; count:Plaszip_I64):Tlaszip_I32;cdecl;external liblaszip;
function laszip_set_header(pointer:Tlaszip_POINTER; header:Plaszip_header):Tlaszip_I32;cdecl;external liblaszip;
function laszip_set_point_type_and_size(pointer:Tlaszip_POINTER; point_type:Tlaszip_U8; point_size:Tlaszip_U16):Tlaszip_I32;cdecl;external liblaszip;
function laszip_check_for_integer_overflow(pointer:Tlaszip_POINTER):Tlaszip_I32;cdecl;external liblaszip;
function laszip_auto_offset(pointer:Tlaszip_POINTER):Tlaszip_I32;cdecl;external liblaszip;
function laszip_set_point(pointer:Tlaszip_POINTER; point:Plaszip_point):Tlaszip_I32;cdecl;external liblaszip;
function laszip_set_coordinates(pointer:Tlaszip_POINTER; coordinates:Plaszip_F64):Tlaszip_I32;cdecl;external liblaszip;
function laszip_get_coordinates(pointer:Tlaszip_POINTER; coordinates:Plaszip_F64):Tlaszip_I32;cdecl;external liblaszip;
function laszip_set_geokeys(pointer:Tlaszip_POINTER; number:Tlaszip_U32; key_entries:Plaszip_geokey):Tlaszip_I32;cdecl;external liblaszip;
function laszip_set_geodouble_params(pointer:Tlaszip_POINTER; number:Tlaszip_U32; geodouble_params:Plaszip_F64):Tlaszip_I32;cdecl;external liblaszip;
function laszip_set_geoascii_params(pointer:Tlaszip_POINTER; number:Tlaszip_U32; geoascii_params:Plaszip_CHAR):Tlaszip_I32;cdecl;external liblaszip;
function laszip_add_attribute(pointer:Tlaszip_POINTER; _type:Tlaszip_U32; name:Plaszip_CHAR; description:Plaszip_CHAR; scale:Tlaszip_F64;           offset:Tlaszip_F64):Tlaszip_I32;cdecl;external liblaszip;
function laszip_add_vlr(pointer:Tlaszip_POINTER; user_id:Plaszip_CHAR; record_id:Tlaszip_U16; record_length_after_header:Tlaszip_U16; description:Plaszip_CHAR;           data:Plaszip_U8):Tlaszip_I32;cdecl;external liblaszip;
function laszip_remove_vlr(pointer:Tlaszip_POINTER; user_id:Plaszip_CHAR; record_id:Tlaszip_U16):Tlaszip_I32;cdecl;external liblaszip;
function laszip_create_spatial_index(pointer:Tlaszip_POINTER; create:Tlaszip_BOOL; append:Tlaszip_BOOL):Tlaszip_I32;cdecl;external liblaszip;
function laszip_preserve_generating_software(pointer:Tlaszip_POINTER; preserve:Tlaszip_BOOL):Tlaszip_I32;cdecl;external liblaszip;
function laszip_request_native_extension(pointer:Tlaszip_POINTER; request:Tlaszip_BOOL):Tlaszip_I32;cdecl;external liblaszip;
function laszip_request_compatibility_mode(pointer:Tlaszip_POINTER; request:Tlaszip_BOOL):Tlaszip_I32;cdecl;external liblaszip;
function laszip_set_chunk_size(pointer:Tlaszip_POINTER; chunk_size:Tlaszip_U32):Tlaszip_I32;cdecl;external liblaszip;
function laszip_open_writer(pointer:Tlaszip_POINTER; file_name:Plaszip_CHAR; compress:Tlaszip_BOOL):Tlaszip_I32;cdecl;external liblaszip;
function laszip_write_point(pointer:Tlaszip_POINTER):Tlaszip_I32;cdecl;external liblaszip;
function laszip_write_indexed_point(pointer:Tlaszip_POINTER):Tlaszip_I32;cdecl;external liblaszip;
function laszip_update_inventory(pointer:Tlaszip_POINTER):Tlaszip_I32;cdecl;external liblaszip;
function laszip_close_writer(pointer:Tlaszip_POINTER):Tlaszip_I32;cdecl;external liblaszip;
function laszip_exploit_spatial_index(pointer:Tlaszip_POINTER; exploit:Tlaszip_BOOL):Tlaszip_I32;cdecl;external liblaszip;
function laszip_decompress_selective(pointer:Tlaszip_POINTER; decompress_selective:Tlaszip_U32):Tlaszip_I32;cdecl;external liblaszip;
function laszip_open_reader(pointer:Tlaszip_POINTER; file_name:Plaszip_CHAR; is_compressed:Plaszip_BOOL):Tlaszip_I32;cdecl;external liblaszip;
function laszip_has_spatial_index(pointer:Tlaszip_POINTER; is_indexed:Plaszip_BOOL; is_appended:Plaszip_BOOL):Tlaszip_I32;cdecl;external liblaszip;
function laszip_inside_rectangle(pointer:Tlaszip_POINTER; min_x:Tlaszip_F64; min_y:Tlaszip_F64; max_x:Tlaszip_F64; max_y:Tlaszip_F64;           is_empty:Plaszip_BOOL):Tlaszip_I32;cdecl;external liblaszip;
function laszip_seek_point(pointer:Tlaszip_POINTER; index:Tlaszip_I64):Tlaszip_I32;cdecl;external liblaszip;
function laszip_read_point(pointer:Tlaszip_POINTER):Tlaszip_I32;cdecl;external liblaszip;
function laszip_read_inside_point(pointer:Tlaszip_POINTER; is_done:Plaszip_BOOL):Tlaszip_I32;cdecl;external liblaszip;
function laszip_close_reader(pointer:Tlaszip_POINTER):Tlaszip_I32;cdecl;external liblaszip;
function laszip_load_dll:Tlaszip_I32;cdecl;external liblaszip;
function laszip_unload_dll:Tlaszip_I32;cdecl;external liblaszip;

// === Konventiert am: 28-2-26 19:35:17 ===


implementation


end.
