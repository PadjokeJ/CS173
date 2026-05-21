.text

li     s1, 0

loop:
  lw   a1, 0(t1)      # Load the array from memory
  beq  a1, x0, end    # If the element == 0, end

  srli a0, a1, 16     # Get the first 16 bits = A
  andi a1, a1, 0xFFFF # Get the last 16 bits = B

  slt  t0, a1, a0     # if  B < A:
  bne  t0, x0, next
  addi s1, 1          #   s1++;

next:
  addi t1, 4          # Get the next element of the array
  j    loop
end:
  nop

