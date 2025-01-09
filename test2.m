%% TEST 1
% y' = 1, y(0) = 0
% y = x

a1 = @(x) 1;
a0 = @(x) 0;
b = @(x) 1;

y0 = 0;

x0 = 0;
xN = 5;
N = 20;

a = {a0; a1};

y = P2Z36_WMU_AdamsBashforth(b, a, x0, xN, y0, N);

t = linspace(x0,xN,N+1);

yfun = @(x) x;
yfun  = @(varargin)arrayfun(yfun,varargin{:});

figure(1);clf;hold on;
plot(t,y(1,:),Marker='o');
plot(t,yfun(t));

%% TEST 2
% y' = 2x, y(0) = 0
% y = x^2

a1 = @(x) 1;
a0 = @(x) 0;
b = @(x) 2*x;

y0 = 0;

x0 = 0;
xN = 5;
N = 10;

a = {a0; a1};

y = P2Z36_WMU_AdamsBashforth(b, a, x0, xN, y0, N);

t = linspace(x0,xN,N+1);

yfun = @(x) x^2;
yfun  = @(varargin)arrayfun(yfun,varargin{:});

figure(2);clf;hold on;
plot(t,y(1,:),Marker='o');
plot(t,yfun(t));

%% TEST 3
% y' = 3x^2, y(0) = 0
% y = x^3

a1 = @(x) 1;
a0 = @(x) 0;
a = {a0; a1};
b = @(x) 3*x^2;

y0 = 0;

x0 = 0;
xN = 5;
N = 10;

y = P2Z36_WMU_AdamsBashforth(b, a, x0, xN, y0, N);

t = linspace(x0,xN,N+1);

yfun = @(x) x^3;
yfun  = @(varargin)arrayfun(yfun,varargin{:});

figure(3);clf;hold on;
plot(t,y(1,:),Marker='o');
plot(t,yfun(t));

%% TEST 4
% y' = 4x^3, y(0) = 0
% y = x^4

a1 = @(x) 1;
a0 = @(x) 0;
a = {a0; a1};
b = @(x) 4*x^3;

y0 = 0;

x0 = 0;
xN = 5;
N = 10;

y = P2Z36_WMU_AdamsBashforth(b, a, x0, xN, y0, N);

t = linspace(x0,xN,N+1);

yfun = @(x) x^4;
yfun  = @(varargin)arrayfun(yfun,varargin{:});

figure(4);clf;hold on;
plot(t,y(1,:),Marker='o');
plot(t,yfun(t));

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
N = 10;

y = P2Z36_WMU_AdamsBashforth(b, a, x0, xN, y0, N);

t = linspace(x0,xN,N+1);

yfun = @(x) x^5;
yfun  = @(varargin)arrayfun(yfun,varargin{:});

figure(5);clf;hold on;
plot(t,y(1,:),Marker='o');
plot(t,yfun(t));

%% TEST 4
% y' = 4x^3, y(0) = 0
% y = x^4

a1 = @(x) 1;
a0 = @(x) 0;
a = {a0; a1};
b = @(x) 4*x^3;

y0 = 0;

x0 = 0;
xN = 5.23456;
N = 10;

yfun = @(x) x^4;
yfun  = @(varargin)arrayfun(yfun,varargin{:});

testFunction(yfun,b,a,x0,xN,y0);

