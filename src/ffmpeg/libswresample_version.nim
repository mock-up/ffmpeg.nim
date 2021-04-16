from libavutil_version import AV_VERSION_INT, AV_VERSION

when defined(windows):
  {.push importc, dynlib: "swresample(|-2|-3|-4).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "swresample(|.2|.3|.4).dylib", cdecl.}
else:
  {.push importc, dynlib: "libswresample.so(|.2|.3|.4)", cdecl.}

const
  LIBSWRESAMPLE_VERSION_MAJOR* = 3
  LIBSWRESAMPLE_VERSION_MINOR* = 7
  LIBSWRESAMPLE_VERSION_MICRO* = 100
  LIBSWRESAMPLE_VERSION_INT* = AV_VERSION_INT(LIBSWRESAMPLE_VERSION_MAJOR, LIBSWRESAMPLE_VERSION_MINOR, LIBSWRESAMPLE_VERSION_MICRO)
  LIBSWRESAMPLE_VERSION* = AV_VERSION(LIBSWRESAMPLE_VERSION_MAJOR, LIBSWRESAMPLE_VERSION_MINOR, LIBSWRESAMPLE_VERSION_MICRO)
  LIBSWRESAMPLE_BUILD* = LIBSWRESAMPLE_VERSION_INT
  LIBSWRESAMPLE_IDENT* = "SwR"