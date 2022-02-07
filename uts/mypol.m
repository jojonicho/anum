function [y] = mypol(x)
  
[A, s, b] = no3();
coeff = A\b';

y = getRow(x) * coeff;

endfunction

function [row] = getRow(i)
  row = 1:101;
  cur = 1;
  for k=0:100
    row(k+1) = cur;
    cur = cur * i;
  endfor
endfunction