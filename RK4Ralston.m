function y = RK4Ralston(F,Y0,h,t0,tN,N)

y = zeros(N+1,1);
t = ones(N+1,1)*t0 + (0:h:tN - t0)';
y(1) = Y0(1);

for i = 1:N
  y(i+1) = RK4RalstonStep(F,h,t(i),y(i));
end

end % function