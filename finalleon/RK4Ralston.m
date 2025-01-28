function y = RK4Ralston(F,Y0,t0,tN,N)
% Autor: Wiktor Murawski, 333255
% Projekt 2, Zadanie 36
%
% Funkcja przybliża rozwiązanie równania różniczkowego danego funkcją F
% metodą Rungego-Kutty rzędu 4-go korzystając ze wzoru Ralstona.
% WEJŚCIE
% F  - uchwyt do funkcji reprezentującej prawą stronę równania
%      różniczkowego w postaci Y' = F(x,Y)
% Y0 - wartość początkowa lub wektor wartości początkowych (pierwszy 
%      element to zadana wartość rozwiązania, drugi-wartość pochodnej)
% t0 - lewy koniec przedziału całkowania równania różniczkowego
% tN - prawy koniec przedziału całkowania równania różniczkowego
% N  - liczba podprzedziałów, na które dzielony jest przedział [t0, tN]
% WYJŚCIE
% y  - wektor obliczonych przybliżeń wartości rozwiązania różniczkowego 
%      w punktach t_j = t0 + h*j, gdzie h = (tN-t0)/N, j = 0,1,...,N

a2 = 2/5;
a3 = (14-3*sqrt(5))/16;
a4 = 1;

% c1 = (263+24*sqrt(5))/1812;
c1n = (3439777+313896*sqrt(5));
% c2 = (125-1000*sqrt(5))/3828;
c2n = (773875-6191000*sqrt(5));
% c3 = (3426304+1661952*sqrt(5))/5924787;
c3n = (13705216+6647808*sqrt(5));
% c4 = (30-4*sqrt(5))/123;
c4n = (5780280-770704*sqrt(5));
cd = 23699148;

b21 = 2/5;

% b31 = (-2889+1428*sqrt(5))/1024;
b31n = (-2889+1428*sqrt(5));
% b32 = (3785-1620*sqrt(5))/1024;
b32n = (3785-1620*sqrt(5));
b3d = 1024;

% b41 = (-3365+2094*sqrt(5))/6040;
b41n = (-1073435+667986*sqrt(5));
% b42 = (-975-3046*sqrt(5))/2552;
b42n = (-736125-2299730*sqrt(5));
% b43 = (467040+203968*sqrt(5))/240845;
b43n = (3736320+1631744*sqrt(5));
b4d = 1926760;

t = linspace(t0,tN,N+1);
h = t(2)-t(1);
y = zeros(length(Y0),N+1);

y(:,1) = Y0;
for i = 1:N
  tn = t(i);
  Yn = y(:,i);
  K1 = h*F(tn,Yn);
  K2 = h*F(tn+a2*h,Yn+b21*K1);
  K3 = h*F(tn+a3*h,Yn+(b31n*K1+b32n*K2)/b3d);
  K4 = h*F(tn+a4*h,Yn+(b41n*K1+b42n*K2+b43n*K3)/b4d);
  y(:,i+1) = Yn+(c1n*K1+c2n*K2+c3n*K3+c4n*K4)/cd;
end
