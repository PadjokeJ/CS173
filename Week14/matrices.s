# This program finds the maximum value in a matrix +s3 and puts its location in the s4
# and s5 registers
#
# s0: Starting memory address of a matrix
# s1: number of rows in the matrix
# s2: number of columns in the matrix
# s3: arbitrary unsigned 8b number

# Exercise values
.data
matrix:
  .byte 0x0C 0x4E 0x23 0x0B
  .byte 0x22 0x71 0x2E 0x7A
  .byte 0x38 0x18 0x39 0x21

.text

la s0, matrix
li s1, 4
li s2, 3

start:
  add  t0, zero, zero
  add  t1, zero, zero
  add  t3, zero, zero
  add  t5, s0, zero
loop:                 # While (t0 < s1) then While (t1 < s2)
  lbu  t2, 0(t5)      # Load byte t5 of the matrix
  add  t2, t2, s3     # Add an arbitrary number to that value
  slt  t4, t2, t3     # Check whether t2 < t3
  bne  t4, zero, skip # If t3 >= t2 then
  add  s4, t0, zero   # s4 = t0
  add  s5, t1, zero   # s5 = t1
  add  t3, t2, zero   # t3 = t2
skip:
  sb   t2, 0(t5)      # Store the t2 + s3 into the matrix in memory
  addi t5, t5, 1      # t5++ -> move onto the next spot in the matrix
  addi t0, t0, 1      # t0++ -> iteration count (?)
  bne  t0, s1, loop   # If we have calculated for all rows in column
  add  t0, zero, zero # Move onto the next column
  addi t1, t1, 1      # t1++
  bne  t1, s2, loop   # If we have calculated for all columns, end 

nop

# A.i
#   s4 = 3, s5 = 1
# A.ii
#   remains unchanged = 12
# A.iii
#   12 + 8 = 20
# A.iv
#   Not much, numbers are loaded into 32 bit destinations, so it doesn't change anything
# B
#   This program finds the maximum in a matrix+s3, and adds s3 to each of the matrix' elements
# C
#   0x0C, 0x38
# E.i
#   9 bits for the sum (8+8=9)
# E.ii
#   sb truncates information by only storing a byte at maximum
# E.iii
#   slti t2, 0xFF
#   beq  t2, x0, store
#   li t2, 0xFF
#   store:
#   ...

