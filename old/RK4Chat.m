function Y_values = RK4Chat(f, Y0, x0, xf, h)
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