# This code copies a2 words from t0's space in memory to t1's space in memory

add t0, a0, zero    # set t0 to a0                -> t0 = a0
add t1, a1, zero    # set t1 to a1                -> t1 = a1
add t2, a2, a2      # multiply a2 by 2 into t2
add t2, t2, t2      # multiply it by 2            -> t2 = a2 * 4
add t3, t0, t2      # add t0 and t2 into t3       -> t3 = a2 * 4 + a0
loop:
  lw   t4, 0(t0)      # load the t0-th word into t4
  sw   t3, 0(t1)      # store the t3 word into t1-th in memory
  addi t0, t0, 4      # add 4 to t0
  addi t1, t1, 4      # add 4 to t1
  sltu t5, t0, t3
  bne t5, zero, loop  # if t0 < t3, then loop

# Addi adds 4 -> we are working with words => 4 bytes per words -> 4 addresses in memory

# Memory addresses can start with a sign, so we check unsigned

