# Count the hamming distance between the signs of two arrays
add t0, s0, x0
add t1, s1, x0

# Get the last address of memory of the array
add   t2, s2, s2  # 
add   t2, t2, t2  # n° elements * 4 = memory size 
add   t2, t0, t2  # last index of memory of t2

li    s3, 0 # initialize the counter to 0

loop:
  lw    t3, 0(t0)
  lw    t4, 0(t1)
  # Check if the signs are different
  xor   t5, t3, t4  # we xor to find if the signs are the same
  srli  t5, t5, 31  # we shift the sign diff to the first bit
  add   s3, s3, t5  # we add it to the counter

  # Increment the address in memory
  addi  t0, t0, 4
  addi  t1, t1, 4
  bne   t0, t2, loop # do {...} while (t0 != t2)

nop

