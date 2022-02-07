function [x, mu] = solveBird()
    f = @(x, y)(sin(y) .* exp((1 - cos(x)).^2) + cos(x) .* exp((1 - sin(y)).^2) + (x-y).^2);
    h = @(x, mu)(mu*(((x(1) + 5)^2 + (x(2) + 5)^2 - 25)));
    dF =@(x)[2*x(1) - 2*x(2) - exp((sin(x(2)) - 1)^2)*sin(x(1)) - 2*exp((cos(x(1)) - 1)^2)*sin(x(1))*sin(x(2))*(cos(x(1)) - 1);
          2*x(2) - 2*x(1) + exp((cos(x(1)) - 1)^2)*cos(x(2)) + 2*exp((sin(x(2)) - 1)^2)*cos(x(1))*cos(x(2))*(sin(x(2)) - 1)];
    H = @(x, mu) [2*mu - exp((sin(x(2)) - 1)^2)*cos(x(1)) + 2*exp((cos(x(1)) - 1)^2)*sin(x(1))^2*sin(x(2)) + 4*exp((cos(x(1)) - 1)^2)*sin(x(1))^2*sin(x(2))*(cos(x(1)) - 1)^2 - 2*exp((cos(x(1)) - 1)^2)*cos(x(1))*sin(x(2))*(cos(x(1)) - 1) + 2,-2*exp((cos(x(1)) - 1)^2)*cos(x(2))*sin(x(1))*(cos(x(1)) - 1) - 2*exp((sin(x(2)) - 1)^2)*cos(x(2))*sin(x(1))*(sin(x(2)) - 1) - 2
                  -2*exp((cos(x(1)) - 1)^2)*cos(x(2))*sin(x(1))*(cos(x(1)) - 1) - 2*exp((sin(x(2)) - 1)^2)*cos(x(2))*sin(x(1))*(sin(x(2)) - 1) - 2,2*mu - exp((cos(x(1)) - 1)^2)*sin(x(2)) + 2*exp((sin(x(2)) - 1)^2)*cos(x(1))*cos(x(2))^2 + 4*exp((sin(x(2)) - 1)^2)*cos(x(1))*cos(x(2))^2*(sin(x(2)) - 1)^2 - 2*exp((sin(x(2)) - 1)^2)*cos(x(1))*sin(x(2))*(sin(x(2)) - 1) + 2];
    dh = @(x, mu) [mu*(2*x(1) + 10); mu*(2*x(2) + 10)];
    dh1 = @(x) [(2*x(1) + 10); (2*x(2) + 10)];
    dh2 = @(x) ((x(1) + 5)^2 + (x(2) + 5)^2 - 25); 
    

    function [p, mu] = solveSQP(x, mu)
        A = [ H(x, mu), dh1(x);
              dh(x, mu)', dh2(x)];
        b = [-dF(x); -h(x, mu)];
        
        y = A \ b;
        p = y(1:2);
        mu = y(3); 
    end

    x = [-3; -2];
    mu = 0.01;
    for i = 1:20
        [p, mu_new] = solveSQP(x(:,end), mu(:,end));
        x = [x, x(:, end) + p];
        mu = [mu, mu_new];
    end
end