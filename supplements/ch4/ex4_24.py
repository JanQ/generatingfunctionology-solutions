from math import factorial
from functools import cache

def binom(n, k):
    res = 1
    for i in range(k):
        res *= (n - i)
    return res / factorial(k)

def exact(n):
    return (2*n+11) * (4**n) - 4 * (2*n + 1) * int(binom(2*n, n))

@cache
def rec_mul(n):
    if n == 0:
        return 7
    if n == 1:
        return 28
    
    ret = 64 * (n-2) * rec_mul(n-2) - 32 * (n-1) * rec_mul(n-1) + 96 * rec_mul(n-2) - 24 * rec_mul(n-1)
    ret -= 9 * sum(s*rec_mul(s) * binom(1/2, n-2-s) * (-4)**(n-s) for s in range(0, n-1))
    ret -= 20 * sum(s*rec_mul(s) * binom(1/2,n-1-s) * (-4)**(n-s) for s in range(0, n))
    ret -= 11 * sum(s*rec_mul(s) * binom(1/2, n-s) * (-4)**(n-s) for s in range(0, n))
    ret -= 9 * sum(rec_mul(s) * binom(1/2, n-2-s) * (-4)**(n-s) for s in range(0, n-1))
    ret -= 13 * sum(rec_mul(s) * binom(1/2, n-1-s) * (-4)**(n-s) for s in range(n))

    return ret / (7 * n)

@cache
def rec_three(n):
    if n == 0:
        return 7
    if n == 1:
        return 28

    return ((-16 * n*n + 84 * n - 14) * rec_three(n-1) + (32 * n*n - 160 * n + 72) * rec_three(n-2)) / (n * (-2*n + 11))

for i in range(20):
    print(exact(i), rec_mul(i), rec_three(i))