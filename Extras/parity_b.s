.data
  array_in:  .word 1 2 3 4 5
  .equ length, 5
  array_out: .byte 0 0 0 0 0

.text
la   a0, array_in
li   a1, length
la   a2, array_out

li   t0, 0

loop:
beq  t0, a1, end

add  t2, t0, t0
add  t2, t2, t2
add  t2, a0, t2
lw   t1, 0(t2)
li   t2, 0
parity:
  andi t3, t1, 1
  add  t2, t2, t3
  srli t1, t1, 1
  bne  t1, x0, parity
andi t2, t2, 1
add  t3, a2, t0
sb   t2, 0(t3)

addi t0, t0, 1
j    loop
end:
nop

# To save more space, we could store the parity as a single bit (pack 8 parities into a single byte) and then add more bytes the more words we have to check the parity of.
