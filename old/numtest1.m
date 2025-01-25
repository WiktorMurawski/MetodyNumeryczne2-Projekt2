function numtest1

% y'' = 2, y(0) = 0, y'(0) = 0
% y = x^2

a2 = @(x) 1;
a1 = @(x) 0;
a0 = @(x) 0;
a = {a0; a1; a2};
b = @(x) 2;

y0 = [0,0];

x0 = 0;
xN = 2;

y = @(x) x^2;

h = 0.01;
N = floor((xN - x0)/h);
t = linspace(x0, xN, N+1);
y_num = RK4RalstonWrapper(b,a,x0,xN,y0,N);
y_num = y_num(1,:);
% y_num = P2Z36_WMU_AdamsBashforth(b,a,x0,xN,y0,N);

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

[t,y_ode45] = ode45(F,t,y0);
y_ode45 = y_ode45(:,1);

figure(1);clf;hold on;
plot(t,y_ode45);
plot(t,y_num);

err = max(abs(y_ode45 - y_num'))

end