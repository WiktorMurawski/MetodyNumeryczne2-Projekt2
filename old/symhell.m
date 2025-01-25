
% syms a2 a3 a4
% syms w1 w2 w3 w4
% syms b32 b42 b43

a2 = sym(2/5)
a3 = sym(7/8) - sym(3/16)*sqrt(sym(5))

syms a2 a3

a4 = 1

w1 = 1/2 + (1-2*(a2+a3))/(12*a2*a3);
w1 = simplify(w1)
% double(w1)

w2 = (2*a3 - 1)/(12*a2*(a3-a2)*(1 - a2));
w2 = simplify(w2)
% double(w2)

w3 = (1 - 2*a2)/(12*a3*(a3-a2)*(1 - a3));
w3 = simplify(w3)
% double(w3)

w4 = 1/2 + (2*(a2+a3) - 3)/(12*(1-a2)*(1-a3));
w4 = simplify(w4)
% double(w4)


b32 = a3*(a3-a2)/(2*a2*(1-2*a2));
b32 = simplify(b32)
% double(b32)

b42 = (1-a2)*(a2+a3-1-(2*a3-1)^2)/(2*a2*(a3-a2)*(6*a2*a3-4*(a2+a3)+3));
b42 = simplify(b42)
% double(b42)

b43 = (1-2*a2)*(1-a2)*(1-a3)/(a3*(a3-a2)*(6*a2*a3-4*(a2+a3)+3));
b43 = simplify(b43)
% double(b43)



b21 = a2
b21 = simplify(b21)
% double(b21)

b31 = a3 - b32
b31 = simplify(b31)
% double(b31)

b41 = a4 - b42 - b43
b41simp = simplify(b41)
% double(b41)

b41simp100 = simplify(b41, 'Steps', 100)

b41fact = factor(b41)
factoredb41 = prod(b41fact)