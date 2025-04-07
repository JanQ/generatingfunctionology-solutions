# verify explicit sums
from math import comb

def f(n, m, y):
    ret = 0
    for k in range(n + 1):
        b = (m - k) // 2
        if b < 0 or k < 0 or n < 0 or n - k < 0:
            continue 
        ret += comb(n, k) * comb(n - k, b) * (y ** k)
    return ret

print("y = 2")
for n in range(5, 10):
    for m in range(1, 20):
        print(n, m, f(n, m, 2), comb(2 * n + 1, m))
        
print("y = -2")
for n in range(5, 10):
    for m in range(1, 20):
        print(n, m, f(n, m, -2), comb(2 * n, m) * ((-1) ** m) + comb(2 * n, m - 1) * ((-1) ** (m + 1)))