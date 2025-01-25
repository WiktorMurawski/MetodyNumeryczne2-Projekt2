% Function to implement the RK4 method for second-order ODEs using a vectorized approach
function [t_values, Y_values] = rk4_second_order_vectorized(f, Y0, t0, tf, h)
    % Number of steps
    n_steps = round((tf - t0) / h) + 1;
    t_values = linspace(t0, tf, n_steps);
    Y_values = zeros(2, n_steps);  % Vectorized Y(t) = [y(t); y'(t)]
    
    % Initial conditions
    Y_values(:, 1) = Y0;  % [y(0); y'(0)]
    
    for i = 2:n_steps
        t = t_values(i - 1);
        Y = Y_values(:, i - 1);  % [y(t); y'(t)]
        
        % Define the derivatives
        % f(t, Y) = [y'(t); y''(t)]
        f1 = f(t, Y);
        
        % RK4 for vectorized Y (y, y')
        k1 = h * f1;
        k2 = h * f(t + h / 2, Y + k1 / 2);
        k3 = h * f(t + h / 2, Y + k2 / 2);
        k4 = h * f(t + h, Y + k3);
        
        % Update Y using RK4 formula
        Y_values(:, i) = Y + (k1 + 2*k2 + 2*k3 + k4) / 6;
    end
end

% Function representing the second-order ODE: y'' = 2
function dYdt = example_f(t, Y)
    % dYdt = [y'(t); y''(t)]
    dYdt = [Y(2); 2];  % [y'(t); y''(t) = 2]
end

% Exact solution of the ODE: y(t) = t^2
function y_exact = exact_solution(t)
    y_exact = t^2;
end

% Compute the global error for various values of h
h_values = [0.1, 0.05, 0.025, 0.0125, 0.00625];
errors = zeros(size(h_values));

Y0 = [0.0; 0.0];  % Initial condition [y(0) = 0; y'(0) = 0]
t0 = 0.0;  % Start time
tf = 2.0;  % End time (for example)

for i = 1:length(h_values)
    h = h_values(i);
    
    % Solve the ODE using RK4 (vectorized method)
    [t, Y] = rk4_second_order_vectorized(@example_f, Y0, t0, tf, h);
    
    % Exact solution at final time tf
    y_exact = exact_solution(tf);
    
    % Global error: maximum absolute difference at tf
    global_error = abs(y_exact - Y(1, end));  % Compare y(t) values
    errors(i) = global_error;
end

% Print the global errors for each h
for i = 1:length(h_values)
    fprintf('Step size h = %.4f: Global error = %.6g\n', h_values(i), errors(i));
end

% Plot the errors vs h on a log-log scale
figure;
loglog(h_values, errors, '-o');
xlabel('Step size h');
ylabel('Global Error');
title('Global Error vs Step Size for RK4 (Vectorized)');
grid on;
