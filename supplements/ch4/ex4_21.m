close all; clearvars;
syms x y z

phi = x*y*(1-x)^3/((1-x)^4-x*y*(1-x-x^2+x^3+x^2*y));
psi = simplify((1-x) * ((phi / (x*y) - 1/(1-x) - (x * phi)/(1-x)^2)));
rhs = simplify(x*y*z / (1-x*z) * psi + y*x^2*z^2/(1-x*z)^2 * phi+ x*y*z/(1-x*z)) ;
exp_ans = x*y*z*(1-x)^2 * ((1-x*z)*(1-x)^2+x^2*y*(z-1))/ ((1-x*z)^2*((1-x)^4-x*y*(1-x-x^2+x^3+x^2*y)));
simplify(rhs - exp_ans)
validpsiphipair(phi, psi)

function valid = validpsiphipair(phi, psi)
    syms x y
    valid = true;
    valid = valid && isAlways(simplify(subs(phi, y, 0)) == 0);
    valid = valid && isAlways(simplify(subs(psi, y, 0)) == 0);
    df = jacobian(phi, y);
    valid = valid && isAlways(simplify(subs(df, y, 0) - x/(1-x)) == 0);
    dg = jacobian(psi, y);
    valid = valid && isAlways(simplify(subs(dg, y, 0) - x/(1-x)^2) == 0);

    valid = valid && isAlways(simplify(phi - x*y/(1-x) - x*y/(1-x) * psi - x^2*y/(1-x)^2*phi) == 0);
    valid = valid && isAlways(simplify(psi - x*y/(1-x)^2 - x*y/(1-x)^2 * psi - 2*x^2*y/(1-x)^3 * phi) == 0);
end
