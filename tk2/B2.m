function [b] = broyden2(f,x0,k)
  
f=@(x) [2 * x(1) ^ 2 - 4 * x(1) + x(2) ^ 2 + 3 * x(2) * x(3)^2 + 6 * x(3) - 2;
x(1)^2 * x(2) + x(2) ^ 2 - 2 * x(2) + 2 * x(3) ^ 2 - 3;
3 * x(1)^2 - 12 * x(1) + x(1) * x(2)^2 + 3 * x(3)^2 + 2];

  [n,m]=size(x0);
  b=eye(n,n); % initial b
  for i=1:k
    x=x0-b*f(x0);
    del=x-x0; delta=f(x)-f(x0);
    b=b+(del-b*delta)*del'*b/(del'*b*delta);
    x0=x;
  end
endfunction


x=broyden2(f,[1;1;1],10)