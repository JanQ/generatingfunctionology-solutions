clc; close all; clearvars;

f0 = 7;
f1 = 28;

syms x
F = ((-36 * x + 11) * sqrt(1 - 4*x) + 16*x - 4) / (1 - 4*x)^(5/2);
xDF = simplify(x * diff(F, x));
xDsqF = simplify(x * diff(xDF, x));

syms("a", [3, 1])
lhs = a(3) * xDsqF + a(2) * xDF + a(1) * F - (a(3) + a(2) + a(1)) * f1 * x - a(1) * f0;
simfraclhs = expand(simplifyFraction(lhs) * (1-4*x)^(9/2))
finsimfraclhs = 48*a1*x - 4*a1 - 24*a2*x - 24*a3*x + 11*a1*(1 - 4*x)^(1/2) * expand((1-4*x)^2) - 7*a1*(1 - 4*x)^(1/2) * expand((1-4*x)^4) - 192*a1*x^2 + 256*a1*x^3 + 192*a2*x^2 - 384*a2*x^3 - 48*a3*x^2 + 576*a3*x^3 + 128*a3*x^2*(1 - 4*x)^(1/2) - expand((1-4*x)*144*a2*x^2)*(1 - 4*x)^(1/2)- 576*a3*x^3*(1 - 4*x)^(1/2) + 52*a3*x*(1 - 4*x)^(1/2) + expand((1-4*x) * 52*a2*x)*(1 - 4*x)^(1/2) - 36*a1*x*(1 - 4*x)^(1/2) * expand((1-4*x)^2) - 28*a1*x*(1 - 4*x)^(1/2) * expand((1-4*x)^4) - 28*a2*x*(1 - 4*x)^(1/2)* expand((1-4*x)^4) - 28*a3*x*(1 - 4*x)^(1/2)* expand((1-4*x)^4)
[lhs_res, sigma] = subexpr(finsimfraclhs);
lhs_res = simplify(lhs_res)

syms("b", [3, 1])
mhs = x * (b(3) * (xDsqF + 2 * xDF + F) + b(2) * (xDF + F) + b(1) * F) ...
    - (b(3) + b(2) + b(1)) * f0 * x;
simfracmhs = expand(simplifyFraction(mhs) * (1-4*x)^(9/2))
finsimfracmhs = 48*b1*x^2 - 4*b2*x - 4*b3*x - 4*b1*x - 192*b1*x^3 + 24*b2*x^2 + 256*b1*x^4 - 24*b3*x^2 - 128*b2*x^4 + 144*b3*x^3 + 64*b3*x^4 + 52*b3*x^2*(1 - 4*x)^(1/2) + expand((1-4*x)*52*b2*x^2)*(1 - 4*x)^(1/2) + 128*b3*x^3*(1 - 4*x)^(1/2) - expand((1-4*x)^2*36*b1*x^2)*(1 - 4*x)^(1/2) - expand((1-4*x)*144*b2*x^3)*(1 - 4*x)^(1/2) + expand((1-4*x)*104*b3*x^2)*(1 - 4*x)^(1/2) - 576*b3*x^4*(1 - 4*x)^(1/2) - expand((1-4*x)^2)*36*b2*x^2*(1 - 4*x)^(1/2) - expand((1-4*x)*288*b3*x^3)*(1 - 4*x)^(1/2) - expand((1-4*x)^2)*36*b3*x^2*(1 - 4*x)^(1/2) + expand((1-4*x)^2)*11*b1*x*(1 - 4*x)^(1/2) + expand((1-4*x)^2)*11*b2*x*(1 - 4*x)^(1/2) + expand((1-4*x)^2)*11*b3*x*(1 - 4*x)^(1/2) - expand((1-4*x)^4)*7*b1*x*(1 - 4*x)^(1/2) - expand((1-4*x)^4)*7*b2*x*(1 - 4*x)^(1/2) - expand((1-4*x)^4)*7*b3*x*(1 - 4*x)^(1/2)
[mhs_res, sigma2] = subexpr(finsimfracmhs, sigma)
mhs_res = simplify(mhs_res)

syms("g", [3, 1])
rhs = x^2 * (g(3) * (xDsqF + 4 * xDF + 4 * F) + g(2) * (xDF + 2 * F) + g(1) * F);
simfracrhs = expand(simplifyFraction(rhs) * (1-4*x)^(9/2))
finsimfracrhs = 48*g1*x^3 - 4*g1*x^2 - 8*g2*x^2 - 192*g1*x^4 + 72*g2*x^3 - 16*g3*x^2 + 256*g1*x^5 - 192*g2*x^4 + 72*g3*x^3 + 128*g2*x^5 - 48*g3*x^4 + 64*g3*x^5 + 52*g3*x^3*(1 - 4*x)^(1/2) + expand((1-4*x)^2)*11*g1*x^2*(1 - 4*x)^(1/2) + expand((1-4*x)*52*g2*x^3)*(1 - 4*x)^(1/2) + 128*g3*x^4*(1 - 4*x)^(1/2) - expand((1-4*x)^2)*36*g1*x^3*(1 - 4*x)^(1/2) + expand((1-4*x)^2)*22*g2*x^2*(1 - 4*x)^(1/2) - expand((1-4*x)*144*g2*x^4)*(1 - 4*x)^(1/2) + expand((1-4*x)*208*g3*x^3)*(1 - 4*x)^(1/2) - 576*g3*x^5*(1 - 4*x)^(1/2) - expand((1-4*x)^2)*72*g2*x^3*(1 - 4*x)^(1/2) + expand((1-4*x)^2)*44*g3*x^2*(1 - 4*x)^(1/2) - expand((1-4*x)*576*g3*x^4)*(1 - 4*x)^(1/2) - expand((1-4*x)^2)*144*g3*x^3*(1 - 4*x)^(1/2)
[rhs_res, sigma3] = subexpr(finsimfracrhs, sigma)
rhs_res = simplify(rhs_res)

%%
M = [-24 -24 4 4 4 0 0 0; 192 -48 -48 -24 24 4 8 16; -384 576 192 0 -144 -48 -72 -72; 0 0 -256 128 -64 192 192 48; 0 0 0 0 0 -256 -128 -64; 24 24 -4 -4 -4 0 0 0; 96 576 12 -40 -144 -11 -22 -44; -2112 -3264 208 560 784 124 196 236; 7168 7168 -1216 -1792 -1792 -464 -576 -576; -7168 -7168 1792 1792 1792 576 576 576];
sol = null(M, 'rational') * 32

%%
alpha0 = 0;
alpha1 = 11;
alpha2 = -2;

beta0 = -14;
beta1 = 84;
beta2 = -16;

gamma0 = 72;
gamma1 = -160;
gamma2 = 32;

%% CHECK SOLUTION (LINEAR SYSTEM LEVEL)
-24 * alpha1 - 24 * alpha2 + 4 * beta0 + 4 * beta1 + 4 * beta2
192 * alpha1 - 48 * alpha2  - 48 * beta0 - 24 * beta1 + 24 * beta2 + 8 * gamma1 + 16 * gamma2 + 4 * gamma0
-384 * alpha1 + 576 * alpha2 + 192 * beta0 - 144 * beta2 - 48 * gamma0 - 72 * gamma1 - 72 * gamma2
256 * beta0 - 128 * beta1 + 64 * beta2 - 192 * gamma0 - 192 * gamma1 - 48 * gamma2
256 * gamma0 + 128 * gamma1 + 64 * gamma2
24 * alpha1 + 24 * alpha2 - 4 * (beta0 + beta1 + beta2)
96 * alpha1 + 576 * alpha2 + 12 * beta0 - 40 * beta1 - 144 * beta2 - 11 * gamma0 - 22 * gamma1 - 44 * gamma2
-2112 * alpha1 - 3264 * alpha2 + 208 * beta0  + 560 * beta1 + 784 * beta2 + 124 * gamma0 + 196 * gamma1 + 236 * gamma2
7168 * alpha1 + 7168 * alpha2 - 1216 * beta0 - 1792 * beta1 - 1792 * beta2 - 464 * gamma0 - 576 * gamma1 - 576 * gamma2
-7168 * alpha1 - 7168 * alpha2 + 1792 * beta0 + 1792 * beta1 + 1792 * beta2 + 576 * gamma0 + 576 * gamma1 + 576 * gamma2

%% CHECK SOLUTION (EXPRESSION LEVEL)
a1 = alpha0;
a2 = alpha1;
a3 = alpha2;

b1 = beta0;
b2 = beta1;
b3 = beta2;

g1 = gamma0;
g2 = gamma1;
g3 = gamma2;

lhssub = simplify(subs(lhs));
mhssub = simplify(subs(mhs));
rhssub = simplify(subs(rhs));
simplify(lhssub - mhssub - rhssub);