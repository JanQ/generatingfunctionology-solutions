from functools import cache
import sys
sys.setrecursionlimit(5000)

a = [1, 2, 1, 2, 2, 2]
k = 100
n = 300
get_a = lambda n: a[n] if n < len(a) else 0

@cache
def get_b(n):
    if n == 0:
        return 1
    return sum(((k + 1) * l - n) * get_a(l) * get_b(n - l) for l in range(1, n+1)) // n

res = sum(get_b(n) for n in range(n - k + 1))
print(res / 10**k)