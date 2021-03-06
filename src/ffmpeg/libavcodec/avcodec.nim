when defined(windows):
  {.push importc, dynlib: "avcodec(|-58|-59|-60|-61|-62).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavcodec(|.58|.59|.60|.61|.62).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavcodec.so(|.58|.59|.60|.61|.62)", cdecl.}

from ../types import AVCodecID, AVCodec, AVSubtitle, AVPacket, AVCodecContext, AVClass, AVCodecParser, AVBufferRef, AVCodecParameters, AVCodecContext, AVChromaLocation, AVPixelFormat, AVCodecParserContext, AVFrame, AVSampleFormat
from ../libavutil/dict import AVDictionary
from version import FF_API_FLAG_TRUNCATED

const
  AV_INPUT_BUFFER_MIN_SIZE* = 16384
  AV_CODEC_FLAG_UNALIGNED* = 1 shl 0
  AV_CODEC_FLAG_QSCALE* = 1 shl 1
  AV_CODEC_FLAG_4MV* = 1 shl 2
  AV_CODEC_FLAG_OUTPUT_CORRUPT* = 1 shl 3
  AV_CODEC_FLAG_QPEL* = 1 shl 4
  AV_CODEC_FLAG_DROPCHANGED* = 1 shl 5
  AV_CODEC_FLAG_PASS1* = 1 shl 9
  AV_CODEC_FLAG_PASS2* = 1 shl 10
  AV_CODEC_FLAG_LOOP_FILTER* = 1 shl 11
  AV_CODEC_FLAG_GRAY* = 1 shl 13
  AV_CODEC_FLAG_PSNR* = 1 shl 15
  AV_CODEC_FLAG_INTERLACED_DCT* = 1 shl 18
  AV_CODEC_FLAG_LOW_DELAY* = 1 shl 19
  AV_CODEC_FLAG_GLOBAL_HEADER* = 1 shl 22
  AV_CODEC_FLAG_BITEXACT* = 1 shl 23
  AV_CODEC_FLAG_AC_PRED* = 1 shl 24
  AV_CODEC_FLAG_INTERLACED_ME* = 1 shl 29
  AV_CODEC_FLAG_CLOSED_GOP* = 1.uint shl 31
  AV_CODEC_FLAG2_FAST* = 1 shl 0
  AV_CODEC_FLAG2_NO_OUTPUT* = 1 shl 2
  AV_CODEC_FLAG2_LOCAL_HEADER* = 1 shl 3
  AV_CODEC_FLAG2_DROP_FRAME_TIMECODE* = 1 shl 13
  AV_CODEC_FLAG2_CHUNKS* = 1 shl 15
  AV_CODEC_FLAG2_IGNORE_CROP* = 1 shl 16
  AV_CODEC_FLAG2_SHOW_ALL* = 1 shl 22
  AV_CODEC_FLAG2_EXPORT_MVS* = 1 shl 28
  AV_CODEC_FLAG2_SKIP_MANUAL* = 1 shl 29
  AV_CODEC_FLAG2_RO_FLUSH_NOOP* = 1 shl 30
  AV_CODEC_EXPORT_DATA_MVS* = 1 shl 0
  AV_CODEC_EXPORT_DATA_PRFT* = 1 shl 1
  AV_CODEC_EXPORT_DATA_VIDEO_ENC_PARAMS* = 1 shl 2
  AV_GET_BUFFER_FLAG_REF* = 1 shl 0
  FF_COMPRESSION_DEFAULT* = -1
  FF_CMP_SAD* = 0
  FF_CMP_SSE* = 1
  FF_CMP_SATD* = 2
  FF_CMP_DCT* = 3
  FF_CMP_PSNR* = 4
  FF_CMP_BIT* = 5
  FF_CMP_RD* = 6
  FF_CMP_ZERO* = 7
  FF_CMP_VSAD* = 8
  FF_CMP_VSSE* = 9
  FF_CMP_NSSE* = 10
  FF_CMP_W53* = 11
  FF_CMP_W97* = 12
  FF_CMP_DCTMAX* = 13
  FF_CMP_DCT264* = 14
  FF_CMP_MEDIAN_SAD* = 15
  FF_CMP_CHROMA* = 256
  SLICE_FLAG_CODED_ORDER* = 0x0001
  SLICE_FLAG_ALLOW_FIELD* = 0x0002
  SLICE_FLAG_ALLOW_PLANE* = 0x0004
  FF_MB_DECISION_SIMPLE* = 0
  FF_MB_DECISION_BITS* = 1
  FF_MB_DECISION_RD* = 2
  FF_CODER_TYPE_VLC* = 0
  FF_CODER_TYPE_AC* = 1
  FF_CODER_TYPE_RAW* = 2
  FF_CODER_TYPE_RLE* = 3
  FF_BUG_AUTODETECT* = 1
  FF_BUG_XVID_ILACE* = 4
  FF_BUG_UMP4* = 8
  FF_BUG_NO_PADDING* = 16
  FF_BUG_AMV* = 32
  FF_BUG_QPEL_CHROMA* = 64
  FF_BUG_STD_QPEL* = 128
  FF_BUG_QPEL_CHROMA2* = 256
  FF_BUG_DIRECT_BLOCKSIZE* = 512
  FF_BUG_EDGE* = 1024
  FF_BUG_HPEL_CHROMA* = 2048
  FF_BUG_DC_CLIP* = 4096
  FF_BUG_MS* = 8192
  FF_BUG_TRUNCATED* = 16384
  FF_BUG_IEDGE* = 32768
  FF_COMPLIANCE_VERY_STRICT* = 2
  FF_COMPLIANCE_STRICT* = 1
  FF_COMPLIANCE_NORMAL* = 0
  FF_COMPLIANCE_UNOFFICIAL* = -1
  FF_COMPLIANCE_EXPERIMENTAL* = -2
  FF_EC_GUESS_MVS* = 1
  FF_EC_DEBLOCK* = 2
  FF_EC_FAVOR_INTER* = 256
  FF_DEBUG_PICT_INFO* = 1
  FF_DEBUG_RC* = 2
  FF_DEBUG_BITSTREAM* = 4
  FF_DEBUG_MB_TYPE* = 8
  FF_DEBUG_QP* = 16
  FF_DEBUG_DCT_COEFF* = 0x00000040
  FF_DEBUG_SKIP* = 0x00000080
  FF_DEBUG_STARTCODE* = 0x00000100
  FF_DEBUG_ER* = 0x00000400
  FF_DEBUG_MMCO* = 0x00000800
  FF_DEBUG_BUGS* = 0x00001000
  FF_DEBUG_BUFFERS* = 0x00008000
  FF_DEBUG_THREADS* = 0x00010000
  FF_DEBUG_GREEN_MD* = 0x00800000
  FF_DEBUG_NOMC* = 0x01000000
  FF_DEBUG_VIS_MV_P_FOR* = 0x00000001 # FF_API_DEBUG_MV & else(2138)
  FF_DEBUG_VIS_MV_B_FOR* = 0x00000002 # FF_API_DEBUG_MV & else
  FF_DEBUG_VIS_MV_B_BACK* = 0x00000004 # FF_API_DEBUG_MV & else
  AV_EF_CRCCHECK* = 1 shl 0
  AV_EF_BITSTREAM* = 1 shl 1
  AV_EF_BUFFER* = 1 shl 2
  AV_EF_EXPLODE* = 1 shl 3
  AV_EF_IGNORE_ERR* = 1 shl 15
  AV_EF_CAREFUL* = 1 shl 16
  AV_EF_COMPLIANT* = 1 shl 17
  AV_EF_AGGRESSIVE* = 1 shl 18
  FF_DCT_AUTO* = 0
  FF_DCT_FASTINT* = 1
  FF_DCT_INT* = 2
  FF_DCT_MMX* = 3
  FF_DCT_ALTIVEC* = 5
  FF_DCT_FAAN* = 6
  FF_IDCT_AUTO* = 0
  FF_IDCT_INT* = 1
  FF_IDCT_SIMPLE* = 2
  FF_IDCT_SIMPLEMMX* = 3
  FF_IDCT_ARM* = 7
  FF_IDCT_ALTIVEC* = 8
  FF_IDCT_SIMPLEARM* = 10
  FF_IDCT_XVID* = 14
  FF_IDCT_SIMPLEARMV5TE* = 16
  FF_IDCT_SIMPLEARMV6* = 17
  FF_IDCT_FAAN* = 20
  FF_IDCT_SIMPLENEON* = 22
  FF_IDCT_NONE* = 24
  FF_IDCT_SIMPLEAUTO* = 128
  FF_THREAD_FRAME* = 1
  FF_THREAD_SLICE* = 2
  FF_PROFILE_UNKNOWN* = -99
  FF_PROFILE_RESERVED* = -100
  FF_PROFILE_AAC_MAIN* = 0
  FF_PROFILE_AAC_LOW* = 1
  FF_PROFILE_AAC_SSR* = 2
  FF_PROFILE_AAC_LTP* = 3
  FF_PROFILE_AAC_HE* = 4
  FF_PROFILE_AAC_HE_V2* = 28
  FF_PROFILE_AAC_LD* = 22
  FF_PROFILE_AAC_ELD* = 38
  FF_PROFILE_MPEG2_AAC_LOW* = 128
  FF_PROFILE_MPEG2_AAC_HE* = 131
  FF_PROFILE_DNXHD* = 0
  FF_PROFILE_DNXHR_LB* = 1
  FF_PROFILE_DNXHR_SQ* = 2
  FF_PROFILE_DNXHR_HQ* = 3
  FF_PROFILE_DNXHR_HQX* = 4
  FF_PROFILE_DNXHR_444* = 5
  FF_PROFILE_DTS* = 20
  FF_PROFILE_DTS_ES* = 30
  FF_PROFILE_DTS_96_24* = 40
  FF_PROFILE_DTS_HD_HRA* = 50
  FF_PROFILE_DTS_HD_MA* = 60
  FF_PROFILE_DTS_EXPRESS* = 70
  FF_PROFILE_MPEG2_422* = 0
  FF_PROFILE_MPEG2_HIGH* = 1
  FF_PROFILE_MPEG2_SS* = 2
  FF_PROFILE_MPEG2_SNR_SCALABLE* = 3
  FF_PROFILE_MPEG2_MAIN* = 4
  FF_PROFILE_MPEG2_SIMPLE* = 5
  FF_PROFILE_H264_CONSTRAINED* = 1 shl 9
  FF_PROFILE_H264_INTRA* = 1 shl 11
  FF_PROFILE_H264_BASELINE* = 66
  FF_PROFILE_H264_CONSTRAINED_BASELINE* = 66 or FF_PROFILE_H264_CONSTRAINED
  FF_PROFILE_H264_MAIN* = 77
  FF_PROFILE_H264_EXTENDED* = 88
  FF_PROFILE_H264_HIGH* = 100
  FF_PROFILE_H264_HIGH_10* = 110
  FF_PROFILE_H264_HIGH_10_INTRA* = 110 or FF_PROFILE_H264_INTRA
  FF_PROFILE_H264_MULTIVIEW_HIGH* = 118
  FF_PROFILE_H264_HIGH_422* = 122
  FF_PROFILE_H264_HIGH_422_INTRA* = 122 or FF_PROFILE_H264_INTRA
  FF_PROFILE_H264_STEREO_HIGH* = 128
  FF_PROFILE_H264_HIGH_444* = 144
  FF_PROFILE_H264_HIGH_444_PREDICTIVE* = 244
  FF_PROFILE_H264_HIGH_444_INTRA* = 244 or FF_PROFILE_H264_INTRA
  FF_PROFILE_H264_CAVLC_444* = 44
  FF_PROFILE_VC1_SIMPLE* = 0
  FF_PROFILE_VC1_MAIN* = 1
  FF_PROFILE_VC1_COMPLEX* = 2
  FF_PROFILE_VC1_ADVANCED* = 3
  FF_PROFILE_MPEG4_SIMPLE* = 0
  FF_PROFILE_MPEG4_SIMPLE_SCALABLE* = 1
  FF_PROFILE_MPEG4_CORE* = 2
  FF_PROFILE_MPEG4_MAIN* = 3
  FF_PROFILE_MPEG4_N_BIT* = 4
  FF_PROFILE_MPEG4_SCALABLE_TEXTURE* = 5
  FF_PROFILE_MPEG4_SIMPLE_FACE_ANIMATION* = 6
  FF_PROFILE_MPEG4_BASIC_ANIMATED_TEXTURE* = 7
  FF_PROFILE_MPEG4_HYBRID* = 8
  FF_PROFILE_MPEG4_ADVANCED_REAL_TIME* = 9
  FF_PROFILE_MPEG4_CORE_SCALABLE* = 10
  FF_PROFILE_MPEG4_ADVANCED_CODING* = 11
  FF_PROFILE_MPEG4_ADVANCED_CORE* = 12
  FF_PROFILE_MPEG4_ADVANCED_SCALABLE_TEXTURE* = 13
  FF_PROFILE_MPEG4_SIMPLE_STUDIO* = 14
  FF_PROFILE_MPEG4_ADVANCED_SIMPLE* = 15
  FF_PROFILE_JPEG2000_CSTREAM_RESTRICTION_0* = 1
  FF_PROFILE_JPEG2000_CSTREAM_RESTRICTION_1* = 2
  FF_PROFILE_JPEG2000_CSTREAM_NO_RESTRICTION* = 32768
  FF_PROFILE_JPEG2000_DCINEMA_2K* = 3
  FF_PROFILE_JPEG2000_DCINEMA_4K* = 4
  FF_PROFILE_VP9_0* = 0
  FF_PROFILE_VP9_1* = 1
  FF_PROFILE_VP9_2* = 2
  FF_PROFILE_VP9_3* = 3
  FF_PROFILE_HEVC_MAIN* = 1
  FF_PROFILE_HEVC_MAIN_10* = 2
  FF_PROFILE_HEVC_MAIN_STILL_PICTURE* = 3
  FF_PROFILE_HEVC_REXT* = 4
  FF_PROFILE_AV1_MAIN* = 0
  FF_PROFILE_AV1_HIGH* = 1
  FF_PROFILE_AV1_PROFESSIONAL* = 2
  FF_PROFILE_MJPEG_HUFFMAN_BASELINE_DCT* = 0xc0
  FF_PROFILE_MJPEG_HUFFMAN_EXTENDED_SEQUENTIAL_DCT* = 0xc1
  FF_PROFILE_MJPEG_HUFFMAN_PROGRESSIVE_DCT* = 0xc2
  FF_PROFILE_MJPEG_HUFFMAN_LOSSLESS* = 0xc3
  FF_PROFILE_MJPEG_JPEG_LS* = 0xf7
  FF_PROFILE_SBC_MSBC* = 1
  FF_PROFILE_PRORES_PROXY* = 0
  FF_PROFILE_PRORES_LT* = 1
  FF_PROFILE_PRORES_STANDARD* = 2
  FF_PROFILE_PRORES_HQ* = 3
  FF_PROFILE_PRORES_4444* = 4
  FF_PROFILE_PRORES_XQ* = 5
  FF_PROFILE_ARIB_PROFILE_A* = 0
  FF_PROFILE_ARIB_PROFILE_C* = 1
  FF_PROFILE_KLVA_SYNC* = 0
  FF_PROFILE_KLVA_ASYNC* = 1
  FF_LEVEL_UNKNOWN* = -99
  FF_SUB_CHARENC_MODE_DO_NOTHING* = -1
  FF_SUB_CHARENC_MODE_AUTOMATIC* = 0
  FF_SUB_CHARENC_MODE_PRE_DECODER* = 1
  FF_SUB_CHARENC_MODE_IGNORE* = 2
  FF_CODEC_PROPERTY_LOSSLESS* = 0x00000001
  FF_CODEC_PROPERTY_CLOSED_CAPTIONS* = 0x00000002
  FF_SUB_TEXT_FMT_ASS* = 0
  FF_SUB_TEXT_FMT_ASS_WITH_TIMINGS* = 1 # FF_API_ASS_TIMING
  AV_HWACCEL_CODEC_CAP_EXPERIMENTAL* = 0x0200
  AV_HWACCEL_FLAG_IGNORE_LEVEL* = 1 shl 0
  AV_HWACCEL_FLAG_ALLOW_HIGH_DEPTH* = 1 shl 1
  AV_HWACCEL_FLAG_ALLOW_PROFILE_MISMATCH* = 1 shl 2
  AV_SUBTITLE_FLAG_FORCED* = 0x00000001
  AV_PARSER_PTS_NB* = 4
  PARSER_FLAG_COMPLETE_FRAMES* = 0x0001
  PARSER_FLAG_ONCE* = 0x0002
  PARSER_FLAG_FETCHED_OFFSET* = 0x0004
  PARSER_FLAG_USE_CODEC_TS* = 0x1000
  AV_CODEC_EXPORT_DATA_FILM_GRAIN* = 1 shl 3
  AV_GET_ENCODE_BUFFER_FLAG_REF* = 1 shl 0

proc avcodec_version* (): cuint
proc avcodec_configuration* (): cstring
proc avcodec_license* (): cchar
proc avcodec_alloc_context3* (codec: ptr AVCodec): ptr AVCodecContext
proc avcodec_free_context* (avctx: ptr ptr AVCodecContext)
proc avcodec_get_class* (): ptr AVClass
proc avcodec_parameters_from_context* (par: ptr AVCodecParameters, codec: ptr AVCodecContext): cint
proc avcodec_parameters_to_context* (codec: ptr AVCodecContext, par: ptr AVCodecParameters): cint
proc avcodec_open2* (avctx: ptr AVCodecContext, codec: ptr AVCodec, options: ptr ptr AVDictionary): cint
proc avcodec_close* (avctx: ptr AVCodecContext): cint
proc avsubtitle_free* (sub: ptr AVSubtitle)
proc avcodec_default_get_buffer2* (s: ptr AVCodecContext, frame: ptr AVFrame, flags: cint): cint
proc avcodec_align_dimensions* (s: ptr AVCodecContext, width: ptr cint, height: ptr cint)
proc avcodec_align_dimensions2* (s: ptr AVCodecContext, width: ptr cint, height: ptr cint, linesize_align: ptr cint)
proc avcodec_enum_to_chroma_pos* (xpos: ptr cint, ypos: ptr cint, pos: AVChromaLocation): cint
proc avcodec_chroma_pos_to_enum* (xpos: cint, ypos: cint): AVChromaLocation
proc avcodec_decode_subtitle2* (avctx: ptr AVCodecContext, sub: ptr AVSubtitle, got_sub_ptr: ptr cint, avpkt: ptr AVPacket): cint
proc avcodec_send_packet* (avctx: ptr AVCodecContext, avpkt: ptr AVPacket): cint
proc avcodec_receive_frame* (avctx: ptr AVCodecContext, frame: ptr AVFrame): cint
proc avcodec_send_frame* (avctx: ptr AVCodecContext, frame: ptr AVFrame): cint
proc avcodec_receive_packet* (avctx: ptr AVCodecContext, avpkt: ptr AVPacket): cint
proc avcodec_get_hw_frames_parameters* (avctx: ptr AVCodecContext, device_ref: ptr AVBufferRef, hw_pix_fmt: AVPixelFormat, out_frames_ref: ptr ptr AVBufferRef): cint
proc av_parser_iterate* (opaque: ptr pointer): ptr AVCodecParser
proc av_parser_init* (codec_id: cint): ptr AVCodecParserContext
proc av_parser_parse2* (s: ptr AVCodecParserContext, avctx: ptr AVCodecContext, poutbuf: ptr ptr uint8, poutbuf_size: ptr cint, buf: ptr uint8, buf_size: cint, pts: int64, dts: int64, pos: int64): cint
proc av_parser_change* (s: ptr AVCodecParserContext, avctx: ptr AVCodecContext, poutbuf: ptr ptr uint8, poutbuf_size: ptr cint, buf: ptr uint8, buf_size: cint, keyframe: cint): cint
proc av_parser_close* (s: ptr AVCodecParserContext)
proc avcodec_encode_audio2* (avctx: ptr AVCodecContext, avpkt: ptr AVPacket, frame: ptr AVFrame, got_packet_ptr: ptr cint): cint
proc avcodec_encode_video2* (avctx: ptr AVCodecContext, avpkt: ptr AVPacket, frame: ptr AVFrame, got_packet_ptr: ptr cint): cint
proc avcodec_encode_subtitle* (avctx: ptr AVCodecContext, buf: ptr uint8, buf_size: cint, sub: ptr AVSubtitle): cint
proc avcodec_pix_fmt_to_codec_tag* (pix_fmt: AVPixelFormat): uint
proc avcodec_find_best_pix_fmt_of_list* (pix_fmt_list: UncheckedArray[AVPixelFormat], src_pix_fmt: AVPixelFormat, has_alpha: cint, loss_ptr: ptr cint): AVPixelFormat
proc avcodec_default_get_format* (s: ptr AVCodecContext, fmt: UncheckedArray[AVPixelFormat]): AVPixelFormat
proc avcodec_string* (buf: cstring, buf_size: cint, enc: ptr AVCodecContext, encode: cint)
proc av_get_profile_name* (codec: ptr AVCodec, profile: cint): cstring
proc avcodec_profile_name* (codec_id: AVCodecID, profile: cint): cstring
proc avcodec_default_execute* (c: ptr AVCodecContext, `func`: proc (c2: ptr AVCodecContext, arg2: pointer): cint, arg: pointer, ret: ptr cint, count: cint, size: cint): cint
proc avcodec_default_execute2* (c: ptr AVCodecContext, `func`: proc (c2: ptr AVCodecContext, arg2: pointer, a3: cint, a4: cint): cint, arg: pointer, ret: ptr cint, count: ptr cint): cint
proc avcodec_fill_audio_frame* (frame: ptr AVFrame, nb_channels: cint, sample_fmt: AVSampleFormat, buf: ptr uint8, buf_size: cint, align: cint): cint
proc avcodec_flush_buffers* (avctx: ptr AVCodecContext)
proc av_get_bits_per_sample* (codec_id: AVCodecID): cint
proc av_get_pcm_codec* (fmt: AVSampleFormat, be: cint): AVCodecID
proc av_get_exact_bits_per_sample* (codec_id: AVCodecID): cint
proc av_get_audio_frame_duration* (avvctx: ptr AVCodecContext, frame_bytes: cint): cint
proc av_get_audio_frame_duration2* (par: ptr AVCodecParameters, frame_bytes: cint): cint
proc av_fast_padded_malloc* (`ptr`: pointer, size: ptr uint, min_size: uint)
proc av_fast_padded_mallocz* (`ptr`: pointer, size: ptr uint, min_size: uint)
proc avcodec_is_open* (s: ptr AVCodecContext): cint

when FF_API_FLAG_TRUNCATED:
  const AV_CODEC_FLAG_TRUNCATED* = 1 shl 16
