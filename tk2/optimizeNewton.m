function x = optimizeNewton(x, n)
  
  #J = @(x,y,z) [1 -z -y; -2*z 1 -2*x; -3*y -3*x 1];
  #H = @(x,y,z) [0 -z -y; -2*z 0 -2*x; -3*y -3*x 0];
  
  TOL = 10^(-8); % Convergence Criteria
  i = 0; % Iteration Counter
  err = norm(J(x));

  while abs(err) > TOL
    y = H(x) \ -J(x)';
    x = x + y';
    i = i + 1;
    printf("i: %d - error: %d\n", i, err);
    if i >= n
      break
    endif
    err = norm(J(x));
  end

  fprintf('Number of Iterations for Convergence: %d\n\n', i);
  fprintf('Point of Minima: [%d,%d]\n\n', x(1), x(2));
endfunction

function ans = F(X)
  x = X(1); y=X(2); z=X(3);
  ans = x^2 + 2*y^2 + z^2 + x*y - x;
endfunction

function ans = J(X)
  x = X(1); y=X(2); z=X(3);
  ans = [2*x+y-1; 4*y+x; 2*z];
endfunction

function ans = H(X)
  x = X(1); y=X(2);
  ans = [2 0 0; 1 4 0; 0 0 2];
endfunction

##function ans = F(X)
##  x = X(1); y=X(2);
##  ans = 1 - x^2 + y^2 - y^4;
##endfunction
##
##function ans = J(X)
##  x = X(1); y=X(2);
##  ans = [-2*x 2*y-4*y^3];
##endfunction
##
##function ans = H(X)
##  x = X(1); y=X(2);
##  ans = [-2 0; 0 2-12*y^2];
##endfunction