from ../types import AVBPrint

when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

const
  AV_CH_FRONT_LEFT* = 0x00000001
  AV_CH_FRONT_RIGHT* = 0x00000002
  AV_CH_FRONT_CENTER* = 0x00000004
  AV_CH_LOW_FREQUENCY* = 0x00000008
  AV_CH_BACK_LEFT* = 0x00000010
  AV_CH_BACK_RIGHT* = 0x00000020
  AV_CH_FRONT_LEFT_OF_CENTER* = 0x00000040
  AV_CH_FRONT_RIGHT_OF_CENTER* = 0x00000080
  AV_CH_BACK_CENTER* = 0x00000100
  AV_CH_SIDE_LEFT* = 0x00000200
  AV_CH_SIDE_RIGHT* = 0x00000400
  AV_CH_TOP_CENTER* = 0x00000800
  AV_CH_TOP_FRONT_LEFT* = 0x00001000
  AV_CH_TOP_FRONT_CENTER* = 0x00002000
  AV_CH_TOP_FRONT_RIGHT* = 0x00004000
  AV_CH_TOP_BACK_LEFT* = 0x00008000
  AV_CH_TOP_BACK_CENTER* = 0x00010000
  AV_CH_TOP_BACK_RIGHT* = 0x00020000
  AV_CH_STEREO_LEFT* = 0x20000000
  AV_CH_STEREO_RIGHT* = 0x40000000
  AV_CH_WIDE_LEFT* = 0x0000000080000000.culonglong
  AV_CH_WIDE_RIGHT* = 0x0000000100000000.culonglong
  AV_CH_SURROUND_DIRECT_LEFT* = 0x0000000200000000.culonglong
  AV_CH_SURROUND_DIRECT_RIGHT* = 0x0000000400000000.culonglong
  AV_CH_LOW_FREQUENCY_2* = 0x0000000800000000.culonglong
  AV_CH_TOP_SIDE_LEFT* = 0x0000001000000000.culonglong
  AV_CH_TOP_SIDE_RIGHT* = 0x0000002000000000.culonglong
  AV_CH_BOTTOM_FRONT_CENTER* = 0x0000004000000000.culonglong
  AV_CH_BOTTOM_FRONT_LEFT* = 0x0000008000000000.culonglong
  AV_CH_BOTTOM_FRONT_RIGHT* = 0x0000010000000000.culonglong
  AV_CH_LAYOUT_NATIVE* = 0x8000000000000000
  AV_CH_LAYOUT_MONO* = AV_CH_FRONT_CENTER
  AV_CH_LAYOUT_STEREO* = AV_CH_FRONT_LEFT or AV_CH_FRONT_RIGHT
  AV_CH_LAYOUT_2POINT1* = AV_CH_LAYOUT_STEREO or AV_CH_LOW_FREQUENCY
  AV_CH_LAYOUT_2_1* = AV_CH_LAYOUT_STEREO or AV_CH_BACK_CENTER
  AV_CH_LAYOUT_SURROUND* = AV_CH_LAYOUT_STEREO or AV_CH_FRONT_CENTER
  AV_CH_LAYOUT_3POINT1* = AV_CH_LAYOUT_SURROUND or AV_CH_LOW_FREQUENCY
  AV_CH_LAYOUT_4POINT0* = AV_CH_LAYOUT_SURROUND or AV_CH_BACK_CENTER
  AV_CH_LAYOUT_4POINT1* = AV_CH_LAYOUT_4POINT0 or AV_CH_LOW_FREQUENCY
  AV_CH_LAYOUT_2_2* = AV_CH_LAYOUT_STEREO or AV_CH_SIDE_LEFT or AV_CH_SIDE_RIGHT
  AV_CH_LAYOUT_QUAD* = AV_CH_LAYOUT_STEREO or AV_CH_BACK_LEFT or AV_CH_BACK_RIGHT
  AV_CH_LAYOUT_5POINT0* = AV_CH_LAYOUT_SURROUND or AV_CH_SIDE_LEFT or AV_CH_SIDE_RIGHT
  AV_CH_LAYOUT_5POINT1* = AV_CH_LAYOUT_5POINT0 or AV_CH_LOW_FREQUENCY
  AV_CH_LAYOUT_5POINT0_BACK* = AV_CH_LAYOUT_SURROUND or AV_CH_BACK_LEFT or AV_CH_BACK_RIGHT
  AV_CH_LAYOUT_5POINT1_BACK* = AV_CH_LAYOUT_5POINT0_BACK or AV_CH_LOW_FREQUENCY
  AV_CH_LAYOUT_6POINT0* = AV_CH_LAYOUT_5POINT0 or AV_CH_BACK_CENTER
  AV_CH_LAYOUT_6POINT0_FRONT* = AV_CH_LAYOUT_2_2 or AV_CH_FRONT_LEFT_OF_CENTER or AV_CH_FRONT_RIGHT_OF_CENTER
  AV_CH_LAYOUT_HEXAGONAL* = AV_CH_LAYOUT_5POINT0_BACK or AV_CH_BACK_CENTER
  AV_CH_LAYOUT_6POINT1* = AV_CH_LAYOUT_5POINT1 or AV_CH_BACK_CENTER
  AV_CH_LAYOUT_6POINT1_BACK* = AV_CH_LAYOUT_5POINT1_BACK or AV_CH_BACK_CENTER
  AV_CH_LAYOUT_6POINT1_FRONT* = AV_CH_LAYOUT_6POINT0_FRONT or AV_CH_LOW_FREQUENCY
  AV_CH_LAYOUT_7POINT0* = AV_CH_LAYOUT_5POINT0 or AV_CH_BACK_LEFT or AV_CH_BACK_RIGHT
  AV_CH_LAYOUT_7POINT0_FRONT* = AV_CH_LAYOUT_5POINT0 or AV_CH_FRONT_LEFT_OF_CENTER or AV_CH_FRONT_RIGHT_OF_CENTER
  AV_CH_LAYOUT_7POINT1* = AV_CH_LAYOUT_5POINT1 or AV_CH_BACK_LEFT or AV_CH_BACK_RIGHT
  AV_CH_LAYOUT_7POINT1_WIDE* = AV_CH_LAYOUT_5POINT1 or AV_CH_FRONT_LEFT_OF_CENTER or AV_CH_FRONT_RIGHT_OF_CENTER
  AV_CH_LAYOUT_7POINT1_WIDE_BACK* = AV_CH_LAYOUT_5POINT1_BACK or AV_CH_FRONT_LEFT_OF_CENTER or AV_CH_FRONT_RIGHT_OF_CENTER
  AV_CH_LAYOUT_OCTAGONAL* = AV_CH_LAYOUT_5POINT0 or AV_CH_BACK_LEFT or AV_CH_BACK_CENTER or AV_CH_BACK_RIGHT
  AV_CH_LAYOUT_HEXADECAGONAL* = AV_CH_LAYOUT_OCTAGONAL or
                                AV_CH_WIDE_LEFT or
                                AV_CH_WIDE_RIGHT or
                                AV_CH_TOP_BACK_LEFT or
                                AV_CH_TOP_BACK_RIGHT or
                                AV_CH_TOP_BACK_CENTER or
                                AV_CH_TOP_FRONT_CENTER or
                                AV_CH_TOP_FRONT_LEFT or
                                AV_CH_TOP_FRONT_RIGHT
  AV_CH_LAYOUT_STEREO_DOWNMIX* = AV_CH_STEREO_LEFT or AV_CH_STEREO_RIGHT
  AV_CH_LAYOUT_22POINT2* = AV_CH_LAYOUT_5POINT1_BACK or
                           AV_CH_FRONT_LEFT_OF_CENTER or
                           AV_CH_FRONT_RIGHT_OF_CENTER or
                           AV_CH_BACK_CENTER or
                           AV_CH_LOW_FREQUENCY_2 or
                           AV_CH_SIDE_LEFT or
                           AV_CH_SIDE_RIGHT or
                           AV_CH_TOP_FRONT_LEFT or
                           AV_CH_TOP_FRONT_RIGHT or
                           AV_CH_TOP_FRONT_CENTER or
                           AV_CH_TOP_CENTER or
                           AV_CH_TOP_BACK_LEFT or
                           AV_CH_TOP_BACK_RIGHT or
                           AV_CH_TOP_SIDE_LEFT or
                           AV_CH_TOP_SIDE_RIGHT or
                           AV_CH_TOP_BACK_CENTER or
                           AV_CH_BOTTOM_FRONT_CENTER or
                           AV_CH_BOTTOM_FRONT_LEFT or
                           AV_CH_BOTTOM_FRONT_RIGHT

proc av_get_channel_layout* (name: cstring): uint64
proc av_get_extended_channel_layout* (name: cstring, channel_layout: ptr uint64, nb_channels: ptr cint): cint
proc av_get_channel_layout_string* (buf: cstring, buf_size: cint, nb_channels: cint, channel_layout: uint64)
proc av_bprint_channel_layout* (bp: ptr AVBPrint, nb_channels: cint, channel_layout: uint64)
proc av_get_channel_layout_nb_channels* (channel_layout: uint64): cint
proc av_get_default_channel_layout* (nb_channels: cint): int64
proc av_get_channel_layout_channel_index* (channel_layout: uint64, channel: uint64): cint
proc av_channel_layout_extract_channel* (channel_layout: uint64, index: cint): uint64
proc av_get_channel_name* (channel: uint64): cstring
proc av_get_channel_description* (channel: uint64): cstring
proc av_get_standard_channel_layout* (index: cuint, layout: ptr uint64, name: cstringArray): cint
