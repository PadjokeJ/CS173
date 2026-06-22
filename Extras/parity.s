li   a0, 0x9389320

li   t0, 0
mv   t1, a0

loop:
beq  t1, x0, end
andi t2, t1, 1
xor  t0, t2, t0

srli t1, t1, 1

j    loop
end:

mv   a0, t0
nop

