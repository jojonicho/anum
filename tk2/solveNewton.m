function x = solveNewton(x, n)
  
  #J = @(x,y,z) [1 -z -y; -2*z 1 -2*x; -3*y -3*x 1];
  #H = @(x,y,z) [0 -z -y; -2*z 0 -2*x; -3*y -3*x 0];
  
  TOL = 1e-8; % Convergence Criteria
  i = 0; % Iteration Counter
  err = norm(F(x));
  
  while err > TOL
    j = J(x); f = F(x);
    d = j \ -f;  # d = j \ f;
    x = x + d;    # x = x - d;
    
    y = F(x);
    err = norm(y);
    i = i + 1;
    printf("i: %d - error: %d\n", i, err);
    if i >= n
      break
    endif
  end

  fprintf('Number of Iterations for Convergence: %d\n\n', i);
  fprintf('Point of Minima: [%d,%d]\n\n', x(1), x(2));
endfunction

function ans = F(X)
  w1 = X(1); w2 = X(2); a = X(3);
  ans = [w1 + w2 - 1; w1 * a + w2/3 - 1/2; w1 * a^2 + w2/9 - 1/3];
endfunction

function ans = J(X)
  w1 = X(1); w2 = X(2); a = X(3);
  ans = [1 1 0; a 1/3 w1; a^2 1/9 2*a*w1];
endfunction

# solveNewton([1; 1; 1; 1], 100)
##function ans = F(X)
##  x = X(1); y=X(2); z=X(3); w=X(4);
##  ans = [2*x-w; -10*w + 2*y; -100*w + 2*z; 50505-x-10*y-100*z];
##endfunction
##
##function ans = J(X)
##  x = X(1); y=X(2); z=X(3); l=X(4);
##  ans = [2 0 0 -1; 0 2 0 -10; 0 0 2 -100; -1 -10 -100 0];
##endfunction


##function ans = F(X)
##  x = X(1); y=X(2); z=X(3);
##  ans = [x-y*z; y-2*x*z; z-3*x*y];
##endfunction
##
##function ans = J(X)
##  x = X(1); y=X(2); z=X(3);
##  ans = [1 -z -y; -2*z 1 -2*x; -3*y -3*x 1];
##endfunction
##
##function ans = H(X)
##  x = X(1); y=X(2); z=X(3);
##  ans = [0 -z -y; -2*z 0 -2*x; -3*y -3*x 0];
##endfunction