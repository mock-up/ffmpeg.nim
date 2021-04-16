from libavutil_version import AV_VERSION_INT, AV_VERSION

when defined(windows):
  {.push importc, dynlib: "postproc(|-53|-54|-55|-56|-57).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "postproc(|.53|.54|.55|.56|.57).dylib", cdecl.}
else:
  {.push importc, dynlib: "libpostproc.so(|.53|.54|.55|.56|.57)", cdecl.}

const
  LIBPOSTPROC_VERSION_MAJOR* = 55
  LIBPOSTPROC_VERSION_MINOR* = 7
  LIBPOSTPROC_VERSION_MICRO* = 100
  LIBPOSTPROC_VERSION_INT* = AV_VERSION_INT(LIBPOSTPROC_VERSION_MAJOR, LIBPOSTPROC_VERSION_MINOR, LIBPOSTPROC_VERSION_MICRO)
  LIBPOSTPROC_VERSION* = AV_VERSION(LIBPOSTPROC_VERSION_MAJOR, LIBPOSTPROC_VERSION_MINOR, LIBPOSTPROC_VERSION_MICRO)
  LIBPOSTPROC_BUILD* = LIBPOSTPROC_VERSION_INT
  LIBPOSTPROC_IDENT* = "postproc"