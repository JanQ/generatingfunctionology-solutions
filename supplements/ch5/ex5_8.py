# helping with computations
from math import comb, factorial

def binom_gen(n, k):
    if k == 0:
        return 1
    ret = n
    for i in range(1, k):
        ret *= (n - i)
    ret /= factorial(k)
    return ret

# get coefficient m from (1 + u + u^2)^(n/3)
def get_coeff(n, m):
    ret = 0
    if m == 0:
        return 1
    for l in range(m):
        top = m - l 
        if top < l:
            break 
        ret += comb(top, l) * binom_gen(n/3, top)
    return ret

# get [t^n]r_n^{-1} via LIF
def get_coeff_inv_rn(n):
    return get_coeff(n, n - 1) / n

for i in range(1, 5):
    print(get_coeff_inv_rn(i))