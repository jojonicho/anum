function [a, a_hat] = no1()
  
f = @(k) 0.8/2^(k-1)
a_hat = 1:50
a_hat(1) = 0.8
a_hat(2) = 0.4
a = 1:50

for i=1:50
  if i > 2
    a_hat(i) = 2.5 * a_hat(i-1) - a_hat(i-2)
  endif
  a(i) = f(i)
  #disp(sprintf('a_hat: %.308f', f_hat(i)));
  #disp(sprintf('a: %.308f', f(i)));
endfor

endfunction