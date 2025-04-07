from math import comb

def S(n):
    s = 0
    for k in range(0, n + 1):
        s += comb(2*k, k) // (k + 1) * comb(2*n-2*k, n-k) // (n - k + 1)
    return s 
    
def S2(n):
    return comb(2*n+2,n+1) // (n + 2)
    
for n in range(1, 50):
    print(S(n), S2(n))