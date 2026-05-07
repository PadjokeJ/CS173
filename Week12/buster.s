li x1, 0x00123456
li x2, 0
li x3, 1
li x4, 0

# bit counter:

loop:
    and  x4, x1, x3     # x1 & 1 -> x4
    add  x2, x2, x4     # if the last bit is 1, increment the counter
    srai x1, x1, 1      # x1 >> 1
    bne  x1, x0, loop   # while x1 == 0

# With 0x00123345 -> 9

# Because srai is arithmetic shift, it preserves the sign
# To avoid this issue, we should use sli

li x1, 0x8BADF00D
li x2, 0
li x3, 1
li x4, 0

# bit counter:

loop2:
    and  x4, x1, x3     # x1 & 1 -> x4
    add  x2, x2, x4     # if the last bit is 1, increment the counter
    srli x1, x1, 1      # x1 >>> 1
    bne  x1, x0, loop2   # while x1 == 0

# With 0x8BADF00D -> 16
