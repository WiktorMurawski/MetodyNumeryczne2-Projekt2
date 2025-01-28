function numtest1
% Autor: Wiktor Murawski,333255
% Projekt 2,Zadanie 36
% 
% Parę testów numerycznych

%% TEST 1
% y'' = 2,y(0) = 0,y'(0) = 0
% y = e^x (cos(x) - sin(x));

a2 = @(x) 1;
a1 = @(x) -2;
a0 = @(x) 2;
a = {a0; a1; a2};
b = @(x) 0;

y0 = [1,0];

x0 = 0;
xN = 10;

y = @(x) exp(x)*(cos(x) - sin(x));

runTest(y,b,a,x0,xN,y0,0,15);

%% Test 2
% y'' - x y' + x^2 y = x^3,y(0) = 0,y'(0) = 0

a2 = @(x) 1;
a1 = @(x) x;
a0 = @(x) x^2;
a = {a0; a1; a2};
b = @(x) x^3;

y0 = [0,0];

x0 = 0;
xN = 3;

runTestNum(b,a,x0,xN,y0,0,15);
