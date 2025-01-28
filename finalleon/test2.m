function test2
% Autor: Wiktor Murawski, 333255
% Projekt 2, Zadanie 36
% 
% Kilka testów dla prostych równań drugiego rzędu, dla których znane są
% rozwiązania analityczne

%% TEST 1
% y'' = 2, y(0) = 0, y'(0) = 0
% y = x^2

a2 = @(x) 1;
a1 = @(x) 0;
a0 = @(x) 0;
a = {a0; a1; a2};
b = @(x) 2;

y0 = [0,0];

x0 = 0;
xN = 10;

y = @(x) x^2;

runTest(y,b,a,x0,xN,y0);

%% TEST 2
% y'' = 6x, y(0) = 0, y'(0) = 0
% y = x^3

a2 = @(x) 1;
a1 = @(x) 0;
a0 = @(x) 0;
a = {a0; a1; a2};
b = @(x) 6*x;

y0 = [0,0];

x0 = 0;
xN = 10;

y = @(x) x^3;

runTest(y,b,a,x0,xN,y0);

%% TEST 3
% y'' = 12x^2, y(0) = 0, y'(0) = 0
% y = x^4

a2 = @(x) 1;
a1 = @(x) 0;
a0 = @(x) 0;
a = {a0; a1; a2};
b = @(x) 12*x^2;

y0 = [0,0];

x0 = 0;
xN = 10;

y = @(x) x^4;

runTest(y,b,a,x0,xN,y0);

%% TEST 4
% y'' = 20x^3, y(0) = 0, y'(0) = 0
% y = x^5

a2 = @(x) 1;
a1 = @(x) 0;
a0 = @(x) 0;
a = {a0; a1; a2};
b = @(x) 20*x^3;

y0 = [0,0];

x0 = 0;
xN = 10;

y = @(x) x^5;

runTest(y,b,a,x0,xN,y0);
