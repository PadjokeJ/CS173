# This swaps the values stored in the variables
# t0 will have t2's initial value, and vice versa

li t0, 0x12345678
li t2, 0xABCDEF00

xor t0, t0, t2  # Perform an initial xor -> t0 contains 0xB9F9B978
xor t2, t0, t2  # This puts the t0's original value into t2
                # why ? doing xor twice results in the original value, 
                # except here we store it into the other variable
xor t0, t0, t2  # This puts the t2's original value into t0

