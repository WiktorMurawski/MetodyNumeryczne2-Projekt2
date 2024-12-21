function [y] = P2Z36_WMU_AdamsBashforth(b, a, x0, xN, y0, N)
%%% Metoda Adamsa-Bashfortha rzędu 4-go dla liniowych równań różniczkowych 
%%% pierwszego i drugiego rzędu. Wartości początkowe y_1, y_2, y_3 należy 
%%% obliczyć metodą Rungego-Kutty rzędu 4-go (wzór Ralstona; należy 
%%% samodzielnie poszukać dokładnych wartości współczynników).
% Autor: Wiktor Murawski, 333255
% Projekt 2, Zadanie 36
% 
% Funkcja wykorzystuje metodę Adamsa-Bashfortha rzędu 4-go dla rozwiązania
% liniowych równań różniczkowych pierwszego i drugiego rzędu.
% Wartości początkowe y1, y2, y3 wyznaczane są za pomocą metody
% Rungego-Kutty rzędu 4-go wzorem Ralstona.
% WEJŚCIE
% b - uchwyt do funkcji zmiennej niezależnej x
% a - tablica komórkowa uchwytów do funkcji zmiennej niezależnej x
%     powyższe uchwyty opisują liniowe równanie różniczkowe w postaci:
%     a{3}(x) y'' + a{2}(x) y' + a{1}(x) y = b(x)
% x0 - lewy koniec przedziału całkowania równania różniczkowego
% xN - prawy koniec przedziału całkowania równania różniczkowego
% y0 - wartość początkowa lub wektor wartości początkowych (pierwszy 
%      element to zadana wartość rozwiązania, drugi - wartość pochodnej)
% N - liczba podprzedziałów, na które dzielimy przedział [x0, xN]
% WYJŚCIE
% y - wektor obliczonych przybliżeń wartości rozwiązania różniczkowego 
%     w punktach x_j = x0 + h*j, gdzie h = (xN - x0)/N, j = 0,1,...,N
% PRZYKŁADOWE UŻYCIE
% y = P2Z36_WMU_AdamsBashforth...
%     (@(x) exp(x), {@(x) 2, @(x) 4}, 0, 1, [0, 0], 10)
% zwrócone y będzie przybliżeniem rozwiązania równania 4y' + 2y = exp(x)
% na przedziale [0, 1] dla zerowych warunków początkowych z krokiem h = 0.1

if length(a) < 3
  a{3} = @(x) 0;

a0 = a{1};
a1 = a{2};
a2 = a{3};

y = zeros(1,N);
y(1) = y0(1);


end % function