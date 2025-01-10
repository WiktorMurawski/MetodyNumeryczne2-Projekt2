function [t,y] = RK4Standard(F,Y0,t0,tN,N)

  a2 = 1/2;
  a3 = 1/2;
  a4 = 1;
  
  c1 = 1/6;
  c2 = 1/3;
  c3 = 1/3;
  c4 = 1/6;
  
  b21 = 1/2;
  b31 = 0;
  b41 = 0;
  b32 = 1/2;
  b42 = 0;
  b43 = 1; 

  t = linspace(t0,tN,N+1);
  h = t(2) - t(1);
  y = zeros(length(Y0),N+1);

  y(:,1) = Y0;
  for i = 1:N
    tn = t(i);
    Yn = y(:,i);
    K1 = h * F(tn, Yn);
    K2 = h * F(tn + a2 * h, Yn + b21 * K1);
    K3 = h * F(tn + a3 * h, Yn + b31 * K1 + b32 * K2);
    K4 = h * F(tn + a4 * h, Yn + b41 * K1 + b42 * K2 + b43 * K3);
    y(:,i+1) = Yn + c1 * K1 + c2 * K2 + c3 * K3 + c4 * K4;
  end

end