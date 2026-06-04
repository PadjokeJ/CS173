# Data array to loop over
.data
arr: .word 0xF00F008A
.equ len, 1

.text
la  s0, arr
li  s1, len

# Initialize t0 = 0;
li  t0, 0
li  t6, 0

# t1 = address at end of array
add t1, s1, s1
add t1, t1, t1
add t1, t1, s0

loop:
  # Finish loop when s0 (array element address) >= t1 (length of array)
  bge  s0, t1, end
  lw   t2, 0(s0)

  srai t4, t2, 32
  srai t5, t0, 32

  add  t3, t2, t0

  # If the signs are not equal => always ok
  bne  t4, t5, ok
    srai t5, t3, 32
    ## If the signs are the same, but not the same as the sum of the two, overflow
    bne  t5, t4, overflow_signed
  ok:
  mv   t0, t3

  addi t6, 1
  addi s0, s0, 4
  j    loop
end:
  nop

overflow_signed:
  mv   s1, t0
  mv   s2, t6

