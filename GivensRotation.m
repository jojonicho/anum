function [R bt] = GivensRotation(A, b)
  eps = 1e-9;
  [m n] = size(A);
  A = [A b];
  for k=1:n
    for i=k+1:m
      % Skip if this is good enough = 0
      if(abs(A(i, k)) < eps)
        continue
      endif
      r = sqrt(A(k, k)^2 + A(i, k)^2);
      c = A(k, k)/r
      s = A(i, k)/r
      tmpk = c*A(k, k:n+1) + s * A(i, k:n+1);
      tmpi = -s*A(k, k:n+1) + c * A(i, k:n+1);
      A(k, k:n+1) = tmpk;
      A(i, k:n+1) = tmpi;
    endfor
    A
  endfor
  R = A(:, 1:n);
  bt = A(:, n+1);
endfunction

A = rand(4, 2);
b = rand(4, 1);
[R bt] = GivensRotation(A, b);
norm(bt(3:4))