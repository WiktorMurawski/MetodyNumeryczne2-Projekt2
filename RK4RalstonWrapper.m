function y = RK4RalstonWrapper(b, a, x0, xN, y0, N)

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
for i = 1:N
  y(:,i+1) = RK4RalstonStep(F,h,t(i),y(:,i));
end % for i

% y(:,1) = y0;
% y(:,2) = RK4RalstonStep(F,h,t(1),y(:,1));
% y(:,3) = RK4RalstonStep(F,h,t(2),y(:,2));
% y(:,4) = RK4RalstonStep(F,h,t(3),y(:,3));
% 
% for i = 4:N
%   F1 = F(t(i), y(:,i));
%   F2 = F(t(i-1), y(:,i-1));
%   F3 = F(t(i-2), y(:,i-2));
%   F4 = F(t(i-3), y(:,i-3));
%   y(:, i+1) = y(:, i) + h * (55*F1 - 59*F2 + 37*F3 - 9*F4) / 24;
% end

end % function
