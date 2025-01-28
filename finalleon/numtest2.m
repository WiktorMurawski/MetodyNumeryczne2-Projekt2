function numtest2
% Autor: Wiktor Murawski,333255
% Projekt 2,Zadanie 36
% 
% Funkcja rysująca wykres błędu globalnego od wartości kroku h
% UWAGA: Funkcja może wykonać się długo dla dużych wartości n i (xN-x0)

%% Przygotowanie testowanego równania
a2 = @(x) 1;
a1 = @(x) 0;
a0 = @(x) 0;
a = {a0; a1; a2};
b = @(x) 20*x^3;

y0 = [0,0];

x0 = 0;
xN = 100;

y = @(x) x^5;

fun_arr = @(x) arrayfun(y,x);

%% Wyznaczanie błędu dla różnych h
n = 1000;
hmin = 0.001;
hmax = 1;
% hvals = linspace(hmin,hmax,n);
d1 = log10(hmin);
d2 = log10(hmax);
hvals = 10 .^ linspace(d1,d2,n);
error = zeros(1,n);

for i = 1:length(hvals)
  h = hvals(i);
  N = floor((xN - x0)/h);
  y_exact = fun_arr(linspace(x0,xN,N+1));
  y_num = P2Z36_WMU_AdamsBashforth(b,a,x0,xN,y0,N);
  error(i) = max(abs(y_exact - y_num));
end

%% Wykres
figure(1);clf;
loglog(hvals,error,'-','LineWidth',1.5);
hold on;
c = 4e3;
loglog(hvals,c*hvals.^4);
set(gca,'xdir','reverse');
grid on;
xlabel('Wartość kroku h','FontSize',12);
ylabel('Błąd globalny','FontSize',12);
title(['Wykres zależności błędu globalnego od '...
  'kroku w skali podwójnie logarytmicznej'],'FontSize',12);
leg1 = legend("Blad globalny","$y = 4000 h^4$");
set(leg1,'Interpreter','latex');
set(leg1,'FontSize',14);