function y = RK4Ralston(F,Y0,t0,tN,N)

y = zeros(length(Y0),N+1);
t = linspace(t0, tN, N+1);
h = t(2) - t(1);
y(:,1) = Y0;

for i = 1:N
  y(:,i+1) = RK4RalstonStep(F,h,t(i),y(:,i));
end

end % function