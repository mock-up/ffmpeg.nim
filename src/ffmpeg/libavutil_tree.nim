{.pragma: tree, importc, header: "<libavutil/tree.h>".}

type
  AVTreeNode* {.tree.} = object

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

var av_tree_node_size*: cint

proc av_tree_node_alloc* (): ptr AVTreeNode
proc av_tree_find* (root: ptr AVTreeNode
, key: pointer, cmp: proc (key, b: pointer): cint, next: array[2, pointer]): pointer
proc av_tree_insert* (rootp: ptr ptr AVTreeNode, key: pointer, cmp: proc (key, b: pointer): cint, next: ptr ptr AVTreeNode): pointer
proc av_tree_destroy* (t: ptr AVTreeNode)
proc av_tree_enumerate* (t: ptr AVTreeNode, opaque: pointer, cmp: proc (opaque, elem: pointer), enu: proc (opaque, elem: pointer))