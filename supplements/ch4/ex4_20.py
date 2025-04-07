from math import comb
import functools
from random import randint
import matplotlib.pyplot as plt

@functools.cache
def f_rec(n, k, r):
    if n < r:
        return 0
    if k == 0:
        if n == r:
            return 1
        else:
            return 0
    ret = 0
    for rp in range(r, n + 1):
        ret += f_rec(n, k - 1, rp) * comb(rp, r) * 1/(2 ** (rp))
    return ret

def f(n, k, r):
    return 2 ** (-k * r) * comb(n, r) * ((1 - (2 ** (-k))) ** (n - r))

def toss_coin():
    flip = randint(0, 1)
    return flip == 1

def sim(n, its):
    fig = plt.figure()
    fig2 = plt.figure()
    ax = fig.add_subplot(projection="3d")
    ax2 = fig2.add_subplot(projection="3d")
    res = {}
    for i in range(its):
        curr = n
        k = 0
        if k not in res:
            res[k] = {}
        if n not in res[k]:
            res[k][n] = 0
        res[k][n] += 1 
        while curr > 0:
            k += 1
            coins = sum(toss_coin() for j in range(curr))
            curr -= coins
            if k not in res:
                res[k] = {}
            if curr not in res[k]:
                res[k][curr] = 0
            res[k][curr] += 1
    for k in res.keys():
        res[k][0] = its - sum(res[k][i] for i in res[k].keys() if i != 0 )
    for k in range(1, max(res.keys())):
        for r in range(0, n + 1):
            if r not in res[k].keys():
                res[k][r] = 0
            if k != 0:
                ax.scatter(k, r, res[k][r] / its)
                ax2.scatter(k, r, f(n, k, r))
    fig.savefig('ex4_20_sim.png')
    fig2.savefig('ex4_20_calc.png')
    
def sim_game_finish(n, its):
    k = 0
    for i in range(its):
        curr = n
        k2 = 0
        while curr > 0:
            k2 += 1
            coins = sum(toss_coin() for j in range(curr))
            curr -= coins
        k += k2
    return k / its

for n in range(5, 10):
    for k in range(0, 10):
        for r in range(0, n + 1):
            print(f_rec(n, k, r), f(n, k, r))
            
# sim(100, 100000)
print(sim_game_finish(100, 100000))