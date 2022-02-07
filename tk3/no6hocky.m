%% Initialize Data
% Bila kita menggunakan basis yang ditunjukkan oleh fungsi keempat, akan didapatkan 
% integral sekitar

coefficients = [97.020000000000000;2.219000000000000;0.030450000000000;-4.133333333333411e-04;-2.558333333333298e-05;2.021666666666656e-06;-7.662499999999980e-08];
basis = 1960:10:2020;
f = @(x) getValue(x, coefficients, basis);
%% Sandbox

format long
adapQuad(f, 1960, 2020, 1e-9)
%% Count Numerical Integration

format long
curans = 1.074829071428509e+04;
x = 100:100:1000;
n = size(x');
difftrap = zeros(n);
diffsimp = zeros(n);
diffsimp38 = zeros(n);
diffmid = zeros(n);
y = zeros(n);
for i=1:n
    difftrap(i) = abs(curans - trapezoid(f, 1960, 2020, x(i)));
    diffsimp(i) = abs(curans - simpson(f, 1960, 2020, x(i)));
    diffsimp38(i) = abs(curans - simpson38(f, 1960, 2020, x(i)));
    diffmid(i) = abs(curans - midpoint(f, 1960, 2020, x(i)));
end
plot(x, difftrap, '-.red',x,diffsimp,'-.blue',x,diffsimp38,'-.black', x, diffmid, '-.green')
plot(x, diffmid, '-.g')
%% This is the function to count the polynomial $p_6(t)$at a certaint point $t$.

function y = getValue(p, c, x)
    [~, n] = size(x);
    y = 0;
    for i=n:-1:1
        y = y * (p - x(i));
        y = y + c(i);
    end
end
%% Integration Functions
% Menghitung $\int_a^bf(x)$dengan membaginya menjadi $n$ segments

function s = trapezoid(f, a, b, n)
    % Akan membaginya menjadi n buah trapesium
    s = 0;
    dx = (b - a)/n;
    for i=1:n
        xi = a + (i - 1) * dx;
        xip = xi + dx;
        s = s + (dx / 2) * (f(xi) + f(xip));
    end
end

function s = simpson(f, a, b, n)
    % akan membaginya menjadi beberapa bagian, setiap bagiannya akan
    % menjumlahkan h/3 (y[0]+ 4y[1] + y[2])
    n = n * 2;
    % fprintf("Akan dibagi menjadi %d buah segment", n);
    s = f(a) + f(b);
    h = (b - a)/n;
    for i = 2:n-1
       xi = a + (i - 1) * h;
       if(mod(i, 2) == 1) 
           s = s + 2 * f(xi); 
       else
           s = s + 4 * f(xi);
       end
    end
    s = s / 3 * h;
end

function s = midpoint(f, a, b, n)
    % Akan membaginya menjadi n buah trapesium
    s = 0; h = (b - a)/n;
    for i=1:n
        xi = a + (i - 1) * h;
        xip = xi + h;
        s = s + h * f((xi + xip)/2);
    end
end

function s = simpson38(f, a, b, n)
    % akan membaginya menjadi beberapa bagian, setiap bagiannya akan
    % menjumlahkan h/3 (y[0]+ 4y[1] + y[2])
    n = n * 3;
    % fprintf("Akan dibagi menjadi %d buah segment", n);
    s = f(a) + f(b);
    h = (b - a)/n;
    for i = 2:n-1
       xi = a + (i - 1) * h;
       if(mod(i, 3) == 1) 
           s = s + 2 * f(xi); 
       else
           s = s + 3 * f(xi);
       end
    end
    s = s / 8 * 3 * h;
end

function r = romberg(f,a,b,n)
    
    h = (b - a) ./ (2.^(0:n-1));
    % Compute first trapezoidal r(1, 1) = trap(f, a, b, 1)
    r(1, 1) = (b - a) * (f(a) + f(b))/2;
    for j=2:n
        subtotal = 0;
        for i=1:2^(j-2)
            subtotal = subtotal + f(a + (2 * i - 1) * h(j));
        end
        r(j, 1) = r(j-1, 1) / 2 + h(j) * subtotal;
        for k=2:j
            r(j, k) = (4^(k-1) * r(j, k-1) - r(j-1, k-1)) / (4^(k-1) - 1);
        end
    end
end

function s = adapQuad(f, a0, b0, tol0)
    s = 0; n = 1;
    a(1) = a0; b(1) = b0;
    tol(1) = tol0;
    app(1) = trap(f, a, b);
    while (n > 0)
        c = (a(n) + b(n)) / 2;
        oldapp = app(n);
        app(n) = trap(f, a(n), c);
        app(n + 1) = trap(f, c, b(n));
        if(abs(oldapp - (app(n) + app(n+1))) < 3 * tol(n))
            s = s + app(n) + app(n + 1); 
            n = n - 1;
        else
            b(n + 1) = b(n);
            b(n) = c;
            a(n + 1) = c;
            tol(n) = tol(n) / 2;
            tol(n + 1) = tol(n);
            n = n + 1;
        end
    end
end

function s = trap(f, a, b)
    s = (f(a) + f(b)) * (b - a) / 2;
end
%% 
%