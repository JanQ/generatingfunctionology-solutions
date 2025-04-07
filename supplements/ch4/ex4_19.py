# check result part e
# should match OEIS A132961
from math import factorial
def c(n):
    res = 0
    for j in range(1, n + 1):
        for m in range(1, j + 1):
            if j % m == 0:
                res += (-1) ** (m+1) / ((j // m) ** m * factorial(m))
    return res 
    
    
for n in range(1, 100):
    print(c(n) * factorial(n))