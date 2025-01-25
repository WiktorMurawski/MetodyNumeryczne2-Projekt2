function y = RK4RalstonWrapper(b, a, x0, xN, y0, N)
% WEJŚCIE
% b  - uchwyt do funkcji zmiennej niezależnej x
% a  - tablica komórkowa uchwytów do funkcji zmiennej niezależnej x
%      powyższe uchwyty opisują liniowe równanie różniczkowe w postaci:
%      a{3}(x) y'' + a{2}(x) y' + a{1}(x) y = b(x)
% x0 - lewy koniec przedziału całkowania równania różniczkowego
% xN - prawy koniec przedziału całkowania równania różniczkowego
% y0 - wartość początkowa lub wektor wartości początkowych (pierwszy 
%      element to zadana wartość rozwiązania, drugi - wartość pochodnej)
% N  - liczba podprzedziałów, na które dzielimy przedział [x0, xN]
% WYJŚCIE
% y  - wektor obliczonych przybliżeń wartości rozwiązania różniczkowego 
%     w punktach x_j = x0 + h*j, gdzie h = (xN - x0)/N, j = 0,1,...,N

if length(a) > 3 || length(a) < 2
  error("Nieodpowiedni rozmiar tablicy a")
end

a0 = a{1};
a1 = a{2};
if length(a) == 3
  if length(y0) ~= 2
    error("Nieodpowiednie warunki początkowe")
  end
  a2 = a{3};
  F = @(x, Y) [ Y(2); (b(x) - a0(x)*Y(1) - a1(x)*Y(2)) / a2(x)];
else
  if length(y0) ~= 1
    error("Nieodpowiednie warunki początkowe")
  end
  F = @(x, Y) (b(x) - a0(x)*Y) / a1(x);
end

y = RK4Ralston(F,y0,x0,xN,N);

end % function
