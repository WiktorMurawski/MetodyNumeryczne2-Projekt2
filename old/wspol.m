c2 = 2/5;
c3 = (14 - 3*sqrt(5))/16;
c4 = 1;

b1 = (263 + 24*sqrt(5))/1812;
b2 = (125 - 1000*sqrt(5))/3828;
b3 = (3426304 + 1661952*sqrt(5))/5924787;
b4 = (30 - 4*sqrt(5))/123;

a21 = 2/5;
a31 = (-2889 + 1428*sqrt(5))/1024;
a41 = (-3365 + 2094*sqrt(5))/6040;

a32 = (3785 - 1620*sqrt(5))/1024;
a42 = (-975 - 3046*sqrt(5))/2552;

a43 = (467040 + 203968*sqrt(5))/240845;

A = [
   0,   0,   0,   0,  0;
  c2, a21,   0,   0,  0;
  c3, a31, a32,   0,  0;
  c4, a41, a42, a43,  0;
   0,  b1,  b2,  b3, b4;
  ]