function [X] = C1_1(X, alpha, n_iters)
  # conjugate steepest descent
  [g] = gradF(X);
  d = -g;
  r1 = -g;
  n = 0
  for i=1:n_iters
    X = X + alpha * d;
    
    [g] = gradF(X)
    if(g == 0)
      printf("num iters: %d\n", n);
      g
      break;
    endif
    
    r2 = -g;
    beta = (r2' * r2) / (r1' * r1);
    d = r2 + beta * d;
    
    r1 = r2;
    n+=1;
  endfor
endfunction

function [g] = gradF(X)
  x = X(1);
  y = X(2);
  g = [y * e^(x*y) + 2*x - y ; x * e^(x*y) - x + 2*y];
endfunction

function [y] = F(X)
  x = X(1);
  y = X(2);
  y = x*x - x*y + y*y + e^(x*y);
endfunction