from ../types import AVDynamicHDRPlus, AVFrame, AVDynamicHDRPlus

when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

proc av_dynamic_hdr_plus_alloc* (size: ptr csize_t): ptr AVDynamicHDRPlus
proc av_dynamic_hdr_plus_create_side_data* (frame: ptr AVFrame): ptr AVDynamicHDRPlus
