function [T, y] = trapezoid(f, a, b, N)
  x = linspace(a, b, N+1);
  y = f(x);
  y_right = y(2:N+1);
  y_left = y(1:N);
  dx = (b-a) / N;
  
  y = (dx/2) * (y_right + y_left);
  T = (dx/2) * sum(y_right + y_left);
  
  # err = I - T <= (b-a)^3 * K_2 / (12 * N^2)
endfunction