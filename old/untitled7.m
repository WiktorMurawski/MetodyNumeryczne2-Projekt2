% Function to implement the RK4 method for second-order ODEs using a vectorized approach
function [x_values, Y_values] = rk4_second_order_vectorized(f, Y0, x0, xf, h)
    % Number of steps
    n_steps = round((xf - x0) / h) + 1;
    x_values = linspace(x0, xf, n_steps);
    Y_values = zeros(2, n_steps);  % Vectorized Y(x) = [y(x); y'(x)]
    
    % Initial conditions
    Y_values(:, 1) = Y0;  % [y(0); y'(0)]
    
    for i = 2:n_steps
        x = x_values(i - 1);
        Y = Y_values(:, i - 1);  % [y(x); y'(x)]
        
        % Define the derivatives
        % f(x, Y) = [y'(x); y''(x)]
        f1 = f(x, Y);
        
        % RK4 for vectorized Y (y, y')
        k1 = h * f1;
        k2 = h * f(x + h / 2, Y + k1 / 2);
        k3 = h * f(x + h / 2, Y + k2 / 2);
        k4 = h * f(x + h, Y + k3);
        
        % Update Y using RK4 formula
        Y_values(:, i) = Y + (k1 + 2*k2 + 2*k3 + k4) / 6;
    end
end

% Function representing the second-order ODE: y'' = 12x^2
function dYdx = example_f(x, Y)
    % dYdx = [y'(x); y''(x)]
    dYdx = [Y(2); 12*x^2];  % [y'(x); y''(x) = 12*x^2]
end

% Exact solution of the ODE: y(x) = x^4
function y_exact = exact_solution(x)
    y_exact = x.^4;
end

% Compute the global error for various values of h
h_values = [0.1, 0.05, 0.025, 0.0125, 0.00625];
errors = zeros(size(h_values));

Y0 = [0.0; 0.0];  % Initial condition [y(0) = 0; y'(0) = 0]
x0 = 0.0;  % Start time
xf = 5.0;  % End time (for example)

for i = 1:length(h_values)
    h = h_values(i);
    
    n_steps = round((xf - x0) / h) + 1;

    % Solve the ODE using RK4 (vectorized method)
    % [x, Y] = rk4_second_order_vectorized(@example_f, Y0, x0, xf, h);
    % [x,Y] = RK4Standard(@example_f,Y0,x0,xf,n_steps);
    Y(1,1:20)
    [x,Y] = RK4Ralston(@example_f,Y0,x0,xf,n_steps);
    Y(1,1:20)
    Y = Y(1,:);

    % Exact solution at final time xf
    y_exact = exact_solution(x);

    % Global error: maximum absolute difference at xf
    global_error = max(abs(y_exact - Y));  % Compare y(x) values
    errors(i) = global_error;
end

% Print the global errors for each h
for i = 1:length(h_values)
    fprintf('Step size h = %.5f: Global error = %.6g\n', h_values(i), errors(i));
end

% Plot the errors vs h on a log-log scale
figure;
loglog(h_values, errors, '-o');
xlabel('Step size h');
ylabel('Global Error');
title('Global Error vs Step Size for RK4 (Vectorized) - y\'\' = 12x^2');
grid on;
