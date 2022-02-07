e = input('Enter a small number: ');

A = [1 1+e; 1-e 1];
b = [1+(1+e)*e; 1];

x_compute = gauss(A, b);

x_exact = A \ b;

error = @(app, exa) abs((app - exa) / exa) * 100;

disp(sprintf('Condition number of A: %.2f', cond(A, inf)));
disp(sprintf('Relative error first element: %.2f', error(x_compute(1), x_exact(1))));
disp(sprintf('Relative error first element: %.2f', error(x_compute(2), x_exact(2))));
