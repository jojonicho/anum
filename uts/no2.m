function [x] = no2()
  
q = 1;
s = 0.86;

b = [2097610; 1455284; 1338663; 944285; 897767];
c = 2 * 2000000;

x = 1:5;
f = @(i) c / (i + q)^s;
for i=1:5
  x(i) = f(i);
endfor

endfunction