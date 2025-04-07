# check end result of exercise 3.9 against model solution (different expression)
from math import factorial
from math import comb

# generalized binomial
def binom(n, k):
    res = 1
    for i in range(k):
        res *= (n - i)
    return res / factorial(k)

def expected(n):
    if n % 2 == 1:
        return 0
    return factorial(n) * comb(n - 2, n // 2 - 1) // (2 ** (n - 1))

def found(n):
    if n % 2 == 1:
        return 0
    return round((-1) ** (n // 2 - 1) * binom(-1/2, n // 2 - 1) * factorial(n) / 2)

for n in range(1, 20):
    print(expected(n), found(n))