% check 4.11a answer
syms t
assume(t ~= 0)

n = 5;
lhs = 0;
for k = 3:5
    lhs = lhs + nchoosek(k, n - k) * t^k;
end

rp = (t + sqrt(t^2 + 4*t))/(-2*t);
rm = (t - sqrt(t^2 + 4*t))/(-2*t);
rhs = simplify(1/(t*(rp-rm)) * (1/rp^(n+1)- 1/rm^(n+1)));

syms x;
rat = 1/(1-t*x-t*x^2);
pfd = simplify((-1 / (t*(rm - rp))) / (rp - x) - (1/(t*(rp-rm))) / (rm - x));
pfd2 = simplify(1/(t*(rp-rm)) * (1/rp * 1/(1-x/rp) - 1/rm*1/(1-x/rm)));