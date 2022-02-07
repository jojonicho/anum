function [X] = C1_2(X, n_iters)
  TOL = 1e-7;
  [g] = gradF(X);
  n = 0;
  
  [numRow, _] = size(X);
  for i=1:n_iters
    [g] = gradF(X)
    if(norm(g) < TOL)
      printf("num iters: %d\n", n);
      #g;
      break;
    endif
    
    #alpha = fmaxbnd(@(alpha) ros(alpha, X, g), 0.3,0.7);
    #alpha = newton(@(x) X + x .* g , @(x) H(X), numRow);
    alpha = 0.5;
    printf("alpha: %d\n", alpha);
    X = X + alpha * g;
    n+=1;

  endfor
endfunction

function g = gradF(X)
  w = X(1);
  x = X(2);
  y = X(3);
  z = X(4);
  g = [-2*w + x + 1 ; w - 2*x + y + 2; x - 2*y + z + 2 ; y - 2*z + 1];
endfunction

function f = F(X)
  w = X(1);
  x = X(2);
  y = X(3);
  z = X(4);
  f = (w+1)*(x+1) + (x+1)*(y+1) + (y+1)*(z+1) - w*w - x*x - y*y - z*z;
endfunction





# step size stuff
function h = H(X)
   h = [-2, 1, 0, 0; 1, -2, 1, 0; 0, 1, -2, 1; 0, 0, 1, -2];
endfunction

function val = ros(alpha, X, g)
  val = F(X + alpha * g);
end

# solve non linear equation
function x = newton(f, fd, n)
  TOL = 1e-5;
  x = rand(n,1); # alpha
  while (x > TOL)
    x = x - (f(x) \ fd(x))';
  endwhile
  x
endfunction

