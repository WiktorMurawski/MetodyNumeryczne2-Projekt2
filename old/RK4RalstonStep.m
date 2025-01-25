function Y_new = RK4RalstonStep(F,h,tn,Yn)
% Funkcja wykonuje jeden krok metody Rungego-Kutty rzędu 4-go korzystając
% ze wzoru Ralstona. Dla podanego y_n wyznacza y_{n+1}
% WEJŚCIE:
% F - uchwyt do funkcji definiującej równanie różniczkowe F(t,Y)
% h - krok całkowania
% tn - wartość zmiennej niezależnej
% yn - wartość funkcji y w momencie tn
% WYJŚCIE:
% y_new - wyznaczona wartość y w momencie tn+h

  a2 = 2/5;
  a3 = (14 - 3*sqrt(5))/16;
  a4 = 1;
  
  c1 = (263 + 24*sqrt(5))/1812;
  c2 = (125 - 1000*sqrt(5))/3828;
  c3 = (3426304 + 1661952*sqrt(5))/5924787;
  c4 = (30 - 4*sqrt(5))/123;
  
  b21 = 2/5;
  b31 = (-2889 + 1428*sqrt(5))/1024;
  b41 = (-3365 + 2094*sqrt(5))/6040;
  b32 = (3785 - 1620*sqrt(5))/1024;
  b42 = (-975 - 3046*sqrt(5))/2552;
  b43 = (467040 + 203968*sqrt(5))/240845;
  
  K1 = h * F(tn, Yn);
  K2 = h * F(tn + a2 * h, Yn + b21 * K1);
  K3 = h * F(tn + a3 * h, Yn + b31 * K1 + b32 * K2);
  K4 = h * F(tn + a4 * h, Yn + b41 * K1 + b42 * K2 + b43 * K3);

  Y_new = Yn + c1 * K1 + c2 * K2 + c3 * K3 + c4 * K4;

end % function