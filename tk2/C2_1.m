J = @(x) [2*x(1) - x(2) + x(2)*exp(x(1)*x(2)) ; 2*x(2) - x(1) + x(1)*exp(x(1)*x(2))];
H = @(x) [x(2)^2*exp(x(1)*x(2)) + 2,exp(x(1)*x(2)) + x(1)*x(2)*exp(x(1)*x(2)) - 1; exp(x(1)*x(2)) + x(1)*x(2)*exp(x(1)*x(2)) - 1, x(1)^2*exp(x(1)*x(2)) + 2];

x = [5; 1]; % initial guess

err = 10^(-8); % Convergence Criteria
i = 1; % Iteration Counter

while norm(J(x)) > err
    y = H(x) \ -J(x);
    x = x + y;
    i = i + 1;
end

fprintf('Number of Iterations for Convergence: %d\n\n', i);
fprintf('Point of Minima: [%d,%d]\n\n', x(1), x(2));