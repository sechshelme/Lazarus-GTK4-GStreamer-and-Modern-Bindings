unit fp_cl_egl;

interface

uses
  fp_opencl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  cl_khr_egl_image = 1;
  CL_KHR_EGL_IMAGE_EXTENSION_NAME = 'cl_khr_egl_image';
  CL_COMMAND_EGL_FENCE_SYNC_OBJECT_KHR = $202F;
  CL_COMMAND_ACQUIRE_EGL_OBJECTS_KHR = $202D;
  CL_COMMAND_RELEASE_EGL_OBJECTS_KHR = $202E;
  CL_INVALID_EGL_OBJECT_KHR = -(1093);
  CL_EGL_RESOURCE_NOT_ACQUIRED_KHR = -(1092);

type
  PCLeglImageKHR = ^TCLeglImageKHR;
  TCLeglImageKHR = pointer;

  PCLeglDisplayKHR = ^TCLeglDisplayKHR;
  TCLeglDisplayKHR = pointer;

  Pcl_egl_image_properties_khr = ^Tcl_egl_image_properties_khr;
  Tcl_egl_image_properties_khr = Tintptr_t;

function clCreateFromEGLImageKHR(context: Tcl_context; egldisplay: TCLeglDisplayKHR; eglimage: TCLeglImageKHR; flags: Tcl_mem_flags; properties: Pcl_egl_image_properties_khr;
  errcode_ret: Pcl_int): Tcl_mem; cdecl; external libopencl;
function clEnqueueAcquireEGLObjectsKHR(command_queue: Tcl_command_queue; num_objects: Tcl_uint; mem_objects: Pcl_mem; num_events_in_wait_list: Tcl_uint; event_wait_list: Pcl_event;
  event: Pcl_event): Tcl_int; cdecl; external libopencl;
function clEnqueueReleaseEGLObjectsKHR(command_queue: Tcl_command_queue; num_objects: Tcl_uint; mem_objects: Pcl_mem; num_events_in_wait_list: Tcl_uint; event_wait_list: Pcl_event;
  event: Pcl_event): Tcl_int; cdecl; external libopencl;

const
  cl_khr_egl_event = 1;
  CL_KHR_EGL_EVENT_EXTENSION_NAME = 'cl_khr_egl_event';

type
  PCLeglSyncKHR = ^TCLeglSyncKHR;
  TCLeglSyncKHR = pointer;

function clCreateEventFromEGLSyncKHR(context: Tcl_context; sync: TCLeglSyncKHR; display: TCLeglDisplayKHR; errcode_ret: Pcl_int): Tcl_event; cdecl; external libopencl;

// === Konventiert am: 18-9-26 16:30:08 ===


implementation



end.
