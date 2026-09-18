unit fp_cl_gl;

interface

uses
  fp_opencl;

type
  P_GLsync = type Pointer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



const
  cl_khr_gl_sharing = 1;
  CL_KHR_GL_SHARING_EXTENSION_NAME = 'cl_khr_gl_sharing';

type
  Pcl_gl_context_info = ^Tcl_gl_context_info;
  Tcl_gl_context_info = Tcl_uint;

const
  CL_INVALID_GL_SHAREGROUP_REFERENCE_KHR = -(1000);
  CL_CURRENT_DEVICE_FOR_GL_CONTEXT_KHR = $2006;
  CL_DEVICES_FOR_GL_CONTEXT_KHR = $2007;
  CL_GL_CONTEXT_KHR = $2008;
  CL_EGL_DISPLAY_KHR = $2009;
  CL_GLX_DISPLAY_KHR = $200A;
  CL_WGL_HDC_KHR = $200B;
  CL_CGL_SHAREGROUP_KHR = $200C;

type
  Pcl_gl_object_type = ^Tcl_gl_object_type;
  Tcl_gl_object_type = Tcl_uint;

  Pcl_gl_texture_info = ^Tcl_gl_texture_info;
  Tcl_gl_texture_info = Tcl_uint;

  Pcl_gl_platform_info = ^Tcl_gl_platform_info;
  Tcl_gl_platform_info = Tcl_uint;

const
  CL_GL_OBJECT_BUFFER = $2000;
  CL_GL_OBJECT_TEXTURE2D = $2001;
  CL_GL_OBJECT_TEXTURE3D = $2002;
  CL_GL_OBJECT_RENDERBUFFER = $2003;

const
  CL_GL_OBJECT_TEXTURE2D_ARRAY = $200E;
  CL_GL_OBJECT_TEXTURE1D = $200F;
  CL_GL_OBJECT_TEXTURE1D_ARRAY = $2010;
  CL_GL_OBJECT_TEXTURE_BUFFER = $2011;

const
  CL_GL_TEXTURE_TARGET = $2004;
  CL_GL_MIPMAP_LEVEL = $2005;

function clGetGLContextInfoKHR(properties: Pcl_context_properties; param_name: Tcl_gl_context_info; param_value_size: Tsize_t; param_value: pointer; param_value_size_ret: Psize_t): Tcl_int; cdecl; external libopencl;
function clCreateFromGLBuffer(context: Tcl_context; flags: Tcl_mem_flags; bufobj: Tcl_GLuint; errcode_ret: Pcl_int): Tcl_mem; cdecl; external libopencl;

function clCreateFromGLTexture(context: Tcl_context; flags: Tcl_mem_flags; target: Tcl_GLenum; miplevel: Tcl_GLint; texture: Tcl_GLuint;
  errcode_ret: Pcl_int): Tcl_mem; cdecl; external libopencl;

function clCreateFromGLRenderbuffer(context: Tcl_context; flags: Tcl_mem_flags; renderbuffer: Tcl_GLuint; errcode_ret: Pcl_int): Tcl_mem; cdecl; external libopencl;
function clGetGLObjectInfo(memobj: Tcl_mem; gl_object_type: Pcl_gl_object_type; gl_object_name: Pcl_GLuint): Tcl_int; cdecl; external libopencl;
function clGetGLTextureInfo(memobj: Tcl_mem; param_name: Tcl_gl_texture_info; param_value_size: Tsize_t; param_value: pointer; param_value_size_ret: Psize_t): Tcl_int; cdecl; external libopencl;
function clEnqueueAcquireGLObjects(command_queue: Tcl_command_queue; num_objects: Tcl_uint; mem_objects: Pcl_mem; num_events_in_wait_list: Tcl_uint; event_wait_list: Pcl_event;
  event: Pcl_event): Tcl_int; cdecl; external libopencl;
function clEnqueueReleaseGLObjects(command_queue: Tcl_command_queue; num_objects: Tcl_uint; mem_objects: Pcl_mem; num_events_in_wait_list: Tcl_uint; event_wait_list: Pcl_event;
  event: Pcl_event): Tcl_int; cdecl; external libopencl;
function clCreateFromGLTexture2D(context: Tcl_context; flags: Tcl_mem_flags; target: Tcl_GLenum; miplevel: Tcl_GLint; texture: Tcl_GLuint;
  errcode_ret: Pcl_int): Tcl_mem; cdecl; external libopencl; deprecated;
function clCreateFromGLTexture3D(context: Tcl_context; flags: Tcl_mem_flags; target: Tcl_GLenum; miplevel: Tcl_GLint; texture: Tcl_GLuint;
  errcode_ret: Pcl_int): Tcl_mem; cdecl; external libopencl; deprecated;

type
  Pcl_GLsync = ^Tcl_GLsync;
  Tcl_GLsync = P_GLsync;

const
  CL_COMMAND_GL_FENCE_SYNC_OBJECT_KHR = $200D;

function clCreateEventFromGLsyncKHR(context: Tcl_context; sync: Tcl_GLsync; errcode_ret: Pcl_int): Tcl_event; cdecl; external libopencl;

const
  cl_khr_gl_depth_images = 1;
  CL_KHR_GL_DEPTH_IMAGES_EXTENSION_NAME = 'cl_khr_gl_depth_images';
  CL_DEPTH_STENCIL = $10BE;
  CL_UNORM_INT24 = $10DF;
  cl_khr_gl_msaa_sharing = 1;
  CL_KHR_GL_MSAA_SHARING_EXTENSION_NAME = 'cl_khr_gl_msaa_sharing';
  CL_GL_NUM_SAMPLES = $2012;
  cl_intel_sharing_format_query_gl = 1;
  CL_INTEL_SHARING_FORMAT_QUERY_GL_EXTENSION_NAME = 'cl_intel_sharing_format_query_gl';

function clGetSupportedGLTextureFormatsINTEL(context: Tcl_context; flags: Tcl_mem_flags; image_type: Tcl_mem_object_type; num_entries: Tcl_uint; gl_formats: Pcl_GLenum;
  num_texture_formats: Pcl_uint): Tcl_int; cdecl; external libopencl;

// === Konventiert am: 18-9-26 16:37:49 ===


implementation



end.
