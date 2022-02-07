function [mid, n] = bisection(lo, hi, TOL)
  n = 0;
  [flo] = f(lo);
      
  while((hi-lo) > TOL)
    n += 1;
    mid = (hi + lo)/2;
    [fmid] = f(mid);
    
    if(fmid * flo < 0)
      hi = mid;
    else
      lo = mid;
    endif
    disp(n)
    disp(lo)
    disp(hi)
  endwhile
  
endfunction

function [y] = f(x)
  #y = x ^ x - 2;
  y = x^3 - 2^x
endfunction