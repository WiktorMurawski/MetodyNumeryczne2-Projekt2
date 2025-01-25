function runTest(fun, b, a, x0, xN, y0, imin, imax)
% Autor: Wiktor Murawski, 333255
% Projekt 2, Zadanie 36
%
% Funkcja testująca działanie implementacji metody Adamsa-Bashfortha z
% funkcji P2Z36_WMU_AdamsBashforth poprzez porównanie wyników otrzymanych
% za jej pomocą z dokładnymi wartościami funkcji
% WEJŚCIE
% fun  - uchwyt do funkcji będącej dokładnym, analitycznie wyznaczonym
%        rozwiązaniem równania różniczkowego
% b    - uchwyt do funkcji zmiennej niezależnej x
% a    - tablica komórkowa uchwytów do funkcji zmiennej niezależnej x,
%        uchwyty te opisują liniowe równanie różniczkowe w postaci:
%        a{3}(x) y'' + a{2}(x) y' + a{1}(x) y = b(x)
% x0   - lewy koniec przedziału całkowania równania różniczkowego
% xN   - prawy koniec przedziału całkowania równania różniczkowego
% y0   - wartość początkowa lub wektor wartości początkowych (pierwszy 
%        element to zadana wartość rozwiązania, drugi - wartość pochodnej)
% N    - liczba podprzedziałów, na które dzielony jest przedział [x0, xN]
% imin - określa minimalny krok hmin = 2^(-imin), dla którego testowana
%        jest metoda
% imax - określa maksymalny krok hmax = 2^(-imax), dla którego testowana
%        jest metoda

if nargin < 8
  imin = 0;
  imax = 10;
end

fun_arr = @(x) arrayfun(fun,x);

if length(a) == 3
  fprintf(" %sy'' +",regexprep(func2str(a{3}), '^@\([^\)]*\)\s*', ''));
end
fprintf(" %sy' + %sy = %s", ...
  regexprep(func2str(a{2}), '^@\([^\)]*\)\s*', ''), ...
  regexprep(func2str(a{1}), '^@\([^\)]*\)\s*', ''), ...
  regexprep(func2str(b), '^@\([^\)]*\)\s*', ''));

fprintf("\n")
if length(y0) == 2
  fprintf(" y'(%d) = %d,", x0, y0(2));
end
fprintf(" y(%d) = %d\n", x0, y0(1));

fprintf(" %d <= x <= %d\n", x0, xN);

fprintf(" Rozwiązanie: y = %s\n", ...
  regexprep(func2str(fun), '^@\([^\)]*\)\s*', ''));

fprintf("  i    h = 2^(-i)      Błąd globalny   Zmniejszenie błędu\n");

olderr = NaN;

range = imin:imax;
for i = range
  h = 2^(-i);
  N = floor((xN - x0)/h);
  y_exact = fun_arr(linspace(x0, xN, N+1));
  y_num = P2Z36_WMU_AdamsBashforth(b, a, x0, xN, y0, N);
  err = max(abs(y_exact - y_num));
  fprintf(" %2d |  %.9f  |  %12e  |    %6.3f\n", i, h, err, olderr/err);
  olderr = err;
end

fprintf("\n");
pause();
