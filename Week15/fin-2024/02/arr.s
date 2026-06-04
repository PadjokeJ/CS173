# Data array to loop over
.data
arr: .word 0xF00F008A
.equ len, 1

.text
la  s0, arr
li  s1, len

# Initialize t0 = 0;
li  t0, 0

# t1 = address at end of array
add t1, s1, s1
add t1, t1, t1
add t1, t1, s0

loop:
  # Finish loop when s0 (array element address) >= t1 (length of array)
  bge  s0, t1, end
  lw   t2, 0(s0)
  add  t0, t2, t0

  addi s0, s0, 4
  j    loop
end:
  nop

