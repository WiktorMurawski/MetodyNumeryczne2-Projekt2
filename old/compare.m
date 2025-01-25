% % Define function handles for coefficients
% a3 = @(t) sin(t) + 1; % Ensure a3(t) != 0, adding 1 to avoid singularities
% a2 = @(t) cos(t);
% a1 = @(t) exp(-t);
% a0 = @(t) t.^2;

% Initial conditions
y0 = 1;        % Initial condition for y
yPrime0 = 1;   % Initial condition for y'

% Time span
tspan = [0, 10];

%% Solve using ode45
% Define the system of first-order ODEs
function dYdt = odeSystem(t, Y)
  a3 = @(t) 1;
  a2 = @(t) 1;
  a1 = @(t) 1;
  a0 = @(t) t;
    y1 = Y(1);
    y2 = Y(2);
    dy1dt = y2; % y1' = y2
    dy2dt = (a0(t) - a1(t)*y1 - a2(t)*y2) / a3(t); % y2' derived from original equation
    dYdt = [dy1dt; dy2dt];
end

% Solve the system using ode45
[t_ode, Y_ode] = ode45(@odeSystem, tspan, [y0; yPrime0]);

% Extract solutions
y_ode = Y_ode(:, 1);

%% Solve using dsolve
syms t y(t)
% Define the second-order ODE
a3_sym = 1;
a2_sym = 1;
a1_sym = 1;
a0_sym = t;

ODE = a3_sym * diff(y, 2) + a2_sym * diff(y, 1) + a1_sym * y == a0_sym;

Dy = diff(y,t);

% Solve the ODE
y_sol = dsolve(ODE, y(0) == y0, Dy(0) == yPrime0);

% Convert symbolic solution to a MATLAB function
y_dsolve = matlabFunction(y_sol);

% Evaluate symbolic solution over the same time span
t_dsolve = linspace(tspan(1), tspan(2), 1000);
y_dsolve_vals = y_dsolve(t_dsolve);

%% Plot both solutions
figure(2);
plot(t_ode, y_ode, 'b-', 'LineWidth', 2, 'DisplayName', 'ode45 Solution');
hold on;
plot(t_dsolve, y_dsolve_vals, 'r--', 'LineWidth', 2, 'DisplayName', 'dsolve Solution');
xlabel('Time t');
ylabel('y(t)');
title('Comparison of Solutions from ode45 and dsolve');
legend('Location', 'Best');
grid on;
hold off;

