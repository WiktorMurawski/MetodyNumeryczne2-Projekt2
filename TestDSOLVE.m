function sol = TestDSOLVE(b, a, x0, xN, y0, N)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

a0 = a{1}
a1 = a{2}
a2 = a{3}

syms t y(t)
eq = a2(t) * diff(y(t),t,2) + a1(t) * diff(y(t), t) + a0(t) * y(t) == b(t)

Dy = diff(y,t);
cond = [y(0) == y0(1), Dy(0) == y0(2)]

sol = dsolve(eq,cond)

figure(1); hold on;
fplot(sol,[x0,xN]);

end