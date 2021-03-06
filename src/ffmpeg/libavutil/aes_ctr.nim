from ../types import AVAESCTR

when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

const
  AES_CTR_KEY_SIZE* = 16
  AES_CTR_IV_SIZE* = 8

proc av_aes_ctr_alloc* (): ptr AVAESCTR
proc av_aes_ctr_init* (a: ptr AVAESCTR, key: ptr uint8): cint
proc av_aes_ctr_free* (a: ptr AVAESCTR)
proc av_aes_ctr_crypt* (a: ptr AVAESCTR, dst, src: ptr uint8, size: cint)
proc av_aes_ctr_get_iv* (a: ptr AVAESCTR): ptr uint8
proc av_aes_ctr_set_random_iv* (a: ptr AVAESCTR)
proc av_aes_ctr_set_iv* (a: ptr AVAESCTR, iv: ptr uint8)
proc av_aes_ctr_set_full_iv* (a: ptr AVAESCTR, iv: ptr uint8)
proc av_aes_ctr_increment_iv* (a: ptr AVAESCTR)
