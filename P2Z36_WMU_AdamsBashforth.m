function y = P2Z36_WMU_AdamsBashforth(b, a, x0, xN, y0, N)
% Autor: Wiktor Murawski, 333255
% Projekt 2, Zadanie 36
% 
% Funkcja wykorzystuje metodę Adamsa-Bashfortha rzędu 4-go dla rozwiązania
% liniowych równań różniczkowych pierwszego i drugiego rzędu.
% Wartości początkowe y1, y2, y3 wyznaczane są za pomocą metody
% Rungego-Kutty rzędu 4-go wzorem Ralstona.
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
% PRZYKŁADOWE UŻYCIE
% y = P2Z36_WMU_AdamsBashforth...
%     (@(x) exp(x), {@(x) 2, @(x) 4}, 0, 1, [1, 0], 10)
% zwrócone y będzie przybliżeniem rozwiązania równania 4y' + 2y = exp(x)
% na przedziale [0, 1] dla zerowych warunków początkowych y(0) = 1 i 
% y'(0) = 0 z krokiem h = 0.1

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
  F = @(x, Y) [ Y(2); (b(x) - a0(x) * Y(1) - a1(x) * Y(2)) / a2(x)];
else
  if length(y0) ~= 1
    error("Nieodpowiednie warunki początkowe")
  end
  F = @(x, Y) (b(x) - a0(x)*Y) / a1(x);
end

t = linspace(x0, xN, N+1);
h = t(2) - t(1);
y = zeros(length(y0),N+1);

y(:,1) = y0;
y(:,2) = RK4RalstonStep(F,h,t(1),y(:,1));
y(:,3) = RK4RalstonStep(F,h,t(2),y(:,2));
y(:,4) = RK4RalstonStep(F,h,t(3),y(:,3));

for i = 4:N
    F1 = F(t(i),y(:,i));
    F2 = F(t(i-1),y(:,i-1));
    F3 = F(t(i-2),y(:,i-2));
    F4 = F(t(i-3),y(:,i-3));
    y(:,i+1) = (55*F1 - 59*F2 + 37*F3 - 9*F4) / 24 * h + y(:,i);
end

end % function