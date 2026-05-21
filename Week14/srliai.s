# Exercise 2
#
# Multiply t0 by t1 (16b) and put the result into a0

start:
  slli t0, a0, 16   # t0 = a0 << 16;
  srli t0, t0, 16   # t0 = t0 >>> 16; // Truncates the value of t0 to only 16 bits
  slli t1, a1, 16   # t1 = a1 << 16;
  srli t1, t1, 16   # t1 = t1 >>> 16; // Truncates the value of t1 to only 16 bits

  add  a0, x0, x0   # a0 = 0; => li a0, 0

loop:
  beq  t1, x0, end  # if t1 != 0 then
  andi t2, t1, 1    # t2 = t1 & 1   // Gets the last bit of t1 into t2
  beq  t2, x0, cont # if t2 != 0 then => If the last bit==1, add t0 to a0
  add  a0, a0, t0   # a0 += t0

cont:               # else
  slli t0, t0, 1    # t0 = t0 << 1
  srli t1, t1, 1    # t1 = t1 >> 1
  j    loop         # loop

end:                # else
  nop

