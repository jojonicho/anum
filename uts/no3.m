function [A, s, b] = no3()
f = @(x) 1/(1 + 10*x^2);

n = 101;
s = 1:101;
b = 1:101;
A = zeros(101, 101);

for i=0:100
  s(i+1) = i/50 - 1;
  A(i+1, :) = getRow(i);
  b(i+1) = f(i);
endfor

endfunction

function [row] = getRow(i)
  row = 1:101;
  cur = 1;
  for k=0:100
    row(k+1) = cur;
    cur = cur * i;
  endfor
endfunction