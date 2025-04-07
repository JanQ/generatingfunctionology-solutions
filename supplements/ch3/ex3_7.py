from math import factorial, comb
def get_d(n):
    if n < 2:
        return 0
    if n == 2:
        return 1
    return factorial(n) // 2 + factorial(n - 1) // 2
    
hs = [0]
for n in range(1, 15):
    hn = 0
    for l in range(1, n):
        for m in range(0, n - l + 1):
            hn += comb(n, l) * l * get_d(l) * comb(n - l, m) * get_d(m) * m * hs[n - l - m] // (n - l)
            
    # n - l = 0
    for m in range(0, 1):
        hn += get_d(n) * 1 * n
    hs.append(hn // n)
print(hs)

""" check k correctness
real_h = [0, 0, 1, 4, 15, 72, 435, 3300, 30310]
ks = [1]
for n in range(1, len(real_h)):
    k_curr = 0
    for m in range(0, n + 1):
        k_curr += comb(n, m) * real_h[n - m] * get_d(m) * m
    ks.append(k_curr // n)
    
print(ks)
for n in range(1, len(ks)):
    print(sum(comb(n, i) * ks[n-i] * get_d(i) for i in range(n + 1)) // n)
"""