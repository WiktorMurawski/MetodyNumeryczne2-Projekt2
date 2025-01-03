F = @(t,y) exp(t) - y;
Y0 = 0;
h = 0.001;
t0 = 0;
tN = 3;
N = (tN - t0) / h;

t = ones(N+1,1)*t0 + (0:h:tN - t0)';

y = RK4Ralston(F,Y0,h,t0,tN,N);

figure(1); hold on;
plot(t,y);