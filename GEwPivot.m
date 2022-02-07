function [p U btilde] = GEwPivot(A, b)
  
  B = [A b];
  
  [n, n] = size(A);
  
  p = 1:n;
  
  for k=1:n-1
    [m,l] = max(abs(B(k:n, k)));
    
    l += (k-1)
    
    tmp = B(l, :);
    B(l, :) = B(k, :);
    B(k, :) = tmp;
    
    tmp = p(l);
    p(l) = p(k);
    p(k) = tmp;
    
    for i=k+1:n
       m = B(i, k) / B(k, k);
       B(i, :) = B(i,  :) - m * B(k, :);
    endfor
  endfor
  
  U = B(1:n, 1:n);
  btilde = B(1:n, n+1);
  
endfunction
