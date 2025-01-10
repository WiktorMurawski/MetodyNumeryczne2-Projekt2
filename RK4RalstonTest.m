F = @(t,y) y;

F = @(t, y) [y(2);  % y1' = y2
            y(1)]; % y2' = y1

% F = @(t, y) [y(2);             % y1' = y2
%              -2*y(2) - 5*y(1)]; % y2' = -2y2 - 5y1

Y0 = [1, 0];
h = 0.005;
t0 = 0;
tN = 1;
N = (tN - t0) / h;

t = ones(N+1,1)*t0 + (0:h:tN - t0)';

y = RK4RalstonOLD(F,Y0,t0,tN,N);

figure(1); clf; hold on;
plot(t,y(1,:));
% fplot(@(t) exp(-t) .* (cos(2*t) + 0.5 * sin(2*t)), [t0, tN], LineStyle="--");
fplot(@(t) cosh(t), [t0, tN], LineStyle="--");

figure(2); clf; hold on;
plot(t,y(2,:));
% fplot(@(t) exp(-t) .* (-cos(2*t) - 0.5 * sin(2*t)) + exp(-t) .* (-2 * sin(2*t) + cos(2*t)), [t0, tN], LineStyle="--");
fplot(@(t) sinh(t), [t0, tN], LineStyle="--");

err = max(abs(cosh(t) - y(1,:)'))
