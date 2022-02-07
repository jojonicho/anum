J = @(x) [x(2) - 2*x(1) + 1, x(1) - 2*x(2) + x(3) + 2, x(2) - 2*x(3) + x(4) + 2, x(3) - 2*x(4) + 1]';
H = [-2, 1, 0, 0; 1, -2, 1, 0; 0, 1, -2, 1; 0, 0, 1, -2];

x = [5; 1; 1; 1]; % initial guess

e = 10^(-8); % Convergence Criteria
i = 1; % Iteration Counter

while norm(J(x)) > e
    y = H \ -J(x);
    x = x + y;
    i = i + 1;
end

fprintf('Number of Iterations for Convergence: %d\n\n', i);
fprintf('Point of Minima: [%d,%d,%d,%d]\n\n', x(1), x(2), x(3), x(4));
