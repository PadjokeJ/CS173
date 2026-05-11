# This code averages the minimum and the maximum value stored from 0 to s1 in memory

li    t0, 0             # t0 = 0
add   t1, zero, s1      # t1 = s1
lw    t2, 0(s0)         # t2 = mem(s0)
lw    t3, 0(s0)         # t3 = mem(s0)
label0:                 # do {
 lw   t5, 0(t1)         #   t5 = mem(t1)
 slt  t4, t2, t5        #
 bne  t4, zero, label1  #   if (t2 >= t5)   -> t2 = min(t2, t5)
 add  t2, zero, t5      #     t2 = t5
label1:
 slt  t4, t5, t3        #
 bne  t4, zero, label2  #   if (t5 >= t3)   -> t3 = max(t3, t5)
 add  t3, zero, t5      #     t3 = t5
label2:
 addi t0, t0, 1         #   t0 += 1
 addi t1, t1, 4         #   t1 += 4
 bne  s1, t0, label0    # } while (s1 != t0)
 add  t4, t2, t3        # t4 = t2 + t3
 srai s2, t4, 1         # s2 = t4 / 2

