li  t0, 0x7FFFFFFF
li  t1, 0x00000001

add t2, t1, t0

# a: if t2 < 0 
# b: if t0 < t1
# if a&b -> no overflow || if ~a&~b -> no overflow -> xor => overflow

slt t3, t2, x0 # We check whether t2 < 0
slt t4, t0, t1 # We check whether the sum < t1

# If either, but not both, are true, we have overflow

xor t5, t3, t4 # Check if either are true with a xor
slt t6, x0, t5 # Set t6 -> if t6 == 1, we have had overflow
