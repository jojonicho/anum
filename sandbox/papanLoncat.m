function [b] = papanLoncat(n)
  
  L =     2; % 2m
  h = L / n;
  w =   0.3; % 30cm = 0.3m
  d =  0.03; % 3cm = 0.03m
  
  kerapatan =  480; % 480kg/m^3
  E =       1.3e10; % N/m^2
  I = w * d^3 / 12;
  g =         9.81; % Definisikan sebagai konstanta gravitasi
  
  f = (-480 * w * d * g);
  f =    h^4/(E * I) * f;
  
  b = f * ones(n, 1);
endfunction