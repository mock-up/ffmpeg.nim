from libavutil_version import AV_VERSION_INT, AV_VERSION

const
  LIBSWSCALE_VERSION_MAJOR* = 5
  LIBSWSCALE_VERSION_MINOR* = 7
  LIBSWSCALE_VERSION_MICRO* = 100
  LIBSWSCALE_VERSION_INT* = AV_VERSION_INT(LIBSWSCALE_VERSION_MAJOR, LIBSWSCALE_VERSION_MINOR, LIBSWSCALE_VERSION_MICRO)
  LIBSWSCALE_VERSION* = AV_VERSION(LIBSWSCALE_VERSION_MAJOR, LIBSWSCALE_VERSION_MINOR, LIBSWSCALE_VERSION_MICRO)
  LIBSWSCALE_BUILD* = LIBSWSCALE_VERSION_INT
  LIBSWSCALE_IDENT* = "SwS"

when not defined(FF_API_SWS_VECTOR):
  const FF_API_SWS_VECTOR* = LIBSWSCALE_VERSION_MAJOR < 6