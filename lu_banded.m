function [L U pembagian perkalian] = lu_banded(A, p, q)

  [n, n] = size(A);

  L = eye(n);
  
  pembagian = 0;
  perkalian = 0;
  
  for k=1:n-1                       # O(n-1)

    # loop lower band
    for i=k+1 : min(k+q, n)         # O(q)

      # get multiplier
      L(i, k) = A(i, k) / A(k, k);
      pembagian++;

      # loop upper band
      for j=k : min(k+p, n)         # O(p)
        A(i, j) = A(i, j) - A(k, j) * L(i, k);
        perkalian++;

      endfor
    endfor
  endfor
  U = A

endfunction