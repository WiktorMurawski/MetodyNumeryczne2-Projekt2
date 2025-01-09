function [] = testFunction(fun, b, a, x0, xN, y0)

range = 0:9;

fun_arr = @(x) arrayfun(fun,x);

if length(a) == 3
  fprintf(" %sy'' +",regexprep(func2str(a{3}), '^@\([^\)]*\)\s*', ''));
end
fprintf(" %sy' + %sy = %s,\t", ...
  regexprep(func2str(a{2}), '^@\([^\)]*\)\s*', ''), ...
  regexprep(func2str(a{1}), '^@\([^\)]*\)\s*', ''), ...
  regexprep(func2str(b), '^@\([^\)]*\)\s*', ''));

if length(y0) == 2
  fpritnf(" y'(%d) = %d,", x0, y0(2));
end
fprintf(" y(%d) = %d\n", x0, y0(1));

fprintf(" Rozwiązanie: y = %s\n", ...
  regexprep(func2str(fun), '^@\([^\)]*\)\s*', ''));

fprintf("  i    h = 2^(-i)   %3sBłąd\n","");
for i = range
  h = 2^(-i);
  N = floor((xN - x0)/h);
  y = P2Z36_WMU_AdamsBashforth(b,a,x0,xN,y0,N);
  % y = RK4RalstonWrapper(b,a,x0,xN,y0,N);
  sol_v = fun_arr(linspace(x0, xN, N+1));
  err = max(abs(sol_v - y));
  fprintf("  %d | %.9f | %12g\n", i, h, err);
end

fprintf("\n");
pause();

end % function