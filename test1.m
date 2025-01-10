function test1
% Kilka testów dla prostych równań pierwszego rzędu, dla których znane są
% rozwiązania analityczne

%% TEST 1
% y' = 1, y(0) = 0
% y = x

a1 = @(x) 1;
a0 = @(x) 0;
a = {a0; a1};
b = @(x) 1;

y0 = 0;

x0 = 0;
xN = 3;

y = @(x) x;

testFunction(y,b,a,x0,xN,y0);

%% TEST 2
% y' = 2x, y(0) = 0
% y = x^2

a1 = @(x) 1;
a0 = @(x) 0;
a = {a0; a1};
b = @(x) 2*x;

y0 = 0;

x0 = 0;
xN = 3;

y = @(x) x^2;

testFunction(y,b,a,x0,xN,y0);

%% TEST 3
% y' = 3x^2, y(0) = 0
% y = x^3

a1 = @(x) 1;
a0 = @(x) 0;
a = {a0; a1};
b = @(x) 3*x^2;

y0 = 0;

x0 = 0;
xN = 3;

y = @(x) x^3;

testFunction(y,b,a,x0,xN,y0);

%% TEST 4
% y' = 4x^3, y(0) = 0
% y = x^4

a1 = @(x) 1;
a0 = @(x) 0;
a = {a0; a1};
b = @(x) 4*x^3;

y0 = 0;

x0 = 0;
xN = 3;

y = @(x) x^4;

testFunction(y,b,a,x0,xN,y0);

%% TEST 5
% y' = 5x^4, y(0) = 0
% y = x^5

a1 = @(x) 1;
a0 = @(x) 0;
a = {a0; a1};
b = @(x) 5*x^4;

y0 = 0;

x0 = 0;
xN = 5;

y = @(x) x^5;

testFunction(y,b,a,x0,xN,y0);

end % function