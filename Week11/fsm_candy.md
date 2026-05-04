# 1

- inputs: money (1 2 or 5 chf)
- outputs: candybar
- internal state: (0-7) (money)
# 2

- money: 0-> 00, 1 -> 01, 2 -> 10, 5 -> 11
- candy: y -> 1, n -> 0
- internal state: current money
# 3

0-7 -> accept money and redir to state + money mod 8 (the last ones should check if we overflow and should therefore output one)
# 4
