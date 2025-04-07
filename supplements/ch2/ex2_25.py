from math import e
from math import pi
from math import gcd
from math import sqrt
import numpy as np

def reduce(n):
    a = 0
    while n % 2 == 0:
        a += 1
        n //= 2
    return a, n

def calcBeta(n, r):
    a, npp = reduce(n)
    beta = 0
    for k in range(1, npp + 1):
        beta = beta + 2 ** ((2 ** a) * gcd(k, npp)) * e ** (- 2 * pi * 1j * r * k / npp)
    return round(beta.real / (2 * n))
    
def getBetas(n):
    return [calcBeta(n, i) for i in range(2 * n)]

def getSeq(n):
    a, npp = reduce(n)
    return [2 ** ((2 ** a) * gcd(i, npp)) for i in range(npp)]
    
def calcParsevalLhs(n):
    a, npp = reduce(n)
    return sum(2 ** (2 ** (a + 1) * gcd(i, npp)) for i in range(npp))

def calcParsevalRhs(n):
    a, npp = reduce(n)
    betas = getBetas(n)
    s = sum((2 * n * betas[k]) ** 2 for k in range(npp))
    return s / npp

def calcVarList(arr):
    m = sum(arr) / len(arr)
    var = sum((arr[i] - m) ** 2 for i in range(len(arr)))
    return var / (len(arr))
    
def calcVarFormula(n):
    a, npp = reduce(n)
    var = sum(2 ** (2 ** (a + 1) * gcd(i, npp)) for i in range(1, npp))
    return var / (4 * n * n)
    
n = 66
a, npp = reduce(n)
beta = getBetas(n)
mu = sum(beta) / len(beta)
print(calcVarList(beta))
print(calcVarFormula(n))

seq = getSeq(n)
ft = np.fft.fft(seq)
print(ft)
print(beta)

for i in range(2, 100):
    #print(i, calcVarFormula(i))
    print(i, sqrt(calcVarFormula(i)) / (2 ** ( i) / (2 * i)), sqrt(i) * 2 ** (-2 * i / 3))


