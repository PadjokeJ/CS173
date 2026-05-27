.data
.equ s, 40
.equ zero, 0
arr: .space 40

.text

li t0, s
la t1, arr

li t2, zero
li t3, 1

init:
  beq  t2, t0, era

  sb   t3, 0(t1)

  addi t1, t1, 1
  addi t2, t2, 1

  j init
era:
  la   t1, arr
  li   t2, 2

loop:
  bge  t2, t0, end

  lb   t3, 0(t1)
  beq  t3, x0, cont

  add  t5, t2, x0
  li   t4, 0
  li   t3, 0
  li   s0, 32

  add  s1, t2, x0

  mult:
    add  s2, t3, x0
    addi t3, t3, 1

    andi t6, t5, 1

    srli t5, t5, 1

    bgt  t3, s0, endmult
    beq  t6, x0, mult

    sll  s1, t2, s2

    add  t4, s1, t4
    
    j    mult
  
endmult:
  la   t5, arr
  add  t5, t5, t4

  add  t6, t4, x0
  
  
  prime:
    sb   x0, 0(t5)

    add  t5, t5, t2
    add  t4, t4, t2

    blt  t4, t0, prime

cont:
  addi t1, t1, 1
  addi t2, t2, 1

  j    loop
end:
  nop
