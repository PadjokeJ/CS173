li t0, 0xFFFFFFFF
li t1, 0x00000001

add t2, t0, t1

sltu t6, t2, t0 # should only happen if overflow
