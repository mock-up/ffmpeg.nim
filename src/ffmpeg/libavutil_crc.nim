when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avcodec(|.55|.56|.57|.58|.59).dylib".}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59)".}

type
  AVCRC* = uint32

  AVCRCId* = enum
    AV_CRC_8_ATM
    AV_CRC_16_ANSI
    AV_CRC_16_CCITT
    AV_CRC_32_IEEE
    AV_CRC_32_IEEE_LE
    AV_CRC_16_ANSI_LE
    AV_CRC_24_IEEE
    AV_CRC_8_EBU
    AV_CRC_MAX
  
proc av_crc_init* (ctx: ptr AVCRC, le, bits: cint, poly: uint32, ctx_size: cint): cint
proc av_crc_get_table* (crc_id: AVCRCId): ptr AVCRC
proc av_crc* (ctx: ptr AVCRC, crc: uint32, buffer: ptr uint8, length: csize_t): uint32