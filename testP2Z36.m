% %% Test 0
% 
% a2 = @(x) 1;
% a1 = @(x) 1;
% a0 = @(x) 1;
% b = @(x) 1;
%
% y0 = [1,1];
%
% x0 = 0;
% xN = 3;
% N = 10;
% 
% a = {a0; a1; a2};
% 
% y = P2Z36_WMU_AdamsBashforth(b, a, x0, xN, y0, N);
% 
% t = linspace(x0,xN,N+1);
% 
% figure(69);clf;hold on;
% plot(t,y(1,:));
% 
% yfun = @(x) exp(-0.5 * x) * (2 * sqrt(3) / 3) * sin(sqrt(3) / 2 * x) + 1;
% yfun  = @(varargin)arrayfun(yfun,varargin{:});
% 
% plot(t,yfun(t));

%% Test 1
% y' + 2y = e^x

a1 = @(x) 1;
a0 = @(x) 2;
b = @(x) exp(x);

y0 = 2;

x0 = 1;
xN = 5;
N = 20;

a = {a0; a1};

y = P2Z36_WMU_AdamsBashforth(b, a, x0, xN, y0, N);

t = linspace(x0,xN,N+1);

yfun = @(x) 1/3 * exp(x) + (2*exp(2) - 1/3*exp(3))*exp(-2*x);
yfun  = @(varargin)arrayfun(yfun,varargin{:});

figure(1);clf;hold on;
plot(t,y(1,:),Marker='o');
plot(t,yfun(t));

%% Test 2
% y' - xy = 0

a1 = @(x) 1;
a0 = @(x) -x;
b = @(x) 0;

y0 = 3;

x0 = -1;
xN = 5;
N = 30;

a = {a0; a1};

y = P2Z36_WMU_AdamsBashforth(b, a, x0, xN, y0, N);

t = linspace(x0,xN,N+1);

yfun = @(x) 3*exp(-1/2)*exp(x^2/2);
yfun  = @(varargin)arrayfun(yfun,varargin{:});

figure(2); clf; hold on;
plot(t,y(1,:),Marker='o');
plot(t,yfun(t));


%% Test 3
% y'' - 3y' + 2y = 0

a2 = @(x) 1;
a1 = @(x) -3;
a0 = @(x) 2;
b = @(x) 0;

y0 = [4,-2];

x0 = 1;
xN = 5;
N = 20;

a = {a0; a1; a2};

y = P2Z36_WMU_AdamsBashforth(b, a, x0, xN, y0, N);

t = linspace(x0,xN,N+1);

yfun = @(x) 10*exp(-1)*exp(x) - 6*exp(-2)*exp(2*x); 
yfun  = @(varargin)arrayfun(yfun,varargin{:});

figure(3); clf; hold on;
plot(t,y(1,:),Marker='o');
plot(t,yfun(t));

%% Test 4
% y'' + 4y = sin(x)

a2 = @(x) 1;
a1 = @(x) 0;
a0 = @(x) 4;
b = @(x) sin(x);

y0 = [1, 0];

x0 = pi;
xN = 5;
N = 40;

a = {a0; a1; a2};

y = P2Z36_WMU_AdamsBashforth(b, a, x0, xN, y0, N);

t = linspace(x0,xN,N+1);

yfun = @(x) cos(2*x) + 1/6*sin(2*x) + 1/3*sin(x);
yfun  = @(varargin)arrayfun(yfun,varargin{:});

figure(4); clf; hold on;
plot(t,y(1,:),Marker='o');
plot(t,yfun(t));