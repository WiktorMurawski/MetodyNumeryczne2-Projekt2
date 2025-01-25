function [y] = TestODE45(b, a, x0, xN, y0, N)
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

a0 = a{1}
a1 = a{2}
a2 = a{3}

  function dYdt = odeSystem(t, Y)
    y1 = Y(1);
    y2 = Y(2);
    dy1dt = y2; % y1' = y2
    dy2dt = (b(t) - a0(t)*y1 - a1(t)*y2) / a2(t); % y2' derived from original equation
    dYdt = [dy1dt; dy2dt]; % Return as a column vector
  end % function

% Time span
tspan = [x0, xN]; % Solve from t=0 to t=10

% Solve using ode45
[t, Y] = ode45(@odeSystem, tspan, y0);

% Extract solutions
y = Y(:, 1); % Solution for y
yPrime = Y(:, 2); % Solution for y'

% Plot the solution
figure(1); hold on;
plot(t, y, 'LineWidth', 2, 'Color', 'r');
xlabel('Time t');
ylabel('y(t)');
title('Solution of the Differential Equation');
grid on;

end % function