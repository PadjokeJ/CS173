# QCM questions

## Exercise 1

- 0x55 => `0101_0101`
- 0x2B => `0010_1011`
    - = `1000_0000` => overflow
- 0x69 => `0110_1001`
- 0x16 => `0001_0110`
    - = `0111_1111` => no overflow
- 0xCC => `1100_1100`
- 0xAA => `1010_1010`
    - = `0111_0110` => overflow

## Exercise 2

```
  1101_0101
^ 1010_1011
= 0111_1110
```

6 bits => Hamming distance = 6

## Exercise 3

`f = ~(~((a & ~c) | (c & b)) & (a ^ b))`

- `f(0,0,0) = 1` => cannot be **b)**
- `f(0,0,1) = 1` => cannot be **d)**
- `f(0,1,0) = 0` => cannot be **c)**

# Detailed questions

## Question 1

```
~(~((~a c) + b) + c) + ((a + ~c) ~b)
(~~((~a c) + b) ~c) + ((a + ~c) ~b)
((~a c) + b) ~c + ((a + ~c) ~b)
(~a c ~c + b ~c) + (a ~b + ~b ~c)
b ~c + a ~b + ~b ~c
~c (b + ~b) + a ~b
~c (1) + a ~b
~c + a ~b
```

## Question 2

- Largest Absolute Values
    - Fixed: `100000.000` = -32 => 32
    - Float: `0.11111.111` = 1.11111 * 2^4 = 11111.1 => 31.5
- Conversions
    - Fixed: `000010.000`
    - Float: `0.00001.100`

## Question 3

### a.

G1 = ab
G2 = b + x
G3 = x ^ G1
G4 = G2G1

f = x ^ (ab)
g = (b + x)(ab)

### b.

```verilog
module circ(input a, b, x_in, output f, g);
    wire g1, g2;
    and g_one(g1, a, b);
    or g_two(g2, x_in, b);
    xor g_three(f, x, g1);
    and g_four(g, g1, g2);
endmodule
```

### c.

- g1: `___-___-`
- g2: `__------`
- f:  `___----_`
- g:  `___-___-`

### d.

- a g1 g3 f = 5
- a g1 g4 g = 4
- b g1 g3 f = 5
- b g1 g4 g = 4
- b g2 g4 g = 6 (CRITICAL)
- x g2 g4 g = 6 (CRITICAL)
- x g3 f    = 3

### e.

t: 5 + 3 * (n - 2) + 6

### f.

t = 11

