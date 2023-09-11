syms s R C L Vout

Vd = 0.7;
A = [-1 1 1 0; 0 0 -1 -1/R; 0 -1 0 -C*s; -L*s 0 0 1];
b = [0; 0; 0; Vd];
x = A\b;
Vout = simplify(x(4))