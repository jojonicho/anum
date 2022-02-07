function [X] = steepestDescent(X, n_iters, ascent)
  if exist('ascent','var')
    printf("ascending yo\n");
  endif
  
  TOL = 1e-7;
  [g] = gradF(X);
  n = 0;
  
  numRow = length(X);
  for i=1:n_iters
    [g] = gradF(X);
    if(norm(g) < TOL)
      break;
    endif
    #alpha = abs(newton(X, g));
    alpha = 0.1;
    printf("alpha: %d\n", alpha);
    X = X + alpha * g;
    n+=1;
  endfor
  
fprintf('Number of Iterations for Convergence: %d\n\n', n);
fprintf('Point of Minima: [%d,%d]\n\n', X(1), X(2));

endfunction

function ans = F(X)
  x = X(1); y=X(2); z=X(3);
  ans = x^2 + 2*y^2 + z^2 + x*y - x;
endfunction

function ans = gradF(X)
  x = X(1); y=X(2); z=X(3);
  ans = -[2*x+y-1; 4*y+x; 2*z];
endfunction

function ans = H(X)
  ans = [2 0 0; 1 4 0; 0 0 2];
endfunction

##function g = gradF(X)
##  x = X(1); y=X(2);
##  g = [-2*x; 2*y-4*y^3];
##endfunction
##
##function ans = F(X)
##  x = X(1); y=X(2);
##  ans = 1 - x^2 + y^2 - y^4;
##endfunction
##
##function ans = H(X)
##  x = X(1); y=X(2);
##  ans = [-2 0; 0 2-12*y^2];
##endfunction

# solve non linear equation
function u = newton(X, g)
  TOL = 1e-4;
  u = 0.1; # alpha
  while (abs(fu(X, g, u)) > TOL)
    #(fu(X, g, u) / dfu(X, g, u))
    u = u - (fu(X, g, u) / dfu(X, g, u));
  endwhile
endfunction


function ans = fu(X, g, u) # u is alpha
  a = X(1);   j = g(1);
  b = X(2);   k = g(2);
  c = X(3);   l = g(3);
  ans = (a + u*j)^2 + 2 * (b + u*k) + (c + u*l)^2 + (a + u*j)*(b + u*k) - (a + u*j);
endfunction

function ans = dfu(X, g, u) # u is alpha
  a = X(1);   j = g(1);
  b = X(2);   k = g(2);
  c = X(3);   l = g(3);
  ans = (2*l^2 + 2*j*k + 2*j^2)*u + 2*c*l + (a+2)*k + (b+2*a-1)*j;
endfunction

##function ans = fu(X, g, u) # u is alpha
##  a = X(1);   i = g(1);
##  b = X(2);   j = g(2);
##  ans = -4*j*(j*u + b)^3 + 2*j*(j*u+b) - 2*i*(i*u+a);
##endfunction
##
##function ans = dfu(X, g, u) # u is alpha
##  a = X(1);   i = g(1);
##  b = X(2);   j = g(2);
##  ans = -12*j^2*(j*u+b)^2 + 2*j^2 - 2*i^2;
##endfunction