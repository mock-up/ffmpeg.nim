when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

{.pragma: va, importc, header: "<va/va.h>".}
{.pragma: hwcontext_vaapi, importc, header: "<libavutil/hwcontext_vaapi.h>".}

const
  AV_VAAPI_DRIVER_QUIRK_USER_SET* = 1 shl 0
  AV_VAAPI_DRIVER_QUIRK_RENDER_PARAM_BUFFERS* = 1 shl 1
  AV_VAAPI_DRIVER_QUIRK_ATTRIB_MEMTYPE* = 1 shl 2
  AV_VAAPI_DRIVER_QUIRK_SURFACE_ATTRIBUTES* = 1 shl 3

type
  VADisplay* {.va.} = object
  VASurfaceAttrib* {.va.} = object
  VASurfaceID* {.va.} = object
  VAConfigID* {.va.} = object

  AVVAAPIDeviceContext* {.hwcontext_vaapi.} = object
    display*: VADisplay
    driver_quirks*: cuint
  
  AVVAAPIFramesContext* {.hwcontext_vaapi.} = object
    attributes*: ptr VASurfaceAttrib
    nb_attributes*: cint
    surface_ids*: ptr VASurfaceID
    nb_surfaces*: cint
  
  AVVAAPIHWConfig* {.hwcontext_vaapi.} = object
    config_id*: VAConfigID
