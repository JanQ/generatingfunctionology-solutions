# check intermediate answer ex4.13
from math import comb

def f(s, r):
    ret = 0
    for m in range(r + 1):
        b = r - s + m
        if b < 0 or b > r:
            continue
        ret += ((-1) ** m) * comb(r, m) * comb(r, b)
    return ret
    
def f2(s, r):
    if s % 2 == 1:
        return 0
    if s % 2 == 0:
        return comb(r, s // 2) * (-1) ** ((s // 2))

for s in range(1, 10):
    for r in range(5, 10):
        print(f(s, r), f2(s, r))