function [x] = newton(x, n)
  cnt = 0;
  while (cnt < n)
    bob = x - (f(x) / fd(x))
    if(bob == 0)
      break
    endif
    cnt += 1;
    x = bob
  endwhile
endfunction

function [y] = f(x)
  #y = x^2 - 2;
  #y = x^2 + cos(pi * x) - 1;
  #y = (x-2)^2 - 1;
  #y = x^3 - 5*x;
  #y = 9^x - 6^x - 4^x;
  #y = x^3 - 2^x - 2;
  #y = e^(-x)-x;
  #y = sin(3*x) - cos(2*x);
  #y = x^(1/3);
  y = 
endfunction

function [y] = fd(x)
  #y = 2 * x;
  #y = 2 * x - (pi * sin(pi * x));
  #y = 2*x - 4;
  #y = 3* x^2 - 5;
  #y = log(9)*9^x - log(6)*6^x - log(4)*4^x;
  #y = 3*x^2 - 2;
  #y = -e^(-x)-1;
  #y = 3 * cos(3*x) + 2 * sin(2*x);
  #y = 1/(3 * x ^ (2/3));
endfunction