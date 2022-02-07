function [x, R, qb] = householdersolver(A, b)
  % Solving least square problems through Householder transformation
  % :param A: matrix of size m x n (with m > n)
  % :param b: vector of size m x 1
  % :return x: vector of size n x 1
  % :return R: reduced matrix of A
  % :return qb: reduced vector of b
  
  [m n] = size(A);
  Ab = [A b];
  for i = 1 : n
    % Le a be the i-th column of A
    a = Ab(i:m, i)
    
    % Create vector v; use sign(a(1)) to avoid cancellation
    ae = zeros(m-i+1, 1);
    ae(1) = norm(a);
    p = sign(a(1));
    if p == 1
      v = a + (p * ae);
    elseif p == -1
      v = a - (p * ae);
    endif
    
    % Compute H * u where u is every column of A
    % We never compute H, but use vector v instead
    for j = 1 : n+1
      % Let u be the j-th column of A
      u = Ab(i:m, j);
      
      % Update the j-th column of A through
      Ab(i:m, j) = u - 2 * ((v' * u)/(v' * v)) * v; 
    endfor
  endfor
  
  R = triu(Ab(1:n, 1:n));
  qb = Ab(:, n+1);
  x = R \ qb(1:n);
endfunction