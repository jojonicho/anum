function [M, y] = midpoint(f, a, b, N)
  dx = (b-a) / N;
  x = linspace(a, b, N+1);
  x_mid = (x(1:N) + x(2:N+1)) / 2;
  y = f(x_mid) * dx;
  M = sum(y);
  # err = abs(I - M) <= (b-a)^3 * K_2 / (24 * N^2)
endfunction