function [A] = getEulerBernoulliBeamMatrix(n)
  A = sparse(n, n);
  A(1, 1) =   16;
  A(1, 2) =   -9;
  A(1, 3) =  8/3;
  A(1, 4) = -1/4;
  A(2, 1) =   -4;
  A(2, 2) =    6;
  A(2, 3) =   -4;
  A(2, 4) =    1;
  for i=3:n-2
    A(i, i - 2) =  1;
    A(i, i - 1) = -4;
    A(i, i)     =  6;
    A(i, i + 1) = -4;
    A(i, i + 2) =  1;
  end
  A(n-1,n-3) =   16/17;
  A(n-1,n-2) =  -60/17;
  A(n-1,n-1) =   72/17;
  A(n-1,n)   =  -28/17;
  A(n,n-3)   =  -12/17;
  A(n,n-2)   =   96/17;
  A(n,n-1)   = -156/17;
  A(n,n)     =   72/17;
endfunction