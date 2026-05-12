# if overflow happens when adding t2 and t4, we add 1 to the addition of t3 and t5

add  t0, t2, t4   # t0 = t2 + t4
sltu t6, t0, t2   # Check if overflow has happened t6 = t/f
add  t7, t3, t5   # t7 = t3 + t5
add  t1, t7, t6   # t1 = t3 + t5 + (overflow? 1 : 0)

